/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Controller.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:134
 *	Functions:181
 *	States:2
 *
 *******************************************************************************/
class Controller extends Actor
    dependson(PlayerReplicationInfo)
    dependson(GameReplicationInfo)
    dependson(TeamInfo)
    dependson(wMessage_Game)
    dependson(GameInfo)
    dependson(wMatchMaker)
    dependson(wGun)
    dependson(wWeapon)
    dependson(Inventory)
    dependson(Projectile)
    dependson(Pickup)
    dependson(AvoidMarker)
    dependson(BroadcastHandler)
    dependson(ZoneInfo)
    dependson(wMessage_Quest)
    dependson(PlayerInput)
    dependson(wSkillBase)
    dependson(wMyPlayerStatus)
    dependson(wCharacterManager)
    dependson(wWeaponBaseParams)
    dependson(Vehicle)
    dependson(Canvas)
    native
    nativereplication
    abstract
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
var() class<PlayerReplicationInfo> PlayerReplicationInfoClass;
var PlayerReplicationInfo PlayerReplicationInfo;
var class<Pawn> PawnClass;
var class<Pawn> PreviousPawnClass;
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
var class<wWeapon> LastPawnWeapon;
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
    // Pos:0x00
    reliable if(Role == 4)
        ReceiveMessage_QuestType2, ReceiveMessage_QuestType1,
        ClientStopAllSound, ReceiveMessage_QuestType3;

    // Pos:0x0d
    reliable if(bNetDirty && Role == 4)
        Pawn, PlayerReplicationInfo;

    // Pos:0x25
    reliable if(bNetDirty && Role == 4 && bNetOwner)
        bAdrenalineEnabled, PawnClass,
        Adrenaline;

    // Pos:0x48
    reliable if(RemoteRole == 3)
        ClientRoundEnded, ClientGameEnded,
        ClientSetWeapon, ClientSetLocation,
        ClientDying, ClientSetRotation,
        ClientSwitchToBestWeapon;

    // Pos:0x55
    reliable if(!bDemoRecording || bClientDemoRecording && bClientDemoNetFunc && Role == 4)
        ClientVoiceMessage;

    // Pos:0x85
    unreliable if(Role < 4)
        SetPawnClass, SendVoiceMessage;

    // Pos:0x92
    unreliable if(Role == 4)
        wClientFlash;

    // Pos:0x9f
    reliable if(Role < 4)
        ServerSetOldRun, ServerReStartPlayer,
        ServerUAV, ServerSetVel;

    // Pos:0xac
    reliable if(Role == 4)
        ClientTestAllWeapons, ClientOnBeginWaitingForStart,
        ClientOnEndWaitingForStart, ClientOnBeginRound,
        ClientOnBeginIntervented, ClientOnEndIntervented,
        ClientTestWeapon, ClientUAV;

}

// Export UController::execMoveTo(FFrame&, void* const)
native(500) final latent function MoveTo(Vector NewDestination, optional Actor ViewFocus, optional bool bShouldSprint, optional Vector FocalPoint);
// Export UController::execMoveToward(FFrame&, void* const)
native(502) final latent function MoveToward(Actor NewTarget, optional Actor ViewFocus, optional float DestinationOffset, optional bool bUseStrafing, optional bool bShouldSprint);
// Export UController::execFinishRotation(FFrame&, void* const)
native(508) final latent function FinishRotation();
// Export UController::execLineOfSightTo(FFrame&, void* const)
native(514) final function bool LineOfSightTo(Actor Other);
// Export UController::execCanSee(FFrame&, void* const)
native(533) final function bool CanSee(Pawn Other);
// Export UController::execFindPathTo(FFrame&, void* const)
native(518) final function Actor FindPathTo(Vector aPoint);
// Export UController::execFindPathToward(FFrame&, void* const)
native(517) final function Actor FindPathToward(Actor anActor, optional bool bWeightDetours);
// Export UController::execFindPathToIntercept(FFrame&, void* const)
native final function Actor FindPathToIntercept(Pawn P, Actor RouteGoal, optional bool bWeightDetours);
// Export UController::execFindPathTowardNearest(FFrame&, void* const)
native final function Actor FindPathTowardNearest(class<NavigationPoint> GoalClass, optional bool bWeightDetours);
// Export UController::execFindRandomDest(FFrame&, void* const)
native(525) final function NavigationPoint FindRandomDest();
// Export UController::execEAdjustJump(FFrame&, void* const)
native(523) final function Vector EAdjustJump(float BaseZ, float XYSpeed);
// Export UController::execpointReachable(FFrame&, void* const)
native(521) final function bool pointReachable(Vector aPoint);
// Export UController::execactorReachable(FFrame&, void* const)
native(520) final function bool actorReachable(Actor anActor);
// Export UController::execPickWallAdjust(FFrame&, void* const)
native(526) final function bool PickWallAdjust(Vector HitNormal);
// Export UController::execWaitForLanding(FFrame&, void* const)
native(527) final latent function WaitForLanding();
// Export UController::execFindBestInventoryPath(FFrame&, void* const)
native(540) final function Actor FindBestInventoryPath(out float MinWeight);
// Export UController::execFindBestSuperPickup(FFrame&, void* const)
native final function Actor FindBestSuperPickup(float MaxDist);
// Export UController::execAddController(FFrame&, void* const)
native(529) final function AddController();
// Export UController::execRemoveController(FFrame&, void* const)
native(530) final function RemoveController();
// Export UController::execPickTarget(FFrame&, void* const)
native(531) final function Pawn PickTarget(out float bestAim, out float BestDist, Vector FireDir, Vector projStart, float MaxRange);
// Export UController::execPickAnyTarget(FFrame&, void* const)
native(534) final function Actor PickAnyTarget(out float bestAim, out float BestDist, Vector FireDir, Vector projStart);
// Export UController::execInLatentExecution(FFrame&, void* const)
native final function bool InLatentExecution(int LatentActionNumber);
// Export UController::execStopWaiting(FFrame&, void* const)
native function StopWaiting();
// Export UController::execEndClimbLadder(FFrame&, void* const)
native function EndClimbLadder();
// Export UController::execCanMakePathTo(FFrame&, void* const)
native final function bool CanMakePathTo(Actor A);
event MayFall();
event MayDodgeToMoveTarget();
event MissedDodge();
exec function Cmd(string P1, string P2, string p3, string p4, string p5);
function PendingStasis()
{
    bStasis = true;
    Pawn = none;
}

function wClientFlash(float fTime)
{
    wFlashRemainTime = fTime;
}

function wViewFlash(float fDeltaTime)
{
    // End:0x0f
    if(wFlashRemainTime == float(0))
    {
        return;
    }
    wFlashRemainTime = FMax(0.0, wFlashRemainTime - fDeltaTime);
    // End:0x44
    if(wFlashRemainTime >= float(3))
    {
        wFlashForce = 1.0;
    }
    // End:0x55
    else
    {
        wFlashForce = wFlashRemainTime / float(3);
    }
}

function wClientFreeze(float fTime)
{
    wFreezeTime = fTime;
    GotoState('PlayerFreeze');
}

function AwardAdrenaline(float Amount)
{
    // End:0x2e
    if(bAdrenalineEnabled)
    {
        Adrenaline += Amount;
        Adrenaline = float(Clamp(int(Adrenaline), 0, int(AdrenalineMax)));
    }
}

function bool NeedsAdrenaline()
{
    return Pawn != none && !Pawn.InCurrentCombo() && Adrenaline < AdrenalineMax;
}

function ClientTestWeapon(wWeapon W, int iaWeaponID);
function ClientTestAllWeapons();
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
    Canvas.DrawText("CONTROLLER " $ GetItemName(string(self)) $ " Pawn " $ GetItemName(string(Pawn)) $ " viewpitch " $ string(Rotation.Pitch));
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    // End:0x119
    if(Enemy != none)
    {
        Canvas.DrawText("     STATE: " $ string(GetStateName()) $ " Timer: " $ string(TimerCounter) $ " Enemy " $ Enemy.GetHumanReadableName(), false);
    }
    // End:0x15e
    else
    {
        Canvas.DrawText("     STATE: " $ string(GetStateName()) $ " Timer: " $ string(TimerCounter) $ " NO Enemy ", false);
    }
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    // End:0x1c1
    if(MonitoredPawn != none)
    {
        DebugString $= "     MonitoredPawn: " @ MonitoredPawn.GetHumanReadableName();
    }
    // End:0x1e4
    else
    {
        DebugString $= "     MonitoredPawn: None";
    }
    // End:0x21b
    if(Target != none)
    {
        DebugString $= "     Target: " @ Target.GetHumanReadableName();
    }
    // End:0x237
    else
    {
        DebugString $= "     Target: None";
    }
    Canvas.DrawText(DebugString);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
    // End:0x2a7
    if(PlayerReplicationInfo == none)
    {
        Canvas.DrawText("     NO PLAYERREPLICATIONINFO", false);
    }
    // End:0x2c5
    else
    {
        PlayerReplicationInfo.DisplayDebug(Canvas, YL, YPos);
    }
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

simulated function string GetHumanReadableName()
{
    // End:0x1a
    if(PlayerReplicationInfo != none)
    {
        return PlayerReplicationInfo.PlayerName;
    }
    return GetItemName(string(self));
}

simulated function Rotator GetViewRotation()
{
    return Rotation;
}

function Reset()
{
    super.Reset();
    Enemy = none;
    LastSeenTime = 0.0;
    StartSpot = none;
    Adrenaline = 0.0;
    bAdjusting = false;
    bPreparingMove = false;
    bJumpOverWall = false;
    bEnemyAcquired = false;
    bHuntPlayer = false;
    bInDodgeMove = false;
    MoveTimer = -1.0;
    MoveTarget = none;
    PendingMover = none;
    CurrentPath = none;
    RouteGoal = none;
    MonitoredPawn = none;
    WarningProjectile = none;
    fSprintPassTime = 0.0;
    bHit = false;
    hit_gun_move_speed = 0.0;
    hit_gun_move_time = 0.0;
    hit_gun_move_delay = 0.0;
    hit_gun_delta_Time = 0.0;
}

function bool AvoidCertainDeath()
{
    return false;
}

function ClientSetLocation(Vector NewLocation, Rotator NewRotation)
{
    SetRotation(NewRotation);
    // End:0x8b
    if(Rotation.Pitch > RotationRate.Pitch && Rotation.Pitch < 65536 - RotationRate.Pitch)
    {
        // End:0x6f
        if(Rotation.Pitch < 32768)
        {
            NewRotation.Pitch = RotationRate.Pitch;
        }
        // End:0x8b
        else
        {
            NewRotation.Pitch = 65536 - RotationRate.Pitch;
        }
    }
    // End:0xc4
    if(Pawn != none)
    {
        NewRotation.Roll = 0;
        Pawn.SetRotation(NewRotation);
        Pawn.SetLocation(NewLocation);
    }
}

function ClientSetRotation(Rotator NewRotation)
{
    SetRotation(NewRotation);
    // End:0x3c
    if(Pawn != none)
    {
        NewRotation.Pitch = 0;
        NewRotation.Roll = 0;
        Pawn.SetRotation(NewRotation);
    }
}

function ClientDying(class<DamageType> DamageType, Vector HitLocation)
{
    // End:0x34
    if(Pawn != none)
    {
        Pawn.PlayDying(DamageType, HitLocation);
        Pawn.GotoState('Dying');
    }
}

event AIHearSound(Actor Actor, int id, Sound S, Vector SoundLocation, Vector Parameters, bool Attenuate);
event SoakStop(string problem);
function Possess(Pawn aPawn)
{
    aPawn.PossessedBy(self);
    Pawn = aPawn;
    // End:0xb1
    if(PlayerReplicationInfo != none)
    {
        // End:0x81
        if(Vehicle(Pawn) != none && Vehicle(Pawn).Driver != none)
        {
            PlayerReplicationInfo.bIsFemale = Vehicle(Pawn).Driver.bIsFemale;
        }
        // End:0xa0
        else
        {
            PlayerReplicationInfo.bIsFemale = Pawn.bIsFemale;
        }
        PlayerReplicationInfo.bySupply_AirStrike = 0;
    }
    FocalPoint = Pawn.Location + float(512) * vector(Pawn.Rotation);
    Restart();
}

function UnPossess()
{
    // End:0x1a
    if(Pawn != none)
    {
        Pawn.UnPossessed();
    }
    Pawn = none;
}

function WasKilledBy(Controller Other);
function class<wWeapon> GetLastWeapon()
{
    // End:0x27
    if(Pawn == none || Pawn.Weapon == none)
    {
        return LastPawnWeapon;
    }
    return Pawn.Weapon.Class;
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
            Adrenaline = 0.0;
        }
        SetLocation(Pawn.Location);
        Pawn.UnPossessed();
    }
    Pawn = none;
    PendingMover = none;
    // End:0xa5
    if(bIsPlayer)
    {
        // End:0xa2
        if(!IsInState('GameEnded') && !IsInState('RoundEnded'))
        {
            GotoState('Dead');
        }
    }
    // End:0xa8
    else
    {
        Destroy();
    }
}

function Restart()
{
    Enemy = none;
}

event LongFall();
event bool NotifyPhysicsVolumeChange(PhysicsVolume NewVolume);
event bool NotifyHeadVolumeChange(PhysicsVolume NewVolume);
event bool NotifyLanded(Vector HitNormal);
event NotifyPostLanded();
event bool NotifyHitWall(Vector HitNormal, Actor Wall);
event NotifyFallingHitWall(Vector HitNormal, Actor Wall);
event bool NotifyBump(Actor Other);
event NotifyHitMover(Vector HitNormal, Mover Wall);
event NotifyJumpApex();
event NotifyMissedJump();
function SetDoubleJump();
function NotifyAddInventory(Inventory NewItem);
function NotifyTakeHit(Pawn instigatedBy, Vector HitLocation, int Damage, class<DamageType> DamageType, Vector Momentum, optional int CollisionPart)
{
    // End:0x2e
    if(instigatedBy != none && instigatedBy != Pawn)
    {
        damageAttitudeTo(instigatedBy, float(Damage));
    }
}

function SetFall();
function PawnIsInPain(PhysicsVolume PainVolume);
function bool IsBehindView()
{
    return true;
}

function ServerSetOldRun(byte bSetVal, byte bHitVal)
{
    bOldRun = bSetVal;
    bHitRun = bHitVal;
}

function ServerSetVel(Vector Vel)
{
    Pawn.Velocity = Vel;
}

function TickSprint(float DeltaTime)
{
    local PlayerInput pInput;
    local wGun Gun;
    local PlayerController PC;
    local float fStaminaRecovery;

    // End:0x1d
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
        // End:0xd3
        if(bRun > 0 && pInput.bWasForward == false)
        {
            bOldRun = 0;
            // End:0xd0
            if(Role < 4 && Pawn.Acceleration != vect(0.0, 0.0, 0.0))
            {
                ServerSetOldRun(0, 0);
            }
        }
        // End:0x133
        else
        {
            // End:0x133
            if(bRun > 0 && pInput.bWasForward == true)
            {
                // End:0x133
                if(Role < 4 && Pawn.Acceleration != vect(0.0, 0.0, 0.0))
                {
                    ServerSetOldRun(1, 0);
                }
            }
        }
        // End:0x166
        if(bDClickMove == true && pInput.bWasForward == false)
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
        if(Gun != none && pInput != none && Gun.ReloadState == 1 && bRun > 0 && pInput.bWasForward == true)
        {
            bDClickMove = false;
            bOldRun = 0;
            // End:0x216
            if(Role < 4)
            {
                ServerSetOldRun(0, 0);
            }
        }
    }
    // End:0x2cd
    if(bHit == true)
    {
        hit_gun_delta_Time += DeltaTime;
        // End:0x248
        if(hit_gun_delta_Time < hit_gun_move_time)
        {
            bOldRun = 0;
        }
        // End:0x2cd
        else
        {
            // End:0x2cd
            if(hit_gun_delta_Time >= hit_gun_move_delay)
            {
                bHit = false;
                hit_gun_delta_Time = 0.0;
                // End:0x2cd
                if(pInput != none && bHitRun > 0 && pInput.bWasForward == true)
                {
                    bOldRun = 1;
                    bRun = 1;
                    bHitRun = 0;
                    // End:0x2cd
                    if(Role < 4)
                    {
                        ServerSetOldRun(1, 0);
                    }
                }
            }
        }
    }
    // End:0x2e3
    if(Pawn.IsA('Vehicle'))
    {
        return;
    }
    // End:0x351
    if(Pawn != none && SkillBase != none && SkillBase.bAddStamina)
    {
        Pawn.wMyParam.Stm_MaxTime = Level.CharMgr.MyPlayer.Stm_MaxTime * 1.30;
    }
    // End:0x389
    else
    {
        Pawn.wMyParam.Stm_MaxTime = Level.CharMgr.MyPlayer.Stm_MaxTime;
    }
    // End:0x3c7
    if(fSprintTime > Pawn.wMyParam.Stm_MaxTime)
    {
        fSprintTime = Pawn.wMyParam.Stm_MaxTime;
    }
    // End:0x6fb
    if(bOldRun != 0 || bDClickMove == true && Pawn.Acceleration != vect(0.0, 0.0, 0.0) && Pawn.Physics == 1)
    {
        byInputPosture = 0;
        // End:0x461
        if(Pawn.bIsCrouched == true || Pawn.bIsProned == true)
        {
            Jump();
            SendMessageSprintTime();
            return;
        }
        // End:0x4c6
        if(Pawn.Weapon != none)
        {
            // End:0x4c6
            if(Pawn.Weapon.WeaponType != 17 && Pawn.IsFiring() == true)
            {
                bRun = 0;
                bDClickMove = false;
                SendMessageSprintTime();
                return;
            }
        }
        // End:0x51f
        if(Pawn.Weapon.BaseParams.fSprintStaminaRate > float(0))
        {
            fSprintTime -= DeltaTime * Pawn.Weapon.BaseParams.fSprintStaminaRate;
        }
        // End:0x52b
        else
        {
            fSprintTime -= DeltaTime;
        }
        fSprintPassTime += DeltaTime;
        // End:0x5c6
        if(fSprintTime <= 0.0)
        {
            fSprintTime = 0.0;
            bSprint = false;
            bRun = 0;
            bDClickMove = false;
            // End:0x596
            if(Pawn.Weapon != none)
            {
                Pawn.Weapon.SetSprint(false);
            }
            // End:0x5c3
            if(Pawn.PendingWeapon != none)
            {
                Pawn.PendingWeapon.SetSprint(false);
            }
        }
        // End:0x683
        else
        {
            // End:0x67b
            if(bSprint == false)
            {
                // End:0x67b
                if(IsBehindView() == false)
                {
                    // End:0x62e
                    if(Pawn.PendingWeapon != none && Pawn.PendingWeapon.GetSprint() == false)
                    {
                        Pawn.PendingWeapon.SetSprint(true);
                    }
                    // End:0x67b
                    else
                    {
                        // End:0x67b
                        if(Pawn.Weapon != none && Pawn.Weapon.GetSprint() == false)
                        {
                            Pawn.Weapon.SetSprint(true);
                        }
                    }
                }
            }
            bSprint = true;
        }
        // End:0x69f
        if(bSprint == false)
        {
            bRun = 0;
            bDClickMove = false;
        }
        // End:0x6db
        if(bDuck == 1 || bProne == 1)
        {
            fSprintDelayTime = Pawn.wMyParam.Stm_Delay_Crouch;
        }
        // End:0x6f8
        else
        {
            fSprintDelayTime = Pawn.wMyParam.Stm_Delay_Stand;
        }
    }
    // End:0x8fc
    else
    {
        // End:0x8fc
        if(fSprintTime < Pawn.wMyParam.Stm_MaxTime)
        {
            // End:0x881
            if(Pawn.Physics == 1 || Pawn.Physics == 11)
            {
                // End:0x788
                if(fSprintDelayTime > 0.0)
                {
                    fSprintDelayTime -= DeltaTime;
                    // End:0x785
                    if(fSprintDelayTime < 0.0)
                    {
                        fSprintDelayTime = 0.0;
                    }
                }
                // End:0x881
                else
                {
                    // End:0x7e2
                    if(Pawn.Weapon.BaseParams.fStaminaRecovery > 0.0)
                    {
                        fStaminaRecovery = 1.0 * Pawn.Weapon.BaseParams.fStaminaRecovery;
                    }
                    // End:0x7ed
                    else
                    {
                        fStaminaRecovery = 1.0;
                    }
                    // End:0x829
                    if(SkillBase != none && SkillBase.bAddStamina)
                    {
                        fSprintTime += DeltaTime * 1.20 * fStaminaRecovery;
                    }
                    // End:0x843
                    else
                    {
                        fSprintTime += DeltaTime * 1.40 * fStaminaRecovery;
                    }
                    // End:0x881
                    if(fSprintTime > Pawn.wMyParam.Stm_MaxTime)
                    {
                        fSprintTime = Pawn.wMyParam.Stm_MaxTime;
                    }
                }
            }
            // End:0x8e4
            if(bSprint)
            {
                // End:0x8b7
                if(Pawn.Weapon != none)
                {
                    Pawn.Weapon.SetSprint(false);
                }
                // End:0x8e4
                if(Pawn.PendingWeapon != none)
                {
                    Pawn.PendingWeapon.SetSprint(false);
                }
            }
            bSprint = false;
            bRun = 0;
            bDClickMove = false;
        }
    }
    // End:0x999
    if(Pawn != none && Pawn.Weapon != none)
    {
        // End:0x968
        if(false == bSprint && 1 == bySprintState)
        {
            bySaveFireState = bFire;
            fSprintStopTime = Level.TimeSeconds;
            bySprintState = 2;
            SendMessageSprintTime();
        }
        // End:0x999
        else
        {
            // End:0x999
            if(0 < bRun || bDClickMove == true && true == bSprint)
            {
                bySprintState = 1;
            }
        }
    }
}

function SendMessageSprintTime()
{
    local int iSendSprintTime;

    iSendSprintTime = int(fSprintPassTime);
    // End:0x52
    if(iSendSprintTime > 0)
    {
        self.ReceiveMessage_QuestType2(class'wMessage_Quest', class'wMessage_Quest'.default.Code_Quest_SprintTime,,,, iSendSprintTime);
        fSprintPassTime = fSprintPassTime - float(iSendSprintTime);
    }
}

function TickStance(float DeltaTime)
{
    local bool OldCrouch, OldProne;

    // End:0xd2
    if(Pawn.bIsCrouching == true)
    {
        fCrouchingTimeCount += DeltaTime;
        // End:0xcf
        if(fCrouchingTimeCount >= fCrouchingTimeLimit)
        {
            Pawn.bIsCrouching = false;
            fCrouchingTimeCount = 0.0;
            // End:0xc0
            if(bProne != 1 && bDuck == 1 && bGotoProne != 0)
            {
                // End:0x9f
                if(bGotoProne == 1)
                {
                    byGoCrouch = 0;
                    byGoProne = 1;
                    bProne = 1;
                }
                // End:0xbd
                else
                {
                    // End:0xbd
                    if(bGotoProne == 2)
                    {
                        byGoCrouch = 0;
                        bDuck = 0;
                    }
                }
            }
            // End:0xcf
            else
            {
                Pawn.ServerRefreshCollisionHash();
            }
        }
    }
    // End:0x18b
    else
    {
        // End:0x130
        if(Pawn.bIsProning == true)
        {
            fProningTimeCount += DeltaTime;
            // End:0x12d
            if(fProningTimeCount >= fProningTimeLimit)
            {
                Pawn.bIsProning = false;
                fProningTimeCount = 0.0;
                Pawn.ServerRefreshCollisionHash();
            }
        }
        // End:0x18b
        else
        {
            // End:0x18b
            if(Pawn.bIsStanding == true)
            {
                fStandingTimeCount += DeltaTime;
                // End:0x18b
                if(fStandingTimeCount >= fCrouchingTimeLimit)
                {
                    Pawn.bIsStanding = false;
                    fStandingTimeCount = 0.0;
                    Pawn.ServerRefreshCollisionHash();
                }
            }
        }
    }
    // End:0x292
    if(Pawn.Physics != 2)
    {
        OldCrouch = Pawn.bWantsToCrouch;
        OldProne = Pawn.bWantsToProne;
        // End:0x20c
        if(byGoProne == 1)
        {
            // End:0x209
            if(bProne == 0 && Pawn.bIsCrouching == false)
            {
                bProne = 1;
            }
        }
        // End:0x292
        else
        {
            // End:0x267
            if(byGoCrouch == 1)
            {
                // End:0x264
                if(Pawn.bIsProning == false && Pawn.bIsCrouching == false)
                {
                    // End:0x25c
                    if(OldProne == true)
                    {
                        bProne = 0;
                    }
                    // End:0x264
                    else
                    {
                        bDuck = 1;
                    }
                }
            }
            // End:0x292
            else
            {
                // End:0x292
                if(Pawn.bIsCrouching == false && OldCrouch == true)
                {
                    bDuck = 0;
                }
            }
        }
    }
}

exec function Jump(optional float f);
function HandleWalking()
{
    // End:0x4f
    if(Pawn != none)
    {
        Pawn.SetSprinting(bOldRun > 0 || bDClickMove == true && !Region.Zone.IsA('WarpZoneInfo'));
    }
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
    SightCounter = 0.20 * FRand();
}

event PostBeginPlay()
{
    Log("[Controller::PostBeginPlay]");
    super.PostBeginPlay();
    // End:0x86
    if(!bDeleteMe && bIsPlayer && Level.NetMode != 3)
    {
        PlayerReplicationInfo = Spawn(PlayerReplicationInfoClass, self,, vect(0.0, 0.0, 0.0), rot(0, 0, 0));
        InitPlayerReplicationInfo();
    }
}

function InitPlayerReplicationInfo()
{
    Log("[Controller::InitPlayerReplicationInfo]");
    // End:0xa2
    if(PlayerReplicationInfo.PlayerName == "")
    {
        PlayerReplicationInfo.SetPlayerName(class'GameInfo'.default.DefaultPlayerName);
        Log("set default player name. PlayerReplicationInfo.PlayerName is NULL");
    }
    PlayerReplicationInfo.bNoTeam = !Level.Game.bTeamGame;
}

// Export UController::execGetTeamNum(FFrame&, void* const)
native simulated function int GetTeamNum();
function bool SameTeamAs(Controller C)
{
    // End:0x0d
    if(C == none)
    {
        return false;
    }
    return Level.Game.IsOnTeam(C, GetTeamNum());
}

function HandlePickup(Pickup pick)
{
    // End:0x6d
    if(MoveTarget == pick)
    {
        // End:0x62
        if(pick.myMarker != none)
        {
            MoveTarget = pick.myMarker;
            Pawn.Anchor = pick.myMarker;
            MoveTimer = 0.50;
        }
        // End:0x6d
        else
        {
            MoveTimer = -1.0;
        }
    }
}

event DestroyPlayerReplicationInfo()
{
    // End:0x9b
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
}

simulated event Destroyed()
{
    // End:0x18
    if(Role < 4)
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
}

event bool AllowDetourTo(NavigationPoint N)
{
    return true;
}

event AdjustView(float DeltaTime)
{
    local Controller C;

    C = Level.ControllerList;
    J0x14:
    // End:0x6b [While If]
    if(C != none)
    {
        // End:0x54
        if(C.IsA('PlayerController') && PlayerController(C).ViewTarget == Pawn)
        {
            return;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    Pawn.bUpdateEyeheight = false;
    Pawn.EyeHeight = Pawn.BaseEyeHeight;
}

function bool WantsSmoothedView()
{
    return Pawn != none && Pawn.Physics == 1 || Pawn.Physics == 9 && !Pawn.bJustLanded;
}

// Export UController::execWantsSmoothedViewNative(FFrame&, void* const)
native function bool WantsSmoothedViewNative();
function GameHasEnded()
{
    // End:0x1c
    if(Pawn != none)
    {
        Pawn.bNoWeaponFiring = true;
    }
    GotoState('GameEnded');
}

function ClientGameEnded()
{
    GotoState('GameEnded');
}

function RoundHasEnded()
{
    // End:0x1c
    if(Pawn != none)
    {
        Pawn.bNoWeaponFiring = true;
    }
    GotoState('RoundEnded');
}

function ClientRoundEnded()
{
    GotoState('RoundEnded');
    StopPawnsAndControllers();
}

simulated function StopPawnsAndControllers();
simulated event RenderOverlays(Canvas Canvas);
simulated function RenderSpectatorFPWeapon(Canvas Canvas, bool bClearedZBuffer);
function int GetFacingDirection()
{
    return 0;
}

function byte GetMessageIndex(name PhraseName)
{
    return 0;
}

function SendMessage(PlayerReplicationInfo Recipient, name MessageType, byte MessageID, float wait, name BroadcastType)
{
    SendVoiceMessage(PlayerReplicationInfo, Recipient, MessageType, MessageID, BroadcastType);
}

function bool AllowVoiceMessage(name MessageType)
{
    // End:0x23
    if(Level.TimeSeconds - OldMessageTime < float(10))
    {
        return false;
    }
    // End:0x37
    else
    {
        OldMessageTime = Level.TimeSeconds;
    }
    return true;
}

function SendVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte MessageID, name BroadcastType)
{
    local Controller P;

    // End:0x2d
    if(Recipient == none || AIController(self) == none && !AllowVoiceMessage(MessageType))
    {
        return;
    }
    P = Level.ControllerList;
    J0x41:
    // End:0x267 [While If]
    if(P != none)
    {
        // End:0x200
        if(PlayerController(P) != none)
        {
            // End:0x108
            if(P.PlayerReplicationInfo == Sender || P.PlayerReplicationInfo == Recipient && Level.Game.BroadcastHandler == none || Level.Game.BroadcastHandler.AcceptBroadcastSpeech(PlayerController(P), Sender))
            {
                P.ClientVoiceMessage(Sender, Recipient, MessageType, MessageID);
            }
            // End:0x1fd
            else
            {
                // End:0x1fd
                if(Recipient == none || Level.NetMode == 0)
                {
                    // End:0x1fd
                    if(BroadcastType == 'Global' || !Level.Game.bTeamGame || Sender.Team == P.PlayerReplicationInfo.Team)
                    {
                        // End:0x1fd
                        if(Level.Game.BroadcastHandler == none || Level.Game.BroadcastHandler.AcceptBroadcastSpeech(PlayerController(P), Sender))
                        {
                            P.ClientVoiceMessage(Sender, Recipient, MessageType, MessageID);
                        }
                    }
                }
            }
        }
        // End:0x250
        else
        {
            // End:0x250
            if(MessageType == 'Order' && Recipient == none || Recipient == P.PlayerReplicationInfo)
            {
                P.BotVoiceMessage(MessageType, MessageID, self);
            }
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
}

function ClientVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte MessageID);
function BotVoiceMessage(name MessageType, byte MessageID, Controller Sender);
function bool WouldReactToNoise(float Loudness, Actor NoiseMaker)
{
    return false;
}

function bool WouldReactToSeeing(Pawn Seen)
{
    return false;
}

function Vector AdjustToss(float TSpeed, Vector Start, Vector End, bool bNormalize)
{
    local Vector Dest2D, Result, Vel2D;
    local float Dist2D;

    // End:0xea
    if(Start.Z > End.Z + float(64))
    {
        Dest2D = End;
        Dest2D.Z = Start.Z;
        Dist2D = VSize(Dest2D - Start);
        TSpeed *= Dist2D / VSize(End - Start);
        Result = SuggestFallVelocity(Dest2D, Start, TSpeed, TSpeed);
        Vel2D = Result;
        Vel2D.Z = 0.0;
        Result.Z = Result.Z + End.Z - Start.Z * VSize(Vel2D) / Dist2D;
    }
    // End:0x10a
    else
    {
        Result = SuggestFallVelocity(End, Start, TSpeed, TSpeed);
    }
    // End:0x125
    if(bNormalize)
    {
        return TSpeed * Normal(Result);
    }
    // End:0x12b
    else
    {
        return Result;
    }
}

event PrepareForMove(NavigationPoint Goal, ReachSpec Path);
function WaitForMover(Mover M);
function MoverFinished();
function UnderLift(Mover M);
function FearThisSpot(AvoidMarker aSpot)
{
    local int i;

    // End:0x0d
    if(Pawn == none)
    {
        return;
    }
    // End:0x1c
    if(!LineOfSightTo(aSpot))
    {
        return;
    }
    i = 0;
    J0x23:
    // End:0x5d [While If]
    if(i < 2)
    {
        // End:0x53
        if(FearSpots[i] == none)
        {
            FearSpots[i] = aSpot;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x23;
    }
    i = 0;
    J0x64:
    // End:0xd8 [While If]
    if(i < 2)
    {
        // End:0xce
        if(VSize(Pawn.Location - FearSpots[i].Location) > VSize(Pawn.Location - aSpot.Location))
        {
            FearSpots[i] = aSpot;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x64;
    }
}

event float Desireability(Pickup P)
{
    return P.BotDesireability(Pawn);
}

event float SuperDesireability(Pickup P)
{
    return P.BotDesireability(Pawn);
}

event SetupSpecialPathAbilities();
event HearNoise(float Loudness, Actor NoiseMaker);
event SeePlayer(Pawn Seen);
event SeeMonster(Pawn Seen);
event EnemyNotVisible();
function DamageShake(int Damage);
function ShakeView(Vector shRotMag, Vector shRotRate, float shRotTime, Vector shOffsetMag, Vector shOffsetRate, float shOffsetTime);
function NotifyKilled(Controller Killer, Controller Killed, Pawn Other)
{
    // End:0x16
    if(Enemy == Other)
    {
        Enemy = none;
    }
}

function damageAttitudeTo(Pawn Other, float Damage);
function float AdjustDesireFor(Pickup P);
function bool FireWeaponAt(Actor A);
function StopFiring()
{
    // End:0x1a
    if(Pawn != none)
    {
        Pawn.StopWeaponFiring();
    }
    bFire = 0;
    bAltFire = 0;
    bMeleeFire = 0;
}

simulated function float RateWeapon(wWeapon W)
{
    return float(W.default.Priority);
}

function float WeaponPreference(wWeapon W)
{
    return 0.0;
}

function Rotator AdjustAim(FireProperties FiredAmmunition, Vector projStart, int AimError)
{
    return Rotation;
}

function InstantWarnTarget(Actor Target, FireProperties FiredAmmunition, Vector FireDir)
{
    local float dist;

    // End:0xd3
    if(FiredAmmunition.bInstantHit && Pawn(Target) != none && Pawn(Target).Controller != none)
    {
        dist = VSize(Pawn.Location - Target.Location);
        // End:0x94
        if(VSize(FireDir * dist - Target.Location) < Target.CollisionRadius)
        {
            return;
        }
        // End:0xd1
        if(FRand() < FiredAmmunition.WarnTargetPct)
        {
            Pawn(Target).Controller.ReceiveWarning(Pawn, -1.0, FireDir);
        }
        return;
    }
}

event ReceiveWarning(Pawn shooter, float projSpeed, Vector FireDir);
function ReceiveProjectileWarning(Projectile proj)
{
    // End:0x3d
    if(WarningProjectile == none)
    {
        ReceiveWarning(proj.Instigator, proj.Speed, Normal(proj.Velocity));
    }
}

event DelayedWarning();
exec function SwitchToBestWeapon()
{
    local float rating;

    // End:0x23
    if(Pawn == none || Pawn.Inventory == none)
    {
        return;
    }
    // End:0xb8
    if(Pawn.PendingWeapon == none || AIController(self) != none)
    {
        Pawn.PendingWeapon = Pawn.Inventory.RecommendWeapon(rating);
        // End:0xa2
        if(Pawn.PendingWeapon == Pawn.Weapon)
        {
            Pawn.PendingWeapon = none;
        }
        // End:0xb8
        if(Pawn.PendingWeapon == none)
        {
            return;
        }
    }
    StopFiring();
    // End:0xe4
    if(Pawn.Weapon == none)
    {
        Pawn.ChangedWeapon();
    }
    // End:0x11d
    else
    {
        // End:0x11d
        if(Pawn.Weapon != Pawn.PendingWeapon)
        {
            Pawn.Weapon.PutDown();
        }
    }
}

function ClientSwitchToBestWeapon()
{
    SwitchToBestWeapon();
}

function ClientSetWeapon(class<wWeapon> WeaponClass)
{
    local Inventory Inv;
    local int Count;

    Inv = Pawn.Inventory;
    J0x14:
    // End:0xfb [While If]
    if(Inv != none)
    {
        ++ Count;
        // End:0x37
        if(Count > 1000)
        {
            return;
        }
        // End:0x55
        if(!ClassIsChildOf(Inv.Class, WeaponClass))
        {
        }
        // End:0xe4
        else
        {
            // End:0x94
            if(Pawn.Weapon == none)
            {
                Pawn.PendingWeapon = wWeapon(Inv);
                Pawn.ChangedWeapon();
            }
            // End:0xe2
            else
            {
                // End:0xe2
                if(Pawn.Weapon != wWeapon(Inv))
                {
                    Pawn.PendingWeapon = wWeapon(Inv);
                    Pawn.Weapon.PutDown();
                }
            }
            return;
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function SetPawnClass(string inClass, string InCharacter)
{
    local class<Pawn> pClass;

    // End:0x0e
    if(inClass == "")
    {
        return;
    }
    pClass = class<Pawn>(DynamicLoadObject(inClass, class'Class'));
    // End:0x3f
    if(pClass != none)
    {
        PawnClass = pClass;
    }
}

function SetPawnFemale();
function bool CheckFutureSight(float DeltaTime)
{
    return true;
}

function PlayerReplicationInfo GetPRI()
{
    return PlayerReplicationInfo;
}

function ChangedWeapon()
{
    // End:0x31
    if(Pawn.Weapon != none)
    {
        LastPawnWeapon = Pawn.Weapon.Class;
    }
}

function ServerReStartPlayer()
{
    // End:0x1b
    if(Level.NetMode == 3)
    {
        return;
    }
    // End:0x2c
    if(Pawn != none)
    {
        ServerGivePawn();
    }
}

function ServerGivePawn();
event MonitoredPawnAlert();
function StartMonitoring(Pawn P, float MaxDist)
{
    MonitoredPawn = P;
    MonitorStartLoc = P.Location;
    MonitorMaxDistSq = MaxDist * MaxDist;
}

function bool AutoTaunt()
{
    return false;
}

function bool DontReuseTaunt(int t)
{
    return false;
}

function string ParseChatPercVar(string Cmd)
{
    // End:0x26
    if(Cmd ~= "%A")
    {
        return string(int(Adrenaline)) @ "Adrenaline";
    }
    // End:0x5e
    if(Pawn != none && Cmd ~= "%S")
    {
        return string(int(Pawn.ShieldStrength)) @ "Shield";
    }
    return Cmd;
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
}

exec function SetMoveAtt(string gmv, string gmt, string gmd, bool isSet)
{
    bSet = isSet;
    hit_gun_move_delay = float(gmd);
    hit_gun_move_speed = float(gmv);
    hit_gun_move_time = float(gmt);
    clog("Change Move Att = " $ Pawn.OwnerName);
}

function StopAllSoundHK(Actor aactor)
{
    local Controller C;

    // End:0x12
    if(Role != 4)
    {
        return;
    }
    C = Level.ControllerList;
    J0x26:
    // End:0x61 [While If]
    if(C != none)
    {
        PlayerController(C).ClientStopAllSound(aactor);
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x26;
    }
}

function ClientStopAllSound(Actor aactor)
{
    local Actor A;

    // End:0x32
    foreach DynamicActors(class'Actor', A)
    {
        // End:0x31
        if(A == aactor)
        {
            A.StopAllSoundByActor();
        }
        // End:0x32
        else
        {
            continue;
        }        
    }
}

simulated function ClientOnBeginWaitingForStart()
{
    Log("[Controller::ClientOnBeginWaitingForStart] " $ PlayerReplicationInfo.PlayerName);
    // End:0x58
    if(!self.IsInState('WaitingForStart'))
    {
        GotoState('WaitingForStart');
    }
}

simulated function ClientOnEndWaitingForStart()
{
    Log("[Controller::ClientOnEndWaitingForStart] " $ PlayerReplicationInfo.PlayerName);
    // End:0x6c
    if(Level.GetMatchMaker().GMLevelFlag & 2 == 2)
    {
        GotoState('SpectatingGM');
    }
    // End:0x92
    else
    {
        // End:0x92
        if(!self.IsInState('PlayerWalking') && Pawn != none)
        {
            GotoState('PlayerWalking');
        }
    }
}

simulated function ClientOnBeginRound()
{
    Log("[Controller::ClientOnBeginRound] " $ PlayerReplicationInfo.PlayerName);
    // End:0x4e
    if(!self.IsInState('PlayerWalking'))
    {
        GotoState('PlayerWalking');
    }
}

simulated function ClientOnBeginIntervented();
simulated function ClientOnEndIntervented();
function ZoomFOV(float fFOV, bool bInstant);
function bool CallAirFire()
{
    return false;
}

function bool CallHelicopter(optional bool ignoreSupply)
{
    return false;
}

function bool CallUAV()
{
    return false;
}

function bool IsActiveAirFire()
{
    return false;
}

function bool IsActiveHelicopter()
{
    return false;
}

function bool IsActiveUAV()
{
    return false;
}

function ServerUAV()
{
    local Controller P;
    local int CurrentTime;

    Log("[wPlayer::ServerUAV]");
    PlayerReplicationInfo.bySupply_UAV = 0;
    CurrentTime = Level.GRI.ElapsedTime;
    PlayerReplicationInfo.Team.SetUAV();
    P = Level.ControllerList;
    J0x72:
    // End:0x14f [While If]
    if(P != none)
    {
        // End:0x138
        if(P != none)
        {
            // End:0xfd
            if(P.GetTeamNum() == GetTeamNum())
            {
                // End:0xdd
                if(P.IsA('PlayerController'))
                {
                    PlayerController(P).ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_OurUAVOnline);
                }
                P.ClientUAV(class'GameInfo'.default.UAVDuration);
            }
            // End:0x138
            else
            {
                // End:0x138
                if(P.IsA('PlayerController'))
                {
                    PlayerController(P).ReceiveLocalizedMessage(class'wMessage_Game', class'wMessage_Game'.default.Code_EnemyUAVOnline);
                }
            }
        }
        P = P.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x72;
    }
    Level.Game.AnnounceUAV(self);
}

simulated event ReceiveMessage_QuestType1(class<wMessage_Quest> Message, optional int Switch, optional int iRWeaponType, optional int iRweaponId);
simulated event ReceiveMessage_QuestType2(class<wMessage_Quest> Message, optional int Switch, optional int iRMode, optional int iRMap, optional int iRMin, optional int iRSec);
simulated event ReceiveMessage_QuestType3(class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRMap);
simulated event ReceiveMessage_QuestType4(class<wMessage_Quest> Message, optional int Switch, optional int iRDifficult, optional int iRRound);
simulated function bool AllowFire()
{
    return true;
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
        // End:0x36
        else
        {
            UAVQueue += float(UAVDuration);
        }
    }
    // End:0x153
    else
    {
        // End:0xdc
        if(PlayerReplicationInfo.UAVScanBeginTime <= Level.PlayTimeSeconds && Level.PlayTimeSeconds <= PlayerReplicationInfo.UAVScanEndTime)
        {
            uavEndTime = PlayerReplicationInfo.UAVScanEndTime;
            PlayerReplicationInfo.ServerSetUAV(PlayerReplicationInfo.UAVScanBeginTime, uavEndTime + float(UAVDuration));
            PlayerReplicationInfo.UAVScanEndTime = uavEndTime + float(UAVDuration);
        }
        // End:0x153
        else
        {
            PlayerReplicationInfo.UAVScanBeginTime = Level.PlayTimeSeconds;
            PlayerReplicationInfo.UAVScanEndTime = Level.PlayTimeSeconds + float(UAVDuration);
            PlayerReplicationInfo.ServerSetUAV(Level.PlayTimeSeconds, Level.PlayTimeSeconds + float(UAVDuration));
        }
    }
}

function NotifyVehicle(Vehicle V);
function bool IsPermitSpecialMode(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType, optional int KeyF)
{
    return false;
}

function bool IsSpecialMode_Knife(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
}

function bool IsSpecialMode_RPG(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
}

function bool IsSpecialMode_SR(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
}

function bool IsSpecialMode_Hold_Weapon(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
}

function bool IsSpecialMode_SG(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
}

function bool IsSpecialMode_FlameThrower(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
}

function bool IsSpecialMode_MG(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
}

function bool IsSpecialMode_Grenade(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
}

function bool IsSpecialMode_Pistol(bool bLimitInvenGroup, int InvenGroup, Actor.eWeaponType QWeaponType)
{
    return false;
}

state Dead
{
    ignores KilledBy;

    function PawnDied(Pawn P)
    {
        // End:0x36
        if(Level.NetMode != 3)
        {
            Warn(string(self) $ " Pawndied while dead");
        }
    }

    function ServerReStartPlayer()
    {
        // End:0x1b
        if(Level.NetMode == 3)
        {
            return;
        }
        Level.Game.RestartPlayer(self);
    }

}

state RoundEnded
{

}

defaultproperties
{
    BtrUpdateFrequency=100.0
    FovAngle=90.0
    Handedness=1.0
    bSlowerZAcquire=true
    fSprintTime=999.0
    MinHitWall=-1.0
    AcquisitionYawRate=20000
    PlayerReplicationInfoClass=class'PlayerReplicationInfo'
    AdrenalineMax=100.0
    hit_gun_move_speed=1.0
    bHidden=true
    bOnlyRelevantToOwner=true
    RemoteRole=0
    RotationRate=(Pitch=3072,Yaw=30000,Roll=2048)
    bHiddenEd=true
}