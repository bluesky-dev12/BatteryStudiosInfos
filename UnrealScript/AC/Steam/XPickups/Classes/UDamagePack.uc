/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XPickups\Classes\UDamagePack.uc
 * Package Imports:
 *	XPickups
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *	States:1
 *
 *******************************************************************************/
class UDamagePack extends TournamentPickUp;

static function StaticPrecache(LevelInfo L);
simulated function UpdatePrecacheMaterials()
{
    super(Actor).UpdatePrecacheMaterials();
}

simulated function UpdatePrecacheStaticMeshes()
{
    super(Actor).UpdatePrecacheStaticMeshes();
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;

        // End:0x43
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            P.EnableUDamage(30.0);
            AnnouncePickup(P);
            SetRespawn();
        }
    }

}

defaultproperties
{
    MaxDesireability=2.0
    bPredictRespawns=true
    RespawnTime=90.0
    PickupMessage="?? ???!"
    PickupForce="UDamagePickup"
    DrawType=8
    Physics=5
    DrawScale=0.90
    AmbientGlow=254
    ScaleGlow=0.60
    Style=9
    CollisionRadius=32.0
    CollisionHeight=23.0
    Mass=10.0
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
}