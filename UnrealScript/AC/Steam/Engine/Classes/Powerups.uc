/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Powerups.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:9
 *	States:1
 *
 *******************************************************************************/
class Powerups extends Inventory
    native
    nativereplication
    abstract
    notplaceable;

var travel int NumCopies;
var() bool bCanHaveMultipleCopies;
var() bool bAutoActivate;
var() bool bActivatable;
var travel bool bActive;
var() localized string ExpireMessage;
var() Sound ActivateSound;
var() Sound DeActivateSound;

replication
{
    // Pos:0x00
    reliable if(bNetOwner && bNetDirty && Role == 4)
        NumCopies, bActivatable,
        bActive;

}

event TravelPreAccept()
{
    super.TravelPreAccept();
    // End:0x15
    if(bActive)
    {
        Activate();
    }
}

function PickupFunction(Pawn Other)
{
    super.PickupFunction(Other);
    // End:0x3a
    if(bActivatable && Other.SelectedItem == none)
    {
        Other.SelectedItem = self;
    }
    // End:0x68
    if(bActivatable && bAutoActivate && Other.bAutoActivate)
    {
        Activate();
    }
}

function Powerups SelectNext()
{
    // End:0x0b
    if(bActivatable)
    {
        return self;
    }
    // End:0x29
    if(Inventory != none)
    {
        return Inventory.SelectNext();
    }
    // End:0x2b
    else
    {
        return none;
    }
}

function Activate()
{
    // End:0x10
    if(bActivatable)
    {
        GotoState('Activated');
    }
}

function bool HandlePickupQuery(Pickup Item)
{
    // End:0xc2
    if(Item.InventoryType == Class)
    {
        // End:0x2b
        if(bCanHaveMultipleCopies)
        {
            ++ NumCopies;
        }
        // End:0x98
        else
        {
            // End:0x96
            if(bDisplayableInv)
            {
                // End:0x6f
                if(Item.Inventory != none)
                {
                    Charge = Max(Charge, Item.Inventory.Charge);
                }
                // End:0x93
                else
                {
                    Charge = Max(Charge, Item.InventoryType.default.Charge);
                }
            }
            // End:0x98
            else
            {
                return false;
            }
        }
        Item.AnnouncePickup(Pawn(Owner));
        Item.SetRespawn();
        return true;
    }
    // End:0xcf
    if(Inventory == none)
    {
        return false;
    }
    return Inventory.HandlePickupQuery(Item);
}

function float UseCharge(float Amount);
function FireEffect();
function UsedUp()
{
    // End:0xa8
    if(Pawn(Owner) != none)
    {
        bActivatable = false;
        Pawn(Owner).NextItem();
        // End:0x87
        if(Pawn(Owner).SelectedItem == self)
        {
            Pawn(Owner).NextItem();
            // End:0x87
            if(Pawn(Owner).SelectedItem == self)
            {
                Pawn(Owner).SelectedItem = none;
            }
        }
        Instigator.ReceiveLocalizedMessage(MessageClass, 0, none, none, self.Class);
    }
    Owner.PlaySound(DeActivateSound, 6);
    Destroy();
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return default.ExpireMessage;
}

state Activated
{
    function BeginState()
    {
        bActive = true;
    }

    function EndState()
    {
        bActive = false;
    }

    function Activate()
    {
        // End:0x43
        if(Pawn(Owner) != none && Pawn(Owner).bAutoActivate && bAutoActivate && Charge > 0)
        {
            return;
        }
        global.Activate();
    }

}
