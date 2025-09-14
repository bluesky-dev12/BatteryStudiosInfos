/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASTurret_MG240w_Swivel.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class ASTurret_MG240w_Swivel extends ASTurret_Base
    notplaceable;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetCollision(false, false, false);
}

simulated function UpdateSwivelRotation(Rotator TurretRotation);

defaultproperties
{
    Physics=5
    DrawScale=1.0
    bMovable=true
}