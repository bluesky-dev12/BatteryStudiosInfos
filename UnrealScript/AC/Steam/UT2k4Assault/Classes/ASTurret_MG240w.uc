/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASTurret_MG240w.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:20
 *
 *******************************************************************************/
class ASTurret_MG240w extends ASTurret;

var float RotYawConstraint;

replication
{
    // Pos:0x00
    reliable if(Role < 4)
        ServerSetDriverFrame;

    // Pos:0x0d
    reliable if(Role == 4)
        ClientSetDriverFrame;

}

simulated function ClientSetDriverFrame(float frame, optional float UpDownFrame)
{
    // End:0x24
    if(Driver != none)
    {
        Driver.SetDriverFrame(frame, UpDownFrame);
    }
}

simulated function ServerSetDriverFrame(float frame, optional float UpDownFrame)
{
    // End:0x24
    if(Driver != none)
    {
        Driver.SetDriverFrame(frame, UpDownFrame);
    }
}

function TurretRelativeRotation(int tPitch, int tYaw, int tRoll)
{
    local Rotator R;

    R.Pitch = tPitch;
    R.Yaw = tYaw;
    R.Roll = tRoll;
    SetRelativeRotation(R);
}

function TurretRotation(int tPitch, int tYaw, int tRoll)
{
    local Rotator R;

    R.Pitch = tPitch;
    R.Yaw = tYaw;
    R.Roll = tRoll;
    SetRotation(R);
}

function Pawn CheckForHeadShot(Vector loc, Vector ray, float AdditionalScale)
{
    local Vector X, Y, Z, newray;
    local float Angle, side;

    GetAxes(Rotation, X, Y, Z);
    // End:0xf3
    if(Driver != none)
    {
        newray = ray;
        newray.Z = 0.0;
        Angle = Abs(newray Dot X);
        side = newray Dot Y;
        // End:0xac
        if(Angle < 0.70 && side < float(0) && Driver.IsHeadShot(loc, ray, AdditionalScale))
        {
            return Driver;
        }
        // End:0xf3
        else
        {
            // End:0xf3
            if(Angle < 0.820 && side > float(0) && Driver.IsHeadShot(loc, ray, AdditionalScale))
            {
                return Driver;
            }
        }
    }
    return none;
}

static function StaticPrecache(LevelInfo L)
{
    super.StaticPrecache(L);
}

simulated function UpdatePrecacheMaterials()
{
    super.UpdatePrecacheMaterials();
}

function TakeDamage(int Damage, Pawn instigatedBy, Vector HitLocation, Vector Momentum, class<DamageType> DamageType, optional int CollisionPart, optional int WeaponType, optional bool bWallShot);
simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetCollision(true, false, false);
}

simulated event PostNetBeginPlay()
{
    local Coords SwivelBoneCoords;

    // End:0x25
    if(TurretBaseClass != none)
    {
        TurretBase = Spawn(TurretBaseClass, self,, OriginalLocation, OriginalRotation);
    }
    // End:0x9b
    if(TurretSwivelClass != none)
    {
        TurretSwivel = Spawn(TurretSwivelClass, self,, OriginalLocation, OriginalRotation);
        // End:0x9b
        if(TurretSwivel != none)
        {
            SwivelBoneCoords = TurretSwivel.GetBoneCoords('bone_swivel');
            SetLocation(SwivelBoneCoords.Origin);
            TurretRotation(5461, OriginalRotation.Yaw, OriginalRotation.Roll);
        }
    }
    super.PostNetBeginPlay();
}

function Vehicle FindEntryVehicle(Pawn P)
{
    local Rotator EntryRotation;
    local Vector EntryLocation;

    // End:0x0d
    if(Driver != none)
    {
        return none;
    }
    // End:0x28
    if(AIController(P.Controller) != none)
    {
        return self;
    }
    // End:0x5e
    if(TurretSwivel != none)
    {
        EntryRotation = TurretSwivel.Rotation;
        EntryLocation = TurretSwivel.Location;
    }
    // End:0x74
    else
    {
        EntryRotation = Rotation;
        EntryLocation = Location;
    }
    EntryLocation += EntryPosition >> EntryRotation;
    // End:0xab
    if(VSize(P.Location - EntryLocation) < EntryRadius)
    {
        return self;
    }
    return none;
}

simulated function AttachDriver(Pawn P)
{
    local Vector AttachPos;
    local Rotator AttachRotation;

    AttachRotation = Rotation;
    AttachRotation.Pitch = 0;
    AttachPos = Location + DrivePos >> AttachRotation;
    P.SetLocation(AttachPos);
    P.SetRotation(AttachRotation);
}

function KDriverEnter(Pawn P)
{
    super(Vehicle).KDriverEnter(P);
    P.ServerSetTypeOfWeapon(5);
}

event bool KDriverLeave(bool bForceLeave)
{
    local bool bLeft;

    // End:0x3a
    if(Driver.Weapon != none)
    {
        Driver.ServerSetTypeOfWeapon(Driver.Weapon.WeaponType);
    }
    TurretRotation(5461, OriginalRotation.Yaw, OriginalRotation.Roll);
    AmbientSound = none;
    bLeft = super(ASVehicle).KDriverLeave(bForceLeave);
    return bLeft;
}

simulated function ClientKDriverEnter(PlayerController PC)
{
    super.ClientKDriverEnter(PC);
    // End:0x52
    if(Role < 4)
    {
        // End:0x3e
        if(TurretFOV < MinPlayerFOV)
        {
            TurretFOV = PC.DefaultFOV;
        }
        PC.SetFOV(TurretFOV);
    }
}

simulated function ClientKDriverLeave(PlayerController PC)
{
    super(ASVehicle).ClientKDriverLeave(PC);
    // End:0x41
    if(Role < 4)
    {
        TurretRotation(5461, OriginalRotation.Yaw, OriginalRotation.Roll);
        AmbientSound = none;
    }
}

function DriverDied()
{
    super(Vehicle).DriverDied();
    TurretRotation(5461, OriginalRotation.Yaw, OriginalRotation.Roll);
    AmbientSound = none;
}

simulated function UpdateRocketAcceleration(float DeltaTime, float YawChange, float PitchChange)
{
    local int Pitch, Yaw;
    local Rotator NewRotation;
    local Vector CurrentDirection, vecX, NormOrigin, NormCurrent, CrossDirection;

    local float CurrentRadian;
    local int dFrame, dUpDownFrame;

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
    Yaw = Rotation.Yaw & 65535;
    // End:0x196
    if(float(Pitch) > float(16384) - RotPitchConstraint.Max && float(Pitch) < float(49152) + RotPitchConstraint.Min)
    {
        // End:0x15b
        if(float(Pitch) > float(49152) - RotPitchConstraint.Min)
        {
            PitchAccel = float(Max(int(PitchAccel), 0));
            dUpDownFrame = 39;
        }
        // End:0x193
        else
        {
            // End:0x193
            if(float(Pitch) < float(16384) + RotPitchConstraint.Max)
            {
                PitchAccel = float(Min(int(PitchAccel), 0));
                dUpDownFrame = 1;
            }
        }
    }
    // End:0x28d
    else
    {
        // End:0x225
        if(Pitch > 49152)
        {
            dUpDownFrame = int(float(20) + float(20) - float(Pitch) - float(49152) + RotPitchConstraint.Min / float(65535) - float(49152) + RotPitchConstraint.Min / float(20));
            // End:0x20e
            if(dUpDownFrame < 1)
            {
                dUpDownFrame = 1;
            }
            // End:0x222
            else
            {
                // End:0x222
                if(dUpDownFrame > 39)
                {
                    dUpDownFrame = 39;
                }
            }
        }
        // End:0x28d
        else
        {
            // End:0x28d
            if(Pitch < 16384)
            {
                dUpDownFrame = int(float(20) - float(Pitch) / float(16384) - RotPitchConstraint.Max / float(20));
                // End:0x279
                if(dUpDownFrame < 1)
                {
                    dUpDownFrame = 1;
                }
                // End:0x28d
                else
                {
                    // End:0x28d
                    if(dUpDownFrame > 39)
                    {
                        dUpDownFrame = 39;
                    }
                }
            }
        }
    }
    vecX.X = 1.0;
    CurrentDirection = vecX >> Rotation;
    NormOrigin = Normal(OriginalDirection);
    NormCurrent = Normal(CurrentDirection);
    CurrentRadian = NormOrigin Dot NormCurrent;
    CurrentRadian = Acos(CurrentRadian);
    CurrentRadian = CurrentRadian * float(180) / 3.1415920;
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
        // End:0x36e
        else
        {
            YawAccel = float(Min(int(YawAccel), 0));
            dFrame = 1;
        }
    }
    // End:0x415
    else
    {
        // End:0x415
        if(CurrentRadian < RotYawConstraint)
        {
            // End:0x3d5
            if(CrossDirection.Z < float(0))
            {
                dFrame = int(CurrentRadian / float(2)) + 30;
                // End:0x3be
                if(dFrame < 1)
                {
                    dFrame = 1;
                }
                // End:0x3d2
                else
                {
                    // End:0x3d2
                    if(dFrame > 59)
                    {
                        dFrame = 59;
                    }
                }
            }
            // End:0x415
            else
            {
                dFrame = int(float(60) - CurrentRadian) / 2;
                // End:0x401
                if(dFrame < 1)
                {
                    dFrame = 1;
                }
                // End:0x415
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
    if(Role == 4)
    {
        ClientSetDriverFrame(float(dFrame), float(dUpDownFrame));
    }
    // End:0x499
    else
    {
        // End:0x499
        if(Role < 4)
        {
            ServerSetDriverFrame(float(dFrame), float(dUpDownFrame));
        }
    }
    // End:0x51e
    if(IsLocallyControlled())
    {
        // End:0x4d7
        if(TurretBase != none && TurretBase.DrawType == 2)
        {
            TurretBase.UpdateOverlay();
        }
        // End:0x51e
        if(TurretSwivel != none)
        {
            // End:0x50a
            if(TurretSwivel.DrawType == 2)
            {
                TurretSwivel.UpdateOverlay();
            }
            TurretSwivel.UpdateSwivelRotation(NewRotation);
        }
    }
}

function SetEntryViewRotation(Rotator R)
{
    local Vector vecX, CurrentDirection, NormOrigin, NormCurrent, CrossDirection;

    local float Degree;

    R.Pitch = 0;
    R.Roll = 0;
    vecX.X = 1.0;
    CurrentDirection = vecX >> R;
    NormOrigin = Normal(OriginalDirection);
    NormCurrent = Normal(CurrentDirection);
    Degree = Acos(NormOrigin Dot NormCurrent);
    Degree = Degree * float(180) / 3.1415920;
    // End:0xf3
    if(Degree > RotYawConstraint)
    {
        CrossDirection = NormOrigin Cross NormCurrent;
        // End:0xd7
        if(CrossDirection.Z > float(0))
        {
            R.Yaw = OriginalRotation.Yaw + 10920;
        }
        // End:0xf3
        else
        {
            R.Yaw = OriginalRotation.Yaw - 10920;
        }
    }
    SetRotation(R);
}

function SetExitViewRotation(Pawn Driver)
{
    Driver.Controller.SetRotation(OriginalRotation);
}

defaultproperties
{
    RotYawConstraint=60.0
    TurretBaseClass=class'ASTurret_MG240w_Base'
    TurretFOV=55.0
    TurretSwivelClass=class'ASTurret_MG240w_Swivel'
    RotationInertia=0.50
    RotPitchConstraint=(Min=11000.0,Max=13000.0)
    RotationSpeed=15.0
    CamAbsLocation=(X=0.0,Y=0.0,Z=50.0)
    CamRelLocation=(X=100.0,Y=0.0,Z=50.0)
    CamDistance=(X=-400.0,Y=0.0,Z=50.0)
    CamRotationInertia=0.010
    DefaultWeaponClassName="UT2k4Assault.Weapon_Turret_MG240w"
    VehicleProjSpawnOffset=(X=160.0,Y=-15.0,Z=66.0)
    bCHZeroYOffset=true
    bDrawDriverInTP=true
    bAutoTurret=true
    bRemoteControlled=true
    bDrawMeshInFP=true
    DrivePos=(X=-120.0,Y=0.0,Z=0.0)
    ExitPositions=// Object reference not set to an instance of an object.
    
    EntryPosition=(X=-100.0,Y=0.0,Z=0.0)
    EntryRadius=80.0
    FPCamPos=(X=-80.0,Y=0.0,Z=20.0)
    VehiclePositionString="manning a MG240 Turret"
    VehicleNameString="MG240 Turret"
    HealthMax=100.0
    Health=100
    DrawScale=1.0
    SoundRadius=1024.0
    CollisionRadius=0.0
    CollisionHeight=0.0
}