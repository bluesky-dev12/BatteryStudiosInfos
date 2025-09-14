/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Vehicle.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:131
 *	Functions:118
 *	States:2
 *
 *******************************************************************************/
class Vehicle extends Pawn
    dependson(AIController)
    dependson(DamageType)
    dependson(PhysicsVolume)
    dependson(TeamInfo)
    dependson(Decoration)
    dependson(SVehicleFactory)
    dependson(wArrangeTurret)
    dependson(ShadowProjector)
    native
    nativereplication
    abstract
    placeable;

struct native SVehicleIcon
{
    var Material Material;
    var float X;
    var float Y;
    var float SizeX;
    var float SizeY;
    var bool bIsGreyScale;
};

var bool bVehicleShadows;
var bool bDriving;
var bool bOldDriving;
var bool bDrawVehicleShadow;
var() bool bDrawDriverInTP;
var() bool bDriverCollideActors;
var() bool bRelativeExitPos;
var bool bDefensive;
var bool bAutoTurret;
var bool bRemoteControlled;
var bool bEjectDriver;
var bool bTurnInPlace;
var bool bFollowLookDir;
var bool bNonHumanControl;
var bool bStalled;
var bool bVehicleDestroyed;
var bool bShowDamageOverlay;
var bool bDropDetail;
var bool bNoFriendlyFire;
var bool bCanHover;
var bool bCanDoTrickJumps;
var() bool bDrawMeshInFP;
var() bool bZeroPCRotOnEntry;
var bool bPCRelativeFPRotation;
var bool bWeaponisFiring;
var bool bWeaponisAltFiring;
var bool bTeamLocked;
var bool bEnterringUnlocks;
var bool bCanFlip;
var bool bAllowViewChange;
var bool bAllowWeaponToss;
var() bool bHUDTrackVehicle;
var bool bHasRadar;
var bool bHasHandbrake;
var bool bScriptedRise;
var bool bKeyVehicle;
var bool bSeparateTurretFocus;
var() bool bHighScoreKill;
var bool bAdjustDriversHead;
var bool bEnemyLockedOn;
var bool bDesiredBehindView;
var bool bHideRemoteDriver;
var bool bShowChargingBar;
var bool bDriverHoldsFlag;
var bool bCanCarryFlag;
var bool bSpawnProtected;
var() bool bFPNoZFromCameraPitch;
var byte StuckCount;
var() byte Team;
var byte OldTeam;
var byte PrevTeam;
var Rotator PlayerEnterredRotation;
var float EjectMomentum;
var class<Controller> AutoTurretControllerClass;
var() float Steering;
var() float Throttle;
var() float Rise;
var int DriverViewPitch;
var int DriverViewYaw;
var float ThrottleTime;
var float StuckTime;
var float VehicleMovingTime;
var() Vector DrivePos;
var() Rotator DriveRot;
var() name DriveAnim;
var() array<Vector> ExitPositions;
var() Vector EntryPosition;
var() float EntryRadius;
var() Vector FPCamPos;
var() Vector FPCamViewOffset;
var float TPCamDistance;
var string CenterSpringForce;
var int CenterSpringRangePitch;
var int CenterSpringRangeRoll;
var() Vector TPCamLookat;
var() Vector TPCamWorldOffset;
var float DesiredTPCamDistance;
var float LastCameraCalcTime;
var float CameraSpeed;
var() Range TPCamDistRange;
var() int MaxViewYaw;
var() int MaxViewPitch;
var Pawn Driver;
var SVehicleFactory ParentFactory;
var wArrangeTurret ParentTurret;
var string TransEffects[2];
var ShadowProjector VehicleShadow;
var float ShadowMaxTraceDist;
var float ShadowCullDistance;
var float MomentumMult;
var float DriverDamageMult;
var string LockOnClassString;
var float LastLockWarningTime;
var float LockWarningInterval;
var Vehicle NextVehicle;
var localized string VehiclePositionString;
var noimport localized string VehicleNameString;
var noimport localized string VehicleDescription;
var Texture TeamBeaconTexture;
var Texture NoEntryTexture;
var Material TeamBeaconBorderMaterial;
var AIMarker myMarker;
var float MinRunOverSpeed;
var class<DamageType> RanOverDamageType;
var class<DamageType> CrushedDamageType;
var Sound RanOverSound;
var name StolenAnnouncement;
var Sound StolenSound;
var float LinkHealMult;
var float OldSteering;
var float VehicleLostTime;
var float TeamUseTime;
var float PlayerStartTime;
var float MaxDesireability;
var const float AIMoveCheckTime;
var float ObjectiveGetOutDist;
var name FlagBone;
var Vector FlagOffset;
var Rotator FlagRotation;
var float WheelsScale;
var array<Sound> HornSounds;
var float LastHornTime;
var() array<Sound> BulletSounds;
var() float WaterDamage;
var class<DamageType> VehicleDrowningDamType;
var class<Actor> HUDOverlayClass;
var Actor HudOverlay;
var() Vector HUDOverlayOffset;
var() float HUDOverlayFOV;
var() Material SpawnOverlay[2];
var SVehicleIcon VehicleIcon;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        ClientKDriverEnter, ClientClearController,
        ClientKDriverLeave, FixPCRotation;

    // Pos:0x0d
    reliable if(bNetDirty && Role == 4)
        bDriving, bVehicleDestroyed,
        bTeamLocked, Team,
        Driver, WheelsScale;

    // Pos:0x25
    reliable if(bNetInitial && Role == 4)
        bHUDTrackVehicle;

    // Pos:0x3d
    reliable if(Role < 4)
        VehicleFire, VehicleCeaseFire;

}

function PreBeginPlay()
{
    // End:0x2f
    if(!Level.Game.bAllowVehicles && !bDeleteMe)
    {
        Destroy();
        return;
    }
    super.PreBeginPlay();
}

function PlayerChangedTeam()
{
    // End:0x22
    if(Driver != none)
    {
        Driver.KilledBy(Driver);
    }
    // End:0x28
    else
    {
        super.PlayerChangedTeam();
    }
}

simulated function SetBaseEyeheight()
{
    BaseEyeHeight = default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;
}

simulated function string GetVehiclePositionString()
{
    return VehiclePositionString;
}

function Suicide()
{
    // End:0x22
    if(Driver != none)
    {
        Driver.KilledBy(Driver);
    }
    // End:0x29
    else
    {
        KilledBy(self);
    }
}

function bool CheatWalk()
{
    return false;
}

function bool CheatGhost()
{
    return false;
}

function bool CheatFly()
{
    return false;
}

event RegisterTurret()
{
    local Controller NewController;

    // End:0x98
    if(Role == 4)
    {
        // End:0x5c
        if(bAutoTurret && Controller == none && AutoTurretControllerClass != none)
        {
            NewController = Spawn(AutoTurretControllerClass);
            // End:0x5c
            if(NewController != none)
            {
                NewController.Possess(self);
            }
        }
        // End:0x98
        if(!bAutoTurret && !bNonHumanControl && IndependentVehicle())
        {
            Level.Game.RegisterVehicle(self);
        }
    }
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x11
    if(bDeleteMe)
    {
        return;
    }
    // End:0xe5
    if(bVehicleShadows && bDrawVehicleShadow && Level.NetMode != 1)
    {
        VehicleShadow = Spawn(class'ShadowProjector', self, 'None', Location);
        VehicleShadow.ShadowActor = self;
        VehicleShadow.bBlobShadow = false;
        VehicleShadow.LightDirection = Normal(vect(1.0, 1.0, 6.0));
        VehicleShadow.LightDistance = 1200.0;
        VehicleShadow.MaxTraceDistance = int(ShadowMaxTraceDist);
        VehicleShadow.CullDistance = ShadowCullDistance;
        VehicleShadow.InitShadow();
    }
    RegisterTurret();
    OldTeam = Team;
    PrevTeam = Team;
}

simulated event SetInitialState()
{
    super(Actor).SetInitialState();
    Disable('Tick');
}

function bool StronglyRecommended(Actor S, int TeamIndex, Actor Objective)
{
    return bKeyVehicle;
}

function float BotDesireability(Actor S, int TeamIndex, Actor Objective)
{
    local bool bSameTeam;
    local PlayerController P;

    bSameTeam = GetTeamNum() == TeamIndex;
    // End:0xb7
    if(bSameTeam)
    {
        // End:0x3b
        if(Level.TimeSeconds < TeamUseTime)
        {
            return 0.0;
        }
        // End:0xb7
        if(!bKeyVehicle && Level.TimeSeconds < PlayerStartTime)
        {
            P = Level.GetLocalPlayerController();
            // End:0xb7
            if(P == none || P.Pawn != none && Vehicle(P.Pawn) == none)
            {
                return 0.0;
            }
        }
    }
    // End:0xf2
    if(!bKeyVehicle && !bStationary && Level.TimeSeconds < VehicleLostTime)
    {
        return 0.0;
    }
    // End:0x126
    else
    {
        // End:0x126
        if(Health <= 0 || Occupied() || bTeamLocked && !bSameTeam)
        {
            return 0.0;
        }
    }
    // End:0x135
    if(bKeyVehicle)
    {
        return 100.0;
    }
    return MaxDesireability * 0.50 + MaxDesireability * 0.50 * float(Health) / HealthMax;
}

simulated function Destroyed()
{
    local Vehicle V, Prev;

    // End:0x1b
    if(ParentFactory != none)
    {
        ParentFactory.VehicleDestroyed(self);
    }
    // End:0x36
    if(ParentTurret != none)
    {
        ParentTurret.VehicleDestroyed(self);
    }
    // End:0x4d
    if(VehicleShadow != none)
    {
        VehicleShadow.Destroy();
    }
    // End:0xa7
    if(bAutoTurret && Controller != none && ClassIsChildOf(Controller.Class, AutoTurretControllerClass) && !Controller.bDeleteMe)
    {
        Controller.Destroy();
        Controller = none;
    }
    // End:0xb8
    if(Driver != none)
    {
        Destroyed_HandleDriver();
    }
    // End:0x1a9
    if(Level.Game != none)
    {
        // End:0x109
        if(Level.Game.VehicleList == self)
        {
            Level.Game.VehicleList = NextVehicle;
        }
        // End:0x1a9
        else
        {
            Prev = Level.Game.VehicleList;
            // End:0x1a9
            if(Prev != none)
            {
                V = Level.Game.VehicleList.NextVehicle;
                J0x157:
                // End:0x1a9 [While If]
                if(V != none)
                {
                    // End:0x187
                    if(V == self)
                    {
                        Prev.NextVehicle = NextVehicle;
                        // This is an implied JumpToken;
                        goto J0x1a9;
                    }
                    // End:0x192
                    else
                    {
                        Prev = V;
                    }
                    V = V.NextVehicle;
                    // This is an implied JumpToken; Continue!
                    goto J0x157;
                }
            }
        }
    }
    super.Destroyed();
}

simulated function Destroyed_HandleDriver()
{
    local Pawn OldDriver;

    Driver.LastRenderTime = LastRenderTime;
    // End:0x144
    if(Role == 4)
    {
        // End:0xb1
        if(Driver != none && !bRemoteControlled && !bEjectDriver && !bDrawDriverInTP && Driver.Health > 0)
        {
            OldDriver = Driver;
            Driver = none;
            OldDriver.DrivenVehicle = none;
            // End:0xae
            if(!OldDriver.bDeleteMe)
            {
                OldDriver.Destroy();
            }
        }
        // End:0x141
        else
        {
            // End:0x141
            if(!bRemoteControlled && !bEjectDriver)
            {
                // End:0xff
                if(!bDrawDriverInTP && PlaceExitingDriver())
                {
                    Driver.StopDriving(self);
                    Driver.DrivenVehicle = self;
                }
                Driver.TearOffMomentum = Velocity * 0.250;
                Driver.Died(Controller, class'DamRanOver', Driver.Location);
            }
        }
    }
    // End:0x168
    else
    {
        // End:0x168
        if(Driver.DrivenVehicle == self)
        {
            Driver.StopDriving(self);
        }
    }
}

simulated function Vector GetCameraLocationStart()
{
    return Location;
}

simulated function SpecialCalcBehindView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Vector CamLookAt, HitLocation, HitNormal, OffsetVector;
    local Actor HitActor;
    local Vector X, Y, Z;

    // End:0x42
    if(DesiredTPCamDistance < TPCamDistance)
    {
        TPCamDistance = FMax(DesiredTPCamDistance, TPCamDistance - CameraSpeed * Level.TimeSeconds - LastCameraCalcTime);
    }
    // End:0x81
    else
    {
        // End:0x81
        if(DesiredTPCamDistance > TPCamDistance)
        {
            TPCamDistance = FMin(DesiredTPCamDistance, TPCamDistance + CameraSpeed * Level.TimeSeconds - LastCameraCalcTime);
        }
    }
    GetAxes(PC.Rotation, X, Y, Z);
    ViewActor = self;
    CamLookAt = GetCameraLocationStart() + TPCamLookat >> Rotation + TPCamWorldOffset;
    OffsetVector = vect(0.0, 0.0, 0.0);
    OffsetVector.X = -1.0 * TPCamDistance;
    CameraLocation = CamLookAt + OffsetVector >> PC.Rotation;
    HitActor = Trace(HitLocation, HitNormal, CameraLocation, CamLookAt, true, vect(40.0, 40.0, 40.0));
    // End:0x1aa
    if(HitActor != none && HitActor.bWorldGeometry || HitActor == GetVehicleBase() || Trace(HitLocation, HitNormal, CameraLocation, CamLookAt, false, vect(40.0, 40.0, 40.0)) != none)
    {
        CameraLocation = HitLocation;
    }
    CameraRotation = Normalize(PC.Rotation + PC.ShakeRot);
    CameraLocation = CameraLocation + PC.ShakeOffset.X * X + PC.ShakeOffset.Y * Y + PC.ShakeOffset.Z * Z;
}

simulated function SpecialCalcFirstPersonView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Quat CarQuat, LookQuat, ResultQuat;
    local Vector VehicleZ, CamViewOffsetWorld, X, Y, Z;

    local float CamViewOffsetZAmount;

    GetAxes(PC.Rotation, X, Y, Z);
    ViewActor = self;
    // End:0x95
    if(bPCRelativeFPRotation)
    {
        CarQuat = QuatFromRotator(Rotation);
        CameraRotation = Normalize(PC.Rotation);
        LookQuat = QuatFromRotator(CameraRotation);
        ResultQuat = QuatProduct(LookQuat, CarQuat);
        CameraRotation = QuatToRotator(ResultQuat);
    }
    // End:0xa9
    else
    {
        CameraRotation = PC.Rotation;
    }
    CamViewOffsetWorld = FPCamViewOffset >> CameraRotation;
    CameraLocation = GetCameraLocationStart() + FPCamPos >> Rotation + CamViewOffsetWorld;
    // End:0x127
    if(bFPNoZFromCameraPitch)
    {
        VehicleZ = vect(0.0, 0.0, 1.0) >> Rotation;
        CamViewOffsetZAmount = CamViewOffsetWorld Dot VehicleZ;
        CameraLocation -= CamViewOffsetZAmount * VehicleZ;
    }
    CameraRotation = Normalize(CameraRotation + PC.ShakeRot);
    CameraLocation = CameraLocation + PC.ShakeOffset.X * X + PC.ShakeOffset.Y * Y + PC.ShakeOffset.Z * Z;
}

simulated function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x33
    if(PC == none || PC.ViewTarget != self)
    {
        return false;
    }
    // End:0x62
    if(PC.bBehindView)
    {
        SpecialCalcBehindView(PC, ViewActor, CameraLocation, CameraRotation);
    }
    // End:0x7c
    else
    {
        SpecialCalcFirstPersonView(PC, ViewActor, CameraLocation, CameraRotation);
    }
    LastCameraCalcTime = Level.TimeSeconds;
    return true;
}

simulated function bool SpectatorSpecialCalcView(PlayerController Viewer, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Rotator DummyRotation;

    // End:0x16
    if(Viewer.ViewTarget != self)
    {
        return false;
    }
    // End:0x92
    if(Viewer.bBehindView)
    {
        DesiredTPCamDistance = TPCamDistRange.Max - TPCamDistRange.Min * Viewer.CameraDist / Viewer.CameraDistRange.Max + TPCamDistRange.Min;
        SpecialCalcBehindView(Viewer, ViewActor, CameraLocation, CameraRotation);
    }
    // End:0xac
    else
    {
        SpecialCalcFirstPersonView(Viewer, ViewActor, CameraLocation, DummyRotation);
    }
    LastCameraCalcTime = Level.TimeSeconds;
    Viewer.SetLocation(CameraLocation);
    return true;
}

function Vehicle FindEntryVehicle(Pawn P)
{
    // End:0x1b
    if(AIController(P.Controller) != none)
    {
        return self;
    }
    // End:0x4d
    if(VSize(P.Location - Location + EntryPosition >> Rotation) < EntryRadius)
    {
        return self;
    }
    return none;
}

function bool TryToDrive(Pawn P)
{
    // End:0x86
    if(bNonHumanControl || P.Controller == none || Driver != none || P.DrivenVehicle != none || !P.Controller.bIsPlayer || P.IsA('Vehicle') || Health <= 0)
    {
        return false;
    }
    // End:0xbc
    if(P.Weapon != none && P.Weapon.CheckTryToDrive() == false)
    {
        return false;
    }
    // End:0xe1
    if(!Level.Game.CanEnterVehicle(self, P))
    {
        return false;
    }
    // End:0x135
    if(!bTeamLocked || P.GetTeamNum() == Team)
    {
        // End:0x125
        if(bEnterringUnlocks && bTeamLocked)
        {
            bTeamLocked = false;
        }
        KDriverEnter(P);
        return true;
    }
    // End:0x142
    else
    {
        VehicleLocked(P);
        return false;
    }
}

event VehicleLocked(Pawn P);
function PossessedBy(Controller C)
{
    local PlayerController PC;

    // End:0x5a
    if(bAutoTurret && Controller != none && ClassIsChildOf(Controller.Class, AutoTurretControllerClass) && !Controller.bDeleteMe)
    {
        Controller.Destroy();
        Controller = none;
    }
    super.PossessedBy(C);
    // End:0x11d
    if(C.GetTeamNum() != Team)
    {
        // End:0xf0
        if(Team != 255 && PlayerController(C) != none)
        {
            // End:0xca
            if(StolenAnnouncement != 'None')
            {
                PlayerController(C).PlayRewardAnnouncement(StolenAnnouncement, 1);
            }
            // End:0xf0
            if(StolenSound != none)
            {
                PlaySound(StolenSound,, 2.50 * TransientSoundVolume,, 400.0);
            }
        }
        // End:0x11d
        if(C.GetTeamNum() != 255)
        {
            SetTeamNum(byte(C.GetTeamNum()));
        }
    }
    NetPriority = 3.0;
    NetUpdateFrequency = C.BtrUpdateFrequency;
    ThrottleTime = Level.TimeSeconds;
    bSpawnProtected = false;
    PC = PlayerController(C);
    // End:0x17e
    if(PC != none)
    {
        ClientKDriverEnter(PC);
    }
    // End:0x1c3
    if(ParentFactory != none && !bAutoTurret || !ClassIsChildOf(C.Class, AutoTurretControllerClass))
    {
        ParentFactory.VehiclePossessed(self);
    }
    // End:0x208
    if(ParentTurret != none && !bAutoTurret || !ClassIsChildOf(C.Class, AutoTurretControllerClass))
    {
        ParentTurret.VehiclePossessed(self);
    }
}

function UnPossessed()
{
    local PlayerController PC;
    local Controller NewController;
    local bool bWasPlayer;

    StopWeaponFiring();
    PC = PlayerController(Controller);
    // End:0x61
    if(PC != none)
    {
        bWasPlayer = true;
        ClientKDriverLeave(PC);
        // End:0x5e
        if(bPCRelativeFPRotation && !PC.bBehindView)
        {
            FixPCRotation(PC);
        }
    }
    // End:0x67
    else
    {
        ClientClearController();
    }
    NetPriority = default.NetPriority;
    NetUpdateTime = Level.TimeSeconds - float(1);
    NetUpdateFrequency = 8.0;
    super.UnPossessed();
    // End:0xee
    if(ParentFactory != none && !bAutoTurret || Controller == none || !ClassIsChildOf(Controller.Class, AutoTurretControllerClass))
    {
        ParentFactory.VehicleUnPossessed(self);
    }
    // End:0x140
    if(ParentTurret != none && !bAutoTurret || Controller == none || !ClassIsChildOf(Controller.Class, AutoTurretControllerClass))
    {
        ParentTurret.VehicleUnPossessed(self);
    }
    // End:0x1a9
    if(Health > 0 && !bDeleteMe)
    {
        // End:0x1a9
        if(bWasPlayer && bAutoTurret && AutoTurretControllerClass != none)
        {
            Controller = none;
            NewController = Spawn(AutoTurretControllerClass);
            // End:0x1a9
            if(NewController != none)
            {
                NewController.Possess(self);
            }
        }
    }
}

function KDriverEnter(Pawn P)
{
    local Controller C;

    bDriving = true;
    StuckCount = 0;
    // End:0x54
    if(!bRelativeExitPos)
    {
        PlayerEnterredRotation = P.Rotation;
        ExitPositions[0] = P.Location + vect(0.0, 0.0, 16.0);
    }
    C = P.Controller;
    // End:0xa1
    if(!bCanCarryFlag && C.PlayerReplicationInfo.HasFlag != none)
    {
        P.DropFlag();
    }
    Driver = P;
    Driver.StartDriving(self);
    C.bVehicleTransition = true;
    C.UnPossess();
    Driver.SetOwner(C);
    C.Possess(self);
    C.bVehicleTransition = false;
    DrivingStatusChanged();
    // End:0x12f
    if(PlayerController(C) != none)
    {
        VehicleLostTime = 0.0;
    }
    AttachFlag(PlayerReplicationInfo.HasFlag);
    Level.Game.DriverEnteredVehicle(self, P);
}

function AttachFlag(Actor FlagActor)
{
    // End:0x50
    if(!bDriverHoldsFlag && FlagActor != none)
    {
        AttachToBone(FlagActor, FlagBone);
        FlagActor.SetRelativeRotation(FlagRotation);
        FlagActor.SetRelativeLocation(FlagOffset);
    }
}

simulated event SetWheelsScale(float NewScale)
{
    WheelsScale = NewScale;
}

event bool KDriverLeave(bool bForceLeave)
{
    local Controller C;
    local PlayerController PC;
    local bool havePlaced, bOldHardAttach, bOldCollideWorld, bOldCollideActors, bOldBlockActors;

    // End:0x32
    if(!bForceLeave && !Level.Game.CanLeaveVehicle(self, Driver))
    {
        return false;
    }
    // End:0x70
    if(PlayerReplicationInfo != none && PlayerReplicationInfo.HasFlag != none)
    {
        Driver.HoldFlag(PlayerReplicationInfo.HasFlag);
    }
    // End:0x8a
    if(Controller == none && !bForceLeave)
    {
        return false;
    }
    // End:0x1a0
    if(Driver != none && !bRemoteControlled || bHideRemoteDriver)
    {
        bOldHardAttach = Driver.bHardAttach;
        bOldCollideWorld = Driver.bCollideWorld;
        bOldCollideActors = Driver.bCollideActors;
        bOldBlockActors = Driver.bBlockActors;
        Driver.bHardAttach = false;
        Driver.bCollideWorld = true;
        Driver.SetCollision(true, true);
        havePlaced = PlaceExitingDriver();
        // End:0x1a0
        if(!havePlaced && !bForceLeave)
        {
            Driver.bHardAttach = bOldHardAttach;
            Driver.bCollideWorld = bOldCollideWorld;
            Driver.SetCollision(bOldCollideActors, bOldBlockActors);
            return false;
        }
    }
    bDriving = false;
    C = Controller;
    // End:0x1d7
    if(C.RouteGoal == self)
    {
        C.RouteGoal = none;
    }
    // End:0x1fb
    if(C.MoveTarget == self)
    {
        C.MoveTarget = none;
    }
    C.bVehicleTransition = true;
    Controller.UnPossess();
    // End:0x2b1
    if(Driver != none && Driver.Health > 0)
    {
        Driver.SetRotation(Rotation);
        Driver.SetOwner(C);
        C.Possess(Driver);
        PC = PlayerController(C);
        // End:0x2a1
        if(PC != none)
        {
            PC.ClientSetViewTarget_K(Driver);
        }
        Driver.StopDriving(self);
    }
    C.bVehicleTransition = false;
    // End:0x2d8
    if(C == Controller)
    {
        Controller = none;
    }
    Level.Game.DriverLeftVehicle(self, Driver);
    Driver = none;
    DriverLeft();
    Throttle = 0.0;
    Steering = 0.0;
    Rise = 0.0;
    return true;
}

function DriverLeft()
{
    DrivingStatusChanged();
}

simulated event UpdateTiltForceFeedback()
{
    local Rotator SpringCenter;
    local float Pitch, Roll;
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x9d
    if(PC != none)
    {
        SpringCenter = Rotation;
        Pitch = float(Clamp(SpringCenter.Pitch, -CenterSpringRangePitch, CenterSpringRangePitch));
        Roll = float(Clamp(SpringCenter.Roll, -CenterSpringRangeRoll, CenterSpringRangeRoll));
        Pitch /= float(CenterSpringRangePitch);
        Roll /= float(CenterSpringRangeRoll);
        PC.ChangeSpringFeedbackEffect(CenterSpringForce, Roll, Pitch);
    }
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    // End:0x22
    if(bZeroPCRotOnEntry)
    {
        PC.SetRotation(rot(0, 0, 0));
    }
    TPCamDistance = default.TPCamDistance;
    DesiredTPCamDistance = TPCamDistance;
    // End:0x53
    if(!PC.bBehindView)
    {
        ActivateOverlay(true);
    }
    // End:0xc6
    if(PC.bEnableGUIForceFeedback && PC.bForceFeedbackSupported && Viewport(PC.Player) != none)
    {
        // End:0xb2
        if(CenterSpringRangePitch > 0 && CenterSpringRangeRoll > 0)
        {
            UpdateTiltForceFeedback();
        }
        PC.ClientPlayForceFeedback(CenterSpringForce);
    }
    // End:0x10e
    if(Driver != none)
    {
        Driver.AmbientSound = none;
        // End:0x10e
        if(Driver.Weapon != none)
        {
            Driver.Weapon.AmbientSound = none;
        }
    }
}

simulated function ClientClearController()
{
    ActivateOverlay(false);
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    // End:0x2a
    if(Driver != none)
    {
        Driver.bOwnerNoSee = Driver.default.bOwnerNoSee;
    }
    // End:0x50
    if(PC.bEnableGUIForceFeedback)
    {
        PC.StopForceFeedback(CenterSpringForce);
    }
    bWeaponisFiring = false;
    bWeaponisAltFiring = false;
    ActivateOverlay(false);
}

simulated function ActivateOverlay(bool bActive)
{
    // End:0x32
    if(bActive)
    {
        // End:0x2f
        if(HUDOverlayClass != none && HudOverlay == none)
        {
            HudOverlay = Spawn(HUDOverlayClass);
        }
    }
    // End:0x49
    else
    {
        // End:0x49
        if(HudOverlay != none)
        {
            HudOverlay.Destroy();
        }
    }
}

simulated function FixPCRotation(PlayerController PC);
simulated function AttachDriver(Pawn P)
{
    local Vector AttachPos;

    P.bHardAttach = true;
    AttachPos = Location + DrivePos >> Rotation;
    P.SetLocation(AttachPos);
    P.SetPhysics(0);
    P.SetBase(self);
    P.SetRelativeRotation(DriveRot);
}

simulated function DetachDriver(Pawn P);
function bool PlaceExitingDriver()
{
    local int i, j;
    local Vector tryPlace, Extent, HitLocation, HitNormal, ZOffset, RandomSphereLoc;

    local float BestDir, NewDir;

    // End:0x0d
    if(Driver == none)
    {
        return false;
    }
    Extent = Driver.default.CollisionRadius * vect(1.0, 1.0, 0.0);
    Extent.Z = Driver.default.CollisionHeight;
    ZOffset = Driver.default.CollisionHeight * vect(0.0, 0.0, 1.0);
    // End:0x1e7
    if(VSize(Velocity) > float(100))
    {
        tryPlace = Normal(Velocity Cross vect(0.0, 0.0, 1.0)) * CollisionRadius + Driver.default.CollisionRadius * 1.250;
        // End:0x111
        if(Controller != none && Controller.DirectionHint != vect(0.0, 0.0, 0.0))
        {
            // End:0x10e
            if(tryPlace Dot Controller.DirectionHint < float(0))
            {
                tryPlace *= float(-1);
            }
        }
        // End:0x12b
        else
        {
            // End:0x12b
            if(FRand() < 0.50)
            {
                tryPlace *= float(-1);
            }
        }
        // End:0x1e7
        if(Trace(HitLocation, HitNormal, Location + tryPlace + ZOffset, Location + ZOffset, false, Extent) == none && Driver.SetLocation(Location + tryPlace + ZOffset) || Trace(HitLocation, HitNormal, Location - tryPlace + ZOffset, Location + ZOffset, false, Extent) == none && Driver.SetLocation(Location - tryPlace + ZOffset))
        {
            return true;
        }
    }
    // End:0x3b2
    if(Controller != none && Controller.DirectionHint != vect(0.0, 0.0, 0.0))
    {
        tryPlace = Location;
        BestDir = 0.0;
        i = 0;
        J0x231:
        // End:0x2a0 [While If]
        if(i < ExitPositions.Length)
        {
            NewDir = Normal(ExitPositions[i] - Location) Dot Controller.DirectionHint;
            // End:0x296
            if(NewDir > BestDir)
            {
                BestDir = NewDir;
                tryPlace = ExitPositions[i];
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x231;
        }
        Controller.DirectionHint = vect(0.0, 0.0, 0.0);
        // End:0x3b2
        if(tryPlace != Location)
        {
            // End:0x39c
            if(bRelativeExitPos)
            {
                // End:0x30c
                if(ExitPositions[0].Z != float(0))
                {
                    ZOffset = vect(0.0, 0.0, 1.0) * ExitPositions[0].Z;
                }
                // End:0x32f
                else
                {
                    ZOffset = Driver.default.CollisionHeight * vect(0.0, 0.0, 2.0);
                }
                tryPlace = Location + tryPlace - ZOffset >> Rotation + ZOffset;
                // End:0x399
                if(Trace(HitLocation, HitNormal, tryPlace, Location + ZOffset, false, Extent) == none && Driver.SetLocation(tryPlace))
                {
                    return true;
                }
            }
            // End:0x3b2
            else
            {
                // End:0x3b2
                if(Driver.SetLocation(tryPlace))
                {
                    return true;
                }
            }
        }
    }
    // End:0x4b9
    if(!bRelativeExitPos)
    {
        i = 0;
        J0x3c4:
        // End:0x4b7 [While If]
        if(i < ExitPositions.Length)
        {
            tryPlace = ExitPositions[i];
            // End:0x3fe
            if(Driver.SetLocation(tryPlace))
            {
                return true;
            }
            // End:0x4ad
            else
            {
                j = 0;
                J0x405:
                // End:0x4ad [While If]
                if(j < 10)
                {
                    RandomSphereLoc = VRand() * float(200) * FMax(FRand(), 0.50);
                    RandomSphereLoc.Z = Extent.Z * FRand();
                    // End:0x48d
                    if(Trace(HitLocation, HitNormal, tryPlace + RandomSphereLoc, tryPlace, false, Extent) == none)
                    {
                        // End:0x48a
                        if(Driver.SetLocation(tryPlace + RandomSphereLoc))
                        {
                            return true;
                        }
                    }
                    // End:0x4a3
                    else
                    {
                        // End:0x4a3
                        if(Driver.SetLocation(HitLocation))
                        {
                            return true;
                        }
                    }
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x405;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x3c4;
        }
        return false;
    }
    i = 0;
    J0x4c0:
    // End:0x57e [While If]
    if(i < ExitPositions.Length)
    {
        // End:0x508
        if(ExitPositions[0].Z != float(0))
        {
            ZOffset = vect(0.0, 0.0, 1.0) * ExitPositions[0].Z;
        }
        // End:0x52b
        else
        {
            ZOffset = Driver.default.CollisionHeight * vect(0.0, 0.0, 2.0);
        }
        tryPlace = Location + ExitPositions[i] - ZOffset >> Rotation + ZOffset;
        // End:0x572
        if(!Driver.SetLocation(tryPlace))
        {
        }
        // End:0x574
        else
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4c0;
    }
    return false;
}

function Pawn CheckForHeadShot(Vector loc, Vector ray, float AdditionalScale)
{
    return none;
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local int ActualDamage;
    local Controller Killer;

    // End:0x25
    if(bSpawnProtected && instigatedBy != none && instigatedBy != self)
    {
        return;
    }
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x11f
    if(DamageType != none)
    {
        // End:0x9f
        if(instigatedBy == none || instigatedBy.Controller == none && DamageType.default.bDelayedDamage && DelayedDamageInstigatorController != none)
        {
            instigatedBy = DelayedDamageInstigatorController.Pawn;
        }
        Damage *= DamageType.default.VehicleDamageScaling;
        Momentum *= DamageType.default.VehicleMomentumScaling * MomentumMult;
        // End:0x11f
        if(bShowDamageOverlay && DamageType.default.DamageOverlayMaterial != none && Damage > 0)
        {
            SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, DamageType.default.DamageOverlayTime, false);
        }
    }
    // End:0x1f3
    if(bRemoteControlled && Driver != none)
    {
        ActualDamage = Damage;
        // End:0x173
        if(Weapon != none)
        {
            Weapon.AdjustPlayerDamage(ActualDamage, instigatedBy, HitLocation, Momentum, DamageType);
        }
        // End:0x19d
        if(instigatedBy != none && instigatedBy.HasUDamage())
        {
            ActualDamage *= float(2);
        }
        ActualDamage = Level.Game.ReduceDamage(ActualDamage, self, instigatedBy, HitLocation, Momentum, DamageType, WeaponType);
        // End:0x1f3
        if(Health - ActualDamage <= 0)
        {
            KDriverLeave(false);
        }
    }
    // End:0x224
    if(Physics != 13)
    {
        super.TakeDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
        return;
    }
    // End:0x257
    if(Weapon != none)
    {
        Weapon.AdjustPlayerDamage(Damage, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0x281
    if(instigatedBy != none && instigatedBy.HasUDamage())
    {
        Damage *= float(2);
    }
    ActualDamage = Level.Game.ReduceDamage(Damage, self, instigatedBy, HitLocation, Momentum, DamageType, WeaponType);
    Health -= ActualDamage;
    PlayHit(float(ActualDamage), instigatedBy, HitLocation, DamageType, Momentum);
    // End:0x3a9
    if(Health <= 0)
    {
        // End:0x330
        if(Driver != none && bEjectDriver || bRemoteControlled)
        {
            // End:0x329
            if(bEjectDriver)
            {
                EjectDriver();
            }
            // End:0x330
            else
            {
                KDriverLeave(false);
            }
        }
        // End:0x350
        if(instigatedBy != none)
        {
            Killer = instigatedBy.GetKillerController();
        }
        // End:0x387
        if(Killer == none && DamageType != none && DamageType.default.bDelayedDamage)
        {
            Killer = DelayedDamageInstigatorController;
        }
        Died(Killer, DamageType, HitLocation, CollisionPart, WeaponType);
    }
    // End:0x3e1
    else
    {
        // End:0x3e1
        if(Controller != none)
        {
            Controller.NotifyTakeHit(instigatedBy, HitLocation, ActualDamage, DamageType, Momentum, CollisionPart);
        }
    }
    MakeNoise(1.0);
    // End:0x43d
    if(!bDeleteMe)
    {
        // End:0x42d
        if(Location.Z > Level.StallZ)
        {
            Momentum.Z = FMin(Momentum.Z, 0.0);
        }
        KAddImpulse(Momentum, HitLocation);
    }
}

function bool HealDamage(int Amount, Controller Healer, class<DamageType> DamageType)
{
    // End:0x2a
    if(PlayerController(Healer) != none)
    {
        PlayerStartTime = Level.TimeSeconds + float(3);
    }
    // End:0x80
    if(Health <= 0 || float(Health) >= HealthMax || Amount <= 0 || Healer == none || !TeamLink(Healer.GetTeamNum()))
    {
        return false;
    }
    Health = Min(int(float(Health) + float(Amount) * LinkHealMult), int(HealthMax));
    NetUpdateTime = Level.TimeSeconds - float(1);
    return true;
}

function DriverRadiusDamage(float DamageAmount, float DamageRadius, Controller EventInstigator, class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local float damageScale, dist;
    local Vector Dir;

    // End:0x39
    if(EventInstigator == none || Driver == none || Driver.bCollideActors || bRemoteControlled)
    {
        return;
    }
    Dir = Driver.Location - HitLocation;
    dist = FMax(1.0, VSize(Dir));
    Dir = Dir / dist;
    damageScale = 1.0 - FMax(0.0, dist - Driver.CollisionRadius / DamageRadius);
    // End:0xb9
    if(damageScale <= float(0))
    {
        return;
    }
    Driver.SetDelayedDamageInstigatorController(EventInstigator);
    Driver.TakeDamage(int(damageScale * DamageAmount), EventInstigator.Pawn, Driver.Location - 0.50 * Driver.CollisionHeight + Driver.CollisionRadius * Dir, damageScale * Momentum * Dir, DamageType);
}

function DriverDied()
{
    local Controller C;

    Level.Game.DiscardInventory(Driver);
    // End:0x62
    if(PlayerReplicationInfo != none && PlayerReplicationInfo.HasFlag != none)
    {
        PlayerReplicationInfo.HasFlag.Drop(0.50 * Velocity);
    }
    // End:0x6f
    if(Driver == none)
    {
        return;
    }
    C = Controller;
    Driver.StopDriving(self);
    Driver.Controller = C;
    Driver.DrivenVehicle = self;
    // End:0xbb
    if(Controller == none)
    {
        return;
    }
    // End:0x10e
    if(PlayerController(Controller) != none)
    {
        Controller.SetLocation(Location);
        PlayerController(Controller).SetViewTarget(Driver);
        PlayerController(Controller).ClientSetViewTarget_L(Driver);
    }
    Controller.UnPossess();
    // End:0x133
    if(Controller == C)
    {
        Controller = none;
    }
    C.Pawn = Driver;
    Level.Game.DriverLeftVehicle(self, Driver);
    Driver = none;
    bDriving = false;
    Throttle = 0.0;
    Steering = 0.0;
    Rise = 0.0;
}

function Died(Controller Killer, class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local PlayerController PC;
    local Controller C;

    // End:0x1f
    if(bDeleteMe || Level.bLevelChange)
    {
        return;
    }
    // End:0x46
    if(Physics != 13)
    {
        super.Died(Killer, DamageType, HitLocation);
        return;
    }
    // End:0x81
    if(Level.Game.PreventDeath(self, Killer, DamageType, HitLocation))
    {
        Health = Max(Health, 1);
        return;
    }
    Health = Min(0, Health);
    // End:0x1e8
    if(Controller != none)
    {
        C = Controller;
        C.WasKilledBy(Killer);
        Level.Game.Killed(Killer, C, self, DamageType, CollisionPart, WeaponType);
        // End:0x1af
        if(C.bIsPlayer)
        {
            PC = PlayerController(C);
            // End:0x126
            if(PC != none)
            {
                ClientKDriverLeave(PC);
            }
            // End:0x12c
            else
            {
                ClientClearController();
            }
            // End:0x19f
            if(bRemoteControlled || bEjectDriver && Driver != none && Driver.Health > 0)
            {
                C.UnPossess();
                C.Possess(Driver);
                // End:0x195
                if(bEjectDriver)
                {
                    EjectDriver();
                }
                Driver = none;
            }
            // End:0x1af
            else
            {
                C.PawnDied(self);
            }
        }
        // End:0x1e5
        if(!C.bIsPlayer && !C.bDeleteMe)
        {
            C.Destroy();
        }
    }
    // End:0x21f
    else
    {
        Level.Game.Killed(Killer, Controller(Owner), self, DamageType, CollisionPart, WeaponType);
    }
    // End:0x247
    if(Killer != none)
    {
        TriggerEvent(Event, self, Killer.Pawn);
    }
    // End:0x254
    else
    {
        TriggerEvent(Event, self, none);
    }
    // End:0x271
    if(IsHumanControlled())
    {
        PlayerController(Controller).ForceDeathUpdate();
    }
    // End:0x27f
    if(!bDeleteMe)
    {
        Destroy();
    }
}

function AdjustDriverDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType)
{
    // End:0x13
    if(InGodMode())
    {
        Damage = 0;
    }
    // End:0x1f
    else
    {
        Damage *= DriverDamageMult;
    }
}

function EjectDriver()
{
    local Pawn OldPawn;
    local Vector EjectVel;

    OldPawn = Driver;
    KDriverLeave(true);
    // End:0x1f
    if(OldPawn == none)
    {
        return;
    }
    EjectVel = VRand();
    EjectVel.Z = 0.0;
    EjectVel = Normal(EjectVel) * 0.20 + vect(0.0, 0.0, 1.0) * EjectMomentum;
    OldPawn.Velocity = EjectVel;
    OldPawn.SpawnTime = Level.TimeSeconds;
    OldPawn.PlayTeleportEffect(false, false);
}

function UsedBy(Pawn User)
{
    // End:0x0d
    if(Driver != none)
    {
        return;
    }
    TryToDrive(User);
}

function Fire(optional float f)
{
    VehicleFire(false);
    bWeaponisFiring = true;
}

function AltFire(optional float f)
{
    VehicleFire(true);
    bWeaponisAltFiring = true;
}

function ClientVehicleCeaseFire(bool bWasAltFire)
{
    // End:0x14
    if(bWasAltFire)
    {
        bWeaponisAltFiring = false;
    }
    // End:0x1c
    else
    {
        bWeaponisFiring = false;
    }
    VehicleCeaseFire(bWasAltFire);
}

function VehicleFire(bool bWasAltFire)
{
    // End:0x14
    if(bWasAltFire)
    {
        bWeaponisAltFiring = true;
    }
    // End:0x1c
    else
    {
        bWeaponisFiring = true;
    }
}

function VehicleCeaseFire(bool bWasAltFire)
{
    // End:0x14
    if(bWasAltFire)
    {
        bWeaponisAltFiring = false;
    }
    // End:0x1c
    else
    {
        bWeaponisFiring = false;
    }
}

function bool StopWeaponFiring()
{
    local bool bResult;

    // End:0x20
    if(bWeaponisFiring)
    {
        ClientVehicleCeaseFire(false);
        bWeaponisFiring = false;
        bResult = true;
    }
    // End:0x40
    if(bWeaponisAltFiring)
    {
        ClientVehicleCeaseFire(true);
        bWeaponisAltFiring = false;
        bResult = true;
    }
    return bResult;
}

event UpdateEyeHeight(float DeltaTime)
{
    local Controller C;

    // End:0x35
    if(Controller != none && Controller.IsA('PlayerController'))
    {
        Controller.AdjustView(DeltaTime);
    }
    C = Level.ControllerList;
    J0x49:
    // End:0x9c [While If]
    if(C != none)
    {
        // End:0x85
        if(C.IsA('PlayerController') && PlayerController(C).ViewTarget == self)
        {
            return;
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    bUpdateEyeheight = false;
    EyeHeight = BaseEyeHeight;
}

simulated function FaceRotation(Rotator NewRotation, float DeltaTime);
simulated event SetAnimAction(name NewAction)
{
    // End:0x2a
    if(bDrawDriverInTP && Driver != none)
    {
        Driver.SetAnimAction(NewAction);
    }
}

event EncroachedBy(Actor Other);
event RanInto(Actor Other)
{
    local Vector Momentum;
    local float Speed;

    // End:0x50
    if(Pawn(Other) == none || Vehicle(Other) != none || Other == Instigator || Other.Role != 4)
    {
        return;
    }
    Speed = VSize(Velocity);
    // End:0x155
    if(Speed > MinRunOverSpeed)
    {
        Momentum = Velocity * 0.250 * Other.Mass;
        // End:0xfb
        if(Controller != none && Controller.SameTeamAs(Pawn(Other).Controller))
        {
            Momentum += Speed * 0.250 * Other.Mass * Normal(Velocity Cross vect(0.0, 0.0, 1.0));
        }
        // End:0x11b
        if(RanOverSound != none)
        {
            PlaySound(RanOverSound,, TransientSoundVolume * 2.50);
        }
        Other.TakeDamage(int(Speed * 0.0750), Instigator, Other.Location, Momentum, RanOverDamageType);
    }
}

function bool EncroachingOn(Actor Other)
{
    // End:0x77
    if(Other == none || Other == Instigator || Other.Role != 4 || !Other.bCollideActors && !Other.bBlockActors || VSize(Velocity) < float(10))
    {
        return false;
    }
    // End:0xdc
    if(Pawn(Other) != none && Vehicle(Other) == none)
    {
        Other.TakeDamage(10000, Instigator, Other.Location, Velocity * Other.Mass, CrushedDamageType);
        return false;
    }
}

simulated function bool FindValidTaunt(out name Sequence)
{
    // End:0x1a
    if(!bDrawDriverInTP || Driver == none)
    {
        return false;
    }
    return Driver.FindValidTaunt(Sequence);
}

simulated function bool CheckTauntValid(name Sequence)
{
    // End:0x1a
    if(!bDrawDriverInTP || Driver == none)
    {
        return false;
    }
    return Driver.CheckTauntValid(Sequence);
}

function bool Occupied()
{
    return Controller != none;
}

function float ReservationCostMultiplier()
{
    return 1.0;
}

function float NewReservationCostMultiplier(Pawn P)
{
    return ReservationCostMultiplier();
}

function bool ChangedReservation(Pawn P)
{
    return false;
}

function bool SpokenFor(Controller C)
{
    return false;
}

function SetReservation(Controller C);
function Vehicle OpenPositionFor(Pawn P)
{
    // End:0x0d
    if(Controller == none)
    {
        return self;
    }
    return none;
}

simulated function bool IndependentVehicle()
{
    return true;
}

function Actor GetBestEntry(Pawn P)
{
    return self;
}

function Vehicle GetMoveTargetFor(Pawn P)
{
    return self;
}

simulated event DrivingStatusChanged()
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x95
    if(bDriving && PC != none && PC.ViewTarget == none || !PC.ViewTarget.IsJoinedTo(self))
    {
        bDropDetail = Level.bDropDetail || Level.DetailMode == 0;
    }
    // End:0x9d
    else
    {
        bDropDetail = false;
    }
    // End:0xb0
    if(bDriving)
    {
        Enable('Tick');
    }
    // End:0xb7
    else
    {
        Disable('Tick');
    }
}

event TakeWaterDamage(float DeltaTime)
{
    local Vector HitLocation, HitNormal;
    local Actor EntryActor;

    TakeDamage(int(WaterDamage * DeltaTime), self, vect(0.0, 0.0, 0.0), vect(0.0, 0.0, 0.0), VehicleDrowningDamType);
    // End:0x153
    if(Level.TimeSeconds - SplashTime > 0.30 && PhysicsVolume.PawnEntryActor != none && !Level.bDropDetail && Level.DetailMode != 0 && EffectIsRelevant(Location, false) && VSize(Velocity) > float(300))
    {
        SplashTime = Level.TimeSeconds;
        // End:0x153
        if(!PhysicsVolume.TraceThisActor(HitLocation, HitNormal, Location - CollisionHeight * vect(0.0, 0.0, 1.0), Location + CollisionHeight * vect(0.0, 0.0, 1.0)))
        {
            EntryActor = Spawn(PhysicsVolume.PawnEntryActor, self,, HitLocation, rot(16384, 0, 0));
        }
    }
}

event LockOnWarning()
{
    local class<LocalMessage> LockOnClass;

    LockOnClass = class<LocalMessage>(DynamicLoadObject(LockOnClassString, class'Class'));
    PlayerController(Controller).ReceiveLocalizedMessage(LockOnClass, 12);
    LastLockWarningTime = Level.TimeSeconds;
}

simulated function bool PointOfView()
{
    // End:0x0d
    if(!bAllowViewChange)
    {
        return true;
    }
    return default.bDesiredBehindView;
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
    local Actor A;
    local class<Actor> TransEffect;

    // End:0x43
    if(GetTeam() == none || GetTeam().TeamIndex == 0)
    {
        TransEffect = class<Actor>(DynamicLoadObject(TransEffects[0], class'Class'));
    }
    // End:0x60
    else
    {
        TransEffect = class<Actor>(DynamicLoadObject(TransEffects[1], class'Class'));
    }
    // End:0x96
    if(TransEffect != none)
    {
        A = Spawn(TransEffect,,, Location + CollisionHeight * vect(0.0, 0.0, 0.750));
    }
    // End:0xae
    if(A != none)
    {
        A.SetBase(self);
    }
    super.PlayTeleportEffect(bOut, bSound);
}

simulated event PlayDying(class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart);
simulated function int GetTeamNum()
{
    // End:0x44
    if(Role == 4 && Team == 255 && Controller != none)
    {
        SetTeamNum(byte(Controller.GetTeamNum()));
    }
    return Team;
}

event NotifyEnemyLockedOn()
{
    bEnemyLockedOn = true;
}

function IncomingMissile(wProjectile P);
event NotifyEnemyLostLock()
{
    bEnemyLockedOn = false;
}

function SetTeamNum(byte t)
{
    PrevTeam = Team;
    Team = t;
    // End:0x2f
    if(PrevTeam != Team)
    {
        TeamChanged();
    }
}

simulated event TeamChanged();
simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    Canvas.DrawText("Steering " $ string(Steering) $ " throttle " $ string(Throttle) $ " rise " $ string(Rise) $ " // DrivePos : " $ string(DrivePos));
    // End:0x138
    if(Driver != none)
    {
        YPos += YL;
        YPos += YL;
        Canvas.SetPos(0.0, YPos);
        Canvas.SetDrawColor(0, 0, byte(255));
        Canvas.DrawText("--- DRIVER");
        Canvas.SetPos(4.0, YPos);
        Driver.DisplayDebug(Canvas, YL, YPos);
    }
}

function Actor ShootSpecial(Actor A)
{
    local Controller OldController;

    // End:0x23
    if(!Controller.bCanDoSpecial || Weapon == none)
    {
        return none;
    }
    Controller = OldController;
    // End:0xb4
    if(KDriverLeave(false) && OldController.Pawn != none)
    {
        OldController.Pawn.SetRotation(rotator(A.Location - OldController.Pawn.Location));
        OldController.Focus = A;
        OldController.FireWeaponAt(A);
    }
    return A;
}

simulated event Stalled();
simulated event UnStalled();
simulated function NextWeapon()
{
    local PlayerController PC;

    // End:0x16
    if(Level.Pauser != none)
    {
        return;
    }
    PC = PlayerController(Controller);
    // End:0x33
    if(PC == none)
    {
        return;
    }
    // End:0x75
    if(!PC.bBehindView)
    {
        PC.BehindView(true);
        DesiredTPCamDistance = TPCamDistRange.Min;
        TPCamDistance = DesiredTPCamDistance;
    }
    // End:0x98
    else
    {
        DesiredTPCamDistance = float(Min(int(DesiredTPCamDistance + float(100)), int(TPCamDistRange.Max)));
    }
    default.TPCamDistance = DesiredTPCamDistance;
    StaticSaveConfig();
}

simulated function PrevWeapon()
{
    local PlayerController PC;

    // End:0x16
    if(Level.Pauser != none)
    {
        return;
    }
    PC = PlayerController(Controller);
    // End:0x49
    if(PC == none || !PC.bBehindView)
    {
        return;
    }
    // End:0x70
    if(DesiredTPCamDistance ~= TPCamDistRange.Min)
    {
        PC.BehindView(false);
    }
    // End:0xa4
    else
    {
        DesiredTPCamDistance = float(Max(int(DesiredTPCamDistance - float(100)), int(TPCamDistRange.Min)));
        default.TPCamDistance = DesiredTPCamDistance;
        StaticSaveConfig();
    }
}

function bool TeamLink(int TeamNum)
{
    return LinkHealMult > float(0) && Team == TeamNum && Health > 0;
}

event bool NeedsFlip()
{
    local Vector worldUp, gravUp;
    local float GravMag;

    GravMag = VSize(PhysicsVolume.Gravity);
    // End:0x3b
    if(GravMag < 0.10)
    {
        gravUp = vect(0.0, 0.0, 1.0);
    }
    // End:0x5d
    else
    {
        gravUp = -1.0 * PhysicsVolume.Gravity / GravMag;
    }
    worldUp = vect(0.0, 0.0, 1.0) >> Rotation;
    // End:0x90
    if(worldUp Dot gravUp < -0.50)
    {
        return true;
    }
    return false;
}

function Flip(Vector HitNormal, float ForceScale);
simulated function float ChargeBar();
simulated function ClientPlayForceFeedback(string EffectName)
{
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x43
    if(PC != none && PC.bEnableGUIForceFeedback)
    {
        PC.ClientPlayForceFeedback(EffectName);
    }
}

simulated function StopForceFeedback(string EffectName)
{
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x43
    if(PC != none && PC.bEnableGUIForceFeedback)
    {
        PC.StopForceFeedback(EffectName);
    }
}

function ServerPlayHorn(int HornIndex)
{
    // End:0x73
    if(Level.TimeSeconds - LastHornTime > 3.0 && HornIndex >= 0 && HornIndex < HornSounds.Length)
    {
        PlaySound(HornSounds[HornIndex],, 3.50 * TransientSoundVolume,, 800.0);
        LastHornTime = Level.TimeSeconds;
    }
}

simulated function int NumPassengers()
{
    // End:0x0d
    if(Driver != none)
    {
        return 1;
    }
    return 0;
}

function Pawn GetInstigator()
{
    return self;
}

function AIController GetBotPassenger()
{
    return AIController(Controller);
}

event bool IsVehicleEmpty()
{
    return Driver == none;
}

function bool HasOccupiedTurret()
{
    return false;
}

function float AdjustedStrength()
{
    // End:0x1a
    if(bStationary && bDefensive)
    {
        return 1.0;
    }
    return 0.0;
}

static function StaticPrecache(LevelInfo L);
function int GetSpree()
{
    // End:0x1b
    if(Driver != none)
    {
        return Driver.GetSpree();
    }
    return 0;
}

function IncrementSpree()
{
    // End:0x1a
    if(Driver != none)
    {
        Driver.IncrementSpree();
    }
}

simulated function POVChanged(PlayerController PC, bool bBehindViewChanged)
{
    // End:0xa6
    if(PC.bBehindView)
    {
        // End:0x4c
        if(bBehindViewChanged && bPCRelativeFPRotation)
        {
            PC.SetRotation(rotator(vector(PC.Rotation) >> Rotation));
        }
        bOwnerNoSee = false;
        // End:0x8d
        if(Driver != none)
        {
            // End:0x7c
            if(bDrawDriverInTP)
            {
                Driver.bOwnerNoSee = false;
            }
            // End:0x8d
            else
            {
                Driver.bOwnerNoSee = true;
            }
        }
        // End:0xa3
        if(PC == Controller)
        {
            ActivateOverlay(false);
        }
    }
    // End:0x12e
    else
    {
        // End:0xd5
        if(bPCRelativeFPRotation)
        {
            PC.SetRotation(rotator(vector(PC.Rotation) << Rotation));
        }
        // End:0xe9
        if(bDrawMeshInFP)
        {
            bOwnerNoSee = false;
        }
        // End:0xf1
        else
        {
            bOwnerNoSee = true;
        }
        // End:0x10d
        if(Driver != none)
        {
            Driver.bOwnerNoSee = true;
        }
        // End:0x12e
        if(bDriving && PC == Controller)
        {
            ActivateOverlay(true);
        }
    }
}

function PlayTakeHit(Vector HitLocation, int Damage, class<DamageType> DamageType)
{
    local int SoundNum;

    // End:0x9e
    if(IndependentVehicle() && DamageType.default.bBulletHit && BulletSounds.Length > 0)
    {
        SoundNum = Rand(BulletSounds.Length);
        // End:0x80
        if(Controller != none && Controller == Level.GetLocalPlayerController())
        {
            PlayOwnedSound(BulletSounds[SoundNum], 0, 2.0, false, 400.0);
        }
        // End:0x9e
        else
        {
            PlayOwnedSound(BulletSounds[SoundNum], 0, 2.0, false, 100.0);
        }
    }
}

function array<Vehicle> GetTurrets();
function CheckSuperBerserk();
event bool VerifyLock(Actor Aggressor, out Actor NewTarget)
{
    return true;
}

simulated function Actor AlternateTarget()
{
    return none;
}

function ShouldTargetMissile(wProjectile P)
{
    local AIController C;

    C = AIController(Controller);
    // End:0x77
    if(C != none && C.Skill >= 5.0 && C.Enemy == none || !C.LineOfSightTo(C.Enemy))
    {
        ShootMissile(P);
    }
}

function ShootMissile(wProjectile P)
{
    Controller.Focus = P;
    Controller.FireWeaponAt(P);
}

function bool ImportantVehicle()
{
    return false;
}

function bool IsArtillery()
{
    return false;
}

function SetEntryViewRotation(Rotator R);
function SetExitViewRotation(Pawn Driver);

state UnDeployed
{
    function VehicleFire(bool bWasAltFire)
    {
        global.VehicleFire(bWasAltFire);
    }

    function VehicleCeaseFire(bool bWasAltFire)
    {
        global.VehicleCeaseFire(bWasAltFire);
    }

}

state Deployed
{
    function VehicleFire(bool bWasAltFire)
    {
        global.VehicleFire(bWasAltFire);
    }

    function VehicleCeaseFire(bool bWasAltFire)
    {
        global.VehicleCeaseFire(bWasAltFire);
    }

}

defaultproperties
{
    bDrawVehicleShadow=true
    bRelativeExitPos=true
    bZeroPCRotOnEntry=true
    bPCRelativeFPRotation=true
    bAllowViewChange=true
    bAdjustDriversHead=true
    bDesiredBehindView=true
    bDriverHoldsFlag=true
    bCanCarryFlag=true
    Team=255
    OldTeam=255
    PrevTeam=255
    EjectMomentum=1000.0
    DriveAnim=Vehicle_Driving
    ExitPositions=// Object reference not set to an instance of an object.
    
    EntryRadius=100.0
    TPCamDistance=600.0
    CenterSpringForce="SpringONSHoverBike"
    CenterSpringRangePitch=2000
    CenterSpringRangeRoll=2000
    TPCamLookat=(X=-100.0,Y=0.0,Z=100.0)
    CameraSpeed=500.0
    TPCamDistRange=(Min=50.0,Max=1500.0)
    MaxViewYaw=16000
    MaxViewPitch=16000
    TransEffects[0]="XEffects.TransEffectRed"
    TransEffects[1]="XEffects.TransEffectBlue"
    ShadowMaxTraceDist=350.0
    ShadowCullDistance=1500.0
    MomentumMult=4.0
    DriverDamageMult=1.0
    LockOnClassString="Onslaught.ONSOnslaughtMessage"
    LockWarningInterval=1.50
    VehiclePositionString="Vehicle Interior"
    VehicleNameString="Vehicle"
    RanOverDamageType=class'DamRanOver'
    CrushedDamageType=class'Crushed'
    LinkHealMult=0.350
    MaxDesireability=0.50
    ObjectiveGetOutDist=1000.0
    bCanBeBaseForPawns=true
    bDontPossess=true
    bUseCompressedPosition=true
    SightRadius=15000.0
    LandMovementState=PlayerDriving
    NetUpdateFrequency=4.0
    NetPriority=1.0
    CollisionRadius=120.0
    CollisionHeight=50.0
}