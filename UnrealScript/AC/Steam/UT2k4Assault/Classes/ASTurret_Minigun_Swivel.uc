/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\ASTurret_Minigun_Swivel.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class ASTurret_Minigun_Swivel extends ASTurret_Base
    notplaceable;

simulated function UpdateSwivelRotation(Rotator TurretRotation)
{
    local Rotator SwivelRotation;

    SwivelRotation = TurretRotation;
    SwivelRotation.Pitch = 0;
    SetRotation(SwivelRotation);
}

defaultproperties
{
    Physics=5
    DrawScale=0.420
    bMovable=true
}