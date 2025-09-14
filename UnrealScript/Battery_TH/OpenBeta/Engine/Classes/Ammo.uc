class Ammo extends Pickup
    abstract
    native
    placeable;

var() int AmmoAmount;

static simulated function UpdateHUD(HUD H)
{
    H.LastPickupTime = H.Level.TimeSeconds;
    H.LastAmmoPickupTime = H.LastPickupTime;
    //return;    
}

function float DetourWeight(Pawn Other, float PathWeight)
{
    local Inventory Inv;
    local wWeapon W;
    local float desire;

    // End:0x27
    if(Other.Weapon.AIRating >= 0.5000000)
    {
        return 0.0000000;
    }
    Inv = Other.Inventory;
    J0x3B:

    // End:0xB4 [Loop If]
    if(Inv != none)
    {
        W = wWeapon(Inv);
        // End:0x9D
        if(W != none)
        {
            desire = W.DesireAmmo(InventoryType, true);
            // End:0x9D
            if(desire != float(0))
            {
                return (desire * MaxDesireability) / PathWeight;
            }
        }
        Inv = Inv.Inventory;
        // [Loop Continue]
        goto J0x3B;
    }
    return 0.0000000;
    //return;    
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
        return 0.0000000;
    }
    Inv = Bot.Inventory;
    J0x35:

    // End:0xA7 [Loop If]
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
        // [Loop Continue]
        goto J0x35;
    }
    M = wAmmunition(Bot.FindInventoryType(InventoryType));
    // End:0xFA
    if((M != none) && M.AmmoAmount >= M.MaxAmmo)
    {
        return -1.0000000;
    }
    return 0.2500000 * MaxDesireability;
    //return;    
}

function Inventory SpawnCopy(Pawn Other)
{
    local Inventory Copy;

    Copy = super.SpawnCopy(Other);
    wAmmunition(Copy).AmmoAmount = AmmoAmount;
    return Copy;
    //return;    
}

defaultproperties
{
    MaxDesireability=0.2000000
    RespawnTime=30.0000000
    PickupMessage="??? ???????."
    CullDistance=4000.0000000
    Texture=Texture'Engine_Decompressed.S_Ammo'
    AmbientGlow=128
}