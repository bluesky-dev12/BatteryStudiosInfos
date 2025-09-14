class ShieldPickup extends TournamentPickUp
    abstract;

var() int ShieldAmount;

function float DetourWeight(Pawn Other, float PathWeight)
{
    local float Need;

    Need = float(Other.CanUseShield(ShieldAmount));
    // End:0x2F
    if(Need <= float(0))
    {
        return 0.0000000;
    }
    // End:0x8C
    if(AIController(Other.Controller).PriorityObjective() && Need < (0.4000000 * Other.GetShieldStrengthMax()))
    {
        return ((0.0050000 * MaxDesireability) * Need) / PathWeight;
    }
    return ((0.0130000 * MaxDesireability) * Need) / PathWeight;
    //return;    
}

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    H.LastArmorPickupTime = H.LastPickupTime;
    //return;    
}

event float BotDesireability(Pawn Bot)
{
    return (0.0130000 * MaxDesireability) * float(Bot.CanUseShield(ShieldAmount));
    //return;    
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return default.PickupMessage $ string(default.ShieldAmount);
    //return;    
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;

        // End:0x65
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            // End:0x65
            if(P.AddShieldStrength(ShieldAmount) || !Level.Game.bTeamGame)
            {
                AnnouncePickup(P);
                SetRespawn();
            }
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    ShieldAmount=20
    MaxDesireability=1.5000000
    RespawnTime=30.0000000
    PickupMessage="?? ?? ???????"
    AmbientGlow=64
    CollisionHeight=23.0000000
    Mass=10.0000000
}