class KeyInventory extends Inventory;

var KeyPickup myPickUp;

function UnLock(LockedObjective o)
{
    // End:0x40
    if(!UnrealMPGameInfo(Level.Game).CanDisableObjective(o))
    {
        o.DisableObjective(Pawn(Owner));
    }
    //return;    
}

function Destroyed()
{
    myPickUp.GotoState('Pickup');
    super.Destroyed();
    //return;    
}
