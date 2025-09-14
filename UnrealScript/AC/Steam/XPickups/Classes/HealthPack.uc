/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XPickups\Classes\HealthPack.uc
 * Package Imports:
 *	XPickups
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class HealthPack extends TournamentHealth;

defaultproperties
{
    HealingAmount=25
    PickupForce="HealthPack"
    DrawType=8
    CullDistance=6500.0
    Physics=5
    DrawScale=0.30
    ScaleGlow=0.60
    Style=9
    TransientSoundVolume=0.350
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
}