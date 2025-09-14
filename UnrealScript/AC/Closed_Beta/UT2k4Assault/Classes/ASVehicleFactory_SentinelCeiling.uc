class ASVehicleFactory_SentinelCeiling extends ASVehicleFactory;

var() bool bSpawnCampProtection;

function VehicleSpawned()
{
    super.VehicleSpawned();
    ASVehicle_Sentinel(Child).bSpawnCampProtection = bSpawnCampProtection;
    //return;    
}

defaultproperties
{
    bSpawnCampProtection=true
    bSpawnBuildEffect=false
    VehicleLinkHealMult=0.1500000
    VehicleClass=Class'UT2k4Assault_Decompressed.ASVehicle_Sentinel_Ceiling'
    DrawType=8
    DrawScale=0.5000000
    PrePivot=(X=0.0000000,Y=0.0000000,Z=-160.0000000)
    AmbientGlow=48
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
    bEdShouldSnap=true
}