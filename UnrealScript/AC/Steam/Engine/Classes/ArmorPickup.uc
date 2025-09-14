/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\ArmorPickup.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class ArmorPickup extends Pickup
    abstract
    placeable;

function float BotDesireability(Pawn Bot)
{
    local Inventory AlreadyHas;
    local Armor AlreadyHasArmor;
    local float desire;
    local bool bChecked;

    desire = MaxDesireability;
    // End:0xa2
    if(RespawnTime < float(10))
    {
        bChecked = true;
        AlreadyHas = Bot.FindInventoryType(InventoryType);
        // End:0xa2
        if(AlreadyHas != none)
        {
            // End:0x7b
            if(Inventory != none)
            {
                // End:0x78
                if(Inventory.Charge <= AlreadyHas.Charge)
                {
                    return -1.0;
                }
            }
            // End:0xa2
            else
            {
                // End:0xa2
                if(InventoryType.default.Charge <= AlreadyHas.Charge)
                {
                    return -1.0;
                }
            }
        }
    }
    // End:0xcc
    if(!bChecked)
    {
        AlreadyHasArmor = Armor(Bot.FindInventoryType(InventoryType));
    }
    // End:0x10a
    if(AlreadyHasArmor != none)
    {
        desire *= float(1) - float(AlreadyHasArmor.Charge * AlreadyHasArmor.ArmorAbsorption) * 0.000030;
    }
    // End:0x15e
    if(Armor(Inventory) != none)
    {
        desire *= float(Inventory.Charge) * 0.0050;
        desire *= float(Armor(Inventory).ArmorAbsorption) * 0.010;
    }
    // End:0x19f
    else
    {
        desire *= float(InventoryType.default.Charge) * 0.0050;
        desire *= float(class<Armor>(InventoryType).default.ArmorAbsorption) * 0.010;
    }
    return desire;
}
