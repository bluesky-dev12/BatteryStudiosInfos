/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASTurret_Minigun.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:4
 *
 *******************************************************************************/
class ASTurret_Minigun extends ASTurret;

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

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
}

simulated function UpdatePrecacheMaterials()
{
    super.UpdatePrecacheMaterials();
}

defaultproperties
{
    TurretBaseClass=class'ASTurret_Minigun_Base'
    TurretSwivelClass=class'ASTurret_Minigun_Swivel'
    RotationInertia=0.50
    RotPitchConstraint=(Min=10000.0,Max=5000.0)
    RotationSpeed=10.0
    CamAbsLocation=(X=0.0,Y=0.0,Z=50.0)
    CamRelLocation=(X=100.0,Y=0.0,Z=50.0)
    CamDistance=(X=-400.0,Y=0.0,Z=50.0)
    CamRotationInertia=0.010
    DefaultWeaponClassName="UT2k4Assault.Weapon_Turret_Minigun"
    VehicleProjSpawnOffset=(X=160.0,Y=-15.0,Z=66.0)
    bCHZeroYOffset=true
    bDrawDriverInTP=true
    bAutoTurret=true
    bRemoteControlled=true
    bDrawMeshInFP=true
    DrivePos=(X=-20.0,Y=13.0,Z=81.0)
    ExitPositions=// Object reference not set to an instance of an object.
    
    EntryRadius=120.0
    FPCamPos=(X=-25.0,Y=13.0,Z=93.0)
    DriverDamageMult=0.450
    VehiclePositionString="??? ?? ??"
    VehicleNameString="??? ??"
    HealthMax=500.0
    Health=500
    DrawScale=0.420
    SoundRadius=1024.0
    CollisionRadius=60.0
}