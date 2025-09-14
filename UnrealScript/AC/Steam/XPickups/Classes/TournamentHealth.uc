/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XPickups\Classes\TournamentHealth.uc
 * Package Imports:
 *	XPickups
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:5
 *	States:1
 *
 *******************************************************************************/
class TournamentHealth extends TournamentPickUp
    abstract;

var() int HealingAmount;
var() bool bSuperHeal;

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    H.LastHealthPickupTime = H.LastPickupTime;
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    local int Heal;

    // End:0x25
    if(PathWeight > float(500) && HealingAmount < 10)
    {
        return 0.0;
    }
    Heal = Min(GetHealMax(Other), Other.Health + HealingAmount) - Other.Health;
    // End:0xaa
    if(AIController(Other.Controller).PriorityObjective() && Other.Health > 65)
    {
        return 0.010 * float(Heal) / PathWeight;
    }
    return 0.020 * float(Heal) / PathWeight;
}

event float BotDesireability(Pawn Bot)
{
    local float desire;
    local int HealMax;

    HealMax = GetHealMax(Bot);
    desire = float(Min(HealingAmount, HealMax - Bot.Health));
    // End:0x78
    if(Bot.Weapon != none && Bot.Weapon.AIRating > 0.50)
    {
        desire *= 1.70;
    }
    // End:0xaf
    if(bSuperHeal || Bot.Health < 45)
    {
        return FMin(0.030 * desire, 2.20);
    }
    // End:0x107
    else
    {
        // End:0xd2
        if(desire > float(6))
        {
            desire = FMax(desire, 25.0);
        }
        // End:0xf3
        else
        {
            // End:0xf3
            if(Bot.Controller.bHuntPlayer)
            {
                return 0.0;
            }
        }
        return FMin(0.0170 * desire, 2.0);
    }
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return default.PickupMessage $ string(default.HealingAmount);
}

function int GetHealMax(Pawn P)
{
    // End:0x1a
    if(bSuperHeal)
    {
        return int(P.SuperHealthMax);
    }
    return int(P.HealthMax);
}

auto state Pickup
{
    function Touch(Actor Other)
    {
        local Pawn P;

        // End:0x7b
        if(ValidTouch(Other))
        {
            P = Pawn(Other);
            // End:0x7b
            if(P.GiveHealth(HealingAmount, GetHealMax(P)) || bSuperHeal && !Level.Game.bTeamGame)
            {
                AnnouncePickup(P);
                SetRespawn();
            }
        }
    }

}

defaultproperties
{
    HealingAmount=20
    MaxDesireability=0.70
    RespawnTime=30.0
    PickupMessage="?? ?? ???????"
    AmbientGlow=128
    CollisionRadius=32.0
    CollisionHeight=23.0
    Mass=10.0
}