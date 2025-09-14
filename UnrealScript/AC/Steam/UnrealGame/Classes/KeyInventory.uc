/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\KeyInventory.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class KeyInventory extends Inventory
    dependson(KeyPickup)
    dependson(LockedObjective);

var KeyPickup myPickUp;

function UnLock(LockedObjective o)
{
    // End:0x40
    if(!UnrealMPGameInfo(Level.Game).CanDisableObjective(o))
    {
        o.DisableObjective(Pawn(Owner));
    }
}

function Destroyed()
{
    myPickUp.GotoState('Pickup');
    super.Destroyed();
}
