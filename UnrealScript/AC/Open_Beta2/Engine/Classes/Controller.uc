class Controller extends Actor
    abstract
    native
    nativereplication
    notplaceable;

const LATENT_MOVETOWARD = 503;

var Pawn Pawn;
var localized float BtrUpdateFrequency;
var const int PlayerNum;
var float SightCounter;
var float FovAngle;
var float Handedness;
var bool bIsPlayer;
var bool bGodMode;
var const bool bLOSflag;
var bool bAdvancedTactics;
var bool bCanOpenDoors;
var bool bCanDoSpecial;
var bool bAdjusting;
var bool bPreparingMove;
var bool bControlAnimations;
var bool bEnemyInfoValid;
var bool bNotifyApex;
var bool bUsePlayerHearing;
var bool bJumpOverWall;
var bool bEnemyAcquired;
var bool bSoaking;
var bool bHuntPlayer;
var bool bAllowedToTranslocate;
var bool bAllowedToImpactJump;
var bool bAdrenalineEnabled;
var bool bNotifyFallingHitWall;
var bool bSlowerZAcquire;
var bool bInDodgeMove;
var bool bVehicleTransition;
var bool bForceStrafe;
var bool bNotifyPostLanded;
var bool bUseDynamicRegenLocation;
var input byte bRun;
var input byte bDuck;
var input byte bProne;
var input byte bFire;
var input byte bAltFire;
var input byte bMeleeFire;
var input byte bUseKey;
var input byte bVoiceTalk;
var byte bOldRun;
var byte bHitRun;
var float fHitAccel;
var Vector OldVel;
var input byte bInputCrouch;
var input byte bInputProne;
var input byte byInputPosture;
var byte bOldInputCrouch;
var byte bOldInputProne;
var float fStandingTimeCount;
var float fCrouchingTimeCount;
var float fCrouchingTimeLimit;
var float fProningTimeCount;
var float fProningTimeLimit;
var byte byGoCrouch;
var byte byGoProne;
var byte bGotoProne;
var float fSprintTime;
var float fSprintPassTime;
var bool bSprint;
var bool bDClickMove;
var bool bOldDClickMove;
var float fSprintDelayTime;
var float fSprintStopTime;
var byte bySaveFireState;
var byte bySprintState;
var Vector AdjustLoc;
var const Controller nextController;
var const Controller preController;
var float Stimulus;
var float wFlashRemainTime;
var float wFlashForce;
var float wFreezeTime;
var float MoveTimer;
var Actor MoveTarget;
var Vector Destination;
var Vector FocalPoint;
var Actor Focus;
var float FocusLead;
var Mover PendingMover;
var Actor GoalList[4];
var NavigationPoint home;
var float MinHitWall;
var float RespawnPredictionTime;
var float DodgeToGoalPct;
var int AcquisitionYawRate;
var float DodgeLandZ;
var Vehicle LastBlockingVehicle;
var Pawn Enemy;
var Actor Target;
var Vector LastSeenPos;
var Vector LastSeeingPos;
var float LastSeenTime;
var string VoiceType;
var float OldMessageTime;
var Actor RouteCache[16];
var ReachSpec CurrentPath;
var ReachSpec NextRoutePath;
var Vector CurrentPathDir;
var Actor RouteGoal;
var float RouteDist;
var float LastRouteFind;
var Vector DirectionHint;
var() Class<PlayerReplicationInfo> PlayerReplicationInfoClass;
var PlayerReplicationInfo PlayerReplicationInfo;
var Class<Pawn> PawnClass;
var Class<Pawn> PreviousPawnClass;
var float GroundPitchTime;
var Vector ViewX;
var Vector ViewY;
var Vector ViewZ;
var NavigationPoint StartSpot;
var Vector MonitorStartLoc;
var Pawn MonitoredPawn;
var float MonitorMaxDistSq;
var Controller Caller;
var AvoidMarker FearSpots[2];
var float WarningDelay;
var Projectile WarningProjectile;
var Pawn ShotTarget;
var const Actor LastFailedReach;
var const float FailedReachTime;
var const Vector FailedReachLocation;
var float Adrenaline;
var float AdrenalineMax;
var Class<wWeapon> LastPawnWeapon;
var float UAVQueue;
var int RegenLoc;
var wSkillBase SkillBase;
var bool bHit;
var bool bSet;
var float hit_gun_move_speed;
var float hit_gun_move_time;
var float hit_gun_move_delay;
var float hit_gun_delta_Time;

replication
{
    // Pos:0x085
    unreliable if(int(Role) < int(ROLE_Authority))
        SendVoiceMessage, SetPawnClass;

    // Pos:0x092
    unreliable if(int(Role) == int(ROLE_Authority))
        wClientFlash;

    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        ChangeSkillAddValue, ClientEnableSkill, 
        ClientStopAllSound, ReceiveMessage_QuestType1, 
        ReceiveMessage_QuestType2, ReceiveMessage_QuestType3, 
        SetActiveSkill;

    // Pos:0x00D
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        Pawn, PlayerReplicationInfo;

    // Pos:0x025
    reliable if((bNetDirty && int(Role) == int(ROLE_Authority)) && bNetOwner)
        Adrenaline, PawnClass, 
        bAdrenalineEnabled;

    // Pos:0x048
    reliable if(int(RemoteRole) == int(ROLE_AutonomousProxy))
        ClientDying, ClientGameEnded, 
        ClientRoundEnded, ClientSetLocation, 
        ClientSetRotation, ClientSetWeapon, 
        ClientSwitchToBestWeapon;

    // Pos:0x055
    reliable if((!bDemoRecording || bClientDemoRecording && bClientDemoNetFunc) && int(Role) == int(ROLE_Authority))
        ClientVoiceMessage;

    // Pos:0x09F
    reliable if(int(Role) < int(ROLE_Authority))
        ServerCallAirStrike, ServerCallUAV, 
        ServerReStartPlayer, ServerSetOldRun, 
        ServerSetVel, ServerSkillUsedByWeapon;

    // Pos:0x0AC
    reliable if(int(Role) == int(ROLE_Authority))
        ClientCallCoolTimeSkill, ClientOnBeginIntervented, 
        ClientOnBeginRound, ClientOnBeginWaitingForStart, 
        ClientOnEndIntervented, ClientOnEndWaitingForStart, 
        ClientReadyCoolTimeSkill, ClientTestAllWeapons, 
        ClientTestWeapon, ClientUAV;
}

// Export UController::execMoveTo(FFrame&, void* const)
native(500) final latent function MoveTo(Vector NewDestination, optional Actor ViewFocus, optional bool bShouldSprint, optional Vector FocalPoint)
{
    //native.NewDestination;
    //native.ViewFocus;
    //native.bShouldSprint;
    //native.FocalPoint;        
}

// Export UController::execMoveToward(FFrame&, void* const)
native(502) final latent function MoveToward(Actor NewTarget, optional Actor ViewFocus, optional float DestinationOffset, optional bool bUseStrafing, optional bool bShouldSprint)
{
    //native.NewTarget;
    //native.ViewFocus;
    //native.DestinationOffset;
    //native.bUseStrafing;
    //native.bShouldSprint;        
}

// Export UController::execFinishRotation(FFrame&, void* const)
native(508) final latent function FinishRotation();

// Export UController::execLineOfSightTo(FFrame&, void* const)
native(514) final function bool LineOfSightTo(Actor Other)
{
    //native.Other;        
}

// Export UController::execCanSee(FFrame&, void* const)
native(533) final function bool CanSee(Pawn Other)
{
    //native.Other;        
}

// Export UController::execFindPathTo(FFrame&, void* const)
native(518) final function Actor FindPathTo(Vector aPoint)
{
    //native.aPoint;        
}

// Export UController::execFindPathToward(FFrame&, void* const)
native(517) final function Actor FindPathToward(Actor anActor, optional bool bWeightDetours)
{
    //native.anActor;
    //native.bWeightDetours;        
}

// Export UController::execFindPathToIntercept(FFrame&, void* const)
native final function Actor FindPathToIntercept(Pawn P, Actor RouteGoal, optional bool bWeightDetours)
{
    //native.P;
    //native.RouteGoal;
    //native.bWeightDetours;        
}

// Export UController::execFindPathTowardNearest(FFrame&, void* const)
native final function Actor FindPathTowardNearest(Class<NavigationPoint> GoalClass, optional bool bWeightDetours)
{
    //native.GoalClass;
    //native.bWeightDetours;        
}

// Export UController::execFindRandomDest(FFrame&, void* const)
native(525) final function NavigationPoint FindRandomDest();

// Export UController::execEAdjustJump(FFrame&, void* const)
native(523) final function Vector EAdjustJump(float BaseZ, float XYSpeed)
{
    //native.BaseZ;
    //native.XYSpeed;        
}

// Export UController::execpointReachable(FFrame&, void* const)
native(521) final function bool pointReachable(Vector aPoint)
{
    //native.aPoint;        
}

// Export UController::execactorReachable(FFrame&, void* const)
native(520) final function bool actorReachable(Actor anActor)
{
    //native.anActor;        
}

// Export UController::execPickWallAdjust(FFrame&, void* const)
native(526) final function bool PickWallAdjust(Vector HitNormal)
{
    //native.HitNormal;        
}

// Export UController::execWaitForLanding(FFrame&, void* const)
native(527) final latent function WaitForLanding();

// Export UController::execFindBestInventoryPath(FFrame&, void* const)
native(540) final function Actor FindBestInventoryPath(out float MinWeight)
{
    //native.MinWeight;        
}

// Export UController::execFindBestSuperPickup(FFrame&, void* const)
native final function Actor FindBestSuperPickup(float MaxDist)
{
    //native.MaxDist;        
}

// Export UController::execAddController(FFrame&, void* const)
native(529) final function AddController();

// Export UController::execRemoveController(FFrame&, void* const)
native(530) final function RemoveController();

// Export UController::execPickTarget(FFrame&, void* const)
native(531) final function Pawn PickTarget(out float bestAim, out float BestDist, Vector FireDir, Vector projStart, float MaxRange)
{
    //native.bestAim;
    //native.BestDist;
    //native.FireDir;
    //native.projStart;
    //native.MaxRange;        
}

// Export UController::execPickAnyTarget(FFrame&, void* const)
native(534) final function Actor PickAnyTarget(out float bestAim, out float BestDist, Vector FireDir, Vector projStart)
{
    //native.bestAim;
    //native.BestDist;
    //native.FireDir;
    //native.projStart;        
}

// Export UController::execInLatentExecution(FFrame&, void* const)
native final function bool InLatentExecution(int LatentActionNumber)
{
    //native.LatentActionNumber;        
}

// Export UController::execStopWaiting(FFrame&, void* const)
native function StopWaiting();

// Export UController::execEndClimbLadder(FFrame&, void* const)
native function EndClimbLadder();

// Export UController::execCanMakePathTo(FFrame&, void* const)
native final function bool CanMakePathTo(Actor A)
{
    //native.A;        
}

event MayFall()
{
    //return;    
}

event MayDodgeToMoveTarget()
{
    //return;    
}

event MissedDodge()
{
    //return;    
}

exec function Cmd(string P1, string P2, string p3, string p4, string p5)
{
    //return;    
}

function PendingStasis()
{
    bStasis = true;
    Pawn = none;
    //return;    
}

function wClientFlash(float fTime)
{
    wFlashRemainTime = fTime;
    //return;    
}

function wViewFlash(float fDeltaTime)
{
    // End:0x0F
    if(wFlashRemainTime == float(0))
    {
        return;
    }
    wFlashRemainTime = FMax(0.0000000, wFlashRemainTime - fDeltaTime);
    // End:0x44
    if(wFlashRemainTime >= float(3))
    {
        wFlashForce = 1.0000000;        
    }
    else
    {
        wFlashForce = wFlashRemainTime / float(3);
    }
    //return;    
}

function wClientFreeze(float fTime)
{
    wFreezeTime = fTime;
    GotoState('PlayerFreeze');
    //return;    
}

function AwardAdrenaline(float Amount)
{
    // End:0x2E
    if(bAdrenalineEnabled)
    {
        Adrenaline += Amount;
        Adrenaline = float(Clamp(int(Adrenaline), 0, int(AdrenalineMax)));
    }
    //return;    
}

function bool NeedsAdrenaline()
{
    return ((Pawn != none) && !Pawn.InCurrentCombo()) && Adrenaline < AdrenalineMax;
    //return;    
}

function ClientTestWeapon(wWeapon W, int iaWeaponID)
{
    //return;    
}

function ClientTestAllWeapons()
{
    //return;    
}

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local string DebugString;

    // End:0x22
    if(Pawn == none)
    {
        super.DisplayDebug(Canvas, YL, YPos);
        return;
    }
    Canvas.SetDrawColor(byte(255), 0, 0);
    Canvas.DrawText((((("CONTROLLER " $ (GetItemName(string(self)))) $ " Pawn ") $ (GetItemName(string(Pawn)))) $ " viewpitch ") $ string(Rotation.Pitch));
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    // End:0x119
    if(Enemy != none)
    {
        Canvas.DrawText((((("     STATE: " $ string(GetStateName())) $ " Timer: ") $ string(TimerCounter)) $ " Enemy ") $ Enemy.GetHumanReadableName(), false);        
    }
    else
    {
        Canvas.DrawText(((("     STATE: " $ string(GetStateName())) $ " Timer: ") $ string(TimerCounter)) $ " NO Enemy ", false);
    }
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    // End:0x1C1
    if(MonitoredPawn != none)
    {
        DebugString $= ("     MonitoredPawn: " @ MonitoredPawn.GetHumanReadableName());        
    }
    else
    {
        DebugString $= "     MonitoredPawn: None";
    }
    // End:0x21B
    if(Target != none)
    {
        DebugString $= ("     Target: " @ Target.GetHumanReadableName());        
    }
    else
    {
        DebugString $= "     Target: None";
    }
    Canvas.DrawText(DebugString);
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    // End:0x2A7
    if(PlayerReplicationInfo == none)
    {
        Canvas.DrawText("     NO PLAYERREPLICATIONINFO", false);        
    }
    else
    {
        PlayerReplicationInfo.DisplayDebug(Canvas, YL, YPos);
    }
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

simulated function string GetHumanReadableName()
{
    // End:0x1A
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.PlayerName;
    }
    return GetItemName(string(self));
    //return;    
}

simulated function Rotator GetViewRotation()
{
    return Rotation;
    //return;    
}

function Reset()
{
    super.Reset();
    Enemy = none;
    LastSeenTime = 0.0000000;
    StartSpot = none;
    Adrenaline = 0.0000000;
    bAdjusting = false;
    bPreparingMove = false;
    bJumpOverWall = false;
    bEnemyAcquired = false;
    bHuntPlayer = false;
    bInDodgeMove = false;
    MoveTimer = -1.0000000;
    MoveTarget = none;
    PendingMover = none;
    CurrentPath = none;
    RouteGoal = none;
    MonitoredPawn = none;
    WarningProjectile = none;
    fSprintPassTime = 0.0000000;
    bHit = false;
    hit_gun_move_speed = 0.0000000;
    hit_gun_move_time = 0.0000000;
    hit_gun_move_delay = 0.0000000;
    hit_gun_delta_Time = 0.0000000;
    //return;    
}

function bool AvoidCertainDeath()
{
    return false;
    //return;    
}

function ClientSetLocation(Vector NewLocation, Rotator NewRotation)
{
    SetRotation(NewRotation);
    // End:0x8B
    if((Rotation.Pitch > RotationRate.Pitch) && Rotation.Pitch < (65536 - RotationRate.Pitch))
    {
        // End:0x6F
        if(Rotation.Pitch < 32768)
        {
            NewRotation.Pitch = RotationRate.Pitch;            
        }
        else
        {
            NewRotation.Pitch = 65536 - RotationRate.Pitch;
        }
    }
    // End:0xC4
    if(Pawn != none)
    {
        NewRotation.Roll = 0;
        Pawn.SetRotation(NewRotation);
        Pawn.SetLocation(NewLocation);
    }
    //return;    
}

function ClientSetRotation(Rotator NewRotation)
{
    SetRotation(NewRotation);
    // End:0x3C
    if(Pawn != none)
    {
        NewRotation.Pitch = 0;
        NewRotation.Roll = 0;
        Pawn.SetRotation(NewRotation);
    }
    //return;    
}

simulated function ClientDying(Class<DamageType> DamageType, Vector HitLocation)
{
    // End:0x34
    if(Pawn != none)
    {
        Pawn.PlayDying(DamageType, HitLocation);
        Pawn.GotoState('Dying');
    }
    //return;    
}

event AIHearSound(Actor Actor, int id, Sound S, Vector soundLocation, Vector Parameters, bool Attenuate)
{
    //return;    
}

event SoakStop(string problem)
{
    //return;    
}

function Possess(Pawn aPawn)
{
    aPawn.PossessedBy(self);
    Pawn = aPawn;
    // End:0xB6
    if(PlayerReplicationInfo != none)
    {
        // End:0x81
        if((Vehicle(Pawn) != none) && Vehicle(Pawn).Driver != none)
        {
            PlayerReplicationInfo.bIsFemale = Vehicle(Pawn).Driver.bIsFemale;            
        }
        else
        {
            PlayerReplicationInfo.bIsFemale = Pawn.bIsFemale;
        }
        PlayerReplicationInfo.abySupplyItemFlag[int(3)] = 0;
    }
    FocalPoint = Pawn.Location + (float(512) * Vector(Pawn.Rotation));
    Restart();
    //return;    
}

function UnPossess()
{
    // End:0x1A
    if(Pawn != none)
    {
        Pawn.UnPossessed();
    }
    Pawn = none;
    //return;    
}

function WasKilledBy(Controller Other)
{
    //return;    
}

function Class<wWeapon> GetLastWeapon()
{
    // End:0x27
    if((Pawn == none) || Pawn.Weapon == none)
    {
        return LastPawnWeapon;
    }
    return Pawn.Weapon.Class;
    //return;    
}

function PawnDied(Pawn P)
{
    // End:0x11
    if(Pawn != P)
    {
        return;
    }
    // End:0x68
    if(Pawn != none)
    {
        Pawn.DeleteInventoriesFromStorage();
        // End:0x48
        if(Pawn.InCurrentCombo())
        {
            Adrenaline = 0.0000000;
        }
        SetLocation(Pawn.Location);
        Pawn.UnPossessed();
    }
    // End:0x79
    if(false == bIsPlayer)
    {
        Destroy();
        return;
    }
    // End:0x92
    if(Pawn.IsA('wBotVehicle'))
    {
        Destroy();
        return;
    }
    Pawn = none;
    PendingMover = none;
    // End:0xC3
    if(!IsInState('GameEnded') && !IsInState('RoundEnded'))
    {
        GotoState('Dead');
    }
    //return;    
}

function Restart()
{
    Enemy = none;
    //return;    
}

event LongFall()
{
    //return;    
}

event bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume)
{
    //return;    
}

event bool NotifyHeadVolumeChange(PhysicsVolume NewVolume)
{
    //return;    
}

event bool NotifyLanded(Vector HitNormal)
{
    //return;    
}

event NotifyPostLanded()
{
    //return;    
}

event bool NotifyHitWall(Vector HitNormal, Actor Wall)
{
    //return;    
}

event NotifyFallingHitWall(Vector HitNormal, Actor Wall)
{
    //return;    
}

event bool NotifyBump(Actor Other)
{
    //return;    
}

event NotifyHitMover(Vector HitNormal, Mover Wall)
{
    //return;    
}

event NotifyJumpApex()
{
    //return;    
}

event NotifyMissedJump()
{
    //return;    
}

function SetDoubleJump()
{
    //return;    
}

function NotifyAddInventory(Inventory NewItem)
{
    //return;    
}

function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, Class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    // End:0x2E
    if((instigatedBy != none) && instigatedBy != Pawn)
    {
        damageAttitudeTo(instigatedBy, float(Damage));
    }
    //return;    
}

function SetFall()
{
    //return;    
}

function PawnIsInPain(PhysicsVolume PainVolume)
{
    //return;    
}

function bool IsBehindView()
{
    return true;
    //return;    
}

function ServerSetOldRun(byte bSetVal, byte bHitVal)
{
    bOldRun = bSetVal;
    bHitRun = bHitVal;
    //return;    
}

function ServerSetVel(Vector Vel)
{
    Pawn.Velocity = Vel;
    //return;    
}

function NotifyChangeSprint(bool bValue)
{
    //return;    
}

function TickSprint(float DeltaTime)
{
    local PlayerInput pInput;
    local wGun Gun;
    local PlayerController PC;
    local float fStaminaRecovery;

    // End:0x1D
    if(Pawn == none)
    {
        bSprint = false;
        bRun = 0;
        return;
    }
    PC = Level.GetLocalPlayerController();
    // End:0x52
    if(PC != none)
    {
        pInput = PC.GetPlayerInput();
    }
    bOldRun = bRun;
    // End:0x166
    if(pInput != none)
    {
        // End:0xD3
        if((int(bRun) > 0) && pInput.bWasForward == false)
        {
            bOldRun = 0;
            // End:0xD0
            if((int(Role) < int(ROLE_Authority)) && Pawn.Acceleration != vect(0.0000000, 0.0000000, 0.0000000))
            {
                ServerSetOldRun(0, 0);
            }            
        }
        else
        {
            // End:0x133
            if((int(bRun) > 0) && pInput.bWasForward == true)
            {
                // End:0x133
                if((int(Role) < int(ROLE_Authority)) && Pawn.Acceleration != vect(0.0000000, 0.0000000, 0.0000000))
                {
                    ServerSetOldRun(1, 0);
                }
            }
        }
        // End:0x166
        if((bDClickMove == true) && pInput.bWasForward == false)
        {
            bOldRun = 0;
            bDClickMove = false;
        }
    }
    // End:0x216
    if(Pawn.Weapon != none)
    {
        Gun = wGun(Pawn.Weapon);
        // End:0x216
        if(((((Gun != none) && pInput != none) && int(Gun.ReloadState) == int(1)) && int(bRun) > 0) && pInput.bWasForward == true)
        {
            bDClickMove = false;
            bOldRun = 0;
            // End:0x216
            if(int(Role) < int(ROLE_Authority))
            {
                ServerSetOldRun(ROLE_None, ROLE_None);
            }
        }
    }
    // End:0x2CD
    if(bHit == true)
    {
        hit_gun_delta_Time += DeltaTime;
        // End:0x248
        if(hit_gun_delta_Time < hit_gun_move_time)
        {
            bOldRun = 0;            
        }
        else
        {
            // End:0x2CD
            if(hit_gun_delta_Time >= hit_gun_move_delay)
            {
                bHit = false;
                hit_gun_delta_Time = 0.0000000;
                // End:0x2CD
                if(((pInput != none) && int(bHitRun) > 0) && pInput.bWasForward == true)
                {
                    bOldRun = 1;
                    bRun = 1;
                    bHitRun = 0;
                    // End:0x2CD
                    if(int(Role) < int(ROLE_Authority))
                    {
                        ServerSetOldRun(ROLE_DumbProxy, ROLE_None);
                    }
                }
            }
        }
    }
    // End:0x2E3
    if(Pawn.IsA('Vehicle'))
    {
        return;
    }
    // End:0x351
    if(((Pawn != none) && SkillBase != none) && SkillBase.bAddStamina)
    {
        Pawn.wMyParam.Stm_MaxTime = Level.CharMgr.MyPlayer.Stm_MaxTime * 1.3000000;        
    }
    else
    {
        Pawn.wMyParam.Stm_MaxTime = Level.CharMgr.MyPlayer.Stm_MaxTime;
    }
    // End:0x3C7
    if(fSprintTime > Pawn.wMyParam.Stm_MaxTime)
    {
        fSprintTime = Pawn.wMyParam.Stm_MaxTime;
    }
    // End:0x637
    if((((int(bOldRun) != 0) || bDClickMove == true) && Pawn.Acceleration != vect(0.0000000, 0.0000000, 0.0000000)) && int(Pawn.Physics) == int(1))
    {
        byInputPosture = 0;
        // End:0x461
        if((Pawn.bIsCrouched == true) || Pawn.bIsProned == true)
        {
            Jump();
            SendMessageSprintTime();
            return;
        }
        // End:0x4C6
        if(Pawn.Weapon != none)
        {
            // End:0x4C6
            if((int(Pawn.Weapon.WeaponType) != int(17)) && Pawn.IsFiring() == true)
            {
                bRun = 0;
                bDClickMove = false;
                SendMessageSprintTime();
                return;
            }
        }
        fSprintTime -= DeltaTime;
        fSprintPassTime += DeltaTime;
        // End:0x4FB
        if(fSprintTime <= 0.0000000)
        {
            fSprintTime = 0.0000000;            
        }
        else
        {
            // End:0x5B7
            if(bSprint == false)
            {
                // End:0x5B0
                if((IsBehindView()) == false)
                {
                    // End:0x563
                    if((Pawn.PendingWeapon != none) && Pawn.PendingWeapon.GetSprint() == false)
                    {
                        Pawn.PendingWeapon.SetSprint(true);                        
                    }
                    else
                    {
                        // End:0x5B0
                        if((Pawn.Weapon != none) && Pawn.Weapon.GetSprint() == false)
                        {
                            Pawn.Weapon.SetSprint(true);
                        }
                    }
                }
                NotifyChangeSprint(true);
            }
            bSprint = true;
        }
        // End:0x5DB
        if(bSprint == false)
        {
            bRun = 0;
            bDClickMove = false;
        }
        // End:0x617
        if((int(bDuck) == 1) || int(bProne) == 1)
        {
            fSprintDelayTime = Pawn.wMyParam.Stm_Delay_Crouch;            
        }
        else
        {
            fSprintDelayTime = Pawn.wMyParam.Stm_Delay_Stand;
        }        
    }
    else
    {
        // End:0x83F
        if(fSprintTime < Pawn.wMyParam.Stm_MaxTime)
        {
            // End:0x7BD
            if((int(Pawn.Physics) == int(1)) || int(Pawn.Physics) == int(11))
            {
                // End:0x6C4
                if(fSprintDelayTime > 0.0000000)
                {
                    fSprintDelayTime -= DeltaTime;
                    // End:0x6C1
                    if(fSprintDelayTime < 0.0000000)
                    {
                        fSprintDelayTime = 0.0000000;
                    }                    
                }
                else
                {
                    // End:0x71E
                    if(Pawn.Weapon.BaseParams.fStaminaRecovery > 0.0000000)
                    {
                        fStaminaRecovery = 1.0000000 * Pawn.Weapon.BaseParams.fStaminaRecovery;                        
                    }
                    else
                    {
                        fStaminaRecovery = 1.0000000;
                    }
                    // End:0x765
                    if((SkillBase != none) && SkillBase.bAddStamina)
                    {
                        fSprintTime += ((DeltaTime * 1.2000000) * fStaminaRecovery);                        
                    }
                    else
                    {
                        fSprintTime += ((DeltaTime * 1.4000000) * fStaminaRecovery);
                    }
                    // End:0x7BD
                    if(fSprintTime > Pawn.wMyParam.Stm_MaxTime)
                    {
                        fSprintTime = Pawn.wMyParam.Stm_MaxTime;
                    }
                }
            }
            // End:0x820
            if(bSprint)
            {
                // End:0x7F3
                if(Pawn.Weapon != none)
                {
                    Pawn.Weapon.SetSprint(false);
                }
                // End:0x820
                if(Pawn.PendingWeapon != none)
                {
                    Pawn.PendingWeapon.SetSprint(false);
                }
            }
            bSprint = false;
            bRun = 0;
            bDClickMove = false;
            NotifyChangeSprint(false);
        }
    }
    // End:0x8DC
    if((Pawn != none) && Pawn.Weapon != none)
    {
        // End:0x8AB
        if((false == bSprint) && 1 == int(bySprintState))
        {
            bySaveFireState = bFire;
            fSprintStopTime = Level.TimeSeconds;
            bySprintState = 2;
            SendMessageSprintTime();            
        }
        else
        {
            // End:0x8DC
            if(((0 < int(bRun)) || bDClickMove == true) && true == bSprint)
            {
                bySprintState = 1;
            }
        }
    }
    //return;    
}

function SendMessageSprintTime()
{
    local int iSendSprintTime;

    iSendSprintTime = int(fSprintPassTime);
    // End:0x52
    if(iSendSprintTime > 0)
    {
        self.ReceiveMessage_QuestType2(Class'Engine_Decompressed.wMessage_Quest', Class'Engine_Decompressed.wMessage_Quest'.default.Code_Quest_SprintTime,,,, iSendSprintTime);
        fSprintPassTime = fSprintPassTime - float(iSendSprintTime);
    }
    //return;    
}

function TickStance(float DeltaTime)
{
    local bool OldCrouch, OldProne;

    // End:0x0D
    if(Pawn == none)
    {
        return;
    }
    // End:0xDF
    if(Pawn.bIsCrouching == true)
    {
        fCrouchingTimeCount += DeltaTime;
        // End:0xDC
        if(fCrouchingTimeCount >= fCrouchingTimeLimit)
        {
            Pawn.bIsCrouching = false;
            fCrouchingTimeCount = 0.0000000;
            // End:0xCD
            if(((int(bProne) != 1) && int(bDuck) == 1) && int(bGotoProne) != 0)
            {
                // End:0xAC
                if(int(bGotoProne) == 1)
                {
                    byGoCrouch = 0;
                    byGoProne = 1;
                    bProne = 1;                    
                }
                else
                {
                    // End:0xCA
                    if(int(bGotoProne) == 2)
                    {
                        byGoCrouch = 0;
                        bDuck = 0;
                    }
                }                
            }
            else
            {
                Pawn.ServerRefreshCollisionHash();
            }
        }        
    }
    else
    {
        // End:0x13D
        if(Pawn.bIsProning == true)
        {
            fProningTimeCount += DeltaTime;
            // End:0x13A
            if(fProningTimeCount >= fProningTimeLimit)
            {
                Pawn.bIsProning = false;
                fProningTimeCount = 0.0000000;
                Pawn.ServerRefreshCollisionHash();
            }            
        }
        else
        {
            // End:0x198
            if(Pawn.bIsStanding == true)
            {
                fStandingTimeCount += DeltaTime;
                // End:0x198
                if(fStandingTimeCount >= fCrouchingTimeLimit)
                {
                    Pawn.bIsStanding = false;
                    fStandingTimeCount = 0.0000000;
                    Pawn.ServerRefreshCollisionHash();
                }
            }
        }
    }
    // End:0x29F
    if(int(Pawn.Physics) != int(2))
    {
        OldCrouch = Pawn.bWantsToCrouch;
        OldProne = Pawn.bWantsToProne;
        // End:0x219
        if(int(byGoProne) == 1)
        {
            // End:0x216
            if((int(bProne) == 0) && Pawn.bIsCrouching == false)
            {
                bProne = 1;
            }            
        }
        else
        {
            // End:0x274
            if(int(byGoCrouch) == 1)
            {
                // End:0x271
                if((Pawn.bIsProning == false) && Pawn.bIsCrouching == false)
                {
                    // End:0x269
                    if(OldProne == true)
                    {
                        bProne = 0;                        
                    }
                    else
                    {
                        bDuck = 1;
                    }
                }                
            }
            else
            {
                // End:0x29F
                if((Pawn.bIsCrouching == false) && OldCrouch == true)
                {
                    bDuck = 0;
                }
            }
        }
    }
    //return;    
}

exec function Jump(optional float f)
{
    //return;    
}

function HandleWalking()
{
    // End:0x4F
    if(Pawn != none)
    {
        Pawn.SetSprinting(((int(bOldRun) > 0) || bDClickMove == true) && !Region.Zone.IsA('WarpZoneInfo'));
    }
    //return;    
}

event PreBeginPlay()
{
    Log("[Controller::PreBeginPlay]");
    AddController();
    super.PreBeginPlay();
    // End:0x32
    if(bDeleteMe)
    {
        return;
    }
    SightCounter = 0.2000000 * FRand();
    //return;    
}

event PostBeginPlay()
{
    Log("[Controller::PostBeginPlay]");
    super.PostBeginPlay();
    // End:0x86
    if((!bDeleteMe && bIsPlayer) && int(Level.NetMode) != int(NM_Client))
    {
        PlayerReplicationInfo = Spawn(PlayerReplicationInfoClass, self,, vect(0.0000000, 0.0000000, 0.0000000), rot(0, 0, 0));
        InitPlayerReplicationInfo();
    }
    //return;    
}

function InitPlayerReplicationInfo()
{
    Log("[Controller::InitPlayerReplicationInfo]");
    // End:0xA2
    if(PlayerReplicationInfo.PlayerName == "")
    {
        PlayerReplicationInfo.SetPlayerName(Class'Engine_Decompressed.GameInfo'.default.DefaultPlayerName);
        Log("set default player name. PlayerReplicationInfo.PlayerName is NULL");
    }
    PlayerReplicationInfo.bNoTeam = !Level.Game.bTeamGame;
    //return;    
}

// Export UController::execGetTeamNum(FFrame&, void* const)
native simulated function int GetTeamNum();

function bool SameTeamAs(Controller C)
{
    // End:0x0D
    if(C == none)
    {
        return false;
    }
    return Level.Game.IsOnTeam(C, GetTeamNum());
    //return;    
}

function HandlePickup(Pickup pick)
{
    // End:0x6D
    if(MoveTarget == pick)
    {
        // End:0x62
        if(pick.myMarker != none)
        {
            MoveTarget = pick.myMarker;
            Pawn.Anchor = pick.myMarker;
            MoveTimer = 0.5000000;            
        }
        else
        {
            MoveTimer = -1.0000000;
        }
    }
    //return;    
}

event DestroyPlayerReplicationInfo()
{
    // End:0x9B
    if(PlayerReplicationInfo != none)
    {
        Log("[CYH] Playercontroller::DestroyPlayerReplicationInfo()");
        // End:0x88
        if(!PlayerReplicationInfo.bOnlySpectator && PlayerReplicationInfo.Team != none)
        {
            PlayerReplicationInfo.Team.RemoveFromTeam(self);
        }
        PlayerReplicationInfo.Destroy();
        PlayerReplicationInfo = none;
    }
    //return;    
}

simulated event Destroyed()
{
    // End:0x18
    if(int(Role) < int(ROLE_Authority))
    {
        super.Destroyed();
        return;
    }
    RemoveController();
    // End:0x53
    if(bIsPlayer && Level.Game != none)
    {
        Level.Game.Logout(self);
    }
    DestroyPlayerReplicationInfo();
    super.Destroyed();
    //return;    
}

event bool AllowDetourTo(NavigationPoint N)
{
    return true;
    //return;    
}

event AdjustView(float DeltaTime)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:

    // End:0x6B [Loop If]
    if(C != none)
    {
        // End:0x54
        if(C.IsA('PlayerController') && PlayerController(C).ViewTarget == Pawn)
        {
            return;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    Pawn.bUpdateEyeheight = false;
    Pawn.EyeHeight = Pawn.BaseEyeHeight;
    //return;    
}

function bool WantsSmoothedView()
{
    return ((Pawn != none) && (int(Pawn.Physics) == int(1)) || int(Pawn.Physics) == int(9)) && !Pawn.bJustLanded;
    //return;    
}

// Export UController::execWantsSmoothedViewNative(FFrame&, void* const)
native function bool WantsSmoothedViewNative();

function GameHasEnded()
{
    // End:0x1C
    if(Pawn != none)
    {
        Pawn.bNoWeaponFiring = true;
    }
    GotoState('GameEnded');
    //return;    
}

function ClientGameEnded()
{
    GotoState('GameEnded');
    //return;    
}

function RoundHasEnded()
{
    // End:0x1C
    if(Pawn != none)
    {
        Pawn.bNoWeaponFiring = true;
    }
    GotoState('RoundEnded');
    //return;    
}

function ClientRoundEnded()
{
    GotoState('RoundEnded');
    StopPawnsAndControllers();
    //return;    
}

simulated function StopPawnsAndControllers()
{
    //return;    
}

simulated event RenderOverlays(Canvas Canvas)
{
    //return;    
}

simulated function RenderSpectatorFPWeapon(Canvas Canvas, bool bClearedZBuffer)
{
    //return;    
}

function int GetFacingDirection()
{
    return 0;
    //return;    
}

function byte GetMessageIndex(name PhraseName)
{
    return 0;
    //return;    
}

function SendMessage(PlayerReplicationInfo Recipient, name MessageType, byte MessageID, float wait, name BroadcastType)
{
    SendVoiceMessage(PlayerReplicationInfo, Recipient, MessageType, MessageID, BroadcastType);
    //return;    
}

function bool AllowVoiceMessage(name MessageType)
{
    // End:0x23
    if((Level.TimeSeconds - OldMessageTime) < float(10))
    {
        return false;        
    }
    else
    {
        OldMessageTime = Level.TimeSeconds;
    }
    return true;
    //return;    
}

function SendVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte MessageID, name BroadcastType)
{
    local Controller P;

    // End:0x2D
    if(((Recipient == none) || AIController(self) == none) && !AllowVoiceMessage(MessageType))
    {
        return;
    }
    P = Level.ControllerList;
    J0x41:

    // End:0x267 [Loop If]
    if(P != none)
    {
        // End:0x200
        if(PlayerController(P) != none)
        {
            // End:0x108
            if((P.PlayerReplicationInfo == Sender) || (P.PlayerReplicationInfo == Recipient) && (Level.Game.BroadcastHandler == none) || Level.Game.BroadcastHandler.AcceptBroadcastSpeech(PlayerController(P), Sender))
            {
                P.ClientVoiceMessage(Sender, Recipient, MessageType, MessageID);                
            }
            else
            {
                // End:0x1FD
                if((Recipient == none) || int(Level.NetMode) == int(NM_Standalone))
                {
                    // End:0x1FD
                    if(((BroadcastType == 'Global') || !Level.Game.bTeamGame) || Sender.Team == P.PlayerReplicationInfo.Team)
                    {
                        // End:0x1FD
                        if((Level.Game.BroadcastHandler == none) || Level.Game.BroadcastHandler.AcceptBroadcastSpeech(PlayerController(P), Sender))
                        {
                            P.ClientVoiceMessage(Sender, Recipient, MessageType, MessageID);
                        }
                    }
                }
            }            
        }
        else
        {
            // End:0x250
            if((MessageType == 'Order') && (Recipient == none) || Recipient == P.PlayerReplicationInfo)
            {
                P.BotVoiceMessage(MessageType, MessageID, self);
            }
        }
        P = P.nextController;
        // [Loop Continue]
        goto J0x41;
    }
    //return;    
}

function ClientVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte MessageID)
{
    //return;    
}

function BotVoiceMessage(name MessageType, byte MessageID, Controller Sender)
{
    //return;    
}

function bool WouldReactToNoise(float Loudness, Actor NoiseMaker)
{
    return false;
    //return;    
}

function bool WouldReactToSeeing(Pawn Seen)
{
    return false;
    //return;    
}

function Vector AdjustToss(float TSpeed, Vector Start, Vector End, bool bNormalize)
{
    local Vector Dest2D, Result, Vel2D;
    local float Dist2D;

    // End:0xEA
    if(Start.Z > (End.Z + float(64)))
    {
        Dest2D = End;
        Dest2D.Z = Start.Z;
        Dist2D = VSize(Dest2D - Start);
        TSpeed *= (Dist2D / VSize(End - Start));
        Result = SuggestFallVelocity(Dest2D, Start, TSpeed, TSpeed);
        Vel2D = Result;
        Vel2D.Z = 0.0000000;
        Result.Z = Result.Z + (((End.Z - Start.Z) * VSize(Vel2D)) / Dist2D);        
    }
    else
    {
        Result = SuggestFallVelocity(End, Start, TSpeed, TSpeed);
    }
    // End:0x125
    if(bNormalize)
    {
        return TSpeed * Normal(Result);        
    }
    else
    {
        return Result;
    }
    //return;    
}

event PrepareForMove(NavigationPoint Goal, ReachSpec Path)
{
    //return;    
}

function WaitForMover(Mover M)
{
    //return;    
}

function MoverFinished()
{
    //return;    
}

function UnderLift(Mover M)
{
    //return;    
}

function FearThisSpot(AvoidMarker aSpot)
{
    local int i;

    // End:0x0D
    if(Pawn == none)
    {
        return;
    }
    // End:0x1C
    if(!LineOfSightTo(aSpot))
    {
        return;
    }
    i = 0;
    J0x23:

    // End:0x5D [Loop If]
    if(i < 2)
    {
        // End:0x53
        if(FearSpots[i] == none)
        {
            FearSpots[i] = aSpot;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x23;
    }
    i = 0;
    J0x64:

    // End:0xD8 [Loop If]
    if(i < 2)
    {
        // End:0xCE
        if(VSize(Pawn.Location - FearSpots[i].Location) > VSize(Pawn.Location - aSpot.Location))
        {
            FearSpots[i] = aSpot;
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x64;
    }
    //return;    
}

event float Desireability(Pickup P)
{
    return P.BotDesireability(Pawn);
    //return;    
}

event float SuperDesireability(Pickup P)
{
    return P.BotDesireability(Pawn);
    //return;    
}

event SetupSpecialPathAbilities()
{
    //return;    
}

event HearNoise(float Loudness, Actor NoiseMaker)
{
    //return;    
}

event SeePlayer(Pawn Seen)
{
    //return;    
}

event SeeMonster(Pawn Seen)
{
    //return;    
}

event EnemyNotVisible()
{
    //return;    
}

function DamageShake(int Damage)
{
    //return;    
}

function ShakeView(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime)
{
    //return;    
}

function OnEndRound()
{
    // End:0x2C
    if((SkillBase != none) && int(Role) == int(ROLE_Authority))
    {
        SkillBase.UpdateProcess();
    }
    super.OnEndRound();
    //return;    
}

function NotifyKilled(Controller Killer, Controller Killed, Pawn Other)
{
    // End:0x16
    if(Enemy == Other)
    {
        Enemy = none;
    }
    //return;    
}

function damageAttitudeTo(Pawn Other, float Damage)
{
    //return;    
}

function float AdjustDesireFor(Pickup P)
{
    //return;    
}

function bool FireWeaponAt(Actor A)
{
    //return;    
}

function StopFiring()
{
    // End:0x1A
    if(Pawn != none)
    {
        Pawn.StopWeaponFiring();
    }
    bFire = 0;
    bAltFire = 0;
    bMeleeFire = 0;
    //return;    
}

simulated function float RateWeapon(wWeapon W)
{
    return float(W.default.Priority);
    //return;    
}

function float WeaponPreference(wWeapon W)
{
    return 0.0000000;
    //return;    
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    return Rotation;
    //return;    
}

function InstantWarnTarget(Actor Target, FireProperties FiredAmmunition, Vector FireDir)
{
    local float dist;

    // End:0xD3
    if((FiredAmmunition.bInstantHit && Pawn(Target) != none) && Pawn(Target).Controller != none)
    {
        dist = VSize(Pawn.Location - Target.Location);
        // End:0x94
        if(VSize((FireDir * dist) - Target.Location) < Target.CollisionRadius)
        {
            return;
        }
        // End:0xD1
        if(FRand() < FiredAmmunition.WarnTargetPct)
        {
            Pawn(Target).Controller.ReceiveWarning(Pawn, -1.0000000, FireDir);
        }
        return;
    }
    //return;    
}

event ReceiveWarning(Pawn shooter, float projSpeed, Vector FireDir)
{
    //return;    
}

function ReceiveProjectileWarning(Projectile proj)
{
    // End:0x3D
    if(WarningProjectile == none)
    {
        ReceiveWarning(proj.Instigator, proj.Speed, Normal(proj.Velocity));
    }
    //return;    
}

event DelayedWarning()
{
    //return;    
}

exec function SwitchToBestWeapon()
{
    local float rating;

    // End:0x23
    if((Pawn == none) || Pawn.Inventory == none)
    {
        return;
    }
    // End:0xB8
    if((Pawn.PendingWeapon == none) || AIController(self) != none)
    {
        Pawn.PendingWeapon = Pawn.Inventory.RecommendWeapon(rating);
        // End:0xA2
        if(Pawn.PendingWeapon == Pawn.Weapon)
        {
            Pawn.PendingWeapon = none;
        }
        // End:0xB8
        if(Pawn.PendingWeapon == none)
        {
            return;
        }
    }
    StopFiring();
    // End:0xE4
    if(Pawn.Weapon == none)
    {
        Pawn.ChangedWeapon();        
    }
    else
    {
        // End:0x11D
        if(Pawn.Weapon != Pawn.PendingWeapon)
        {
            Pawn.Weapon.PutDown();
        }
    }
    //return;    
}

function ClientSwitchToBestWeapon()
{
    SwitchToBestWeapon();
    //return;    
}

function ClientSetWeapon(Class<wWeapon> WeaponClass)
{
    local Inventory Inv;
    local int Count;

    Inv = Pawn.Inventory;
    J0x14:

    // End:0xFB [Loop If]
    if(Inv != none)
    {
        Count++;
        // End:0x37
        if(Count > 1000)
        {
            return;
        }
        // End:0x55
        if(!ClassIsChildOf(Inv.Class, WeaponClass))
        {            
        }
        else
        {
            // End:0x94
            if(Pawn.Weapon == none)
            {
                Pawn.PendingWeapon = wWeapon(Inv);
                Pawn.ChangedWeapon();                
            }
            else
            {
                // End:0xE2
                if(Pawn.Weapon != wWeapon(Inv))
                {
                    Pawn.PendingWeapon = wWeapon(Inv);
                    Pawn.Weapon.PutDown();
                }
            }
            return;
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function SetPawnClass(string inClass, string InCharacter)
{
    local Class<Pawn> pClass;

    // End:0x0E
    if(inClass == "")
    {
        return;
    }
    pClass = Class<Pawn>(DynamicLoadObject(inClass, Class'Core.Class'));
    // End:0x3F
    if(pClass != none)
    {
        PawnClass = pClass;
    }
    //return;    
}

function SetPawnFemale()
{
    //return;    
}

function SetCaller(Controller C)
{
    Caller = C;
    // End:0x19
    if(none == Pawn)
    {        
    }
    else
    {
        Pawn.OwnerName = C.PlayerReplicationInfo.PlayerName;
    }
    //return;    
}

function bool CheckFutureSight(float DeltaTime)
{
    return true;
    //return;    
}

function PlayerReplicationInfo GetPRI()
{
    return PlayerReplicationInfo;
    //return;    
}

function ChangedWeapon()
{
    // End:0x31
    if(Pawn.Weapon != none)
    {
        LastPawnWeapon = Pawn.Weapon.Class;
    }
    //return;    
}

function ServerReStartPlayer()
{
    // End:0x1B
    if(int(Level.NetMode) == int(NM_Client))
    {
        return;
    }
    // End:0x2C
    if(Pawn != none)
    {
        ServerGivePawn();
    }
    //return;    
}

function ServerGivePawn()
{
    //return;    
}

event MonitoredPawnAlert()
{
    //return;    
}

function StartMonitoring(Pawn P, float MaxDist)
{
    MonitoredPawn = P;
    MonitorStartLoc = P.Location;
    MonitorMaxDistSq = MaxDist * MaxDist;
    //return;    
}

function bool AutoTaunt()
{
    return false;
    //return;    
}

function bool DontReuseTaunt(int t)
{
    return false;
    //return;    
}

function string ParseChatPercVar(string Cmd)
{
    // End:0x26
    if(Cmd ~= "%A")
    {
        return string(int(Adrenaline)) @ "Adrenaline";
    }
    // End:0x5E
    if((Pawn != none) && Cmd ~= "%S")
    {
        return string(int(Pawn.ShieldStrength)) @ "Shield";
    }
    return Cmd;
    //return;    
}

exec function WeaponReload()
{
    local wGun Gun;

    Gun = wGun(Pawn.Weapon);
    // End:0x26
    if(Gun == none)
    {
        return;
    }
    Gun.Reload();
    //return;    
}

exec function SetMoveAtt(string gmv, string gmt, string gmd, bool isSet)
{
    bSet = isSet;
    hit_gun_move_delay = float(gmd);
    hit_gun_move_speed = float(gmv);
    hit_gun_move_time = float(gmt);
    clog("Change Move Att = " $ Pawn.OwnerName);
    //return;    
}

function StopAllSoundHK(Actor aactor)
{
    local Controller C;

    // End:0x12
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    C = Level.ControllerList;
    J0x26:

    // End:0x61 [Loop If]
    if(C != none)
    {
        PlayerController(C).ClientStopAllSound(aactor);
        C = C.nextController;
        // [Loop Continue]
        goto J0x26;
    }
    //return;    
}

function ClientStopAllSound(Actor aactor)
{
    local Actor A;

    // End:0x32
    foreach DynamicActors(Class'Engine_Decompressed.Actor', A)
    {
        // End:0x31
        if(A == aactor)
        {
            A.StopAllSoundByActor();
            // End:0x32
            break;
        }        
    }    
    //return;    
}

simulated function ClientOnBeginWaitingForStart()
{
    Log("[Controller::ClientOnBeginWaitingForStart] " $ PlayerReplicationInfo.PlayerName);
    // End:0x58
    if(!self.IsInState('WaitingForStart'))
    {
        GotoState('WaitingForStart');
    }
    //return;    
}

simulated function ClientOnEndWaitingForStart()
{
    Log("[Controller::ClientOnEndWaitingForStart] " $ PlayerReplicationInfo.PlayerName);
    // End:0x6C
    if((int(Level.GetMatchMaker().GMLevelFlag) & 2) == 2)
    {
        GotoState('SpectatingGM');        
    }
    else
    {
        // End:0x92
        if(!self.IsInState('PlayerWalking') && Pawn != none)
        {
            GotoState('PlayerWalking');
        }
    }
    //return;    
}

simulated function ClientOnBeginRound()
{
    Log("[Controller::ClientOnBeginRound] " $ PlayerReplicationInfo.PlayerName);
    // End:0x4E
    if(!self.IsInState('PlayerWalking'))
    {
        GotoState('PlayerWalking');
    }
    //return;    
}

simulated function ClientOnBeginIntervented()
{
    //return;    
}

simulated function ClientOnEndIntervented()
{
    //return;    
}

simulated function ClientCallCoolTimeSkill(int iSkillID)
{
    //return;    
}

function CallCoolTimeSkill(int iSkillID)
{
    //return;    
}

simulated function ClientReadyCoolTimeSkill(int iSkillID)
{
    //return;    
}

function ZoomFOV(float fFOV, bool bInstant)
{
    //return;    
}

function bool CanUseActivateSupplyItem(Controller callingController, Object.ESUPPLY_ITEM_TYPE eSupplyItemType, optional bool bShowMessage)
{
    //return;    
}

function bool ActivateSupplyItem(Controller callingController, Object.ESUPPLY_ITEM_TYPE eSupplyItemType)
{
    //return;    
}

function bool IsActiveAirFire()
{
    return false;
    //return;    
}

function bool IsActiveHelicopter()
{
    return false;
    //return;    
}

function bool IsActiveUAV()
{
    return false;
    //return;    
}

function bool IsActiveMyTeamSentryGun()
{
    return false;
    //return;    
}

function ServerCallUAV()
{
    local Controller P;
    local int CurrentTime;

    Log("[wPlayer::ServerCallUAV]");
    PlayerReplicationInfo.abySupplyItemFlag[int(1)] = 0;
    CurrentTime = Level.GRI.ElapsedTime;
    PlayerReplicationInfo.Team.SetUAV();
    P = Level.ControllerList;
    J0x7B:

    // End:0x158 [Loop If]
    if(P != none)
    {
        // End:0x141
        if(P != none)
        {
            // End:0x106
            if(P.GetTeamNum() == (GetTeamNum()))
            {
                // End:0xE6
                if(P.IsA('PlayerController'))
                {
                    PlayerController(P).ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', Class'Engine_Decompressed.wMessage_Game'.default.Code_OurUAVOnline);
                }
                P.ClientUAV(Class'Engine_Decompressed.GameInfo'.default.UAVDuration);                
            }
            else
            {
                // End:0x141
                if(P.IsA('PlayerController'))
                {
                    PlayerController(P).ReceiveLocalizedMessage(Class'Engine_Decompressed.wMessage_Game', Class'Engine_Decompressed.wMessage_Game'.default.Code_EnemyUAVOnline);
                }
            }
        }
        P = P.nextController;
        // [Loop Continue]
        goto J0x7B;
    }
    Level.Game.AnnounceUAV(self);
    //return;    
}

function ServerCallAirStrike(optional Controller Caller)
{
    //return;    
}

function Vector CalcAirStrikeLocation(float fMaxDist)
{
    local Vector vMin, vMax;
    local int lp1, lp2, lpCount;
    local array<Vector> vLocationList, vUsalLocationList;
    local Vector HitLocation;
    local array<Actor> wEnemys;
    local wMatchMaker kMM;
    local NavigationPoint naviPoint;
    local bool bCheck;
    local array<NavigationPoint> selectedRespawndPos;

    bCheck = false;
    lpCount = 0;
    kMM = Level.GetMatchMaker();
    // End:0x77
    if(kMM.kGame_GameMode == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Defence())
    {
        wEnemys = Level.Game.GetDefenceModeEnemyList(byte(Pawn.TeamIndex));        
    }
    else
    {
        // End:0x16C
        if(((((kMM.kGame_GameMode == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_TeamDeath()) || kMM.kGame_GameMode == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Domination()) || kMM.kGame_GameMode == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotTeamDeath()) || kMM.kGame_GameMode == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_BotDomination()) || kMM.kGame_GameMode == Class'Engine_Decompressed.wGameSettings'.static.GetModeIndex_Alien())
        {
            wEnemys = Level.Game.GetEveryEnemyList2(byte(Pawn.PlayerReplicationInfo.Team.TeamIndex));            
        }
        else
        {
            wEnemys = Level.Game.GetPersonalEnemyList(Pawn);
        }
    }
    // End:0x412
    if(wEnemys.Length >= 2)
    {
        // End:0x1D1
        if(Pawn.GetTeamNum() == 0)
        {
            selectedRespawndPos = Level.Game.recentlySpawnedPointsTeamRSA;            
        }
        else
        {
            selectedRespawndPos = Level.Game.recentlySpawnedPointsTeamAF;
        }
        lp1 = 0;
        J0x1F5:

        // End:0x29A [Loop If]
        if(lp1 < wEnemys.Length)
        {
            lp2 = 0;
            J0x20C:

            // End:0x25F [Loop If]
            if(lp2 < selectedRespawndPos.Length)
            {
                // End:0x255
                if(VSize(selectedRespawndPos[lp2].Location - wEnemys[lp1].Location) <= fMaxDist)
                {
                    // [Explicit Break]
                    goto J0x25F;
                }
                ++lp2;
                // [Loop Continue]
                goto J0x20C;
            }
            J0x25F:

            // End:0x290
            if(lp2 == selectedRespawndPos.Length)
            {
                vLocationList[vLocationList.Length] = wEnemys[lp1].Location;
            }
            ++lp1;
            // [Loop Continue]
            goto J0x1F5;
        }
        lp1 = 0;
        J0x2A1:

        // End:0x39E [Loop If]
        if(lp1 < vLocationList.Length)
        {
            vUsalLocationList.Length = 0;
            lp2 = 0;
            J0x2C0:

            // End:0x343 [Loop If]
            if(lp2 < vLocationList.Length)
            {
                // End:0x2E2
                if(lp1 == lp2)
                {
                    // [Explicit Continue]
                    goto J0x339;
                }
                HitLocation = vLocationList[lp1] - vLocationList[lp2];
                HitLocation.Z = 0.0000000;
                // End:0x339
                if(VSize(HitLocation) <= fMaxDist)
                {
                    vUsalLocationList[vUsalLocationList.Length] = vLocationList[lp2];
                }
                J0x339:

                ++lp2;
                // [Loop Continue]
                goto J0x2C0;
            }
            vUsalLocationList[vUsalLocationList.Length] = vLocationList[lp1];
            // End:0x394
            if(vUsalLocationList.Length > lpCount)
            {
                ClipAirStrikeLocation(vMin, vMax, vUsalLocationList);
                bCheck = true;
                lpCount = vUsalLocationList.Length;
            }
            ++lp1;
            // [Loop Continue]
            goto J0x2A1;
        }
        // End:0x3BF
        if(bCheck == false)
        {
            ClipAirStrikeLocation(vMin, vMax, vLocationList);
        }
        HitLocation.X = (vMin.X + vMax.X) * 0.5000000;
        HitLocation.Y = (vMin.Y + vMax.Y) * 0.5000000;        
    }
    else
    {
        // End:0x461
        if(wEnemys.Length == 1)
        {
            HitLocation.X = wEnemys[0].Location.X;
            HitLocation.Y = wEnemys[0].Location.Y;            
        }
        else
        {
            // End:0x543
            if(Level.Game.DeathPos.Length >= 1)
            {
                vLocationList = Level.Game.GetDeathPosArray();
                // End:0x512
                if(vLocationList.Length >= 2)
                {
                    ClipAirStrikeLocation(vMin, vMax, vLocationList);
                    HitLocation.X = (vMin.X + vMax.X) * 0.5000000;
                    HitLocation.Y = (vMin.Y + vMax.Y) * 0.5000000;                    
                }
                else
                {
                    HitLocation.X = vLocationList[0].X;
                    HitLocation.Y = vLocationList[0].Y;
                }                
            }
            else
            {
                // End:0x5B8
                if((Level.Game.NumPlayers + Level.Game.NumBots) == 1)
                {
                    HitLocation.X = Pawn.Location.X;
                    HitLocation.Y = Pawn.Location.Y;                    
                }
                else
                {
                    lp1 = Pawn.PlayerReplicationInfo.Team.TeamIndex;
                    // End:0x61A
                    if(kMM.kGame_GameMode == int(kMM.0))
                    {
                        // End:0x613
                        if(lp1 == 0)
                        {
                            lp1 = 1;                            
                        }
                        else
                        {
                            lp1 = 0;
                        }
                    }
                    naviPoint = Level.Game.FindPlayerStart(none, byte(lp1));
                    HitLocation.X = naviPoint.Location.X;
                    HitLocation.Y = naviPoint.Location.Y;
                }
            }
        }
    }
    HitLocation.Z = (Pawn.Location.Z + Pawn.EyePosition().Z) + 3000.0000000;
    return HitLocation;
    //return;    
}

function ClipAirStrikeLocation(out Vector vMin, out Vector vMax, array<Vector> vLocation)
{
    local int i;

    vMin.X = 99999.0000000;
    vMin.Y = 99999.0000000;
    vMax.X = -99999.0000000;
    vMax.Y = -99999.0000000;
    i = 0;
    J0x47:

    // End:0x149 [Loop If]
    if(i < vLocation.Length)
    {
        // End:0x91
        if(vMin.X > vLocation[i].X)
        {
            vMin.X = vLocation[i].X;
        }
        // End:0xCB
        if(vMin.Y > vLocation[i].Y)
        {
            vMin.Y = vLocation[i].Y;
        }
        // End:0x105
        if(vMax.X < vLocation[i].X)
        {
            vMax.X = vLocation[i].X;
        }
        // End:0x13F
        if(vMax.Y < vLocation[i].Y)
        {
            vMax.Y = vLocation[i].Y;
        }
        ++i;
        // [Loop Continue]
        goto J0x47;
    }
    //return;    
}

simulated event ReceiveMessage_QuestType1(Class<wMessage_Quest> Message, optional int Switch, optional int iRWeaponType, optional int iRweaponId)
{
    //return;    
}

simulated event ReceiveMessage_QuestType2(Class<wMessage_Quest> Message, optional int Switch, optional int iRMode, optional int iRMap, optional int iRMin, optional int iRSec)
{
    //return;    
}

simulated event ReceiveMessage_QuestType3(Class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRMap)
{
    //return;    
}

simulated event ReceiveMessage_QuestType4(Class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRRound)
{
    //return;    
}

simulated function bool AllowFire()
{
    return true;
    //return;    
}

simulated function ClientUAV(int UAVDuration)
{
    local float uavEndTime;

    // End:0x39
    if(PlayerReplicationInfo == none)
    {
        // End:0x28
        if(UAVQueue < float(0))
        {
            UAVQueue = float(UAVDuration);            
        }
        else
        {
            UAVQueue += float(UAVDuration);
        }        
    }
    else
    {
        // End:0xDC
        if((PlayerReplicationInfo.UAVScanBeginTime <= Level.PlayTimeSeconds) && Level.PlayTimeSeconds <= PlayerReplicationInfo.UAVScanEndTime)
        {
            uavEndTime = PlayerReplicationInfo.UAVScanEndTime;
            PlayerReplicationInfo.ServerSetUAV(PlayerReplicationInfo.UAVScanBeginTime, uavEndTime + float(UAVDuration));
            PlayerReplicationInfo.UAVScanEndTime = uavEndTime + float(UAVDuration);            
        }
        else
        {
            PlayerReplicationInfo.UAVScanBeginTime = Level.PlayTimeSeconds;
            PlayerReplicationInfo.UAVScanEndTime = Level.PlayTimeSeconds + float(UAVDuration);
            PlayerReplicationInfo.ServerSetUAV(Level.PlayTimeSeconds, Level.PlayTimeSeconds + float(UAVDuration));
        }
    }
    //return;    
}

function NotifyVehicle(Vehicle V)
{
    //return;    
}

function Controller GetCaller()
{
    return Caller;
    //return;    
}

function bool IsFinishSpecificBoneRotate()
{
    return true;
    //return;    
}

function bool IsPermitSpecialMode(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType, optional int KeyF)
{
    return false;
    //return;    
}

function bool IsSpecialMode_Knife(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
    //return;    
}

function bool IsSpecialMode_RPG(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
    //return;    
}

function bool IsSpecialMode_SR(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
    //return;    
}

function bool IsSpecialMode_Hold_Weapon(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
    //return;    
}

function bool IsSpecialMode_SG(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
    //return;    
}

function bool IsSpecialMode_FlameThrower(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
    //return;    
}

function bool IsSpecialMode_MG(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
    //return;    
}

function bool IsSpecialMode_Grenade(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
    //return;    
}

function bool IsSpecialMode_Pistol(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
    //return;    
}

simulated function SkillUsedByWeapon(int iWeaponID)
{
    // End:0x1B
    if(int(Role) < int(ROLE_Authority))
    {
        ServerSkillUsedByWeapon(iWeaponID);
    }
    SkillBase.UsedbyWeapon(iWeaponID);
    //return;    
}

function ServerSkillUsedByWeapon(int iWeaponID)
{
    SkillBase.UsedbyWeapon(iWeaponID);
    //return;    
}

simulated function SetActiveSkill(int SkillID)
{
    SkillBase.SetActiveSkill(SkillID);
    //return;    
}

simulated function ClientEnableSkill(int SkillID)
{
    SkillBase.ClientEnableSkill(SkillID);
    //return;    
}

simulated function ChangeSkillAddValue(int SkillID, int addValue)
{
    SkillBase.Client_ChangeAddValue(SkillID, addValue);
    //return;    
}

state Dead
{
    ignores ServerReStartPlayer, PawnDied;

    function PawnDied(Pawn P)
    {
        // End:0x36
        if(int(Level.NetMode) != int(NM_Client))
        {
            Warn(string(self) $ " Pawndied while dead");
        }
        //return;        
    }

    function ServerReStartPlayer()
    {
        // End:0x1B
        if(int(Level.NetMode) == int(NM_Client))
        {
            return;
        }
        Level.Game.RestartPlayer(self);
        //return;        
    }
    stop;    
}

state RoundEnded
{    stop;    
}

defaultproperties
{
    BtrUpdateFrequency=100.0000000
    FovAngle=90.0000000
    Handedness=1.0000000
    bSlowerZAcquire=true
    fSprintTime=999.0000000
    MinHitWall=-1.0000000
    AcquisitionYawRate=20000
    PlayerReplicationInfoClass=Class'Engine_Decompressed.PlayerReplicationInfo'
    AdrenalineMax=100.0000000
    hit_gun_move_speed=1.0000000
    bHidden=true
    bOnlyRelevantToOwner=true
    RemoteRole=0
    RotationRate=(Pitch=3072,Yaw=30000,Roll=2048)
    bHiddenEd=true
}