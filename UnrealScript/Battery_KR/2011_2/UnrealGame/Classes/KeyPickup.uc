class KeyPickup extends Pickup;

function Inventory SpawnCopy(Pawn Other)
{
    local Inventory Copy;

    Copy = super.SpawnCopy(Other);
    Copy.Tag = Tag;
    KeyInventory(Copy).myPickUp = self;
    return Copy;
    //return;    
}

state Sleeping
{Begin:

    stop;                
}

defaultproperties
{
    InventoryType=Class'UnrealGame_Decompressed.KeyInventory'
    RespawnTime=9999.0000000
    PickupMessage="?? ?????."
}