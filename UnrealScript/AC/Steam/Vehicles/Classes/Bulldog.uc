/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Vehicles\Classes\Bulldog.uc
 * Package Imports:
 *	Vehicles
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:43
 *	Functions:14
 *
 *******************************************************************************/
class Bulldog extends KCar
    dependson(KCar);

var const Vector FrontTriggerOffset;
var BulldogTrigger FLTrigger;
var BulldogTrigger FRTrigger;
var BulldogTrigger FlipTrigger;
var const Vector HeadlightOffset;
var BulldogHeadlight Headlight;
var bool HeadlightOn;
var Material ReverseMaterial;
var Material BrakeMaterial;
var Material TailOffMaterial;
var Material HeadlightOnMaterial;
var Material HeadlightOffMaterial;
var BulldogHeadlightCorona HeadlightCorona[8];
var() Vector HeadlightCoronaOffset[8];
var float UntilNextImpact;
var BulldogDust Dust[4];
var float DustDrop;
var() float DustSlipRate;
var() float DustSlipThresh;
var() float TriggerSpeedThresh;
var bool TriggerState;
var bool FlipTriggerState;
var() class<Actor> DestroyedEffect;
var() Sound DestroyedSound;
var float FireCountdown;
var float SinceLastTargetting;
var Pawn CurrentTarget;
var() float FireInterval;
var() float TargettingInterval;
var() Vector RocketFireOffset;
var() float TargettingRange;
var() Material TargetMaterial;
var() float EnginePitchScale;
var() Sound BulldogStartSound;
var() Sound BulldogIdleSound;
var() float HitSoundThreshold;
var() Sound BulldogSquealSound;
var() float SquealVelThresh;
var() Sound BulldogHitSound;
var() string BulldogStartForce;
var() string BulldogIdleForce;
var() string BulldogSquealForce;
var() string BulldogHitForce;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        HeadlightOn, CurrentTarget;

}

function PreBeginPlay()
{
    super(Vehicle).PreBeginPlay();
    // End:0x1b
    if(Level.IsDemoBuild())
    {
        Destroy();
    }
}

simulated function PostNetBeginPlay()
{
    local Vector RotX, RotY, RotZ;
    local int i;

    super.PostNetBeginPlay();
    GetAxes(Rotation, RotX, RotY, RotZ);
    // End:0x171
    if(Level.NetMode != 3)
    {
        FLTrigger = Spawn(class'BulldogTrigger', self,, Location + FrontTriggerOffset.X * RotX + FrontTriggerOffset.Y * RotY + FrontTriggerOffset.Z * RotZ);
        FLTrigger.SetBase(self);
        FLTrigger.SetCollision(true, false, false);
        FRTrigger = Spawn(class'BulldogTrigger', self,, Location + FrontTriggerOffset.X * RotX - FrontTriggerOffset.Y * RotY + FrontTriggerOffset.Z * RotZ);
        FRTrigger.SetBase(self);
        FRTrigger.SetCollision(true, false, false);
        TriggerState = true;
        FlipTrigger = Spawn(class'BulldogTrigger', self,, Location);
        FlipTrigger.bCarFlipTrigger = true;
        FlipTrigger.SetBase(self);
        FlipTrigger.SetCollisionSize(350.0, 200.0);
        FlipTrigger.SetCollision(false, false, false);
        FlipTriggerState = false;
    }
    // End:0x3dc
    if(Level.NetMode != 1)
    {
        Headlight = Spawn(class'BulldogHeadlight', self,, Location + HeadlightOffset.X * RotX + HeadlightOffset.Y * RotY + HeadlightOffset.Z * RotZ);
        Headlight.SetBase(self);
        Headlight.SetRelativeRotation(rot(-2000, 32768, 0));
        Dust[0] = Spawn(class'BulldogDust', self,, Location + WheelFrontAlong * RotX + WheelFrontAcross * RotY + WheelVert - DustDrop * RotZ);
        Dust[0].SetBase(self);
        Dust[1] = Spawn(class'BulldogDust', self,, Location + WheelFrontAlong * RotX - WheelFrontAcross * RotY + WheelVert - DustDrop * RotZ);
        Dust[1].SetBase(self);
        Dust[2] = Spawn(class'BulldogDust', self,, Location + WheelRearAlong * RotX + WheelRearAcross * RotY + WheelVert - DustDrop * RotZ);
        Dust[2].SetBase(self);
        Dust[3] = Spawn(class'BulldogDust', self,, Location + WheelRearAlong * RotX - WheelRearAcross * RotY + WheelVert - DustDrop * RotZ);
        Dust[3].SetBase(self);
        Skins[1] = BrakeMaterial;
        Skins[2] = HeadlightOffMaterial;
        i = 0;
        J0x383:
        // End:0x3dc [While If]
        if(i < 8)
        {
            HeadlightCorona[i] = Spawn(class'BulldogHeadlightCorona', self,, Location + HeadlightCoronaOffset[i] >> Rotation);
            HeadlightCorona[i].SetBase(self);
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x383;
        }
    }
    KSetImpactThreshold(HitSoundThreshold);
    // End:0x489
    if(Role != 4)
    {
        KarmaParams(KParams).bDestroyOnSimError = false;
        KarmaParams(frontLeft.KParams).bDestroyOnSimError = false;
        KarmaParams(frontRight.KParams).bDestroyOnSimError = false;
        KarmaParams(rearLeft.KParams).bDestroyOnSimError = false;
        KarmaParams(rearRight.KParams).bDestroyOnSimError = false;
    }
}

simulated event Destroyed()
{
    local int i;

    // End:0x3d
    if(Level.NetMode != 3)
    {
        FLTrigger.Destroy();
        FRTrigger.Destroy();
        FlipTrigger.Destroy();
    }
    // End:0xc0
    if(Level.NetMode != 1)
    {
        Headlight.Destroy();
        i = 0;
        J0x69:
        // End:0x91 [While If]
        if(i < 4)
        {
            Dust[i].Destroy();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x69;
        }
        i = 0;
        J0x98:
        // End:0xc0 [While If]
        if(i < 8)
        {
            HeadlightCorona[i].Destroy();
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x98;
        }
    }
    super.Destroyed();
    // End:0xf6
    if(Level.NetMode != 1)
    {
        Spawn(DestroyedEffect, self,, Location);
        PlaySound(DestroyedSound);
    }
}

function KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
    // End:0x0d
    if(Other != none)
    {
        return;
    }
    // End:0x1a
    if(UntilNextImpact < float(0))
    {
    }
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    super(KVehicle).ClientKDriverEnter(PC);
}

function KDriverEnter(Pawn P)
{
    super(KVehicle).KDriverEnter(P);
    P.bHidden = true;
    ReceiveLocalizedMessage(class'BulldogMessage', 1);
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    super(KVehicle).ClientKDriverLeave(PC);
}

function bool KDriverLeave(bool bForceLeave)
{
    local Pawn OldDriver;

    OldDriver = Driver;
    // End:0x37
    if(super(KVehicle).KDriverLeave(bForceLeave))
    {
        OldDriver.bHidden = false;
        AmbientSound = none;
        return true;
    }
    // End:0x39
    else
    {
        return false;
    }
}

function LaunchRocket(bool bWasAltFire)
{
    local Vector RotX, RotY, RotZ, FireLocation;
    local PlayerController PC;

    // End:0x12
    if(Role != 4)
    {
        return;
    }
    GetAxes(Rotation, RotX, RotY, RotZ);
    FireLocation = Location + RocketFireOffset >> Rotation;
    J0x42:
    // End:0xbe [While If]
    if(FireCountdown <= float(0))
    {
        // End:0xaf
        if(!bWasAltFire)
        {
            PC = PlayerController(Controller);
            // End:0xac
            if(PC != none && PC.bEnableWeaponForceFeedback)
            {
                PC.ClientPlayForceFeedback("RocketLauncherFire");
            }
        }
        // End:0xaf
        else
        {
        }
        FireCountdown += FireInterval;
        // This is an implied JumpToken; Continue!
        goto J0x42;
    }
}

function VehicleFire(bool bWasAltFire)
{
    super(Vehicle).VehicleFire(bWasAltFire);
    // End:0x30
    if(FireCountdown < float(0))
    {
        FireCountdown = 0.0;
        LaunchRocket(bWasAltFire);
    }
}

simulated function DrawHUD(Canvas C)
{
    local int XPos, YPos;
    local Vector ScreenPos;
    local float ratioX, ratioY, tileX, tileY, SizeX, SizeY,
	    PosDotDir;

    local Vector CameraLocation, CamDir;
    local Rotator CameraRotation;

    // End:0x0d
    if(CurrentTarget == none)
    {
        return;
    }
    SizeX = 64.0;
    SizeY = 64.0;
    ScreenPos = C.WorldToScreen(CurrentTarget.Location);
    C.GetCameraLocation(CameraLocation, CameraRotation);
    CamDir = vector(CameraRotation);
    PosDotDir = CurrentTarget.Location - CameraLocation Dot CamDir;
    // End:0x9d
    if(PosDotDir < float(0))
    {
        return;
    }
    ratioX = float(C.SizeX) / 640.0;
    ratioY = float(C.SizeY) / 480.0;
    tileX = SizeX * ratioX;
    tileY = SizeY * ratioX;
    XPos = int(ScreenPos.X);
    YPos = int(ScreenPos.Y);
    C.Style = 6;
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    C.DrawColor.A = byte(255);
    C.SetPos(float(XPos) - tileX * 0.50, float(YPos) - tileY * 0.50);
    C.DrawTile(TargetMaterial, tileX, tileY, 0.0, 0.0, 256.0, 256.0);
}

simulated function Tick(float Delta)
{
    local float bestAim, BestDist, TotalSlip, EnginePitch, VMag;

    local Vector RotX, RotY, RotZ, FireLocation;
    local Pawn NewTarget;
    local int i;

    super.Tick(Delta);
    // End:0x122
    if(Role == 4)
    {
        // End:0x31
        if(Driver != none)
        {
            HeadlightOn = true;
        }
        // End:0x39
        else
        {
            HeadlightOn = false;
        }
        SinceLastTargetting += Delta;
        // End:0xf3
        if(Controller != none && SinceLastTargetting > TargettingInterval)
        {
            GetAxes(Rotation, RotX, RotY, RotZ);
            FireLocation = Location + RocketFireOffset >> Rotation;
            bestAim = 0.0;
            NewTarget = Controller.PickTarget(bestAim, BestDist, -1.0 * RotX, FireLocation, TargettingRange);
            // End:0xdd
            if(NewTarget != CurrentTarget)
            {
            }
            CurrentTarget = NewTarget;
            SinceLastTargetting = 0.0;
        }
        FireCountdown -= Delta;
        // End:0x112
        if(bVehicleIsFiring)
        {
            LaunchRocket(false);
        }
        // End:0x122
        else
        {
            // End:0x122
            if(bVehicleIsAltFiring)
            {
                LaunchRocket(true);
            }
        }
    }
    // End:0x2ce
    if(Level.NetMode != 1)
    {
        // End:0x168
        if(Gear == -1 && OutputBrake == false)
        {
            Skins[1] = ReverseMaterial;
        }
        // End:0x19e
        else
        {
            // End:0x191
            if(Gear == 0 && OutputBrake == true)
            {
                Skins[1] = BrakeMaterial;
            }
            // End:0x19e
            else
            {
                Skins[1] = TailOffMaterial;
            }
        }
        Headlight.DetachProjector();
        // End:0x20a
        if(HeadlightOn)
        {
            Headlight.AttachProjector();
            Skins[2] = HeadlightOnMaterial;
            i = 0;
            J0x1da:
            // End:0x207 [While If]
            if(i < 8)
            {
                HeadlightCorona[i].bHidden = false;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1da;
            }
        }
        // End:0x24c
        else
        {
            Skins[2] = HeadlightOffMaterial;
            i = 0;
            J0x21f:
            // End:0x24c [While If]
            if(i < 8)
            {
                HeadlightCorona[i].bHidden = true;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x21f;
            }
        }
        Dust[0].UpdateDust(frontLeft, DustSlipRate, DustSlipThresh);
        Dust[1].UpdateDust(frontRight, DustSlipRate, DustSlipThresh);
        Dust[2].UpdateDust(rearLeft, DustSlipRate, DustSlipThresh);
        Dust[3].UpdateDust(rearRight, DustSlipRate, DustSlipThresh);
    }
    UntilNextImpact -= Delta;
    EnginePitch = 64.0 + WheelSpinSpeed / EnginePitchScale * float(255 - 64);
    SoundPitch = byte(FClamp(EnginePitch, 0.0, 254.0));
    TotalSlip = rearLeft.GroundSlipVel + rearRight.GroundSlipVel;
    // End:0x360
    if(TotalSlip > SquealVelThresh)
    {
        rearLeft.AmbientSound = BulldogSquealSound;
    }
    // End:0x370
    else
    {
        rearLeft.AmbientSound = none;
    }
    // End:0x4ba
    if(Level.NetMode != 3)
    {
        VMag = VSize(Velocity);
        // End:0x3e9
        if(!bIsInverted && VMag < TriggerSpeedThresh && TriggerState == false)
        {
            FLTrigger.SetCollision(true, false, false);
            FRTrigger.SetCollision(true, false, false);
            TriggerState = true;
        }
        // End:0x437
        else
        {
            // End:0x437
            if(bIsInverted || VMag > TriggerSpeedThresh && TriggerState == true)
            {
                FLTrigger.SetCollision(false, false, false);
                FRTrigger.SetCollision(false, false, false);
                TriggerState = false;
            }
        }
        // End:0x479
        if(bIsInverted && VMag < TriggerSpeedThresh && FlipTriggerState == false)
        {
            FlipTrigger.SetCollision(true, false, false);
            FlipTriggerState = true;
        }
        // End:0x4ba
        else
        {
            // End:0x4ba
            if(!bIsInverted || VMag > TriggerSpeedThresh && FlipTriggerState == true)
            {
                FlipTrigger.SetCollision(false, false, false);
                FlipTriggerState = false;
            }
        }
    }
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    // End:0x0d
    if(Damage < 0)
    {
        return;
    }
    // End:0x67
    if(Health <= 0)
    {
        // End:0x64
        if(Controller != none)
        {
            // End:0x58
            if(Controller.bIsPlayer)
            {
                ClientKDriverLeave(PlayerController(Controller));
                Controller.PawnDied(self);
            }
            // End:0x64
            else
            {
                Controller.Destroy();
            }
        }
        Destroy();
    }
}

function Actor GetBestEntry(Pawn P)
{
    // End:0x0f
    if(FlipTriggerState)
    {
        return FlipTrigger;
    }
    // End:0x5a
    if(VSize(P.Location - FLTrigger.Location) < VSize(P.Location - FRTrigger.Location))
    {
        return FLTrigger;
    }
    return FRTrigger;
}

defaultproperties
{
    FrontTriggerOffset=(X=0.0,Y=165.0,Z=10.0)
    HeadlightOffset=(X=-200.0,Y=0.0,Z=50.0)
    HeadlightCoronaOffset[0]=(X=-199.0,Y=51.0,Z=57.0)
    HeadlightCoronaOffset[1]=(X=-199.0,Y=-51.0,Z=57.0)
    HeadlightCoronaOffset[2]=(X=-128.0,Y=38.0,Z=125.0)
    HeadlightCoronaOffset[3]=(X=-189.0,Y=93.0,Z=28.0)
    HeadlightCoronaOffset[4]=(X=-183.0,Y=-93.0,Z=26.0)
    HeadlightCoronaOffset[5]=(X=-190.0,Y=-51.0,Z=77.0)
    HeadlightCoronaOffset[6]=(X=-128.0,Y=63.0,Z=123.0)
    HeadlightCoronaOffset[7]=(X=-185.0,Y=85.0,Z=10.0)
    UntilNextImpact=500.0
    DustDrop=30.0
    DustSlipRate=2.80
    DustSlipThresh=0.10
    TriggerSpeedThresh=40.0
    DestroyedEffect=Class'XEffects.RocketExplosion'
    FireInterval=0.90
    TargettingInterval=0.50
    RocketFireOffset=(X=0.0,Y=0.0,Z=180.0)
    TargettingRange=5000.0
    EnginePitchScale=655350.0
    HitSoundThreshold=30.0
    SquealVelThresh=15.0
    FrontTireClass=class'BulldogTire'
    RearTireClass=class'BulldogTire'
    WheelFrontAlong=-100.0
    WheelFrontAcross=110.0
    WheelRearAlong=115.0
    WheelRearAcross=110.0
    WheelVert=-15.0
    MaxSteerAngle=3400.0
    MaxBrakeTorque=55.0
    TorqueSplit=1.0
    SteerPropGap=500.0
    SteerTorque=15000.0
    SteerSpeed=20000.0
    SuspStiffness=150.0
    SuspDamping=14.50
    SuspHighLimit=0.50
    SuspLowLimit=-0.50
    TireRollFriction=1.50
    TireLateralFriction=1.50
    TireRollSlip=0.060
    TireLateralSlip=0.040
    TireSlipRate=0.0070
    TireSoftness=0.0
    TireHandbrakeSlip=0.20
    TireHandbrakeFriction=-1.20
    ChassisMass=8.0
    StopThreshold=40.0
    TorqueCurve=(Points=// Object reference not set to an instance of an object.
    ,InVal=0.0,OutVal=270.0)
    OutputBrake=true
    DrivePos=(X=-165.0,Y=0.0,Z=-100.0)
    ExitPositions=// Object reference not set to an instance of an object.
    
    bSpecialHUD=true
    AirSpeed=5000.0
    HealthMax=800.0
    Health=800
    DrawType=8
    DrawScale=0.40
    SoundRadius=255.0
    begin object name=KParams0 class=KarmaParamsRBFull
        KInertiaTensor[0]=20.0
        KInertiaTensor[3]=30.0
        KInertiaTensor[5]=48.0
        KCOMOffset=(X=0.80,Y=0.0,Z=-0.70)
        KLinearDamping=0.0
        KAngularDamping=0.0
        KStartEnabled=true
        bHighDetailOnly=true
        bClientOnly=true
        bKDoubleTickRate=true
        KFriction=1.60
    object end
    // Reference: KarmaParamsRBFull'Bulldog.KParams0'
    KParams=KParams0
}