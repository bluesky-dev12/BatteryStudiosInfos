class BTROItemBoxHK extends RenderObject;

enum EInvenState
{
    E_IB_INVEN,                     // 0
    E_IB_INVEN_BIG,                 // 1
    E_IB_REPAIR,                    // 2
    E_IB_WAREHOUSE,                 // 3
    E_IB_WAREHOUSE_CASH,            // 4
    E_IB_WAREHOUSE_SKILL,           // 5
    E_IB_SHOP,                      // 6
    E_IB_SHOP_BIG,                  // 7
    E_IB_AUCTION,                   // 8
    E_IB_AUCTION_BIG,               // 9
    E_IB_MAIL,                      // 10
    E_IB_POINTBOX,                  // 11
    E_IB_ITEMBOX,                   // 12
    E_IB_PROMOTION,                 // 13
    E_IB_DURABILITY_WARNING,        // 14
    E_IB_EXPIRED_WARNING,           // 15
    E_IB_SHOP_CASH,                 // 16
    E_IB_SHOP_BIG_CASH,             // 17
    E_IB_SHOP_BUY_TERM,             // 18
    E_IB_EQUIP_ITEM,                // 19
    E_IB_REMODEL_SHOP,              // 20
    E_IB_REMODEL_INVEN,             // 21
    E_IB_CAPSULE_INCLUDE,           // 22
    E_IB_CAPSULE,                   // 23
    E_IB_QUICKSLOT                  // 24
};

var wMatchMaker MM;
var wGameManager GameMgr;
var bool bUseCache;
var int RibbonState;
var bool bSelect;
var bool bStartAni;
var float RollAniStep;
var int RollCount;
var int RollMaxCount;
var float RollStartX;
var bool bScaleAni;
var float ScaleAniStep;
var float ScaleStartX;
var bool bDragMode;
var bool bRedAuction;
var bool bRedState;
var bool bNoReasonRedState;
var bool bDisplayPart;
var Text PartName;
var string PartSkillName;
var Image PartImage;
var Image PaintImage;
var wItemBoxHK ItemInfo;
var wItemBoxInstanceHK instanceInfo;
var string strItemName;
var Text ItemName;
var Text GradeName;
var Text UnderTextForm;
var Text UnderExtraTextForm;
var Text DisCountPriceTextForm;
var Image DisCountStrikeImg;
var Image ItemImage;
var Image EquipLevelImage;
var BTROExpBarHK ItemDurability;
var Image RepairIconImage;
var Image CashIconImage;
var Image PointIconImage;
var Image Img_Selected;
var Image Img_MouseOn;
var Image Img_Focus;
var Image Img_Normal;
var bool MouseOnWithNormal;
var bool bDotSight;
var bool bScope;
var bool bSilencer;
var bool bSkill;
var bool bBarrel;
var bool bGunstock;
var Image dotImg;
var Image scoImg;
var Image silImg;
var Image skiImg;
var Image BarrelImg;
var Image GunstockImg;
var bool bBackgroundInfo;
var bool bShowDurability;
var bool bShowPrice;
var bool bShowDamage;
var bool bShowEquipLevel;
var bool bShowRestrictionLevel;
var bool bShowRestrictionPrice;
var bool bShowRestrictionDurability;
var bool bShowNotShopItem;
var bool bShowPCBangLevel;
var bool bShowLeftCount;
var bool bShowLeftSellDate;
var bool bShowCanRepair;
var bool bShowCanBuy;
var BTItemCommonInfoHK MyData;
var Color colCurrentUntilTime;
var string strCurrentUntilTime;
var localized string strLeftCount;
var localized string strCannotRepair;
var localized string strGradeBase;
var localized string strGradeShop;
var localized string strGradeCommon;
var localized string strGradeNormal;
var localized string strGradeHigh;
var localized string strGradeRare;
var localized string strGradeLegend;
var localized string strGradePCBang;
var localized string strGradeBaseS;
var localized string strGradeShopS;
var localized string strGradeCommonS;
var localized string strGradeNormalS;
var localized string strGradeHighS;
var localized string strGradeRareS;
var localized string strGradeLegendS;
var localized string strGradePCBangS;
var localized string strDurability;
var localized string strDamage;
var localized string strLeftTime[6];
var localized string strPoint;
var localized string strCash;
var localized string strOneDay;
var localized string strCannotBuy;
var localized string strDurabilityX;
var localized string strCannotExpired;
var localized string strOnlyPCoin;
var localized string strItemCount;
var int RRIndex;
var bool bRegisterQuickSlot;
var localized string strRestrictionReason[8];
var localized string strActiveSkillToolTip[5];
var bool bShowModifyIcon;
var FloatBox offset;
var FloatBox fbItemName;
var bool CheckScrollItemName;
var BTScrollString scrollString;
var BTROItemBoxHK.EInvenState InvenState;

function ChangeState(BTROItemBoxHK.EInvenState estate)
{
    InvenState = estate;
    switch(estate)
    {
        // End:0x17
        case 0:
        // End:0x67
        case 24:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0xB7
        case 1:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x107
        case 2:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = true;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x157
        case 4:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x1A7
        case 3:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = true;
            bShowNotShopItem = false;
            bShowPCBangLevel = true;
            // End:0x742
            break;
        // End:0x1F7
        case 5:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = true;
            // End:0x742
            break;
        // End:0x24F
        case 6:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            bShowLeftSellDate = true;
            // End:0x742
            break;
        // End:0x2A7
        case 16:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            bShowLeftSellDate = true;
            // End:0x742
            break;
        // End:0x2FF
        case 17:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            bShowLeftSellDate = true;
            // End:0x742
            break;
        // End:0x357
        case 7:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            bShowLeftSellDate = true;
            // End:0x742
            break;
        // End:0x3A7
        case 8:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = true;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x3EF
        case 9:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x43F
        case 10:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x48F
        case 11:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x4DF
        case 12:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x52F
        case 13:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x587
        case 14:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowCanRepair = true;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x5D7
        case 15:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            bShowCanBuy = false;
            bShowNotShopItem = true;
            // End:0x742
            break;
        // End:0x637
        case 18:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowCanBuy = false;
            bBackgroundInfo = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x687
        case 19:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x6DF
        case 20:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            bShowLeftSellDate = true;
            // End:0x742
            break;
        // End:0x72F
        case 21:
            bShowDurability = true;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x742
            break;
        // End:0x73F
        case 22:
            bShowDurability = true;
            // End:0x742
            break;
        // End:0xFFFF
        default:
            break;
    }
    switch(estate)
    {
        // End:0x74E
        case 3:
        // End:0x79E
        case 5:
            Img_Selected = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_Sel;
            Img_MouseOn = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_on;
            Img_Focus.Image = none;
            Img_Normal = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_n;
            // End:0x90E
            break;
        // End:0x7A3
        case 6:
        // End:0x7F3
        case 16:
            Img_Selected.Image = none;
            Img_MouseOn = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_on;
            Img_Focus = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_Sel;
            Img_Normal = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_n;
            // End:0x90E
            break;
        // End:0x843
        case 20:
            Img_Selected.Image = none;
            Img_MouseOn = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_List_BG_on;
            Img_Focus = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_List_BG_Focus;
            Img_Normal = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_List_BG_n;
            // End:0x90E
            break;
        // End:0x87B
        case 21:
            Img_Selected.Image = none;
            Img_MouseOn.Image = none;
            Img_Focus.Image = none;
            Img_Normal.Image = none;
            // End:0x90E
            break;
        // End:0x8CB
        case 22:
            Img_Selected.Image = none;
            Img_MouseOn = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_Quest_Slot_Reward_MouseOver;
            Img_Focus.Image = none;
            Img_Normal = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_List_BG_n;
            MouseOnWithNormal = true;
            // End:0x90E
            break;
        // End:0x90B
        case 23:
            Img_Selected.Image = none;
            Img_MouseOn = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_Quest_Slot_Reward_MouseOver;
            Img_Focus.Image = none;
            Img_Normal.Image = none;
            // End:0x90E
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function Init()
{
    ItemInfo = none;
    instanceInfo = none;
    bDotSight = false;
    bScope = false;
    bSilencer = false;
    bBarrel = false;
    bGunstock = false;
    bSkill = false;
    bBackgroundInfo = false;
    ItemDurability = new Class'GUIWarfareControls_Decompressed.BTROExpBarHK';
    ItemDurability.Init();
    ItemDurability.back.Image = none;
    ItemDurability.Gauge = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_gauge;
    ItemDurability.PercTextPadding[3] = 2.0000000;
    UnderTextForm = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    UnderExtraTextForm = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 3, "");
    DisCountPriceTextForm = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    DisCountStrikeImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Img_DisCountLine;
    RepairIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_repair_non;
    CashIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_cash;
    PointIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_point;
    Img_Selected = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli;
    Img_MouseOn = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_on;
    Img_Focus = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli;
    Img_Normal.Image = none;
    scrollString = new Class'GUIWarfareControls_Decompressed.BTScrollString';
    scrollString.InitValue();
    //return;    
}

function Color GradeToColor(int Grade, optional bool bDurabilityX)
{
    local Color TextColor;

    switch(Grade)
    {
        // End:0x44
        case 1:
            // End:0x2C
            if(bDurabilityX)
            {
                TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeShop_DurabilityX();                
            }
            else
            {
                TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeShop();
            }
            // End:0x10D
            break;
        // End:0x61
        case 2:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeCommon();
            // End:0x10D
            break;
        // End:0x7E
        case 3:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeNormal();
            // End:0x10D
            break;
        // End:0x9B
        case 4:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeHigh();
            // End:0x10D
            break;
        // End:0xB8
        case 5:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeRare();
            // End:0x10D
            break;
        // End:0xD5
        case 6:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeLegend();
            // End:0x10D
            break;
        // End:0xF2
        case 7:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradePCBang();
            // End:0x10D
            break;
        // End:0xFFFF
        default:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeBase();
            // End:0x10D
            break;
            break;
    }
    return TextColor;
    //return;    
}

function string GradeToText(int Grade)
{
    switch(Grade)
    {
        // End:0x11
        case 1:
            return strGradeShop;
        // End:0x1C
        case 2:
            return strGradeCommon;
        // End:0x27
        case 3:
            return strGradeNormal;
        // End:0x32
        case 4:
            return strGradeHigh;
        // End:0x3D
        case 5:
            return strGradeRare;
        // End:0x48
        case 6:
            return strGradeLegend;
        // End:0x53
        case 7:
            return strGradePCBang;
        // End:0xFFFF
        default:
            return strGradeBase;
            break;
    }
    //return;    
}

function string GradeToShortText(int Grade)
{
    switch(Grade)
    {
        // End:0x11
        case 1:
            return strGradeShopS;
        // End:0x1C
        case 2:
            return strGradeCommonS;
        // End:0x27
        case 3:
            return strGradeNormalS;
        // End:0x32
        case 4:
            return strGradeHighS;
        // End:0x3D
        case 5:
            return strGradeRareS;
        // End:0x48
        case 6:
            return strGradeLegendS;
        // End:0x53
        case 7:
            return strGradePCBangS;
        // End:0xFFFF
        default:
            return strGradeBaseS;
            break;
    }
    //return;    
}

function UpdateTime(BtrDouble D)
{
    local BtrTime t, t2;

    // End:0x93
    if(((ItemInfo != none) && (ItemInfo.CostType == 1) || ItemInfo.CostType == 4) && instanceInfo != none)
    {
        BtrDoubleToBtrTime(instanceInfo.UntilTime, t);
        BtrDoubleToBtrTime(D, t2);
        instanceInfo.LeftTime = BtrTimeSubstract(t, t2);
        Update();
    }
    //return;    
}

function bool IsEmpty()
{
    return ItemInfo == none;
    //return;    
}

function Update(optional Canvas C, optional float Delta)
{
    local int i, iSightPartID, iSilencerPartID, iBarrelPartID, iGunstockPartID, PartIndex;

    local wWeaponCustomPartsParam wcpp;
    local wSkillBaseParam cSkillParam;
    local Texture tempSkillImage;
    local wPaintGroupParam pgp;

    tempSkillImage = Texture(DynamicLoadObject("Warfare_GP_UI_UI.Store.icon_rem_skil", Class'Engine.Texture'));
    // End:0x53
    if(IsEmpty())
    {
        ItemImage.Image = none;
        return;
    }
    GradeName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    GradeName.Text = GradeToText(ItemInfo.Grade);
    GradeName.DrawColor = GradeToColor(ItemInfo.Grade, ItemInfo.CostType == 2);
    // End:0x198
    if(((ItemInfo.IsCashItem() == true) && instanceInfo != none) && instanceInfo.cashItemInfo != none)
    {
        // End:0x14A
        if((instanceInfo != none) && instanceInfo.cashItemInfo != none)
        {
            ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, instanceInfo.cashItemInfo.WZItemName);            
        }
        else
        {
            ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, ItemInfo.ItemName);
            ItemName.Text = "no registered unit item";
        }        
    }
    else
    {
        ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, ItemInfo.ItemName);
    }
    // End:0x210
    if(self.bBackgroundInfo)
    {
        ItemName.FontSize = 12;
        ItemName.FontDrawType = 0;
        ItemName.DrawColor = Class'Engine.Canvas'.static.MakeColor(byte(255), 192, 0, byte(255));        
    }
    else
    {
        ItemName.DrawColor = GradeName.DrawColor;
    }
    // End:0x2B6
    if((instanceInfo != none) && ItemInfo.bOverlap == true)
    {
        // End:0x273
        if(instanceInfo.OverlapCount == 0)
        {
            ItemName.Text = ItemName.Text;            
        }
        else
        {
            // End:0x2B6
            if(ItemInfo.CostType == 3)
            {
                ItemName.Text = (ItemName.Text $ " x ") $ string(instanceInfo.OverlapCount);
            }
        }
    }
    strItemName = ItemName.Text;
    ItemImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 1, none);
    ItemImage.Image = ItemInfo.ItemImage;
    PartName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    PartImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 1, none);
    PaintImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 57, 28, none);
    bSkill = false;
    // End:0x535
    if(instanceInfo != none)
    {
        i = 0;
        J0x368:

        // End:0x448 [Loop If]
        if(i < ItemInfo.PartAllList.Length)
        {
            // End:0x43E
            if(ItemInfo.PartAllList[i].PartID == instanceInfo.PartID)
            {
                PartName.Text = ItemInfo.PartAllList[i].Name;
                PartImage.Image = ItemInfo.PartAllList[i].PartImage;
                // End:0x43B
                if(ItemInfo.PartAllList[i].SkillID != 0)
                {
                    bSkill = true;
                    PartSkillName = ItemInfo.PartAllList[i].SkillName;
                }
                // [Explicit Break]
                goto J0x448;
            }
            i++;
            // [Loop Continue]
            goto J0x368;
        }
        J0x448:

        // End:0x535
        if(instanceInfo.PaintID != 0)
        {
            i = 0;
            J0x463:

            // End:0x4D9 [Loop If]
            if(i < ItemInfo.PaintGroupList.Length)
            {
                // End:0x4CF
                if(ItemInfo.PaintGroupList[i].PaintingItemID == instanceInfo.PaintID)
                {
                    PaintImage.Image = ItemInfo.PaintGroupList[i].UI_Icon_Box;
                    // [Explicit Break]
                    goto J0x4D9;
                }
                ++i;
                // [Loop Continue]
                goto J0x463;
            }
            J0x4D9:

            // End:0x535
            if(PaintImage.Image == none)
            {
                pgp = GameMgr.GetPaintGroupParam(instanceInfo.PaintID);
                PaintImage.Image = Texture(DynamicLoadObject(pgp.strUI_Icon, Class'Engine.Texture'));
            }
        }
    }
    bDotSight = false;
    bScope = false;
    bSilencer = false;
    bSkill = false;
    bBarrel = false;
    bGunstock = false;
    // End:0xDB7
    if(instanceInfo != none)
    {
        iSightPartID = instanceInfo.PartID & 1023;
        iBarrelPartID = instanceInfo.PartID & 130048;
        iSilencerPartID = instanceInfo.PartID & 16646144;
        iGunstockPartID = instanceInfo.PartID & 2130706432;
        // End:0x81A
        if(iSightPartID > 1)
        {
            // End:0x6AE
            if(ItemInfo.PartSightIndices.Length == 0)
            {
                wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
                // End:0x6AE
                if((wcpp != none) && wcpp.iItemID > 0)
                {
                    // End:0x6AE
                    if(wcpp.iSkillID != 0)
                    {
                        cSkillParam = GameMgr.GetSkillParam(wcpp.iSkillID);
                        bSkill = true;
                        PartSkillName = cSkillParam.strName;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = tempSkillImage;
                    }
                }
            }
            i = 0;
            J0x6B5:

            // End:0x81A [Loop If]
            if(i < ItemInfo.PartSightIndices.Length)
            {
                PartIndex = ItemInfo.PartSightIndices[i];
                // End:0x810
                if(iSightPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    // End:0x76E
                    if(GameMgr.CheckSRItem(ItemInfo.ItemType))
                    {
                        bScope = true;
                        scoImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_sco5;
                        scoImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;                        
                    }
                    else
                    {
                        bDotSight = true;
                        dotImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_dotd;
                        dotImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    }
                    // End:0x80D
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                    // [Explicit Break]
                    goto J0x81A;
                }
                i++;
                // [Loop Continue]
                goto J0x6B5;
            }
        }
        J0x81A:

        // End:0x9F9
        if(iSilencerPartID > (1 << 17))
        {
            // End:0x8F0
            if(ItemInfo.PartSilencerIndices.Length == 0)
            {
                wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
                // End:0x8F0
                if((wcpp != none) && wcpp.iItemID > 0)
                {
                    // End:0x8F0
                    if(wcpp.iSkillID != 0)
                    {
                        cSkillParam = GameMgr.GetSkillParam(wcpp.iSkillID);
                        bSkill = true;
                        PartSkillName = cSkillParam.strName;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = tempSkillImage;
                    }
                }
            }
            i = 0;
            J0x8F7:

            // End:0x9F9 [Loop If]
            if(i < ItemInfo.PartSilencerIndices.Length)
            {
                PartIndex = ItemInfo.PartSilencerIndices[i];
                // End:0x9EF
                if(iSilencerPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    bSilencer = true;
                    silImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_siln;
                    silImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    // End:0x9EC
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                    // [Explicit Break]
                    goto J0x9F9;
                }
                i++;
                // [Loop Continue]
                goto J0x8F7;
            }
        }
        J0x9F9:

        // End:0xBD8
        if(iBarrelPartID > (1 << 10))
        {
            // End:0xACF
            if(ItemInfo.PartBarrelIndices.Length == 0)
            {
                wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iBarrelPartID);
                // End:0xACF
                if((wcpp != none) && wcpp.iItemID > 0)
                {
                    // End:0xACF
                    if(wcpp.iSkillID != 0)
                    {
                        cSkillParam = GameMgr.GetSkillParam(wcpp.iSkillID);
                        bSkill = true;
                        PartSkillName = cSkillParam.strName;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = tempSkillImage;
                    }
                }
            }
            i = 0;
            J0xAD6:

            // End:0xBD8 [Loop If]
            if(i < ItemInfo.PartBarrelIndices.Length)
            {
                PartIndex = ItemInfo.PartBarrelIndices[i];
                // End:0xBCE
                if(iBarrelPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    bBarrel = true;
                    BarrelImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_barrel;
                    BarrelImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    // End:0xBCB
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                    // [Explicit Break]
                    goto J0xBD8;
                }
                i++;
                // [Loop Continue]
                goto J0xAD6;
            }
        }
        J0xBD8:

        // End:0xDB7
        if(iGunstockPartID > (1 << 24))
        {
            // End:0xCAE
            if(ItemInfo.PartGusstockIndices.Length == 0)
            {
                wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iGunstockPartID);
                // End:0xCAE
                if((wcpp != none) && wcpp.iItemID > 0)
                {
                    // End:0xCAE
                    if(wcpp.iSkillID != 0)
                    {
                        cSkillParam = GameMgr.GetSkillParam(wcpp.iSkillID);
                        bSkill = true;
                        PartSkillName = cSkillParam.strName;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = tempSkillImage;
                    }
                }
            }
            i = 0;
            J0xCB5:

            // End:0xDB7 [Loop If]
            if(i < ItemInfo.PartGusstockIndices.Length)
            {
                PartIndex = ItemInfo.PartGusstockIndices[i];
                // End:0xDAD
                if(iGunstockPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    bGunstock = true;
                    GunstockImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_gunstock;
                    GunstockImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    // End:0xDAA
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                    // [Explicit Break]
                    goto J0xDB7;
                }
                i++;
                // [Loop Continue]
                goto J0xCB5;
            }
        }
    }
    J0xDB7:

    // End:0xE1F
    if(instanceInfo != none)
    {
        ItemDurability.SetData(instanceInfo.Durability, 100000);
        // End:0xE1F
        if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
        {
            GetExtraItemString(strCurrentUntilTime, colCurrentUntilTime);
        }
    }
    EquipLevelImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 28, ItemInfo.EquipLevelImage);
    // End:0xE76
    if(GameMgr != none)
    {
        GameMgr.GetLevelImage(ItemInfo.EquipLevel, 0, EquipLevelImage);
    }
    bStartAni = true;
    RollCount = 0;
    RollMaxCount = 15;
    RollAniStep = 1.0000000;
    RollStartX = -1.0000000;
    bScaleAni = false;
    ScaleAniStep = 0.1000000;
    ScaleStartX = 5.0000000;
    //return;    
}

function bool RenderModifyIcon(Canvas C, int Sort, optional FloatBox offset)
{
    local FloatBox fb;

    fb.X1 = AWinPos.X2 - float(24);
    fb.Y1 = AWinPos.Y1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y2 = AWinPos.Y1 + float(24);
    // End:0xD7
    if(offset.X1 > float(0))
    {
        fb.X1 = offset.X1 + float(1);
        fb.Y1 = offset.Y1;
        fb.X2 = offset.X2;
        fb.Y2 = offset.Y2;
    }
    // End:0x14F
    if(bDotSight)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, dotImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24 * Sort);
        fb.X2 -= float(24 * Sort);
    }
    // End:0x1C7
    if(bScope)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, scoImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24 * Sort);
        fb.X2 -= float(24 * Sort);
    }
    // End:0x23F
    if(bSilencer)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, silImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24 * Sort);
        fb.X2 -= float(24 * Sort);
    }
    // End:0x2B7
    if(bBarrel)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, BarrelImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24 * Sort);
        fb.X2 -= float(24 * Sort);
    }
    // End:0x32F
    if(bGunstock)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, GunstockImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24 * Sort);
        fb.X2 -= float(24 * Sort);
    }
    // End:0x3A7
    if(bSkill)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, skiImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24 * Sort);
        fb.X2 -= float(24 * Sort);
    }
    return true;
    //return;    
}

function bool Render(Canvas C, optional float Delta)
{
    local bool bRedPoint, bRedCash, bRedRepair, bRedLevel, bRedCanBuy, IsDiscount;

    local int ReasonCount;
    local float XL, YL;
    local FloatBox fb, fbItemImage, fbPrice, fbDiscountPrice;
    local string AppendStr;
    local Image PointNCashIcon;
    local string culledItemName;
    local float stringX, stringY;
    local bool bAppendPrice;

    // End:0x13
    if(super.Render(C) == false)
    {
        return true;
    }
    C.Style = 5;
    // End:0xE8
    if(bDragMode)
    {
        fb.X1 = AWinPos.X1 + float(2);
        fb.X2 = AWinPos.X2 + float(2);
        fb.Y1 = (AWinPos.Y1 + float(2)) + float(22);
        fb.Y2 = (AWinPos.Y2 - float(2)) - float(7);
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        return true;
    }
    // End:0x12A
    if(bBackgroundInfo)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_item_info, 0.0000000, 0.0000000, 0.0000000, 0.0000000);        
    }
    else
    {
        // End:0x209
        if(int(InvenState) == int(18))
        {
            fb.X1 = AWinPos.X1;
            fb.X2 = AWinPos.X2;
            fb.Y1 = (AWinPos.Y1 + float(2)) + float(15);
            fb.Y2 = (AWinPos.Y2 - float(2)) - float(14);
            ItemImage.DrawType = 1;
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
            RenderSkillType(C, fb);
            return true;            
        }
        else
        {
            // End:0x268
            if(bSelect && Img_Selected.Image != none)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Img_Selected, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                
            }
            else
            {
                // End:0x311
                if(bMouseOn && Img_MouseOn.Image != none)
                {
                    // End:0x2CD
                    if(MouseOnWithNormal)
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Img_Normal, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                    }
                    Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Img_MouseOn, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                    
                }
                else
                {
                    // End:0x370
                    if(bFocused && Img_Focus.Image != none)
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Img_Focus, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                        
                    }
                    else
                    {
                        // End:0x3C1
                        if(Img_Normal.Image != none)
                        {
                            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Img_Normal, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                        }
                    }
                }
            }
        }
    }
    // End:0x43B
    if((instanceInfo != none) && instanceInfo.PaintID != 0)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, PaintImage, AWinPos.X1 + float(2), AWinPos.Y1 + float(26), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x448
    if(ItemInfo == none)
    {
        return true;
    }
    // End:0x598
    if((ItemInfo.ItemType == 11) || ItemInfo.ItemType == 36)
    {
        // End:0x598
        if(((int(InvenState) == int(3)) || int(InvenState) == int(6)) || int(InvenState) == int(16))
        {
            // End:0x521
            if(ItemInfo.EquipTeam == 1)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CharItem_BG_AF, AWinPos.X1 + float(5), AWinPos.Y1 + float(22), AWinPos.X1 + float(164), AWinPos.Y1 + float(85));                
            }
            else
            {
                // End:0x598
                if(ItemInfo.EquipTeam == 2)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CharItem_BG_RSA, AWinPos.X1 + float(5), AWinPos.Y1 + float(22), AWinPos.X1 + float(164), AWinPos.Y1 + float(85));
                }
            }
        }
    }
    fbItemImage = GetItemImageBox();
    // End:0x640
    if(bDisplayPart)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, PartImage, fbItemImage.X1, fbItemImage.Y1, fbItemImage.X2, fbItemImage.Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, PartName, AWinPos.X1 + float(3), AWinPos.Y1 + float(3), AWinPos.X2, AWinPos.Y2);
        return true;        
    }
    else
    {
        // End:0x6BC
        if(int(InvenState) == int(19))
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImageOriginalWithClipArea(C, ItemImage, fbItemImage.X1, fbItemImage.Y1, fbItemImage.X2, fbItemImage.Y2, fbItemImage.X1, fbItemImage.Y1, fbItemImage.X2, fbItemImage.Y2);            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, ItemImage, fbItemImage.X1, fbItemImage.Y1, fbItemImage.X2, fbItemImage.Y2);
        }
    }
    // End:0x719
    if(int(InvenState) != int(24))
    {
        RenderModifyIcon(C, 1);
    }
    // End:0x737
    if(bShowModifyIcon)
    {
        RenderModifyIcon(C, -1, offset);
    }
    CheckItemNameFloatBox(C);
    // End:0x798
    if(CheckScrollItemName)
    {
        scrollString.ProcessScroll(C, culledItemName, strItemName, fbItemName, bMouseOn, float(ItemName.FontSize), Delta);
        ItemName.Text = culledItemName;        
    }
    else
    {
        ItemName.Text = strItemName;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, ItemName, fbItemName.X1, fbItemName.Y1, fbItemName.X2, fbItemName.Y2);
    UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    // End:0x9F0
    if(bShowDurability)
    {
        // End:0x9F0
        if((ItemInfo != none) && ItemInfo.ItemName != "")
        {
            // End:0x93F
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                // End:0x8CA
                if(int(InvenState) != int(10))
                {
                    ItemDurability.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(90), AWinPos.Y1 + float(69), AWinPos.X1 + float(158), AWinPos.Y1 + float(79));                    
                }
                else
                {
                    ItemDurability.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(90), AWinPos.Y1 + float(99), AWinPos.X1 + float(158), AWinPos.Y1 + float(109));
                }
                ItemDurability.Render(C);                
            }
            else
            {
                // End:0x9F0
                if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
                {
                    UnderTextForm.DrawColor = colCurrentUntilTime;
                    UnderTextForm.Text = strCurrentUntilTime;
                    UnderTextForm.FontDrawType = 2;
                    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, UnderTextForm, AWinPos.X2 - float(152), AWinPos.Y2 - float(15), AWinPos.X2 - float(80), AWinPos.Y2 - float(2));
                }
            }
        }
    }
    // End:0x1279
    if(bShowPrice && ItemInfo != none)
    {
        UnderTextForm.DrawShadowColor.A = byte(255);
        // End:0xBBD
        if((ItemInfo.IsCashItem() && instanceInfo != none) && instanceInfo.cashItemInfo != none)
        {
            AppendStr = GetCoinAppendString(!instanceInfo.cashItemInfo.EnableCCoin);
            PointNCashIcon = CashIconImage;
            // End:0xB5E
            if(instanceInfo.cashItemInfo.IsDiscount)
            {
                IsDiscount = true;
                DisCountPriceTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(instanceInfo.cashItemInfo.WZCashPrice[0]));
                DisCountPriceTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
                DisCountPriceTextForm.FontDrawType = 8;
                UnderTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(instanceInfo.cashItemInfo.WZOriginalCashPrice[0]));
                UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
                UnderTextForm.FontDrawType = 8;                
            }
            else
            {
                UnderTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(instanceInfo.cashItemInfo.WZCashPrice[0]));
                UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
                UnderTextForm.FontDrawType = 8;
            }            
        }
        else
        {
            // End:0xC3D
            if(ItemInfo.PurchaseType == 0)
            {
                AppendStr = strPoint;
                PointNCashIcon = PointIconImage;
                UnderTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(ItemInfo.PointPrice[0]));
                UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Point();
                UnderTextForm.FontDrawType = 8;                
            }
            else
            {
                // End:0xCBC
                if(ItemInfo.PurchaseType == 1)
                {
                    AppendStr = GetCoinAppendString(false);
                    PointNCashIcon = CashIconImage;
                    UnderTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(ItemInfo.CashPrice[0]));
                    UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
                    UnderTextForm.FontDrawType = 8;
                }
            }
        }
        switch(InvenState)
        {
            // End:0xDA9
            case 21:
                // End:0xCE2
                if(ItemInfo.IsCashItem())
                {
                    bAppendPrice = true;
                }
                UnderTextForm.FontDrawType = 3;
                DisCountPriceTextForm.FontDrawType = 3;
                fbPrice = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(157), AWinPos.Y2 - float(16), AWinPos.X2 - float(68), AWinPos.Y2 - float(3));
                fbDiscountPrice = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(157), AWinPos.Y2 - float(29), AWinPos.X2 - float(68), AWinPos.Y2 - float(16));
                // End:0xFE4
                break;
            // End:0xF2C
            case 20:
                UnderTextForm.FontDrawType = 5;
                DisCountPriceTextForm.FontDrawType = 5;
                Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, PointNCashIcon, AWinPos.X2 - float(18), AWinPos.Y2 - float(17), AWinPos.X2 - float(5), AWinPos.Y2 - float(4));
                // End:0xE7F
                if(UnderExtraTextForm.Text != "")
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, UnderExtraTextForm, AWinPos.X1, AWinPos.Y2 - float(15), AWinPos.X2, AWinPos.Y2 - float(2));
                }
                fbPrice = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(125), AWinPos.Y2 - float(15), AWinPos.X2 - float(23), AWinPos.Y2 - float(2));
                fbDiscountPrice = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(125), AWinPos.Y2 - float(28), AWinPos.X2 - float(23), AWinPos.Y2 - float(15));
                // End:0xFE4
                break;
            // End:0xFFFF
            default:
                bAppendPrice = true;
                fbPrice = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(140), AWinPos.Y2 - float(15), AWinPos.X2 - float(70), AWinPos.Y2 - float(2));
                fbDiscountPrice = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(140), AWinPos.Y2 - float(28), AWinPos.X2 - float(70), AWinPos.Y2 - float(15));
                // End:0xFE4
                break;
                break;
        }
        // End:0x11E7
        if(IsDiscount)
        {
            // End:0x1012
            if(bAppendPrice)
            {
                UnderTextForm.Text = UnderTextForm.Text @ AppendStr;
            }
            UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultRed();
            Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, UnderTextForm, fbPrice.X1, fbPrice.Y1, fbPrice.X2, fbPrice.Y2);
            // End:0x1092
            if(bAppendPrice)
            {
                DisCountPriceTextForm.Text = DisCountPriceTextForm.Text @ AppendStr;
            }
            C.BtrTextSize(UnderTextForm.Text, UnderTextForm.FontSize, stringX, stringY);
            Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, DisCountPriceTextForm, fbDiscountPrice.X1, fbDiscountPrice.Y1, fbDiscountPrice.X2, fbDiscountPrice.Y2);
            // End:0x1195
            if(((int(DisCountPriceTextForm.FontDrawType) == int(0)) || int(DisCountPriceTextForm.FontDrawType) == int(3)) || int(DisCountPriceTextForm.FontDrawType) == int(6))
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, DisCountStrikeImg, fbPrice.X1, fbPrice.Y2 - stringY, fbPrice.X1 + stringX, fbPrice.Y2);                
            }
            else
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, DisCountStrikeImg, fbPrice.X2 - stringX, fbPrice.Y2 - stringY, fbPrice.X2, fbPrice.Y2);
            }            
        }
        else
        {
            // End:0x120C
            if(bAppendPrice)
            {
                UnderTextForm.Text = UnderTextForm.Text @ AppendStr;
            }
            Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, UnderTextForm, fbPrice.X1, fbPrice.Y1, fbPrice.X2, fbPrice.Y2);
        }
        UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
        UnderTextForm.DrawShadowColor.A = 100;
    }
    // End:0x131E
    if(bShowDamage && instanceInfo != none)
    {
        UnderTextForm.Text = strDamage @ string(instanceInfo.DamageDegree / 1000);
        UnderTextForm.FontDrawType = 8;
        Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x1386
    if(bShowEquipLevel)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, EquipLevelImage, AWinPos.X1 + float(2), (AWinPos.Y2 - float(2)) - float(32), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x13A9
    if((instanceInfo != none) && int(InvenState) == int(8))
    {
        CheckRedAuction();
    }
    // End:0x1503
    if((bRedAuction == false) && ItemInfo.CostType == 2)
    {
        UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeShop_DurabilityX();
        UnderTextForm.FontSize = 9;
        UnderTextForm.FontSize = 9;
        UnderTextForm.Text = strCannotRepair;
        UnderTextForm.FontDrawType = 6;
        // End:0x14AA
        if((AWinPos.X1 + float(20)) > (AWinPos.X2 - float(72)))
        {
            Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, UnderTextForm, AWinPos.X1 + float(5), (AWinPos.Y2 - float(15)) - float(15), AWinPos.X2 - float(2), (AWinPos.Y2 - float(2)) - float(15));            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, UnderTextForm, AWinPos.X1 + float(5), AWinPos.Y2 - float(15), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
        }
    }
    // End:0x15F0
    if((instanceInfo != none) && int(InvenState) == int(8))
    {
        // End:0x15ED
        if(bRedAuction)
        {
            bRedState = true;
            UnderTextForm.FontDrawType = 6;
            Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, UnderTextForm, AWinPos.X1 + float(2), (AWinPos.Y2 - float(2)) - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);
        }        
    }
    else
    {
        // End:0x1D72
        if(ItemInfo != none)
        {
            ReasonCount = 0;
            // End:0x164A
            if((bShowRestrictionLevel && MyData != none) && MyData.myLevel < ItemInfo.EquipLevel)
            {
                bRedLevel = true;
                ReasonCount++;
            }
            // End:0x169F
            if(((bShowRestrictionDurability && ItemInfo.CostType == 0) && instanceInfo != none) && instanceInfo.Durability < 10000)
            {
                bRedRepair = true;
                ReasonCount++;
            }
            // End:0x1702
            if(((bShowRestrictionPrice && ItemInfo.PurchaseType == 0) && MyData != none) && MyData.MyPoint < ItemInfo.PointPrice[0])
            {
                bRedPoint = true;
                ReasonCount++;                
            }
            else
            {
                // End:0x1791
                if(((((bShowRestrictionPrice && ItemInfo.PurchaseType == 1) && instanceInfo != none) && instanceInfo.cashItemInfo != none) && MyData != none) && MyData.MyCash < instanceInfo.cashItemInfo.WZCashPrice[0])
                {
                    bRedCash = true;
                    ReasonCount++;                    
                }
                else
                {
                    // End:0x180D
                    if(bShowNotShopItem && ItemInfo.AdType == 0)
                    {
                        // End:0x180A
                        if(((ItemInfo.Grade != 14) && ItemInfo.AdType == 0) || instanceInfo.cashItemInfo.bWZCanBuy == false)
                        {
                            bRedCanBuy = true;
                            ReasonCount++;
                        }                        
                    }
                    else
                    {
                        // End:0x183C
                        if((bShowPCBangLevel == true) && false == MM.CheckUsingItem(ItemInfo))
                        {
                            ReasonCount++;
                        }
                    }
                }
            }
            bNoReasonRedState = false;
            // End:0x1883
            if(bShowCanRepair && (ItemInfo.bRepair == false) || ItemInfo.CostType == 2)
            {
                bNoReasonRedState = true;
            }
            // End:0x195A
            if(bShowCanBuy)
            {
                // End:0x18CA
                if(ItemInfo.PointPrice[0] == 0)
                {
                    bNoReasonRedState = true;
                    UnderTextForm.Text = strCannotBuy;
                    UnderTextForm.FontDrawType = 8;                    
                }
                else
                {
                    UnderTextForm.Text = strOneDay;
                    UnderTextForm.FontDrawType = 8;
                }
                Class'Engine.BTCustomDrawHK'.static.DrawTextRatio(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
                UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
            }
            // End:0x1D72
            if((ReasonCount > 0) || bNoReasonRedState)
            {
                bRedState = true;
                XL = ((AWinPos.X2 - AWinPos.X1) - float(25 * ReasonCount)) / float(2);
                YL = ((AWinPos.Y2 - AWinPos.Y1) - float(25)) / float(2);
                // End:0x1A4C
                if(bRedLevel)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, EquipLevelImage, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x1AD2
                if(bRedRepair)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_repair_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x1B58
                if(bRedCash)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_cash_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x1BDE
                if(bRedPoint)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_point_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x1C9B
                if((((((int(InvenState) == int(7)) || int(InvenState) == int(17)) || int(InvenState) == int(15)) || int(InvenState) == int(0)) || int(InvenState) == int(12)) || int(InvenState) == int(14))
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);                    
                }
                else
                {
                    // End:0x1D10
                    if((int(InvenState) == int(20)) || int(InvenState) == int(21))
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(20), AWinPos.X2, AWinPos.Y2);                        
                    }
                    else
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1 + float(2), AWinPos.Y1 + float(19), AWinPos.X2 - float(68), AWinPos.Y2 - float(2));
                    }
                }
            }
        }
    }
    switch(RibbonState)
    {
        // End:0x1D80
        case 0:
            // End:0x1FB6
            break;
        // End:0x1DDD
        case 1:
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_Own, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1FB6
            break;
        // End:0x1E3B
        case 2:
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_New, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1FB6
            break;
        // End:0x1E99
        case 3:
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_Best, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1FB6
            break;
        // End:0x1EF7
        case 4:
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_Cool, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1FB6
            break;
        // End:0x1F55
        case 5:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_LuckyBest, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1FB6
            break;
        // End:0x1FB3
        case 6:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_Discount, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1FB6
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0x20D2
    if(ItemInfo.ItemType == 11)
    {
        // End:0x2061
        if(((int(InvenState) == int(3)) || int(InvenState) == int(6)) || int(InvenState) == int(16))
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CharItem_Total_Type_Deco, AWinPos.X1 + float(3), AWinPos.Y1 + float(20), AWinPos.X1 + float(67), AWinPos.Y1 + float(44));
        }
        // End:0x20D2
        if(int(InvenState) == int(19))
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CharItem_Total_Type_Deco, AWinPos.X1 + float(1), AWinPos.Y1 + float(23), AWinPos.X1 + float(65), AWinPos.Y1 + float(47));
        }
    }
    // End:0x21EE
    if(ItemInfo.ItemType == 36)
    {
        // End:0x217D
        if(((int(InvenState) == int(3)) || int(InvenState) == int(6)) || int(InvenState) == int(16))
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CharItem_Parts_Type_Deco, AWinPos.X1 + float(3), AWinPos.Y1 + float(20), AWinPos.X1 + float(67), AWinPos.Y1 + float(44));
        }
        // End:0x21EE
        if(int(InvenState) == int(19))
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.CharItem_Parts_Type_Deco, AWinPos.X1 + float(1), AWinPos.Y1 + float(23), AWinPos.X1 + float(65), AWinPos.Y1 + float(47));
        }
    }
    RenderSkillType(C, fbItemImage);
    return true;
    //return;    
}

function CheckRedAuction()
{
    bRedAuction = false;
    // End:0x42
    if(instanceInfo.TradeCount > 0)
    {
        bRedAuction = true;
        UnderTextForm.Text = strRestrictionReason[7];
        RRIndex = 7;        
    }
    else
    {
        // End:0x7B
        if(ItemInfo.bSellAuction == false)
        {
            bRedAuction = true;
            UnderTextForm.Text = strRestrictionReason[0];
            RRIndex = 0;            
        }
        else
        {
            // End:0xCA
            if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
            {
                bRedAuction = true;
                UnderTextForm.Text = strRestrictionReason[1];
                RRIndex = 1;                
            }
            else
            {
                // End:0x115
                if((instanceInfo != none) && instanceInfo.DamageDegree >= 100000)
                {
                    bRedAuction = true;
                    UnderTextForm.Text = strRestrictionReason[2];
                    RRIndex = 2;                    
                }
                else
                {
                    // End:0x160
                    if((instanceInfo != none) && instanceInfo.Durability < 100000)
                    {
                        bRedAuction = true;
                        UnderTextForm.Text = strRestrictionReason[3];
                        RRIndex = 3;                        
                    }
                    else
                    {
                        // End:0x1A8
                        if((instanceInfo != none) && instanceInfo.SlotPosition <= 8)
                        {
                            bRedAuction = true;
                            UnderTextForm.Text = strRestrictionReason[4];
                            RRIndex = 4;                            
                        }
                        else
                        {
                            // End:0x1D7
                            if(bRegisterQuickSlot)
                            {
                                bRedAuction = true;
                                UnderTextForm.Text = strRestrictionReason[5];
                                RRIndex = 5;                                
                            }
                            else
                            {
                                // End:0x20F
                                if(ItemInfo.CostType == 2)
                                {
                                    bRedAuction = true;
                                    UnderTextForm.Text = strRestrictionReason[6];
                                    RRIndex = 6;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    //return;    
}

function SetMatchMaker(wMatchMaker wMM)
{
    MM = wMM;
    //return;    
}

function SetGameManager(wGameManager GM)
{
    GameMgr = GM;
    //return;    
}

function string GetCoinAppendString(bool onlyPCoin)
{
    local string strCashType;

    // End:0x17
    if(onlyPCoin)
    {
        strCashType = strOnlyPCoin;        
    }
    else
    {
        strCashType = strCash;
    }
    return strCashType;
    //return;    
}

function FloatBox GetItemImageBox()
{
    local FloatBox fbItemImage;

    // End:0x40
    if((int(InvenState) == int(0)) || int(InvenState) == int(15))
    {
        fbItemImage.X1 = AWinPos.X1 + float(2);        
    }
    else
    {
        fbItemImage.X1 = AWinPos.X1 + float(8);
    }
    fbItemImage.X2 = AWinPos.X2 - float(2);
    fbItemImage.Y1 = AWinPos.Y1 + float(18);
    fbItemImage.Y2 = AWinPos.Y1 + float(81);
    // End:0xB8
    if(bDisplayPart)
    {        
    }
    else
    {
        // End:0x11A
        if(bBackgroundInfo)
        {
            fbItemImage.X1 += float(29);
            fbItemImage.Y1 += float(2);
            fbItemImage.X2 = fbItemImage.X1 + float(152);
            fbItemImage.Y2 = fbItemImage.Y1 + float(64);            
        }
        else
        {
            // End:0x18D
            if(((((int(InvenState) == int(6)) || int(InvenState) == int(3)) || int(InvenState) == int(5)) || int(InvenState) == int(16)) || int(InvenState) == int(15))
            {
                fbItemImage.X2 = AWinPos.X2 - float(74);
            }
        }
    }
    return fbItemImage;
    //return;    
}

function bool CheckInItemImage(int X, int Y)
{
    local FloatBox itemImageBox;

    itemImageBox = GetItemImageBox();
    // End:0x6A
    if((itemImageBox.X1 <= float(X)) && float(X) <= itemImageBox.X2)
    {
        // End:0x6A
        if((itemImageBox.Y1 <= float(Y)) && float(Y) <= itemImageBox.Y2)
        {
            return true;
        }
    }
    return false;
    //return;    
}

function RenderSkillType(Canvas C, FloatBox fbItemImage)
{
    // End:0xC6
    if(((ItemInfo.SkillType > 0) && ItemInfo.SkillType < Class'Engine.wGameManager'.static.GetSkillTypeMax()) && (ItemInfo.SkillType - 1) < 4)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImageRatio(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.SkillTypeRibbon[ItemInfo.SkillType - 1], fbItemImage.X2 - float(66), fbItemImage.Y1 + float(10), fbItemImage.X2 - float(2), fbItemImage.Y1 + float(29));
    }
    //return;    
}

function GetExtraItemString(out string outputString, out Color outputColor)
{
    outputString = "";
    // End:0x305
    if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
    {
        // End:0xCD
        if(instanceInfo.LeftTime.Day >= 1)
        {
            outputColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
            // End:0xA5
            if(instanceInfo.LeftTime.Hour > 0)
            {
                outputString = string(instanceInfo.LeftTime.Day + 1) $ strLeftTime[2];                
            }
            else
            {
                outputString = string(instanceInfo.LeftTime.Day) $ strLeftTime[2];
            }            
        }
        else
        {
            // End:0x197
            if(((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) >= 12)
            {
                outputColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
                outputString = string((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                // End:0x194
                if(instanceInfo.LeftTime.Minute > 0)
                {
                    outputString @= (string(instanceInfo.LeftTime.Minute) $ strLeftTime[4]);
                }                
            }
            else
            {
                // End:0x26E
                if((((instanceInfo.LeftTime.Day < 0) || instanceInfo.LeftTime.Hour < 0) || instanceInfo.LeftTime.Minute < 0) || instanceInfo.LeftTime.Second < 0)
                {
                    outputColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();
                    // End:0x25E
                    if(false == bool(GameMgr.GetItemType(ItemInfo, instanceInfo) & GameMgr.FlagBuyShop))
                    {
                        outputString = strLeftTime[1] $ strCannotExpired;                        
                    }
                    else
                    {
                        outputString = strLeftTime[1];
                    }                    
                }
                else
                {
                    outputColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();
                    outputString = string((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                    // End:0x302
                    if(instanceInfo.LeftTime.Minute > 0)
                    {
                        outputString @= (string(instanceInfo.LeftTime.Minute) $ strLeftTime[4]);
                    }
                }
            }
        }        
    }
    else
    {
        // End:0x344
        if(ItemInfo.CostType == 3)
        {
            outputString = Class'Engine.BTCustomDrawHK'.static.FormatString(strItemCount, string(instanceInfo.OverlapCount));
        }
    }
    //return;    
}

function CheckItemNameFloatBox(Canvas C)
{
    local FloatBox fbNewItemName;

    fbNewItemName.X1 = (AWinPos.X1 + float(3)) + float(2);
    fbNewItemName.Y1 = (AWinPos.Y1 + float(3)) + float(2);
    fbNewItemName.X2 = AWinPos.X2;
    fbNewItemName.Y2 = AWinPos.Y2;
    fbItemName = fbNewItemName;
    //return;    
}

defaultproperties
{
    strLeftCount="Remaining"
    strCannotRepair="Cannot Repair"
    strGradeBase="Basic"
    strGradeShop="Store"
    strGradeCommon="Loot (Common)"
    strGradeNormal="Loot (Normal)"
    strGradeHigh="Loot (Superior)"
    strGradeRare="Loot (Rare)"
    strGradeLegend="Loot (Legendary)"
    strGradePCBang="PC Cafe"
    strGradeBaseS="Basic"
    strGradeShopS="Store"
    strGradeCommonS="Common"
    strGradeNormalS="Normal"
    strGradeHighS="Superior"
    strGradeRareS="Rare"
    strGradeLegendS="Legendary"
    strDurability="Durability"
    strDamage="Damage Level"
    strLeftTime[0]="Time Remaining"
    strLeftTime[1]="Expired"
    strLeftTime[2]="d"
    strLeftTime[3]="h"
    strLeftTime[4]="m"
    strLeftTime[5]="Unused"
    strPoint="Points"
    strCash="W Coin"
    strOneDay="1 Day"
    strCannotBuy="Cannot Repurchase"
    strCannotExpired="Cannot Renew"
    strOnlyPCoin="W Coin(P)"
    strItemCount=" %0 total"
    strRestrictionReason[0]="Not for Auction"
    strRestrictionReason[1]="Used"
    strRestrictionReason[2]="Damage Level"
    strRestrictionReason[3]="Durability"
    strRestrictionReason[4]="Equip"
    strRestrictionReason[5]="Quick Slot"
    strRestrictionReason[6]="Unrepairable"
    strRestrictionReason[7]="Bound Item"
    strActiveSkillToolTip[0]="Killstreak skills can be earned after a killstreak without dying."
    strActiveSkillToolTip[1]="Scorestreak skills can be earned after the total number of stacked kills."
    strActiveSkillToolTip[2]="Assist skills can be earned after the total number of assists."
    strActiveSkillToolTip[3]="Deathstreak skills can be earned after the total number of deaths."
}