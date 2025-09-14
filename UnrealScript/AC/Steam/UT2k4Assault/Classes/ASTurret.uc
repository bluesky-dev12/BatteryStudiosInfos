/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASTurret.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:31
 *	Functions:24
 *
 *******************************************************************************/
class ASTurret extends ASVehicle
    dependson(ASVehicle)
    dependson(ASVehicleFactory_Turret)
    abstract;

var class<ASTurret_Base> TurretBaseClass;
var ASTurret_Base TurretBase;
var Rotator OriginalRotation;
var Vector OriginalLocation;
var Vector OriginalDirection;
var Rotator EnterRotation;
var float TurretFOV;
var class<ASTurret_Base> TurretSwivelClass;
var ASTurret_Base TurretSwivel;
var float YawAccel;
var float PitchAccel;
var() const float RotationInertia;
var() const Range RotPitchConstraint;
var() const float RotationSpeed;
var() Vector CamAbsLocation;
var() Vector CamRelLocation;
var() Vector CamDistance;
var Rotator LastCamRot;
var float LastTimeSeconds;
var() float CamRotationInertia;
var bool bZooming;
var() float DesiredPlayerFOV;
var() float MinPlayerFOV;
var() float OldFOV;
var() float ZoomSpeed;
var() float ZoomWeaponOffsetAdjust;
var Material ZoomTick;
var Material ZoomTickTex;
var Texture WeaponInfoTexture;
var() name ObjectiveTag[6];
var array<SVehicleTrigger> EntryTriggers;

replication
{
    // Pos:0x00
    reliable if(bNetInitial && Role == 4)
        OriginalRotation, OriginalLocation,
        OriginalDirection, EnterRotation;

    // Pos:0x18
    reliable if(Role < 4)
        ServerSwitchTurret;

}

function bool RecommendLongRangedAttack()
{
    return true;
}

function bool StronglyRecommended(Actor S, int TeamIndex, Actor Objective)
{
    local int i;

    // End:0xb8
    if(Objective != none)
    {
        // End:0x76
        if(ObjectiveTag[0] != 'None')
        {
            i = 0;
            J0x23:
            // End:0x73 [While If]
            if(i < 6)
            {
                // End:0x49
                if(ObjectiveTag[i] == 'None')
                {
                    return false;
                }
                // End:0x69
                else
                {
                    // End:0x69
                    if(ObjectiveTag[i] == Objective.Tag)
                    {
                        return true;
                    }
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x23;
            }
        }
        // End:0xb8
        else
        {
            // End:0xb8
            if(VSize(Objective.Location - Location) > float(8000) || !FastTrace(Objective.Location, Location))
            {
                return false;
            }
        }
    }
    return true;
}

function float BotDesireability(Actor S, int TeamIndex, Actor Objective)
{
    // End:0x23
    if(!StronglyRecommended(S, TeamIndex, Objective))
    {
        return 0.0;
    }
    // End:0x5c
    else
    {
        // End:0x5c
        if(Health <= 0 || Occupied() || bTeamLocked && GetTeamNum() != TeamIndex)
        {
            return 0.0;
        }
    }
    return MaxDesireability * 0.50 + MaxDesireability * 0.50 * float(Health) / HealthMax;
}

simulated function PrevWeapon()
{
    ServerSwitchTurret(false);
}

simulated function NextWeapon()
{
    ServerSwitchTurret(true);
}

function ServerSwitchTurret(bool bNextTurret)
{
    // End:0x12
    if(ASVehicleFactory_Turret(ParentFactory) == none)
    {
        return;
    }
    // End:0x33
    if(bNextTurret)
    {
        ASVehicleFactory_Turret(ParentFactory).NextVehicle(self);
    }
    // End:0x48
    else
    {
        ASVehicleFactory_Turret(ParentFactory).PrevVehicle(self);
    }
}

simulated event PostBeginPlay()
{
    local Vector vX;

    vX.X = 1.0;
    // End:0x49
    if(Role == 4)
    {
        OriginalRotation = Rotation;
        OriginalLocation = Location;
        OriginalDirection = vX >> OriginalRotation;
    }
    super.PostBeginPlay();
}

function PossessedBy(Controller C)
{
    local PlayerController PC;

    super.PossessedBy(C);
    PC = PlayerController(C);
    // End:0x5d
    if(PC != none)
    {
        // End:0x49
        if(TurretFOV < MinPlayerFOV)
        {
            TurretFOV = PC.DefaultFOV;
        }
        PC.SetFOV(TurretFOV);
    }
}

simulated event PostNetBeginPlay()
{
    // End:0x32
    if(TurretBaseClass != none && TurretBase == none)
    {
        TurretBase = Spawn(TurretBaseClass, self,, Location, OriginalRotation);
    }
    // End:0x64
    if(TurretSwivelClass != none && TurretSwivel == none)
    {
        TurretSwivel = Spawn(TurretSwivelClass, self,, Location, OriginalRotation);
    }
    super(Pawn).PostNetBeginPlay();
}

simulated function bool HasAmmo()
{
    return true;
}

simulated event Destroyed()
{
    // End:0x17
    if(TurretBase != none)
    {
        TurretBase.Destroy();
    }
    // End:0x2e
    if(TurretSwivel != none)
    {
        TurretSwivel.Destroy();
    }
    super.Destroyed();
}

simulated function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
    local int Pitch;
    local Rotator NewRotation;

    // End:0x49
    if(PlayerController(Controller) != none && PlayerController(Controller).bFreeCamera)
    {
        PlayerController(Controller).UpdateRotation(DeltaTime, 0.0);
        return;
    }
    // End:0x63
    if(DeltaTime > 0.30)
    {
        DeltaTime = 0.30;
    }
    YawAccel = RotationInertia * YawAccel + DeltaTime * RotationSpeed * YawChange;
    PitchAccel = RotationInertia * PitchAccel + DeltaTime * RotationSpeed * PitchChange;
    Pitch = Rotation.Pitch & 65535;
    // End:0x16d
    if(float(Pitch) > float(16384) - RotPitchConstraint.Max && float(Pitch) < float(49152) + RotPitchConstraint.Min)
    {
        // End:0x13c
        if(float(Pitch) > float(49152) - RotPitchConstraint.Min)
        {
            PitchAccel = float(Max(int(PitchAccel), 0));
        }
        // End:0x16d
        else
        {
            // End:0x16d
            if(float(Pitch) < float(16384) + RotPitchConstraint.Max)
            {
                PitchAccel = float(Min(int(PitchAccel), 0));
            }
        }
    }
    NewRotation = Rotation;
    NewRotation.Yaw += int(YawAccel);
    NewRotation.Pitch += int(PitchAccel);
    SetRotation(NewRotation);
    // End:0x22b
    if(IsLocallyControlled())
    {
        // End:0x1e4
        if(TurretBase != none && TurretBase.DrawType == 2)
        {
            TurretBase.UpdateOverlay();
        }
        // End:0x22b
        if(TurretSwivel != none)
        {
            // End:0x217
            if(TurretSwivel.DrawType == 2)
            {
                TurretSwivel.UpdateOverlay();
            }
            TurretSwivel.UpdateSwivelRotation(NewRotation);
        }
    }
}

simulated function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Vector CamLookAt, HitLocation, HitNormal;
    local PlayerController PC;
    local float DeltaTime;
    local Rotator CamRotationRate;

    PC = PlayerController(Controller);
    // End:0x47
    if(PC == none || PC.ViewTarget != self || PC.bFreeCamera)
    {
        return false;
    }
    ViewActor = self;
    // End:0x7e
    if(!PC.bBehindView)
    {
        SpecialCalcFirstPersonView(PC, ViewActor, CameraLocation, CameraRotation);
        return true;
    }
    DeltaTime = Level.TimeSeconds - LastTimeSeconds;
    LastTimeSeconds = Level.TimeSeconds;
    CamLookAt = Location + CamAbsLocation + CamRelLocation >> ViewActor.Rotation;
    CamRotationRate = Normalize(ViewActor.Rotation - LastCamRot);
    CameraRotation.Yaw = int(CalcInertia(DeltaTime, CamRotationInertia, float(CamRotationRate.Yaw), float(LastCamRot.Yaw)));
    CameraRotation.Pitch = int(CalcInertia(DeltaTime, CamRotationInertia, float(CamRotationRate.Pitch), float(LastCamRot.Pitch)));
    CameraRotation.Roll = 0;
    LastCamRot = CameraRotation;
    CameraLocation = CamLookAt + CamDistance >> CameraRotation;
    // End:0x1d7
    if(Trace(HitLocation, HitNormal, CameraLocation, CamLookAt, false, vect(10.0, 10.0, 10.0)) != none)
    {
        CameraLocation = HitLocation + HitNormal * float(10);
    }
    return true;
}

simulated function SpecialCalcFirstPersonView(PlayerController PC, out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Vector X, Y, Z;
    local Rotator R;

    CameraLocation = Location;
    ViewActor = self;
    R = GetViewRotation();
    GetAxes(R, X, Y, Z);
    CameraRotation = Normalize(R + PC.ShakeRot);
    CameraLocation = CameraLocation + PC.ShakeOffset.X * X + PC.ShakeOffset.Y * Y + PC.ShakeOffset.Z * Z;
    CameraLocation = CameraLocation + FPCamPos >> GetViewRotation();
}

simulated function Rotator GetViewRotation()
{
    return Rotation;
}

simulated function PlayFiring(optional float Rate, optional name FiringMode)
{
    // End:0x1f
    if(FiringMode == '0')
    {
        PlayAnim('FireR', 0.450);
    }
    // End:0x2c
    else
    {
        PlayAnim('FireL', 0.450);
    }
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    super.Explode(HitLocation, vect(0.0, 0.0, 1.0));
    // End:0x2f
    if(TurretBase != none)
    {
        TurretBase.Destroy();
    }
    // End:0x46
    if(TurretSwivel != none)
    {
        TurretSwivel.Destroy();
    }
}

simulated function DrawHealthInfo(Canvas C, PlayerController PC);
simulated function Actor PerformTrace(out Vector HitLocation, out Vector HitNormal, Vector End, Vector Start)
{
    local Actor HitActor;

    // End:0x1c
    if(TurretBase != none)
    {
        TurretBase.bBlockZeroExtentTraces = false;
    }
    // End:0x38
    if(TurretSwivel != none)
    {
        TurretSwivel.bBlockZeroExtentTraces = false;
    }
    HitActor = super.PerformTrace(HitLocation, HitNormal, End, Start);
    // End:0x74
    if(TurretBase != none)
    {
        TurretBase.bBlockZeroExtentTraces = true;
    }
    // End:0x90
    if(TurretSwivel != none)
    {
        TurretSwivel.bBlockZeroExtentTraces = true;
    }
    return HitActor;
}

simulated function bool DrawCrosshair(Canvas C, out Vector ScreenPos)
{
    local float ratioX, ratioY, tileX, tileY, SizeX, SizeY,
	    ZoomPct;

    local PlayerController PC;

    super.DrawCrosshair(C, ScreenPos);
    PC = PlayerController(Controller);
    SizeX = float(ZoomTickTex.MaterialUSize());
    SizeY = float(ZoomTickTex.MaterialVSize());
    ratioX = float(C.SizeX) / 640.0;
    ratioY = float(C.SizeY) / 480.0;
    tileX = CrosshairScale * SizeX * ratioX;
    tileY = CrosshairScale * SizeY * ratioX;
    C.Style = 6;
    C.DrawColor = class'Canvas'.static.MakeColor(byte(255), byte(255), byte(255));
    C.SetPos(ScreenPos.X - tileX, ScreenPos.Y - tileY);
    C.DrawTile(ZoomTickTex, tileX * float(2), tileY * float(2), 0.0, 0.0, SizeX, SizeY);
    ZoomPct = 1.0 - PC.FovAngle - MinPlayerFOV / PC.DefaultFOV - MinPlayerFOV;
    C.SetPos(ScreenPos.X - tileX, ScreenPos.Y - tileY);
    TexRotator(ZoomTick).Rotation.Yaw = int(float(32767) * ZoomPct);
    C.DrawTile(ZoomTick, tileX * float(2), tileY * float(2), 0.0, 0.0, SizeX, SizeY);
    PostZoomAdjust(ZoomPct);
    return true;
}

simulated function PostZoomAdjust(float ZoomPct)
{
    // End:0x4d
    if(!bDrawMeshInFP && Weapon != none)
    {
        Weapon.SmallViewOffset.X = Weapon.default.SmallViewOffset.X - ZoomWeaponOffsetAdjust * ZoomPct;
    }
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    OldFOV = PC.FovAngle;
    super.ClientKDriverEnter(PC);
}

static function StaticPrecache(LevelInfo L)
{
    super.StaticPrecache(L);
    L.AddPrecacheMaterial(default.ZoomTick);
    L.AddPrecacheMaterial(default.ZoomTickTex);
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(default.ZoomTick);
    Level.AddPrecacheMaterial(default.ZoomTickTex);
    super.UpdatePrecacheMaterials();
}

defaultproperties
{
    RotationInertia=0.20
    RotPitchConstraint=(Min=12288.0,Max=4096.0)
    RotationSpeed=16.0
    CamAbsLocation=(X=0.0,Y=0.0,Z=100.0)
    CamRelLocation=(X=200.0,Y=0.0,Z=100.0)
    CamDistance=(X=-800.0,Y=0.0,Z=100.0)
    CamRotationInertia=0.000010
    MinPlayerFOV=20.0
    ZoomSpeed=1.50
    ZoomWeaponOffsetAdjust=80.0
    VehicleProjSpawnOffset=(X=138.0,Y=-65.0,Z=16.0)
    CrosshairScale=0.50
    bCHZeroYOffset=true
    bDefensive=true
    bAutoTurret=true
    bRemoteControlled=true
    AutoTurretControllerClass=Class'UnrealGame.TurretController'
    FPCamPos=(X=0.0,Y=0.0,Z=40.0)
    VehiclePositionString="?? ??"
    VehicleNameString="??? ??"
    bSimulateGravity=true
    bIgnoreForces=true
    bStationary=true
    bSpecialHUD=true
    bSpecialCalcView=true
    SightRadius=25000.0
    WaterSpeed=0.0
    AirSpeed=0.0
    AccelRate=0.0
    JumpZ=0.0
    MaxFallSpeed=0.0
    HealthMax=650.0
    Health=650
    LandMovementState=PlayerTurreting
    bIgnoreEncroachers=true
    Physics=5
    DrawScale=5.0
    AmbientGlow=64
    bShouldBaseAtStartup=true
    CollisionRadius=80.0
    CollisionHeight=80.0
    bCollideWorld=true
    bPathColliding=true
}