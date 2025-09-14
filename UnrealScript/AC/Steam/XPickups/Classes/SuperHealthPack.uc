/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XPickups\Classes\SuperHealthPack.uc
 * Package Imports:
 *	XPickups
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SuperHealthPack extends TournamentHealth;

static function StaticPrecache(LevelInfo L);

defaultproperties
{
    HealingAmount=100
    bSuperHeal=true
    MaxDesireability=2.0
    bAmbientGlow=true
    bPredictRespawns=true
    RespawnTime=60.0
    PickupMessage="?? ??? ???????"
    PickupForce="LargeHealthPickup"
    DrawType=8
    Physics=5
    DrawScale=0.40
    AmbientGlow=64
    ScaleGlow=0.60
    Style=9
    bUnlit=true
    CollisionRadius=42.0
    RotationRate=(Pitch=0,Yaw=2000,Roll=0)
}