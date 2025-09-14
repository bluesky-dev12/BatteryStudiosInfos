class ASVehicle_Sentinel_Floor extends ASVehicle_Sentinel;

static function StaticPrecache(LevelInfo L)
{
    super(ASTurret).StaticPrecache(L);
    //return;    
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
    //return;    
}

simulated function UpdatePrecacheMaterials()
{
    super(ASTurret).UpdatePrecacheMaterials();
    //return;    
}

defaultproperties
{
    TurretBaseClass=Class'UT2k4Assault_Decompressed.ASVehicle_Sentinel_Floor_Base'
    TurretSwivelClass=Class'UT2k4Assault_Decompressed.ASVehicle_Sentinel_Floor_Swivel'
    VehicleProjSpawnOffset=(X=65.0000000,Y=0.0000000,Z=0.0000000)
    VehicleNameString="??? ???"
    bCanBeBaseForPawns=false
    DrawScale=0.5000000
    AmbientGlow=48
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
}