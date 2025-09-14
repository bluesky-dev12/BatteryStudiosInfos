/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBTR_Turret_FNM240.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class wBTR_Turret_FNM240 extends wBTR_ArrangeTurret;

var() name ObjectiveTag[6];

function VehicleSpawned()
{
    super.VehicleSpawned();
}

defaultproperties
{
    bSpawnBuildEffect=true
    VehicleClass=class'wTurret_FNM240'
    DrawType=2
    Mesh=SkeletalMesh'WP_HW_FNM249.FNM249'
    DrawScale=0.420
    AmbientGlow=96
    CollisionRadius=60.0
    CollisionHeight=39.0
    bEdShouldSnap=true
}