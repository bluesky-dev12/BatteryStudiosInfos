/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASVehicle_Sentinel_Floor.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class ASVehicle_Sentinel_Floor extends ASVehicle_Sentinel;

static function StaticPrecache(LevelInfo L)
{
    super(ASTurret).StaticPrecache(L);
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
}

simulated function UpdatePrecacheMaterials()
{
    super(ASTurret).UpdatePrecacheMaterials();
}

defaultproperties
{
    TurretBaseClass=class'ASVehicle_Sentinel_Floor_Base'
    TurretSwivelClass=class'ASVehicle_Sentinel_Floor_Swivel'
    VehicleProjSpawnOffset=(X=65.0,Y=0.0,Z=0.0)
    VehicleNameString="??? ???"
    bCanBeBaseForPawns=true
    DrawScale=0.50
    AmbientGlow=48
    CollisionRadius=0.0
    CollisionHeight=0.0
}