class BTItemImageListHK extends BTAutoImageListHK
    editinlinenew
    instanced;

var bool bShopItem;
var bool bShowOnlyInventory;
var array<BTROItemBoxHK> DataPool;
var bool bSortAdd;
var BtrDouble Repair_UniqueItemID;

function AddItem(BTROItemBoxHK Ro)
{
    local int i;

    // End:0x107
    if(bSortAdd)
    {
        // End:0x8E
        if(bShopItem)
        {
            i = 0;
            J0x19:

            // End:0x8B [Loop If]
            if(i < DataPool.Length)
            {
                // End:0x81
                if(DataPool[i].ItemInfo.ShopDisplayOrder > Ro.ItemInfo.ShopDisplayOrder)
                {
                    DataPool.Insert(i, 1);
                    DataPool[i] = Ro;
                    return;
                }
                ++i;
                // [Loop Continue]
                goto J0x19;
            }            
        }
        else
        {
            i = 0;
            J0x95:

            // End:0x107 [Loop If]
            if(i < DataPool.Length)
            {
                // End:0xFD
                if(DataPool[i].ItemInfo.InvenDisplayOrder > Ro.ItemInfo.InvenDisplayOrder)
                {
                    DataPool.Insert(i, 1);
                    DataPool[i] = Ro;
                    return;
                }
                ++i;
                // [Loop Continue]
                goto J0x95;
            }
        }
    }
    DataPool[DataPool.Length] = Ro;
    //return;    
}

function SortByDisplayOrder()
{
    local int i, j;
    local BTROItemBoxHK temp;

    // End:0xD0
    if(bShopItem)
    {
        i = 0;
        J0x10:

        // End:0xCD [Loop If]
        if(i < (DataPool.Length - 1))
        {
            j = i + 1;
            J0x31:

            // End:0xC3 [Loop If]
            if(j < DataPool.Length)
            {
                // End:0xB9
                if(DataPool[i].ItemInfo.ShopDisplayOrder > DataPool[j].ItemInfo.ShopDisplayOrder)
                {
                    temp = DataPool[i];
                    DataPool[i] = DataPool[j];
                    DataPool[j] = temp;
                }
                ++j;
                // [Loop Continue]
                goto J0x31;
            }
            ++i;
            // [Loop Continue]
            goto J0x10;
        }        
    }
    else
    {
        i = 0;
        J0xD7:

        // End:0x194 [Loop If]
        if(i < (DataPool.Length - 1))
        {
            j = i + 1;
            J0xF8:

            // End:0x18A [Loop If]
            if(j < DataPool.Length)
            {
                // End:0x180
                if(DataPool[i].ItemInfo.InvenDisplayOrder > DataPool[j].ItemInfo.InvenDisplayOrder)
                {
                    temp = DataPool[i];
                    DataPool[i] = DataPool[j];
                    DataPool[j] = temp;
                }
                ++j;
                // [Loop Continue]
                goto J0xF8;
            }
            ++i;
            // [Loop Continue]
            goto J0xD7;
        }
    }
    //return;    
}

function GetItemFromItemID(int ItemID, out array<BTROItemBoxHK> Arr)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x73 [Loop If]
    if(i < DataPool.Length)
    {
        // End:0x69
        if(DataPool[i].ItemInfo.ItemID == ItemID)
        {
            Arr.Length = Arr.Length + 1;
            Arr[Arr.Length - 1] = DataPool[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function RemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x57 [Loop If]
    if(i < DataPool.Length)
    {
        // End:0x4D
        if(__NFUN_912__(DataPool[i].instanceInfo.UniqueID, UniqueID))
        {
            DataPool.Remove(i, 1);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function BTROItemBoxHK FindPoolItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x55 [Loop If]
    if(i < DataPool.Length)
    {
        // End:0x4B
        if(__NFUN_912__(DataPool[i].instanceInfo.UniqueID, UniqueID))
        {
            return DataPool[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function BTROItemBoxHK FindPoolSkillItem(int UniqueSkillID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x54 [Loop If]
    if(i < DataPool.Length)
    {
        // End:0x4A
        if(DataPool[i].instanceInfo.UniqueSkillID == UniqueSkillID)
        {
            return DataPool[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return none;
    //return;    
}

function AddShowItem(BtrDouble UniqueID)
{
    local int i;
    local BTROItemBoxHK Ro;

    Ro = FindPoolItem(UniqueID);
    // End:0x1E
    if(Ro == none)
    {
        return;
    }
    i = 0;
    J0x25:

    // End:0x7A [Loop If]
    if(i < DataPool.Length)
    {
        // End:0x70
        if(__NFUN_912__(DataPool[i].instanceInfo.UniqueID, UniqueID))
        {
            AddRenderObject(DataPool[i]);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x25;
    }
    //return;    
}

function RemoveShowItem(BtrDouble UniqueID)
{
    local int i;
    local BTROItemBoxHK Ro;

    i = 0;
    J0x07:

    // End:0x66 [Loop If]
    if(i < DataList.Length)
    {
        Ro = BTROItemBoxHK(DataList[i]);
        // End:0x5C
        if(__NFUN_912__(Ro.instanceInfo.UniqueID, UniqueID))
        {
            RemoveRenderObject(Ro);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function ChangeShowItem(BtrDouble prevUniqueID, BtrDouble UniqueID)
{
    local int i;
    local BTROItemBoxHK Ro;

    Ro = FindPoolItem(UniqueID);
    i = 0;
    J0x18:

    // End:0x71 [Loop If]
    if(i < DataList.Length)
    {
        // End:0x67
        if(__NFUN_912__(BTROItemBoxHK(DataList[i]).instanceInfo.UniqueID, prevUniqueID))
        {
            ReplaceRenderObject(Ro, i);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    //return;    
}

function ClearItem()
{
    DataPool.Length = 0;
    DataList.Length = 0;
    ImageList.Clear();
    SelectItemIndex = -1;
    LastSelectedItemIndex = -1;
    //return;    
}

function ResetItem()
{
    DataList.Length = 0;
    ImageList.Clear();
    SelectItemIndex = -1;
    LastSelectedItemIndex = -1;
    //return;    
}

function ShowAll(wGameManager.EItemType Max, optional wGameManager.EItemType Min)
{
    local BTROItemBoxHK Ro;
    local int i, Count;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xC1 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xB7
        if((int(byte(Ro.ItemInfo.ItemType)) <= int(Max)) && int(byte(Ro.ItemInfo.ItemType)) >= int(Min))
        {
            // End:0xB7
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowEquipItemAll()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x14F [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x145
        if((((int(byte(Ro.ItemInfo.ItemType)) >= int(8)) && int(byte(Ro.ItemInfo.ItemType)) <= int(12)) || (int(byte(Ro.ItemInfo.ItemType)) >= int(34)) && int(byte(Ro.ItemInfo.ItemType)) <= int(36)) || int(byte(Ro.ItemInfo.ItemType)) == int(14))
        {
            // End:0x10C
            if(int(Ro.ItemInfo.byModeItem) != 0)
            {
                // [Explicit Continue]
                goto J0x145;
            }
            // End:0x145
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        J0x145:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowOnlyOne(wGameManager.EItemType one)
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xB9 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xAF
        if((int(byte(Ro.ItemInfo.ItemType)) == int(one)) && int(Ro.ItemInfo.byModeItem) == 0)
        {
            // End:0xAF
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowItemOverOne(wGameManager.EItemType one, wGameManager.EItemType two)
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xB9 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xAF
        if((Ro.ItemInfo.ItemType == int(one)) || Ro.ItemInfo.ItemType == int(two))
        {
            // End:0xAF
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponWithEquip()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xEE [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xE4
        if((((Ro.ItemInfo.ItemType <= 9) && Ro.ItemInfo.ItemType >= 0) || Ro.ItemInfo.ItemType == 20) || Ro.ItemInfo.ItemType >= 24)
        {
            // End:0xE4
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponBootyWithEquip()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x10D [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x103
        if(((Ro.ItemInfo.ItemType <= 9) || Ro.ItemInfo.ItemType == 20) || Ro.ItemInfo.ItemType >= 24)
        {
            // End:0x103
            if((Ro.ItemInfo.Grade >= 2) && Ro.ItemInfo.Grade <= 6)
            {
                // End:0x103
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponNoBootyWithEquip()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x10D [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x103
        if(((Ro.ItemInfo.ItemType <= 9) || Ro.ItemInfo.ItemType == 20) || Ro.ItemInfo.ItemType >= 24)
        {
            // End:0x103
            if((Ro.ItemInfo.Grade < 2) || Ro.ItemInfo.Grade > 6)
            {
                // End:0x103
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowSMG()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xF5 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xEB
        if(int(byte(Ro.ItemInfo.ItemType)) == int(1))
        {
            // End:0xEB
            if((Ro.ItemInfo.Grade < 2) || Ro.ItemInfo.Grade > 6)
            {
                // End:0xB2
                if(int(Ro.ItemInfo.byModeItem) != 0)
                {
                    // [Explicit Continue]
                    goto J0xEB;
                }
                // End:0xEB
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        J0xEB:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowSR()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xF5 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xEB
        if(int(byte(Ro.ItemInfo.ItemType)) == int(2))
        {
            // End:0xEB
            if((Ro.ItemInfo.Grade < 2) || Ro.ItemInfo.Grade > 6)
            {
                // End:0xB2
                if(int(Ro.ItemInfo.byModeItem) != 0)
                {
                    // [Explicit Continue]
                    goto J0xEB;
                }
                // End:0xEB
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        J0xEB:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowShotgun()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xF5 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xEB
        if(int(byte(Ro.ItemInfo.ItemType)) == int(3))
        {
            // End:0xEB
            if((Ro.ItemInfo.Grade < 2) || Ro.ItemInfo.Grade > 6)
            {
                // End:0xB2
                if(int(Ro.ItemInfo.byModeItem) != 0)
                {
                    // [Explicit Continue]
                    goto J0xEB;
                }
                // End:0xEB
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        J0xEB:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowMG()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xF5 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xEB
        if(int(byte(Ro.ItemInfo.ItemType)) == int(4))
        {
            // End:0xEB
            if((Ro.ItemInfo.Grade < 2) || Ro.ItemInfo.Grade > 6)
            {
                // End:0xB2
                if(int(Ro.ItemInfo.byModeItem) != 0)
                {
                    // [Explicit Continue]
                    goto J0xEB;
                }
                // End:0xEB
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        J0xEB:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowAR()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xF5 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xEB
        if(int(byte(Ro.ItemInfo.ItemType)) == int(0))
        {
            // End:0xEB
            if((Ro.ItemInfo.Grade < 2) || Ro.ItemInfo.Grade > 6)
            {
                // End:0xB2
                if(int(Ro.ItemInfo.byModeItem) != 0)
                {
                    // [Explicit Continue]
                    goto J0xEB;
                }
                // End:0xEB
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        J0xEB:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowItemAll()
{
    ShowAll(42);
    //return;    
}

function ShowWeaponAll()
{
    ShowAll(6);
    //return;    
}

function ShowMainWeapon()
{
    ShowAll(4);
    //return;    
}

function ShowSubWeapon()
{
    ShowOnlyOne(5);
    //return;    
}

function ShowHandThrowWeapon()
{
    ShowOnlyOne(6);
    //return;    
}

function ShowEquipItem()
{
    ShowEquipItemAll();
    //return;    
}

function ShowEquipHeadItem()
{
    ShowOnlyOne(8);
    //return;    
}

function ShowEquipFaceItem()
{
    ShowOnlyOne(9);
    //return;    
}

function ShowEquipAccessoryItem()
{
    ShowOnlyOne(10);
    //return;    
}

function ShowEquipSpCharItem()
{
    ShowOnlyOne(11);
    //return;    
}

function ShowEquipBackPackItem()
{
    ShowOnlyOne(14);
    //return;    
}

function ShowDecoItem()
{
    ShowItemOverOne(34, 35);
    //return;    
}

function ShowSkillAll()
{
    ShowOnlyOne(19);
    //return;    
}

function ShowActiveSkill()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xDA [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xD0
        if((int(byte(Ro.ItemInfo.ItemType)) == int(19)) && int(Ro.ItemInfo.byModeItem) == 0)
        {
            // End:0xD0
            if(int(byte(Ro.ItemInfo.SkillUseType)) == int(0))
            {
                // End:0xD0
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowPassiveSkill()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xD3 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xC9
        if((int(byte(Ro.ItemInfo.ItemType)) == int(19)) && int(Ro.ItemInfo.byModeItem) == 0)
        {
            // End:0xC9
            if(Ro.ItemInfo.SkillUseType == 1)
            {
                // End:0xC9
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowActiveSkillOnlyOne(int SkillType)
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xDA [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xD0
        if(int(byte(Ro.ItemInfo.ItemType)) == int(19))
        {
            // End:0xD0
            if(int(byte(Ro.ItemInfo.SkillUseType)) == int(0))
            {
                // End:0xD0
                if(Ro.ItemInfo.SkillType == SkillType)
                {
                    // End:0xD0
                    if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                    {
                        AddRenderObject(Ro);
                    }
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponWithSkill()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x107 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xFD
        if((((int(byte(Ro.ItemInfo.ItemType)) >= int(0)) && int(byte(Ro.ItemInfo.ItemType)) >= int(6)) || int(byte(Ro.ItemInfo.ItemType)) == int(19)) || int(byte(Ro.ItemInfo.ItemType)) == int(28))
        {
            // End:0xFD
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponBootyWithSkill()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x145 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x13B
        if((((int(byte(Ro.ItemInfo.ItemType)) >= int(0)) && int(byte(Ro.ItemInfo.ItemType)) >= int(6)) || int(byte(Ro.ItemInfo.ItemType)) == int(19)) || int(byte(Ro.ItemInfo.ItemType)) == int(28))
        {
            // End:0x13B
            if((Ro.ItemInfo.Grade >= 2) && Ro.ItemInfo.Grade <= 6)
            {
                // End:0x13B
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponNoBootyWithSkill()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x145 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x13B
        if((((int(byte(Ro.ItemInfo.ItemType)) >= int(0)) && int(byte(Ro.ItemInfo.ItemType)) >= int(6)) || int(byte(Ro.ItemInfo.ItemType)) == int(19)) || int(byte(Ro.ItemInfo.ItemType)) == int(28))
        {
            // End:0x13B
            if((Ro.ItemInfo.Grade < 2) || Ro.ItemInfo.Grade > 6)
            {
                // End:0x13B
                if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(Ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowShopItemAll()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xE3 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xD9
        if(((Ro.ItemInfo.AdType >= 1) && Ro.ItemInfo.AdType < 10) || (Ro.instanceInfo != none) && Ro.instanceInfo.cashItemInfo != none)
        {
            // End:0xD9
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowShopItemAdBest()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x8F [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x85
        if(Ro.ItemInfo.AdType == 2)
        {
            // End:0x85
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowShopItemAdNew()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x8F [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x85
        if(Ro.ItemInfo.AdType == 3)
        {
            // End:0x85
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowShopItemAdHot()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x8F [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x85
        if(Ro.ItemInfo.AdType == 4)
        {
            // End:0x85
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowETCnPassive()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xAF [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0xA5
        if((Ro.ItemInfo.ItemType == 20) || Ro.ItemInfo.ItemType >= 24)
        {
            // End:0xA5
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowCashItem()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x76 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x6C
        if((Ro.instanceInfo != none) && Ro.instanceInfo.cashItemInfo != none)
        {
            AddRenderObject(Ro);
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowAllETC()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x134 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x100
        if(((int(byte(Ro.ItemInfo.ItemType)) >= int(27)) && int(byte(Ro.ItemInfo.ItemType)) <= int(33)) || (int(byte(Ro.ItemInfo.ItemType)) >= int(37)) && int(byte(Ro.ItemInfo.ItemType)) <= int(42))
        {
            // End:0xFD
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
            // [Explicit Continue]
            goto J0x12A;
        }
        // End:0x12A
        if(int(Ro.ItemInfo.byModeItem) != 0)
        {
            AddRenderObject(Ro);
        }
        J0x12A:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowEtc()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x128 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x11E
        if(((int(byte(Ro.ItemInfo.ItemType)) >= int(27)) && int(byte(Ro.ItemInfo.ItemType)) <= int(33)) || (int(byte(Ro.ItemInfo.ItemType)) >= int(37)) && int(byte(Ro.ItemInfo.ItemType)) <= int(42))
        {
            // End:0x11E
            if(((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13)) && int(Ro.ItemInfo.byModeItem) == 0)
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowLVMark()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x95 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x8B
        if(int(byte(Ro.ItemInfo.ItemType)) == int(33))
        {
            // End:0x8B
            if((bShowOnlyInventory == false) || Ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(Ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowPassive()
{
    ShowOnlyOne(28);
    //return;    
}

function ShowOnlyModeItem()
{
    local BTROItemBoxHK Ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x62 [Loop If]
    if(i < DataPool.Length)
    {
        Ro = DataPool[i];
        // End:0x58
        if(int(Ro.ItemInfo.byModeItem) != 0)
        {
            AddRenderObject(Ro);
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

defaultproperties
{
    bSortAdd=true
    bAcceptsInput=true
}