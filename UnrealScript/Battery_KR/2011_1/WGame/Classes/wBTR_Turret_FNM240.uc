class wBTR_Turret_FNM240 extends wBTR_ArrangeTurret;

var() name ObjectiveTag[6];

function VehicleSpawned()
{
    super.VehicleSpawned();
    //return;    
}

defaultproperties
{
    bSpawnBuildEffect=false
    VehicleClass=Class'WGame_Decompressed.wTurret_FNM240'
    DrawType=2
    Mesh=SkeletalMesh'WP_HW_FNM249.FNM249'
    DrawScale=0.4200000
    AmbientGlow=96
    CollisionRadius=60.0000000
    CollisionHeight=39.0000000
    bEdShouldSnap=true
}