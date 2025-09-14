/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XPickups\Classes\ShieldPickup.uc
 * Package Imports:
 *	XPickups
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:4
 *	States:1
 *
 *******************************************************************************/
class ShieldPickup extends TournamentPickUp
    abstract;

var() int ShieldAmount;

function float DetourWeight(Pawn Other, float PathWeight)
{
    local float Need;

    Need = float(Other.CanUseShield(ShieldAmount));
    // End:0x2f
    if(Need <= float(0))
    {
        return 0.0;
    }
    // End:0x8c
    if(AIController(Other.Controller).PriorityObjective() && Need < 0.40 * Other.GetShieldStrengthMax())
    {
        return 0.0050 * MaxDesireability * Need / PathWeight;
    }
    return 0.0130 * MaxDesireability * Need / PathWeight;
}

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    H.LastArmorPickupTime = H.LastPickupTime;
}

event float BotDesireability(Pawn Bot)
{
    return 0.0130 * MaxDesireability * float(Bot.CanUseShield(ShieldAmount));
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return default.PickupMessage $ string(default.ShieldAmount);
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
    }

}

defaultproperties
{
    ShieldAmount=20
    MaxDesireability=1.50
    RespawnTime=30.0
    PickupMessage="?? ?? ???????"
    AmbientGlow=64
    CollisionHeight=23.0
    Mass=10.0
}