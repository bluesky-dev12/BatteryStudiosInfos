class TournamentHealth extends TournamentPickUp
    abstract;

var() int HealingAmount;
var() bool bSuperHeal;

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    H.LastHealthPickupTime = H.LastPickupTime;
    //return;    
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    local int Heal;

    // End:0x25
    if((PathWeight > float(500)) && HealingAmount < 10)
    {
        return 0.0000000;
    }
    Heal = Min(GetHealMax(Other), Other.Health + HealingAmount) - Other.Health;
    // End:0xAA
    if(AIController(Other.Controller).PriorityObjective() && Other.Health > 65)
    {
        return (0.0100000 * float(Heal)) / PathWeight;
    }
    return (0.0200000 * float(Heal)) / PathWeight;
    //return;    
}

event float BotDesireability(Pawn Bot)
{
    local float desire;
    local int HealMax;

    HealMax = GetHealMax(Bot);
    desire = float(Min(HealingAmount, HealMax - Bot.Health));
    // End:0x78
    if((Bot.Weapon != none) && Bot.Weapon.AIRating > 0.5000000)
    {
        desire *= 1.7000000;
    }
    // End:0xAF
    if(bSuperHeal || Bot.Health < 45)
    {
        return FMin(0.0300000 * desire, 2.2000000);        
    }
    else
    {
        // End:0xD2
        if(desire > float(6))
        {
            desire = FMax(desire, 25.0000000);            
        }
        else
        {
            // End:0xF3
            if(Bot.Controller.bHuntPlayer)
            {
                return 0.0000000;
            }
        }
        return FMin(0.0170000 * desire, 2.0000000);
    }
    //return;    
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return default.PickupMessage $ string(default.HealingAmount);
    //return;    
}

function int GetHealMax(Pawn P)
{
    // End:0x1A
    if(bSuperHeal)
    {
        return int(P.SuperHealthMax);
    }
    return int(P.HealthMax);
    //return;    
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;

        // End:0x7B
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            // End:0x7B
            if(P.GiveHealth(HealingAmount, GetHealMax(P)) || bSuperHeal && !Level.Game.bTeamGame)
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
    HealingAmount=20
    MaxDesireability=0.7000000
    RespawnTime=30.0000000
    PickupMessage="?? ?? ???????"
    AmbientGlow=128
    CollisionRadius=32.0000000
    CollisionHeight=23.0000000
    Mass=10.0000000
}