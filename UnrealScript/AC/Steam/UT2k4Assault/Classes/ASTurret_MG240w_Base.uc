/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASTurret_MG240w_Base.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class ASTurret_MG240w_Base extends ASTurret_Base
    notplaceable;

simulated event PostBeginPlay()
{
    super.PostBeginPlay();
    SetCollision(false, false, false);
}

defaultproperties
{
    DrawScale=1.0
}