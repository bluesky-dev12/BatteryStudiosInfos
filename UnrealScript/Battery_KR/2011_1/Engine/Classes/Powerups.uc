class Powerups extends Inventory
    abstract
    native
    nativereplication
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
    // Pos:0x000
    reliable if((bNetOwner && bNetDirty) && int(Role) == int(ROLE_Authority))
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
    //return;    
}

function PickupFunction(Pawn Other)
{
    super.PickupFunction(Other);
    // End:0x3A
    if(bActivatable && Other.SelectedItem == none)
    {
        Other.SelectedItem = self;
    }
    // End:0x68
    if((bActivatable && bAutoActivate) && Other.bAutoActivate)
    {
        Activate();
    }
    //return;    
}

function Powerups SelectNext()
{
    // End:0x0B
    if(bActivatable)
    {
        return self;
    }
    // End:0x29
    if(Inventory != none)
    {
        return Inventory.SelectNext();        
    }
    else
    {
        return none;
    }
    //return;    
}

function Activate()
{
    // End:0x10
    if(bActivatable)
    {
        GotoState('Activated');
    }
    //return;    
}

function bool HandlePickupQuery(Pickup Item)
{
    // End:0xC2
    if(Item.InventoryType == Class)
    {
        // End:0x2B
        if(bCanHaveMultipleCopies)
        {
            NumCopies++;            
        }
        else
        {
            // End:0x96
            if(bDisplayableInv)
            {
                // End:0x6F
                if(Item.Inventory != none)
                {
                    Charge = Max(Charge, Item.Inventory.Charge);                    
                }
                else
                {
                    Charge = Max(Charge, Item.InventoryType.default.Charge);
                }                
            }
            else
            {
                return false;
            }
        }
        Item.AnnouncePickup(Pawn(Owner));
        Item.SetRespawn();
        return true;
    }
    // End:0xCF
    if(Inventory == none)
    {
        return false;
    }
    return Inventory.HandlePickupQuery(Item);
    //return;    
}

function float UseCharge(float Amount)
{
    //return;    
}

function FireEffect()
{
    //return;    
}

function UsedUp()
{
    // End:0xA8
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
    //return;    
}

static function string GetLocalString(optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2)
{
    return default.ExpireMessage;
    //return;    
}

state Activated
{
    function BeginState()
    {
        bActive = true;
        //return;        
    }

    function EndState()
    {
        bActive = false;
        //return;        
    }

    function Activate()
    {
        // End:0x43
        if((((Pawn(Owner) != none) && Pawn(Owner).bAutoActivate) && bAutoActivate) && Charge > 0)
        {
            return;
        }
        global.Activate();
        //return;        
    }
    stop;    
}
