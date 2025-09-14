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
    // End:0xA2
    if(RespawnTime < float(10))
    {
        bChecked = true;
        AlreadyHas = Bot.FindInventoryType(InventoryType);
        // End:0xA2
        if(AlreadyHas != none)
        {
            // End:0x7B
            if(Inventory != none)
            {
                // End:0x78
                if(Inventory.Charge <= AlreadyHas.Charge)
                {
                    return -1.0000000;
                }                
            }
            else
            {
                // End:0xA2
                if(InventoryType.default.Charge <= AlreadyHas.Charge)
                {
                    return -1.0000000;
                }
            }
        }
    }
    // End:0xCC
    if(!bChecked)
    {
        AlreadyHasArmor = Armor(Bot.FindInventoryType(InventoryType));
    }
    // End:0x10A
    if(AlreadyHasArmor != none)
    {
        desire *= (float(1) - (float(AlreadyHasArmor.Charge * AlreadyHasArmor.ArmorAbsorption) * 0.0000300));
    }
    // End:0x15E
    if(Armor(Inventory) != none)
    {
        desire *= (float(Inventory.Charge) * 0.0050000);
        desire *= (float(Armor(Inventory).ArmorAbsorption) * 0.0100000);        
    }
    else
    {
        desire *= (float(InventoryType.default.Charge) * 0.0050000);
        desire *= (float(Class<Armor>(InventoryType).default.ArmorAbsorption) * 0.0100000);
    }
    return desire;
    //return;    
}
