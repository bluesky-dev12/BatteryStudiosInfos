/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XPickups\Classes\SuperShieldPack.uc
 * Package Imports:
 *	XPickups
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SuperShieldPack extends ShieldPickup;

static function StaticPrecache(LevelInfo L);

defaultproperties
{
    ShieldAmount=100
    RespawnTime=60.0
    PickupMessage="?? ?? ?? ???????"
    PickupForce="LargeShieldPickup"
    DrawType=8
    Physics=5
    DrawScale=0.60
    ScaleGlow=0.60
    Style=9
    CollisionRadius=32.0
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
}