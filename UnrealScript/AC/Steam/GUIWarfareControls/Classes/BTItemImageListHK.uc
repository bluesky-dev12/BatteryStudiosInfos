/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTItemImageListHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:46
 *
 *******************************************************************************/
class BTItemImageListHK extends BTAutoImageListHK
    dependson(BTAutoImageListHK)
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
        // End:0x82 [While If]
        if(i < DataPool.Length)
        {
            // End:0x78
            if(DataPool[i].ItemInfo.ShopDisplayOrder > ro.ItemInfo.ShopDisplayOrder)
            {
                DataPool.Insert(i, 1);
                DataPool[i] = ro;
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
    }
    // End:0xfe
    else
    {
        i = 0;
        J0x8c:
        // End:0xfe [While If]
        if(i < DataPool.Length)
        {
            // End:0xf4
            if(DataPool[i].ItemInfo.InvenDisplayOrder > ro.ItemInfo.InvenDisplayOrder)
            {
                DataPool.Insert(i, 1);
                DataPool[i] = ro;
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x8c;
        }
    }
    DataPool[DataPool.Length] = ro;
}

function SortByDisplayOrder()
{
    local int i, j;
    local BTROItemBoxHK temp;

    // End:0xd0
    if(bShopItem)
    {
        i = 0;
        J0x10:
        // End:0xcd [While If]
        if(i < DataPool.Length - 1)
        {
            j = i + 1;
            J0x31:
            // End:0xc3 [While If]
            if(j < DataPool.Length)
            {
                // End:0xb9
                if(DataPool[i].ItemInfo.ShopDisplayOrder > DataPool[j].ItemInfo.ShopDisplayOrder)
                {
                    temp = DataPool[i];
                    DataPool[i] = DataPool[j];
                    DataPool[j] = temp;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x31;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
    }
    // End:0x194
    else
    {
        i = 0;
        J0xd7:
        // End:0x194 [While If]
        if(i < DataPool.Length - 1)
        {
            j = i + 1;
            J0xf8:
            // End:0x18a [While If]
            if(j < DataPool.Length)
            {
                // End:0x180
                if(DataPool[i].ItemInfo.InvenDisplayOrder > DataPool[j].ItemInfo.InvenDisplayOrder)
                {
                    temp = DataPool[i];
                    DataPool[i] = DataPool[j];
                    DataPool[j] = temp;
                }
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0xf8;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xd7;
        }
    }
}

function GetItemFromItemID(int ItemID, out array<BTROItemBoxHK> Arr)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x73 [While If]
    if(i < DataPool.Length)
    {
        // End:0x69
        if(DataPool[i].ItemInfo.ItemID == ItemID)
        {
            Arr.Length = Arr.Length + 1;
            Arr[Arr.Length - 1] = DataPool[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function RemoveItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x57 [While If]
    if(i < DataPool.Length)
    {
        // End:0x4d
        if(UnresolvedNativeFunction_99(DataPool[i].instanceInfo.UniqueID, UniqueID))
        {
            DataPool.Remove(i, 1);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function BTROItemBoxHK FindPoolItem(BtrDouble UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x55 [While If]
    if(i < DataPool.Length)
    {
        // End:0x4b
        if(UnresolvedNativeFunction_99(DataPool[i].instanceInfo.UniqueID, UniqueID))
        {
            return DataPool[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function BTROItemBoxHK FindPoolSkillItem(int UniqueSkillID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x54 [While If]
    if(i < DataPool.Length)
    {
        // End:0x4a
        if(DataPool[i].instanceInfo.UniqueSkillID == UniqueSkillID)
        {
            return DataPool[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return none;
}

function AddShowItem(BtrDouble UniqueID)
{
    local int i;
    local BTROItemBoxHK ro;

    ro = FindPoolItem(UniqueID);
    // End:0x1e
    if(ro == none)
    {
        return;
    }
    i = 0;
    J0x25:
    // End:0x7a [While If]
    if(i < DataPool.Length)
    {
        // End:0x70
        if(UnresolvedNativeFunction_99(DataPool[i].instanceInfo.UniqueID, UniqueID))
        {
            AddRenderObject(DataPool[i]);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x25;
    }
}

function RemoveShowItem(BtrDouble UniqueID)
{
    local int i;
    local BTROItemBoxHK ro;

    i = 0;
    J0x07:
    // End:0x66 [While If]
    if(i < DataList.Length)
    {
        ro = BTROItemBoxHK(DataList[i]);
        // End:0x5c
        if(UnresolvedNativeFunction_99(ro.instanceInfo.UniqueID, UniqueID))
        {
            RemoveRenderObject(ro);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function ChangeShowItem(BtrDouble prevUniqueID, BtrDouble UniqueID)
{
    local int i;
    local BTROItemBoxHK ro;

    ro = FindPoolItem(UniqueID);
    i = 0;
    J0x18:
    // End:0x71 [While If]
    if(i < DataList.Length)
    {
        // End:0x67
        if(UnresolvedNativeFunction_99(BTROItemBoxHK(DataList[i]).instanceInfo.UniqueID, prevUniqueID))
        {
            ReplaceRenderObject(ro, i);
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x18;
    }
}

function ClearItem()
{
    DataPool.Length = 0;
    DataList.Length = 0;
    ImageList.Clear();
    SelectItemIndex = -1;
    LastSelectedItemIndex = -1;
}

function ResetItem()
{
    DataList.Length = 0;
    ImageList.Clear();
    SelectItemIndex = -1;
    LastSelectedItemIndex = -1;
}

function ShowAll(Engine.wGameManager.EItemType Max, optional Engine.wGameManager.EItemType Min)
{
    local BTROItemBoxHK ro;
    local int i, Count;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xbf [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xb5
        if(byte(ro.ItemInfo.ItemType) <= Max && byte(ro.ItemInfo.ItemType) >= Min)
        {
            // End:0xb5
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowOnlyOne(Engine.wGameManager.EItemType one)
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x96 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x8c
        if(byte(ro.ItemInfo.ItemType) == one)
        {
            // End:0x8c
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowWeaponWithEquip()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xec [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xe2
        if(ro.ItemInfo.ItemType <= 9 && ro.ItemInfo.ItemType >= 0 || ro.ItemInfo.ItemType == 20 || ro.ItemInfo.ItemType >= 24)
        {
            // End:0xe2
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowWeaponBootyWithEquip()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x10b [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x101
        if(ro.ItemInfo.ItemType <= 9 || ro.ItemInfo.ItemType == 20 || ro.ItemInfo.ItemType >= 24)
        {
            // End:0x101
            if(ro.ItemInfo.Grade >= 2 && ro.ItemInfo.Grade <= 6)
            {
                // End:0x101
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowWeaponNoBootyWithEquip()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x10b [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x101
        if(ro.ItemInfo.ItemType <= 9 || ro.ItemInfo.ItemType == 20 || ro.ItemInfo.ItemType >= 24)
        {
            // End:0x101
            if(ro.ItemInfo.Grade < 2 || ro.ItemInfo.Grade > 6)
            {
                // End:0x101
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowSMG()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xd1 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xc7
        if(byte(ro.ItemInfo.ItemType) == 1)
        {
            // End:0xc7
            if(ro.ItemInfo.Grade < 2 || ro.ItemInfo.Grade > 6)
            {
                // End:0xc7
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowSR()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xd1 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xc7
        if(byte(ro.ItemInfo.ItemType) == 2)
        {
            // End:0xc7
            if(ro.ItemInfo.Grade < 2 || ro.ItemInfo.Grade > 6)
            {
                // End:0xc7
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowShotgun()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xd1 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xc7
        if(byte(ro.ItemInfo.ItemType) == 3)
        {
            // End:0xc7
            if(ro.ItemInfo.Grade < 2 || ro.ItemInfo.Grade > 6)
            {
                // End:0xc7
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowMG()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xd1 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xc7
        if(byte(ro.ItemInfo.ItemType) == 4)
        {
            // End:0xc7
            if(ro.ItemInfo.Grade < 2 || ro.ItemInfo.Grade > 6)
            {
                // End:0xc7
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowAR()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xd1 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xc7
        if(byte(ro.ItemInfo.ItemType) == 0)
        {
            // End:0xc7
            if(ro.ItemInfo.Grade < 2 || ro.ItemInfo.Grade > 6)
            {
                // End:0xc7
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowItemAll()
{
    ShowAll(35);
}

function ShowWeaponAll()
{
    ShowAll(4);
}

function ShowMainWeapon()
{
    ShowAll(4);
}

function ShowSubWeapon()
{
    ShowOnlyOne(5);
}

function ShowHandThrowWeapon()
{
    ShowOnlyOne(6);
}

function ShowEquipItem()
{
    ShowAll(12, 8);
}

function ShowEquipHeadItem()
{
    ShowOnlyOne(8);
}

function ShowEquipFaceItem()
{
    ShowOnlyOne(9);
}

function ShowEquipAccessoryItem()
{
    ShowOnlyOne(10);
}

function ShowEquipSpCharItem()
{
    ShowOnlyOne(11);
}

function ShowSkillAll()
{
    ShowOnlyOne(19);
}

function ShowActiveSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xb0 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xa6
        if(byte(ro.ItemInfo.ItemType) == 19)
        {
            // End:0xa6
            if(ro.ItemInfo.SkillUseType == 0)
            {
                // End:0xa6
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowPassiveSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xb0 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xa6
        if(byte(ro.ItemInfo.ItemType) == 19)
        {
            // End:0xa6
            if(ro.ItemInfo.SkillUseType == 1)
            {
                // End:0xa6
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowWeaponWithSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x105 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xfb
        if(byte(ro.ItemInfo.ItemType) >= 0 && byte(ro.ItemInfo.ItemType) >= 6 || byte(ro.ItemInfo.ItemType) == 19 || byte(ro.ItemInfo.ItemType) == 28)
        {
            // End:0xfb
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowWeaponBootyWithSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x143 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x139
        if(byte(ro.ItemInfo.ItemType) >= 0 && byte(ro.ItemInfo.ItemType) >= 6 || byte(ro.ItemInfo.ItemType) == 19 || byte(ro.ItemInfo.ItemType) == 28)
        {
            // End:0x139
            if(ro.ItemInfo.Grade >= 2 && ro.ItemInfo.Grade <= 6)
            {
                // End:0x139
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowWeaponNoBootyWithSkill()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x143 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x139
        if(byte(ro.ItemInfo.ItemType) >= 0 && byte(ro.ItemInfo.ItemType) >= 6 || byte(ro.ItemInfo.ItemType) == 19 || byte(ro.ItemInfo.ItemType) == 28)
        {
            // End:0x139
            if(ro.ItemInfo.Grade < 2 || ro.ItemInfo.Grade > 6)
            {
                // End:0x139
                if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
                {
                    AddRenderObject(ro);
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowShopItemAll()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xe1 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xd7
        if(ro.ItemInfo.AdType >= 1 && ro.ItemInfo.AdType < 10 || ro.instanceInfo != none && ro.instanceInfo.CashItemInfo != none)
        {
            // End:0xd7
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowShopItemAdBest()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x8d [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x83
        if(ro.ItemInfo.AdType == 2)
        {
            // End:0x83
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowShopItemAdNew()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x8d [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x83
        if(ro.ItemInfo.AdType == 3)
        {
            // End:0x83
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowShopItemAdHot()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x8d [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x83
        if(ro.ItemInfo.AdType == 4)
        {
            // End:0x83
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowETCnPassive()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xad [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xa3
        if(ro.ItemInfo.ItemType == 20 || ro.ItemInfo.ItemType >= 24)
        {
            // End:0xa3
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowCashItem()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x76 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x6c
        if(ro.instanceInfo != none && ro.instanceInfo.CashItemInfo != none)
        {
            AddRenderObject(ro);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowEtc()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0xb9 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0xaf
        if(byte(ro.ItemInfo.ItemType) >= 27 && byte(ro.ItemInfo.ItemType) <= 35)
        {
            // End:0xaf
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowLVMark()
{
    local BTROItemBoxHK ro;
    local int i;

    ResetItem();
    i = 0;
    J0x0d:
    // End:0x93 [While If]
    if(i < DataPool.Length)
    {
        ro = DataPool[i];
        // End:0x89
        if(byte(ro.ItemInfo.ItemType) == 33)
        {
            // End:0x89
            if(bShowOnlyInventory == false || ro.instanceInfo.SlotPosition == 13)
            {
                AddRenderObject(ro);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0d;
    }
}

function ShowPassive()
{
    ShowOnlyOne(28);
}

defaultproperties
{
    bAcceptsInput=true
}