/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASVehicleFactory_SentinelCeiling.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class ASVehicleFactory_SentinelCeiling extends ASVehicleFactory;

var() bool bSpawnCampProtection;

function VehicleSpawned()
{
    super.VehicleSpawned();
    ASVehicle_Sentinel(Child).bSpawnCampProtection = bSpawnCampProtection;
}

defaultproperties
{
    bSpawnCampProtection=true
    bSpawnBuildEffect=true
    VehicleLinkHealMult=0.150
    VehicleClass=class'ASVehicle_Sentinel_Ceiling'
    DrawType=8
    DrawScale=0.50
    PrePivot=(X=0.0,Y=0.0,Z=-160.0)
    AmbientGlow=48
    CollisionRadius=0.0
    CollisionHeight=0.0
    bEdShouldSnap=true
}