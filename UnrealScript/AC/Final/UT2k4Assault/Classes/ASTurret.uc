class ASTurret extends ASVehicle
    abstract;

var Class<ASTurret_Base> TurretBaseClass;
var ASTurret_Base TurretBase;
var Rotator OriginalRotation;
var Vector OriginalLocation;
var Vector OriginalDirection;
var Rotator EnterRotation;
var float TurretFOV;
var Class<ASTurret_Base> TurretSwivelClass;
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
    // Pos:0x000
    reliable if(bNetInitial && int(Role) == int(ROLE_Authority))
        EnterRotation, OriginalDirection, 
        OriginalLocation, OriginalRotation;

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
    else
    {
        ASVehicleFactory_Turret(ParentFactory).PrevVehicle(self);
    }
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
    local PlayerController PC;

    super.PossessedBy(C);
    PC = PlayerController(C);
    // End:0x5D
    if(PC != none)
    {
        // End:0x49
        if(TurretFOV < MinPlayerFOV)
        {
            TurretFOV = PC.DefaultFOV;
        }
        PC.SetFOV(TurretFOV);
    }
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
    local int Pitch;
    local Rotator NewRotation;

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
    YawAccel = (RotationInertia * YawAccel) + ((DeltaTime * RotationSpeed) * YawChange);
    PitchAccel = (RotationInertia * PitchAccel) + ((DeltaTime * RotationSpeed) * PitchChange);
    Pitch = Rotation.Pitch & 65535;
    // End:0x16D
    if((float(Pitch) > (float(16384) - RotPitchConstraint.Max)) && float(Pitch) < (float(49152) + RotPitchConstraint.Min))
    {
        // End:0x13C
        if(float(Pitch) > (float(49152) - RotPitchConstraint.Min))
        {
            PitchAccel = float(Max(int(PitchAccel), 0));            
        }
        else
        {
            // End:0x16D
            if(float(Pitch) < (float(16384) + RotPitchConstraint.Max))
            {
                PitchAccel = float(Min(int(PitchAccel), 0));
            }
        }
    }
    NewRotation = Rotation;
    NewRotation.Yaw += int(YawAccel);
    NewRotation.Pitch += int(PitchAccel);
    SetRotation(NewRotation);
    // End:0x22B
    if(IsLocallyControlled())
    {
        // End:0x1E4
        if((TurretBase != none) && int(TurretBase.DrawType) == int(2))
        {
            TurretBase.UpdateOverlay();
        }
        // End:0x22B
        if(TurretSwivel != none)
        {
            // End:0x217
            if(int(TurretSwivel.DrawType) == int(2))
            {
                TurretSwivel.UpdateOverlay();
            }
            TurretSwivel.UpdateSwivelRotation(NewRotation);
        }
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

    CameraLocation = Location;
    ViewActor = self;
    R = GetViewRotation();
    GetAxes(R, X, Y, Z);
    CameraRotation = Normalize(R + PC.ShakeRot);
    CameraLocation = ((CameraLocation + (PC.ShakeOffset.X * X)) + (PC.ShakeOffset.Y * Y)) + (PC.ShakeOffset.Z * Z);
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

simulated function ClientKDriverEnter(PlayerController PC)
{
    OldFOV = PC.FovAngle;
    super.ClientKDriverEnter(PC);
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

defaultproperties
{
    RotationInertia=0.2000000
    RotPitchConstraint=(Min=12288.0000000,Max=4096.0000000)
    RotationSpeed=16.0000000
    CamAbsLocation=(X=0.0000000,Y=0.0000000,Z=100.0000000)
    CamRelLocation=(X=200.0000000,Y=0.0000000,Z=100.0000000)
    CamDistance=(X=-800.0000000,Y=0.0000000,Z=100.0000000)
    CamRotationInertia=0.0000100
    MinPlayerFOV=20.0000000
    ZoomSpeed=1.5000000
    ZoomWeaponOffsetAdjust=80.0000000
    VehicleProjSpawnOffset=(X=138.0000000,Y=-65.0000000,Z=16.0000000)
    CrosshairScale=0.5000000
    bCHZeroYOffset=true
    bDefensive=true
    bAutoTurret=true
    bRemoteControlled=true
    AutoTurretControllerClass=Class'UnrealGame.TurretController'
    FPCamPos=(X=0.0000000,Y=0.0000000,Z=40.0000000)
    VehiclePositionString="?? ??"
    VehicleNameString="??? ??"
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