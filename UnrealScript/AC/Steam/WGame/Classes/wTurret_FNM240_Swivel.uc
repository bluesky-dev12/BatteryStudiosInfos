/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wTurret_FNM240_Swivel.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wTurret_FNM240_Swivel extends wTurret_Base
    notplaceable;

simulated function UpdateSwivelRotation(Rotator TurretRotation);

defaultproperties
{
    StaticMesh=StaticMesh'WPS_HW.FNM249_Bipod'
    Physics=5
    bMovable=true
    CollisionRadius=40.0
    CollisionHeight=40.0
}