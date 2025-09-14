class BTItemImageListHK extends BTAutoImageListHK
    editinlinenew
    instanced;

var bool bShopItem;
var bool bShowOnlyInventory;
var array<BTROItemBoxHK> DataPool;
var bool bSortAdd;
var BtrDouble Repair_UniqueItemID;

function AddItem(BTROItemBoxHK ro)
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
                if(DataPool[i].ItemInfo.ShopDisplayOrder > ro.ItemInfo.ShopDisplayOrder)
                {
                    DataPool.Insert(i, 1);
                    DataPool[i] = ro;
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
                if(DataPool[i].ItemInfo.InvenDisplayOrder > ro.ItemInfo.InvenDisplayOrder)
                {
                    DataPool.Insert(i, 1);
                    DataPool[i] = ro;
                    return;
                }
                ++i;
                // [Loop Continue]
                goto J0x95;
            }
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

    // End:0x66
    if(__NFUN_913__(UniqueID, EmptyBtrDouble()))
    {
        i = 0;
        J0x18:

        // End:0x66 [Loop If]
        if(i < DataPool.Length)
        {
            // End:0x5C
            if(__NFUN_912__(DataPool[i].instanceInfo.UniqueID, UniqueID))
            {
                return DataPool[i];
            }
            i++;
            // [Loop Continue]
            goto J0x18;
        }
    }
    return none;
    //return;    
}

function BTROItemBoxHK FindPoolSkillItem(int UniqueSkillID)
{
    local int i;

    // End:0x5F
    if(UniqueSkillID != 0)
    {
        i = 0;
        J0x12:

        // End:0x5F [Loop If]
        if(i < DataPool.Length)
        {
            // End:0x55
            if(DataPool[i].instanceInfo.UniqueSkillID == UniqueSkillID)
            {
                return DataPool[i];
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }
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

    // End:0xD9 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xCF
        if((int(byte(ro.ItemInfo.ItemType)) <= int(Max)) && int(byte(ro.ItemInfo.ItemType)) >= int(Min))
        {
            // End:0x96
            if(ro.isShowIcon == false)
            {
                // [Explicit Continue]
                goto J0xCF;
            }
            // End:0xCF
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(ro);
            }
        }
        J0xCF:

        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowEquipItemAll()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x167 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x15D
        if((((int(byte(ro.ItemInfo.ItemType)) >= int(8)) && int(byte(ro.ItemInfo.ItemType)) <= int(12)) || (int(byte(ro.ItemInfo.ItemType)) >= int(34)) && int(byte(ro.ItemInfo.ItemType)) <= int(36)) || int(byte(ro.ItemInfo.ItemType)) == int(14))
        {
            // End:0x10C
            if(int(ro.ItemInfo.byModeItem) != 0)
            {
                // [Explicit Continue]
                goto J0x15D;
            }
            // End:0x124
            if(ro.isShowIcon == false)
            {
                // [Explicit Continue]
                goto J0x15D;
            }
            // End:0x15D
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(ro);
            }
        }
        J0x15D:

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

    // End:0xB9 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xAF
        if((int(byte(ro.ItemInfo.ItemType)) == int(one)) && int(ro.ItemInfo.byModeItem) == 0)
        {
            // End:0xAF
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

function ShowItemOverOne(wGameManager.EItemType one, wGameManager.EItemType two)
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
        // End:0x46
        if(ro.isShowIcon == false)
        {
            // [Explicit Continue]
            goto J0xC7;
        }
        // End:0xC7
        if((ro.ItemInfo.ItemType == int(one)) || ro.ItemInfo.ItemType == int(two))
        {
            // End:0xC7
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(ro);
            }
        }
        J0xC7:

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

    // End:0xEE [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xE4
        if((((ro.ItemInfo.ItemType <= 9) && ro.ItemInfo.ItemType >= 0) || ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0xE4
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0x10D [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x103
        if(((ro.ItemInfo.ItemType <= 9) || ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0x103
            if((ro.ItemInfo.Grade >= 2) && ro.ItemInfo.Grade <= 6)
            {
                // End:0x103
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0x10D [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x103
        if(((ro.ItemInfo.ItemType <= 9) || ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0x103
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0x103
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0xF5 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xEB
        if(int(byte(ro.ItemInfo.ItemType)) == int(1))
        {
            // End:0xEB
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0xB2
                if(int(ro.ItemInfo.byModeItem) != 0)
                {
                    // [Explicit Continue]
                    goto J0xEB;
                }
                // End:0xEB
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xF5 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xEB
        if(int(byte(ro.ItemInfo.ItemType)) == int(2))
        {
            // End:0xEB
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0xB2
                if(int(ro.ItemInfo.byModeItem) != 0)
                {
                    // [Explicit Continue]
                    goto J0xEB;
                }
                // End:0xEB
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xF5 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xEB
        if(int(byte(ro.ItemInfo.ItemType)) == int(3))
        {
            // End:0xEB
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0xB2
                if(int(ro.ItemInfo.byModeItem) != 0)
                {
                    // [Explicit Continue]
                    goto J0xEB;
                }
                // End:0xEB
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xF5 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xEB
        if(int(byte(ro.ItemInfo.ItemType)) == int(4))
        {
            // End:0xEB
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0xB2
                if(int(ro.ItemInfo.byModeItem) != 0)
                {
                    // [Explicit Continue]
                    goto J0xEB;
                }
                // End:0xEB
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xF5 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xEB
        if(int(byte(ro.ItemInfo.ItemType)) == int(0))
        {
            // End:0xEB
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0xB2
                if(int(ro.ItemInfo.byModeItem) != 0)
                {
                    // [Explicit Continue]
                    goto J0xEB;
                }
                // End:0xEB
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
                {
                    AddRenderObject(ro);
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
    ShowAll(46);
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

function ShowMeleeWeapon()
{
    ShowItemOverOne(7, 18);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xDA [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xD0
        if((int(byte(ro.ItemInfo.ItemType)) == int(19)) && int(ro.ItemInfo.byModeItem) == 0)
        {
            // End:0xD0
            if(int(byte(ro.ItemInfo.SkillUseType)) == int(0))
            {
                // End:0xD0
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0xD3 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xC9
        if((int(byte(ro.ItemInfo.ItemType)) == int(19)) && int(ro.ItemInfo.byModeItem) == 0)
        {
            // End:0xC9
            if(ro.ItemInfo.SkillUseType == 1)
            {
                // End:0xC9
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

function ShowActiveSkillOnlyOne(int SkillType)
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0xDA [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xD0
        if(int(byte(ro.ItemInfo.ItemType)) == int(19))
        {
            // End:0xD0
            if(int(byte(ro.ItemInfo.SkillUseType)) == int(0))
            {
                // End:0xD0
                if(ro.ItemInfo.SkillType == SkillType)
                {
                    // End:0xD0
                    if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
                    {
                        AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x107 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xFD
        if((((int(byte(ro.ItemInfo.ItemType)) >= int(0)) && int(byte(ro.ItemInfo.ItemType)) >= int(6)) || int(byte(ro.ItemInfo.ItemType)) == int(19)) || int(byte(ro.ItemInfo.ItemType)) == int(28))
        {
            // End:0xFD
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0x145 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x13B
        if((((int(byte(ro.ItemInfo.ItemType)) >= int(0)) && int(byte(ro.ItemInfo.ItemType)) >= int(6)) || int(byte(ro.ItemInfo.ItemType)) == int(19)) || int(byte(ro.ItemInfo.ItemType)) == int(28))
        {
            // End:0x13B
            if((ro.ItemInfo.Grade >= 2) && ro.ItemInfo.Grade <= 6)
            {
                // End:0x13B
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0x145 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x13B
        if((((int(byte(ro.ItemInfo.ItemType)) >= int(0)) && int(byte(ro.ItemInfo.ItemType)) >= int(6)) || int(byte(ro.ItemInfo.ItemType)) == int(19)) || int(byte(ro.ItemInfo.ItemType)) == int(28))
        {
            // End:0x13B
            if((ro.ItemInfo.Grade < 2) || ro.ItemInfo.Grade > 6)
            {
                // End:0x13B
                if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0xE3 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xD9
        if(((ro.ItemInfo.AdType >= 1) && ro.ItemInfo.AdType < 10) || (ro.instanceInfo != none) && ro.instanceInfo.cashItemInfo != none)
        {
            // End:0xD9
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0x8F [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x85
        if(ro.ItemInfo.AdType == 2)
        {
            // End:0x85
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0x8F [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x85
        if(ro.ItemInfo.AdType == 3)
        {
            // End:0x85
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0x8F [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x85
        if(ro.ItemInfo.AdType == 4)
        {
            // End:0x85
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

    // End:0xAF [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xA5
        if((ro.ItemInfo.ItemType == 20) || ro.ItemInfo.ItemType >= 24)
        {
            // End:0xA5
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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
        if((ro.instanceInfo != none) && ro.instanceInfo.cashItemInfo != none)
        {
            AddRenderObject(ro);
        }
        i++;
        // [Loop Continue]
        goto J0x0D;
    }
    //return;    
}

function ShowAllETC()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x134 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x100
        if(((int(byte(ro.ItemInfo.ItemType)) >= int(27)) && int(byte(ro.ItemInfo.ItemType)) <= int(33)) || (int(byte(ro.ItemInfo.ItemType)) >= int(37)) && int(byte(ro.ItemInfo.ItemType)) <= int(46))
        {
            // End:0xFD
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
            {
                AddRenderObject(ro);
            }
            // [Explicit Continue]
            goto J0x12A;
        }
        // End:0x12A
        if(int(ro.ItemInfo.byModeItem) != 0)
        {
            AddRenderObject(ro);
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
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x128 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x11E
        if(((int(byte(ro.ItemInfo.ItemType)) >= int(27)) && int(byte(ro.ItemInfo.ItemType)) <= int(33)) || (int(byte(ro.ItemInfo.ItemType)) >= int(37)) && int(byte(ro.ItemInfo.ItemType)) <= int(46))
        {
            // End:0x11E
            if(((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13)) && int(ro.ItemInfo.byModeItem) == 0)
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

    // End:0x95 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x8B
        if(int(byte(ro.ItemInfo.ItemType)) == int(33))
        {
            // End:0x8B
            if((bShowOnlyInventory == false) || ro.instanceInfo.SlotPosition == int(13))
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

function ShowOnlyModeItem()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0D:

    // End:0x62 [Loop If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x58
        if(int(ro.ItemInfo.byModeItem) != 0)
        {
            AddRenderObject(ro);
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