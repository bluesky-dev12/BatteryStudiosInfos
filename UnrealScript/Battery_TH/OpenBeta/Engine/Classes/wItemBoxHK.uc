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

function int FindPartGroupIndex(int PartID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x41 [Loop If]
    if(i < PartGroupList.Length)
    {
        // End:0x37
        if(PartGroupList[i].PartID == PartID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
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
    //return;    
}

function string GetPartSkillName(int PartID)
{
    local int Index;

    Index = FindPartGroupIndex(PartID);
    // End:0x23
    if(Index == -1)
    {
        return "";
    }
    return PartGroupList[Index].SkillName;
    //return;    
}
