/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XPickups\Classes\MiniHealthPack.uc
 * Package Imports:
 *	XPickups
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class MiniHealthPack extends TournamentHealth;

defaultproperties
{
    HealingAmount=5
    bSuperHeal=true
    MaxDesireability=0.30
    PickupMessage="?? ??? ???????"
    PickupForce="HealthPack"
    DrawType=8
    CullDistance=4500.0
    Physics=5
    DrawScale=0.060
    ScaleGlow=0.60
    Style=9
    CollisionRadius=24.0
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
}