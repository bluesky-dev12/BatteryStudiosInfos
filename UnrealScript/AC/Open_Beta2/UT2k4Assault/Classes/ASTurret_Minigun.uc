class ASTurret_Minigun extends ASTurret;

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

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    super.UpdatePrecacheMaterials();
    //return;    
}

defaultproperties
{
    TurretBaseClass=Class'UT2k4Assault_Decompressed.ASTurret_Minigun_Base'
    TurretSwivelClass=Class'UT2k4Assault_Decompressed.ASTurret_Minigun_Swivel'
    RotationInertia=0.5000000
    RotPitchConstraint=(Min=10000.0000000,Max=5000.0000000)
    RotationSpeed=10.0000000
    CamAbsLocation=(X=0.0000000,Y=0.0000000,Z=50.0000000)
    CamRelLocation=(X=100.0000000,Y=0.0000000,Z=50.0000000)
    CamDistance=(X=-400.0000000,Y=0.0000000,Z=50.0000000)
    CamRotationInertia=0.0100000
    DefaultWeaponClassName="UT2k4Assault.Weapon_Turret_Minigun"
    VehicleProjSpawnOffset=(X=160.0000000,Y=-15.0000000,Z=66.0000000)
    bCHZeroYOffset=false
    bDrawDriverInTP=true
    bAutoTurret=false
    bRemoteControlled=false
    bDrawMeshInFP=true
    DrivePos=(X=-20.0000000,Y=13.0000000,Z=81.0000000)
    ExitPositions=/* Array type was not detected. */
    EntryRadius=120.0000000
    FPCamPos=(X=-25.0000000,Y=13.0000000,Z=93.0000000)
    DriverDamageMult=0.4500000
    VehiclePositionString="??? ?? ??"
    VehicleNameString="??? ??"
    HealthMax=500.0000000
    Health=500
    DrawScale=0.4200000
    SoundRadius=1024.0000000
    CollisionRadius=60.0000000
}