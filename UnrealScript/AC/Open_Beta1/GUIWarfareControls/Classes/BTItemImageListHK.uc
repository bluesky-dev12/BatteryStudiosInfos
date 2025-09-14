class BTItemImageListHK extends BTAutoImageListHK
    editinlinenew
    instanced;

var bool bShopItem;
var bool bShowOnlyInventory;
var array<BTROItemBoxHK> DataPool;
var BtrDouble Repair_UniqueItemID;

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

function ShowAll(wGameManager.EItemType Max, optional wGameManager.EItemType Min)
{
    local BTROItemBoxHK ro;
    local int i, Count;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xBF [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xB5
        if((int(byte(ro.ItemInfo.ItemType)) <= int(Max)) && int(byte(ro.ItemInfo.ItemType)) >= int(Min))
        {
            // End:0xB5
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowOnlyOne(wGameManager.EItemType one)
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x96 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x8C
        if(int(byte(ro.ItemInfo.ItemType)) == int(one))
        {
            // End:0x8C
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xEC [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xE2
        if((((ro.ItemInfo.ItemType <= 9) && ro.ItemInfo.ItemType >= 0) || ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0xE2
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x10B [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x101
        if(((ro.ItemInfo.ItemType <= 9) || ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0x101
            if((ro.ItemInfo.Grade >= 2) && ro.ItemInfo.Grade <= 6)
            {
                // End:0x101
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x10B [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x101
        if(((ro.ItemInfo.ItemType <= 9) || ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0x101
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0x101
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xD1 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xC7
        if(int(byte(ro.ItemInfo.ItemType)) == int(1))
        {
            // End:0xC7
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0xC7
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowSR()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xD1 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xC7
        if(int(byte(ro.ItemInfo.ItemType)) == int(2))
        {
            // End:0xC7
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0xC7
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowShotgun()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xD1 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xC7
        if(int(byte(ro.ItemInfo.ItemType)) == int(3))
        {
            // End:0xC7
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0xC7
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowMG()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xD1 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xC7
        if(int(byte(ro.ItemInfo.ItemType)) == int(4))
        {
            // End:0xC7
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0xC7
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowAR()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xD1 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xC7
        if(int(byte(ro.ItemInfo.ItemType)) == int(0))
        {
            // End:0xC7
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0xC7
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowItemAll()
{
    ShowAll(35);
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
    ShowAll(12, 8);
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

function ShowSkillAll()
{
    ShowOnlyOne(19);
    //return;    
}

function ShowActiveSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xB0 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xA6
        if(int(byte(ro.ItemInfo.ItemType)) == int(19))
        {
            // End:0xA6
            if(ro.ItemInfo.SkillUseType == 0)
            {
                // End:0xA6
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xB0 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xA6
        if(int(byte(ro.ItemInfo.ItemType)) == int(19))
        {
            // End:0xA6
            if(ro.ItemInfo.SkillUseType == 1)
            {
                // End:0xA6
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x105 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xFB
        if((((int(byte(ro.ItemInfo.ItemType)) >= int(0)) && int(byte(ro.ItemInfo.ItemType)) >= int(6)) || int(byte(ro.ItemInfo.ItemType)) == int(19)) || int(byte(ro.ItemInfo.ItemType)) == int(28))
        {
            // End:0xFB
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x143 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x139
        if((((int(byte(ro.ItemInfo.ItemType)) >= int(0)) && int(byte(ro.ItemInfo.ItemType)) >= int(6)) || int(byte(ro.ItemInfo.ItemType)) == int(19)) || int(byte(ro.ItemInfo.ItemType)) == int(28))
        {
            // End:0x139
            if((ro.ItemInfo.Grade >= 2) && ro.ItemInfo.Grade <= 6)
            {
                // End:0x139
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x143 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x139
        if((((int(byte(ro.ItemInfo.ItemType)) >= int(0)) && int(byte(ro.ItemInfo.ItemType)) >= int(6)) || int(byte(ro.ItemInfo.ItemType)) == int(19)) || int(byte(ro.ItemInfo.ItemType)) == int(28))
        {
            // End:0x139
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0x139
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xE1 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xD7
        if(((ro.ItemInfo.AdType >= 1) && ro.ItemInfo.AdType < 10) || (ro.instanceInfo != none) && ro.instanceInfo.CashItemInfo != none)
        {
            // End:0xD7
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x8D [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x83
        if(ro.ItemInfo.AdType == 2)
        {
            // End:0x83
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x8D [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x83
        if(ro.ItemInfo.AdType == 3)
        {
            // End:0x83
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x8D [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x83
        if(ro.ItemInfo.AdType == 4)
        {
            // End:0x83
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xAD [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xA3
        if((ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0xA3
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
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

    // End:0xB9 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xAF
        if((int(byte(ro.ItemInfo.ItemType)) >= int(27)) && int(byte(ro.ItemInfo.ItemType)) <= int(35))
        {
            // End:0xAF
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x93 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x89
        if(int(byte(ro.ItemInfo.ItemType)) == int(33))
        {
            // End:0x89
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
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

defaultproperties
{
    bAcceptsInput=true
}