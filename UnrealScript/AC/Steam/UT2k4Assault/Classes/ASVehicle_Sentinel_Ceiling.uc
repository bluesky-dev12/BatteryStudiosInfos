/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASVehicle_Sentinel_Ceiling.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class ASVehicle_Sentinel_Ceiling extends ASVehicle_Sentinel;

static function StaticPrecache(LevelInfo L)
{
    super(ASTurret).StaticPrecache(L);
}

simulated function UpdatePrecacheMaterials()
{
    super(ASTurret).UpdatePrecacheMaterials();
}

defaultproperties
{
    TurretSwivelClass=class'ASVehicle_Sentinel_Ceiling_Swivel'
    VehicleProjSpawnOffset=(X=95.0,Y=0.0,Z=0.0)
    VehicleNameString="?? ???"
    DrawScale=0.50
    AmbientGlow=48
    CollisionRadius=0.0
    CollisionHeight=0.0
}