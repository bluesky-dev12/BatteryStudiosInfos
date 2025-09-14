/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wTurret_FNM240_Base.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wTurret_FNM240_Base extends wTurret_Base
    notplaceable;

simulated function UpdateBaseRotation(Rotator TurretRotation)
{
    SetRotation(TurretRotation);
}

defaultproperties
{
    DrawType=2
    Physics=5
    Mesh=SkeletalMesh'WP_HW_FNM249.FNM249'
    bMovable=true
    CollisionRadius=0.0
    CollisionHeight=0.0
}