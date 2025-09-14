class AdrenalinePickup extends TournamentPickUp;

var float AdrenalineAmount;

function float DetourWeight(Pawn Other, float PathWeight)
{
    // End:0x36
    if((PathWeight > float(500)) || !Other.Controller.NeedsAdrenaline())
    {
        return 0.0000000;
    }
    // End:0x8A
    if((Other.Controller.Enemy != none) && (Level.TimeSeconds - Other.Controller.LastSeenTime) < float(1))
    {
        return 0.0000000;
    }
    return 0.1500000 / PathWeight;
    //return;    
}

event float BotDesireability(Pawn Bot)
{
    // End:0x21
    if(Bot.Controller.bHuntPlayer)
    {
        return 0.0000000;
    }
    // End:0x44
    if(!Bot.Controller.NeedsAdrenaline())
    {
        return 0.0000000;
    }
    return MaxDesireability;
    //return;    
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;

        // End:0x4C
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            P.Controller.AwardAdrenaline(AdrenalineAmount);
            AnnouncePickup(P);
            SetRespawn();
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    AdrenalineAmount=2.0000000
    MaxDesireability=0.3000000
    RespawnTime=30.0000000
    PickupMessage="?????? ???????"
    PickupForce="AdrenelinPickup"
    DrawType=8
    CullDistance=5500.0000000
    Physics=5
    DrawScale=0.0700000
    AmbientGlow=128
    ScaleGlow=0.6000000
    Style=9
    CollisionRadius=32.0000000
    CollisionHeight=23.0000000
    Mass=10.0000000
    RotationRate=(Pitch=0,Yaw=24000,Roll=0)
}