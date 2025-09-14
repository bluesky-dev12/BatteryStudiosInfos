/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XPickups\Classes\ShieldPack.uc
 * Package Imports:
 *	XPickups
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class ShieldPack extends ShieldPickup;

static function StaticPrecache(LevelInfo L);

defaultproperties
{
    ShieldAmount=50
    bPredictRespawns=true
    PickupForce="ShieldPack"
    DrawType=8
    Physics=5
    ScaleGlow=0.60
    Style=9
    CollisionRadius=32.0
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
}