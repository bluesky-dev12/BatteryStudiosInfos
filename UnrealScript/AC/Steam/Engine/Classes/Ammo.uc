/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Ammo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:4
 *
 *******************************************************************************/
class Ammo extends Pickup
    native
    abstract
    placeable;

var() int AmmoAmount;

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    H.LastAmmoPickupTime = H.LastPickupTime;
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    local Inventory Inv;
    local wWeapon W;
    local float desire;

    // End:0x27
    if(Other.Weapon.AIRating >= 0.50)
    {
        return 0.0;
    }
    Inv = Other.Inventory;
    J0x3b:
    // End:0xb4 [While If]
    if(Inv != none)
    {
        W = wWeapon(Inv);
        // End:0x9d
        if(W != none)
        {
            desire = W.DesireAmmo(InventoryType, true);
            // End:0x9d
            if(desire != float(0))
            {
                return desire * MaxDesireability / PathWeight;
            }
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return 0.0;
}

function float BotDesireability(Pawn Bot)
{
    local Inventory Inv;
    local wWeapon W;
    local float desire;
    local wAmmunition M;

    // End:0x21
    if(Bot.Controller.bHuntPlayer)
    {
        return 0.0;
    }
    Inv = Bot.Inventory;
    J0x35:
    // End:0xa7 [While If]
    if(Inv != none)
    {
        W = wWeapon(Inv);
        // End:0x90
        if(W != none)
        {
            desire = W.DesireAmmo(InventoryType, false);
            // End:0x90
            if(desire != float(0))
            {
                return desire * MaxDesireability;
            }
        }
        Inv = Inv.Inventory;
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    M = wAmmunition(Bot.FindInventoryType(InventoryType));
    // End:0xfa
    if(M != none && M.AmmoAmount >= M.MaxAmmo)
    {
        return -1.0;
    }
    return 0.250 * MaxDesireability;
}

function Inventory SpawnCopy(Pawn Other)
{
    local Inventory Copy;

    Copy = super.SpawnCopy(Other);
    wAmmunition(Copy).AmmoAmount = AmmoAmount;
    return Copy;
}

defaultproperties
{
    MaxDesireability=0.20
    RespawnTime=30.0
    PickupMessage="Ammo acquired."
    CullDistance=4000.0
    Texture=Texture'S_Ammo'
    AmbientGlow=128
}