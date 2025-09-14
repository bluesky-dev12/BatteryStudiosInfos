/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XPickups\Classes\AdrenalinePickup.uc
 * Package Imports:
 *	XPickups
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *	States:1
 *
 *******************************************************************************/
class AdrenalinePickup extends TournamentPickUp;

var float AdrenalineAmount;

function float DetourWeight(Pawn Other, float PathWeight)
{
    // End:0x36
    if(PathWeight > float(500) || !Other.Controller.NeedsAdrenaline())
    {
        return 0.0;
    }
    // End:0x8a
    if(Other.Controller.Enemy != none && Level.TimeSeconds - Other.Controller.LastSeenTime < float(1))
    {
        return 0.0;
    }
    return 0.150 / PathWeight;
}

event float BotDesireability(Pawn Bot)
{
    // End:0x21
    if(Bot.Controller.bHuntPlayer)
    {
        return 0.0;
    }
    // End:0x44
    if(!Bot.Controller.NeedsAdrenaline())
    {
        return 0.0;
    }
    return MaxDesireability;
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;

        // End:0x4c
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            P.Controller.AwardAdrenaline(AdrenalineAmount);
            AnnouncePickup(P);
            SetRespawn();
        }
    }

}

defaultproperties
{
    AdrenalineAmount=2.0
    MaxDesireability=0.30
    RespawnTime=30.0
    PickupMessage="?????? ???????"
    PickupForce="AdrenelinPickup"
    DrawType=8
    CullDistance=5500.0
    Physics=5
    DrawScale=0.070
    AmbientGlow=128
    ScaleGlow=0.60
    Style=9
    CollisionRadius=32.0
    CollisionHeight=23.0
    Mass=10.0
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
}