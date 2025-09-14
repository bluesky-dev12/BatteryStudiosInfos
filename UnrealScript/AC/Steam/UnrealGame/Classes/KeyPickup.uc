/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\KeyPickup.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *	States:1
 *
 *******************************************************************************/
class KeyPickup extends Pickup;

function Inventory SpawnCopy(Pawn Other)
{
    local Inventory Copy;

    Copy = super.SpawnCopy(Other);
    Copy.Tag = Tag;
    KeyInventory(Copy).myPickUp = self;
    return Copy;
}

state Sleeping
{

Begin:
    stop;    
}

defaultproperties
{
    InventoryType=class'KeyInventory'
    RespawnTime=9999.0
    PickupMessage="?? ?????."
}