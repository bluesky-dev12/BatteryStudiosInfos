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
    //return;    
}

function FearThisSpot(AvoidMarker aSpot)
{
    // End:0x23
    if(Skill > (float(1) + (4.5000000 * FRand())))
    {
        super(Controller).FearThisSpot(aSpot);
    }
    //return;    
}

function SetCombatTimer()
{
    SetTimer(1.2000000 - (0.0900000 * FMin(10.0000000, Skill + ReactionTime)), true);
    //return;    
}

function WaitForMover(Mover M)
{
    super(AIController).WaitForMover(M);
    StopStartTime = Level.TimeSeconds;
    //return;    
}

function TimedFireWeaponAtEnemy()
{
    // End:0x24
    if((Enemy == none) || FireWeaponAt(Enemy))
    {
        SetCombatTimer();        
    }
    else
    {
        SetTimer(0.1000000, true);
    }
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

function bool CanAttack(Actor Other)
{
    return wBotVehicle(Pawn).CanAttack(Other);
    //return;    
}

function StopFiring()
{
    wBotVehicle(Pawn).StopFiring();
    bCanFire = false;
    bFire = 0;
    bAltFire = 0;
    //return;    
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string S;

    super(AIController).DisplayDebug(Canvas, YL, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    Canvas.DrawText("     [wBotVehicleController] " $ GoalString, false);
    YPos += (float(2) * YL);
    Canvas.SetPos(4.0000000, YPos);
    // End:0x113
    if(Enemy != none)
    {
        Canvas.DrawText((("Enemy Dist " $ string(VSize(Enemy.Location - Pawn.Location))) $ " Acquired ") $ string(bEnemyAcquired));
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
    }
    Canvas.DrawText("Weapons: " $ S, false);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    Canvas.DrawText((("PERSONALITY: CombatStyle " $ string(CombatStyle)) $ " Strafing ") $ string(StrafingAbility));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

function bool FindNewEnemy()
{
    local Pawn BestEnemy;
    local bool bSeeNew, bSeeBest;
    local float BestDist, newdist;
    local Controller C;

    // End:0x1D
    if(Level.Game.bGameEnded)
    {
        return false;
    }
    C = Level.ControllerList;
    J0x31:

    // End:0x199 [Loop If]
    if(C != none)
    {
        // End:0x182
        if(((Caller != C) && C.bIsPlayer) && C.Pawn != none)
        {
            // End:0xCC
            if(BestEnemy == none)
            {
                BestEnemy = C.Pawn;
                BestDist = VSize(BestEnemy.Location - Pawn.Location);
                bSeeBest = CanSee(BestEnemy);                
            }
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
        // [Loop Continue]
        goto J0x31;
    }
    // End:0x1AA
    if(BestEnemy == Enemy)
    {
        return false;
    }
    // End:0x1CA
    if(BestEnemy != none)
    {
        ChangeEnemy(BestEnemy, CanSee(BestEnemy));
        return true;
    }
    return false;
    //return;    
}

function ChangeEnemy(Pawn NewEnemy, bool bCanSeeNewEnemy)
{
    OldEnemy = Enemy;
    Enemy = NewEnemy;
    EnemyChanged(bCanSeeNewEnemy);
    //return;    
}

function bool SetEnemy(Pawn NewEnemy, optional bool bHateMonster)
{
    local float enemyDist;
    local bool bNewMonsterEnemy;

    // End:0x4A
    if((((NewEnemy == none) || NewEnemy.Health <= 0) || NewEnemy.Controller == none) || NewEnemy == Enemy)
    {
        return false;
    }
    // End:0x64
    if(NewEnemy.Controller == Caller)
    {
        return false;
    }
    bNewMonsterEnemy = ((bHateMonster && Level.Game.NumPlayers < 4) && !wBotVehicle(Pawn).SameSpeciesAs(NewEnemy)) && !NewEnemy.Controller.bIsPlayer;
    // End:0xFC
    if(!NewEnemy.Controller.bIsPlayer && !bNewMonsterEnemy)
    {
        return false;
    }
    // End:0x141
    if(((bNewMonsterEnemy && LineOfSightTo(NewEnemy)) || Enemy == none) || !EnemyVisible())
    {
        ChangeEnemy(NewEnemy, CanSee(NewEnemy));
        return true;
    }
    // End:0x150
    if(!CanSee(NewEnemy))
    {
        return false;
    }
    // End:0x18C
    if((!bHateMonster && wBotVehicle(Enemy) != none) && NewEnemy.Controller.bIsPlayer)
    {
        return false;
    }
    enemyDist = VSize(Enemy.Location - Pawn.Location);
    // End:0x1CC
    if(enemyDist < Pawn.MeleeRange)
    {
        return false;
    }
    // End:0x212
    if(enemyDist > (1.7000000 * VSize(NewEnemy.Location - Pawn.Location)))
    {
        ChangeEnemy(NewEnemy, CanSee(NewEnemy));
        return true;
    }
    return false;
    //return;    
}

function HearNoise(float Loudness, Actor NoiseMaker)
{
    // End:0x47
    if(((ChooseAttackCounter < 2) || ChooseAttackTime != Level.TimeSeconds) && SetEnemy(NoiseMaker.Instigator))
    {
        WhatToDoNext(2);
    }
    //return;    
}

event SeePlayer(Pawn SeenPlayer)
{
    // End:0x36
    if((SeenPlayer.GetTeamNum() == (GetTeamNum())) || SeenPlayer.Controller == Caller)
    {
        return;
    }
    // End:0x74
    if(((ChooseAttackCounter < 2) || ChooseAttackTime != Level.TimeSeconds) && SetEnemy(SeenPlayer))
    {
        WhatToDoNext(3);
    }
    // End:0xAA
    if(Enemy == SeenPlayer)
    {
        VisibleEnemy = Enemy;
        EnemyVisibilityTime = Level.TimeSeconds;
        bEnemyIsVisible = true;
    }
    //return;    
}

function bool ClearShot(Vector TargetLoc, bool bImmediateFire)
{
    local bool bSeeTarget;

    // End:0x25
    if(VSize(Enemy.Location - TargetLoc) > float(2000))
    {
        return false;
    }
    bSeeTarget = FastTrace(TargetLoc, Pawn.Location + (Pawn.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000)));
    // End:0xE9
    if((!bImmediateFire && !bSeeTarget) && Pawn.bIsCrouched)
    {
        bSeeTarget = FastTrace(TargetLoc, Pawn.Location + (((Pawn.default.EyeHeight + Pawn.default.CollisionHeight) - Pawn.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000)));
    }
    // End:0x130
    if(!bSeeTarget || !FastTrace(TargetLoc, Enemy.Location + (Enemy.BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000))))
    {
    }
    return false;
    // End:0x1BF
    if((wBotVehicle(Pawn).SplashDamage() && VSize(Pawn.Location - TargetLoc) < wBotVehicle(Pawn).GetDamageRadius()) || !FastTrace(TargetLoc + (vect(0.0000000, 0.0000000, 0.9000000) * Enemy.CollisionHeight), Pawn.Location))
    {
        StopFiring();
        return false;
    }
    return true;
    //return;    
}

function CheckIfShouldCrouch(Vector StartPosition, Vector TargetPosition, float Probability)
{
    local Actor HitActor;
    local Vector HitNormal, HitLocation, X, Y, Z, projStart;

    // End:0x77
    if(((!Pawn.bCanCrouch || !Pawn.bIsCrouched && FRand() > Probability) || Skill < (float(3) * FRand())) || wBotVehicle(Pawn).RecommendSplashDamage())
    {
        Pawn.ShouldCrouch(false);
        return;
    }
    GetAxes(Rotation, X, Y, Z);
    projStart = wBotVehicle(Pawn).GetFireStart(X, Y, Z);
    projStart = (projStart + StartPosition) - Pawn.Location;
    projStart.Z = projStart.Z - (1.8000000 * (Pawn.CollisionHeight - Pawn.CrouchHeight));
    HitActor = Trace(HitLocation, HitNormal, TargetPosition, projStart, false);
    // End:0x14F
    if(HitActor == none)
    {
        Pawn.ShouldCrouch(true);
        return;
    }
    projStart.Z = projStart.Z + (1.8000000 * (Pawn.default.CollisionHeight - Pawn.CrouchHeight));
    HitActor = Trace(HitLocation, HitNormal, TargetPosition, projStart, false);
    // End:0x1C6
    if(HitActor == none)
    {
        Pawn.ShouldCrouch(false);
        return;
    }
    Pawn.ShouldCrouch(true);
    //return;    
}

function Trigger(Actor Other, Pawn EventInstigator)
{
    // End:0x27
    if((Other == Pawn) || Pawn.Health <= 0)
    {
        return;
    }
    SetEnemy(EventInstigator, true);
    //return;    
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
    else
    {
        LastSeenTime = -1000.0000000;
        bEnemyInfoValid = false;
    }
    //return;    
}

function EnemyChanged(bool bNewEnemyVisible)
{
    bEnemyAcquired = false;
    SetEnemyInfo(bNewEnemyVisible);
    wBotVehicle(Pawn).PlayChallengeSound();
    //return;    
}

function bool StrafeFromDamage(float Damage, Class<DamageType> DamageType, bool bFindDest)
{
    //return;    
}

function bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
{
    local Vector jumpDir;

    // End:0x5E
    if(NewVolume.bWaterVolume)
    {
        // End:0x34
        if(!Pawn.bCanSwim)
        {
            MoveTimer = -1.0000000;            
        }
        else
        {
            // End:0x5B
            if(int(Pawn.Physics) != int(3))
            {
                Pawn.SetPhysics(3);
            }
        }        
    }
    else
    {
        // End:0x141
        if(int(Pawn.Physics) == int(3))
        {
            // End:0x9A
            if(Pawn.bCanFly)
            {
                Pawn.SetPhysics(4);                
            }
            else
            {
                Pawn.SetPhysics(2);
                // End:0x141
                if(((Pawn.bCanWalk && (Abs(Pawn.Acceleration.X) + Abs(Pawn.Acceleration.Y)) > float(0)) && Destination.Z >= Pawn.Location.Z) && Pawn.CheckWaterJump(jumpDir))
                {
                    Pawn.JumpOutOfWater(jumpDir);
                }
            }
        }
    }
    return false;
    //return;    
}

event NotifyMissedJump()
{
    // End:0x20
    if(Pawn.bCanFly)
    {
        Pawn.SetPhysics(4);
    }
    //return;    
}

function Possess(Pawn aPawn)
{
    super(Controller).Possess(aPawn);
    InitializeSkill(DeathMatch(Level.Game).AdjustedDifficulty);
    Pawn.MaxFallSpeed = 1.1000000 * Pawn.default.MaxFallSpeed;
    Pawn.SetMovementPhysics();
    // End:0x87
    if(int(Pawn.Physics) == int(1))
    {
        Pawn.SetPhysics(2);
    }
    WhatToDoNext(1);
    Enable('NotifyBump');
    //return;    
}

function InitializeSkill(float InSkill)
{
    Skill = FClamp(InSkill, 0.0000000, 7.0000000);
    ResetSkill();
    //return;    
}

function ResetSkill()
{
    local float AdjustedYaw;

    bLeadTarget = Skill >= float(4);
    SetCombatTimer();
    SetPeripheralVision();
    // End:0x46
    if((Skill + ReactionTime) > float(7))
    {
        RotationRate.Yaw = 90000;        
    }
    else
    {
        // End:0x89
        if((Skill + ReactionTime) >= float(4))
        {
            RotationRate.Yaw = int(float(20000) + (float(7000) * (Skill + ReactionTime)));            
        }
        else
        {
            RotationRate.Yaw = int(float(30000) + (float(4000) * (Skill + ReactionTime)));
        }
    }
    AdjustedYaw = (0.7500000 + (0.0500000 * ReactionTime)) * float(RotationRate.Yaw);
    AcquisitionYawRate = int(AdjustedYaw);
    SetMaxDesiredSpeed();
    //return;    
}

function SetMaxDesiredSpeed()
{
    // End:0x52
    if(Pawn != none)
    {
        // End:0x30
        if(Skill > float(3))
        {
            Pawn.MaxDesiredSpeed = 1.0000000;            
        }
        else
        {
            Pawn.MaxDesiredSpeed = 0.6000000 + (0.1000000 * Skill);
        }
    }
    //return;    
}

function SetPeripheralVision()
{
    // End:0x0D
    if(Pawn == none)
    {
        return;
    }
    // End:0x32
    if(Skill < float(2))
    {
        Pawn.PeripheralVision = 0.7000000;        
    }
    else
    {
        // End:0x57
        if(Skill > float(5))
        {
            Pawn.PeripheralVision = 0.0000000;            
        }
        else
        {
            Pawn.PeripheralVision = 1.0000000 - (0.2000000 * Skill);
        }
    }
    Pawn.SightRadius = Pawn.default.SightRadius;
    //return;    
}

function WhatToDoNext(byte CallingByte)
{
    // End:0x76
    if(ChoosingAttackLevel > 0)
    {
        Log((((((("CHOOSEATTACKAGAIN in state " $ string(GetStateName())) $ " enemy ") $ (GetEnemyName())) $ " old enemy ") $ (GetOldEnemyName())) $ " CALLING byte ") $ string(CallingByte));
    }
    // End:0x110
    if(ChooseAttackTime == Level.TimeSeconds)
    {
        ChooseAttackCounter++;
        // End:0x10D
        if(ChooseAttackCounter > 3)
        {
            Log((((((("CHOOSEATTACKSERIAL in state " $ string(GetStateName())) $ " enemy ") $ (GetEnemyName())) $ " old enemy ") $ (GetOldEnemyName())) $ " CALLING byte ") $ string(CallingByte));
        }        
    }
    else
    {
        ChooseAttackTime = Level.TimeSeconds;
        ChooseAttackCounter = 0;
    }
    // End:0x17D
    if(((wBotVehicle(Pawn).bTryToWalk && int(Pawn.Physics) == int(4)) && ChoosingAttackLevel == 0) && ChooseAttackCounter == 0)
    {
        TryToWalk();
    }
    ChoosingAttackLevel++;
    // End:0x197
    if(int(CallingByte) == 1)
    {
        ExecuteWhatToDoNext();
    }
    ChoosingAttackLevel--;
    //return;    
}

function TryToWalk()
{
    local Vector HitLocation, HitNormal, Extent;
    local Actor HitActor;

    // End:0x1D
    if(Pawn.PhysicsVolume.bWaterVolume)
    {
        return;
    }
    Extent = Pawn.GetCollisionExtent();
    HitActor = Trace(HitLocation, HitNormal, Pawn.Location - vect(0.0000000, 0.0000000, 100.0000000), Pawn.Location, false, Extent);
    // End:0xB9
    if(((HitActor != none) && HitActor.bWorldGeometry) && HitNormal.Z > 0.7000000)
    {
        Pawn.SetPhysics(2);
    }
    //return;    
}

function string GetOldEnemyName()
{
    // End:0x15
    if(OldEnemy == none)
    {
        return "NONE";        
    }
    else
    {
        return OldEnemy.GetHumanReadableName();
    }
    //return;    
}

function string GetEnemyName()
{
    // End:0x15
    if(Enemy == none)
    {
        return "NONE";        
    }
    else
    {
        return Enemy.GetHumanReadableName();
    }
    //return;    
}

function ExecuteWhatToDoNext()
{
    GetNextPathForMoveTarget();
    GotoState('PathMove');
    //return;    
}

function bool DoWaitForLanding()
{
    GotoState('WaitingForLanding');
    return true;
    //return;    
}

function bool EnemyVisible()
{
    // End:0x30
    if((EnemyVisibilityTime == Level.TimeSeconds) && VisibleEnemy == Enemy)
    {
        return bEnemyIsVisible;
    }
    VisibleEnemy = Enemy;
    EnemyVisibilityTime = Level.TimeSeconds;
    bEnemyIsVisible = LineOfSightTo(Enemy);
    return bEnemyIsVisible;
    //return;    
}

function DoRangedAttackOn(Actor A)
{
    Target = A;
    GotoState('RangedAttack');
    //return;    
}

event SoakStop(string problem)
{
    local UnrealPlayer PC;

    Log(problem);
    SoakString = problem;
    GoalString = SoakString @ GoalString;
    // End:0x4C
    foreach DynamicActors(Class'UnrealGame.UnrealPlayer', PC)
    {
        PC.SoakPause(Pawn);
        // End:0x4C
        break;        
    }    
    //return;    
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
            else
            {
                // End:0xC8
                if(NumRandomJumps > 4)
                {
                    Pawn.Health = 0;
                    Pawn.Died(self, Class'Engine.Suicided', Pawn.Location);
                    return true;                    
                }
                else
                {
                    NumRandomJumps++;
                    // End:0x137
                    if(int(Physics) != int(2))
                    {
                        Pawn.SetPhysics(2);
                        Pawn.Velocity = (0.5000000 * Pawn.GroundSpeed) * VRand();
                        Pawn.Velocity.Z = Pawn.JumpZ;
                    }
                }
            }
        }
        return false;
    }
    NumRandomJumps = 0;
    GoalString = "Find roam dest " $ string(Level.TimeSeconds);
    // End:0x20B
    if(((RouteGoal == none) || Pawn.Anchor == RouteGoal) || Pawn.ReachedDestination(RouteGoal))
    {
        RouteGoal = FindRandomDest();
        BestPath = RouteCache[0];
        // End:0x20B
        if(RouteGoal == none)
        {
            // End:0x209
            if(bSoaking && int(Physics) != int(2))
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
    // End:0x28B
    if(bSoaking && int(Physics) != int(2))
    {
        SoakStop("COULDN'T FIND ROAM PATH TO " $ string(RouteGoal));
    }
    RouteGoal = none;
    return false;
    //return;    
}

function bool TestDirection(Vector Dir, out Vector pick)
{
    local Vector HitLocation, HitNormal, dist;
    local Actor HitActor;

    pick = Dir * (float(200) + (float(2 * 200) * FRand()));
    HitActor = Trace(HitLocation, HitNormal, (Pawn.Location + pick) + ((1.5000000 * Pawn.CollisionRadius) * Dir), Pawn.Location, false);
    // End:0xCE
    if(HitActor != none)
    {
        pick = HitLocation + (((HitNormal - Dir) * float(2)) * Pawn.CollisionRadius);
        // End:0xCB
        if(!FastTrace(pick, Pawn.Location))
        {
            return false;
        }        
    }
    else
    {
        pick = Pawn.Location + pick;
    }
    dist = pick - Pawn.Location;
    // End:0x12D
    if(int(Pawn.Physics) == int(1))
    {
        dist.Z = 0.0000000;
    }
    return VSize(dist) > float(200);
    //return;    
}

function Restart()
{
    super(Controller).Restart();
    ResetSkill();
    GotoState('Roaming', 'DoneRoaming');
    //return;    
}

function CancelCampFor(Controller C)
{
    //return;    
}

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
    VelDir.Z = 0.0000000;
    OtherDir = Other.Location - Pawn.Location;
    OtherDir.Z = 0.0000000;
    OtherDir = Normal(OtherDir);
    // End:0x14D
    if((VelDir Dot OtherDir) > 0.8000000)
    {
        bAdjusting = true;
        SideDir.X = VelDir.Y;
        SideDir.Y = -1.0000000 * VelDir.X;
        // End:0x10D
        if((SideDir Dot OtherDir) > float(0))
        {
            SideDir *= float(-1);
        }
        AdjustLoc = Pawn.Location + ((1.5000000 * Other.CollisionRadius) * ((0.5000000 * VelDir) + SideDir));
    }
    //return;    
}

event bool NotifyBump(Actor Other)
{
    local Pawn P;

    Disable('NotifyBump');
    P = Pawn(Other);
    // End:0x4B
    if(((P == none) || P.Controller == none) || Enemy == P)
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
    //return;    
}

function SetFall()
{
    // End:0x22
    if(Pawn.bCanFly)
    {
        Pawn.SetPhysics(4);
        return;
    }
    // End:0x4A
    if(Pawn.bNoJumpAdjust)
    {
        Pawn.bNoJumpAdjust = false;
        return;        
    }
    else
    {
        Pawn.Velocity = EAdjustJump(Pawn.Velocity.Z, Pawn.GroundSpeed);
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    }
    //return;    
}

function bool NotifyLanded(Vector HitNormal)
{
    local Vector Vel2D;

    // End:0xAC
    if(MoveTarget != none)
    {
        Vel2D = Pawn.Velocity;
        Vel2D.Z = 0.0000000;
        // End:0xAC
        if((Vel2D Dot (MoveTarget.Location - Pawn.Location)) < float(0))
        {
            Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
            // End:0xA1
            if(NavigationPoint(MoveTarget) != none)
            {
                Pawn.Anchor = NavigationPoint(MoveTarget);
            }
            MoveTimer = -1.0000000;
        }
    }
    return false;
    //return;    
}

function bool FindBestPathToward(Actor A, bool bCheckedReach, bool bAllowDetour)
{
    // End:0x26
    if(!bCheckedReach && actorReachable(A))
    {
        MoveTarget = A;        
    }
    else
    {
        MoveTarget = FindPathToward(A, false);
    }
    // End:0x45
    if(MoveTarget != none)
    {
        return true;        
    }
    else
    {
        // End:0x80
        if((A == Enemy) && A != none)
        {
            FailedHuntTime = Level.TimeSeconds;
            FailedHuntEnemy = Enemy;
        }
        // End:0xC7
        if(bSoaking && int(Physics) != int(2))
        {
            SoakStop("COULDN'T FIND BEST PATH TO " $ string(A));
        }
    }
    return false;
    //return;    
}

function bool NeedToTurn(Vector targ)
{
    local Vector LookDir, AimDir;

    LookDir = Vector(Pawn.Rotation);
    LookDir.Z = 0.0000000;
    LookDir = Normal(LookDir);
    AimDir = targ - Pawn.Location;
    AimDir.Z = 0.0000000;
    AimDir = Normal(AimDir);
    return (LookDir Dot AimDir) < 0.9300000;
    //return;    
}

function bool NearWall(float walldist)
{
    local Actor HitActor;
    local Vector HitLocation, HitNormal, ViewSpot, ViewDist, LookDir;

    LookDir = Vector(Rotation);
    ViewSpot = Pawn.Location + (Pawn.BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000));
    ViewDist = LookDir * walldist;
    HitActor = Trace(HitLocation, HitNormal, ViewSpot + ViewDist, ViewSpot, false);
    // End:0x84
    if(HitActor == none)
    {
        return false;
    }
    ViewDist = Normal(HitNormal Cross vect(0.0000000, 0.0000000, 1.0000000)) * walldist;
    // End:0xC1
    if(FRand() < 0.5000000)
    {
        ViewDist *= float(-1);
    }
    Focus = none;
    // End:0xFC
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
    FocalPoint = Pawn.Location - (LookDir * float(300));
    return true;
    //return;    
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
    // End:0x5A
    if(Pawn.Acceleration == vect(0.0000000, 0.0000000, 0.0000000))
    {
        FutureLoc = Pawn.Location;        
    }
    else
    {
        FutureLoc = Pawn.Location + ((Pawn.GroundSpeed * Normal(Pawn.Acceleration)) * DeltaTime);
    }
    // End:0xD0
    if(Pawn.Base != none)
    {
        FutureLoc += (Pawn.Base.Velocity * DeltaTime);
    }
    // End:0x108
    if(!FastTrace(FutureLoc, Pawn.Location) && int(Pawn.Physics) != int(2))
    {
        return false;
    }
    // End:0x13A
    if(FastTrace(Target.Location + (Target.Velocity * DeltaTime), FutureLoc))
    {
        return true;
    }
    return false;
    //return;    
}

function float AdjustAimError(float AimError, float TargetDist, bool bDefendMelee, bool bInstantProj, bool bLeadTargetNow)
{
    // End:0x3A
    if((Pawn(Target) != none) && int(Pawn(Target).Visibility) < 2)
    {
        AimError *= 2.5000000;
    }
    AimError = AimError * FMin(5.0000000, 12.0000000 - (float(11) * (Normal(Target.Location - Pawn.Location) Dot Normal((Target.Location + (1.2000000 * Target.Velocity)) - (Pawn.Location + Pawn.Velocity)))));
    // End:0xD9
    if(bDefendMelee)
    {
        AimError *= 0.5000000;
    }
    // End:0x105
    if(Target.Velocity == vect(0.0000000, 0.0000000, 0.0000000))
    {
        AimError *= 0.6000000;
    }
    // End:0x198
    if((Stopped()) && Level.TimeSeconds > StopStartTime)
    {
        // End:0x149
        if((Skill + Accuracy) > float(4))
        {
            AimError *= 0.9000000;
        }
        AimError *= FClamp(((2.0000000 - (0.0800000 * FMin(Skill, 7.0000000))) - FRand()) / ((Level.TimeSeconds - StopStartTime) + 0.4000000), 0.7000000, 1.0000000);
    }
    // End:0x1DB
    if(!bDefendMelee)
    {
        AimError *= (3.3000000 - (0.3700000 * (FClamp(Skill + Accuracy, 0.0000000, 8.5000000) + (0.5000000 * FRand()))));
    }
    // End:0x22D
    if(((Skill < float(7)) || FRand() < 0.5000000) && (Level.TimeSeconds - Pawn.LastPainTime) < 0.2000000)
    {
        AimError *= 1.3000000;
    }
    // End:0x26D
    if((int(Pawn.Physics) == int(2)) || int(Target.Physics) == int(2))
    {
        AimError *= 1.6000000;
    }
    // End:0x2C1
    if(AcquireTime > ((Level.TimeSeconds - 0.5000000) - (0.6000000 * (float(7) - Skill))))
    {
        AimError *= 1.5000000;
        // End:0x2C1
        if(bInstantProj)
        {
            AimError *= 1.5000000;
        }
    }
    return float(Rand(int(float(2) * AimError))) - AimError;
    //return;    
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
    // End:0xFA
    if(Pawn(Target) == none)
    {
        // End:0xC5
        if(!FiredAmmunition.bTossed)
        {
            return Rotator(Target.Location - projStart);            
        }
        else
        {
            FireDir = AdjustToss(projSpeed, projStart, Target.Location, true);
            SetRotation(Rotator(FireDir));
            return Rotation;
        }
    }
    bLeadTargetNow = FiredAmmunition.bLeadTarget && bLeadTarget;
    bDefendMelee = (Target == Enemy) && DefendMelee(TargetDist);
    AimError = int(AdjustAimError(float(AimError), TargetDist, bDefendMelee, FiredAmmunition.bInstantHit, bLeadTargetNow));
    // End:0x3CC
    if(bLeadTargetNow)
    {
        TargetVel = Target.Velocity;
        // End:0x253
        if(int(Target.Physics) == int(2))
        {
            // End:0x237
            if(Target.PhysicsVolume.Gravity.Z <= Target.PhysicsVolume.default.Gravity.Z)
            {
                TargetVel.Z = FMin(TargetVel.Z + FMax(-400.0000000, Target.PhysicsVolume.Gravity.Z * FMin(1.0000000, TargetDist / projSpeed)), 0.0000000);                
            }
            else
            {
                TargetVel.Z = FMin(0.0000000, TargetVel.Z);
            }
        }
        FireSpot += (((FMin(1.0000000, 0.7000000 + (0.6000000 * FRand())) * TargetVel) * TargetDist) / projSpeed);
        FireSpot.Z = FMin(Target.Location.Z, FireSpot.Z);
        // End:0x368
        if(((int(Target.Physics) != int(2)) && FRand() < 0.5500000) && VSize(FireSpot - projStart) > float(1000))
        {
            TargetLook = Target.Rotation;
            // End:0x32C
            if(int(Target.Physics) == int(1))
            {
                TargetLook.Pitch = 0;
            }
            bClean = ((Vector(TargetLook) Dot Normal(Target.Velocity)) >= 0.7100000) && FastTrace(FireSpot, projStart);            
        }
        else
        {
            bClean = FastTrace(FireSpot, projStart);
        }
        // End:0x3CC
        if(!bClean)
        {
            // End:0x3AA
            if(FRand() < 0.3000000)
            {
                FireSpot = Target.Location;                
            }
            else
            {
                FireSpot = 0.5000000 * (FireSpot + Target.Location);
            }
        }
    }
    bClean = false;
    // End:0x574
    if(((FiredAmmunition.bTrySplash && Pawn(Target) != none) && (Skill >= float(4)) || bDefendMelee) && ((int(Target.Physics) == int(2)) && (Pawn.Location.Z + float(80)) >= Target.Location.Z) || ((Pawn.Location.Z + float(19)) >= Target.Location.Z) && bDefendMelee || Skill > ((6.5000000 * FRand()) - 0.5000000))
    {
        HitActor = Trace(HitLocation, HitNormal, FireSpot - (vect(0.0000000, 0.0000000, 1.0000000) * (Target.CollisionHeight + float(6))), FireSpot, false);
        bClean = HitActor == none;
        // End:0x545
        if(!bClean)
        {
            FireSpot = HitLocation + vect(0.0000000, 0.0000000, 3.0000000);
            bClean = FastTrace(FireSpot, projStart);            
        }
        else
        {
            bClean = (int(Target.Physics) == int(2)) && FastTrace(FireSpot, projStart);
        }
    }
    // End:0x5B1
    if(!bClean)
    {
        FireSpot.Z = Target.Location.Z;
        bClean = FastTrace(FireSpot, projStart);
    }
    // End:0x63D
    if((FiredAmmunition.bTossed && !bClean) && bEnemyInfoValid)
    {
        FireSpot = LastSeenPos;
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x635
        if(HitActor != none)
        {
            bCanFire = false;
            FireSpot += ((float(2) * Target.CollisionHeight) * HitNormal);
        }
        bClean = true;
    }
    // End:0x691
    if(!bClean)
    {
        FireSpot.Z = Target.Location.Z + (0.9000000 * Target.CollisionHeight);
        bClean = FastTrace(FireSpot, projStart);
    }
    // End:0x7D1
    if((!bClean && Target == Enemy) && bEnemyInfoValid)
    {
        FireSpot = LastSeenPos;
        // End:0x706
        if(Pawn.Location.Z >= LastSeenPos.Z)
        {
            FireSpot.Z -= (0.4000000 * Enemy.CollisionHeight);
        }
        HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        // End:0x7D1
        if(HitActor != none)
        {
            FireSpot = LastSeenPos + ((float(2) * Enemy.CollisionHeight) * HitNormal);
            // End:0x7C9
            if(wBotVehicle(Pawn).SplashDamage() && Skill >= float(4))
            {
                HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
                // End:0x7C9
                if(HitActor != none)
                {
                    FireSpot += ((float(2) * Enemy.CollisionHeight) * HitNormal);
                }
            }
            bCanFire = false;
        }
    }
    // End:0x7FE
    if(FiredAmmunition.bTossed)
    {
        FireDir = AdjustToss(projSpeed, projStart, FireSpot, true);        
    }
    else
    {
        FireDir = FireSpot - projStart;
    }
    FireRotation = Rotator(FireDir);
    realYaw = FireRotation.Yaw;
    InstantWarnTarget(Target, FiredAmmunition, Vector(FireRotation));
    FireRotation.Yaw = SetFireYaw(FireRotation.Yaw + AimError);
    FireDir = Vector(FireRotation);
    FireDist = FMin(VSize(FireSpot - projStart), 400.0000000);
    FireSpot = projStart + (FireDist * FireDir);
    HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
    // End:0x9E6
    if(HitActor != none)
    {
        // End:0x945
        if(HitNormal.Z < 0.7000000)
        {
            FireRotation.Yaw = SetFireYaw(realYaw - AimError);
            FireDir = Vector(FireRotation);
            FireSpot = projStart + (FireDist * FireDir);
            HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
        }
        // End:0x9E6
        if(HitActor != none)
        {
            FireSpot += ((HitNormal * float(2)) * Target.CollisionHeight);
            // End:0x9C5
            if(Skill >= float(4))
            {
                HitActor = Trace(HitLocation, HitNormal, FireSpot, projStart, false);
                // End:0x9C5
                if(HitActor != none)
                {
                    FireSpot += (Target.CollisionHeight * HitNormal);
                }
            }
            FireDir = Normal(FireSpot - projStart);
            FireRotation = Rotator(FireDir);
        }
    }
    SetRotation(FireRotation);
    return FireRotation;
    //return;    
}

function ReceiveWarning(Pawn shooter, float projSpeed, Vector FireDir)
{
    local float enemyDist, DodgeSkill;
    local Vector X, Y, Z, enemyDir;

    DodgeSkill = Skill + wBotVehicle(Pawn).DodgeSkillAdjust;
    // End:0xC0
    if(((((((Pawn.Health <= 0) || DodgeSkill < float(4)) || Enemy == none) || !wBotVehicle(Pawn).bCanDodge) || int(Pawn.Physics) == int(2)) || int(Pawn.Physics) == int(3)) || FRand() > ((0.2000000 * DodgeSkill) - 0.4000000))
    {
        return;
    }
    enemyDist = VSize(shooter.Location - Pawn.Location);
    // End:0x109
    if((enemyDist / projSpeed) < (0.1100000 + (0.1500000 * FRand())))
    {
        return;
    }
    GetAxes(Pawn.Rotation, X, Y, Z);
    enemyDir = (shooter.Location - Pawn.Location) / enemyDist;
    // End:0x16B
    if((enemyDir Dot X) < 0.8000000)
    {
        return;
    }
    // End:0x19C
    if((FireDir Dot Y) > float(0))
    {
        Y *= float(-1);
        TryToDuck(Y, true);        
    }
    else
    {
        TryToDuck(Y, false);
    }
    //return;    
}

function bool TryToDuck(Vector duckDir, bool bReversed)
{
    local Vector HitLocation, HitNormal, Extent;
    local Actor HitActor;
    local bool bSuccess, bDuckLeft;

    // End:0x5C
    if(Pawn.PhysicsVolume.bWaterVolume || Pawn.PhysicsVolume.Gravity.Z > Pawn.PhysicsVolume.default.Gravity.Z)
    {
        return false;
    }
    duckDir.Z = 0.0000000;
    bDuckLeft = !bReversed;
    Extent = Pawn.GetCollisionExtent();
    HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(240) * duckDir), Pawn.Location, false, Extent);
    bSuccess = (HitActor == none) || VSize(HitLocation - Pawn.Location) > float(150);
    // End:0x19E
    if(!bSuccess)
    {
        bDuckLeft = !bDuckLeft;
        duckDir *= float(-1);
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(240) * duckDir), Pawn.Location, false, Extent);
        bSuccess = (HitActor == none) || VSize(HitLocation - Pawn.Location) > float(150);
    }
    // End:0x1AB
    if(!bSuccess)
    {
        return false;
    }
    // End:0x1D7
    if(HitActor == none)
    {
        HitLocation = Pawn.Location + (float(240) * duckDir);
    }
    HitActor = Trace(HitLocation, HitNormal, HitLocation - (35.0000000 * vect(0.0000000, 0.0000000, 1.0000000)), HitLocation, false, Extent);
    // End:0x21D
    if(HitActor == none)
    {
        return false;
    }
    // End:0x23F
    if(bDuckLeft)
    {
        UnrealPawn(Pawn).CurrentDir = 1;        
    }
    else
    {
        UnrealPawn(Pawn).CurrentDir = 2;
    }
    UnrealPawn(Pawn).Dodge(UnrealPawn(Pawn).CurrentDir);
    return true;
    //return;    
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn KilledPawn)
{
    // End:0x11
    if(Killer == self)
    {
        Celebrate();
    }
    // End:0x5B
    if((KilledPawn == Enemy) || ((Killed != none) && Killed.bIsPlayer) && Enemy == none)
    {
        Enemy = none;
        FindNewEnemy();
    }
    //return;    
}

function Actor FaceMoveTarget()
{
    // End:0x15
    if(MoveTarget != Enemy)
    {
        StopFiring();
    }
    return MoveTarget;
    //return;    
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
    if((Skill + StrafingAbility) < float(3))
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
        return (Skill + StrafingAbility) < ((float(5) * FRand()) - float(1));        
    }
    else
    {
        // End:0xF1
        if(Pickup(WayPoint) == none)
        {
            N = NavigationPoint(WayPoint);
            // End:0xB8
            if((N == none) || N.bNeverUseStrafing)
            {
                return false;
            }
            // End:0xCF
            if(N.FearCost > 200)
            {
                return true;
            }
            // End:0xF1
            if(N.bAlwaysUseStrafing && FRand() < 0.8000000)
            {
                return true;
            }
        }
    }
    // End:0x11D
    if(Pawn(WayPoint) != none)
    {
        return (Skill + StrafingAbility) < ((float(5) * FRand()) - float(1));
    }
    // End:0x13D
    if((Skill + StrafingAbility) < ((float(7) * FRand()) - float(1)))
    {
        return false;
    }
    // End:0x152
    if(Enemy == none)
    {
        return FRand() < 0.4000000;
    }
    // End:0x165
    if(EnemyVisible())
    {
        return FRand() < 0.8500000;
    }
    return FRand() < 0.6000000;
    //return;    
}

function Actor FaceActor(float StrafingModifier)
{
    local float RelativeDir;

    bRecommendFastMove = false;
    // End:0x41
    if((Enemy == none) || (Level.TimeSeconds - LastSeenTime) > (float(6) - StrafingModifier))
    {
        return FaceMoveTarget();
    }
    // End:0x56
    if(MoveTarget == Enemy)
    {
        return Enemy;
    }
    // End:0x82
    if((Level.TimeSeconds - LastSeenTime) > (float(4) - StrafingModifier))
    {
        return FaceMoveTarget();
    }
    // End:0xA9
    if((Skill > 2.5000000) && GameObject(MoveTarget) != none)
    {
        return Enemy;
    }
    RelativeDir = Normal((Enemy.Location - Pawn.Location) - (vect(0.0000000, 0.0000000, 1.0000000) * (Enemy.Location.Z - Pawn.Location.Z))) Dot Normal((MoveTarget.Location - Pawn.Location) - (vect(0.0000000, 0.0000000, 1.0000000) * (MoveTarget.Location.Z - Pawn.Location.Z)));
    // End:0x178
    if(RelativeDir > 0.8500000)
    {
        return Enemy;
    }
    // End:0x1CB
    if(((RelativeDir > 0.3000000) && Bot(Enemy.Controller) != none) && MoveTarget == Enemy.Controller.MoveTarget)
    {
        return Enemy;
    }
    // End:0x1EB
    if((Skill + StrafingAbility) < (float(2) + FRand()))
    {
        return FaceMoveTarget();
    }
    // End:0x23F
    if(((RelativeDir < 0.3000000) || (Skill + StrafingAbility) < ((float(5) + StrafingModifier) * FRand())) || ((0.4000000 * RelativeDir) + 0.8000000) < FRand())
    {
        return FaceMoveTarget();
    }
    return Enemy;
    //return;    
}

event float Desireability(Pickup P)
{
    return -1.0000000;
    //return;    
}

function damageAttitudeTo(Pawn Other, float Damage)
{
    // End:0x3C
    if(((Pawn.Health > 0) && Damage > float(0)) && SetEnemy(Other, true))
    {
        WhatToDoNext(5);
    }
    //return;    
}

function wHelicopter GetHeli()
{
    return wHelicopter(Pawn);
    //return;    
}

function GetNextPathForMoveTarget()
{
    local NavigationPoint N;

    N = Level.NavigationPointList;
    J0x14:

    // End:0xED [Loop If]
    if(N != none)
    {
        // End:0xD6
        if(N.IsA('FlyingPathNode') && FlyingPathNode(N).iPathPoint == GetHeli().iCurrentPoint)
        {
            MoveTarget = N;
            Log((("STATE[ PathMove ] - Find GetNextPath : " $ string(GetHeli().iCurrentPoint)) $ " -> ") $ string(GetHeli().iCurrentPoint + 1));
            GetHeli().iCurrentPoint++;
            return;
        }
        N = N.nextNavigationPoint;
        // [Loop Continue]
        goto J0x14;
    }
    MoveTarget = none;
    //return;    
}

simulated function int GetTeamNum()
{
    // End:0x2C
    if(Caller != none)
    {
        return Caller.PlayerReplicationInfo.Team.TeamIndex;
    }
    return 255;
    //return;    
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    // End:0x1C
    if(instigatedBy.GetTeamNum() == (GetTeamNum()))
    {
        return;
    }
    super(Controller).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
    //return;    
}

function bool Formation()
{
    return false;
    //return;    
}

function Celebrate()
{
    Pawn.PlayVictoryAnimation();
    //return;    
}

function DoStakeOut()
{
    GotoState('StakeOut');
    //return;    
}

function DoCharge()
{
    // End:0x3A
    if(Enemy.PhysicsVolume.bWaterVolume)
    {
        // End:0x37
        if(!Pawn.bCanSwim)
        {
            DoTacticalMove();
            return;
        }        
    }
    else
    {
        // End:0x6C
        if(!Pawn.bCanFly && !Pawn.bCanWalk)
        {
            DoTacticalMove();
            return;
        }
    }
    GotoState('Charging');
    //return;    
}

function DoTacticalMove()
{
    GotoState('TacticalMove');
    //return;    
}

function bool DefendMelee(float dist)
{
    return ((Enemy.Weapon != none) && Enemy.Weapon.bMeleeWeapon) && dist < float(1000);
    //return;    
}

function bool IsStrafing()
{
    return false;
    //return;    
}

function bool IsHunting()
{
    return false;
    //return;    
}

function bool Stopped()
{
    return bPreparingMove;
    //return;    
}

function GameHasEnded()
{
    //return;    
}

state PathMove
{
    function Timer()
    {
        //return;        
    }

    function BeginState()
    {
        Pawn.LoopAnim('Idle');
        Pawn.StopAllSoundByActor();
        // End:0x80
        if(float(Pawn.Health) > (float(Pawn.default.Health) * 0.3000000))
        {
            wBotVehicle(Pawn).FmodPlaySound(wBotVehicle(Pawn).MoveSound, 10, 1.0000000,, false, true);            
        }
        else
        {
            wBotVehicle(Pawn).FmodPlaySound(wBotVehicle(Pawn).MoveDamagedSound, 10, 1.0000000,, false, true);
        }
        //return;        
    }

    function EndState()
    {
        //return;        
    }
Begin:

    Pawn.SwitchWeapon(1);
    // End:0x44
    if((MoveTarget != none) && Pawn.Health > 0)
    {
        MoveToward(MoveTarget);
        GotoState('WaitForHunting');        
    }
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
        // End:0x82
        if(float(Pawn.Health) > (float(Pawn.default.Health) * 0.3000000))
        {
            wBotVehicle(Pawn).FmodPlaySound(wBotVehicle(Pawn).StaySound, 10, 1.0000000,, false, true);            
        }
        else
        {
            wBotVehicle(Pawn).FmodPlaySound(wBotVehicle(Pawn).MoveDamagedSound, 10, 1.0000000,, false, true);
        }
        StopStartTime = Level.TimeSeconds;
        bHasFired = false;
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x101
        if(Target == none)
        {
            Target = Enemy;
        }
        //return;        
    }

    function EndState()
    {
        wHelicopter(Pawn).Acceleration = wHelicopter(Pawn).default.Acceleration;
        //return;        
    }

    function bool Stopped()
    {
        return true;
        //return;        
    }

    event SeePlayer(Pawn SeenPlayer)
    {
        // End:0x36
        if((SeenPlayer.GetTeamNum() == (GetTeamNum())) || SeenPlayer.Controller == Caller)
        {
            return;
        }
        // End:0xA4
        if(SeenPlayer == Enemy)
        {
            VisibleEnemy = Enemy;
            EnemyVisibilityTime = Level.TimeSeconds;
            bEnemyIsVisible = true;
            Target = Enemy;
            // End:0x99
            if(FRand() < 0.5000000)
            {
                Focus = Enemy;
                FireWeaponAt(Enemy);
            }
            WhatToDoNext(28);            
        }
        else
        {
            // End:0xFB
            if(SetEnemy(SeenPlayer))
            {
                // End:0xF3
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
        //return;        
    }

    function SetFocus()
    {
        // End:0x17
        if(bEnemyInfoValid)
        {
            FocalPoint = LastSeenPos;            
        }
        else
        {
            FocalPoint = Enemy.Location;
        }
        //return;        
    }

    function StartFireWeapons()
    {
        // End:0x0D
        if(Target == none)
        {
            return;
        }
        wHelicopter(Pawn).Weapon.GetFireMode(0).AimError = 170.0000000;
        wHelicopter(Pawn).Weapon.ClientStartFire(0);
        //return;        
    }

    function StopFireWeapons()
    {
        wHelicopter(Pawn).Weapon.ClientStopFire(0);
        //return;        
    }

    function Timer()
    {
        // End:0x57
        if((Target != none) && Target.IsA('Pawn'))
        {
            // End:0x57
            if(Pawn(Target).GetTeamNum() == Caller.GetTeamNum())
            {
                Target = none;
                Enemy = none;
            }
        }
        //return;        
    }
Begin:

    GetNextPathForMoveTarget();
    // End:0xAF
    if(MoveTarget != none)
    {
        Sleep(1.0000000);
        FinishRotation();
        StartFireWeapons();
        Sleep(3.0000000);
        StopFireWeapons();
        Sleep(1.0000000);
        Pawn.SwitchWeapon(2);
        FinishRotation();
        StartFireWeapons();
        Sleep(3.0000000);
        StopFireWeapons();
        Sleep(1.0000000);
        Pawn.SwitchWeapon(1);
        FinishRotation();
        StartFireWeapons();
        Sleep(3.0000000);
        StopFireWeapons();
        Sleep(1.0000000);
        FinishRotation();
        StartFireWeapons();
        Sleep(3.0000000);
        StopFireWeapons();
    }
    // End:0xCD
    if(Pawn.Health > 0)
    {
        GotoState('PathMove');        
    }
    else
    {
        GotoState('Dying');
    }
    stop;                
}

state Dying
{
    function BeginState()
    {
        //return;        
    }

    function EndState()
    {
        //return;        
    }
    stop;    
}

state NoGoal
{    stop;    
}

state MoveToGoal
{
    function Timer()
    {
        SetCombatTimer();
        Enable('NotifyBump');
        //return;        
    }
    stop;    
}

state MoveToGoalNoEnemy extends MoveToGoal
{    stop;    
}

state MoveToGoalWithEnemy extends MoveToGoal
{
    function Timer()
    {
        TimedFireWeaponAtEnemy();
        //return;        
    }
    stop;    
}

state Roaming extends MoveToGoalNoEnemy
{
    ignores MayFall;

    function MayFall()
    {
        Pawn.bCanJump = (MoveTarget != none) && (int(MoveTarget.Physics) != int(2)) || !MoveTarget.IsA('Pickup');
        //return;        
    }
Begin:

    SwitchToBestWeapon();
    WaitForLanding();
    MoveToward(MoveTarget, FaceActor(1.0000000),, ShouldStrafeTo(MoveTarget));
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
    ignores EndState, EnemyNotVisible, Timer, NotifyBump, NotifyTakeHit, TryStrafe, 
	    StrafeFromDamage, TryToDuck, MayFall;

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
            MoveTimer = -1.0000000;
        }
        //return;        
    }

    function bool TryToDuck(Vector duckDir, bool bReversed)
    {
        // End:0x1E
        if(FRand() < 0.6000000)
        {
            return global.TryToDuck(duckDir, bReversed);
        }
        // End:0x39
        if(MoveTarget == Enemy)
        {
            return TryStrafe(duckDir);
        }
        //return;        
    }

    function bool StrafeFromDamage(float Damage, Class<DamageType> DamageType, bool bFindDest)
    {
        local Vector SideDir;

        // End:0x2E
        if((FRand() * Damage) < ((0.1500000 * CombatStyle) * float(Pawn.Health)))
        {
            return false;
        }
        // End:0x3B
        if(!bFindDest)
        {
            return true;
        }
        SideDir = Normal(Normal(Enemy.Location - Pawn.Location) Cross vect(0.0000000, 0.0000000, 1.0000000));
        // End:0x9D
        if((Pawn.Velocity Dot SideDir) > float(0))
        {
            SideDir *= float(-1);
        }
        return TryStrafe(SideDir);
        //return;        
    }

    function bool TryStrafe(Vector SideDir)
    {
        local Vector Extent, HitLocation, HitNormal;
        local Actor HitActor;

        Extent = Pawn.GetCollisionExtent();
        HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(200) * SideDir), Pawn.Location, false, Extent);
        // End:0xB2
        if(HitActor != none)
        {
            SideDir *= float(-1);
            HitActor = Trace(HitLocation, HitNormal, Pawn.Location + (float(200) * SideDir), Pawn.Location, false, Extent);
        }
        // End:0xBF
        if(HitActor != none)
        {
            return false;
        }
        // End:0x14A
        if(int(Pawn.Physics) == int(1))
        {
            HitActor = Trace(HitLocation, HitNormal, (Pawn.Location + (float(200) * SideDir)) - (35.0000000 * vect(0.0000000, 0.0000000, 1.0000000)), Pawn.Location + (float(200) * SideDir), false, Extent);
            // End:0x14A
            if(HitActor == none)
            {
                return false;
            }
        }
        Destination = Pawn.Location + (float(2 * 200) * SideDir);
        GotoState('TacticalMove', 'DoStrafeMove');
        return true;
        //return;        
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        local float pick;
        local Vector SideDir;
        local bool bWasOnGround;

        super(wBotVehicleController).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        bWasOnGround = int(Pawn.Physics) == int(1);
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
        else
        {
            // End:0x15B
            if((bWasOnGround && MoveTarget == Enemy) && int(Pawn.Physics) == int(2))
            {
                pick = 1.0000000;
                // End:0xC6
                if(bStrafeDir)
                {
                    pick = -1.0000000;
                }
                SideDir = Normal(Normal(Enemy.Location - Pawn.Location) Cross vect(0.0000000, 0.0000000, 1.0000000));
                SideDir.Z = 0.0000000;
                Pawn.Velocity += (((pick * Pawn.GroundSpeed) * 0.7000000) * SideDir);
                // End:0x15B
                if(FRand() < 0.2000000)
                {
                    bStrafeDir = !bStrafeDir;
                }
            }
        }
        //return;        
    }

    event bool NotifyBump(Actor Other)
    {
        // End:0x1C
        if(Other == Enemy)
        {
            DoRangedAttackOn(Enemy);
            return false;
        }
        return global.NotifyBump(Other);
        //return;        
    }

    function Timer()
    {
        Enable('NotifyBump');
        Target = Enemy;
        TimedFireWeaponAtEnemy();
        //return;        
    }

    function EnemyNotVisible()
    {
        WhatToDoNext(15);
        //return;        
    }

    function EndState()
    {
        // End:0x34
        if((Pawn != none) && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        //return;        
    }
Begin:

    // End:0x3B
    if(int(Pawn.Physics) == int(2))
    {
        Focus = Enemy;
        Destination = Enemy.Location;
        WaitForLanding();
    }
    // End:0x4E
    if(Enemy == none)
    {
        WhatToDoNext(16);
    }
WaitForAnim:


    // End:0x73
    if(wBotVehicle(Pawn).bShotAnim)
    {
        Sleep(0.3500000);
        goto 'WaitForAnim';
    }
    // End:0x8C
    if(!FindBestPathToward(Enemy, false, true))
    {
        GotoState('TacticalMove');
    }
moving:


    MoveToward(MoveTarget, FaceActor(1.0000000),, ShouldStrafeTo(MoveTarget));
    WhatToDoNext(17);
    // End:0xD6
    if(bSoaking)
    {
        SoakStop("STUCK IN CHARGING!");
    }
    stop;        
}

state TacticalMove
{
    ignores EndState, BeginState, EngageDirection, PickDestination, PawnIsInPain, EnemyNotVisible, 
	    Timer, NotifyHitWall, SetFall, ReceiveWarning, IsStrafing;

    function bool IsStrafing()
    {
        return true;
        //return;        
    }

    function ReceiveWarning(Pawn shooter, float projSpeed, Vector FireDir)
    {
        // End:0x19
        if(bCanFire && FRand() < 0.4000000)
        {
            return;
        }
        super(Controller).ReceiveWarning(shooter, projSpeed, FireDir);
        //return;        
    }

    function SetFall()
    {
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        Destination = Pawn.Location;
        global.SetFall();
        //return;        
    }

    function bool NotifyHitWall(Vector HitNormal, Actor Wall)
    {
        // End:0x1B
        if(int(Pawn.Physics) == int(2))
        {
            return false;
        }
        // End:0x30
        if(Enemy == none)
        {
            WhatToDoNext(18);
            return false;
        }
        // End:0x8C
        if((bChangeDir || FRand() < 0.5000000) || ((Enemy.Location - Pawn.Location) Dot HitNormal) < float(0))
        {
            Focus = Enemy;
            WhatToDoNext(19);            
        }
        else
        {
            bChangeDir = true;
            Destination = Pawn.Location - ((HitNormal * FRand()) * float(500));
        }
        return true;
        //return;        
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
        else
        {
            SetCombatTimer();
        }
        //return;        
    }

    function EnemyNotVisible()
    {
        StopFiring();
        // End:0x2E
        if(FastTrace(Enemy.Location, LastSeeingPos))
        {
            GotoState('TacticalMove', 'RecoverEnemy');            
        }
        else
        {
            WhatToDoNext(20);
        }
        Disable('EnemyNotVisible');
        //return;        
    }

    function PawnIsInPain(PhysicsVolume PainVolume)
    {
        Destination = Pawn.Location - (float(200) * Normal(Pawn.Velocity));
        //return;        
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
        // End:0xCE
        if((Pawn.PhysicsVolume.bWaterVolume && !Pawn.bCanSwim) && Pawn.bCanFly)
        {
            Destination = Pawn.Location + (float(75) * (VRand() + vect(0.0000000, 0.0000000, 1.0000000)));
            Destination.Z += float(100);
            return;
        }
        enemyDir = Normal(Enemy.Location - Pawn.Location);
        Y = enemyDir Cross vect(0.0000000, 0.0000000, 1.0000000);
        // End:0x14A
        if(int(Pawn.Physics) == int(1))
        {
            Y.Z = 0.0000000;
            enemyDir.Z = 0.0000000;            
        }
        else
        {
            enemyDir.Z = FMax(0.0000000, enemyDir.Z);
        }
        strafeSize = FClamp((2.0000000 * FRand()) - 0.6500000, -0.7000000, 0.7000000);
        strafeSize = FMax((0.4000000 * FRand()) - 0.2000000, strafeSize);
        enemyPart = enemyDir * strafeSize;
        // End:0x23C
        if(Pawn.bCanFly)
        {
            // End:0x21E
            if((Pawn.Location.Z - Enemy.Location.Z) < float(1000))
            {
                enemyPart = enemyPart + (FRand() * vect(0.0000000, 0.0000000, 1.0000000));                
            }
            else
            {
                enemyPart = enemyPart - (FRand() * vect(0.0000000, 0.0000000, 0.7000000));
            }
        }
        strafeSize = FMax(0.0000000, 1.0000000 - Abs(strafeSize));
        pickdir = strafeSize * Y;
        // End:0x280
        if(bStrafeDir)
        {
            pickdir *= float(-1);
        }
        bStrafeDir = !bStrafeDir;
        // End:0x2A7
        if(EngageDirection(enemyPart + pickdir, false))
        {
            return;
        }
        // End:0x2BF
        if(EngageDirection(enemyPart - pickdir, false))
        {
            return;
        }
        bForcedDirection = true;
        StartTacticalTime = Level.TimeSeconds;
        EngageDirection(enemyPart + pickdir, true);
        //return;        
    }

    function bool EngageDirection(Vector StrafeDir, bool bForced)
    {
        local Actor HitActor;
        local Vector HitLocation, collspec, MinDest, HitNormal;

        MinDest = Pawn.Location + (float(200) * StrafeDir);
        // End:0x169
        if(!bForced)
        {
            collspec = Pawn.GetCollisionExtent();
            collspec.Z = FMax(6.0000000, Pawn.CollisionHeight - Pawn.CollisionRadius);
            HitActor = Trace(HitLocation, HitNormal, MinDest, Pawn.Location, false, collspec);
            // End:0xAA
            if(HitActor != none)
            {
                return false;
            }
            // End:0x169
            if(int(Pawn.Physics) == int(1))
            {
                collspec.X = FMin(14.0000000, 0.5000000 * Pawn.CollisionRadius);
                collspec.Y = collspec.X;
                HitActor = Trace(HitLocation, HitNormal, MinDest - ((Pawn.CollisionRadius + 35.0000000) * vect(0.0000000, 0.0000000, 1.0000000)), MinDest, false, collspec);
                // End:0x169
                if(HitActor == none)
                {
                    HitNormal = float(-1) * StrafeDir;
                    return false;
                }
            }
        }
        Destination = MinDest + (StrafeDir * ((0.5000000 * float(200)) + FMin(VSize(Enemy.Location - Pawn.Location), 200.0000000 * (FRand() + FRand()))));
        return true;
        //return;        
    }

    function BeginState()
    {
        bForcedDirection = false;
        // End:0x38
        if(Skill < float(4))
        {
            Pawn.MaxDesiredSpeed = 0.4000000 + (0.0800000 * Skill);
        }
        MinHitWall += 0.1500000;
        Pawn.bAvoidLedges = true;
        Pawn.bStopAtLedges = true;
        Pawn.bCanJump = false;
        bAdjustFromWalls = false;
        //return;        
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
        MinHitWall -= 0.1500000;
        // End:0x70
        if(Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        //return;        
    }
TacticalTick:

    Sleep(0.0200000);
Begin:


    // End:0x43
    if(int(Pawn.Physics) == int(2))
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
            Sleep(0.5000000);
            goto 'WaitForAnim';
        }
        MoveTo(Destination);        
    }
    else
    {
DoStrafeMove:


        MoveTo(Destination, Enemy);
    }
    // End:0x126
    if(bForcedDirection && (Level.TimeSeconds - StartTacticalTime) < 0.2000000)
    {
        // End:0xF2
        if(Skill > (float(2) + (float(3) * FRand())))
        {
            bMustCharge = true;
            WhatToDoNext(51);
        }
        GoalString = "RangedAttack from failed tactical";
        DoRangedAttackOn(Enemy);
    }
    // End:0x18E
    if(((((Enemy == none) || EnemyVisible()) || !FastTrace(Enemy.Location, LastSeeingPos)) || wBotVehicle(Pawn).PreferMelee()) || !Pawn.bCanStrafe)
    {
        goto 'FinishedStrafe';
    }
RecoverEnemy:


    GoalString = "Recover Enemy";
    HidingSpot = Pawn.Location;
    StopFiring();
    Sleep(0.1000000 + (0.2000000 * FRand()));
    Destination = LastSeeingPos + ((float(4) * Pawn.CollisionRadius) * Normal(LastSeeingPos - Pawn.Location));
    MoveTo(Destination, Enemy);
    // End:0x2EA
    if(FireWeaponAt(Enemy))
    {
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x269
        if(wBotVehicle(Pawn).SplashDamage())
        {
            StopFiring();
            Sleep(0.0500000);            
        }
        else
        {
            Sleep((0.1000000 + (0.3000000 * FRand())) + (0.0600000 * (float(7) - FMin(7.0000000, Skill))));
        }
        // End:0x2EA
        if(FRand() > 0.5000000)
        {
            Enable('EnemyNotVisible');
            Destination = HidingSpot + ((float(4) * Pawn.CollisionRadius) * Normal(HidingSpot - Pawn.Location));
            goto 'DoMove';
        }
    }
FinishedStrafe:


    WhatToDoNext(21);
    // End:0x31A
    if(bSoaking)
    {
        SoakStop("STUCK IN TACTICAL MOVE!");
    }
    stop;        
}

state Hunting extends MoveToGoalWithEnemy
{
    ignores EndState, FindViewSpot, PickDestination, Timer, SeePlayer, MayFall, 
	    IsHunting;

    function bool IsHunting()
    {
        return true;
        //return;        
    }

    function MayFall()
    {
        Pawn.bCanJump = ((MoveTarget == none) || int(MoveTarget.Physics) != int(2)) || !MoveTarget.IsA('Pickup');
        //return;        
    }

    function SeePlayer(Pawn SeenPlayer)
    {
        // End:0x92
        if(SeenPlayer == Enemy)
        {
            // End:0x55
            if((Level.TimeSeconds - ChallengeTime) > float(7))
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
        else
        {
            global.SeePlayer(SeenPlayer);
        }
        //return;        
    }

    function Timer()
    {
        SetCombatTimer();
        StopFiring();
        //return;        
    }

    function PickDestination()
    {
        local Vector nextSpot, ViewSpot, Dir;
        local float posZ;
        local bool bCanSeeLastSeen;

        // End:0x32
        if((Enemy == none) || Enemy.Health <= 0)
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
        ViewSpot = Pawn.Location + (Pawn.BaseEyeHeight * vect(0.0000000, 0.0000000, 1.0000000));
        bCanSeeLastSeen = bEnemyInfoValid && FastTrace(LastSeenPos, ViewSpot);
        // End:0xE5
        if(FindBestPathToward(Enemy, true, true))
        {
            return;
        }
        // End:0x12D
        if(bSoaking && int(Physics) != int(2))
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
        // End:0x1B5
        if(FastTrace(Enemy.Location, ViewSpot) && VSize(Pawn.Location - Destination) > Pawn.CollisionRadius)
        {
            SeePlayer(Enemy);
            return;
        }
        posZ = (LastSeenPos.Z + Pawn.CollisionHeight) - Enemy.CollisionHeight;
        nextSpot = LastSeenPos - (Normal(Enemy.Velocity) * Pawn.CollisionRadius);
        nextSpot.Z = posZ;
        // End:0x240
        if(FastTrace(nextSpot, ViewSpot))
        {
            Destination = nextSpot;            
        }
        else
        {
            // End:0x2C1
            if(bCanSeeLastSeen)
            {
                Dir = Pawn.Location - LastSeenPos;
                Dir.Z = 0.0000000;
                // End:0x2B3
                if(VSize(Dir) < Pawn.CollisionRadius)
                {
                    GoalString = "Stakeout 3 from hunt";
                    GotoState('StakeOut');
                    return;
                }
                Destination = LastSeenPos;                
            }
            else
            {
                Destination = LastSeenPos;
                // End:0x353
                if(!FastTrace(LastSeenPos, ViewSpot))
                {
                    // End:0x32E
                    if(PickWallAdjust(Normal(LastSeenPos - ViewSpot)) || FindViewSpot())
                    {
                        // End:0x31F
                        if(int(Pawn.Physics) == int(2))
                        {
                            SetFall();                            
                        }
                        else
                        {
                            GotoState('Hunting', 'AdjustFromWall');
                        }                        
                    }
                    else
                    {
                        GoalString = "Stakeout 2 from hunt";
                        GotoState('StakeOut');
                        return;
                    }
                }
            }
        }
        //return;        
    }

    function bool FindViewSpot()
    {
        local Vector X, Y, Z;

        GetAxes(Rotation, X, Y, Z);
        // End:0x89
        if(FastTrace(Enemy.Location, Pawn.Location + ((float(2) * Y) * Pawn.CollisionRadius)))
        {
            Destination = Pawn.Location + ((2.5000000 * Y) * Pawn.CollisionRadius);
            return true;
        }
        // End:0xFC
        if(FastTrace(Enemy.Location, Pawn.Location - ((float(2) * Y) * Pawn.CollisionRadius)))
        {
            Destination = Pawn.Location - ((2.5000000 * Y) * Pawn.CollisionRadius);
            return true;
        }
        // End:0x13D
        if(FRand() < 0.5000000)
        {
            Destination = Pawn.Location - ((2.5000000 * Y) * Pawn.CollisionRadius);            
        }
        else
        {
            Destination = Pawn.Location - ((2.5000000 * Y) * Pawn.CollisionRadius);
        }
        return true;
        //return;        
    }

    function EndState()
    {
        // End:0x34
        if((Pawn != none) && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        //return;        
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


    // End:0x4B
    if(wBotVehicle(Pawn).bShotAnim)
    {
        Sleep(0.3500000);
        goto 'WaitForAnim';
    }
    PickDestination();
    // End:0x97
    if((Level.TimeSeconds - ChallengeTime) > float(10))
    {
        ChallengeTime = Level.TimeSeconds;
        wBotVehicle(Pawn).PlayChallengeSound();
    }
SpecialNavig:


    // End:0xAD
    if(MoveTarget == none)
    {
        MoveTo(Destination);        
    }
    else
    {
        MoveToward(MoveTarget, FaceActor(10.0000000),, (FRand() < 0.7500000) && ShouldStrafeTo(MoveTarget));
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
    ignores EndState, BeginState, SetFocus, FindNewStakeOutDir, AdjustAim, Timer, 
	    NotifyTakeHit, DoStakeOut, SeePlayer, Stopped, CanAttack;

    function bool CanAttack(Actor Other)
    {
        return true;
        //return;        
    }

    function bool Stopped()
    {
        return true;
        //return;        
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
            if(FRand() < 0.5000000)
            {
                Focus = Enemy;
                FireWeaponAt(Enemy);
            }
            WhatToDoNext(28);            
        }
        else
        {
            // End:0xAF
            if(SetEnemy(SeenPlayer))
            {
                // End:0xA7
                if(Enemy == SeenPlayer)
                {
                    VisibleEnemy = Enemy;
                    EnemyVisibilityTime = Level.TimeSeconds;
                    bEnemyIsVisible = true;
                }
                WhatToDoNext(29);
            }
        }
        //return;        
    }

    function DoStakeOut()
    {
        SetFocus();
        // End:0x73
        if((FRand() < 0.3000000) || !FastTrace(FocalPoint + (vect(0.0000000, 0.0000000, 0.9000000) * Enemy.CollisionHeight), Pawn.Location + (vect(0.0000000, 0.0000000, 0.8000000) * Pawn.CollisionHeight)))
        {
            FindNewStakeOutDir();
        }
        GotoState('StakeOut', 'Begin');
        //return;        
    }

    function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
    {
        super(Controller).NotifyTakeHit(instigatedBy, HitLocation, Damage, DamageType, Momentum, CollisionPart);
        // End:0x70
        if((Pawn.Health > 0) && Damage > 0)
        {
            // End:0x68
            if(instigatedBy == Enemy)
            {
                AcquireTime = Level.TimeSeconds;
            }
            WhatToDoNext(30);
        }
        //return;        
    }

    function Timer()
    {
        Enable('NotifyBump');
        SetCombatTimer();
        //return;        
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
            FireSpot += ((float(2) * Enemy.CollisionHeight) * HitNormal);
            // End:0x79
            if(!FastTrace(FireSpot, projStart))
            {
                FireSpot = FocalPoint;
                StopFiring();
            }
        }
        SetRotation(Rotator(FireSpot - projStart));
        return Rotation;
        //return;        
    }

    function FindNewStakeOutDir()
    {
        local NavigationPoint N, Best;
        local Vector Dir, enemyDir;
        local float dist, BestVal, val;

        enemyDir = Normal(Enemy.Location - Pawn.Location);
        N = Level.NavigationPointList;
        J0x3A:

        // End:0x11D [Loop If]
        if(N != none)
        {
            Dir = N.Location - Pawn.Location;
            dist = VSize(Dir);
            // End:0x106
            if((dist < float(2000)) && dist > float(200))
            {
                val = (enemyDir Dot Dir) / dist;
                // End:0xD4
                if(Level.Game.bTeamGame)
                {
                    val += FRand();
                }
                // End:0x106
                if((val > BestVal) && LineOfSightTo(N))
                {
                    BestVal = val;
                    Best = N;
                }
            }
            N = N.nextNavigationPoint;
            // [Loop Continue]
            goto J0x3A;
        }
        // End:0x162
        if(Best != none)
        {
            FocalPoint = Best.Location + ((0.5000000 * Pawn.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000));
        }
        //return;        
    }

    function SetFocus()
    {
        // End:0x17
        if(bEnemyInfoValid)
        {
            FocalPoint = LastSeenPos;            
        }
        else
        {
            FocalPoint = Enemy.Location;
        }
        //return;        
    }

    function BeginState()
    {
        StopStartTime = Level.TimeSeconds;
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        Pawn.bCanJump = false;
        SetFocus();
        // End:0x99
        if((!bEnemyInfoValid || !ClearShot(FocalPoint, false)) || ((Level.TimeSeconds - LastSeenTime) > float(6)) && FRand() < 0.5000000)
        {
            FindNewStakeOutDir();
        }
        //return;        
    }

    function EndState()
    {
        // End:0x34
        if((Pawn != none) && Pawn.JumpZ > float(0))
        {
            Pawn.bCanJump = true;
        }
        //return;        
    }
Begin:

    Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
    Focus = none;
    CheckIfShouldCrouch(Pawn.Location, FocalPoint, 1.0000000);
    FinishRotation();
    // End:0xCA
    if((((wBotVehicle(Pawn).HasRangedAttack() && FRand() < 0.5000000) && VSize(Enemy.Location - FocalPoint) < float(150)) && (Level.TimeSeconds - LastSeenTime) < float(4)) && ClearShot(FocalPoint, true))
    {
        FireWeaponAt(Enemy);        
    }
    else
    {
        StopFiring();
    }
    Sleep(1.0000000 + FRand());
    // End:0x1B9
    if((Pawn.bIsCrouched && !FastTrace(FocalPoint, Pawn.Location + (Pawn.EyeHeight * vect(0.0000000, 0.0000000, 1.0000000)))) && FastTrace(FocalPoint, Pawn.Location + (((Pawn.default.EyeHeight + Pawn.default.CollisionHeight) - Pawn.CollisionHeight) * vect(0.0000000, 0.0000000, 1.0000000))))
    {
        Pawn.ShouldCrouch(false);
        Sleep(0.1500000 + ((0.0500000 * (float(1) + FRand())) * (float(10) - Skill)));
    }
    WhatToDoNext(31);
    // End:0x1E4
    if(bSoaking)
    {
        SoakStop("STUCK IN STAKEOUT!");
    }
    stop;                
}

state RangedAttack
{
    ignores BeginState, DoRangedAttackOn, Timer, EnemyNotVisible, StopFiring, CancelCampFor, 
	    Stopped;

    function bool Stopped()
    {
        return true;
        //return;        
    }

    function CancelCampFor(Controller C)
    {
        DoTacticalMove();
        //return;        
    }

    function StopFiring()
    {
        global.StopFiring();
        // End:0x1F
        if(bHasFired)
        {
            bHasFired = false;
            WhatToDoNext(32);
        }
        //return;        
    }

    function EnemyNotVisible()
    {
        WhatToDoNext(33);
        //return;        
    }

    function Timer()
    {
        // End:0x2E
        if(wBotVehicle(Pawn).PreferMelee())
        {
            SetCombatTimer();
            StopFiring();
            WhatToDoNext(34);            
        }
        else
        {
            TimedFireWeaponAtEnemy();
        }
        //return;        
    }

    function DoRangedAttackOn(Actor A)
    {
        Target = A;
        GotoState('RangedAttack');
        //return;        
    }

    function BeginState()
    {
        StopStartTime = Level.TimeSeconds;
        bHasFired = false;
        Pawn.Acceleration = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x4E
        if(Target == none)
        {
            Target = Enemy;
        }
        // End:0x80
        if(Target == none)
        {
            Log((GetHumanReadableName()) $ " no target in ranged attack");
        }
        //return;        
    }
Begin:

    bHasFired = false;
    GoalString = "Ranged attack";
    Focus = Target;
    Sleep(0.0000000);
    // End:0x62
    if(Enemy != none)
    {
        CheckIfShouldCrouch(Pawn.Location, Enemy.Location, 1.0000000);
    }
    // End:0x87
    if(NeedToTurn(Target.Location))
    {
        Focus = Target;
        FinishRotation();
    }
    bHasFired = true;
    // End:0xA7
    if(Target == Enemy)
    {
        TimedFireWeaponAtEnemy();        
    }
    else
    {
        FireWeaponAt(Target);
    }
    Sleep(0.1000000);
    // End:0x110
    if(((wBotVehicle(Pawn).PreferMelee() || Target == none) || Target != Enemy) || wBotVehicle(Pawn).bBoss)
    {
        WhatToDoNext(35);
    }
    // End:0x142
    if(Enemy != none)
    {
        CheckIfShouldCrouch(Pawn.Location, Enemy.Location, 1.0000000);
    }
    Focus = Target;
    Sleep(FMax(wBotVehicle(Pawn).RangedAttackTime(), 0.2000000 + (((0.5000000 + (0.5000000 * FRand())) * 0.4000000) * (float(7) - Skill))));
    WhatToDoNext(36);
    // End:0x1C0
    if(bSoaking)
    {
        SoakStop("STUCK IN RANGEDATTACK!");
    }
    stop;                
}

state WaitForAnim
{
    ignores AnimEnd;

    event AnimEnd(int Channel)
    {
        Pawn.AnimEnd(Channel);
        // End:0x35
        if(!wBotVehicle(Pawn).bShotAnim)
        {
            WhatToDoNext(99);
        }
        //return;        
    }
    stop;    
}

state WaitingForLanding
{
    function bool DoWaitForLanding()
    {
        // End:0x0B
        if(bJustLanded)
        {
            return false;
        }
        BeginState();
        return true;
        //return;        
    }

    function bool NotifyLanded(Vector HitNormal)
    {
        bJustLanded = true;
        super(Controller).NotifyLanded(HitNormal);
        WhatToDoNext(50);
        return false;
        //return;        
    }

    function Timer()
    {
        // End:0x18
        if(Focus == Enemy)
        {
            TimedFireWeaponAtEnemy();            
        }
        else
        {
            SetCombatTimer();
        }
        //return;        
    }

    function BeginState()
    {
        bJustLanded = false;
        // End:0x3C
        if((MoveTarget != none) && (Enemy == none) || Focus != Enemy)
        {
            FaceActor(1.5000000);
        }
        // End:0x5E
        if((Enemy == none) || Focus != Enemy)
        {
            StopFiring();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    bLeadTarget=true
    CombatStyle=0.2000000
    iAttackerTeam=-1
    FovAngle=85.0000000
}