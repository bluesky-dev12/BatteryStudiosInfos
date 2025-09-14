class ASVehicle_Sentinel_Ceiling extends ASVehicle_Sentinel;

static function StaticPrecache(LevelInfo L)
{
    super(ASTurret).StaticPrecache(L);
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    super(ASTurret).UpdatePrecacheMaterials();
    //return;    
}

defaultproperties
{
    TurretSwivelClass=Class'UT2k4Assault_Decompressed.ASVehicle_Sentinel_Ceiling_Swivel'
    VehicleProjSpawnOffset=(X=95.0000000,Y=0.0000000,Z=0.0000000)
    VehicleNameString="?? ???"
    DrawScale=0.5000000
    AmbientGlow=48
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
}