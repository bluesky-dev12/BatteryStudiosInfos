/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wTurret.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:40
 *	Functions:37
 *
 *******************************************************************************/
class wTurret extends wVehicle
    dependson(wVehicle)
    abstract;

var class<wTurret_Base> TurretBaseClass;
var wTurret_Base TurretBase;
var Rotator OriginalRotation;
var Vector OriginalLocation;
var Vector OriginalDirection;
var Rotator EnterRotation;
var float TurretFOV;
var Vector DriverEnteredLocation;
var class<wTurret_Base> TurretSwivelClass;
var wTurret_Base TurretSwivel;
var float YawAccel;
var float PitchAccel;
var() const float RotationInertia;
var() const float RotationSpeed;
var() Vector CamAbsLocation;
var() Vector CamRelLocation;
var() Vector CamDistance;
var float RotYawConstrant_Left;
var float RotYawConstrant_Right;
var float RotPitchConstant_Up;
var float RotPitchConstant_Down;
var float RotSpeed_Yaw;
var float RotSpeed_Pitch;
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
var int AnimRotBase;
var Vector vDriverAttachPos;
var float NotifyElapsed;

replication
{
    // Pos:0x00
    reliable if(bNetInitial && Role == 4)
        OriginalRotation, OriginalLocation,
        OriginalDirection, EnterRotation,
        RotYawConstrant_Left, RotYawConstrant_Right,
        RotPitchConstant_Up, RotPitchConstant_Down,
        RotSpeed_Yaw, RotSpeed_Pitch;

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

function ServerSwitchTurret(bool bNextTurret);
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
    EnterRotation = PlayerController(C).Rotation;
    super.PossessedBy(C);
}

function UnPossessed()
{
    super.UnPossessed();
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

simulated function SetRotateForPlayerView(Rotator PCRot)
{
    local int iPitch, iYaw;

    iPitch = PCRot.Pitch - OriginalRotation.Pitch;
    // End:0x40
    if(iPitch > 32767)
    {
        iPitch = iPitch - 65535;
    }
    // End:0x61
    else
    {
        // End:0x61
        if(iPitch < -32767)
        {
            iPitch = 65535 + iPitch;
        }
    }
    iPitch = Clamp(iPitch, int(-RotPitchConstant_Up), int(RotPitchConstant_Down));
    iYaw = PCRot.Yaw - OriginalRotation.Yaw;
    // End:0xbe
    if(iYaw > 32767)
    {
        iYaw = 65535 - iYaw;
    }
    // End:0xdf
    else
    {
        // End:0xdf
        if(iYaw < -32767)
        {
            iYaw = 65535 + iYaw;
        }
    }
    iYaw = Clamp(iYaw, int(-RotYawConstrant_Left), int(RotYawConstrant_Right));
    PCRot.Pitch = OriginalRotation.Pitch + iPitch;
    PCRot.Yaw = OriginalRotation.Yaw + iYaw;
    SetRotation(PCRot);
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
    local Rotator NewRotation;
    local int YawDelta, PitchDelta;

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
    YawAccel = RotationInertia * YawAccel + DeltaTime * RotSpeed_Yaw * YawChange;
    PitchAccel = RotationInertia * PitchAccel + DeltaTime * RotSpeed_Pitch * PitchChange;
    PitchDelta = int(float(Rotation.Pitch) + PitchAccel) - OriginalRotation.Pitch;
    // End:0x111
    if(float(PitchDelta) > RotPitchConstant_Down)
    {
        PitchAccel = float(Rotation.Pitch - OriginalRotation.Pitch) - RotPitchConstant_Down;
    }
    // End:0x149
    else
    {
        // End:0x149
        if(float(PitchDelta) < -RotPitchConstant_Up)
        {
            PitchAccel = float(Rotation.Pitch - OriginalRotation.Pitch) + RotPitchConstant_Up;
        }
    }
    YawDelta = int(float(Rotation.Yaw) + YawAccel) - OriginalRotation.Yaw;
    // End:0x1a9
    if(float(YawDelta) > RotYawConstrant_Right)
    {
        YawAccel = float(Rotation.Yaw - OriginalRotation.Yaw) - RotYawConstrant_Right;
    }
    // End:0x1e1
    else
    {
        // End:0x1e1
        if(float(YawDelta) < -RotYawConstrant_Left)
        {
            YawAccel = float(Rotation.Yaw - OriginalRotation.Yaw) + RotYawConstrant_Left;
        }
    }
    NewRotation = Rotation;
    NewRotation.Yaw += int(YawAccel);
    NewRotation.Pitch += int(PitchAccel);
    SetRotation(NewRotation);
}

function NotifyAllControllers(float dt)
{
    local Controller C;

    NotifyElapsed += dt;
    // End:0x6b
    if(NotifyElapsed > float(2))
    {
        NotifyElapsed = 0.0;
        C = Level.ControllerList;
        J0x39:
        // End:0x6b [While If]
        if(C != none)
        {
            C.NotifyVehicle(self);
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x39;
        }
    }
}

simulated function Tick(float DeltaTime)
{
    local int dFrame, dUpDownFrame, YawDelta, PitchDelta, tmPitch, tmYaw;

    NotifyAllControllers(DeltaTime);
    // End:0x5d
    if(TurretBase != none && TurretBase.DrawType == 2)
    {
        TurretBase.UpdateBaseRotation(Rotation);
        // End:0x5d
        if(IsLocallyControlled())
        {
            TurretBase.UpdateOverlay();
        }
    }
    tmPitch = Rotation.Pitch & 65535;
    tmYaw = Rotation.Yaw & 65535;
    PitchDelta = OriginalRotation.Pitch - Rotation.Pitch;
    // End:0xcb
    if(PitchDelta > 32767)
    {
        PitchDelta = 65535 - PitchDelta;
    }
    // End:0xec
    else
    {
        // End:0xec
        if(PitchDelta < -32767)
        {
            PitchDelta = 65535 + PitchDelta;
        }
    }
    PitchDelta = Clamp(PitchDelta, int(-RotPitchConstant_Up), int(RotPitchConstant_Down));
    dUpDownFrame = 39 * PitchDelta + AnimRotBase / 2 * AnimRotBase;
    dUpDownFrame = Clamp(dUpDownFrame, 0, 39);
    YawDelta = OriginalRotation.Yaw - Rotation.Yaw;
    // End:0x17a
    if(YawDelta > 32767)
    {
        YawDelta = 65535 - YawDelta;
    }
    // End:0x19b
    else
    {
        // End:0x19b
        if(YawDelta < -32767)
        {
            YawDelta = 65535 + YawDelta;
        }
    }
    YawDelta = Clamp(YawDelta, int(-RotYawConstrant_Left), int(RotYawConstrant_Right));
    dFrame = 199 * YawDelta + AnimRotBase / 2 * AnimRotBase;
    dFrame = Clamp(dFrame, 0, 199);
    TestSetDriverFrame(float(dFrame), float(dUpDownFrame));
    // End:0x208
    if(Driver != none)
    {
    }
}

simulated function TestSetDriverFrame(float frame, optional float UpDownFrame)
{
    // End:0x24
    if(Driver != none)
    {
        Driver.SetDriverFrame(frame, UpDownFrame);
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
    local Vector AmbShakeOffset;
    local Rotator AmbShakeRot;
    local float FalloffScaling;

    CameraLocation = Location;
    ViewActor = self;
    R = GetViewRotation();
    GetAxes(R, X, Y, Z);
    // End:0x1af
    if(PC.bEnableAmbientShake)
    {
        // End:0xa3
        if(PC.AmbientShakeFalloffStartTime > float(0) && Level.TimeSeconds - PC.AmbientShakeFalloffStartTime > PC.AmbientShakeFalloffTime)
        {
            PC.bEnableAmbientShake = false;
        }
        // End:0x1af
        else
        {
            // End:0x10e
            if(PC.AmbientShakeFalloffStartTime > float(0))
            {
                FalloffScaling = 1.0 - Level.TimeSeconds - PC.AmbientShakeFalloffStartTime / PC.AmbientShakeFalloffTime;
                FalloffScaling = FClamp(FalloffScaling, 0.0, 1.0);
            }
            // End:0x119
            else
            {
                FalloffScaling = 1.0;
            }
            AmbShakeOffset = PC.AmbientShakeOffsetMag * FalloffScaling * Sin(Level.TimeSeconds * PC.AmbientShakeOffsetFreq * float(2) * 3.1415930);
            AmbShakeRot = PC.AmbientShakeRotMag * FalloffScaling * Sin(Level.TimeSeconds * PC.AmbientShakeRotFreq * float(2) * 3.1415930);
        }
    }
    CameraRotation = Normalize(Rotation + PC.ShakeRot + PC.wShakeRot + PC.wShockRot + AmbShakeRot);
    CameraLocation = CameraLocation + PC.ShakeOffset.X * X + PC.ShakeOffset.Y * Y + PC.ShakeOffset.Z * Z + AmbShakeOffset;
    PC.RotateByAttacked(CameraLocation, CameraRotation);
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

simulated function AttachDriver(Pawn P)
{
    local Vector AttachPos;
    local Rotator AttachRotation;

    DriverEnteredLocation = P.Location;
    ExitPositions[0] = DriverEnteredLocation;
    ExitPositions[1] = DriverEnteredLocation;
    AttachRotation.Yaw = OriginalRotation.Yaw;
    AttachPos = OriginalLocation + DrivePos >> AttachRotation;
    P.SetLocation(AttachPos);
    P.SetRotation(AttachRotation);
    vDriverAttachPos = AttachPos;
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    OldFOV = PC.FovAngle;
    super.ClientKDriverEnter(PC);
}

function KDriverEnter(Pawn P)
{
    local PlayerController PC;

    PC = PlayerController(P.Controller);
    // End:0xa5
    if(PC != none)
    {
        Log("KDriverEnter name=" $ string(Name) $ " Driver=" $ PC.PlayerReplicationInfo.PlayerName);
        PC.GSSS.SetToStorage_Vehicle_Enter(string(Class), Location.X, Location.Y, Location.Z);
    }
    super(Vehicle).KDriverEnter(P);
}

event bool KDriverLeave(bool bForceLeave)
{
    local PlayerController PC;
    local bool bKDriverLeave;

    Log("KDriverLeave name=" $ string(Name) $ " bForceLeave=" $ string(bForceLeave) $ " Driver=" $ PC.PlayerReplicationInfo.PlayerName);
    // End:0x92
    if(!bForceLeave)
    {
        PC = PlayerController(Controller);
        PC.GSSS.SetToStorage_Vehicle_Leave();
    }
    bKDriverLeave = super.KDriverLeave(bForceLeave);
    return bKDriverLeave;
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

simulated function bool PointOfView()
{
    // End:0x0d
    if(!bAllowViewChange)
    {
        return true;
    }
    return bDesiredBehindView;
}

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
    // End:0x561 [While If]
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
        tryPlace = ExitPositions[i];
        // End:0x555
        if(!Driver.SetLocation(tryPlace))
        {
        }
        // End:0x557
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

simulated function InitBaseRotation()
{
    Driver.SetRotation(TurretBase.Rotation);
    TurretBase.SetRotation(OriginalRotation);
    SetRotation(OriginalRotation);
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
simulated function MakeFireNoise()
{
    Driver.MakeFireNoise();
}

defaultproperties
{
    RotationInertia=0.20
    RotationSpeed=16.0
    CamAbsLocation=(X=0.0,Y=0.0,Z=100.0)
    CamRelLocation=(X=200.0,Y=0.0,Z=100.0)
    CamDistance=(X=-800.0,Y=0.0,Z=100.0)
    RotYawConstrant_Left=7280.0
    RotYawConstrant_Right=7280.0
    RotPitchConstant_Up=7280.0
    RotPitchConstant_Down=7280.0
    RotSpeed_Yaw=7.0
    RotSpeed_Pitch=4.0
    CamRotationInertia=0.000010
    MinPlayerFOV=20.0
    ZoomSpeed=1.50
    ZoomWeaponOffsetAdjust=80.0
    AnimRotBase=7280
    VehicleProjSpawnOffset=(X=138.0,Y=-65.0,Z=16.0)
    CrosshairScale=0.50
    bCHZeroYOffset=true
    bDefensive=true
    bAutoTurret=true
    bRemoteControlled=true
    AutoTurretControllerClass=Class'UnrealGame.TurretController'
    DriveAnim=MG_Idle
    FPCamPos=(X=0.0,Y=0.0,Z=40.0)
    VehiclePositionString="manning a turret"
    VehicleNameString="Energy Turret"
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
    bSetPCRotOnPossess=true
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