/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBotVehicleController.uc
 * Package Imports:
 *	WGame
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:5
 *	Properties:33
 *	Functions:72
 *	States:15
 *
 *******************************************************************************/
class wBotVehicleController extends ScriptedController;

const MAXSTAKEOUTDIST = 2000;
const ENEMYLOCATIONFUZZ = 1200;
const TACTICALHEIGHTADVANTAGE = 320;
const MINSTRAFEDIST = 200;
const MINVIEWDIST = 200;

var bool bCanFire;
var bool bStrafeDir;
var bool bLeadTarget;
var bool bChangeDir;
var bool bEnemyIsVisible;
var bool bMustCharge;
var bool bJustLanded;
var bool bRecommendFastMove;
var bool bHasFired;
var bool bForcedDirection;
var float AcquireTime;
var float LoseEnemyCheckTime;
var float StartTacticalTime;
var Vector HidingSpot;
var float ChallengeTime;
var float Accuracy;
var float StrafingAbility;
var float CombatStyle;
var float ReactionTime;
var string GoalString;
var string SoakString;
var int ChoosingAttackLevel;
var float ChooseAttackTime;
var int ChooseAttackCounter;
var float EnemyVisibilityTime;
var Pawn VisibleEnemy;
var Pawn OldEnemy;
var float StopStartTime;
var float LastRespawnTime;
var float FailedHuntTime;
var Pawn FailedHuntEnemy;
var int NumRandomJumps;
var int iAttackerTeam;

function PostBeginPlay()
{
    super(Controller).PostBeginPlay();
    SetCombatTimer();
    // End:0x34
    if(UnrealMPGameInfo(Level.Game).bSoaking)
    {
        bSoaking = true;
    }
}

function FearThisSpot(AvoidMarker aSpot)
{
    // End:0x23
    if(Skill > float(1) + 4.50 * FRand())
    {
        super(Controller).FearThisSpot(aSpot);
    }
}

function SetCombatTimer()
{
    SetTimer(1.20 - 0.090 * FMin(10.0, Skill + ReactionTime), true);
}

function WaitForMover(Mover M)
{
    super(AIController).WaitForMover(M);
    StopStartTime = Level.TimeSeconds;
}

function TimedFireWeaponAtEnemy()
{
    // End:0x24
    if(Enemy == none || FireWeaponAt(Enemy))
    {
        SetCombatTimer();
    }
    // End:0x2d
    else
    {
        SetTimer(0.10, true);
    }
}

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

function bool CanAttack(Actor Other)
{
    return wBotVehicle(Pawn).CanAttack(Other);
}

function StopFiring()
{
    wBotVehicle(Pawn).StopFiring();
    bCanFire = false;
    bFire = 0;
    bAltFire = 0;
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string S;

    super(AIController).DisplayDebug(Canvas, YL, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    Canvas.DrawText("     [wBotVehicleController] " $ GoalString, false);
    YPos += float(2) * YL;
    Canvas.SetPos(4.0, YPos);
    // End:0x113
    if(Enemy != none)
    {
        Canvas.DrawText("Enemy Dist " $ string(VSize(Enemy.Location - Pawn.Location)) $ " Acquired " $ string(bEnemyAcquired));
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
    }
    Canvas.DrawText("Weapons: " $ S, false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    Canvas.DrawText("PERSONALITY: CombatStyle " $ string(CombatStyle) $ " Strafing " $ string(StrafingAbility));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

function bool FindNewEnemy()
{
    local Pawn BestEnemy;
    local bool bSeeNew, bSeeBest;
    local float BestDist, newdist;
    local Controller C;

    // End:0x1d
    if(Level.Game.bGameEnded)
    {
        return false;
    }
    C = Level.ControllerList;
    J0x31:
    // End:0x199 [While If]
    if(C != none)
    {
        // End:0x182
        if(Caller != C && C.bIsPlayer && C.Pawn != none)
        {
            // End:0xcc
            if(BestEnemy == none)
            {
                BestEnemy = C.Pawn;
                BestDist = VSize(BestEnemy.Location - Pawn.Location);
                bSeeBest = CanSee(BestEnemy);
            }
            // End:0x182
            else
            {
                newdist = VSize(C.Pawn.Location - Pawn.Location);
                // End:0x182
                if(!bSeeBest || newdist < BestDist)
                {
                    bSeeNew = CanSee(C.Pawn);
                    // End:0x182
                    if(bSeeNew || !bSeeBest && newdist < BestDist)
                    {
                        BestEnemy = C.Pawn;
                        BestDist = newdist;
                        bSeeBest = bSeeNew;
                    }
                }
            }
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    // End:0x1aa
    if(BestEnemy == Enemy)
    {
        return false;
    }
    // End:0x1ca
    if(BestEnemy != none)
    {
        ChangeEnemy(BestEnemy, CanSee(BestEnemy));
        return true;
    }
    return false;
}

function ChangeEnemy(Pawn NewEnemy, bool bCanSeeNewEnemy)
{
    OldEnemy = Enemy;
    Enemy = NewEnemy;
    EnemyChanged(bCanSeeNewEnemy);
}

function bool SetEnemy(Pawn NewEnemy, optional bool bHateMonster)
{
    local float enemyDist;
    local bool bNewMonsterEnemy;

    // End:0x4a
    if(NewEnemy == none || NewEnemy.Health <= 0 || NewEnemy.Controller == none || NewEnemy == Enemy)
    {
        return false;
    }
    // End:0x64
    if(NewEnemy.Controller == Caller)
    {
        return false;
    }
    bNewMonsterEnemy = bHateMonster && Level.Game.NumPlayers < 4 && !wBotVehicle(Pawn).SameSpeciesAs(NewEnemy) && !NewEnemy.Controller.bIsPlayer;
    // End:0xfc
    if(!NewEnemy.Controller.bIsPlayer && !bNewMonsterEnemy)
    {
        return false;
    }
    // End:0x141
    if(bNewMonsterEnemy && LineOfSightTo(NewEnemy) || Enemy == none || !EnemyVisible())
    {
        ChangeEnemy(NewEnemy, CanSee(NewEnemy));
        return true;
    }
    // End:0x150
    if(!CanSee(NewEnemy))
    {
        return false;
    }
    // End:0x18c
    if(!bHateMonster && wBotVehicle(Enemy) != none && NewEnemy.Controller.bIsPlayer)
    {
        return false;
    }
    enemyDist = VSize(Enemy.Location - Pawn.Location);
    // End:0x1cc
    if(enemyDist < Pawn.MeleeRange)
    {
        return false;
    }
    // End:0x212
    if(enemyDist > 1.70 * VSize(NewEnemy.Location - Pawn.Location))
    {
        ChangeEnemy(NewEnemy, CanSee(NewEnemy));
        return true;
    }
    return false;
}

function HearNoise(float Loudness, Actor NoiseMaker)
{
    // End:0x47
    if(ChooseAttackCounter < 2 || ChooseAttackTime != Level.TimeSeconds && SetEnemy(NoiseMaker.Instigator))
    {
        WhatToDoNext(2);
    }
}

event SeePlayer(Pawn SeenPlayer)
{
    // End:0x36
    if(SeenPlayer.GetTeamNum() == GetTeamNum() || SeenPlayer.Controller == Caller)
    {
        return;
    }
    // End:0x74
    if(ChooseAttackCounter < 2 || ChooseAttackTime != Level.TimeSeconds && SetEnemy(SeenPlayer))
    {
        WhatToDoNext(3);
    }
    // End:0xaa
    if(Enemy == SeenPlayer)
    {
        VisibleEnemy = Enemy;
        EnemyVisibilityTime = Level.TimeSeconds;
        bEnemyIsVisible = true;
    }
}

function bool ClearShot(Vector TargetLoc, bool bImmediateFire)
{
    local bool bSeeTarget;

    // End:0x25
    if(VSize(Enemy.Location - TargetLoc) > float(2000))
    {
        return false;
    }
    bSeeTarget = FastTrace(TargetLoc, Pawn.Location + Pawn.EyeHeight * vect(0.0, 0.0, 1.0));
    // End:0xe9
    if(!bImmediateFire && !bSeeTarget && Pawn.bIsCrouched)
    {
        bSeeTarget = FastTrace(TargetLoc, Pawn.Location + Pawn.default.EyeHeight + Pawn.default.CollisionHeight - Pawn.CollisionHeight * vect(0.0, 0.0, 1.0));
    }
    // End:0x130
    if(!bSeeTarget || !FastTrace(TargetLoc, Enemy.Location + Enemy.BaseEyeHeight * vect(0.0, 0.0, 1.0)))
    {
    }
    return false;
    // End:0x1bf
    if(wBotVehicle(Pawn).SplashDamage() && VSize(Pawn.Location - TargetLoc) < wBotVehicle(Pawn).GetDamageRadius() || !FastTrace(TargetLoc + vect(0.0, 0.0, 0.90) * Enemy.CollisionHeight, Pawn.Location))
    {
        StopFiring();
        return false;
    }
    return true;
}

function CheckIfShouldCrouch(Vector StartPosition, Vector TargetPosition, float Probability)
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation, X, Y, Z, projStart;

    // End:0x78
    if(!Pawn.bCanCrouch || !Pawn.bIsCrouched && FRand() > Probability || Skill < float(3) * FRand() || wBotVehicle(Pawn).RecommendSplashDamage())
    {
        Pawn.bWantsToCrouch = false;
        return;
    }
    GetAxes(Rotation, X, Y, Z);
    projStart = wBotVehicle(Pawn).GetFireStart(X, Y, Z);
    projStart = projStart + StartPosition - Pawn.Location;
    projStart.Z = projStart.Z - 1.80 * Pawn.CollisionHeight - Pawn.CrouchHeight;
    HitActor = Trace(HitLocation, HitNormal, TargetPosition, projStart, false);
    // End:0x151
    if(HitActor == none)
    {
        Pawn.bWantsToCrouch = true;
        return;
    }
    projStart.Z = projStart.Z + 1.80 * Pawn.default.CollisionHeight - Pawn.CrouchHeight;
    HitActor = Trace(HitLocation, HitNormal, TargetPosition, projStart, false);
    // End:0x1c9
    if(HitActor == none)
    {
        Pawn.bWantsToCrouch = false;
        return;
    }
    Pawn.bWantsToCrouch = true;
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x27
    if(Other == Pawn || Pawn.Health <= 0)
    {
        return;
    }
    SetEnemy(EventInstigator, true);
}

function SetEnemyInfo(bool bNewEnemyVisible)
{
    AcquireTime = Level.TimeSeconds;
    // End:0x64
    if(bNewEnemyVisible)
    {
        LastSeenTime = Level.TimeSeconds;
        LastSeenPos = Enemy.Location;
        LastSeeingPos = Pawn.Location;
        bEnemyInfoValid = true;
    }
    // End:0x77
    else
    {
        LastSeenTime = -1000.0;
        bEnemyInfoValid = false;
    }
}

function EnemyChanged(bool bNewEnemyVisible)
{
    bEnemyAcquired = false;
    SetEnemyInfo(bNewEnemyVisible);
    wBotVehicle(Pawn).PlayChallengeSound();
}

function bool StrafeFromDamage(float Damage, class<DamageType> DamageType, bool bFindDest);
function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
{
    local Vector jumpDir;

    // End:0x5e
    if(NewVolume.bWaterVolume)
    {
        // End:0x34
        if(!Pawn.bCanSwim)
        {
            MoveTimer = -1.0;
        }
        // End:0x5b
        else
        {
            // End:0x5b
            if(Pawn.Physics != 3)
            {
                Pawn.SetPhysics(3);
            }
        }
    }
    // End:0x141
    else
    {
        // End:0x141
        if(Pawn.Physics == 3)
        {
            // End:0x9a
            if(Pawn.bCanFly)
            {
                Pawn.SetPhysics(4);
            }
            // End:0x141
            else
            {
                Pawn.SetPhysics(2);
                // End:0x141
                if(Pawn.bCanWalk && Abs(Pawn.Acceleration.X) + Abs(Pawn.Acceleration.Y) > float(0) && Destination.Z >= Pawn.Location.Z && Pawn.CheckWaterJump(jumpDir))
                {
                    Pawn.JumpOutOfWater(jumpDir);
                }
            }
        }
    }
    return false;
}

event NotifyMissedJump()
{
    // End:0x20
    if(Pawn.bCanFly)
    {
        Pawn.SetPhysics(4);
    }
}

function Possess(Pawn aPawn)
{
    super(Controller).Possess(aPawn);
    InitializeSkill(DeathMatch(Level.Game).AdjustedDifficulty);
    Pawn.MaxFallSpeed = 1.10 * Pawn.default.MaxFallSpeed;
    Pawn.SetMovementPhysics();
    // End:0x87
    if(Pawn.Physics == 1)
    {
        Pawn.SetPhysics(2);
    }
    WhatToDoNext(1);
    Enable('NotifyBump');
}

function InitializeSkill(float InSkill)
{
    Skill = FClamp(InSkill, 0.0, 7.0);
    ResetSkill();
}

function ResetSkill()
{
    local float AdjustedYaw;

    bLeadTarget = Skill >= float(4);
    SetCombatTimer();
    SetPeripheralVision();
    // End:0x46
    if(Skill + ReactionTime > float(7))
    {
        RotationRate.Yaw = 90000;
    }
    // End:0xb4
    else
    {
        // End:0x89
        if(Skill + ReactionTime >= float(4))
        {
            RotationRate.Yaw = int(float(20000) + float(7000) * Skill + ReactionTime);
        }
        // End:0xb4
        else
        {
            RotationRate.Yaw = int(float(30000) + float(4000) * Skill + ReactionTime);
        }
    }
    AdjustedYaw = 0.750 + 0.050 * ReactionTime * float(RotationRate.Yaw);
    AcquisitionYawRate = int(AdjustedYaw);
    SetMaxDesiredSpeed();
}

function SetMaxDesiredSpeed()
{
    // End:0x52
    if(Pawn != none)
    {
        // End:0x30
        if(Skill > float(3))
        {
            Pawn.MaxDesiredSpeed = 1.0;
        }
        // End:0x52
        else
        {
            Pawn.MaxDesiredSpeed = 0.60 + 0.10 * Skill;
        }
    }
}

function SetPeripheralVision()
{
    // End:0x0d
    if(Pawn == none)
    {
        return;
    }
    // End:0x32
    if(Skill < float(2))
    {
        Pawn.PeripheralVision = 0.70;
    }
    // End:0x79
    else
    {
        // End:0x57
        if(Skill > float(5))
        {
            Pawn.PeripheralVision = 0.0;
        }
        // End:0x79
        else
        {
            Pawn.PeripheralVision = 1.0 - 0.20 * Skill;
        }
    }
    Pawn.SightRadius = Pawn.default.SightRadius;
}

function WhatToDoNext(byte CallingByte)
{
    // End:0x76
    if(ChoosingAttackLevel > 0)
    {
        Log("CHOOSEATTACKAGAIN in state " $ string(GetStateName()) $ " enemy " $ GetEnemyName() $ " old enemy " $ GetOldEnemyName() $ " CALLING byte " $ string(CallingByte));
    }
    // End:0x110
    if(ChooseAttackTime == Level.TimeSeconds)
    {
        ++ ChooseAttackCounter;
        // End:0x10d
        if(ChooseAttackCounter > 3)
        {
            Log("CHOOSEATTACKSERIAL in state " $ string(GetStateName()) $ " enemy " $ GetEnemyName() $ " old enemy " $ GetOldEnemyName() $ " CALLING byte " $ string(CallingByte));
        }
    }
    // End:0x12b
    else
    {
        ChooseAttackTime = Level.TimeSeconds;
        ChooseAttackCounter = 0;
    }
    // End:0x17d
    if(wBotVehicle(Pawn).bTryToWalk && Pawn.Physics == 4 && ChoosingAttackLevel == 0 && ChooseAttackCounter == 0)
    {
        TryToWalk();
    }
    ++ ChoosingAttackLevel;
    // End:0x197
    if(CallingByte == 1)
    {
        ExecuteWhatToDoNext();
    }
    -- ChoosingAttackLevel;
}

function TryToWalk()
{
    local Vector HitLocation, HitNormal, Extent;
    local Actor HitActor;

    // End:0x1d
    if(Pawn.PhysicsVolume.bWaterVolume)
    {
        return;
    }
    Extent = Pawn.GetCollisionExtent();
    HitActor = Trace(HitLocation, HitNormal, Pawn.Location - vect(0.0, 0.0, 100.0), Pawn.Location, false, Extent);
    // End:0xb9
    if(HitActor != none && HitActor.bWorldGeometry && HitNormal.Z > 0.70)
    {
        Pawn.SetPhysics(2);
    }
}

function string GetOldEnemyName()
{
    // End:0x15
    if(OldEnemy == none)
    {
        return "NONE";
    }
    // End:0x25
    else
    {
        return OldEnemy.GetHumanReadableName();
    }
}

function string GetEnemyName()
{
    // End:0x15
    if(Enemy == none)
    {
        return "NONE";
    }
    // End:0x25
    else
    {
        return Enemy.GetHumanReadableName();
    }
}

function ExecuteWhatToDoNext()
{
    GetNextPathForMoveTarget();
    GotoState('PathMove');
}

function bool DoWaitForLanding()
{
    GotoState('WaitingForLanding');
    return true;
}

function bool EnemyVisible()
{
    // End:0x30
    if(EnemyVisibilityTime == Level.TimeSeconds && VisibleEnemy == Enemy)
    {
        return bEnemyIsVisible;
    }
    VisibleEnemy = Enemy;
    EnemyVisibilityTime = Level.TimeSeconds;
    bEnemyIsVisible = LineOfSightTo(Enemy);
    return bEnemyIsVisible;
}

function DoRangedAttackOn(Actor A)
{
    Target = A;
    GotoState('RangedAttack');
}

event SoakStop(string problem)
{
    local UnrealPlayer PC;

    Log(problem);
    SoakString = problem;
    GoalString = SoakString @ GoalString;
    // End:0x4c
    foreach DynamicActors(class'UnrealPlayer', PC)
    {
        PC.SoakPause(Pawn);
        // End:0x4c
        break;                
    }
}

function bool FindRoamDest()
{
    local Actor BestPath;

    // End:0x139
    if(Pawn.FindAnchorFailedTime == Level.TimeSeconds)
    {
        GoalString = "No anchor " $ string(Level.TimeSeconds);
        // End:0x137
        if(Pawn.LastValidAnchorTime > float(5))
        {
            // End:0x84
            if(bSoaking)
            {
                SoakStop("NO PATH AVAILABLE!!!");
            }
            // End:0x137
            else
            {
                // End:0xc8
                if(NumRandomJumps > 4)
                {
                    Pawn.Health = 0;
                    Pawn.Died(self, class'Suicided', Pawn.Location);
                    return true;
                }
                // End:0x137
                else
                {
                    ++ NumRandomJumps;
                    // End:0x137
                    if(Physics != 2)
                    {
                        Pawn.SetPhysics(2);
                        Pawn.Velocity = 0.50 * Pawn.GroundSpeed * VRand();
                        Pawn.Velocity.Z = Pawn.JumpZ;
                    }
                }
            }
        }
        return false;
    }
    NumRandomJumps = 0;
    GoalString = "Find roam dest " $ string(Level.TimeSeconds);
    // End:0x20b
    if(RouteGoal == none || Pawn.Anchor == RouteGoal || Pawn.ReachedDestination(RouteGoal))
    {
        RouteGoal = FindRandomDest();
        BestPath = RouteCache[0];
        // End:0x20b
        if(RouteGoal == none)
        {
            // End:0x209
            if(bSoaking && Physics != 2)
            {
                SoakStop("COULDN'T FIND ROAM DESTINATION");
            }
            return false;
        }
    }
    // End:0x225
    if(BestPath == none)
    {
        BestPath = FindPathToward(RouteGoal, false);
    }
    // End:0x244
    if(BestPath != none)
    {
        MoveTarget = BestPath;
        GotoState('Roaming');
        return true;
    }
    // End:0x28b
    if(bSoaking && Physics != 2)
    {
        SoakStop("COULDN'T FIND ROAM PATH TO " $ string(RouteGoal));
    }
    RouteGoal = none;
    return false;
}

function bool TestDirection(Vector Dir, out Vector pick)
{
    local Vector HitLocation, HitNormal, dist;
    local Actor HitActor;

    pick = Dir * float(200) + float(2 * 200) * FRand();
    HitActor = Trace(HitLocation, HitNormal, Pawn.Location + pick + 1.50 * Pawn.CollisionRadius * Dir, Pawn.Location, false);
    // End:0xce
    if(HitActor != none)
    {
        pick = HitLocation + HitNormal - Dir * float(2) * Pawn.CollisionRadius;
        // End:0xcb
        if(!FastTrace(pick, Pawn.Location))
        {
            return false;
        }
    }
    // End:0xe9
    else
    {
        pick = Pawn.Location + pick;
    }
    dist = pick - Pawn.Location;
    // End:0x12d
    if(Pawn.Physics == 1)
    {
        dist.Z = 0.0;
    }
    return VSize(dist) > float(200);
}

function Restart()
{
    super(Controller).Restart();
    ResetSkill();
    GotoState('Roaming', 'DoneRoaming');
}

function CancelCampFor(Controller C);
function bool AdjustAround(Pawn Other)
{
    local float Speed;
    local Vector VelDir, OtherDir, SideDir;

    Speed = VSize(Pawn.Acceleration);
    // End:0x30
    if(Speed < Pawn.GroundSpeed)
    {
        return false;
    }
    VelDir = Pawn.Acceleration / Speed;
    VelDir.Z = 0.0;
    OtherDir = Other.Location - Pawn.Location;
    OtherDir.Z = 0.0;
    OtherDir = Normal(OtherDir);
    // End:0x14d
    if(VelDir Dot OtherDir > 0.80)
    {
        bAdjusting = true;
        SideDir.X = VelDir.Y;
        SideDir.Y = -1.0 * VelDir.X;
        // End:0x10d
        if(SideDir Dot OtherDir > float(0))
        {
            SideDir *= float(-1);
        }
        AdjustLoc = Pawn.Location + 1.50 * Other.CollisionRadius * 0.50 * VelDir + SideDir;
    }
}

event bool NotifyBump(Actor Other)
{
    local Pawn P;

    Disable('NotifyBump');
    P = Pawn(Other);
    // End:0x4b
    if(P == none || P.Controller == none || Enemy == P)
    {
        return false;
    }
    // End:0x63
    if(SetEnemy(P))
    {
        WhatToDoNext(4);
        return false;
    }
    // End:0x74
    if(Enemy == P)
    {
        return false;
    }
    // End:0x98
    if(!AdjustAround(P))
    {
        CancelCampFor(P.Controller);
    }
    return false;
}

function SetFall()
{
    // End:0x22
    if(Pawn.bCanFly)
    {
        Pawn.SetPhysics(4);
        return;
    }
    // End:0x4a
    if(Pawn.bNoJumpAdjust)
    {
        Pawn.bNoJumpAdjust = false;
        return;
    }
    // End:0x99
    else
    {
        Pawn.Velocity = EAdjustJump(Pawn.Velocity.Z, Pawn.GroundSpeed);
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    }
}

function bool NotifyLanded(Vector HitNormal)
{
    local Vector Vel2D;

    // End:0xac
    if(MoveTarget != none)
    {
        Vel2D = Pawn.Velocity;
        Vel2D.Z = 0.0;
        // End:0xac
        if(Vel2D Dot MoveTarget.Location - Pawn.Location < float(0))
        {
            Pawn.Acceleration = vect(0.0, 0.0, 0.0);
            // End:0xa1
            if(NavigationPoint(MoveTarget) != none)
            {
                Pawn.Anchor = NavigationPoint(MoveTarget);
            }
            MoveTimer = -1.0;
        }
    }
    return false;
}

function bool FindBestPathToward(Actor A, bool bCheckedReach, bool bAllowDetour)
{
    // End:0x26
    if(!bCheckedReach && actorReachable(A))
    {
        MoveTarget = A;
    }
    // End:0x35
    else
    {
        MoveTarget = FindPathToward(A, false);
    }
    // End:0x45
    if(MoveTarget != none)
    {
        return true;
    }
    // End:0xc7
    else
    {
        // End:0x80
        if(A == Enemy && A != none)
        {
            FailedHuntTime = Level.TimeSeconds;
            FailedHuntEnemy = Enemy;
        }
        // End:0xc7
        if(bSoaking && Physics != 2)
        {
            SoakStop("COULDN'T FIND BEST PATH TO " $ string(A));
        }
    }
    return false;
}

function bool NeedToTurn(Vector targ)
{
    local Vector LookDir, AimDir;

    LookDir = vector(Pawn.Rotation);
    LookDir.Z = 0.0;
    LookDir = Normal(LookDir);
    AimDir = targ - Pawn.Location;
    AimDir.Z = 0.0;
    AimDir = Normal(AimDir);
    return LookDir Dot AimDir < 0.930;
}

function bool NearWall(float walldist)
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal, ViewSpot, ViewDist, LookDir;

    LookDir = vector(Rotation);
    ViewSpot = Pawn.Location + Pawn.BaseEyeHeight * vect(0.0, 0.0, 1.0);
    ViewDist = LookDir * walldist;
    HitActor = Trace(HitLocation, HitNormal, ViewSpot + ViewDist, ViewSpot, false);
    // End:0x84
    if(HitActor == none)
    {
        return false;
    }
    ViewDist = Normal(HitNormal Cross vect(0.0, 0.0, 1.0)) * walldist;
    // End:0xc1
    if(FRand() < 0.50)
    {
        ViewDist *= float(-1);
    }
    Focus = none;
    // End:0xfc
    if(FastTrace(ViewSpot + ViewDist, ViewSpot))
    {
        FocalPoint = Pawn.Location + ViewDist;
        return true;
    }
    // End:0x130
    if(FastTrace(ViewSpot - ViewDist, ViewSpot))
    {
        FocalPoint = Pawn.Location - ViewDist;
        return true;
    }
    FocalPoint = Pawn.Location - LookDir * float(300);
    return true;
}

function bool CheckFutureSight(float DeltaTime)
{
    local Vector FutureLoc;

    // End:0x16
    if(Target == none)
    {
        Target = Enemy;
    }
    // End:0x23
    if(Target == none)
    {
        return false;
    }
    // End:0x5a
    if(Pawn.Acceleration == vect(0.0, 0.0, 0.0))
    {
        FutureLoc = Pawn.Location;
    }
    // End:0x97
    else
    {
        FutureLoc = Pawn.Location + Pawn.GroundSpeed * Normal(Pawn.Acceleration) * DeltaTime;
    }
    // End:0xd0
    if(Pawn.Base != none)
    {
        FutureLoc += Pawn.Base.Velocity * DeltaTime;
    }
    // End:0x108
    if(!FastTrace(FutureLoc, Pawn.Location) && Pawn.Physics != 2)
    {
        return false;
    }
    // End:0x13a
    if(FastTrace(Target.Location + Target.Velocity * DeltaTime, FutureLoc))
    {
        return true;
    }
    return false;
}

function float AdjustAimError(float AimError, float TargetDist, bool bDefendMelee, bool bInstantProj, bool bLeadTargetNow)
{
    // End:0x3a
    if(Pawn(Target) != none && Pawn(Target).Visibility < 2)
    {
        AimError *= 2.50;
    }
    AimError = AimError * FMin(5.0, 12.0 - float(11) * Normal(Target.Location - Pawn.Location) Dot Normal(Target.Location + 1.20 * Target.Velocity - Pawn.Location + Pawn.Velocity));
    // End:0xd9
    if(bDefendMelee)
    {
        AimError *= 0.50;
    }
    // End:0x105
    if(Target.Velocity == vect(0.0, 0.0, 0.0))
    {
        AimError *= 0.60;
    }
    // End:0x198
    if(Stopped() && Level.TimeSeconds > StopStartTime)
    {
        // End:0x149
        if(Skill + Accuracy > float(4))
        {
            AimError *= 0.90;
        }
        AimError *= FClamp(2.0 - 0.080 * FMin(Skill, 7.0) - FRand() / Level.TimeSeconds - StopStartTime + 0.40, 0.70, 1.0);
    }
    // End:0x1db
    if(!bDefendMelee)
    {
        AimError *= 3.30 - 0.370 * FClamp(Skill + Accuracy, 0.0, 8.50) + 0.50 * FRand();
    }
    // End:0x22d
    if(Skill < float(7) || FRand() < 0.50 && Level.TimeSeconds - Pawn.LastPainTime < 0.20)
    {
        AimError *= 1.30;
    }
    // End:0x26d
    if(Pawn.Physics == 2 || Target.Physics == 2)
    {
        AimError *= 1.60;
    }
    // End:0x2c1
    if(AcquireTime > Level.TimeSeconds - 0.50 - 0.60 * float(7) - Skill)
    {
        AimError *= 1.50;
        // End:0x2c1
        if(bInstantProj)
        {
            AimError *= 1.50;
        }
    }
    return float(Rand(int(float(2) * AimError))) - AimError;
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    local Rotator FireRotation, TargetLook;
    local float FireDist, TargetDist, projSpeed;
    local Actor HitActor;
    local Vector FireSpot, FireDir, TargetVel, HitLocation, HitNormal;

    local int realYaw;
    local bool bDefendMelee, bClean, bLeadTargetNow;

    // End:0x29
    if(FiredAmmunition.ProjectileClass != none)
    {
        projSpeed = FiredAmmunition.ProjectileClass.default.Speed;
    }
    // End:0x50
    if(Target == none)
    {
        Target = Enemy;
        // End:0x50
        if(Target == none)
        {
            return Rotation;
        }
    }
    FireSpot = Target.Location;
    TargetDist = VSize(Target.Location - Pawn.Location);
    // End:0xfa
    if(Pawn(Target) == none)
    {
        // End:0xc5
        if(!FiredAmmunition.bTossed)
        {
            return rotator(Target.Location - projStart);
        }
        // End:0xfa
        else
        {
            FireDir = AdjustToss(projSpeed, projStart, Target.Location, true);
            SetRotation(rotator(FireDir));
            return Rotation;
        }
    }
    bLeadTargetNow = FiredAmmunition.bLeadTarget && bLeadTarget;
    bDefendMelee = Target == Enemy && DefendMelee(TargetDist);
    AimError = int(AdjustAimError(float(AimError), TargetDist, bDefendMelee, FiredAmmunition.bInstantHit, bLeadTargetNow));
    // End:0x3cc
    if(bLeadTargetNow)
    {
        TargetVel = Target.Velocity;
        // End:0x253
        if(Target.Physics == 2)
        {
            // End:0x237
            if(Target.PhysicsVolume.Gravity.Z <= Target.PhysicsVolume.default.Gravity.Z)
            {
                TargetVel.Z = FMin(TargetVel.Z + FMax(-400.0, Target.PhysicsVolume.Gravity.Z * FMin(1.0, TargetDist / projSpeed)), 0.0);
            }
            // End:0x253
            else
            {
                TargetVel.Z = FMin(0.0, TargetVel.Z);
            }
        }
        FireSpot += FMin(1.0, 0.70 + 0.60 * FRand()) * TargetVel * TargetDist / projSpeed;
        FireSpot.Z = FMin(Target.Location.Z, FireSpot.Z);
        // End:0x368
        if(Target.Physics != 2 && FRand() < 0.550 && VSize(FireSpot - projStart) > float(1000))
        {
            TargetLook = Target.Rotation;
            // End:0x32c
            if(Target.Physics == 1)
            {
                TargetLook.Pitch = 0;
            }
            bClean = vector(TargetLook) Dot Normal(Target.Velocity) >= 0.710 && FastTrace(FireSpot, projStart);
        }
        // End:0x37c
        else
        {
            bClean = FastTrace(FireSpot, projStart);
        }
        // End:0x3cc
        if(!bClean)
        {
            // End:0x3aa
            if(FRand() < 0.30)
            {
                FireSpot = Target.Location;
            }
            // End:0x3cc
            else
            {
                FireSpot = 0.50 * FireSpot + Target.Location;
            }
        }
    }
    bClean = false;
    // End:0x574
    if(FiredAmmunition.bTrySplash && Pawn(Target) != none && Skill >= float(4) || bDefendMelee && Target.Physics == 2 && Pawn.Location.Z + float(80) >= Target.Location.Z || Pawn.Location.Z + float(19) >= Target.Location.Z && bDefendMelee || Skill > 6.50 * FRand() - 0.50)
    {
        HitActor = Trace(HitLocation, HitNormal, FireSpot - vect(0.0, 0.0, 1.0) * Target.CollisionHeight + float(6), FireSpot, false);
        bClean = HitActor == none;
        // End:0x545
        if(!bClean)
        {
            FireSpot = HitLocation + vect(0.0, 0.0, 3.0);
            bClean = FastTrace(FireSpot, projStart);
        }
        // End:0x574
        else
        {
            bClean = Target.Physics == 2 && FastTrace(FireSpot, projStart);
        }
    }
    // End:0x5b1
    if(!bClean)
    {
        FireSpot.Z = Target.Location.Z;
        bClean = FastTrace(FireSpot, projStart);
    }
    // End:0x63d
    if(FiredAmmunition.bTossed && !bClean && bEnemyInfoValid)
    {
        FireSpot = LastSeenPos;
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x635
        if(HitActor != none)
        {
            bCanFire = false;
            FireSpot += float(2) * Target.CollisionHeight * HitNormal;
        }
        bClean = true;
    }
    // End:0x691
    if(!bClean)
    {
        FireSpot.Z = Target.Location.Z + 0.90 * Target.CollisionHeight;
        bClean = FastTrace(FireSpot, projStart);
    }
    // End:0x7d1
    if(!bClean && Target == Enemy && bEnemyInfoValid)
    {
        FireSpot = LastSeenPos;
        // End:0x706
        if(Pawn.Location.Z >= LastSeenPos.Z)
        {
            FireSpot.Z -= 0.40 * Enemy.CollisionHeight;
        }
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x7d1
        if(HitActor != none)
        {
            FireSpot = LastSeenPos + float(2) * Enemy.CollisionHeight * HitNormal;
            // End:0x7c9
            if(wBotVehicle(Pawn).SplashDamage() && Skill >= float(4))
            {
                HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
                // End:0x7c9
                if(HitActor != none)
                {
                    FireSpot += float(2) * Enemy.CollisionHeight * HitNormal;
                }
            }
            bCanFire = false;
        }
    }
    // End:0x7fe
    if(FiredAmmunition.bTossed)
    {
        FireDir = AdjustToss(projSpeed, projStart, FireSpot, true);
    }
    // End:0x810
    else
    {
        FireDir = FireSpot - projStart;
    }
    FireRotation = rotator(FireDir);
    realYaw = FireRotation.Yaw;
    InstantWarnTarget(Target, FiredAmmunition, vector(FireRotation));
    FireRotation.Yaw = SetFireYaw(FireRotation.Yaw + AimError);
    FireDir = vector(FireRotation);
    FireDist = FMin(VSize(FireSpot - projStart), 400.0);
    FireSpot = projStart + FireDist * FireDir;
    HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
    // End:0x9e6
    if(HitActor != none)
    {
        // End:0x945
        if(HitNormal.Z < 0.70)
        {
            FireRotation.Yaw = SetFireYaw(realYaw - AimError);
            FireDir = vector(FireRotation);
            FireSpot = projStart + FireDist * FireDir;
            HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        }
        // End:0x9e6
        if(HitActor != none)
        {
            FireSpot += HitNormal * float(2) * Target.CollisionHeight;
            // End:0x9c5
            if(Skill >= float(4))
            {
                HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
                // End:0x9c5
                if(HitActor != none)
                {
                    FireSpot += Target.CollisionHeight * HitNormal;
                }
            }
            FireDir = Normal(FireSpot - projStart);
            FireRotation = rotator(FireDir);
        }
    }
    SetRotation(FireRotation);
    return FireRotation;
}

function ReceiveWarning(Pawn shooter, float projSpeed, Vector FireDir)
{
    local float enemyDist, DodgeSkill;
    local Vector X, Y, Z, enemyDir;

    DodgeSkill = Skill + wBotVehicle(Pawn).DodgeSkillAdjust;
    // End:0xc0
    if(Pawn.Health <= 0 || DodgeSkill < float(4) || Enemy == none || !wBotVehicle(Pawn).bCanDodge || Pawn.Physics == 2 || Pawn.Physics == 3 || FRand() > 0.20 * DodgeSkill - 0.40)
    {
        return;
    }
    enemyDist = VSize(shooter.Location - Pawn.Location);
    // End:0x109
    if(enemyDist / projSpeed < 0.110 + 0.150 * FRand())
    {
        return;
    }
    GetAxes(Pawn.Rotation, X, Y, Z);
    enemyDir = shooter.Location - Pawn.Location / enemyDist;
    // End:0x16b
    if(enemyDir Dot X < 0.80)
    {
        return;
    }
    // End:0x19c
    if(FireDir Dot Y > float(0))
    {
        Y *= float(-1);
        TryToDuck(Y, true);
    }
    // End:0x1a8
    else
    {
        TryToDuck(Y, false);
    }
}

function bool TryToDuck(Vector duckDir, bool bReversed)
{
    local Vector HitLocation, HitNormal, Extent;
    local Actor HitActor;
    local bool bSuccess, bDuckLeft;

    // End:0x5c
    if(Pawn.PhysicsVolume.bWaterVolume || Pawn.PhysicsVolume.Gravity.Z > Pawn.PhysicsVolume.default.Gravity.Z)
    {
        return false;
    }
    duckDir.Z = 0.0;
    bDuckLeft = !bReversed;
    Extent = Pawn.GetCollisionExtent();
    HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(240) * duckDir, Pawn.Location, false, Extent);
    bSuccess = HitActor == none || VSize(HitLocation - Pawn.Location) > float(150);
    // End:0x19e
    if(!bSuccess)
    {
        bDuckLeft = !bDuckLeft;
        duckDir *= float(-1);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(240) * duckDir, Pawn.Location, false, Extent);
        bSuccess = HitActor == none || VSize(HitLocation - Pawn.Location) > float(150);
    }
    // End:0x1ab
    if(!bSuccess)
    {
        return false;
    }
    // End:0x1d7
    if(HitActor == none)
    {
        HitLocation = Pawn.Location + float(240) * duckDir;
    }
    HitActor = Trace(HitLocation, HitNormal, HitLocation - 35.0 * vect(0.0, 0.0, 1.0), HitLocation, false, Extent);
    // End:0x21d
    if(HitActor == none)
    {
        return false;
    }
    // End:0x23f
    if(bDuckLeft)
    {
        UnrealPawn(Pawn).CurrentDir = 1;
    }
    // End:0x255
    else
    {
        UnrealPawn(Pawn).CurrentDir = 2;
    }
    UnrealPawn(Pawn).Dodge(UnrealPawn(Pawn).CurrentDir);
    return true;
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    // End:0x11
    if(Killer == self)
    {
        Celebrate();
    }
    // End:0x5b
    if(KilledPawn == Enemy || Killed != none && Killed.bIsPlayer && Enemy == none)
    {
        Enemy = none;
        FindNewEnemy();
    }
}

function Actor FaceMoveTarget()
{
    // End:0x15
    if(MoveTarget != Enemy)
    {
        StopFiring();
    }
    return MoveTarget;
}

function bool ShouldStrafeTo(Actor WayPoint)
{
    local NavigationPoint N;

    // End:0x19
    if(wBotVehicle(Pawn).bAlwaysStrafe)
    {
        return true;
    }
    // End:0x30
    if(Skill + StrafingAbility < float(3))
    {
        return false;
    }
    // End:0x77
    if(WayPoint == Enemy)
    {
        // End:0x58
        if(wBotVehicle(Pawn).PreferMelee())
        {
            return false;
        }
        return Skill + StrafingAbility < float(5) * FRand() - float(1);
    }
    // End:0xf1
    else
    {
        // End:0xf1
        if(Pickup(WayPoint) == none)
        {
            N = NavigationPoint(WayPoint);
            // End:0xb8
            if(N == none || N.bNeverUseStrafing)
            {
                return false;
            }
            // End:0xcf
            if(N.FearCost > 200)
            {
                return true;
            }
            // End:0xf1
            if(N.bAlwaysUseStrafing && FRand() < 0.80)
            {
                return true;
            }
        }
    }
    // End:0x11d
    if(Pawn(WayPoint) != none)
    {
        return Skill + StrafingAbility < float(5) * FRand() - float(1);
    }
    // End:0x13d
    if(Skill + StrafingAbility < float(7) * FRand() - float(1))
    {
        return false;
    }
    // End:0x152
    if(Enemy == none)
    {
        return FRand() < 0.40;
    }
    // End:0x165
    if(EnemyVisible())
    {
        return FRand() < 0.850;
    }
    return FRand() < 0.60;
}

function Actor FaceActor(float StrafingModifier)
{
    local float RelativeDir;

    bRecommendFastMove = false;
    // End:0x41
    if(Enemy == none || Level.TimeSeconds - LastSeenTime > float(6) - StrafingModifier)
    {
        return FaceMoveTarget();
    }
    // End:0x56
    if(MoveTarget == Enemy)
    {
        return Enemy;
    }
    // End:0x82
    if(Level.TimeSeconds - LastSeenTime > float(4) - StrafingModifier)
    {
        return FaceMoveTarget();
    }
    // End:0xa9
    if(Skill > 2.50 && GameObject(MoveTarget) != none)
    {
        return Enemy;
    }
    RelativeDir = Normal(Enemy.Location - Pawn.Location - vect(0.0, 0.0, 1.0) * Enemy.Location.Z - Pawn.Location.Z) Dot Normal(MoveTarget.Location - Pawn.Location - vect(0.0, 0.0, 1.0) * MoveTarget.Location.Z - Pawn.Location.Z);
    // End:0x178
    if(RelativeDir > 0.850)
    {
        return Enemy;
    }
    // End:0x1cb
    if(RelativeDir > 0.30 && Bot(Enemy.Controller) != none && MoveTarget == Enemy.Controller.MoveTarget)
    {
        return Enemy;
    }
    // End:0x1eb
    if(Skill + StrafingAbility < float(2) + FRand())
    {
        return FaceMoveTarget();
    }
    // End:0x23f
    if(RelativeDir < 0.30 || Skill + StrafingAbility < float(5) + StrafingModifier * FRand() || 0.40 * RelativeDir + 0.80 < FRand())
    {
        return FaceMoveTarget();
    }
    return Enemy;
}

event float Desireability(Pickup P)
{
    return -1.0;
}

function damageAttitudeTo(Pawn Other, float Damage)
{
    // End:0x3c
    if(Pawn.Health > 0 && Damage > float(0) && SetEnemy(Other, true))
    {
        WhatToDoNext(5);
    }
}

function wHelicopter GetHeli()
{
    return wHelicopter(Pawn);
}

function GetNextPathForMoveTarget()
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:
    // End:0xed [While If]
    if(N != none)
    {
        // End:0xd6
        if(N.IsA('FlyingPathNode') && FlyingPathNode(N).iPathPoint == GetHeli().iCurrentPoint)
        {
            MoveTarget = N;
            Log("STATE[ PathMove ] - Find GetNextPath : " $ string(GetHeli().iCurrentPoint) $ " -> " $ string(GetHeli().iCurrentPoint + 1));
            ++ GetHeli().iCurrentPoint;
            return;
        }
        N = N.nextNavigationPoint;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    MoveTarget = none;
}

simulated function int GetTeamNum()
{
    // End:0x2c
    if(Caller != none)
    {
        return Caller.PlayerReplicationInfo.Team.TeamIndex;
    }
    return 255;
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    // End:0x1c
    if(instigatedBy.GetTeamNum() == GetTeamNum())
    {
        return;
    }
    super(Controller).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
}

function bool Formation()
{
    return false;
}

function Celebrate()
{
    Pawn.PlayVictoryAnimation();
}

function DoStakeOut()
{
    GotoState('StakeOut');
}

function DoCharge()
{
    // End:0x3a
    if(Enemy.PhysicsVolume.bWaterVolume)
    {
        // End:0x37
        if(!Pawn.bCanSwim)
        {
            DoTacticalMove();
            return;
        }
    }
    // End:0x6c
    else
    {
        // End:0x6c
        if(!Pawn.bCanFly && !Pawn.bCanWalk)
        {
            DoTacticalMove();
            return;
        }
    }
    GotoState('Charging');
}

function DoTacticalMove()
{
    GotoState('TacticalMove');
}

function bool DefendMelee(float dist)
{
    return Enemy.Weapon != none && Enemy.Weapon.bMeleeWeapon && dist < float(1000);
}

function bool IsStrafing()
{
    return false;
}

function bool IsHunting()
{
    return false;
}

function bool Stopped()
{
    return bPreparingMove;
}

function GameHasEnded();

state PathMove
{
    function Timer();
    function BeginState()
    {
        Pawn.LoopAnim('Idle');
        Pawn.StopAllSoundByActor();
        // End:0x7f
        if(float(Pawn.Health) > float(Pawn.default.Health) * 0.30)
        {
            wBotVehicle(Pawn).PlaySound(wBotVehicle(Pawn).MoveSound, 10, 1.0,,,, false, true);
        }
        // End:0xaf
        else
        {
            wBotVehicle(Pawn).PlaySound(wBotVehicle(Pawn).MoveDamagedSound, 10, 1.0,,,, false, true);
        }
    }

    function EndState();

Begin:
    Pawn.SwitchWeapon(1);
    // End:0x44
    if(MoveTarget != none && Pawn.Health > 0)
    {
        MoveToward(MoveTarget);
        GotoState('WaitForHunting');
    }
    // End:0x5b
    else
    {
        Pawn.GotoState('Dying');
        GotoState('Dying');
    }
    stop;        
}

state WaitForHunting
{
    function BeginState()
    {
        Pawn.LoopAnim('Idle');
        Pawn.SwitchWeapon(1);
        // End:0x81
        if(float(Pawn.Health) > float(Pawn.default.Health) * 0.30)
        {
            wBotVehicle(Pawn).PlaySound(wBotVehicle(Pawn).StaySound, 10, 1.0,,,, false, true);
        }
        // End:0xb1
        else
        {
            wBotVehicle(Pawn).PlaySound(wBotVehicle(Pawn).MoveDamagedSound, 10, 1.0,,,, false, true);
        }
        StopStartTime = Level.TimeSeconds;
        bHasFired = false;
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        // End:0xff
        if(Target == none)
        {
            Target = Enemy;
        }
    }

    function EndState()
    {
        wHelicopter(Pawn).Acceleration = wHelicopter(Pawn).default.Acceleration;
    }

    function bool Stopped()
    {
        return true;
    }

    event SeePlayer(Pawn SeenPlayer)
    {
        // End:0x36
        if(SeenPlayer.GetTeamNum() == GetTeamNum() || SeenPlayer.Controller == Caller)
        {
            return;
        }
        // End:0xa4
        if(SeenPlayer == Enemy)
        {
            VisibleEnemy = Enemy;
            EnemyVisibilityTime = Level.TimeSeconds;
            bEnemyIsVisible = true;
            Target = Enemy;
            // End:0x99
            if(FRand() < 0.50)
            {
                Focus = Enemy;
                FireWeaponAt(Enemy);
            }
            WhatToDoNext(28);
        }
        // End:0xfb
        else
        {
            // End:0xfb
            if(SetEnemy(SeenPlayer))
            {
                // End:0xf3
                if(Enemy == SeenPlayer)
                {
                    Target = Enemy;
                    VisibleEnemy = Enemy;
                    EnemyVisibilityTime = Level.TimeSeconds;
                    bEnemyIsVisible = true;
                }
                WhatToDoNext(29);
            }
        }
    }

    function SetFocus()
    {
        // End:0x17
        if(bEnemyInfoValid)
        {
            FocalPoint = LastSeenPos;
        }
        // End:0x2b
        else
        {
            FocalPoint = Enemy.Location;
        }
    }

    function StartFireWeapons()
    {
        // End:0x0d
        if(Target == none)
        {
            return;
        }
        wHelicopter(Pawn).Weapon.GetFireMode(0).AimError = 170.0;
        wHelicopter(Pawn).Weapon.ClientStartFire(0);
    }

    function StopFireWeapons()
    {
        wHelicopter(Pawn).Weapon.ClientStopFire(0);
    }

    function Timer()
    {
        // End:0x57
        if(Target != none && Target.IsA('Pawn'))
        {
            // End:0x57
            if(Pawn(Target).GetTeamNum() == Caller.GetTeamNum())
            {
                Target = none;
                Enemy = none;
            }
        }
    }

Begin:
    GetNextPathForMoveTarget();
    // End:0xaf
    if(MoveTarget != none)
    {
        Sleep(1.0);
        FinishRotation();
        StartFireWeapons();
        Sleep(3.0);
        StopFireWeapons();
        Sleep(1.0);
        Pawn.SwitchWeapon(2);
        FinishRotation();
        StartFireWeapons();
        Sleep(3.0);
        StopFireWeapons();
        Sleep(1.0);
        Pawn.SwitchWeapon(1);
        FinishRotation();
        StartFireWeapons();
        Sleep(3.0);
        StopFireWeapons();
        Sleep(1.0);
        FinishRotation();
        StartFireWeapons();
        Sleep(3.0);
        StopFireWeapons();
    }
    // End:0xcd
    if(Pawn.Health > 0)
    {
        GotoState('PathMove');
    }
    // End:0xd4
    else
    {
        GotoState('Dying');
    }
    stop;    
}

state Dying
{
    function BeginState();
    function EndState();

}

state NoGoal
{

}

state MoveToGoal
{
    function Timer()
    {
        SetCombatTimer();
        Enable('NotifyBump');
    }

}

state MoveToGoalNoEnemy extends MoveToGoal
{

}

state MoveToGoalWithEnemy extends MoveToGoal
{
    function Timer()
    {
        TimedFireWeaponAtEnemy();
    }

}

state Roaming extends MoveToGoalNoEnemy
{
    function MayFall()
    {
        Pawn.bCanJump = MoveTarget != none && MoveTarget.Physics != 2 || !MoveTarget.IsA('Pickup');
    }

Begin:
    SwitchToBestWeapon();
    WaitForLanding();
    MoveToward(MoveTarget, FaceActor(1.0),, ShouldStrafeTo(MoveTarget));
DoneRoaming:

    WaitForLanding();
    WhatToDoNext(12);
    // End:0x55
    if(bSoaking)
    {
        SoakStop("STUCK IN ROAMING!");
    }
    stop;
}

state Charging extends MoveToGoalWithEnemy
{
    function MayFall()
    {
        // End:0x11
        if(MoveTarget != Enemy)
        {
            return;
        }
        Pawn.bCanJump = actorReachable(Enemy);
        // End:0x48
        if(!Pawn.bCanJump)
        {
            MoveTimer = -1.0;
        }
    }

    function bool TryToDuck(Vector duckDir, bool bReversed)
    {
        // End:0x1e
        if(FRand() < 0.60)
        {
            return global.TryToDuck(duckDir, bReversed);
        }
        // End:0x39
        if(MoveTarget == Enemy)
        {
            return TryStrafe(duckDir);
        }
    }

    function bool StrafeFromDamage(float Damage, class<DamageType> DamageType, bool bFindDest)
    {
        local Vector SideDir;

        // End:0x2e
        if(FRand() * Damage < 0.150 * CombatStyle * float(Pawn.Health))
        {
            return false;
        }
        // End:0x3b
        if(!bFindDest)
        {
            return true;
        }
        SideDir = Normal(Normal(Enemy.Location - Pawn.Location) Cross vect(0.0, 0.0, 1.0));
        // End:0x9d
        if(Pawn.Velocity Dot SideDir > float(0))
        {
            SideDir *= float(-1);
        }
        return TryStrafe(SideDir);
    }

    function bool TryStrafe(Vector SideDir)
    {
        local Vector Extent, HitLocation, HitNormal;
        local Actor HitActor;

        Extent = Pawn.GetCollisionExtent();
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(200) * SideDir, Pawn.Location, false, Extent);
        // End:0xb2
        if(HitActor != none)
        {
            SideDir *= float(-1);
            HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(200) * SideDir, Pawn.Location, false, Extent);
        }
        // End:0xbf
        if(HitActor != none)
        {
            return false;
        }
        // End:0x14a
        if(Pawn.Physics == 1)
        {
            HitActor = Trace(HitLocation, HitNormal, Pawn.Location + float(200) * SideDir - 35.0 * vect(0.0, 0.0, 1.0), Pawn.Location + float(200) * SideDir, false, Extent);
            // End:0x14a
            if(HitActor == none)
            {
                return false;
            }
        }
        Destination = Pawn.Location + float(2 * 200) * SideDir;
        GotoState('TacticalMove', 'DoStrafeMove');
        return true;
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        local float pick;
        local Vector SideDir;
        local bool bWasOnGround;

        super(wBotVehicleController).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        bWasOnGround = Pawn.Physics == 1;
        // End:0x57
        if(Pawn.Health <= 0)
        {
            return;
        }
        // End:0x72
        if(StrafeFromDamage(float(Damage), DamageType, true))
        {
            return;
        }
        // End:0x15b
        else
        {
            // End:0x15b
            if(bWasOnGround && MoveTarget == Enemy && Pawn.Physics == 2)
            {
                pick = 1.0;
                // End:0xc6
                if(bStrafeDir)
                {
                    pick = -1.0;
                }
                SideDir = Normal(Normal(Enemy.Location - Pawn.Location) Cross vect(0.0, 0.0, 1.0));
                SideDir.Z = 0.0;
                Pawn.Velocity += pick * Pawn.GroundSpeed * 0.70 * SideDir;
                // End:0x15b
                if(FRand() < 0.20)
                {
                    bStrafeDir = !bStrafeDir;
                }
            }
        }
    }

    event bool NotifyBump(Actor Other)
    {
        // End:0x1c
        if(Other == Enemy)
        {
            DoRangedAttackOn(Enemy);
            return false;
        }
        return global.NotifyBump(Other);
    }

    function Timer()
    {
        Enable('NotifyBump');
        Target = Enemy;
        TimedFireWeaponAtEnemy();
    }

    function EnemyNotVisible()
    {
        WhatToDoNext(15);
    }

    function EndState()
    {
        // End:0x34
        if(Pawn != none && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
    }

Begin:
    // End:0x3b
    if(Pawn.Physics == 2)
    {
        Focus = Enemy;
        Destination = Enemy.Location;
        WaitForLanding();
    }
    // End:0x4e
    if(Enemy == none)
    {
        WhatToDoNext(16);
    }
WaitForAnim:

    // End:0x73
    if(wBotVehicle(Pawn).bShotAnim)
    {
        Sleep(0.350);
        goto 'WaitForAnim';
    }
    // End:0x8c
    if(!FindBestPathToward(Enemy, false, true))
    {
        GotoState('TacticalMove');
    }
moving:

    MoveToward(MoveTarget, FaceActor(1.0),, ShouldStrafeTo(MoveTarget));
    WhatToDoNext(17);
    // End:0xd6
    if(bSoaking)
    {
        SoakStop("STUCK IN CHARGING!");
    }
}

state TacticalMove
{
    function bool IsStrafing()
    {
        return true;
    }

    function ReceiveWarning(Pawn shooter, float projSpeed, Vector FireDir)
    {
        // End:0x19
        if(bCanFire && FRand() < 0.40)
        {
            return;
        }
        super(Controller).ReceiveWarning(shooter, projSpeed, FireDir);
    }

    function SetFall()
    {
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        Destination = Pawn.Location;
        global.SetFall();
    }

    function bool NotifyHitWall(Vector HitNormal, Actor Wall)
    {
        // End:0x1b
        if(Pawn.Physics == 2)
        {
            return false;
        }
        // End:0x30
        if(Enemy == none)
        {
            WhatToDoNext(18);
            return false;
        }
        // End:0x8c
        if(bChangeDir || FRand() < 0.50 || Enemy.Location - Pawn.Location Dot HitNormal < float(0))
        {
            Focus = Enemy;
            WhatToDoNext(19);
        }
        // End:0xbc
        else
        {
            bChangeDir = true;
            Destination = Pawn.Location - HitNormal * FRand() * float(500);
        }
        return true;
    }

    function Timer()
    {
        Enable('NotifyBump');
        Target = Enemy;
        // End:0x26
        if(Enemy != none)
        {
            TimedFireWeaponAtEnemy();
        }
        // End:0x2c
        else
        {
            SetCombatTimer();
        }
    }

    function EnemyNotVisible()
    {
        StopFiring();
        // End:0x2e
        if(FastTrace(Enemy.Location, LastSeeingPos))
        {
            GotoState('TacticalMove', 'RecoverEnemy');
        }
        // End:0x36
        else
        {
            WhatToDoNext(20);
        }
        Disable('EnemyNotVisible');
    }

    function PawnIsInPain(PhysicsVolume PainVolume)
    {
        Destination = Pawn.Location - float(200) * Normal(Pawn.Velocity);
    }

    function PickDestination()
    {
        local Vector pickdir, enemyDir, enemyPart, Y;
        local float strafeSize;

        // End:0x42
        if(Pawn == none)
        {
            Warn(string(self) $ " Tactical move pick destination with no pawn");
            return;
        }
        bChangeDir = false;
        // End:0xce
        if(Pawn.PhysicsVolume.bWaterVolume && !Pawn.bCanSwim && Pawn.bCanFly)
        {
            Destination = Pawn.Location + float(75) * VRand() + vect(0.0, 0.0, 1.0);
            Destination.Z += float(100);
            return;
        }
        enemyDir = Normal(Enemy.Location - Pawn.Location);
        Y = enemyDir Cross vect(0.0, 0.0, 1.0);
        // End:0x14a
        if(Pawn.Physics == 1)
        {
            Y.Z = 0.0;
            enemyDir.Z = 0.0;
        }
        // End:0x166
        else
        {
            enemyDir.Z = FMax(0.0, enemyDir.Z);
        }
        strafeSize = FClamp(2.0 * FRand() - 0.650, -0.70, 0.70);
        strafeSize = FMax(0.40 * FRand() - 0.20, strafeSize);
        enemyPart = enemyDir * strafeSize;
        // End:0x23c
        if(Pawn.bCanFly)
        {
            // End:0x21e
            if(Pawn.Location.Z - Enemy.Location.Z < float(1000))
            {
                enemyPart = enemyPart + FRand() * vect(0.0, 0.0, 1.0);
            }
            // End:0x23c
            else
            {
                enemyPart = enemyPart - FRand() * vect(0.0, 0.0, 0.70);
            }
        }
        strafeSize = FMax(0.0, 1.0 - Abs(strafeSize));
        pickdir = strafeSize * Y;
        // End:0x280
        if(bStrafeDir)
        {
            pickdir *= float(-1);
        }
        bStrafeDir = !bStrafeDir;
        // End:0x2a7
        if(EngageDirection(enemyPart + pickdir, false))
        {
            return;
        }
        // End:0x2bf
        if(EngageDirection(enemyPart - pickdir, false))
        {
            return;
        }
        bForcedDirection = true;
        StartTacticalTime = Level.TimeSeconds;
        EngageDirection(enemyPart + pickdir, true);
    }

    function bool EngageDirection(Vector StrafeDir, bool bForced)
    {
        local Actor HitActor;
        local Vector HitLocation, collspec, MinDest, HitNormal;

        MinDest = Pawn.Location + float(200) * StrafeDir;
        // End:0x169
        if(!bForced)
        {
            collspec = Pawn.GetCollisionExtent();
            collspec.Z = FMax(6.0, Pawn.CollisionHeight - Pawn.CollisionRadius);
            HitActor = Trace(HitLocation, HitNormal, MinDest, Pawn.Location, false, collspec);
            // End:0xaa
            if(HitActor != none)
            {
                return false;
            }
            // End:0x169
            if(Pawn.Physics == 1)
            {
                collspec.X = FMin(14.0, 0.50 * Pawn.CollisionRadius);
                collspec.Y = collspec.X;
                HitActor = Trace(HitLocation, HitNormal, MinDest - Pawn.CollisionRadius + 35.0 * vect(0.0, 0.0, 1.0), MinDest, false, collspec);
                // End:0x169
                if(HitActor == none)
                {
                    HitNormal = float(-1) * StrafeDir;
                    return false;
                }
            }
        }
        Destination = MinDest + StrafeDir * 0.50 * float(200) + FMin(VSize(Enemy.Location - Pawn.Location), 200.0 * FRand() + FRand());
        return true;
    }

    function BeginState()
    {
        bForcedDirection = false;
        // End:0x38
        if(Skill < float(4))
        {
            Pawn.MaxDesiredSpeed = 0.40 + 0.080 * Skill;
        }
        MinHitWall += 0.150;
        Pawn.bAvoidLedges = true;
        Pawn.bStopAtLedges = true;
        Pawn.bCanJump = false;
        bAdjustFromWalls = false;
    }

    function EndState()
    {
        bAdjustFromWalls = true;
        // End:0x15
        if(Pawn == none)
        {
            return;
        }
        SetMaxDesiredSpeed();
        Pawn.bAvoidLedges = false;
        Pawn.bStopAtLedges = false;
        MinHitWall -= 0.150;
        // End:0x70
        if(Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
    }

TacticalTick:
    Sleep(0.020);
Begin:

    // End:0x43
    if(Pawn.Physics == 2)
    {
        Focus = Enemy;
        Destination = Enemy.Location;
        WaitForLanding();
    }
    PickDestination();
DoMove:

    // End:0x93
    if(!Pawn.bCanStrafe)
    {
        StopFiring();
WaitForAnim:

        // End:0x88
        if(wBotVehicle(Pawn).bShotAnim)
        {
            Sleep(0.50);
            goto 'WaitForAnim';
        }
        MoveTo(Destination);
DoStrafeMove:

    }
    // End:0xa0
    else
    {
        MoveTo(Destination, Enemy);
    }
    // End:0x126
    if(bForcedDirection && Level.TimeSeconds - StartTacticalTime < 0.20)
    {
        // End:0xf2
        if(Skill > float(2) + float(3) * FRand())
        {
            bMustCharge = true;
            WhatToDoNext(51);
        }
        GoalString = "RangedAttack from failed tactical";
        DoRangedAttackOn(Enemy);
    }
    // End:0x18e
    if(Enemy == none || EnemyVisible() || !FastTrace(Enemy.Location, LastSeeingPos) || wBotVehicle(Pawn).PreferMelee() || !Pawn.bCanStrafe)
    {
        goto 'FinishedStrafe';
    }
RecoverEnemy:

    GoalString = "Recover Enemy";
    HidingSpot = Pawn.Location;
    StopFiring();
    Sleep(0.10 + 0.20 * FRand());
    Destination = LastSeeingPos + float(4) * Pawn.CollisionRadius * Normal(LastSeeingPos - Pawn.Location);
    MoveTo(Destination, Enemy);
    // End:0x2ea
    if(FireWeaponAt(Enemy))
    {
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        // End:0x269
        if(wBotVehicle(Pawn).SplashDamage())
        {
            StopFiring();
            Sleep(0.050);
        }
        // End:0x297
        else
        {
            Sleep(0.10 + 0.30 * FRand() + 0.060 * float(7) - FMin(7.0, Skill));
        }
        // End:0x2ea
        if(FRand() > 0.50)
        {
            Enable('EnemyNotVisible');
            Destination = HidingSpot + float(4) * Pawn.CollisionRadius * Normal(HidingSpot - Pawn.Location);
            goto 'DoMove';
        }
    }
FinishedStrafe:

    WhatToDoNext(21);
    // End:0x31a
    if(bSoaking)
    {
        SoakStop("STUCK IN TACTICAL MOVE!");
    }
}

state Hunting extends MoveToGoalWithEnemy
{
    function bool IsHunting()
    {
        return true;
    }

    function MayFall()
    {
        Pawn.bCanJump = MoveTarget == none || MoveTarget.Physics != 2 || !MoveTarget.IsA('Pickup');
    }

    function SeePlayer(Pawn SeenPlayer)
    {
        // End:0x92
        if(SeenPlayer == Enemy)
        {
            // End:0x55
            if(Level.TimeSeconds - ChallengeTime > float(7))
            {
                ChallengeTime = Level.TimeSeconds;
                wBotVehicle(Pawn).PlayChallengeSound();
            }
            VisibleEnemy = Enemy;
            EnemyVisibilityTime = Level.TimeSeconds;
            bEnemyIsVisible = true;
            Focus = Enemy;
            WhatToDoNext(22);
        }
        // End:0x9d
        else
        {
            global.SeePlayer(SeenPlayer);
        }
    }

    function Timer()
    {
        SetCombatTimer();
        StopFiring();
    }

    function PickDestination()
    {
        local Vector nextSpot, ViewSpot, Dir;
        local float posZ;
        local bool bCanSeeLastSeen;

        // End:0x32
        if(Enemy == none || Enemy.Health <= 0)
        {
            Enemy = none;
            WhatToDoNext(23);
            return;
        }
        // End:0x59
        if(Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        // End:0x81
        if(actorReachable(Enemy))
        {
            Destination = Enemy.Location;
            MoveTarget = none;
            return;
        }
        ViewSpot = Pawn.Location + Pawn.BaseEyeHeight * vect(0.0, 0.0, 1.0);
        bCanSeeLastSeen = bEnemyInfoValid && FastTrace(LastSeenPos, ViewSpot);
        // End:0xe5
        if(FindBestPathToward(Enemy, true, true))
        {
            return;
        }
        // End:0x12d
        if(bSoaking && Physics != 2)
        {
            SoakStop("COULDN'T FIND PATH TO ENEMY " $ string(Enemy));
        }
        MoveTarget = none;
        // End:0x150
        if(!bEnemyInfoValid)
        {
            Enemy = none;
            WhatToDoNext(26);
            return;
        }
        Destination = LastSeeingPos;
        bEnemyInfoValid = false;
        // End:0x1b5
        if(FastTrace(Enemy.Location, ViewSpot) && VSize(Pawn.Location - Destination) > Pawn.CollisionRadius)
        {
            SeePlayer(Enemy);
            return;
        }
        posZ = LastSeenPos.Z + Pawn.CollisionHeight - Enemy.CollisionHeight;
        nextSpot = LastSeenPos - Normal(Enemy.Velocity) * Pawn.CollisionRadius;
        nextSpot.Z = posZ;
        // End:0x240
        if(FastTrace(nextSpot, ViewSpot))
        {
            Destination = nextSpot;
        }
        // End:0x353
        else
        {
            // End:0x2c1
            if(bCanSeeLastSeen)
            {
                Dir = Pawn.Location - LastSeenPos;
                Dir.Z = 0.0;
                // End:0x2b3
                if(VSize(Dir) < Pawn.CollisionRadius)
                {
                    GoalString = "Stakeout 3 from hunt";
                    GotoState('StakeOut');
                    return;
                }
                Destination = LastSeenPos;
            }
            // End:0x353
            else
            {
                Destination = LastSeenPos;
                // End:0x353
                if(!FastTrace(LastSeenPos, ViewSpot))
                {
                    // End:0x32e
                    if(PickWallAdjust(Normal(LastSeenPos - ViewSpot)) || FindViewSpot())
                    {
                        // End:0x31f
                        if(Pawn.Physics == 2)
                        {
                            SetFall();
                        }
                        // End:0x32b
                        else
                        {
                            GotoState('Hunting', 'AdjustFromWall');
                        }
                    }
                    // End:0x353
                    else
                    {
                        GoalString = "Stakeout 2 from hunt";
                        GotoState('StakeOut');
                        return;
                    }
                }
            }
        }
    }

    function bool FindViewSpot()
    {
        local Vector X, Y, Z;

        GetAxes(Rotation, X, Y, Z);
        // End:0x89
        if(FastTrace(Enemy.Location, Pawn.Location + float(2) * Y * Pawn.CollisionRadius))
        {
            Destination = Pawn.Location + 2.50 * Y * Pawn.CollisionRadius;
            return true;
        }
        // End:0xfc
        if(FastTrace(Enemy.Location, Pawn.Location - float(2) * Y * Pawn.CollisionRadius))
        {
            Destination = Pawn.Location - 2.50 * Y * Pawn.CollisionRadius;
            return true;
        }
        // End:0x13d
        if(FRand() < 0.50)
        {
            Destination = Pawn.Location - 2.50 * Y * Pawn.CollisionRadius;
        }
        // End:0x16f
        else
        {
            Destination = Pawn.Location - 2.50 * Y * Pawn.CollisionRadius;
        }
        return true;
    }

    function EndState()
    {
        // End:0x34
        if(Pawn != none && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
    }

AdjustFromWall:
    MoveTo(Destination, MoveTarget);
Begin:

    WaitForLanding();
    // End:0x26
    if(CanSee(Enemy))
    {
        SeePlayer(Enemy);
    }
WaitForAnim:

    // End:0x4b
    if(wBotVehicle(Pawn).bShotAnim)
    {
        Sleep(0.350);
        goto 'WaitForAnim';
    }
    PickDestination();
    // End:0x97
    if(Level.TimeSeconds - ChallengeTime > float(10))
    {
        ChallengeTime = Level.TimeSeconds;
        wBotVehicle(Pawn).PlayChallengeSound();
    }
SpecialNavig:

    // End:0xad
    if(MoveTarget == none)
    {
        MoveTo(Destination);
    }
    // End:0xda
    else
    {
        MoveToward(MoveTarget, FaceActor(10.0),, FRand() < 0.750 && ShouldStrafeTo(MoveTarget));
    }
    WhatToDoNext(27);
    // End:0x104
    if(bSoaking)
    {
        SoakStop("STUCK IN HUNTING!");
    }
    stop;    
}

state StakeOut
{
    function bool CanAttack(Actor Other)
    {
        return true;
    }

    function bool Stopped()
    {
        return true;
    }

    event SeePlayer(Pawn SeenPlayer)
    {
        // End:0x63
        if(SeenPlayer == Enemy)
        {
            VisibleEnemy = Enemy;
            EnemyVisibilityTime = Level.TimeSeconds;
            bEnemyIsVisible = true;
            // End:0x58
            if(FRand() < 0.50)
            {
                Focus = Enemy;
                FireWeaponAt(Enemy);
            }
            WhatToDoNext(28);
        }
        // End:0xaf
        else
        {
            // End:0xaf
            if(SetEnemy(SeenPlayer))
            {
                // End:0xa7
                if(Enemy == SeenPlayer)
                {
                    VisibleEnemy = Enemy;
                    EnemyVisibilityTime = Level.TimeSeconds;
                    bEnemyIsVisible = true;
                }
                WhatToDoNext(29);
            }
        }
    }

    function DoStakeOut()
    {
        SetFocus();
        // End:0x73
        if(FRand() < 0.30 || !FastTrace(FocalPoint + vect(0.0, 0.0, 0.90) * Enemy.CollisionHeight, Pawn.Location + vect(0.0, 0.0, 0.80) * Pawn.CollisionHeight))
        {
            FindNewStakeOutDir();
        }
        GotoState('StakeOut', 'Begin');
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        super(Controller).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        // End:0x70
        if(Pawn.Health > 0 && Damage > 0)
        {
            // End:0x68
            if(instigatedBy == Enemy)
            {
                AcquireTime = Level.TimeSeconds;
            }
            WhatToDoNext(30);
        }
    }

    function Timer()
    {
        Enable('NotifyBump');
        SetCombatTimer();
    }

    function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
    {
        local Vector FireSpot;
        local Actor HitActor;
        local Vector HitLocation, HitNormal;

        FireSpot = FocalPoint;
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x79
        if(HitActor != none)
        {
            FireSpot += float(2) * Enemy.CollisionHeight * HitNormal;
            // End:0x79
            if(!FastTrace(FireSpot, projStart))
            {
                FireSpot = FocalPoint;
                StopFiring();
            }
        }
        SetRotation(rotator(FireSpot - projStart));
        return Rotation;
    }

    function FindNewStakeOutDir()
    {
        local NavigationPoint N, Best;
        local Vector Dir, enemyDir;
        local float dist, BestVal, val;

        enemyDir = Normal(Enemy.Location - Pawn.Location);
        N = Level.NavigationPointList;
        J0x3a:
        // End:0x11d [While If]
        if(N != none)
        {
            Dir = N.Location - Pawn.Location;
            dist = VSize(Dir);
            // End:0x106
            if(dist < float(2000) && dist > float(200))
            {
                val = enemyDir Dot Dir / dist;
                // End:0xd4
                if(Level.Game.bTeamGame)
                {
                    val += FRand();
                }
                // End:0x106
                if(val > BestVal && LineOfSightTo(N))
                {
                    BestVal = val;
                    Best = N;
                }
            }
            N = N.nextNavigationPoint;
            // This is an implied JumpToken; Continue!
            goto J0x3a;
        }
        // End:0x162
        if(Best != none)
        {
            FocalPoint = Best.Location + 0.50 * Pawn.CollisionHeight * vect(0.0, 0.0, 1.0);
        }
    }

    function SetFocus()
    {
        // End:0x17
        if(bEnemyInfoValid)
        {
            FocalPoint = LastSeenPos;
        }
        // End:0x2b
        else
        {
            FocalPoint = Enemy.Location;
        }
    }

    function BeginState()
    {
        StopStartTime = Level.TimeSeconds;
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        Pawn.bCanJump = false;
        SetFocus();
        // End:0x99
        if(!bEnemyInfoValid || !ClearShot(FocalPoint, false) || Level.TimeSeconds - LastSeenTime > float(6) && FRand() < 0.50)
        {
            FindNewStakeOutDir();
        }
    }

    function EndState()
    {
        // End:0x34
        if(Pawn != none && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
    }

Begin:
    Pawn.Acceleration = vect(0.0, 0.0, 0.0);
    Focus = none;
    CheckIfShouldCrouch(Pawn.Location, FocalPoint, 1.0);
    FinishRotation();
    // End:0xca
    if(wBotVehicle(Pawn).HasRangedAttack() && FRand() < 0.50 && VSize(Enemy.Location - FocalPoint) < float(150) && Level.TimeSeconds - LastSeenTime < float(4) && ClearShot(FocalPoint, true))
    {
        FireWeaponAt(Enemy);
    }
    // End:0xd0
    else
    {
        StopFiring();
    }
    Sleep(1.0 + FRand());
    // End:0x1ba
    if(Pawn.bIsCrouched && !FastTrace(FocalPoint, Pawn.Location + Pawn.EyeHeight * vect(0.0, 0.0, 1.0)) && FastTrace(FocalPoint, Pawn.Location + Pawn.default.EyeHeight + Pawn.default.CollisionHeight - Pawn.CollisionHeight * vect(0.0, 0.0, 1.0)))
    {
        Pawn.bWantsToCrouch = false;
        Sleep(0.150 + 0.050 * float(1) + FRand() * float(10) - Skill);
    }
    WhatToDoNext(31);
    // End:0x1e5
    if(bSoaking)
    {
        SoakStop("STUCK IN STAKEOUT!");
    }
    stop;
}

state RangedAttack
{
    function bool Stopped()
    {
        return true;
    }

    function CancelCampFor(Controller C)
    {
        DoTacticalMove();
    }

    function StopFiring()
    {
        global.StopFiring();
        // End:0x1f
        if(bHasFired)
        {
            bHasFired = false;
            WhatToDoNext(32);
        }
    }

    function EnemyNotVisible()
    {
        WhatToDoNext(33);
    }

    function Timer()
    {
        // End:0x2e
        if(wBotVehicle(Pawn).PreferMelee())
        {
            SetCombatTimer();
            StopFiring();
            WhatToDoNext(34);
        }
        // End:0x34
        else
        {
            TimedFireWeaponAtEnemy();
        }
    }

    function DoRangedAttackOn(Actor A)
    {
        Target = A;
        GotoState('RangedAttack');
    }

    function BeginState()
    {
        StopStartTime = Level.TimeSeconds;
        bHasFired = false;
        Pawn.Acceleration = vect(0.0, 0.0, 0.0);
        // End:0x4e
        if(Target == none)
        {
            Target = Enemy;
        }
        // End:0x80
        if(Target == none)
        {
            Log(GetHumanReadableName() $ " no target in ranged attack");
        }
    }

Begin:
    bHasFired = false;
    GoalString = "Ranged attack";
    Focus = Target;
    Sleep(0.0);
    // End:0x62
    if(Enemy != none)
    {
        CheckIfShouldCrouch(Pawn.Location, Enemy.Location, 1.0);
    }
    // End:0x87
    if(NeedToTurn(Target.Location))
    {
        Focus = Target;
        FinishRotation();
    }
    bHasFired = true;
    // End:0xa7
    if(Target == Enemy)
    {
        TimedFireWeaponAtEnemy();
    }
    // End:0xb2
    else
    {
        FireWeaponAt(Target);
    }
    Sleep(0.10);
    // End:0x110
    if(wBotVehicle(Pawn).PreferMelee() || Target == none || Target != Enemy || wBotVehicle(Pawn).bBoss)
    {
        WhatToDoNext(35);
    }
    // End:0x142
    if(Enemy != none)
    {
        CheckIfShouldCrouch(Pawn.Location, Enemy.Location, 1.0);
    }
    Focus = Target;
    Sleep(FMax(wBotVehicle(Pawn).RangedAttackTime(), 0.20 + 0.50 + 0.50 * FRand() * 0.40 * float(7) - Skill));
    WhatToDoNext(36);
    // End:0x1c0
    if(bSoaking)
    {
        SoakStop("STUCK IN RANGEDATTACK!");
    }
    stop;    
}

state WaitForAnim
{
    ignores KilledBy, TakeDamage, ReceiveWarning;

    event AnimEnd(int Channel)
    {
        Pawn.AnimEnd(Channel);
        // End:0x35
        if(!wBotVehicle(Pawn).bShotAnim)
        {
            WhatToDoNext(99);
        }
    }

}

state WaitingForLanding
{
    function bool DoWaitForLanding()
    {
        // End:0x0b
        if(bJustLanded)
        {
            return false;
        }
        BeginState();
        return true;
    }

    function bool NotifyLanded(Vector HitNormal)
    {
        bJustLanded = true;
        super(Controller).NotifyLanded(HitNormal);
        WhatToDoNext(50);
        return false;
    }

    function Timer()
    {
        // End:0x18
        if(Focus == Enemy)
        {
            TimedFireWeaponAtEnemy();
        }
        // End:0x1e
        else
        {
            SetCombatTimer();
        }
    }

    function BeginState()
    {
        bJustLanded = false;
        // End:0x3c
        if(MoveTarget != none && Enemy == none || Focus != Enemy)
        {
            FaceActor(1.50);
        }
        // End:0x5e
        if(Enemy == none || Focus != Enemy)
        {
            StopFiring();
        }
    }

}

defaultproperties
{
    bLeadTarget=true
    CombatStyle=0.20
    iAttackerTeam=-1
    FovAngle=85.0
}