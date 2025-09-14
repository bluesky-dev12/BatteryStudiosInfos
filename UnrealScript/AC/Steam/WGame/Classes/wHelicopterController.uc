/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wHelicopterController.uc
 * Package Imports:
 *	WGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:26
 *	Functions:30
 *	States:6
 *
 *******************************************************************************/
class wHelicopterController extends ScriptedController;

var Actor CurrentPathNode;
var bool bFirstFollowPath;
var bool bAttacking;
var float AttackStartTime;
var int AttackPhase;
var int LastAttackPhase;
var float FireCheckInterval;
var int AttackPendingWeaponID;
var float AttackPendingWeaponAmmo;
var float TempAmmo;
var float TempAmmoMax;
var float CONFIG_MinSpeed;
var float CONFIG_MaxSpeed;
var float CONFIG_Acceleration;
var float CONFIG_Deceleration;
var array<int> CONFIG_AttackSlot;
var array<float> CONFIG_AttackTime;
var array<int> CONFIG_AttackAimMinError;
var array<int> CONFIG_AttackAimMaxError;
var float CONFIG_AttackMoveMomentumFactor;
var float CONFIG_AttackOneMoveFactor;
var float CONFIG_FireStartAngleInDot;
var float CONFIG_MinAngleAgainstGround;
var float CONFIG_MoveMaxSlope;
var float CONFIG_SoundVolume;
var float CONFIG_SoundRadius;

replication
{
    // Pos:0x00
    reliable if(Role < 4)
        ServerStopAllSoundByHeliHK;

}

function CancelCampFor(Controller C);
function bool FireWeaponAt(Actor A)
{
    // End:0x16
    if(A == none)
    {
        A = Enemy;
    }
    // End:0x34
    if(A == none || Focus != A)
    {
        return false;
    }
    Target = A;
    wBotVehicle(Pawn).RangedAttack(Target);
    return false;
}

function string Vector2String(Vector V)
{
    return "[x=" $ string(V.X) $ ", y=" $ string(V.Y) $ ", z=" $ string(V.Z) $ "]";
}

function string Rotator2String(Rotator R)
{
    return "[y=" $ string(R.Yaw) $ ", p=" $ string(R.Pitch) $ ", r=" $ string(R.Roll) $ "]";
}

function IncY(Canvas C, out float YL, out float YPos)
{
    YPos += YL;
    C.SetPos(0.0, YPos);
}

function DisplayDebug(Canvas C, out float YL, out float YPos)
{
    super(AIController).DisplayDebug(C, YL, YPos);
    C.SetDrawColor(0, 0, byte(255));
    C.DrawText("[wHelicopterController]", false);
    IncY(C, YL, YPos);
    C.DrawText("    state=" $ string(GetStateName()), false);
    IncY(C, YL, YPos);
    C.DrawText("    iCurrentPoint=" $ string(GetHeli().iCurrentPoint), false);
    IncY(C, YL, YPos);
    C.DrawText("    Speed=" $ string(GetHeli().AirSpeed), false);
    IncY(C, YL, YPos);
    C.DrawText("    dot with Caller=" $ string(GetDot(Caller.Pawn)));
    IncY(C, YL, YPos);
    C.DrawText("    DotAG with Caller=" $ string(GetDotAgainstGround(Caller.Pawn)));
    IncY(C, YL, YPos);
    // End:0x2f0
    if(bAttacking)
    {
        C.DrawText("    AttackPhase=" $ string(AttackPhase));
        IncY(C, YL, YPos);
        C.DrawText("    AttackElapsed=" $ string(Level.TimeSeconds - AttackStartTime));
        IncY(C, YL, YPos);
        // End:0x2f0
        if(Enemy != none)
        {
            C.DrawText("    dot with Enemy=" $ string(GetDot(Enemy)));
            IncY(C, YL, YPos);
            C.DrawText("    DotAG with Enemy=" $ string(GetDotAgainstGround(Enemy)));
            IncY(C, YL, YPos);
        }
    }
    C.DrawText("    Destination=" $ Vector2String(Destination), false);
    IncY(C, YL, YPos);
}

function Possess(Pawn aPawn)
{
    super(Controller).Possess(aPawn);
    Pawn.SetMovementPhysics();
    RotationRate = Pawn.RotationRate;
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    super(Controller).NotifyKilled(Killer, Killed, KilledPawn);
}

function wHelicopter GetHeli()
{
    return wHelicopter(Pawn);
}

simulated function int GetTeamNum()
{
    // End:0x1e
    if(Caller != none)
    {
        return Caller.GetTeamNum();
    }
    // End:0x8e
    else
    {
        // End:0x8e
        if(wHelicopter(Pawn) != none)
        {
            Log("[wHelicopterController::GetTeamNum()] TeamIndex :" $ string(wHelicopter(Pawn).TeamIndex));
            return wHelicopter(Pawn).TeamIndex;
        }
    }
    return 255;
}

function GameHasEnded()
{
    super(Controller).GameHasEnded();
}

function PlayerReplicationInfo GetPRI()
{
    return Caller.PlayerReplicationInfo;
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    local Rotator R;
    local int minError, maxError, Phase;

    Phase = AttackPhase;
    // End:0x2a
    if(Phase == -1)
    {
        Phase = CONFIG_AttackTime.Length - 2;
    }
    minError = CONFIG_AttackAimMinError[Phase];
    maxError = CONFIG_AttackAimMaxError[Phase];
    // End:0x8f
    if(CONFIG_AttackSlot[Phase] == 1)
    {
        R = rotator(FocalPoint - Pawn.Weapon.ThirdPersonActor.Location);
    }
    // End:0x9a
    else
    {
        R = Rotation;
    }
    R.Pitch += GetSignedRandom(minError, maxError);
    R.Yaw += GetSignedRandom(minError, maxError);
    R.Roll += GetSignedRandom(minError, maxError);
    return R;
}

function int GetSignedRandom(int Min, int Max)
{
    return Rand(2) * 2 - 1 * Min + Rand(Max - Min);
}

function int Degree2Unreal(float Angle)
{
    return int(Angle / 360.0 * float(65535));
}

function NavigationPoint GetNextFlyingPathNode()
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:
    // End:0x98 [While If]
    if(N != none)
    {
        // End:0x81
        if(N.IsA('FlyingPathNode') && FlyingPathNode(N).iPathPoint == GetHeli().iCurrentPoint && FlyingPathNode(N).RegenLoc == RegenLoc)
        {
            return N;
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return none;
}

function ProgressFlyingPathNode()
{
    ++ GetHeli().iCurrentPoint;
}

function Vector GetMomentousRandomDest()
{
    local Vector vec;

    vec = Normal(Normal(Pawn.Velocity) * CONFIG_AttackMoveMomentumFactor + Normal(MakeVector(FRand() - 0.50, FRand() - 0.50, FRand() * 0.250 - 0.1250)));
    return Pawn.Location + vec * GetHeli().HelicopterDestinationFactor * CONFIG_AttackOneMoveFactor;
}

function float GetDot(Pawn P)
{
    local Vector LookDir, TargetDir;
    local float DP;

    LookDir = Normal(vector(Pawn.Rotation));
    TargetDir = Normal(P.Location - Pawn.Location);
    DP = LookDir Dot TargetDir;
    return DP;
}

function float GetDotAgainstGround(Pawn P)
{
    local Vector LookDir, TargetDir;
    local float DP;

    LookDir = P.Location - Pawn.Location;
    LookDir.Z = 0.0;
    LookDir = Normal(LookDir);
    TargetDir = Normal(P.Location - Pawn.Location);
    DP = LookDir Dot TargetDir;
    return DP;
}

function Pawn GetEnemy()
{
    local wPawn P, returnee;
    local float dpg, DP, bestScore, Score;

    bestScore = -9999.0;
    // End:0x165
    foreach DynamicActors(class'wPawn', P)
    {
        // End:0x164
        if(P.GetTeamNum() != GetTeamNum() && P.Health > 0)
        {
            dpg = GetDotAgainstGround(P);
            // End:0x164
            if(Abs(dpg) >= CONFIG_MinAngleAgainstGround)
            {
                DP = GetDot(P);
                Score = Abs(dpg) + Abs(DP);
                // End:0xad
                if(DP < float(0))
                {
                    Score -= 0.150;
                }
                // End:0xd0
                if(!Pawn.LineOfSightTo(P))
                {
                    Score -= float(1);
                }
                Log("[wHelicopterController::GetEnemy] name=" $ P.OwnerName @ "dpg=" $ string(dpg) @ "dp=" $ string(DP) @ "score=" $ string(Score));
                // End:0x164
                if(Score > bestScore)
                {
                    bestScore = Score;
                    returnee = P;
                }
            }
        }                
    }
    Log("[wHelicopterController::GetEnemy] returnee=" $ returnee.OwnerName);
    return returnee;
}

function Accelerate(float dt)
{
    Pawn.AirSpeed += CONFIG_Acceleration * dt;
    Pawn.AirSpeed = FMin(Pawn.AirSpeed, CONFIG_MaxSpeed);
}

function Decelerate(float dt)
{
    Pawn.AirSpeed += CONFIG_Deceleration * dt;
    Pawn.AirSpeed = FMax(CONFIG_MinSpeed, Pawn.AirSpeed);
}

function PlayMoveSound()
{
    ServerStopAllSoundByHeliHK(Pawn);
    // End:0x69
    if(float(Pawn.Health) > float(Pawn.default.Health) * 0.30)
    {
        Pawn.PlaySound(wBotVehicle(Pawn).MoveSound, 10, CONFIG_SoundVolume,, CONFIG_SoundRadius,, false, true);
    }
    // End:0x98
    else
    {
        Pawn.PlaySound(wBotVehicle(Pawn).MoveDamagedSound, 10, CONFIG_SoundVolume,, CONFIG_SoundRadius,, false, true);
    }
}

function PlayStaySound()
{
    ServerStopAllSoundByHeliHK(Pawn);
    // End:0x69
    if(float(Pawn.Health) > float(Pawn.default.Health) * 0.30)
    {
        Pawn.PlaySound(wBotVehicle(Pawn).StaySound, 10, CONFIG_SoundVolume,, CONFIG_SoundRadius,, false, true);
    }
    // End:0x98
    else
    {
        Pawn.PlaySound(wBotVehicle(Pawn).MoveDamagedSound, 10, CONFIG_SoundVolume,, CONFIG_SoundRadius,, false, true);
    }
}

function ServerStopAllSoundByHeliHK(Pawn P)
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:
    // End:0x65 [While If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x4e
        if(PC != none)
        {
            PC.ClientStopLoopSoundByActor(P);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function Disappear()
{
    Pawn.bHidden = true;
    GotoState('Dying');
}

function ClientOnEndWaitingForStart()
{
    GotoState('BirdFollowingPath');
}

function PawnDied(Pawn P)
{
    // End:0x16
    if(P == Pawn)
    {
        GotoState('Dying');
    }
}

function OnEndRound()
{
    super(Actor).OnEndRound();
    Disappear();
}

state RotatationDemo
{

Begin:
    Pawn.bRotateToDesired = true;
    Pawn.bForceDesiredRotation = true;
    Pawn.DesiredRotationThreshold_Yaw = 10.0;
    Pawn.DesiredRotationThreshold_Pitch = 10.0;
    Pawn.DesiredRotationThreshold_Roll = 10.0;
    Pawn.DesiredRotation = Pawn.Rotation;
    Pawn.DesiredRotation.Yaw = 10000;
    Pawn.SetDesiredRotationCheck(true, false, false);
    FinishRotation();
    Sleep(2.0);
    Pawn.DesiredRotation.Pitch = 10000;
    Pawn.SetDesiredRotationCheck(true, true, false);
    FinishRotation();
    Sleep(2.0);
    Pawn.DesiredRotation.Yaw = 20000;
    Pawn.SetDesiredRotationCheck(true, true, false);
    FinishRotation();
    Sleep(2.0);
    Pawn.DesiredRotation.Pitch = 1000;
    Pawn.SetDesiredRotationCheck(true, true, false);
    FinishRotation();
    Sleep(2.0);
    Pawn.DesiredRotation.Yaw = 50000;
    Pawn.SetDesiredRotationCheck(true, true, false);
    FinishRotation();
    Sleep(2.0);
    Pawn.DesiredRotation.Pitch = 3000;
    Pawn.SetDesiredRotationCheck(true, true, false);
    FinishRotation();
    Sleep(2.0);
    GotoState('Dying');
}

auto state Setup
{

Begin:
    // End:0x2e
    if(Pawn != none)
    {
        Pawn.AirSpeed = 0.0;
        bFirstFollowPath = true;
        GotoState('BirdFollowingPath');
    }
}

state BirdFollowingPath
{
    function BeginState()
    {
        // End:0x2b
        if(Role == 4)
        {
            wHelicopter(Pawn).BehaviorState = 1;
            PlayMoveSound();
        }
    }

    function float EstimateDistanceIfDecelerate(int N)
    {
        local int lp1;
        local float dist;

        lp1 = 0;
        J0x07:
        // End:0x4c [While If]
        if(lp1 < N)
        {
            dist += FMax(CONFIG_MinSpeed, Pawn.AirSpeed - CONFIG_Deceleration * float(lp1));
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
        return dist - CONFIG_MaxSpeed;
    }

    function Tick(float dt)
    {
        local float leftoverDist;

        leftoverDist = VSize(CurrentPathNode.Location - Pawn.Location);
        // End:0x46
        if(leftoverDist < EstimateDistanceIfDecelerate(3))
        {
            Decelerate(dt);
        }
        // End:0x6b
        else
        {
            Accelerate(dt);
            FocalPoint = GetFocalPoint2(CurrentPathNode.Location);
        }
    }

    function Vector GetFocalPoint2(Vector V)
    {
        local float S;
        local Vector Dir, ndir, Result;
        local Rotator R;

        Dir = V - Pawn.Location;
        Dir.Z = 0.0;
        ndir = Normal(Dir);
        S = Pawn.AirSpeed / CONFIG_MaxSpeed;
        R = rotator(ndir);
        R.Pitch = int(S * S * float(Degree2Unreal(CONFIG_MoveMaxSlope)));
        Result = Pawn.Location + vector(R) * VSize(Dir) * float(3);
        return Result;
    }

    function Vector GetFocalPoint(Vector V)
    {
        local Vector Dir, R;

        Dir = V - Pawn.Location;
        R = Pawn.Location + Dir * float(3);
        return R;
    }

Begin:
    CurrentPathNode = GetNextFlyingPathNode();
    ProgressFlyingPathNode();
    MoveTo(CurrentPathNode.Location,,, GetFocalPoint(CurrentPathNode.Location));
    // End:0x4e
    if(GetNextFlyingPathNode() == none)
    {
        Disappear();
    }
    // End:0x61
    else
    {
        Destination = GetMomentousRandomDest();
        GotoState('BirdAttacking');
    }
    stop;
}

state BirdAttacking
{
    function int GetAttackPhase()
    {
        local int lp1;
        local float elapsed;

        // End:0x7d
        if(bAttacking)
        {
            elapsed = Level.TimeSeconds - AttackStartTime;
            lp1 = 0;
            J0x2b:
            // End:0x7d [While If]
            if(lp1 < CONFIG_AttackTime.Length - 1)
            {
                // End:0x73
                if(CONFIG_AttackTime[lp1] <= elapsed && elapsed <= CONFIG_AttackTime[lp1 + 1])
                {
                    return lp1;
                }
                ++ lp1;
                // This is an implied JumpToken; Continue!
                goto J0x2b;
            }
        }
        return -1;
    }

    function ChangeWeapon()
    {
        local wWeapon Wpn;

        AttackPhase = GetAttackPhase();
        // End:0xb7
        if(AttackPhase != LastAttackPhase)
        {
            LastAttackPhase = AttackPhase;
            Pawn.SwitchWeapon(byte(CONFIG_AttackSlot[AttackPhase]));
            // End:0x6d
            if(Pawn.PendingWeapon == none)
            {
                Wpn = Pawn.Weapon;
            }
            // End:0x81
            else
            {
                Wpn = Pawn.PendingWeapon;
            }
            AttackPendingWeaponID = Wpn.BaseParams.iWeaponID;
            Wpn.GetAmmoCount(TempAmmoMax, AttackPendingWeaponAmmo);
        }
    }

    function BeginState()
    {
        // End:0x5f
        if(!bAttacking)
        {
            bAttacking = true;
            AttackStartTime = Level.TimeSeconds;
            // End:0x53
            if(Role == 4)
            {
                wHelicopter(Pawn).BehaviorState = 2;
                PlayStaySound();
            }
            Enemy = GetEnemy();
        }
    }

    function EndState()
    {
        // End:0x29
        if(!bAttacking)
        {
            wHelicopter(Pawn).Weapon.ClientStopFire(0);
        }
    }

    function CheckFire(float DeltaTime)
    {
        // End:0xfc
        if(Enemy != none)
        {
            FocalPoint = Enemy.Location;
            FireCheckInterval -= DeltaTime;
            // End:0xfc
            if(FireCheckInterval < float(0))
            {
                // End:0xd3
                if(GetDot(Enemy) >= CONFIG_FireStartAngleInDot)
                {
                    // End:0xd0
                    if(wHelicopter(Pawn).Weapon.BaseParams.iWeaponID == AttackPendingWeaponID)
                    {
                        wHelicopter(Pawn).Weapon.GetAmmoCount(TempAmmoMax, TempAmmo);
                        // End:0xd0
                        if(TempAmmo == AttackPendingWeaponAmmo)
                        {
                            wHelicopter(Pawn).Weapon.ClientStartFire(0);
                        }
                    }
                }
                // End:0xf1
                else
                {
                    wHelicopter(Pawn).Weapon.ClientStopFire(0);
                }
                FireCheckInterval = 0.090;
            }
        }
    }

    function Tick(float DeltaTime)
    {
        // End:0x20
        if(Enemy.Health <= 0)
        {
            Enemy = GetEnemy();
        }
        CheckFire(DeltaTime);
        Decelerate(DeltaTime);
        ChangeWeapon();
    }

Begin:
    // End:0x23
    if(Enemy != none)
    {
        MoveTo(Destination,,, Enemy.Location);
    }
    // End:0x8b
    if(Enemy == none || Level.TimeSeconds - AttackStartTime > CONFIG_AttackTime[CONFIG_AttackTime.Length - 1])
    {
        bAttacking = false;
        LastAttackPhase = -1;
        Destination = GetNextFlyingPathNode().Location;
        GotoState('BirdFollowingPath');
    }
    // End:0x9e
    else
    {
        Destination = GetMomentousRandomDest();
        GotoState('BirdAttacking');
    }
}

state Dying
{
    function BeginState()
    {
        Pawn.Died(none, class'DamageType', vect(0.0, 0.0, 0.0));
    }

    function EndState();

}

state WaitingForStart
{

}

defaultproperties
{
    LastAttackPhase=-1
    CONFIG_MinSpeed=60.0
    CONFIG_MaxSpeed=1300.0
    CONFIG_Acceleration=500.0
    CONFIG_Deceleration=-200.0
    CONFIG_AttackSlot=// Object reference not set to an instance of an object.
    
    CONFIG_AttackTime=// Object reference not set to an instance of an object.
    
    CONFIG_AttackAimMinError=// Object reference not set to an instance of an object.
    
    CONFIG_AttackAimMaxError=// Object reference not set to an instance of an object.
    
    CONFIG_AttackMoveMomentumFactor=2.0
    CONFIG_AttackOneMoveFactor=2.0
    CONFIG_FireStartAngleInDot=0.850
    CONFIG_MinAngleAgainstGround=0.70
    CONFIG_MoveMaxSlope=-20.0
    CONFIG_SoundVolume=1.0
    CONFIG_SoundRadius=4000.0
    FovAngle=85.0
    bCanOpenDoors=true
}