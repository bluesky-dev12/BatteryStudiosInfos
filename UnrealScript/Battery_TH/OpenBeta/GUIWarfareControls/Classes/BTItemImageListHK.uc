class BTItemImageListHK extends BTAutoImageListHK
    editinlinenew
    instanced;

var bool bShopItem;
var bool bShowOnlyInventory;
var array<BTROItemBoxHK> DataPool;

function AddItem(BTROItemBoxHK ro)
{
    local int i;

    // End:0x85
    if(bShopItem)
    {
        i = 0;
        J0x10:

        // End:0x82 [Loop If]
        if(i < DataPool.Length)
        {
            // End:0x78
            if(DataPool[i].ItemInfo.ShopDisplayOrder > ro.ItemInfo.ShopDisplayOrder)
            {
                DataPool.Insert(i, 1);
                DataPool[i] = ro;
                return;
            }
            ++i;
            // [Loop Continue]
            goto J0x10;
        }        
    }
    else
    {
        i = 0;
        J0x8C:

        // End:0xFE [Loop If]
        if(i < DataPool.Length)
        {
            // End:0xF4
            if(DataPool[i].ItemInfo.InvenDisplayOrder > ro.ItemInfo.InvenDisplayOrder)
            {
                DataPool.Insert(i, 1);
                DataPool[i] = ro;
                return;
            }
            ++i;
            // [Loop Continue]
            goto J0x8C;
        }
    }
    DataPool[DataPool.Length] = ro;
    //return;    
}

function SortByDisplayOrder()
{
    local int i, j;
    local BTROItemBoxHK Temp;

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
                    Temp = DataPool[i];
                    DataPool[i] = DataPool[j];
                    DataPool[j] = Temp;
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
                    Temp = DataPool[i];
                    DataPool[i] = DataPool[j];
                    DataPool[j] = Temp;
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
    local BTROItemBoxHK ro;

    ro = FindPoolItem(UniqueID);
    // End:0x1E
    if(ro == none)
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
    local BTROItemBoxHK ro;

    i = 0;
    J0x07:

    // End:0x66 [Loop If]
    if(i < DataList.Length)
    {
        ro = BTROItemBoxHK(DataList[i]);
        // End:0x5C
        if(__NFUN_912__(ro.instanceInfo.UniqueID, UniqueID))
        {
            RemoveRenderObject(ro);
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
    local BTROItemBoxHK ro;

    ro = FindPoolItem(UniqueID);
    i = 0;
    J0x18:

    // End:0x71 [Loop If]
    if(i < DataList.Length)
    {
        // End:0x67
        if(__NFUN_912__(BTROItemBoxHK(DataList[i]).instanceInfo.UniqueID, prevUniqueID))
        {
            ReplaceRenderObject(ro, i);
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

function ShowAll(int Max, optional int Min)
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xE9 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xDF;
        }
        // End:0xDF
        if((ro.ItemInfo.ItemType <= Max) && ro.ItemInfo.ItemType >= Min)
        {
            // End:0xDF
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0xDF:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowOnlyOne(int one)
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xE6 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xDC;
        }
        // End:0xDC
        if((ro.ItemInfo.ItemType == one) || ro.ItemInfo.ItemType == 28)
        {
            // End:0xDC
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0xDC:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponWithEquip()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x122 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0x118;
        }
        // End:0x118
        if((((ro.ItemInfo.ItemType <= 9) && ro.ItemInfo.ItemType >= 0) || ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0x118
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0x118:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponBootyWithEquip()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x141 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0x137;
        }
        // End:0x137
        if(((ro.ItemInfo.ItemType <= 9) || ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0x137
            if((ro.ItemInfo.Grade >= 2) && ro.ItemInfo.Grade <= 6)
            {
                // End:0x137
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        J0x137:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponNoBootyWithEquip()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x141 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0x137;
        }
        // End:0x137
        if(((ro.ItemInfo.ItemType <= 9) || ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0x137
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0x137
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        J0x137:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponAll()
{
    ShowAll(4);
    //return;    
}

function ShowMainWeapon()
{
    ShowAll(2);
    //return;    
}

function ShowSubWeapon()
{
    ShowOnlyOne(3);
    //return;    
}

function ShowHandThrowWeapon()
{
    ShowOnlyOne(4);
    //return;    
}

function ShowEquipItem()
{
    ShowAll(9, 5);
    //return;    
}

function ShowEquipHeadItem()
{
    ShowOnlyOne(5);
    //return;    
}

function ShowEquipFaceItem()
{
    ShowOnlyOne(6);
    //return;    
}

function ShowEquipAccessoryItem()
{
    ShowOnlyOne(7);
    //return;    
}

function ShowEquipSpCharItem()
{
    ShowOnlyOne(8);
    //return;    
}

function ShowSkillAll()
{
    ShowOnlyOne(22);
    //return;    
}

function ShowActiveSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xE0 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xD6;
        }
        // End:0xD6
        if(ro.ItemInfo.ItemType == 22)
        {
            // End:0xD6
            if(ro.ItemInfo.SkillUseType == 0)
            {
                // End:0xD6
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        J0xD6:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowPassiveSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xE0 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xD6;
        }
        // End:0xD6
        if(ro.ItemInfo.ItemType == 22)
        {
            // End:0xD6
            if(ro.ItemInfo.SkillUseType == 1)
            {
                // End:0xD6
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        J0xD6:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponWithSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x103 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xF9;
        }
        // End:0xF9
        if(((ro.ItemInfo.ItemType <= 4) || ro.ItemInfo.ItemType == 22) || ro.ItemInfo.ItemType == 24)
        {
            // End:0xF9
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0xF9:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponBootyWithSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x141 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0x137;
        }
        // End:0x137
        if(((ro.ItemInfo.ItemType <= 4) || ro.ItemInfo.ItemType == 22) || ro.ItemInfo.ItemType == 24)
        {
            // End:0x137
            if((ro.ItemInfo.Grade >= 2) && ro.ItemInfo.Grade <= 6)
            {
                // End:0x137
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        J0x137:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowWeaponNoBootyWithSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x141 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0x137;
        }
        // End:0x137
        if(((ro.ItemInfo.ItemType <= 4) || ro.ItemInfo.ItemType == 22) || ro.ItemInfo.ItemType == 24)
        {
            // End:0x137
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0x137
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        J0x137:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowShopItemAll()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xC2 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xB8;
        }
        // End:0xB8
        if(ro.ItemInfo.AdType >= 1)
        {
            // End:0xB8
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0xB8:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowShopItemAdBest()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xC3 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xB9;
        }
        // End:0xB9
        if(ro.ItemInfo.AdType == 2)
        {
            // End:0xB9
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0xB9:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowShopItemAdNew()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xC3 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xB9;
        }
        // End:0xB9
        if(ro.ItemInfo.AdType == 3)
        {
            // End:0xB9
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0xB9:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowShopItemAdHot()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xC3 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xB9;
        }
        // End:0xB9
        if(ro.ItemInfo.AdType == 4)
        {
            // End:0xB9
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0xB9:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowETCnPassive()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x104 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xFA;
        }
        // End:0xFA
        if((ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0xC3
            if(ro.ItemInfo.ItemType == 28)
            {
                // [Explicit Continue]
                goto J0xFA;
            }
            // End:0xFA
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0xFA:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowCashItem()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x76 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x6C
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            AddRenderObject(ro);
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowEtc()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x103 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xF9;
        }
        // End:0xF9
        if((ro.ItemInfo.ItemType == 20) || (ro.ItemInfo.ItemType > 24) && ro.ItemInfo.ItemType < 28)
        {
            // End:0xF9
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0xF9:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowLVMark()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xC3 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x64
        if((ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // [Explicit Continue]
            goto J0xB9;
        }
        // End:0xB9
        if(ro.ItemInfo.ItemType == 29)
        {
            // End:0xB9
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        J0xB9:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowPassive()
{
    ShowOnlyOne(24);
    //return;    
}

defaultproperties
{
    bAcceptsInput=true
}