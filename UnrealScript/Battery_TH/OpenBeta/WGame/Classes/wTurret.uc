class wTurret extends wVehicle
    abstract;

var Class<wTurret_Base> TurretBaseClass;
var wTurret_Base TurretBase;
var Rotator OriginalRotation;
var Vector OriginalLocation;
var Vector OriginalDirection;
var Rotator EnterRotation;
var float TurretFOV;
var Vector DriverEnteredLocation;
var Class<wTurret_Base> TurretSwivelClass;
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
    // Pos:0x000
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        EnterRotation, OriginalDirection, 
        OriginalLocation, OriginalRotation, 
        RotPitchConstant_Down, RotPitchConstant_Up, 
        RotSpeed_Pitch, RotSpeed_Yaw, 
        RotYawConstrant_Left, RotYawConstrant_Right;

    // Pos:0x018
    reliable if(int(Role) < int(ROLE_Authority))
        ServerSwitchTurret;
}

function bool RecommendLongRangedAttack()
{
    return true;
    //return;    
}

function bool StronglyRecommended(Actor S, int TeamIndex, Actor Objective)
{
    local int i;

    // End:0xB8
    if(Objective != none)
    {
        // End:0x76
        if(ObjectiveTag[0] != 'None')
        {
            i = 0;
            J0x23:

            // End:0x73 [Loop If]
            if(i < 6)
            {
                // End:0x49
                if(ObjectiveTag[i] == 'None')
                {
                    return false;
                    // [Explicit Continue]
                    goto J0x69;
                }
                // End:0x69
                if(ObjectiveTag[i] == Objective.Tag)
                {
                    return true;
                }
                J0x69:

                i++;
                // [Loop Continue]
                goto J0x23;
            }            
        }
        else
        {
            // End:0xB8
            if((VSize(Objective.Location - Location) > float(8000)) || !FastTrace(Objective.Location, Location))
            {
                return false;
            }
        }
    }
    return true;
    //return;    
}

function float BotDesireability(Actor S, int TeamIndex, Actor Objective)
{
    // End:0x23
    if(!StronglyRecommended(S, TeamIndex, Objective))
    {
        return 0.0000000;        
    }
    else
    {
        // End:0x5C
        if(((Health <= 0) || Occupied()) || bTeamLocked && (GetTeamNum()) != TeamIndex)
        {
            return 0.0000000;
        }
    }
    return (MaxDesireability * 0.5000000) + ((MaxDesireability * 0.5000000) * (float(Health) / HealthMax));
    //return;    
}

simulated function PrevWeapon()
{
    ServerSwitchTurret(false);
    //return;    
}

simulated function NextWeapon()
{
    ServerSwitchTurret(true);
    //return;    
}

function ServerSwitchTurret(bool bNextTurret)
{
    //return;    
}

simulated event PostBeginPlay()
{
    local Vector vX;

    vX.X = 1.0000000;
    // End:0x49
    if(int(Role) == int(ROLE_Authority))
    {
        OriginalRotation = Rotation;
        OriginalLocation = Location;
        OriginalDirection = vX >> OriginalRotation;
    }
    super.PostBeginPlay();
    //return;    
}

function PossessedBy(Controller C)
{
    EnterRotation = PlayerController(C).Rotation;
    super.PossessedBy(C);
    //return;    
}

function UnPossessed()
{
    super.UnPossessed();
    //return;    
}

simulated event PostNetBeginPlay()
{
    // End:0x32
    if((TurretBaseClass != none) && TurretBase == none)
    {
        TurretBase = Spawn(TurretBaseClass, self,, Location, OriginalRotation);
    }
    // End:0x64
    if((TurretSwivelClass != none) && TurretSwivel == none)
    {
        TurretSwivel = Spawn(TurretSwivelClass, self,, Location, OriginalRotation);
    }
    super(Pawn).PostNetBeginPlay();
    //return;    
}

simulated function bool HasAmmo()
{
    return true;
    //return;    
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
    // End:0xBE
    if(iYaw > 32767)
    {
        iYaw = 65535 - iYaw;        
    }
    else
    {
        // End:0xDF
        if(iYaw < -32767)
        {
            iYaw = 65535 + iYaw;
        }
    }
    iYaw = Clamp(iYaw, int(-RotYawConstrant_Left), int(RotYawConstrant_Right));
    PCRot.Pitch = OriginalRotation.Pitch + iPitch;
    PCRot.Yaw = OriginalRotation.Yaw + iYaw;
    SetRotation(PCRot);
    //return;    
}

simulated event Destroyed()
{
    // End:0x17
    if(TurretBase != none)
    {
        TurretBase.Destroy();
    }
    // End:0x2E
    if(TurretSwivel != none)
    {
        TurretSwivel.Destroy();
    }
    super.Destroyed();
    //return;    
}

simulated function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
    local Rotator NewRotation;
    local int YawDelta, PitchDelta;

    // End:0x49
    if((PlayerController(Controller) != none) && PlayerController(Controller).bFreeCamera)
    {
        PlayerController(Controller).UpdateRotation(DeltaTime, 0.0000000);
        return;
    }
    // End:0x63
    if(DeltaTime > 0.3000000)
    {
        DeltaTime = 0.3000000;
    }
    YawAccel = (RotationInertia * YawAccel) + ((DeltaTime * RotSpeed_Yaw) * YawChange);
    PitchAccel = (RotationInertia * PitchAccel) + ((DeltaTime * RotSpeed_Pitch) * PitchChange);
    PitchDelta = int(float(Rotation.Pitch) + PitchAccel) - OriginalRotation.Pitch;
    // End:0x111
    if(float(PitchDelta) > RotPitchConstant_Down)
    {
        PitchAccel = float(Rotation.Pitch - OriginalRotation.Pitch) - RotPitchConstant_Down;        
    }
    else
    {
        // End:0x149
        if(float(PitchDelta) < -RotPitchConstant_Up)
        {
            PitchAccel = float(Rotation.Pitch - OriginalRotation.Pitch) + RotPitchConstant_Up;
        }
    }
    YawDelta = int(float(Rotation.Yaw) + YawAccel) - OriginalRotation.Yaw;
    // End:0x1A9
    if(float(YawDelta) > RotYawConstrant_Right)
    {
        YawAccel = float(Rotation.Yaw - OriginalRotation.Yaw) - RotYawConstrant_Right;        
    }
    else
    {
        // End:0x1E1
        if(float(YawDelta) < -RotYawConstrant_Left)
        {
            YawAccel = float(Rotation.Yaw - OriginalRotation.Yaw) + RotYawConstrant_Left;
        }
    }
    NewRotation = Rotation;
    NewRotation.Yaw += int(YawAccel);
    NewRotation.Pitch += int(PitchAccel);
    SetRotation(NewRotation);
    //return;    
}

function NotifyAllControllers(float dt)
{
    local Controller C;

    NotifyElapsed += dt;
    // End:0x6B
    if(NotifyElapsed > float(2))
    {
        NotifyElapsed = 0.0000000;
        C = Level.ControllerList;
        J0x39:

        // End:0x6B [Loop If]
        if(C != none)
        {
            C.NotifyVehicle(self);
            C = C.nextController;
            // [Loop Continue]
            goto J0x39;
        }
    }
    //return;    
}

simulated function Tick(float DeltaTime)
{
    local int dFrame, dUpDownFrame, YawDelta, PitchDelta, tmPitch, tmYaw;

    NotifyAllControllers(DeltaTime);
    // End:0x5D
    if((TurretBase != none) && int(TurretBase.DrawType) == int(2))
    {
        TurretBase.UpdateBaseRotation(Rotation);
        // End:0x5D
        if(IsLocallyControlled())
        {
            TurretBase.UpdateOverlay();
        }
    }
    tmPitch = Rotation.Pitch & 65535;
    tmYaw = Rotation.Yaw & 65535;
    PitchDelta = OriginalRotation.Pitch - Rotation.Pitch;
    // End:0xCB
    if(PitchDelta > 32767)
    {
        PitchDelta = 65535 - PitchDelta;        
    }
    else
    {
        // End:0xEC
        if(PitchDelta < -32767)
        {
            PitchDelta = 65535 + PitchDelta;
        }
    }
    PitchDelta = Clamp(PitchDelta, int(-RotPitchConstant_Up), int(RotPitchConstant_Down));
    dUpDownFrame = (39 * (PitchDelta + AnimRotBase)) / (2 * AnimRotBase);
    dUpDownFrame = Clamp(dUpDownFrame, 0, 39);
    YawDelta = OriginalRotation.Yaw - Rotation.Yaw;
    // End:0x17A
    if(YawDelta > 32767)
    {
        YawDelta = 65535 - YawDelta;        
    }
    else
    {
        // End:0x19B
        if(YawDelta < -32767)
        {
            YawDelta = 65535 + YawDelta;
        }
    }
    YawDelta = Clamp(YawDelta, int(-RotYawConstrant_Left), int(RotYawConstrant_Right));
    dFrame = (199 * (YawDelta + AnimRotBase)) / (2 * AnimRotBase);
    dFrame = Clamp(dFrame, 0, 199);
    TestSetDriverFrame(float(dFrame), float(dUpDownFrame));
    // End:0x208
    if(Driver != none)
    {
    }
    //return;    
}

simulated function TestSetDriverFrame(float frame, optional float UpDownFrame)
{
    // End:0x24
    if(Driver != none)
    {
        Driver.SetDriverFrame(frame, UpDownFrame);
    }
    //return;    
}

simulated function bool SpecialCalcView(out Actor ViewActor, out Vector CameraLocation, out Rotator CameraRotation)
{
    local Vector CamLookAt, HitLocation, HitNormal;
    local PlayerController PC;
    local float DeltaTime;
    local Rotator CamRotationRate;

    PC = PlayerController(Controller);
    // End:0x47
    if(((PC == none) || PC.ViewTarget != self) || PC.bFreeCamera)
    {
        return false;
    }
    ViewActor = self;
    // End:0x7E
    if(!PC.bBehindView)
    {
        SpecialCalcFirstPersonView(PC, ViewActor, CameraLocation, CameraRotation);
        return true;
    }
    DeltaTime = Level.TimeSeconds - LastTimeSeconds;
    LastTimeSeconds = Level.TimeSeconds;
    CamLookAt = (Location + CamAbsLocation) + (CamRelLocation >> ViewActor.Rotation);
    CamRotationRate = Normalize(ViewActor.Rotation - LastCamRot);
    CameraRotation.Yaw = int(CalcInertia(DeltaTime, CamRotationInertia, float(CamRotationRate.Yaw), float(LastCamRot.Yaw)));
    CameraRotation.Pitch = int(CalcInertia(DeltaTime, CamRotationInertia, float(CamRotationRate.Pitch), float(LastCamRot.Pitch)));
    CameraRotation.Roll = 0;
    LastCamRot = CameraRotation;
    CameraLocation = CamLookAt + (CamDistance >> CameraRotation);
    // End:0x1D7
    if(Trace(HitLocation, HitNormal, CameraLocation, CamLookAt, false, vect(10.0000000, 10.0000000, 10.0000000)) != none)
    {
        CameraLocation = HitLocation + (HitNormal * float(10));
    }
    return true;
    //return;    
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
    // End:0x1AF
    if(PC.bEnableAmbientShake)
    {
        // End:0xA3
        if((PC.AmbientShakeFalloffStartTime > float(0)) && (Level.TimeSeconds - PC.AmbientShakeFalloffStartTime) > PC.AmbientShakeFalloffTime)
        {
            PC.bEnableAmbientShake = false;            
        }
        else
        {
            // End:0x10E
            if(PC.AmbientShakeFalloffStartTime > float(0))
            {
                FalloffScaling = 1.0000000 - ((Level.TimeSeconds - PC.AmbientShakeFalloffStartTime) / PC.AmbientShakeFalloffTime);
                FalloffScaling = FClamp(FalloffScaling, 0.0000000, 1.0000000);                
            }
            else
            {
                FalloffScaling = 1.0000000;
            }
            AmbShakeOffset = (PC.AmbientShakeOffsetMag * FalloffScaling) * Sin(((Level.TimeSeconds * PC.AmbientShakeOffsetFreq) * float(2)) * 3.1415927);
            AmbShakeRot = (PC.AmbientShakeRotMag * FalloffScaling) * Sin(((Level.TimeSeconds * PC.AmbientShakeRotFreq) * float(2)) * 3.1415927);
        }
    }
    CameraRotation = Normalize((((Rotation + PC.ShakeRot) + PC.wShakeRot) + PC.wShockRot) + AmbShakeRot);
    CameraLocation = (((CameraLocation + (PC.ShakeOffset.X * X)) + (PC.ShakeOffset.Y * Y)) + (PC.ShakeOffset.Z * Z)) + AmbShakeOffset;
    PC.RotateByAttacked(CameraLocation, CameraRotation);
    CameraLocation = CameraLocation + (FPCamPos >> (GetViewRotation()));
    //return;    
}

simulated function Rotator GetViewRotation()
{
    return Rotation;
    //return;    
}

simulated function PlayFiring(optional float Rate, optional name FiringMode)
{
    // End:0x1F
    if(FiringMode == '0')
    {
        PlayAnim('FireR', 0.4500000);        
    }
    else
    {
        PlayAnim('FireL', 0.4500000);
    }
    //return;    
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
    super.Explode(HitLocation, vect(0.0000000, 0.0000000, 1.0000000));
    // End:0x2F
    if(TurretBase != none)
    {
        TurretBase.Destroy();
    }
    // End:0x46
    if(TurretSwivel != none)
    {
        TurretSwivel.Destroy();
    }
    //return;    
}

simulated function DrawHealthInfo(Canvas C, PlayerController PC)
{
    //return;    
}

simulated function Actor PerformTrace(out Vector HitLocation, out Vector HitNormal, Vector End, Vector Start)
{
    local Actor HitActor;

    // End:0x1C
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
    //return;    
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
    ratioX = float(C.SizeX) / 640.0000000;
    ratioY = float(C.SizeY) / 480.0000000;
    tileX = (CrosshairScale * SizeX) * ratioX;
    tileY = (CrosshairScale * SizeY) * ratioX;
    C.Style = 6;
    C.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255));
    C.SetPos(ScreenPos.X - tileX, ScreenPos.Y - tileY);
    C.DrawTile(ZoomTickTex, tileX * float(2), tileY * float(2), 0.0000000, 0.0000000, SizeX, SizeY);
    ZoomPct = 1.0000000 - ((PC.FovAngle - MinPlayerFOV) / (PC.DefaultFOV - MinPlayerFOV));
    C.SetPos(ScreenPos.X - tileX, ScreenPos.Y - tileY);
    TexRotator(ZoomTick).Rotation.Yaw = int(float(32767) * ZoomPct);
    C.DrawTile(ZoomTick, tileX * float(2), tileY * float(2), 0.0000000, 0.0000000, SizeX, SizeY);
    PostZoomAdjust(ZoomPct);
    return true;
    //return;    
}

simulated function PostZoomAdjust(float ZoomPct)
{
    // End:0x4D
    if(!bDrawMeshInFP && Weapon != none)
    {
        Weapon.SmallViewOffset.X = Weapon.default.SmallViewOffset.X - (ZoomWeaponOffsetAdjust * ZoomPct);
    }
    //return;    
}

simulated function AttachDriver(Pawn P)
{
    local Vector AttachPos;
    local Rotator AttachRotation;

    DriverEnteredLocation = P.Location;
    ExitPositions[0] = DriverEnteredLocation;
    ExitPositions[1] = DriverEnteredLocation;
    AttachRotation.Yaw = OriginalRotation.Yaw;
    AttachPos = OriginalLocation + (DrivePos >> AttachRotation);
    P.SetLocation(AttachPos);
    P.SetRotation(AttachRotation);
    vDriverAttachPos = AttachPos;
    //return;    
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    OldFOV = PC.FovAngle;
    super.ClientKDriverEnter(PC);
    //return;    
}

function KDriverEnter(Pawn P)
{
    local PlayerController PC;

    PC = PlayerController(P.Controller);
    // End:0xA5
    if(PC != none)
    {
        Log((("KDriverEnter name=" $ string(Name)) $ " Driver=") $ PC.PlayerReplicationInfo.PlayerName);
        PC.GSSS.SetToStorage_Vehicle_Enter(string(Class), Location.X, Location.Y, Location.Z);
    }
    super(Vehicle).KDriverEnter(P);
    //return;    
}

event bool KDriverLeave(bool bForceLeave)
{
    local PlayerController PC;
    local bool bKDriverLeave;

    Log((((("KDriverLeave name=" $ string(Name)) $ " bForceLeave=") $ string(bForceLeave)) $ " Driver=") $ PC.PlayerReplicationInfo.PlayerName);
    // End:0x92
    if(!bForceLeave)
    {
        PC = PlayerController(Controller);
        PC.GSSS.SetToStorage_Vehicle_Leave();
    }
    bKDriverLeave = super.KDriverLeave(bForceLeave);
    return bKDriverLeave;
    //return;    
}

static function StaticPrecache(LevelInfo L)
{
    super.StaticPrecache(L);
    L.AddPrecacheMaterial(default.ZoomTick);
    L.AddPrecacheMaterial(default.ZoomTickTex);
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    Level.AddPrecacheMaterial(default.ZoomTick);
    Level.AddPrecacheMaterial(default.ZoomTickTex);
    super.UpdatePrecacheMaterials();
    //return;    
}

simulated function bool PointOfView()
{
    // End:0x0D
    if(!bAllowViewChange)
    {
        return true;
    }
    return bDesiredBehindView;
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

    // End:0x561 [Loop If]
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
        tryPlace = ExitPositions[i];
        // End:0x555
        if(!Driver.SetLocation(tryPlace))
        {
            // [Explicit Continue]
            goto J0x557;
        }
        return true;
        J0x557:

        i++;
        // [Loop Continue]
        goto J0x4C0;
    }
    return false;
    //return;    
}

simulated function InitBaseRotation()
{
    Driver.SetRotation(TurretBase.Rotation);
    TurretBase.SetRotation(OriginalRotation);
    SetRotation(OriginalRotation);
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
{
    //return;    
}

simulated function MakeFireNoise()
{
    Driver.MakeFireNoise();
    //return;    
}

defaultproperties
{
    RotationInertia=0.2000000
    RotationSpeed=16.0000000
    CamAbsLocation=(X=0.0000000,Y=0.0000000,Z=100.0000000)
    CamRelLocation=(X=200.0000000,Y=0.0000000,Z=100.0000000)
    CamDistance=(X=-800.0000000,Y=0.0000000,Z=100.0000000)
    RotYawConstrant_Left=7280.0000000
    RotYawConstrant_Right=7280.0000000
    RotPitchConstant_Up=7280.0000000
    RotPitchConstant_Down=7280.0000000
    RotSpeed_Yaw=7.0000000
    RotSpeed_Pitch=4.0000000
    CamRotationInertia=0.0000100
    MinPlayerFOV=20.0000000
    ZoomSpeed=1.5000000
    ZoomWeaponOffsetAdjust=80.0000000
    AnimRotBase=7280
    VehicleProjSpawnOffset=(X=138.0000000,Y=-65.0000000,Z=16.0000000)
    CrosshairScale=0.5000000
    bCHZeroYOffset=true
    bDefensive=true
    bAutoTurret=true
    bRemoteControlled=true
    AutoTurretControllerClass=Class'UnrealGame.TurretController'
    DriveAnim="MG_Idle"
    FPCamPos=(X=0.0000000,Y=0.0000000,Z=40.0000000)
    VehiclePositionString="manning a turret"
    VehicleNameString="Energy Turret"
    bSimulateGravity=false
    bIgnoreForces=true
    bStationary=true
    bSpecialHUD=true
    bSpecialCalcView=true
    SightRadius=25000.0000000
    WaterSpeed=0.0000000
    AirSpeed=0.0000000
    AccelRate=0.0000000
    JumpZ=0.0000000
    MaxFallSpeed=0.0000000
    HealthMax=650.0000000
    Health=650
    bSetPCRotOnPossess=false
    LandMovementState="PlayerTurreting"
    bIgnoreEncroachers=true
    Physics=5
    DrawScale=5.0000000
    AmbientGlow=64
    bShouldBaseAtStartup=false
    CollisionRadius=80.0000000
    CollisionHeight=80.0000000
    bCollideWorld=false
    bPathColliding=true
}