/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wItemBoxHK.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:3
 *	Properties:51
 *	Functions:11
 *
 *******************************************************************************/
class wItemBoxHK extends Object;

struct PaintInfo
{
    var int PaintingID;
    var string PaintingGroupID;
    var int PaintingNum;
    var int PaintingItemID;
    var float RepairCost;
    var int UI_Durability;
    var string strUI_Icon;
    var Texture UI_Icon;
    var Texture UI_Icon_Box;
};

struct PartInfo
{
    var int PartID;
    var string Name;
    var string Description;
    var int PointPrice;
    var int CashPrice;
    var int SightID;
    var Texture SightImage;
    var int SilencerID;
    var Texture SilencerImage;
    var int CamoID;
    var Texture CamoImage;
    var int PaintingID;
    var Texture PaintingImage;
    var int SkillID;
    var string SkillName;
    var Texture SkillImage;
    var Texture UI_Image;
    var int UI_DamageRange;
    var int ui_firesound;
    var string UI_Zoom1;
    var string UI_Zoom2;
    var int UI_Durability;
    var float display_3d_x;
    var float display_3d_y;
    var float display_3d_z;
    var float display_3d_rot_y;
    var float Bootyitem_3d_x;
    var float Bootyitem_3d_y;
    var float Bootyitem_3d_z;
    var float Bootyitem_3d_rot_y;
};

struct CustomPartInfo
{
    var int ItemID;
    var int PartID;
    var string Name;
    var string Description;
    var int PointPrice;
    var int CashPrice;
    var Texture PartImage;
    var Texture PartIconImage;
    var int SkillID;
    var string SkillName;
    var Texture SkillImage;
    var int UI_DamageRange;
    var int ui_firesound;
    var string UI_Zoom1;
    var string UI_Zoom2;
    var int UI_Durability;
    var int ui_damage;
    var int ui_spread;
    var int ui_view_kick;
    var int ui_rate_of_fire;
    var int ui_move;
    var int ui_range;
};

var int ItemID;
var int ItemType;
var string ItemName;
var string ItemDescription;
var int ResourceID;
var int ShopDisplayOrder;
var int InvenDisplayOrder;
var Texture ItemImage;
var int Grade;
var int EquipLevel;
var int EquipTeam;
var Texture EquipLevelImage;
var int EquipSlot;
var int CostType;
var int PurchaseType;
var bool bOverlap;
var bool bRepair;
var bool bSellAuction;
var int AuctionMaxPrice;
var int AuctionMinPrice;
var bool bBuyShop;
var bool bSellShop;
var int Period[5];
var int PointPrice[5];
var int CashPrice[5];
var bool bParts;
var string PartGroupID;
var array<PartInfo> PartGroupList;
var array<CustomPartInfo> PartAllList;
var array<int> PartSightIndices;
var array<int> PartSilencerIndices;
var array<int> PartBarrelIndices;
var array<int> PartGusstockIndices;
var Vector vDisplay_3d;
var float fDisplay_3d_rot_y;
var Vector vBootyitem_3d;
var float fBootyitem_3d_rot_y;
var bool bPaints;
var string PaintGroupID;
var array<PaintInfo> PaintGroupList;
var bool bSkill;
var int SkillUseType;
var int AdType;
var int start_ammo;
var int clip_size;
var int ui_damage;
var int ui_spread;
var int ui_view_kick;
var int ui_rate_of_fire;
var int ui_move;
var int ui_range;

function SortPartList()
{
    local int i;

    i = 0;
    J0x07:
    // End:0xc0 [While If]
    if(i < PartAllList.Length)
    {
        // End:0x46
        if(PartAllList[i].PartID >= 1 << 24)
        {
            PartGusstockIndices[PartGusstockIndices.Length] = i;
        }
        // End:0xb6
        else
        {
            // End:0x75
            if(PartAllList[i].PartID >= 1 << 17)
            {
                PartSilencerIndices[PartSilencerIndices.Length] = i;
            }
            // End:0xb6
            else
            {
                // End:0xa4
                if(PartAllList[i].PartID >= 1 << 10)
                {
                    PartBarrelIndices[PartBarrelIndices.Length] = i;
                }
                // End:0xb6
                else
                {
                    PartSightIndices[PartSightIndices.Length] = i;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function int FindPartGroupIndex(int PartID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x41 [While If]
    if(i < PartGroupList.Length)
    {
        // End:0x37
        if(PartGroupList[i].PartID == PartID)
        {
            return i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function string GetPartName(int PartID)
{
    local int Index;

    Index = FindPartGroupIndex(PartID);
    // End:0x23
    if(Index == -1)
    {
        return "";
    }
    return PartGroupList[Index].Name;
}

function int GetUIRange(int PartID)
{
    local int i, iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iResult;

    iResult = ui_range;
    iSightPartID = PartID & 1023;
    iBarrelPartID = PartID & 130048;
    iSilencerPartID = PartID & 16646144;
    iGunstockPartID = PartID & 2130706432;
    i = 0;
    J0x5a:
    // End:0x146 [While If]
    if(i < self.PartAllList.Length)
    {
        // End:0xa3
        if(PartAllList[i].PartID == iSightPartID)
        {
            iResult += PartAllList[i].ui_range;
        }
        // End:0x13c
        else
        {
            // End:0xd7
            if(PartAllList[i].PartID == iBarrelPartID)
            {
                iResult += PartAllList[i].ui_range;
            }
            // End:0x13c
            else
            {
                // End:0x10b
                if(PartAllList[i].PartID == iSilencerPartID)
                {
                    iResult += PartAllList[i].ui_range;
                }
                // End:0x13c
                else
                {
                    // End:0x13c
                    if(PartAllList[i].PartID == iGunstockPartID)
                    {
                        iResult += PartAllList[i].ui_range;
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    return iResult;
}

function int GetUIMove(int PartID)
{
    local int i, iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iResult;

    iResult = ui_move;
    iSightPartID = PartID & 1023;
    iBarrelPartID = PartID & 130048;
    iSilencerPartID = PartID & 16646144;
    iGunstockPartID = PartID & 2130706432;
    i = 0;
    J0x5a:
    // End:0x146 [While If]
    if(i < self.PartAllList.Length)
    {
        // End:0xa3
        if(PartAllList[i].PartID == iSightPartID)
        {
            iResult += PartAllList[i].ui_move;
        }
        // End:0x13c
        else
        {
            // End:0xd7
            if(PartAllList[i].PartID == iBarrelPartID)
            {
                iResult += PartAllList[i].ui_move;
            }
            // End:0x13c
            else
            {
                // End:0x10b
                if(PartAllList[i].PartID == iSilencerPartID)
                {
                    iResult += PartAllList[i].ui_move;
                }
                // End:0x13c
                else
                {
                    // End:0x13c
                    if(PartAllList[i].PartID == iGunstockPartID)
                    {
                        iResult += PartAllList[i].ui_move;
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    return iResult;
}

function int GetUIRateOfFire(int PartID)
{
    local int i, iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iResult;

    iResult = ui_rate_of_fire;
    iSightPartID = PartID & 1023;
    iBarrelPartID = PartID & 130048;
    iSilencerPartID = PartID & 16646144;
    iGunstockPartID = PartID & 2130706432;
    i = 0;
    J0x5a:
    // End:0x146 [While If]
    if(i < self.PartAllList.Length)
    {
        // End:0xa3
        if(PartAllList[i].PartID == iSightPartID)
        {
            iResult += PartAllList[i].ui_rate_of_fire;
        }
        // End:0x13c
        else
        {
            // End:0xd7
            if(PartAllList[i].PartID == iBarrelPartID)
            {
                iResult += PartAllList[i].ui_rate_of_fire;
            }
            // End:0x13c
            else
            {
                // End:0x10b
                if(PartAllList[i].PartID == iSilencerPartID)
                {
                    iResult += PartAllList[i].ui_rate_of_fire;
                }
                // End:0x13c
                else
                {
                    // End:0x13c
                    if(PartAllList[i].PartID == iGunstockPartID)
                    {
                        iResult += PartAllList[i].ui_rate_of_fire;
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    return iResult;
}

function int GetUIViewKick(int PartID)
{
    local int i, iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iResult;

    iResult = ui_view_kick;
    iSightPartID = PartID & 1023;
    iBarrelPartID = PartID & 130048;
    iSilencerPartID = PartID & 16646144;
    iGunstockPartID = PartID & 2130706432;
    i = 0;
    J0x5a:
    // End:0x146 [While If]
    if(i < self.PartAllList.Length)
    {
        // End:0xa3
        if(PartAllList[i].PartID == iSightPartID)
        {
            iResult += PartAllList[i].ui_view_kick;
        }
        // End:0x13c
        else
        {
            // End:0xd7
            if(PartAllList[i].PartID == iBarrelPartID)
            {
                iResult += PartAllList[i].ui_view_kick;
            }
            // End:0x13c
            else
            {
                // End:0x10b
                if(PartAllList[i].PartID == iSilencerPartID)
                {
                    iResult += PartAllList[i].ui_view_kick;
                }
                // End:0x13c
                else
                {
                    // End:0x13c
                    if(PartAllList[i].PartID == iGunstockPartID)
                    {
                        iResult += PartAllList[i].ui_view_kick;
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    return iResult;
}

function int GetUISpread(int PartID)
{
    local int i, iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iResult;

    iResult = ui_spread;
    iSightPartID = PartID & 1023;
    iBarrelPartID = PartID & 130048;
    iSilencerPartID = PartID & 16646144;
    iGunstockPartID = PartID & 2130706432;
    i = 0;
    J0x5a:
    // End:0x146 [While If]
    if(i < self.PartAllList.Length)
    {
        // End:0xa3
        if(PartAllList[i].PartID == iSightPartID)
        {
            iResult += PartAllList[i].ui_spread;
        }
        // End:0x13c
        else
        {
            // End:0xd7
            if(PartAllList[i].PartID == iBarrelPartID)
            {
                iResult += PartAllList[i].ui_spread;
            }
            // End:0x13c
            else
            {
                // End:0x10b
                if(PartAllList[i].PartID == iSilencerPartID)
                {
                    iResult += PartAllList[i].ui_spread;
                }
                // End:0x13c
                else
                {
                    // End:0x13c
                    if(PartAllList[i].PartID == iGunstockPartID)
                    {
                        iResult += PartAllList[i].ui_spread;
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    return iResult;
}

function int GetUIDamage(int PartID)
{
    local int i, iSightPartID, iBarrelPartID, iSilencerPartID, iGunstockPartID, iResult;

    iResult = ui_damage;
    iSightPartID = PartID & 1023;
    iBarrelPartID = PartID & 130048;
    iSilencerPartID = PartID & 16646144;
    iGunstockPartID = PartID & 2130706432;
    i = 0;
    J0x5a:
    // End:0x146 [While If]
    if(i < self.PartAllList.Length)
    {
        // End:0xa3
        if(PartAllList[i].PartID == iSightPartID)
        {
            iResult += PartAllList[i].ui_damage;
        }
        // End:0x13c
        else
        {
            // End:0xd7
            if(PartAllList[i].PartID == iBarrelPartID)
            {
                iResult += PartAllList[i].ui_damage;
            }
            // End:0x13c
            else
            {
                // End:0x10b
                if(PartAllList[i].PartID == iSilencerPartID)
                {
                    iResult += PartAllList[i].ui_damage;
                }
                // End:0x13c
                else
                {
                    // End:0x13c
                    if(PartAllList[i].PartID == iGunstockPartID)
                    {
                        iResult += PartAllList[i].ui_damage;
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    return iResult;
}

function string GetPartSkillName(int PartID)
{
    local int i;
    local string strResult;

    i = 0;
    J0x07:
    // End:0xb9 [While If]
    if(i < self.PartAllList.Length)
    {
        // End:0xaf
        if(PartAllList[i].PartID & PartID == PartAllList[i].PartID && PartAllList[i].SkillID != 0)
        {
            // End:0x8c
            if(strResult == "")
            {
                strResult = strResult $ PartAllList[i].SkillName;
            }
            // End:0xaf
            else
            {
                strResult = strResult $ ", " $ PartAllList[i].SkillName;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return strResult;
}

function bool IsCashItem()
{
    return Grade == 14;
}
