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
    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        ServerStopAllSoundByHeli;
}

function CancelCampFor(Controller C)
{
    //return;    
}

function bool FireWeaponAt(Actor A)
{
    // End:0x16
    if(A == none)
    {
        A = Enemy;
    }
    // End:0x34
    if((A == none) || Focus != A)
    {
        return false;
    }
    Target = A;
    wBotVehicle(Pawn).RangedAttack(Target);
    return false;
    //return;    
}

function string Vector2String(Vector V)
{
    return ((((("[x=" $ string(V.X)) $ ", y=") $ string(V.Y)) $ ", z=") $ string(V.Z)) $ "]";
    //return;    
}

function string Rotator2String(Rotator R)
{
    return ((((("[y=" $ string(R.Yaw)) $ ", p=") $ string(R.Pitch)) $ ", r=") $ string(R.Roll)) $ "]";
    //return;    
}

function IncY(Canvas C, out float YL, out float YPos)
{
    YPos += YL;
    C.SetPos(0.0000000, YPos);
    //return;    
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
    // End:0x2F0
    if(bAttacking)
    {
        C.DrawText("    AttackPhase=" $ string(AttackPhase));
        IncY(C, YL, YPos);
        C.DrawText("    AttackElapsed=" $ string(Level.TimeSeconds - AttackStartTime));
        IncY(C, YL, YPos);
        // End:0x2F0
        if(Enemy != none)
        {
            C.DrawText("    dot with Enemy=" $ string(GetDot(Enemy)));
            IncY(C, YL, YPos);
            C.DrawText("    DotAG with Enemy=" $ string(GetDotAgainstGround(Enemy)));
            IncY(C, YL, YPos);
        }
    }
    C.DrawText("    Destination=" $ (Vector2String(Destination)), false);
    IncY(C, YL, YPos);
    //return;    
}

function Possess(Pawn aPawn)
{
    super(Controller).Possess(aPawn);
    Pawn.SetMovementPhysics();
    RotationRate = Pawn.RotationRate;
    //return;    
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    super(Controller).NotifyKilled(Killer, Killed, KilledPawn);
    //return;    
}

function wHelicopter GetHeli()
{
    return wHelicopter(Pawn);
    //return;    
}

simulated function int GetTeamNum()
{
    // End:0x56
    if(Caller != none)
    {
        // End:0x43
        if(Caller.IsA('wAlienController'))
        {
            // End:0x43
            if(wHelicopter(Pawn) != none)
            {
                return wHelicopter(Pawn).TeamIndex;
            }
        }
        return Caller.GetTeamNum();        
    }
    else
    {
        // End:0x7A
        if(wHelicopter(Pawn) != none)
        {
            return wHelicopter(Pawn).TeamIndex;
        }
    }
    return 255;
    //return;    
}

function GameHasEnded()
{
    super(Controller).GameHasEnded();
    //return;    
}

function PlayerReplicationInfo GetPRI()
{
    return Caller.PlayerReplicationInfo;
    //return;    
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    local Rotator R;
    local int minError, maxError, Phase;

    Phase = AttackPhase;
    // End:0x2A
    if(Phase == -1)
    {
        Phase = CONFIG_AttackTime.Length - 2;
    }
    minError = CONFIG_AttackAimMinError[Phase];
    maxError = CONFIG_AttackAimMaxError[Phase];
    // End:0x8F
    if(CONFIG_AttackSlot[Phase] == 1)
    {
        R = Rotator(FocalPoint - Pawn.Weapon.ThirdPersonActor.Location);        
    }
    else
    {
        R = Rotation;
    }
    R.Pitch += (GetSignedRandom(minError, maxError));
    R.Yaw += (GetSignedRandom(minError, maxError));
    R.Roll += (GetSignedRandom(minError, maxError));
    return R;
    //return;    
}

function int GetSignedRandom(int Min, int Max)
{
    return ((Rand(2) * 2) - 1) * (Min + Rand(Max - Min));
    //return;    
}

function int Degree2Unreal(float Angle)
{
    return int((Angle / 360.0000000) * float(65535));
    //return;    
}

function NavigationPoint GetNextFlyingPathNode()
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:

    // End:0x98 [Loop If]
    if(N != none)
    {
        // End:0x81
        if((N.IsA('FlyingPathNode') && FlyingPathNode(N).iPathPoint == GetHeli().iCurrentPoint) && FlyingPathNode(N).RegenLoc == RegenLoc)
        {
            return N;
        }
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x14;
    }
    return none;
    //return;    
}

function ProgressFlyingPathNode()
{
    GetHeli().iCurrentPoint++;
    //return;    
}

function Vector GetMomentousRandomDest()
{
    local Vector vec;

    vec = Normal((Normal(Pawn.Velocity) * CONFIG_AttackMoveMomentumFactor) + Normal(MakeVector(FRand() - 0.5000000, FRand() - 0.5000000, (FRand() * 0.2500000) - 0.1250000)));
    return Pawn.Location + ((vec * GetHeli().HelicopterDestinationFactor) * CONFIG_AttackOneMoveFactor);
    //return;    
}

function float GetDot(Pawn P)
{
    local Vector LookDir, TargetDir;
    local float DP;

    LookDir = Normal(Vector(Pawn.Rotation));
    TargetDir = Normal(P.Location - Pawn.Location);
    DP = LookDir Dot TargetDir;
    return DP;
    //return;    
}

function float GetDotAgainstGround(Pawn P)
{
    local Vector LookDir, TargetDir;
    local float DP;

    LookDir = P.Location - Pawn.Location;
    LookDir.Z = 0.0000000;
    LookDir = Normal(LookDir);
    TargetDir = Normal(P.Location - Pawn.Location);
    DP = LookDir Dot TargetDir;
    return DP;
    //return;    
}

function Pawn GetEnemy()
{
    local wPawn P, returnee;
    local float dpg, DP, bestScore, Score;

    bestScore = -9999.0000000;
    // End:0x165
    foreach DynamicActors(Class'WGame_Decompressed.wPawn', P)
    {
        // End:0x164
        if((P.GetTeamNum() != (GetTeamNum())) && P.Health > 0)
        {
            dpg = GetDotAgainstGround(P);
            // End:0x164
            if(Abs(dpg) >= CONFIG_MinAngleAgainstGround)
            {
                DP = GetDot(P);
                Score = Abs(dpg) + Abs(DP);
                // End:0xAD
                if(DP < float(0))
                {
                    Score -= 0.1500000;
                }
                // End:0xD0
                if(!Pawn.LineOfSightTo(P))
                {
                    Score -= float(1);
                }
                Log((((((("[wHelicopterController::GetEnemy] name=" $ P.OwnerName) @ "dpg=") $ string(dpg)) @ "dp=") $ string(DP)) @ "score=") $ string(Score));
                // End:0x164
                if(Score > bestScore)
                {
                    bestScore = Score;
                    returnee = P;
                }
            }
        }        
    }    
    // End:0x1B0
    if(returnee != none)
    {
        Log("[wHelicopterController::GetEnemy] returnee=" $ returnee.OwnerName);
    }
    return returnee;
    //return;    
}

function Accelerate(float dt)
{
    Pawn.AirSpeed += (CONFIG_Acceleration * dt);
    Pawn.AirSpeed = FMin(Pawn.AirSpeed, CONFIG_MaxSpeed);
    //return;    
}

function Decelerate(float dt)
{
    Pawn.AirSpeed += (CONFIG_Deceleration * dt);
    Pawn.AirSpeed = FMax(CONFIG_MinSpeed, Pawn.AirSpeed);
    //return;    
}

function PlayMoveSound()
{
    ServerStopAllSoundByHeli(Pawn);
    // End:0x66
    if(float(Pawn.Health) > (float(Pawn.default.Health) * 0.3000000))
    {
        Pawn.FmodPlaySound(wBotVehicle(Pawn).MoveSound, 10, 1.0000000,, false, true);        
    }
    else
    {
        Pawn.FmodPlaySound(wBotVehicle(Pawn).MoveDamagedSound, 10, 1.0000000,, false, true);
    }
    //return;    
}

function PlayStaySound()
{
    ServerStopAllSoundByHeli(Pawn);
    // End:0x66
    if(float(Pawn.Health) > (float(Pawn.default.Health) * 0.3000000))
    {
        Pawn.FmodPlaySound(wBotVehicle(Pawn).StaySound, 10, 1.0000000,, false, true);        
    }
    else
    {
        Pawn.FmodPlaySound(wBotVehicle(Pawn).MoveDamagedSound, 10, 1.0000000,, false, true);
    }
    //return;    
}

function ServerStopAllSoundByHeli(Pawn P)
{
    local Controller C;
    local PlayerController PC;

    C = Level.ControllerList;
    J0x14:

    // End:0x65 [Loop If]
    if(C != none)
    {
        PC = PlayerController(C);
        // End:0x4E
        if(PC != none)
        {
            PC.ClientStopLoopSoundByActor(P);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function Disappear()
{
    Pawn.bHidden = true;
    GotoState('Dying');
    //return;    
}

function ClientOnEndWaitingForStart()
{
    GotoState('BirdFollowingPath');
    //return;    
}

function PawnDied(Pawn P)
{
    // End:0x16
    if(P == Pawn)
    {
        GotoState('Dying');
    }
    //return;    
}

function OnEndRound()
{
    super(Controller).OnEndRound();
    Disappear();
    //return;    
}

state RotatationDemo
{Begin:

    Pawn.bRotateToDesired = true;
    Pawn.bForceDesiredRotation = true;
    Pawn.DesiredRotationThreshold_Yaw = 10.0000000;
    Pawn.DesiredRotationThreshold_Pitch = 10.0000000;
    Pawn.DesiredRotationThreshold_Roll = 10.0000000;
    Pawn.DesiredRotation = Pawn.Rotation;
    Pawn.DesiredRotation.Yaw = 10000;
    Pawn.SetDesiredRotationCheck(true, false, false);
    FinishRotation();
    Sleep(2.0000000);
    Pawn.DesiredRotation.Pitch = 10000;
    Pawn.SetDesiredRotationCheck(true, true, false);
    FinishRotation();
    Sleep(2.0000000);
    Pawn.DesiredRotation.Yaw = 20000;
    Pawn.SetDesiredRotationCheck(true, true, false);
    FinishRotation();
    Sleep(2.0000000);
    Pawn.DesiredRotation.Pitch = 1000;
    Pawn.SetDesiredRotationCheck(true, true, false);
    FinishRotation();
    Sleep(2.0000000);
    Pawn.DesiredRotation.Yaw = 50000;
    Pawn.SetDesiredRotationCheck(true, true, false);
    FinishRotation();
    Sleep(2.0000000);
    Pawn.DesiredRotation.Pitch = 3000;
    Pawn.SetDesiredRotationCheck(true, true, false);
    FinishRotation();
    Sleep(2.0000000);
    GotoState('Dying');
    stop;        
}

auto state Setup
{Begin:

    // End:0x2E
    if(Pawn != none)
    {
        Pawn.AirSpeed = 0.0000000;
        bFirstFollowPath = true;
        GotoState('BirdFollowingPath');
    }
    stop;        
}

state BirdFollowingPath
{
    function BeginState()
    {
        // End:0x2B
        if(int(Role) == int(ROLE_Authority))
        {
            wHelicopter(Pawn).BehaviorState = 1;
            PlayMoveSound();
        }
        //return;        
    }

    function float EstimateDistanceIfDecelerate(int N)
    {
        local int lp1;
        local float dist;

        lp1 = 0;
        J0x07:

        // End:0x4C [Loop If]
        if(lp1 < N)
        {
            dist += FMax(CONFIG_MinSpeed, Pawn.AirSpeed - (CONFIG_Deceleration * float(lp1)));
            lp1++;
            // [Loop Continue]
            goto J0x07;
        }
        return dist - CONFIG_MaxSpeed;
        //return;        
    }

    function Tick(float dt)
    {
        local float leftoverDist;

        leftoverDist = VSize(CurrentPathNode.Location - Pawn.Location);
        // End:0x46
        if(leftoverDist < (EstimateDistanceIfDecelerate(3)))
        {
            Decelerate(dt);            
        }
        else
        {
            Accelerate(dt);
            FocalPoint = GetFocalPoint2(CurrentPathNode.Location);
        }
        //return;        
    }

    function Vector GetFocalPoint2(Vector V)
    {
        local float S;
        local Vector Dir, ndir, Result;
        local Rotator R;

        Dir = V - Pawn.Location;
        Dir.Z = 0.0000000;
        ndir = Normal(Dir);
        S = Pawn.AirSpeed / CONFIG_MaxSpeed;
        R = Rotator(ndir);
        R.Pitch = int((S * S) * float(Degree2Unreal(CONFIG_MoveMaxSlope)));
        Result = Pawn.Location + ((Vector(R) * VSize(Dir)) * float(3));
        return Result;
        //return;        
    }

    function Vector GetFocalPoint(Vector V)
    {
        local Vector Dir, R;

        Dir = V - Pawn.Location;
        R = Pawn.Location + (Dir * float(3));
        return R;
        //return;        
    }
Begin:

    CurrentPathNode = GetNextFlyingPathNode();
    ProgressFlyingPathNode();
    MoveTo(CurrentPathNode.Location,,, GetFocalPoint(CurrentPathNode.Location));
    // End:0x4E
    if((GetNextFlyingPathNode()) == none)
    {
        Disappear();        
    }
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

        // End:0x7D
        if(bAttacking)
        {
            elapsed = Level.TimeSeconds - AttackStartTime;
            lp1 = 0;
            J0x2B:

            // End:0x7D [Loop If]
            if(lp1 < (CONFIG_AttackTime.Length - 1))
            {
                // End:0x73
                if((CONFIG_AttackTime[lp1] <= elapsed) && elapsed <= CONFIG_AttackTime[lp1 + 1])
                {
                    return lp1;
                }
                lp1++;
                // [Loop Continue]
                goto J0x2B;
            }
        }
        return -1;
        //return;        
    }

    function ChangeWeapon()
    {
        local wWeapon Wpn;

        AttackPhase = GetAttackPhase();
        // End:0xB7
        if(AttackPhase != LastAttackPhase)
        {
            LastAttackPhase = AttackPhase;
            Pawn.SwitchWeapon(byte(CONFIG_AttackSlot[AttackPhase]));
            // End:0x6D
            if(Pawn.PendingWeapon == none)
            {
                Wpn = Pawn.Weapon;                
            }
            else
            {
                Wpn = Pawn.PendingWeapon;
            }
            AttackPendingWeaponID = Wpn.BaseParams.iWeaponID;
            Wpn.GetAmmoCount(TempAmmoMax, AttackPendingWeaponAmmo);
        }
        //return;        
    }

    function BeginState()
    {
        // End:0x5F
        if(!bAttacking)
        {
            bAttacking = true;
            AttackStartTime = Level.TimeSeconds;
            // End:0x53
            if(int(Role) == int(ROLE_Authority))
            {
                wHelicopter(Pawn).BehaviorState = 2;
                PlayStaySound();
            }
            Enemy = GetEnemy();
        }
        //return;        
    }

    function EndState()
    {
        // End:0x29
        if(!bAttacking)
        {
            wHelicopter(Pawn).Weapon.ClientStopFire(0);
        }
        //return;        
    }

    function CheckFire(float DeltaTime)
    {
        // End:0x117
        if((Enemy != none) && wHelicopter(Pawn).Weapon != none)
        {
            FocalPoint = Enemy.Location;
            FireCheckInterval -= DeltaTime;
            // End:0x117
            if(FireCheckInterval < float(0))
            {
                // End:0xEE
                if((GetDot(Enemy)) >= CONFIG_FireStartAngleInDot)
                {
                    // End:0xEB
                    if(wHelicopter(Pawn).Weapon.BaseParams.iWeaponID == AttackPendingWeaponID)
                    {
                        wHelicopter(Pawn).Weapon.GetAmmoCount(TempAmmoMax, TempAmmo);
                        // End:0xEB
                        if(TempAmmo == AttackPendingWeaponAmmo)
                        {
                            wHelicopter(Pawn).Weapon.ClientStartFire(0);
                        }
                    }                    
                }
                else
                {
                    wHelicopter(Pawn).Weapon.ClientStopFire(0);
                }
                FireCheckInterval = 0.0900000;
            }
        }
        //return;        
    }

    function Tick(float DeltaTime)
    {
        // End:0x2D
        if((Enemy != none) && Enemy.Health <= 0)
        {
            Enemy = GetEnemy();
        }
        CheckFire(DeltaTime);
        Decelerate(DeltaTime);
        ChangeWeapon();
        //return;        
    }
Begin:

    // End:0x23
    if(Enemy != none)
    {
        MoveTo(Destination,,, Enemy.Location);
    }
    // End:0x8B
    if((Enemy == none) || (Level.TimeSeconds - AttackStartTime) > CONFIG_AttackTime[CONFIG_AttackTime.Length - 1])
    {
        bAttacking = false;
        LastAttackPhase = -1;
        Destination = GetNextFlyingPathNode().Location;
        GotoState('BirdFollowingPath');        
    }
    else
    {
        Destination = GetMomentousRandomDest();
        GotoState('BirdAttacking');
    }
    stop;        
}

state Dying
{
    function BeginState()
    {
        Pawn.Died(none, Class'Engine.DamageType', vect(0.0000000, 0.0000000, 0.0000000));
        //return;        
    }

    function EndState()
    {
        //return;        
    }
    stop;    
}

state WaitingForStart
{    stop;    
}

defaultproperties
{
    LastAttackPhase=-1
    CONFIG_MinSpeed=60.0000000
    CONFIG_MaxSpeed=1300.0000000
    CONFIG_Acceleration=500.0000000
    CONFIG_Deceleration=-200.0000000
    CONFIG_AttackSlot[0]=1
    CONFIG_AttackSlot[1]=2
    CONFIG_AttackSlot[2]=3
    CONFIG_AttackSlot[3]=2
    CONFIG_AttackSlot[4]=3
    CONFIG_AttackSlot[5]=1
    CONFIG_AttackSlot[6]=-1
    CONFIG_AttackTime[0]=0.0000000
    CONFIG_AttackTime[1]=3.5000000
    CONFIG_AttackTime[2]=4.0999999
    CONFIG_AttackTime[3]=4.6999998
    CONFIG_AttackTime[4]=5.3000002
    CONFIG_AttackTime[5]=5.9000001
    CONFIG_AttackTime[6]=7.3000002
    CONFIG_AttackAimMinError[0]=0
    CONFIG_AttackAimMinError[1]=0
    CONFIG_AttackAimMinError[2]=0
    CONFIG_AttackAimMinError[3]=0
    CONFIG_AttackAimMinError[4]=0
    CONFIG_AttackAimMinError[5]=0
    CONFIG_AttackAimMinError[6]=-1
    CONFIG_AttackAimMaxError[0]=600
    CONFIG_AttackAimMaxError[1]=0
    CONFIG_AttackAimMaxError[2]=0
    CONFIG_AttackAimMaxError[3]=0
    CONFIG_AttackAimMaxError[4]=0
    CONFIG_AttackAimMaxError[5]=300
    CONFIG_AttackAimMaxError[6]=-1
    CONFIG_AttackMoveMomentumFactor=2.0000000
    CONFIG_AttackOneMoveFactor=2.0000000
    CONFIG_FireStartAngleInDot=0.8500000
    CONFIG_MinAngleAgainstGround=0.7000000
    CONFIG_MoveMaxSlope=-20.0000000
    CONFIG_SoundVolume=1.0000000
    CONFIG_SoundRadius=4000.0000000
    FovAngle=85.0000000
    bCanOpenDoors=false
}