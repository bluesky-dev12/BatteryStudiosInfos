class Bulldog extends KCar;

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
var() Class<Actor> DestroyedEffect;
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
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        CurrentTarget, HeadlightOn;
}

function PreBeginPlay()
{
    super(Vehicle).PreBeginPlay();
    // End:0x1B
    if(Level.IsDemoBuild())
    {
        Destroy();
    }
    //return;    
}

simulated function PostNetBeginPlay()
{
    local Vector RotX, RotY, RotZ;
    local int i;

    super.PostNetBeginPlay();
    GetAxes(Rotation, RotX, RotY, RotZ);
    // End:0x171
    if(int(Level.NetMode) != int(NM_Client))
    {
        FLTrigger = Spawn(Class'Vehicles_Decompressed.BulldogTrigger', self,, ((Location + (FrontTriggerOffset.X * RotX)) + (FrontTriggerOffset.Y * RotY)) + (FrontTriggerOffset.Z * RotZ));
        FLTrigger.SetBase(self);
        FLTrigger.SetCollision(true, false, false);
        FRTrigger = Spawn(Class'Vehicles_Decompressed.BulldogTrigger', self,, ((Location + (FrontTriggerOffset.X * RotX)) - (FrontTriggerOffset.Y * RotY)) + (FrontTriggerOffset.Z * RotZ));
        FRTrigger.SetBase(self);
        FRTrigger.SetCollision(true, false, false);
        TriggerState = true;
        FlipTrigger = Spawn(Class'Vehicles_Decompressed.BulldogTrigger', self,, Location);
        FlipTrigger.bCarFlipTrigger = true;
        FlipTrigger.SetBase(self);
        FlipTrigger.SetCollisionSize(350.0000000, 200.0000000);
        FlipTrigger.SetCollision(false, false, false);
        FlipTriggerState = false;
    }
    // End:0x3DC
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        Headlight = Spawn(Class'Vehicles_Decompressed.BulldogHeadlight', self,, ((Location + (HeadlightOffset.X * RotX)) + (HeadlightOffset.Y * RotY)) + (HeadlightOffset.Z * RotZ));
        Headlight.SetBase(self);
        Headlight.SetRelativeRotation(rot(-2000, 32768, 0));
        Dust[0] = Spawn(Class'Vehicles_Decompressed.BulldogDust', self,, ((Location + (WheelFrontAlong * RotX)) + (WheelFrontAcross * RotY)) + ((WheelVert - DustDrop) * RotZ));
        Dust[0].SetBase(self);
        Dust[1] = Spawn(Class'Vehicles_Decompressed.BulldogDust', self,, ((Location + (WheelFrontAlong * RotX)) - (WheelFrontAcross * RotY)) + ((WheelVert - DustDrop) * RotZ));
        Dust[1].SetBase(self);
        Dust[2] = Spawn(Class'Vehicles_Decompressed.BulldogDust', self,, ((Location + (WheelRearAlong * RotX)) + (WheelRearAcross * RotY)) + ((WheelVert - DustDrop) * RotZ));
        Dust[2].SetBase(self);
        Dust[3] = Spawn(Class'Vehicles_Decompressed.BulldogDust', self,, ((Location + (WheelRearAlong * RotX)) - (WheelRearAcross * RotY)) + ((WheelVert - DustDrop) * RotZ));
        Dust[3].SetBase(self);
        Skins[1] = BrakeMaterial;
        Skins[2] = HeadlightOffMaterial;
        i = 0;
        J0x383:

        // End:0x3DC [Loop If]
        if(i < 8)
        {
            HeadlightCorona[i] = Spawn(Class'Vehicles_Decompressed.BulldogHeadlightCorona', self,, Location + (HeadlightCoronaOffset[i] >> Rotation));
            HeadlightCorona[i].SetBase(self);
            i++;
            // [Loop Continue]
            goto J0x383;
        }
    }
    KSetImpactThreshold(HitSoundThreshold);
    // End:0x489
    if(int(Role) != int(ROLE_Authority))
    {
        KarmaParams(KParams).bDestroyOnSimError = false;
        KarmaParams(frontLeft.KParams).bDestroyOnSimError = false;
        KarmaParams(frontRight.KParams).bDestroyOnSimError = false;
        KarmaParams(rearLeft.KParams).bDestroyOnSimError = false;
        KarmaParams(rearRight.KParams).bDestroyOnSimError = false;
    }
    //return;    
}

simulated event Destroyed()
{
    local int i;

    // End:0x3D
    if(int(Level.NetMode) != int(NM_Client))
    {
        FLTrigger.Destroy();
        FRTrigger.Destroy();
        FlipTrigger.Destroy();
    }
    // End:0xC0
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        Headlight.Destroy();
        i = 0;
        J0x69:

        // End:0x91 [Loop If]
        if(i < 4)
        {
            Dust[i].Destroy();
            i++;
            // [Loop Continue]
            goto J0x69;
        }
        i = 0;
        J0x98:

        // End:0xC0 [Loop If]
        if(i < 8)
        {
            HeadlightCorona[i].Destroy();
            i++;
            // [Loop Continue]
            goto J0x98;
        }
    }
    super.Destroyed();
    // End:0xF6
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        Spawn(DestroyedEffect, self,, Location);
        PlaySound(DestroyedSound);
    }
    //return;    
}

function KImpact(Actor Other, Vector pos, Vector impactVel, Vector impactNorm)
{
    // End:0x0D
    if(Other != none)
    {
        return;
    }
    // End:0x1A
    if(UntilNextImpact < float(0))
    {
    }
    //return;    
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    super(KVehicle).ClientKDriverEnter(PC);
    //return;    
}

function KDriverEnter(Pawn P)
{
    super(KVehicle).KDriverEnter(P);
    P.bHidden = true;
    ReceiveLocalizedMessage(Class'Vehicles_Decompressed.BulldogMessage', 1);
    //return;    
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    super(KVehicle).ClientKDriverLeave(PC);
    //return;    
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
    else
    {
        return false;
    }
    //return;    
}

function LaunchRocket(bool bWasAltFire)
{
    local Vector RotX, RotY, RotZ, FireLocation;
    local PlayerController PC;

    // End:0x12
    if(int(Role) != int(ROLE_Authority))
    {
        return;
    }
    GetAxes(Rotation, RotX, RotY, RotZ);
    FireLocation = Location + (RocketFireOffset >> Rotation);
    J0x42:

    // End:0xBE [Loop If]
    if(FireCountdown <= float(0))
    {
        // End:0xAF
        if(!bWasAltFire)
        {
            PC = PlayerController(Controller);
            // End:0xAC
            if((PC != none) && PC.bEnableWeaponForceFeedback)
            {
                PC.ClientPlayForceFeedback("RocketLauncherFire");
            }            
        }
        FireCountdown += FireInterval;
        // [Loop Continue]
        goto J0x42;
    }
    //return;    
}

function VehicleFire(bool bWasAltFire)
{
    super(Vehicle).VehicleFire(bWasAltFire);
    // End:0x30
    if(FireCountdown < float(0))
    {
        FireCountdown = 0.0000000;
        LaunchRocket(bWasAltFire);
    }
    //return;    
}

simulated function DrawHUD(Canvas C)
{
    local int XPos, YPos;
    local Vector ScreenPos;
    local float ratioX, ratioY, tileX, tileY, SizeX, SizeY,
	    PosDotDir;

    local Vector CameraLocation, CamDir;
    local Rotator CameraRotation;

    // End:0x0D
    if(CurrentTarget == none)
    {
        return;
    }
    SizeX = 64.0000000;
    SizeY = 64.0000000;
    ScreenPos = C.WorldToScreen(CurrentTarget.Location);
    C.GetCameraLocation(CameraLocation, CameraRotation);
    CamDir = Vector(CameraRotation);
    PosDotDir = (CurrentTarget.Location - CameraLocation) Dot CamDir;
    // End:0x9D
    if(PosDotDir < float(0))
    {
        return;
    }
    ratioX = float(C.SizeX) / 640.0000000;
    ratioY = float(C.SizeY) / 480.0000000;
    tileX = SizeX * ratioX;
    tileY = SizeY * ratioX;
    XPos = int(ScreenPos.X);
    YPos = int(ScreenPos.Y);
    C.Style = 6;
    C.DrawColor.R = byte(255);
    C.DrawColor.G = byte(255);
    C.DrawColor.B = byte(255);
    C.DrawColor.A = byte(255);
    C.SetPos(float(XPos) - (tileX * 0.5000000), float(YPos) - (tileY * 0.5000000));
    C.DrawTile(TargetMaterial, tileX, tileY, 0.0000000, 0.0000000, 256.0000000, 256.0000000);
    //return;    
}

simulated function Tick(float Delta)
{
    local float bestAim, BestDist, TotalSlip, EnginePitch, VMag;

    local Vector RotX, RotY, RotZ, FireLocation;
    local Pawn NewTarget;
    local int i;

    super.Tick(Delta);
    // End:0x122
    if(int(Role) == int(ROLE_Authority))
    {
        // End:0x31
        if(Driver != none)
        {
            HeadlightOn = true;            
        }
        else
        {
            HeadlightOn = false;
        }
        SinceLastTargetting += Delta;
        // End:0xF3
        if((Controller != none) && SinceLastTargetting > TargettingInterval)
        {
            GetAxes(Rotation, RotX, RotY, RotZ);
            FireLocation = Location + (RocketFireOffset >> Rotation);
            bestAim = 0.0000000;
            NewTarget = Controller.PickTarget(bestAim, BestDist, -1.0000000 * RotX, FireLocation, TargettingRange);
            // End:0xDD
            if(NewTarget != CurrentTarget)
            {
            }
            CurrentTarget = NewTarget;
            SinceLastTargetting = 0.0000000;
        }
        FireCountdown -= Delta;
        // End:0x112
        if(bVehicleIsFiring)
        {
            LaunchRocket(false);            
        }
        else
        {
            // End:0x122
            if(bVehicleIsAltFiring)
            {
                LaunchRocket(true);
            }
        }
    }
    // End:0x2CE
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        // End:0x168
        if((Gear == -1) && OutputBrake == false)
        {
            Skins[1] = ReverseMaterial;            
        }
        else
        {
            // End:0x191
            if((Gear == 0) && OutputBrake == true)
            {
                Skins[1] = BrakeMaterial;                
            }
            else
            {
                Skins[1] = TailOffMaterial;
            }
        }
        Headlight.DetachProjector();
        // End:0x20A
        if(HeadlightOn)
        {
            Headlight.AttachProjector();
            Skins[2] = HeadlightOnMaterial;
            i = 0;
            J0x1DA:

            // End:0x207 [Loop If]
            if(i < 8)
            {
                HeadlightCorona[i].bHidden = false;
                i++;
                // [Loop Continue]
                goto J0x1DA;
            }            
        }
        else
        {
            Skins[2] = HeadlightOffMaterial;
            i = 0;
            J0x21F:

            // End:0x24C [Loop If]
            if(i < 8)
            {
                HeadlightCorona[i].bHidden = true;
                i++;
                // [Loop Continue]
                goto J0x21F;
            }
        }
        Dust[0].UpdateDust(frontLeft, DustSlipRate, DustSlipThresh);
        Dust[1].UpdateDust(frontRight, DustSlipRate, DustSlipThresh);
        Dust[2].UpdateDust(rearLeft, DustSlipRate, DustSlipThresh);
        Dust[3].UpdateDust(rearRight, DustSlipRate, DustSlipThresh);
    }
    UntilNextImpact -= Delta;
    EnginePitch = 64.0000000 + ((WheelSpinSpeed / EnginePitchScale) * float(255 - 64));
    SoundPitch = byte(FClamp(EnginePitch, 0.0000000, 254.0000000));
    TotalSlip = rearLeft.GroundSlipVel + rearRight.GroundSlipVel;
    // End:0x360
    if(TotalSlip > SquealVelThresh)
    {
        rearLeft.AmbientSound = BulldogSquealSound;        
    }
    else
    {
        rearLeft.AmbientSound = none;
    }
    // End:0x4BA
    if(int(Level.NetMode) != int(NM_Client))
    {
        VMag = VSize(Velocity);
        // End:0x3E9
        if((!bIsInverted && VMag < TriggerSpeedThresh) && TriggerState == false)
        {
            FLTrigger.SetCollision(true, false, false);
            FRTrigger.SetCollision(true, false, false);
            TriggerState = true;            
        }
        else
        {
            // End:0x437
            if((bIsInverted || VMag > TriggerSpeedThresh) && TriggerState == true)
            {
                FLTrigger.SetCollision(false, false, false);
                FRTrigger.SetCollision(false, false, false);
                TriggerState = false;
            }
        }
        // End:0x479
        if((bIsInverted && VMag < TriggerSpeedThresh) && FlipTriggerState == false)
        {
            FlipTrigger.SetCollision(true, false, false);
            FlipTriggerState = true;            
        }
        else
        {
            // End:0x4BA
            if((!bIsInverted || VMag > TriggerSpeedThresh) && FlipTriggerState == true)
            {
                FlipTrigger.SetCollision(false, false, false);
                FlipTriggerState = false;
            }
        }
    }
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType)
{
    // End:0x0D
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
            else
            {
                Controller.Destroy();
            }
        }
        Destroy();
    }
    //return;    
}

function Actor GetBestEntry(Pawn P)
{
    // End:0x0F
    if(FlipTriggerState)
    {
        return FlipTrigger;
    }
    // End:0x5A
    if(VSize(P.Location - FLTrigger.Location) < VSize(P.Location - FRTrigger.Location))
    {
        return FLTrigger;
    }
    return FRTrigger;
    //return;    
}

defaultproperties
{
    FrontTriggerOffset=(X=0.0000000,Y=165.0000000,Z=10.0000000)
    HeadlightOffset=(X=-200.0000000,Y=0.0000000,Z=50.0000000)
    HeadlightCoronaOffset[0]=(X=-199.0000000,Y=51.0000000,Z=57.0000000)
    HeadlightCoronaOffset[1]=(X=-199.0000000,Y=-51.0000000,Z=57.0000000)
    HeadlightCoronaOffset[2]=(X=-128.0000000,Y=38.0000000,Z=125.0000000)
    HeadlightCoronaOffset[3]=(X=-189.0000000,Y=93.0000000,Z=28.0000000)
    HeadlightCoronaOffset[4]=(X=-183.0000000,Y=-93.0000000,Z=26.0000000)
    HeadlightCoronaOffset[5]=(X=-190.0000000,Y=-51.0000000,Z=77.0000000)
    HeadlightCoronaOffset[6]=(X=-128.0000000,Y=63.0000000,Z=123.0000000)
    HeadlightCoronaOffset[7]=(X=-185.0000000,Y=85.0000000,Z=10.0000000)
    UntilNextImpact=500.0000000
    DustDrop=30.0000000
    DustSlipRate=2.8000000
    DustSlipThresh=0.1000000
    TriggerSpeedThresh=40.0000000
    DestroyedEffect=Class'XEffects.RocketExplosion'
    FireInterval=0.9000000
    TargettingInterval=0.5000000
    RocketFireOffset=(X=0.0000000,Y=0.0000000,Z=180.0000000)
    TargettingRange=5000.0000000
    EnginePitchScale=655350.0000000
    HitSoundThreshold=30.0000000
    SquealVelThresh=15.0000000
    FrontTireClass=Class'Vehicles_Decompressed.BulldogTire'
    RearTireClass=Class'Vehicles_Decompressed.BulldogTire'
    WheelFrontAlong=-100.0000000
    WheelFrontAcross=110.0000000
    WheelRearAlong=115.0000000
    WheelRearAcross=110.0000000
    WheelVert=-15.0000000
    MaxSteerAngle=3400.0000000
    MaxBrakeTorque=55.0000000
    TorqueSplit=1.0000000
    SteerPropGap=500.0000000
    SteerTorque=15000.0000000
    SteerSpeed=20000.0000000
    SuspStiffness=150.0000000
    SuspDamping=14.5000000
    SuspHighLimit=0.5000000
    SuspLowLimit=-0.5000000
    TireRollFriction=1.5000000
    TireLateralFriction=1.5000000
    TireRollSlip=0.0600000
    TireLateralSlip=0.0400000
    TireSlipRate=0.0070000
    TireSoftness=0.0000000
    TireHandbrakeSlip=0.2000000
    TireHandbrakeFriction=-1.2000000
    ChassisMass=8.0000000
    StopThreshold=40.0000000
    TorqueCurve=(Points=/* Array type was not detected. */)
    OutputBrake=true
    DrivePos=(X=-165.0000000,Y=0.0000000,Z=-100.0000000)
    ExitPositions=/* Array type was not detected. */
    bSpecialHUD=true
    AirSpeed=5000.0000000
    HealthMax=800.0000000
    Health=800
    DrawType=8
    DrawScale=0.4000000
    SoundRadius=255.0000000
    // Reference: KarmaParamsRBFull'Vehicles_Decompressed.Bulldog.KParams0'
    begin object name="KParams0" class=Engine.KarmaParamsRBFull
        KInertiaTensor[0]=20.0000000
        KInertiaTensor[3]=30.0000000
        KInertiaTensor[5]=48.0000000
        KCOMOffset=(X=0.8000000,Y=0.0000000,Z=-0.7000000)
        KLinearDamping=0.0000000
        KAngularDamping=0.0000000
        KStartEnabled=true
        bHighDetailOnly=false
        bClientOnly=false
        bKDoubleTickRate=true
        KFriction=1.6000000
    end object
    KParams=KParams0
}