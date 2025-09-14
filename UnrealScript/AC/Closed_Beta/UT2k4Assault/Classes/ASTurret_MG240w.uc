class ASTurret_MG240w extends ASTurret;

var float RotYawConstraint;

replication
{
    // Pos:0x000
    reliable if(int(Role) < int(ROLE_Authority))
        ServerSetDriverFrame;

    // Pos:0x00D
    reliable if(int(Role) == int(ROLE_Authority))
        ClientSetDriverFrame;
}

simulated function ClientSetDriverFrame(float frame, optional float UpDownFrame)
{
    // End:0x24
    if(Driver != none)
    {
        Driver.SetDriverFrame(frame, UpDownFrame);
    }
    //return;    
}

simulated function ServerSetDriverFrame(float frame, optional float UpDownFrame)
{
    // End:0x24
    if(Driver != none)
    {
        Driver.SetDriverFrame(frame, UpDownFrame);
    }
    //return;    
}

function TurretRelativeRotation(int tPitch, int tYaw, int tRoll)
{
    local Rotator R;

    R.Pitch = tPitch;
    R.Yaw = tYaw;
    R.Roll = tRoll;
    SetRelativeRotation(R);
    //return;    
}

function TurretRotation(int tPitch, int tYaw, int tRoll)
{
    local Rotator R;

    R.Pitch = tPitch;
    R.Yaw = tYaw;
    R.Roll = tRoll;
    SetRotation(R);
    //return;    
}

function Pawn CheckForHeadShot(Vector loc, Vector ray, float AdditionalScale)
{
    local Vector X, Y, Z, newray;
    local float Angle, side;

    GetAxes(Rotation, X, Y, Z);
    // End:0xF3
    if(Driver != none)
    {
        newray = ray;
        newray.Z = 0.0000000;
        Angle = Abs(newray Dot X);
        side = newray Dot Y;
        // End:0xAC
        if(((Angle < 0.7000000) && side < float(0)) && Driver.IsHeadShot(loc, ray, AdditionalScale))
        {
            return Driver;            
        }
        else
        {
            // End:0xF3
            if(((Angle < 0.8200000) && side > float(0)) && Driver.IsHeadShot(loc, ray, AdditionalScale))
            {
                return Driver;
            }
        }
    }
    return none;
    //return;    
}

static function StaticPrecache(LevelInfo L)
{
    super.StaticPrecache(L);
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    super.UpdatePrecacheMaterials();
    //return;    
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot)
{
    //return;    
}

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetCollision(true, false, false);
    //return;    
}

simulated event PostNetBeginPlay()
{
    local Coords SwivelBoneCoords;

    // End:0x25
    if(TurretBaseClass != none)
    {
        TurretBase = Spawn(TurretBaseClass, self,, OriginalLocation, OriginalRotation);
    }
    // End:0x9B
    if(TurretSwivelClass != none)
    {
        TurretSwivel = Spawn(TurretSwivelClass, self,, OriginalLocation, OriginalRotation);
        // End:0x9B
        if(TurretSwivel != none)
        {
            SwivelBoneCoords = TurretSwivel.GetBoneCoords('bone_swivel');
            SetLocation(SwivelBoneCoords.Origin);
            TurretRotation(5461, OriginalRotation.Yaw, OriginalRotation.Roll);
        }
    }
    super.PostNetBeginPlay();
    //return;    
}

function Vehicle FindEntryVehicle(Pawn P)
{
    local Rotator EntryRotation;
    local Vector EntryLocation;

    // End:0x0D
    if(Driver != none)
    {
        return none;
    }
    // End:0x28
    if(AIController(P.Controller) != none)
    {
        return self;
    }
    // End:0x5E
    if(TurretSwivel != none)
    {
        EntryRotation = TurretSwivel.Rotation;
        EntryLocation = TurretSwivel.Location;        
    }
    else
    {
        EntryRotation = Rotation;
        EntryLocation = Location;
    }
    EntryLocation += (EntryPosition >> EntryRotation);
    // End:0xAB
    if(VSize(P.Location - EntryLocation) < EntryRadius)
    {
        return self;
    }
    return none;
    //return;    
}

simulated function AttachDriver(Pawn P)
{
    local Vector AttachPos;
    local Rotator AttachRotation;

    AttachRotation = Rotation;
    AttachRotation.Pitch = 0;
    AttachPos = Location + (DrivePos >> AttachRotation);
    P.SetLocation(AttachPos);
    P.SetRotation(AttachRotation);
    //return;    
}

function KDriverEnter(Pawn P)
{
    super(Vehicle).KDriverEnter(P);
    P.ServerSetTypeOfWeapon(5);
    //return;    
}

event bool KDriverLeave(bool bForceLeave)
{
    local bool bLeft;

    // End:0x3A
    if(Driver.Weapon != none)
    {
        Driver.ServerSetTypeOfWeapon(Driver.Weapon.WeaponType);
    }
    TurretRotation(5461, OriginalRotation.Yaw, OriginalRotation.Roll);
    AmbientSound = none;
    bLeft = super(ASVehicle).KDriverLeave(bForceLeave);
    return bLeft;
    //return;    
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    super.ClientKDriverEnter(PC);
    // End:0x52
    if(int(Role) < int(ROLE_Authority))
    {
        // End:0x3E
        if(TurretFOV < MinPlayerFOV)
        {
            TurretFOV = PC.DefaultFOV;
        }
        PC.SetFOV(TurretFOV);
    }
    //return;    
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    super(ASVehicle).ClientKDriverLeave(PC);
    // End:0x41
    if(int(Role) < int(ROLE_Authority))
    {
        TurretRotation(5461, OriginalRotation.Yaw, OriginalRotation.Roll);
        AmbientSound = none;
    }
    //return;    
}

function DriverDied()
{
    super(Vehicle).DriverDied();
    TurretRotation(5461, OriginalRotation.Yaw, OriginalRotation.Roll);
    AmbientSound = none;
    //return;    
}

simulated function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
    local int Pitch, Yaw;
    local Rotator NewRotation;
    local Vector CurrentDirection, vecX, NormOrigin, NormCurrent, CrossDirection;

    local float CurrentRadian;
    local int dFrame, dUpDownFrame;

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
    Yaw = Rotation.Yaw & 65535;
    // End:0x196
    if((float(Pitch) > (float(16384) - RotPitchConstraint.Max)) && float(Pitch) < (float(49152) + RotPitchConstraint.Min))
    {
        // End:0x15B
        if(float(Pitch) > (float(49152) - RotPitchConstraint.Min))
        {
            PitchAccel = float(Max(int(PitchAccel), 0));
            dUpDownFrame = 39;            
        }
        else
        {
            // End:0x193
            if(float(Pitch) < (float(16384) + RotPitchConstraint.Max))
            {
                PitchAccel = float(Min(int(PitchAccel), 0));
                dUpDownFrame = 1;
            }
        }        
    }
    else
    {
        // End:0x225
        if(Pitch > 49152)
        {
            dUpDownFrame = int(float(20) + (float(20) - ((float(Pitch) - (float(49152) + RotPitchConstraint.Min)) / ((float(65535) - (float(49152) + RotPitchConstraint.Min)) / float(20)))));
            // End:0x20E
            if(dUpDownFrame < 1)
            {
                dUpDownFrame = 1;                
            }
            else
            {
                // End:0x222
                if(dUpDownFrame > 39)
                {
                    dUpDownFrame = 39;
                }
            }            
        }
        else
        {
            // End:0x28D
            if(Pitch < 16384)
            {
                dUpDownFrame = int(float(20) - (float(Pitch) / ((float(16384) - RotPitchConstraint.Max) / float(20))));
                // End:0x279
                if(dUpDownFrame < 1)
                {
                    dUpDownFrame = 1;                    
                }
                else
                {
                    // End:0x28D
                    if(dUpDownFrame > 39)
                    {
                        dUpDownFrame = 39;
                    }
                }
            }
        }
    }
    vecX.X = 1.0000000;
    CurrentDirection = vecX >> Rotation;
    NormOrigin = Normal(OriginalDirection);
    NormCurrent = Normal(CurrentDirection);
    CurrentRadian = NormOrigin Dot NormCurrent;
    CurrentRadian = Acos(CurrentRadian);
    CurrentRadian = (CurrentRadian * float(180)) / 3.1415920;
    CrossDirection = NormOrigin Cross NormCurrent;
    // End:0x371
    if(CurrentRadian >= RotYawConstraint)
    {
        // End:0x355
        if(CrossDirection.Z < float(0))
        {
            YawAccel = float(Max(int(YawAccel), 0));
            dFrame = 59;            
        }
        else
        {
            YawAccel = float(Min(int(YawAccel), 0));
            dFrame = 1;
        }        
    }
    else
    {
        // End:0x415
        if(CurrentRadian < RotYawConstraint)
        {
            // End:0x3D5
            if(CrossDirection.Z < float(0))
            {
                dFrame = int(CurrentRadian / float(2)) + 30;
                // End:0x3BE
                if(dFrame < 1)
                {
                    dFrame = 1;                    
                }
                else
                {
                    // End:0x3D2
                    if(dFrame > 59)
                    {
                        dFrame = 59;
                    }
                }                
            }
            else
            {
                dFrame = int(float(60) - CurrentRadian) / 2;
                // End:0x401
                if(dFrame < 1)
                {
                    dFrame = 1;                    
                }
                else
                {
                    // End:0x415
                    if(dFrame > 59)
                    {
                        dFrame = 59;
                    }
                }
            }
        }
    }
    NewRotation = Rotation;
    NewRotation.Yaw += int(YawAccel);
    NewRotation.Pitch += int(PitchAccel);
    SetRotation(NewRotation);
    // End:0x475
    if(int(Role) == int(ROLE_Authority))
    {
        ClientSetDriverFrame(float(dFrame), float(dUpDownFrame));        
    }
    else
    {
        // End:0x499
        if(int(Role) < int(ROLE_Authority))
        {
            ServerSetDriverFrame(float(dFrame), float(dUpDownFrame));
        }
    }
    // End:0x51E
    if(IsLocallyControlled())
    {
        // End:0x4D7
        if((TurretBase != none) && int(TurretBase.DrawType) == int(2))
        {
            TurretBase.UpdateOverlay();
        }
        // End:0x51E
        if(TurretSwivel != none)
        {
            // End:0x50A
            if(int(TurretSwivel.DrawType) == int(2))
            {
                TurretSwivel.UpdateOverlay();
            }
            TurretSwivel.UpdateSwivelRotation(NewRotation);
        }
    }
    //return;    
}

function SetEntryViewRotation(Rotator R)
{
    local Vector vecX, CurrentDirection, NormOrigin, NormCurrent, CrossDirection;

    local float Degree;

    R.Pitch = 0;
    R.Roll = 0;
    vecX.X = 1.0000000;
    CurrentDirection = vecX >> R;
    NormOrigin = Normal(OriginalDirection);
    NormCurrent = Normal(CurrentDirection);
    Degree = Acos(NormOrigin Dot NormCurrent);
    Degree = (Degree * float(180)) / 3.1415920;
    // End:0xF3
    if(Degree > RotYawConstraint)
    {
        CrossDirection = NormOrigin Cross NormCurrent;
        // End:0xD7
        if(CrossDirection.Z > float(0))
        {
            R.Yaw = OriginalRotation.Yaw + 10920;            
        }
        else
        {
            R.Yaw = OriginalRotation.Yaw - 10920;
        }
    }
    SetRotation(R);
    //return;    
}

function SetExitViewRotation(Pawn Driver)
{
    Driver.Controller.SetRotation(OriginalRotation);
    //return;    
}

defaultproperties
{
    RotYawConstraint=60.0000000
    TurretBaseClass=Class'UT2k4Assault_Decompressed.ASTurret_MG240w_Base'
    TurretFOV=55.0000000
    TurretSwivelClass=Class'UT2k4Assault_Decompressed.ASTurret_MG240w_Swivel'
    RotationInertia=0.5000000
    RotPitchConstraint=(Min=11000.0000000,Max=13000.0000000)
    RotationSpeed=15.0000000
    CamAbsLocation=(X=0.0000000,Y=0.0000000,Z=50.0000000)
    CamRelLocation=(X=100.0000000,Y=0.0000000,Z=50.0000000)
    CamDistance=(X=-400.0000000,Y=0.0000000,Z=50.0000000)
    CamRotationInertia=0.0100000
    DefaultWeaponClassName="UT2k4Assault.Weapon_Turret_MG240w"
    VehicleProjSpawnOffset=(X=160.0000000,Y=-15.0000000,Z=66.0000000)
    bCHZeroYOffset=false
    bDrawDriverInTP=true
    bAutoTurret=false
    bRemoteControlled=false
    bDrawMeshInFP=true
    DrivePos=(X=-120.0000000,Y=0.0000000,Z=0.0000000)
    ExitPositions=/* Array type was not detected. */
    EntryPosition=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
    EntryRadius=80.0000000
    FPCamPos=(X=-80.0000000,Y=0.0000000,Z=20.0000000)
    VehiclePositionString="manning a MG240 Turret"
    VehicleNameString="MG240 Turret"
    HealthMax=100.0000000
    Health=100
    DrawScale=1.0000000
    SoundRadius=1024.0000000
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
}