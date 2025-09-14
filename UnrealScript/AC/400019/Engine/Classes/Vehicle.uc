class Vehicle extends Pawn
    abstract
    native
    nativereplication
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
var Class<Controller> AutoTurretControllerClass;
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
var localized cache string VehicleNameString;
var localized cache string VehicleDescription;
var Texture TeamBeaconTexture;
var Texture NoEntryTexture;
var Material TeamBeaconBorderMaterial;
var AIMarker myMarker;
var float MinRunOverSpeed;
var Class<DamageType> RanOverDamageType;
var Class<DamageType> CrushedDamageType;
var name StolenAnnouncement;
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
var float LastHornTime;
var() string BulletSounds;
var() float WaterDamage;
var Class<DamageType> VehicleDrowningDamType;
var Class<Actor> HUDOverlayClass;
var Actor HudOverlay;
var() Vector HUDOverlayOffset;
var() float HUDOverlayFOV;
var() Material SpawnOverlay[2];
var SVehicleIcon VehicleIcon;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        ClientClearController, ClientKDriverEnter, 
        ClientKDriverLeave, FixPCRotation;

    // Pos:0x00D
    reliable if(bNetDirty && int(Role) == int(ROLE_Authority))
        Driver, Team, 
        WheelsScale, bDriving, 
        bTeamLocked, bVehicleDestroyed;

    // Pos:0x025
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        bHUDTrackVehicle;

    // Pos:0x03D
    reliable if(int(Role) < int(ROLE_Authority))
        VehicleCeaseFire, VehicleFire;
}

function PreBeginPlay()
{
    // End:0x2F
    if(!Level.Game.bAllowVehicles && !bDeleteMe)
    {
        Destroy();
        return;
    }
    super.PreBeginPlay();
    //return;    
}

function PlayerChangedTeam()
{
    // End:0x22
    if(Driver != none)
    {
        Driver.KilledBy(Driver);        
    }
    else
    {
        super.PlayerChangedTeam();
    }
    //return;    
}

simulated function SetBaseEyeheight()
{
    BaseEyeHeight = default.BaseEyeHeight;
    EyeHeight = BaseEyeHeight;
    //return;    
}

simulated function string GetVehiclePositionString()
{
    return VehiclePositionString;
    //return;    
}

function Suicide()
{
    // End:0x22
    if(Driver != none)
    {
        Driver.KilledBy(Driver);        
    }
    else
    {
        KilledBy(self);
    }
    //return;    
}

function bool CheatWalk()
{
    return false;
    //return;    
}

function bool CheatGhost()
{
    return false;
    //return;    
}

function bool CheatFly()
{
    return false;
    //return;    
}

event RegisterTurret()
{
    local Controller NewController;

    // End:0x98
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x5C
        if((bAutoTurret && Controller == none) && AutoTurretControllerClass != none)
        {
            NewController = Spawn(AutoTurretControllerClass);
            // End:0x5C
            if(NewController != none)
            {
                NewController.Possess(self);
            }
        }
        // End:0x98
        if((!bAutoTurret && !bNonHumanControl) && IndependentVehicle())
        {
            Level.Game.RegisterVehicle(self);
        }
    }
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x11
    if(bDeleteMe)
    {
        return;
    }
    // End:0xE5
    if((bVehicleShadows && bDrawVehicleShadow) && int(Level.NetMode) != int(NM_DedicatedServer))
    {
        VehicleShadow = Spawn(Class'Engine.ShadowProjector', self, 'None', Location);
        VehicleShadow.ShadowActor = self;
        VehicleShadow.bBlobShadow = false;
        VehicleShadow.LightDirection = Normal(vect(1.0000000, 1.0000000, 6.0000000));
        VehicleShadow.LightDistance = 1200.0000000;
        VehicleShadow.MaxTraceDistance = int(ShadowMaxTraceDist);
        VehicleShadow.CullDistance = ShadowCullDistance;
        VehicleShadow.InitShadow();
    }
    RegisterTurret();
    OldTeam = Team;
    PrevTeam = Team;
    //return;    
}

simulated event SetInitialState()
{
    super(Actor).SetInitialState();
    Disable('Tick');
    //return;    
}

function bool StronglyRecommended(Actor S, int TeamIndex, Actor Objective)
{
    return bKeyVehicle;
    //return;    
}

function float BotDesireability(Actor S, int TeamIndex, Actor Objective)
{
    local bool bSameTeam;
    local PlayerController P;

    bSameTeam = (GetTeamNum()) == TeamIndex;
    // End:0xB7
    if(bSameTeam)
    {
        // End:0x3B
        if(Level.TimeSeconds < TeamUseTime)
        {
            return 0.0000000;
        }
        // End:0xB7
        if(!bKeyVehicle && Level.TimeSeconds < PlayerStartTime)
        {
            P = Level.GetLocalPlayerController();
            // End:0xB7
            if((P == none) || (P.Pawn != none) && Vehicle(P.Pawn) == none)
            {
                return 0.0000000;
            }
        }
    }
    // End:0xF2
    if((!bKeyVehicle && !bStationary) && Level.TimeSeconds < VehicleLostTime)
    {
        return 0.0000000;        
    }
    else
    {
        // End:0x126
        if(((Health <= 0) || Occupied()) || bTeamLocked && !bSameTeam)
        {
            return 0.0000000;
        }
    }
    // End:0x135
    if(bKeyVehicle)
    {
        return 100.0000000;
    }
    return (MaxDesireability * 0.5000000) + ((MaxDesireability * 0.5000000) * (float(Health) / HealthMax));
    //return;    
}

simulated function Destroyed()
{
    local Vehicle V, Prev;

    // End:0x1B
    if(ParentFactory != none)
    {
        ParentFactory.VehicleDestroyed(self);
    }
    // End:0x36
    if(ParentTurret != none)
    {
        ParentTurret.VehicleDestroyed(self);
    }
    // End:0x4D
    if(VehicleShadow != none)
    {
        VehicleShadow.Destroy();
    }
    // End:0xA7
    if(((bAutoTurret && Controller != none) && ClassIsChildOf(Controller.Class, AutoTurretControllerClass)) && !Controller.bDeleteMe)
    {
        Controller.Destroy();
        Controller = none;
    }
    // End:0xB8
    if(Driver != none)
    {
        Destroyed_HandleDriver();
    }
    // End:0x1A9
    if(Level.Game != none)
    {
        // End:0x109
        if(Level.Game.VehicleList == self)
        {
            Level.Game.VehicleList = NextVehicle;            
        }
        else
        {
            Prev = Level.Game.VehicleList;
            // End:0x1A9
            if(Prev != none)
            {
                V = Level.Game.VehicleList.NextVehicle;
                J0x157:

                // End:0x1A9 [Loop If]
                if(V != none)
                {
                    // End:0x187
                    if(V == self)
                    {
                        Prev.NextVehicle = NextVehicle;
                        // [Explicit Break]
                        goto J0x1A9;                        
                    }
                    else
                    {
                        Prev = V;
                    }
                    V = V.NextVehicle;
                    // [Loop Continue]
                    goto J0x157;
                }
            }
        }
    }
    J0x1A9:

    super.Destroyed();
    //return;    
}

simulated function Destroyed_HandleDriver()
{
    local Pawn OldDriver;

    Driver.LastRenderTime = LastRenderTime;
    // End:0x144
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0xB1
        if(((((Driver != none) && !bRemoteControlled) && !bEjectDriver) && !bDrawDriverInTP) && Driver.Health > 0)
        {
            OldDriver = Driver;
            Driver = none;
            OldDriver.DrivenVehicle = none;
            // End:0xAE
            if(!OldDriver.bDeleteMe)
            {
                OldDriver.Destroy();
            }            
        }
        else
        {
            // End:0x141
            if(!bRemoteControlled && !bEjectDriver)
            {
                // End:0xFF
                if(!bDrawDriverInTP && PlaceExitingDriver())
                {
                    Driver.StopDriving(self);
                    Driver.DrivenVehicle = self;
                }
                Driver.TearOffMomentum = Velocity * 0.2500000;
                Driver.Died(Controller, Class'Engine.DamRanOver', Driver.Location);
            }
        }        
    }
    else
    {
        // End:0x168
        if(Driver.DrivenVehicle == self)
        {
            Driver.StopDriving(self);
        }
    }
    //return;    
}

simulated function Vector GetCameraLocationStart()
{
    return Location;
    //return;    
}

simulated function SpecialCalcBehindView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Vector CamLookAt, HitLocation, HitNormal, OffsetVector;
    local Actor HitActor;
    local Vector X, Y, Z;

    // End:0x42
    if(DesiredTPCamDistance < TPCamDistance)
    {
        TPCamDistance = FMax(DesiredTPCamDistance, TPCamDistance - (CameraSpeed * (Level.TimeSeconds - LastCameraCalcTime)));        
    }
    else
    {
        // End:0x81
        if(DesiredTPCamDistance > TPCamDistance)
        {
            TPCamDistance = FMin(DesiredTPCamDistance, TPCamDistance + (CameraSpeed * (Level.TimeSeconds - LastCameraCalcTime)));
        }
    }
    GetAxes(PC.Rotation, X, Y, Z);
    ViewActor = self;
    CamLookAt = ((GetCameraLocationStart()) + (TPCamLookat >> Rotation)) + TPCamWorldOffset;
    OffsetVector = vect(0.0000000, 0.0000000, 0.0000000);
    OffsetVector.X = -1.0000000 * TPCamDistance;
    CameraLocation = CamLookAt + (OffsetVector >> PC.Rotation);
    HitActor = Trace(HitLocation, HitNormal, CameraLocation, CamLookAt, true, vect(40.0000000, 40.0000000, 40.0000000));
    // End:0x1AA
    if((HitActor != none) && (HitActor.bWorldGeometry || HitActor == (GetVehicleBase())) || Trace(HitLocation, HitNormal, CameraLocation, CamLookAt, false, vect(40.0000000, 40.0000000, 40.0000000)) != none)
    {
        CameraLocation = HitLocation;
    }
    CameraRotation = Normalize(PC.Rotation + PC.ShakeRot);
    CameraLocation = ((CameraLocation + (PC.ShakeOffset.X * X)) + (PC.ShakeOffset.Y * Y)) + (PC.ShakeOffset.Z * Z);
    //return;    
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
    else
    {
        CameraRotation = PC.Rotation;
    }
    CamViewOffsetWorld = FPCamViewOffset >> CameraRotation;
    CameraLocation = ((GetCameraLocationStart()) + (FPCamPos >> Rotation)) + CamViewOffsetWorld;
    // End:0x127
    if(bFPNoZFromCameraPitch)
    {
        VehicleZ = vect(0.0000000, 0.0000000, 1.0000000) >> Rotation;
        CamViewOffsetZAmount = CamViewOffsetWorld Dot VehicleZ;
        CameraLocation -= (CamViewOffsetZAmount * VehicleZ);
    }
    CameraRotation = Normalize(CameraRotation + PC.ShakeRot);
    CameraLocation = ((CameraLocation + (PC.ShakeOffset.X * X)) + (PC.ShakeOffset.Y * Y)) + (PC.ShakeOffset.Z * Z);
    //return;    
}

simulated function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x33
    if((PC == none) || PC.ViewTarget != self)
    {
        return false;
    }
    // End:0x62
    if(PC.bBehindView)
    {
        SpecialCalcBehindView(PC, ViewActor, CameraLocation, CameraRotation);        
    }
    else
    {
        SpecialCalcFirstPersonView(PC, ViewActor, CameraLocation, CameraRotation);
    }
    LastCameraCalcTime = Level.TimeSeconds;
    return true;
    //return;    
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
        DesiredTPCamDistance = ((TPCamDistRange.Max - TPCamDistRange.Min) * (Viewer.CameraDist / Viewer.CameraDistRange.Max)) + TPCamDistRange.Min;
        SpecialCalcBehindView(Viewer, ViewActor, CameraLocation, CameraRotation);        
    }
    else
    {
        SpecialCalcFirstPersonView(Viewer, ViewActor, CameraLocation, DummyRotation);
    }
    LastCameraCalcTime = Level.TimeSeconds;
    Viewer.SetLocation(CameraLocation);
    return true;
    //return;    
}

function Vehicle FindEntryVehicle(Pawn P)
{
    // End:0x1B
    if(AIController(P.Controller) != none)
    {
        return self;
    }
    // End:0x4D
    if(VSize(P.Location - (Location + (EntryPosition >> Rotation))) < EntryRadius)
    {
        return self;
    }
    return none;
    //return;    
}

function bool TryToDrive(Pawn P)
{
    // End:0x86
    if((((((bNonHumanControl || P.Controller == none) || Driver != none) || P.DrivenVehicle != none) || !P.Controller.bIsPlayer) || P.IsA('Vehicle')) || Health <= 0)
    {
        return false;
    }
    // End:0xBC
    if((P.Weapon != none) && P.Weapon.CheckTryToDrive() == false)
    {
        return false;
    }
    // End:0xE1
    if(!Level.Game.CanEnterVehicle(self, P))
    {
        return false;
    }
    // End:0x135
    if(!bTeamLocked || P.GetTeamNum() == int(Team))
    {
        // End:0x125
        if(bEnterringUnlocks && bTeamLocked)
        {
            bTeamLocked = false;
        }
        KDriverEnter(P);
        return true;        
    }
    else
    {
        VehicleLocked(P);
        return false;
    }
    //return;    
}

event VehicleLocked(Pawn P)
{
    //return;    
}

function PossessedBy(Controller C)
{
    local PlayerController PC;

    // End:0x5A
    if(((bAutoTurret && Controller != none) && ClassIsChildOf(Controller.Class, AutoTurretControllerClass)) && !Controller.bDeleteMe)
    {
        Controller.Destroy();
        Controller = none;
    }
    super.PossessedBy(C);
    // End:0xF7
    if(C.GetTeamNum() != int(Team))
    {
        // End:0xCA
        if((int(Team) != 255) && PlayerController(C) != none)
        {
            // End:0xCA
            if(StolenAnnouncement != 'None')
            {
                PlayerController(C).PlayRewardAnnouncement(StolenAnnouncement, 1);
            }
        }
        // End:0xF7
        if(C.GetTeamNum() != 255)
        {
            SetTeamNum(byte(C.GetTeamNum()));
        }
    }
    NetPriority = 3.0000000;
    NetUpdateFrequency = C.BtrUpdateFrequency;
    ThrottleTime = Level.TimeSeconds;
    bSpawnProtected = false;
    PC = PlayerController(C);
    // End:0x158
    if(PC != none)
    {
        ClientKDriverEnter(PC);
    }
    // End:0x19D
    if((ParentFactory != none) && !bAutoTurret || !ClassIsChildOf(C.Class, AutoTurretControllerClass))
    {
        ParentFactory.VehiclePossessed(self);
    }
    // End:0x1E2
    if((ParentTurret != none) && !bAutoTurret || !ClassIsChildOf(C.Class, AutoTurretControllerClass))
    {
        ParentTurret.VehiclePossessed(self);
    }
    //return;    
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
        // End:0x5E
        if(bPCRelativeFPRotation && !PC.bBehindView)
        {
            FixPCRotation(PC);
        }        
    }
    else
    {
        ClientClearController();
    }
    NetPriority = default.NetPriority;
    NetUpdateTime = Level.TimeSeconds - float(1);
    NetUpdateFrequency = 8.0000000;
    super.UnPossessed();
    // End:0xEE
    if((ParentFactory != none) && (!bAutoTurret || Controller == none) || !ClassIsChildOf(Controller.Class, AutoTurretControllerClass))
    {
        ParentFactory.VehicleUnPossessed(self);
    }
    // End:0x140
    if((ParentTurret != none) && (!bAutoTurret || Controller == none) || !ClassIsChildOf(Controller.Class, AutoTurretControllerClass))
    {
        ParentTurret.VehicleUnPossessed(self);
    }
    // End:0x1A9
    if((Health > 0) && !bDeleteMe)
    {
        // End:0x1A9
        if((bWasPlayer && bAutoTurret) && AutoTurretControllerClass != none)
        {
            Controller = none;
            NewController = Spawn(AutoTurretControllerClass);
            // End:0x1A9
            if(NewController != none)
            {
                NewController.Possess(self);
            }
        }
    }
    //return;    
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
        ExitPositions[0] = P.Location + vect(0.0000000, 0.0000000, 16.0000000);
    }
    C = P.Controller;
    // End:0xA1
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
    // End:0x12F
    if(PlayerController(C) != none)
    {
        VehicleLostTime = 0.0000000;
    }
    AttachFlag(PlayerReplicationInfo.HasFlag);
    Level.Game.DriverEnteredVehicle(self, P);
    //return;    
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
    //return;    
}

simulated event SetWheelsScale(float NewScale)
{
    WheelsScale = NewScale;
    //return;    
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
    if((PlayerReplicationInfo != none) && PlayerReplicationInfo.HasFlag != none)
    {
        Driver.HoldFlag(PlayerReplicationInfo.HasFlag);
    }
    // End:0x8A
    if((Controller == none) && !bForceLeave)
    {
        return false;
    }
    // End:0x1A0
    if((Driver != none) && !bRemoteControlled || bHideRemoteDriver)
    {
        bOldHardAttach = Driver.bHardAttach;
        bOldCollideWorld = Driver.bCollideWorld;
        bOldCollideActors = Driver.bCollideActors;
        bOldBlockActors = Driver.bBlockActors;
        Driver.bHardAttach = false;
        Driver.bCollideWorld = true;
        Driver.SetCollision(true, true);
        havePlaced = PlaceExitingDriver();
        // End:0x1A0
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
    // End:0x1D7
    if(C.RouteGoal == self)
    {
        C.RouteGoal = none;
    }
    // End:0x1FB
    if(C.MoveTarget == self)
    {
        C.MoveTarget = none;
    }
    C.bVehicleTransition = true;
    Controller.UnPossess();
    // End:0x2B1
    if((Driver != none) && Driver.Health > 0)
    {
        Driver.SetRotation(Rotation);
        Driver.SetOwner(C);
        C.Possess(Driver);
        PC = PlayerController(C);
        // End:0x2A1
        if(PC != none)
        {
            PC.ClientSetViewTarget_K(Driver);
        }
        Driver.StopDriving(self);
    }
    C.bVehicleTransition = false;
    // End:0x2D8
    if(C == Controller)
    {
        Controller = none;
    }
    Level.Game.DriverLeftVehicle(self, Driver);
    Driver = none;
    DriverLeft();
    Throttle = 0.0000000;
    Steering = 0.0000000;
    Rise = 0.0000000;
    return true;
    //return;    
}

function DriverLeft()
{
    DrivingStatusChanged();
    //return;    
}

simulated event UpdateTiltForceFeedback()
{
    local Rotator SpringCenter;
    local float Pitch, Roll;
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x9D
    if(PC != none)
    {
        SpringCenter = Rotation;
        Pitch = float(Clamp(SpringCenter.Pitch, -CenterSpringRangePitch, CenterSpringRangePitch));
        Roll = float(Clamp(SpringCenter.Roll, -CenterSpringRangeRoll, CenterSpringRangeRoll));
        Pitch /= float(CenterSpringRangePitch);
        Roll /= float(CenterSpringRangeRoll);
        PC.ChangeSpringFeedbackEffect(CenterSpringForce, Roll, Pitch);
    }
    //return;    
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
    // End:0xC6
    if((PC.bEnableGUIForceFeedback && PC.bForceFeedbackSupported) && Viewport(PC.Player) != none)
    {
        // End:0xB2
        if((CenterSpringRangePitch > 0) && CenterSpringRangeRoll > 0)
        {
            UpdateTiltForceFeedback();
        }
        PC.ClientPlayForceFeedback(CenterSpringForce);
    }
    // End:0x10E
    if(Driver != none)
    {
        Driver.AmbientSound = none;
        // End:0x10E
        if(Driver.Weapon != none)
        {
            Driver.Weapon.AmbientSound = none;
        }
    }
    //return;    
}

simulated function ClientClearController()
{
    ActivateOverlay(false);
    //return;    
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    // End:0x2A
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
    //return;    
}

simulated function ActivateOverlay(bool bActive)
{
    // End:0x32
    if(bActive)
    {
        // End:0x2F
        if((HUDOverlayClass != none) && HudOverlay == none)
        {
            HudOverlay = Spawn(HUDOverlayClass);
        }        
    }
    else
    {
        // End:0x49
        if(HudOverlay != none)
        {
            HudOverlay.Destroy();
        }
    }
    //return;    
}

simulated function FixPCRotation(PlayerController PC)
{
    //return;    
}

simulated function AttachDriver(Pawn P)
{
    local Vector AttachPos;

    P.bHardAttach = true;
    AttachPos = Location + (DrivePos >> Rotation);
    P.SetLocation(AttachPos);
    P.SetPhysics(0);
    P.SetBase(self);
    P.SetRelativeRotation(DriveRot);
    //return;    
}

simulated function DetachDriver(Pawn P)
{
    //return;    
}

function bool PlaceExitingDriver()
{
    local int i, j;
    local Vector tryPlace, Extent, HitLocation, HitNormal, ZOffset, RandomSphereLoc;

    local float BestDir, NewDir;

    // End:0x0D
    if(Driver == none)
    {
        return false;
    }
    Extent = Driver.default.CollisionRadius * vect(1.0000000, 1.0000000, 0.0000000);
    Extent.Z = Driver.default.CollisionHeight;
    ZOffset = Driver.default.CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000);
    // End:0x1E7
    if(VSize(Velocity) > float(100))
    {
        tryPlace = (Normal(Velocity Cross vect(0.0000000, 0.0000000, 1.0000000)) * (CollisionRadius + Driver.default.CollisionRadius)) * 1.2500000;
        // End:0x111
        if((Controller != none) && Controller.DirectionHint != vect(0.0000000, 0.0000000, 0.0000000))
        {
            // End:0x10E
            if((tryPlace Dot Controller.DirectionHint) < float(0))
            {
                tryPlace *= float(-1);
            }            
        }
        else
        {
            // End:0x12B
            if(FRand() < 0.5000000)
            {
                tryPlace *= float(-1);
            }
        }
        // End:0x1E7
        if(((Trace(HitLocation, HitNormal, (Location + tryPlace) + ZOffset, Location + ZOffset, false, Extent) == none) && Driver.SetLocation((Location + tryPlace) + ZOffset)) || (Trace(HitLocation, HitNormal, (Location - tryPlace) + ZOffset, Location + ZOffset, false, Extent) == none) && Driver.SetLocation((Location - tryPlace) + ZOffset))
        {
            return true;
        }
    }
    // End:0x3B2
    if((Controller != none) && Controller.DirectionHint != vect(0.0000000, 0.0000000, 0.0000000))
    {
        tryPlace = Location;
        BestDir = 0.0000000;
        i = 0;
        J0x231:

        // End:0x2A0 [Loop If]
        if(i < ExitPositions.Length)
        {
            NewDir = Normal(ExitPositions[i] - Location) Dot Controller.DirectionHint;
            // End:0x296
            if(NewDir > BestDir)
            {
                BestDir = NewDir;
                tryPlace = ExitPositions[i];
            }
            i++;
            // [Loop Continue]
            goto J0x231;
        }
        Controller.DirectionHint = vect(0.0000000, 0.0000000, 0.0000000);
        // End:0x3B2
        if(tryPlace != Location)
        {
            // End:0x39C
            if(bRelativeExitPos)
            {
                // End:0x30C
                if(ExitPositions[0].Z != float(0))
                {
                    ZOffset = vect(0.0000000, 0.0000000, 1.0000000) * ExitPositions[0].Z;                    
                }
                else
                {
                    ZOffset = Driver.default.CollisionHeight * vect(0.0000000, 0.0000000, 2.0000000);
                }
                tryPlace = (Location + ((tryPlace - ZOffset) >> Rotation)) + ZOffset;
                // End:0x399
                if((Trace(HitLocation, HitNormal, tryPlace, Location + ZOffset, false, Extent) == none) && Driver.SetLocation(tryPlace))
                {
                    return true;
                }                
            }
            else
            {
                // End:0x3B2
                if(Driver.SetLocation(tryPlace))
                {
                    return true;
                }
            }
        }
    }
    // End:0x4B9
    if(!bRelativeExitPos)
    {
        i = 0;
        J0x3C4:

        // End:0x4B7 [Loop If]
        if(i < ExitPositions.Length)
        {
            tryPlace = ExitPositions[i];
            // End:0x3FE
            if(Driver.SetLocation(tryPlace))
            {
                return true;
                // [Explicit Continue]
                goto J0x4AD;
            }
            j = 0;
            J0x405:

            // End:0x4AD [Loop If]
            if(j < 10)
            {
                RandomSphereLoc = (VRand() * float(200)) * FMax(FRand(), 0.5000000);
                RandomSphereLoc.Z = Extent.Z * FRand();
                // End:0x48D
                if(Trace(HitLocation, HitNormal, tryPlace + RandomSphereLoc, tryPlace, false, Extent) == none)
                {
                    // End:0x48A
                    if(Driver.SetLocation(tryPlace + RandomSphereLoc))
                    {
                        return true;
                    }
                    // [Explicit Continue]
                    goto J0x4A3;
                }
                // End:0x4A3
                if(Driver.SetLocation(HitLocation))
                {
                    return true;
                }
                J0x4A3:

                j++;
                // [Loop Continue]
                goto J0x405;
            }
            J0x4AD:

            i++;
            // [Loop Continue]
            goto J0x3C4;
        }
        return false;
    }
    i = 0;
    J0x4C0:

    // End:0x57E [Loop If]
    if(i < ExitPositions.Length)
    {
        // End:0x508
        if(ExitPositions[0].Z != float(0))
        {
            ZOffset = vect(0.0000000, 0.0000000, 1.0000000) * ExitPositions[0].Z;            
        }
        else
        {
            ZOffset = Driver.default.CollisionHeight * vect(0.0000000, 0.0000000, 2.0000000);
        }
        tryPlace = (Location + ((ExitPositions[i] - ZOffset) >> Rotation)) + ZOffset;
        // End:0x572
        if(!Driver.SetLocation(tryPlace))
        {
            // [Explicit Continue]
            goto J0x574;
        }
        return true;
        J0x574:

        i++;
        // [Loop Continue]
        goto J0x4C0;
    }
    return false;
    //return;    
}

function Pawn CheckForHeadShot(Vector loc, Vector ray, float AdditionalScale)
{
    return none;
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local int ActualDamage;
    local Controller Killer;

    // End:0x25
    if((bSpawnProtected && instigatedBy != none) && instigatedBy != self)
    {
        return;
    }
    NetUpdateTime = Level.TimeSeconds - float(1);
    // End:0x11F
    if(DamageType != none)
    {
        // End:0x9F
        if((((instigatedBy == none) || instigatedBy.Controller == none) && DamageType.default.bDelayedDamage) && DelayedDamageInstigatorController != none)
        {
            instigatedBy = DelayedDamageInstigatorController.Pawn;
        }
        Damage *= DamageType.default.VehicleDamageScaling;
        Momentum *= (DamageType.default.VehicleMomentumScaling * MomentumMult);
        // End:0x11F
        if((bShowDamageOverlay && DamageType.default.DamageOverlayMaterial != none) && Damage > 0)
        {
            SetOverlayMaterial(DamageType.default.DamageOverlayMaterial, DamageType.default.DamageOverlayTime, false);
        }
    }
    // End:0x1F3
    if(bRemoteControlled && Driver != none)
    {
        ActualDamage = Damage;
        // End:0x173
        if(Weapon != none)
        {
            Weapon.AdjustPlayerDamage(ActualDamage, instigatedBy, HitLocation, Momentum, DamageType);
        }
        // End:0x19D
        if((instigatedBy != none) && instigatedBy.HasUDamage())
        {
            ActualDamage *= float(2);
        }
        ActualDamage = Level.Game.ReduceDamage(ActualDamage, self, instigatedBy, HitLocation, Momentum, DamageType, WeaponType);
        // End:0x1F3
        if((Health - ActualDamage) <= 0)
        {
            KDriverLeave(false);
        }
    }
    // End:0x224
    if(int(Physics) != int(13))
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
    if((instigatedBy != none) && instigatedBy.HasUDamage())
    {
        Damage *= float(2);
    }
    ActualDamage = Level.Game.ReduceDamage(Damage, self, instigatedBy, HitLocation, Momentum, DamageType, WeaponType);
    Health -= ActualDamage;
    PlayHit(float(ActualDamage), instigatedBy, HitLocation, DamageType, Momentum);
    // End:0x3A9
    if(Health <= 0)
    {
        // End:0x330
        if((Driver != none) && bEjectDriver || bRemoteControlled)
        {
            // End:0x329
            if(bEjectDriver)
            {
                EjectDriver();                
            }
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
        if(((Killer == none) && DamageType != none) && DamageType.default.bDelayedDamage)
        {
            Killer = DelayedDamageInstigatorController;
        }
        Died(Killer, DamageType, HitLocation, CollisionPart, WeaponType);        
    }
    else
    {
        // End:0x3E1
        if(Controller != none)
        {
            Controller.NotifyTakeHit(instigatedBy, HitLocation, ActualDamage, DamageType, Momentum, CollisionPart);
        }
    }
    MakeNoise(1.0000000);
    // End:0x43D
    if(!bDeleteMe)
    {
        // End:0x42D
        if(Location.Z > Level.StallZ)
        {
            Momentum.Z = FMin(Momentum.Z, 0.0000000);
        }
        KAddImpulse(Momentum, HitLocation);
    }
    //return;    
}

function bool HealDamage(int Amount, Controller Healer, Class<DamageType> DamageType)
{
    // End:0x2A
    if(PlayerController(Healer) != none)
    {
        PlayerStartTime = Level.TimeSeconds + float(3);
    }
    // End:0x80
    if(((((Health <= 0) || float(Health) >= HealthMax) || Amount <= 0) || Healer == none) || !TeamLink(Healer.GetTeamNum()))
    {
        return false;
    }
    Health = Min(int(float(Health) + (float(Amount) * LinkHealMult)), int(HealthMax));
    NetUpdateTime = Level.TimeSeconds - float(1);
    return true;
    //return;    
}

function DriverRadiusDamage(float DamageAmount, float DamageRadius, Controller EventInstigator, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
    local float damageScale, dist;
    local Vector Dir;

    // End:0x39
    if((((EventInstigator == none) || Driver == none) || Driver.bCollideActors) || bRemoteControlled)
    {
        return;
    }
    Dir = Driver.Location - HitLocation;
    dist = FMax(1.0000000, VSize(Dir));
    Dir = Dir / dist;
    damageScale = 1.0000000 - FMax(0.0000000, (dist - Driver.CollisionRadius) / DamageRadius);
    // End:0xB9
    if(damageScale <= float(0))
    {
        return;
    }
    Driver.SetDelayedDamageInstigatorController(EventInstigator);
    Driver.TakeDamage(int(damageScale * DamageAmount), EventInstigator.Pawn, Driver.Location - ((0.5000000 * (Driver.CollisionHeight + Driver.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
    //return;    
}

function DriverDied()
{
    local Controller C;

    Level.Game.DiscardInventory(Driver);
    // End:0x62
    if((PlayerReplicationInfo != none) && PlayerReplicationInfo.HasFlag != none)
    {
        PlayerReplicationInfo.HasFlag.Drop(0.5000000 * Velocity);
    }
    // End:0x6F
    if(Driver == none)
    {
        return;
    }
    C = Controller;
    Driver.StopDriving(self);
    Driver.Controller = C;
    Driver.DrivenVehicle = self;
    // End:0xBB
    if(Controller == none)
    {
        return;
    }
    // End:0x10E
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
    Throttle = 0.0000000;
    Steering = 0.0000000;
    Rise = 0.0000000;
    //return;    
}

function Died(Controller Killer, Class<DamageType> DamageType, Vector HitLocation, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    local PlayerController PC;
    local Controller C;

    // End:0x1F
    if(bDeleteMe || Level.bLevelChange)
    {
        return;
    }
    // End:0x46
    if(int(Physics) != int(13))
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
    // End:0x1E8
    if(Controller != none)
    {
        C = Controller;
        C.WasKilledBy(Killer);
        Level.Game.Killed(Killer, C, self, DamageType, CollisionPart, WeaponType);
        // End:0x1AF
        if(C.bIsPlayer)
        {
            PC = PlayerController(C);
            // End:0x126
            if(PC != none)
            {
                ClientKDriverLeave(PC);                
            }
            else
            {
                ClientClearController();
            }
            // End:0x19F
            if(((bRemoteControlled || bEjectDriver) && Driver != none) && Driver.Health > 0)
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
            else
            {
                C.PawnDied(self);
            }
        }
        // End:0x1E5
        if(!C.bIsPlayer && !C.bDeleteMe)
        {
            C.Destroy();
        }        
    }
    else
    {
        Level.Game.Killed(Killer, Controller(Owner), self, DamageType, CollisionPart, WeaponType);
    }
    // End:0x247
    if(Killer != none)
    {
        TriggerEvent(Event, self, Killer.Pawn);        
    }
    else
    {
        TriggerEvent(Event, self, none);
    }
    // End:0x271
    if(IsHumanControlled())
    {
        PlayerController(Controller).ForceDeathUpdate();
    }
    // End:0x27F
    if(!bDeleteMe)
    {
        Destroy();
    }
    //return;    
}

function AdjustDriverDamage(out int Damage, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
    // End:0x13
    if(InGodMode())
    {
        Damage = 0;        
    }
    else
    {
        Damage *= DriverDamageMult;
    }
    //return;    
}

function EjectDriver()
{
    local Pawn OldPawn;
    local Vector EjectVel;

    OldPawn = Driver;
    KDriverLeave(true);
    // End:0x1F
    if(OldPawn == none)
    {
        return;
    }
    EjectVel = VRand();
    EjectVel.Z = 0.0000000;
    EjectVel = ((Normal(EjectVel) * 0.2000000) + vect(0.0000000, 0.0000000, 1.0000000)) * EjectMomentum;
    OldPawn.Velocity = EjectVel;
    OldPawn.SpawnTime = Level.TimeSeconds;
    OldPawn.PlayTeleportEffect(false, false);
    //return;    
}

function UsedBy(Pawn User)
{
    // End:0x0D
    if(Driver != none)
    {
        return;
    }
    TryToDrive(User);
    //return;    
}

function Fire(optional float f)
{
    VehicleFire(false);
    bWeaponisFiring = true;
    //return;    
}

function AltFire(optional float f)
{
    VehicleFire(true);
    bWeaponisAltFiring = true;
    //return;    
}

function ClientVehicleCeaseFire(bool bWasAltFire)
{
    // End:0x14
    if(bWasAltFire)
    {
        bWeaponisAltFiring = false;        
    }
    else
    {
        bWeaponisFiring = false;
    }
    VehicleCeaseFire(bWasAltFire);
    //return;    
}

function VehicleFire(bool bWasAltFire)
{
    // End:0x14
    if(bWasAltFire)
    {
        bWeaponisAltFiring = true;        
    }
    else
    {
        bWeaponisFiring = true;
    }
    //return;    
}

function VehicleCeaseFire(bool bWasAltFire)
{
    // End:0x14
    if(bWasAltFire)
    {
        bWeaponisAltFiring = false;        
    }
    else
    {
        bWeaponisFiring = false;
    }
    //return;    
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
    //return;    
}

event UpdateEyeHeight(float DeltaTime)
{
    local Controller C;

    // End:0x35
    if((Controller != none) && Controller.IsA('PlayerController'))
    {
        Controller.AdjustView(DeltaTime);
    }
    C = Level.ControllerList;
    J0x49:

    // End:0x9C [Loop If]
    if(C != none)
    {
        // End:0x85
        if(C.IsA('PlayerController') && PlayerController(C).ViewTarget == self)
        {
            return;
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x49;
    }
    bUpdateEyeheight = false;
    EyeHeight = BaseEyeHeight;
    //return;    
}

simulated function FaceRotation(Rotator NewRotation, float DeltaTime)
{
    //return;    
}

simulated event SetAnimAction(name NewAction)
{
    // End:0x2A
    if(bDrawDriverInTP && Driver != none)
    {
        Driver.SetAnimAction(NewAction);
    }
    //return;    
}

event EncroachedBy(Actor Other)
{
    //return;    
}

event RanInto(Actor Other)
{
    local Vector Momentum;
    local float Speed;

    // End:0x50
    if((((Pawn(Other) == none) || Vehicle(Other) != none) || Other == Instigator) || int(Other.Role) != int(ROLE_Authority))
    {
        return;
    }
    Speed = VSize(Velocity);
    // End:0x135
    if(Speed > MinRunOverSpeed)
    {
        Momentum = (Velocity * 0.2500000) * Other.Mass;
        // End:0xFB
        if((Controller != none) && Controller.SameTeamAs(Pawn(Other).Controller))
        {
            Momentum += (((Speed * 0.2500000) * Other.Mass) * Normal(Velocity Cross vect(0.0000000, 0.0000000, 1.0000000)));
        }
        Other.TakeDamage(int(Speed * 0.0750000), Instigator, Other.Location, Momentum, RanOverDamageType);
    }
    //return;    
}

function bool EncroachingOn(Actor Other)
{
    // End:0x77
    if(((((Other == none) || Other == Instigator) || int(Other.Role) != int(ROLE_Authority)) || !Other.bCollideActors && !Other.bBlockActors) || VSize(Velocity) < float(10))
    {
        return false;
    }
    // End:0xDC
    if((Pawn(Other) != none) && Vehicle(Other) == none)
    {
        Other.TakeDamage(10000, Instigator, Other.Location, Velocity * Other.Mass, CrushedDamageType);
        return false;
    }
    //return;    
}

simulated function bool FindValidTaunt(out name Sequence)
{
    // End:0x1A
    if(!bDrawDriverInTP || Driver == none)
    {
        return false;
    }
    return Driver.FindValidTaunt(Sequence);
    //return;    
}

simulated function bool CheckTauntValid(name Sequence)
{
    // End:0x1A
    if(!bDrawDriverInTP || Driver == none)
    {
        return false;
    }
    return Driver.CheckTauntValid(Sequence);
    //return;    
}

function bool Occupied()
{
    return Controller != none;
    //return;    
}

function float ReservationCostMultiplier()
{
    return 1.0000000;
    //return;    
}

function float NewReservationCostMultiplier(Pawn P)
{
    return ReservationCostMultiplier();
    //return;    
}

function bool ChangedReservation(Pawn P)
{
    return false;
    //return;    
}

function bool SpokenFor(Controller C)
{
    return false;
    //return;    
}

function SetReservation(Controller C)
{
    //return;    
}

function Vehicle OpenPositionFor(Pawn P)
{
    // End:0x0D
    if(Controller == none)
    {
        return self;
    }
    return none;
    //return;    
}

simulated function bool IndependentVehicle()
{
    return true;
    //return;    
}

function Actor GetBestEntry(Pawn P)
{
    return self;
    //return;    
}

function Vehicle GetMoveTargetFor(Pawn P)
{
    return self;
    //return;    
}

simulated event DrivingStatusChanged()
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x95
    if((bDriving && PC != none) && (PC.ViewTarget == none) || !PC.ViewTarget.IsJoinedTo(self))
    {
        bDropDetail = Level.bDropDetail || int(Level.DetailMode) == int(0);        
    }
    else
    {
        bDropDetail = false;
    }
    // End:0xB0
    if(bDriving)
    {
        Enable('Tick');        
    }
    else
    {
        Disable('Tick');
    }
    //return;    
}

event TakeWaterDamage(float DeltaTime)
{
    local Vector HitLocation, HitNormal;
    local Actor EntryActor;

    TakeDamage(int(WaterDamage * DeltaTime), self, vect(0.0000000, 0.0000000, 0.0000000), vect(0.0000000, 0.0000000, 0.0000000), VehicleDrowningDamType);
    // End:0x153
    if(((((((Level.TimeSeconds - SplashTime) > 0.3000000) && PhysicsVolume.PawnEntryActor != none) && !Level.bDropDetail) && int(Level.DetailMode) != int(0)) && EffectIsRelevant(Location, false)) && VSize(Velocity) > float(300))
    {
        SplashTime = Level.TimeSeconds;
        // End:0x153
        if(!PhysicsVolume.TraceThisActor(HitLocation, HitNormal, Location - (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000)), Location + (CollisionHeight * vect(0.0000000, 0.0000000, 1.0000000))))
        {
            EntryActor = Spawn(PhysicsVolume.PawnEntryActor, self,, HitLocation, rot(16384, 0, 0));
        }
    }
    //return;    
}

event LockOnWarning()
{
    local Class<LocalMessage> LockOnClass;

    LockOnClass = Class<LocalMessage>(DynamicLoadObject(LockOnClassString, Class'Core.Class'));
    PlayerController(Controller).ReceiveLocalizedMessage(LockOnClass, 12);
    LastLockWarningTime = Level.TimeSeconds;
    //return;    
}

simulated function bool PointOfView()
{
    // End:0x0D
    if(!bAllowViewChange)
    {
        return true;
    }
    return default.bDesiredBehindView;
    //return;    
}

function PlayTeleportEffect(bool bOut, bool bSound)
{
    local Actor A;
    local Class<Actor> TransEffect;

    // End:0x43
    if(((GetTeam()) == none) || GetTeam().TeamIndex == 0)
    {
        TransEffect = Class<Actor>(DynamicLoadObject(TransEffects[0], Class'Core.Class'));        
    }
    else
    {
        TransEffect = Class<Actor>(DynamicLoadObject(TransEffects[1], Class'Core.Class'));
    }
    // End:0x96
    if(TransEffect != none)
    {
        A = Spawn(TransEffect,,, Location + (CollisionHeight * vect(0.0000000, 0.0000000, 0.7500000)));
    }
    // End:0xAE
    if(A != none)
    {
        A.SetBase(self);
    }
    super.PlayTeleportEffect(bOut, bSound);
    //return;    
}

simulated event PlayDying(Class<DamageType> DamageType, Vector HitLoc, optional int CollisionPart)
{
    //return;    
}

simulated function int GetTeamNum()
{
    // End:0x44
    if(((int(Role) == int(ROLE_Authority)) && int(Team) == 255) && Controller != none)
    {
        SetTeamNum(byte(Controller.GetTeamNum()));
    }
    return int(Team);
    //return;    
}

event NotifyEnemyLockedOn()
{
    bEnemyLockedOn = true;
    //return;    
}

function IncomingMissile(wProjectile P)
{
    //return;    
}

event NotifyEnemyLostLock()
{
    bEnemyLockedOn = false;
    //return;    
}

function SetTeamNum(byte t)
{
    PrevTeam = Team;
    Team = t;
    // End:0x2F
    if(int(PrevTeam) != int(Team))
    {
        TeamChanged();
    }
    //return;    
}

simulated event TeamChanged()
{
    //return;    
}

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    super.DisplayDebug(Canvas, YL, YPos);
    Canvas.SetDrawColor(byte(255), byte(255), byte(255));
    Canvas.DrawText((((((("Steering " $ string(Steering)) $ " throttle ") $ string(Throttle)) $ " rise ") $ string(Rise)) $ " // DrivePos : ") $ string(DrivePos));
    // End:0x138
    if(Driver != none)
    {
        YPos += YL;
        YPos += YL;
        Canvas.SetPos(0.0000000, YPos);
        Canvas.SetDrawColor(0, 0, byte(255));
        Canvas.DrawText("--- DRIVER");
        Canvas.SetPos(4.0000000, YPos);
        Driver.DisplayDebug(Canvas, YL, YPos);
    }
    //return;    
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
    // End:0xB4
    if((KDriverLeave(false)) && OldController.Pawn != none)
    {
        OldController.Pawn.SetRotation(Rotator(A.Location - OldController.Pawn.Location));
        OldController.Focus = A;
        OldController.FireWeaponAt(A);
    }
    return A;
    //return;    
}

simulated event Stalled()
{
    //return;    
}

simulated event UnStalled()
{
    //return;    
}

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
    else
    {
        DesiredTPCamDistance = float(Min(int(DesiredTPCamDistance + float(100)), int(TPCamDistRange.Max)));
    }
    default.TPCamDistance = DesiredTPCamDistance;
    StaticSaveConfig();
    //return;    
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
    if((PC == none) || !PC.bBehindView)
    {
        return;
    }
    // End:0x70
    if(DesiredTPCamDistance ~= TPCamDistRange.Min)
    {
        PC.BehindView(false);        
    }
    else
    {
        DesiredTPCamDistance = float(Max(int(DesiredTPCamDistance - float(100)), int(TPCamDistRange.Min)));
        default.TPCamDistance = DesiredTPCamDistance;
        StaticSaveConfig();
    }
    //return;    
}

function bool TeamLink(int TeamNum)
{
    return ((LinkHealMult > float(0)) && int(Team) == TeamNum) && Health > 0;
    //return;    
}

event bool NeedsFlip()
{
    local Vector worldUp, gravUp;
    local float GravMag;

    GravMag = VSize(PhysicsVolume.Gravity);
    // End:0x3B
    if(GravMag < 0.1000000)
    {
        gravUp = vect(0.0000000, 0.0000000, 1.0000000);        
    }
    else
    {
        gravUp = -1.0000000 * (PhysicsVolume.Gravity / GravMag);
    }
    worldUp = vect(0.0000000, 0.0000000, 1.0000000) >> Rotation;
    // End:0x90
    if((worldUp Dot gravUp) < -0.5000000)
    {
        return true;
    }
    return false;
    //return;    
}

function Flip(Vector HitNormal, float ForceScale)
{
    //return;    
}

simulated function float ChargeBar()
{
    //return;    
}

simulated function ClientPlayForceFeedback(string EffectName)
{
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x43
    if((PC != none) && PC.bEnableGUIForceFeedback)
    {
        PC.ClientPlayForceFeedback(EffectName);
    }
    //return;    
}

simulated function StopForceFeedback(string EffectName)
{
    local PlayerController PC;

    PC = PlayerController(Controller);
    // End:0x43
    if((PC != none) && PC.bEnableGUIForceFeedback)
    {
        PC.StopForceFeedback(EffectName);
    }
    //return;    
}

function ServerPlayHorn(int HornIndex)
{
    //return;    
}

simulated function int NumPassengers()
{
    // End:0x0D
    if(Driver != none)
    {
        return 1;
    }
    return 0;
    //return;    
}

function Pawn GetInstigator()
{
    return self;
    //return;    
}

function AIController GetBotPassenger()
{
    return AIController(Controller);
    //return;    
}

event bool IsVehicleEmpty()
{
    return Driver == none;
    //return;    
}

function bool HasOccupiedTurret()
{
    return false;
    //return;    
}

function float AdjustedStrength()
{
    // End:0x1A
    if(bStationary && bDefensive)
    {
        return 1.0000000;
    }
    return 0.0000000;
    //return;    
}

static function StaticPrecache(LevelInfo L)
{
    //return;    
}

function int GetSpree()
{
    // End:0x1B
    if(Driver != none)
    {
        return Driver.GetSpree();
    }
    return 0;
    //return;    
}

function IncrementSpree()
{
    // End:0x1A
    if(Driver != none)
    {
        Driver.IncrementSpree();
    }
    //return;    
}

simulated function POVChanged(PlayerController PC, bool bBehindViewChanged)
{
    // End:0xA6
    if(PC.bBehindView)
    {
        // End:0x4C
        if(bBehindViewChanged && bPCRelativeFPRotation)
        {
            PC.SetRotation(Rotator(Vector(PC.Rotation) >> Rotation));
        }
        bOwnerNoSee = false;
        // End:0x8D
        if(Driver != none)
        {
            // End:0x7C
            if(bDrawDriverInTP)
            {
                Driver.bOwnerNoSee = false;                
            }
            else
            {
                Driver.bOwnerNoSee = true;
            }
        }
        // End:0xA3
        if(PC == Controller)
        {
            ActivateOverlay(false);
        }        
    }
    else
    {
        // End:0xD5
        if(bPCRelativeFPRotation)
        {
            PC.SetRotation(Rotator(Vector(PC.Rotation) << Rotation));
        }
        // End:0xE9
        if(bDrawMeshInFP)
        {
            bOwnerNoSee = false;            
        }
        else
        {
            bOwnerNoSee = true;
        }
        // End:0x10D
        if(Driver != none)
        {
            Driver.bOwnerNoSee = true;
        }
        // End:0x12E
        if(bDriving && PC == Controller)
        {
            ActivateOverlay(true);
        }
    }
    //return;    
}

function PlayTakeHit(Vector HitLocation, int Damage, Class<DamageType> DamageType)
{
    // End:0x6E
    if(((IndependentVehicle()) && DamageType.default.bBulletHit) && BulletSounds != "")
    {
        // End:0x61
        if((Controller != none) && Controller == Level.GetLocalPlayerController())
        {
            FmodPlayOwnedSound(BulletSounds, 0);            
        }
        else
        {
            FmodPlayOwnedSound(BulletSounds, 0);
        }
    }
    //return;    
}

function array<Vehicle> GetTurrets()
{
    //return;    
}

function CheckSuperBerserk()
{
    //return;    
}

event bool VerifyLock(Actor Aggressor, out Actor NewTarget)
{
    return true;
    //return;    
}

simulated function Actor AlternateTarget()
{
    return none;
    //return;    
}

function ShouldTargetMissile(wProjectile P)
{
    local AIController C;

    C = AIController(Controller);
    // End:0x77
    if(((C != none) && C.Skill >= 5.0000000) && (C.Enemy == none) || !C.LineOfSightTo(C.Enemy))
    {
        ShootMissile(P);
    }
    //return;    
}

function ShootMissile(wProjectile P)
{
    Controller.Focus = P;
    Controller.FireWeaponAt(P);
    //return;    
}

function bool ImportantVehicle()
{
    return false;
    //return;    
}

function bool IsArtillery()
{
    return false;
    //return;    
}

function SetEntryViewRotation(Rotator R)
{
    //return;    
}

function SetExitViewRotation(Pawn Driver)
{
    //return;    
}

state UnDeployed
{
    function VehicleFire(bool bWasAltFire)
    {
        global.VehicleFire(bWasAltFire);
        //return;        
    }

    function VehicleCeaseFire(bool bWasAltFire)
    {
        global.VehicleCeaseFire(bWasAltFire);
        //return;        
    }
    stop;    
}

state Deployed
{
    function VehicleFire(bool bWasAltFire)
    {
        global.VehicleFire(bWasAltFire);
        //return;        
    }

    function VehicleCeaseFire(bool bWasAltFire)
    {
        global.VehicleCeaseFire(bWasAltFire);
        //return;        
    }
    stop;    
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
    EjectMomentum=1000.0000000
    DriveAnim="Vehicle_Driving"
    ExitPositions[0]=none
    EntryRadius=100.0000000
    TPCamDistance=600.0000000
    CenterSpringForce="SpringONSHoverBike"
    CenterSpringRangePitch=2000
    CenterSpringRangeRoll=2000
    TPCamLookat=(X=-100.0000000,Y=0.0000000,Z=100.0000000)
    CameraSpeed=500.0000000
    TPCamDistRange=(Min=50.0000000,Max=1500.0000000)
    MaxViewYaw=16000
    MaxViewPitch=16000
    TransEffects[0]="XEffects.TransEffectRed"
    TransEffects[1]="XEffects.TransEffectBlue"
    ShadowMaxTraceDist=350.0000000
    ShadowCullDistance=1500.0000000
    MomentumMult=4.0000000
    DriverDamageMult=1.0000000
    LockOnClassString="Onslaught.ONSOnslaughtMessage"
    LockWarningInterval=1.5000000
    VehiclePositionString="Vehicle Interior"
    VehicleNameString="Vehicle"
    RanOverDamageType=Class'Engine.DamRanOver'
    CrushedDamageType=Class'Engine.Crushed'
    LinkHealMult=0.3500000
    MaxDesireability=0.5000000
    ObjectiveGetOutDist=1000.0000000
    bCanBeBaseForPawns=true
    bDontPossess=true
    bUseCompressedPosition=false
    SightRadius=15000.0000000
    LandMovementState="PlayerDriving"
    NetUpdateFrequency=4.0000000
    NetPriority=1.0000000
    CollisionRadius=120.0000000
    CollisionHeight=50.0000000
}