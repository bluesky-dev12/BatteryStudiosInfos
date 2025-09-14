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
    E_IB_REMODEL_INVEN              // 21
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
var Text ItemName;
var Text GradeName;
var Text UnderTextForm;
var Image ItemImage;
var Image EquipLevelImage;
var BTROExpBarHK ItemDurability;
var Image RepairIconImage;
var Image CashIconImage;
var Image PointIconImage;
var bool bDotSight;
var bool bScope;
var bool bSilencer;
var bool bSkill;
var Image dotImg;
var Image scoImg;
var Image silImg;
var Image skiImg;
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
var int RRIndex;
var bool bRegisterQuickSlot;
var localized string strRestrictionReason[8];
var BTROItemBoxHK.EInvenState InvenState;

function ChangeState(BTROItemBoxHK.EInvenState estate)
{
    InvenState = estate;
    switch(estate)
    {
        // End:0x62
        case 0:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowNotShopItem = false;
            bShowPCBangLevel = false;
            // End:0x72D
            break;
        // End:0xB2
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
            // End:0x72D
            break;
        // End:0x102
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
            // End:0x72D
            break;
        // End:0x152
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
            // End:0x72D
            break;
        // End:0x1A2
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
            // End:0x72D
            break;
        // End:0x1F2
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
            // End:0x72D
            break;
        // End:0x24A
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
            // End:0x72D
            break;
        // End:0x2A2
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
            // End:0x72D
            break;
        // End:0x2FA
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
            // End:0x72D
            break;
        // End:0x352
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
            // End:0x72D
            break;
        // End:0x3A2
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
            // End:0x72D
            break;
        // End:0x3EA
        case 9:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowPCBangLevel = false;
            // End:0x72D
            break;
        // End:0x43A
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
            // End:0x72D
            break;
        // End:0x48A
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
            // End:0x72D
            break;
        // End:0x4DA
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
            // End:0x72D
            break;
        // End:0x52A
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
            // End:0x72D
            break;
        // End:0x582
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
            // End:0x72D
            break;
        // End:0x5D2
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
            // End:0x72D
            break;
        // End:0x632
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
            // End:0x72D
            break;
        // End:0x682
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
            // End:0x72D
            break;
        // End:0x6DA
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
            // End:0x72D
            break;
        // End:0x72A
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
            // End:0x72D
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
    bSkill = false;
    bBackgroundInfo = false;
    ItemDurability = new Class'GUIWarfareControls_Decompressed.BTROExpBarHK';
    ItemDurability.Init();
    ItemDurability.back.Image = none;
    ItemDurability.Gauge = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_gauge;
    ItemDurability.PercTextPadding[3] = 2.0000000;
    UnderTextForm = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    RepairIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_repair_non;
    CashIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_cash;
    PointIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.new_img_point;
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
    if(((ItemInfo.IsCashItem() == true) && instanceInfo != none) && instanceInfo.CashItemInfo != none)
    {
        // End:0x14A
        if((instanceInfo != none) && instanceInfo.CashItemInfo != none)
        {
            ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, instanceInfo.CashItemInfo.WZItemName);            
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
        ItemName.FontDrawType = 1;
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
    ItemImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 1, none);
    ItemImage.Image = ItemInfo.ItemImage;
    PartName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    PartImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 1, none);
    PaintImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 57, 28, none);
    bSkill = false;
    // End:0x525
    if(instanceInfo != none)
    {
        i = 0;
        J0x358:

        // End:0x438 [Loop If]
        if(i < ItemInfo.PartAllList.Length)
        {
            // End:0x42E
            if(ItemInfo.PartAllList[i].PartID == instanceInfo.PartID)
            {
                PartName.Text = ItemInfo.PartAllList[i].Name;
                PartImage.Image = ItemInfo.PartAllList[i].PartImage;
                // End:0x42B
                if(ItemInfo.PartAllList[i].SkillID != 0)
                {
                    bSkill = true;
                    PartSkillName = ItemInfo.PartAllList[i].SkillName;
                }
                // [Explicit Break]
                goto J0x438;
            }
            i++;
            // [Loop Continue]
            goto J0x358;
        }
        J0x438:

        // End:0x525
        if(instanceInfo.PaintID != 0)
        {
            i = 0;
            J0x453:

            // End:0x4C9 [Loop If]
            if(i < ItemInfo.PaintGroupList.Length)
            {
                // End:0x4BF
                if(ItemInfo.PaintGroupList[i].PaintingItemID == instanceInfo.PaintID)
                {
                    PaintImage.Image = ItemInfo.PaintGroupList[i].UI_Icon_Box;
                    // [Explicit Break]
                    goto J0x4C9;
                }
                ++i;
                // [Loop Continue]
                goto J0x453;
            }
            J0x4C9:

            // End:0x525
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
    // End:0x9D9
    if(instanceInfo != none)
    {
        iSightPartID = instanceInfo.PartID & 1023;
        iBarrelPartID = instanceInfo.PartID & 130048;
        iSilencerPartID = instanceInfo.PartID & 16646144;
        iGunstockPartID = instanceInfo.PartID & 2130706432;
        // End:0x7FA
        if(iSightPartID > 1)
        {
            // End:0x68E
            if(ItemInfo.PartSightIndices.Length == 0)
            {
                wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
                // End:0x68E
                if((wcpp != none) && wcpp.iItemID > 0)
                {
                    // End:0x68E
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
            J0x695:

            // End:0x7FA [Loop If]
            if(i < ItemInfo.PartSightIndices.Length)
            {
                PartIndex = ItemInfo.PartSightIndices[i];
                // End:0x7F0
                if(iSightPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    // End:0x74E
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
                    // End:0x7ED
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                    // [Explicit Break]
                    goto J0x7FA;
                }
                i++;
                // [Loop Continue]
                goto J0x695;
            }
        }
        J0x7FA:

        // End:0x9D9
        if(iSilencerPartID > (1 << 17))
        {
            // End:0x8D0
            if(ItemInfo.PartSilencerIndices.Length == 0)
            {
                wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
                // End:0x8D0
                if((wcpp != none) && wcpp.iItemID > 0)
                {
                    // End:0x8D0
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
            J0x8D7:

            // End:0x9D9 [Loop If]
            if(i < ItemInfo.PartSilencerIndices.Length)
            {
                PartIndex = ItemInfo.PartSilencerIndices[i];
                // End:0x9CF
                if(iSilencerPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    bSilencer = true;
                    silImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_siln;
                    silImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    // End:0x9CC
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                    // [Explicit Break]
                    goto J0x9D9;
                }
                i++;
                // [Loop Continue]
                goto J0x8D7;
            }
        }
    }
    J0x9D9:

    // End:0xD01
    if(instanceInfo != none)
    {
        ItemDurability.SetData(instanceInfo.Durability, 100000);
        // End:0xD01
        if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
        {
            // End:0xACC
            if(instanceInfo.LeftTime.Day >= 2)
            {
                colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
                // End:0xAA4
                if(instanceInfo.LeftTime.Hour > 0)
                {
                    strCurrentUntilTime = string(instanceInfo.LeftTime.Day + 1) $ strLeftTime[2];                    
                }
                else
                {
                    strCurrentUntilTime = string(instanceInfo.LeftTime.Day) $ strLeftTime[2];
                }                
            }
            else
            {
                // End:0xB96
                if(((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) >= 12)
                {
                    colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
                    strCurrentUntilTime = string((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                    // End:0xB93
                    if(instanceInfo.LeftTime.Minute > 0)
                    {
                        strCurrentUntilTime @= (string(instanceInfo.LeftTime.Minute) $ strLeftTime[4]);
                    }                    
                }
                else
                {
                    // End:0xC6D
                    if((((instanceInfo.LeftTime.Day < 0) || instanceInfo.LeftTime.Hour < 0) || instanceInfo.LeftTime.Minute < 0) || instanceInfo.LeftTime.Second < 0)
                    {
                        colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();
                        // End:0xC5D
                        if(false == bool(GameMgr.GetItemType(ItemInfo, instanceInfo) & GameMgr.FlagBuyShop))
                        {
                            strCurrentUntilTime = strLeftTime[1] $ strCannotExpired;                            
                        }
                        else
                        {
                            strCurrentUntilTime = strLeftTime[1];
                        }                        
                    }
                    else
                    {
                        colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();
                        strCurrentUntilTime = string((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                        // End:0xD01
                        if(instanceInfo.LeftTime.Minute > 0)
                        {
                            strCurrentUntilTime @= (string(instanceInfo.LeftTime.Minute) $ strLeftTime[4]);
                        }
                    }
                }
            }
        }
    }
    EquipLevelImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 28, ItemInfo.EquipLevelImage);
    // End:0xD58
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

function bool Render(Canvas C, optional float Delta)
{
    local bool bRedPoint, bRedCash, bRedRepair, bRedLevel, bRedCanBuy;

    local int ReasonCount;
    local float XL, YL;
    local FloatBox fb;
    local string AppendStr;
    local Image PointNCashIcon;

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
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        return true;
    }
    // End:0x12A
    if(bBackgroundInfo)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_item_info, 0.0000000, 0.0000000, 0.0000000, 0.0000000);        
    }
    else
    {
        // End:0x245
        if((int(InvenState) == int(3)) || int(InvenState) == int(5))
        {
            // End:0x1A2
            if(bSelect)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_Sel, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                
            }
            else
            {
                // End:0x1F8
                if(bMouseOn)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                    
                }
                else
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                }
            }            
        }
        else
        {
            // End:0x36C
            if((int(InvenState) == int(6)) || int(InvenState) == int(16))
            {
                // End:0x273
                if(bSelect)
                {                    
                }
                else
                {
                    // End:0x2C9
                    if(bFocused)
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_Sel, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                        
                    }
                    else
                    {
                        // End:0x31F
                        if(bMouseOn)
                        {
                            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                            
                        }
                        else
                        {
                            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Item_List_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                        }
                    }
                }                
            }
            else
            {
                // End:0x475
                if(int(InvenState) == int(20))
                {
                    // End:0x3D2
                    if(bFocused)
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_List_BG_Focus, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                        
                    }
                    else
                    {
                        // End:0x428
                        if(bMouseOn)
                        {
                            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_List_BG_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                            
                        }
                        else
                        {
                            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ItemRemodel_List_BG_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                        }
                    }                    
                }
                else
                {
                    // End:0x488
                    if(int(InvenState) == int(21))
                    {                        
                    }
                    else
                    {
                        // End:0x563
                        if(int(InvenState) == int(18))
                        {
                            fb.X1 = AWinPos.X1 + float(2);
                            fb.X2 = AWinPos.X2 - float(2);
                            fb.Y1 = (AWinPos.Y1 + float(2)) + float(15);
                            fb.Y2 = (AWinPos.Y2 - float(2)) - float(14);
                            ItemImage.DrawType = 1;
                            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
                            return true;                            
                        }
                        else
                        {
                            // End:0x5B9
                            if(bSelect)
                            {
                                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                                
                            }
                            else
                            {
                                // End:0x60C
                                if(bMouseOn)
                                {
                                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                                }
                                // End:0x65F
                                if(bFocused)
                                {
                                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x6D9
    if((instanceInfo != none) && instanceInfo.PaintID != 0)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, PaintImage, AWinPos.X1 + float(2), AWinPos.Y1 + float(26), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x6E6
    if(ItemInfo == none)
    {
        return true;
    }
    fb.X1 = AWinPos.X1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y1 = (AWinPos.Y1 + float(2)) + float(15);
    fb.Y2 = (AWinPos.Y2 - float(2)) - float(14);
    // End:0x7FA
    if(bDisplayPart)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, PartImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, PartName, AWinPos.X1 + float(3), AWinPos.Y1 + float(3), AWinPos.X2, AWinPos.Y2);
        return true;        
    }
    else
    {
        // End:0x860
        if(bBackgroundInfo)
        {
            ItemImage.DrawType = 4;
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1 + float(7), fb.X2, fb.Y2 + float(7));            
        }
        else
        {
            ItemImage.DrawType = 1;
            // End:0x90F
            if(((((int(InvenState) == int(6)) || int(InvenState) == int(3)) || int(InvenState) == int(5)) || int(InvenState) == int(16)) || int(InvenState) == int(15))
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2 - float(75), fb.Y2);                
            }
            else
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
            }
        }
    }
    fb.X1 = (AWinPos.X2 - float(2)) - float(22);
    fb.Y1 = AWinPos.Y1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y2 = (AWinPos.Y1 + float(2)) + float(22);
    // End:0xA32
    if(bDotSight)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, dotImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0xA9C
    if(bScope)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, scoImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0xB06
    if(bSilencer)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, silImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0xB70
    if(bSkill)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, skiImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, ItemName, (AWinPos.X1 + float(3)) + float(2), (AWinPos.Y1 + float(3)) + float(2), AWinPos.X2, AWinPos.Y2);
    UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    // End:0xDD0
    if(bShowDurability)
    {
        // End:0xDD0
        if((ItemInfo != none) && ItemInfo.ItemName != "")
        {
            // End:0xD1F
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                // End:0xCAA
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
                // End:0xDD0
                if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
                {
                    UnderTextForm.DrawColor = colCurrentUntilTime;
                    UnderTextForm.Text = strCurrentUntilTime;
                    UnderTextForm.FontDrawType = 2;
                    Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(152), AWinPos.Y2 - float(15), AWinPos.X2 - float(80), AWinPos.Y2 - float(2));
                }
            }
        }
    }
    // End:0x1182
    if(bShowPrice && ItemInfo != none)
    {
        UnderTextForm.DrawShadowColor.A = byte(255);
        // End:0xEA0
        if((instanceInfo != none) && instanceInfo.CashItemInfo != none)
        {
            AppendStr = GetCoinAppendString(!instanceInfo.CashItemInfo.EnableCCoin);
            UnderTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(instanceInfo.CashItemInfo.WZCashPrice[0]));
            UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
            UnderTextForm.FontDrawType = 8;            
        }
        else
        {
            // End:0xF20
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
                // End:0xF9F
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
            // End:0x1014
            case 21:
                UnderTextForm.FontDrawType = 3;
                Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(157), AWinPos.Y2 - float(16), AWinPos.X2 - float(68), AWinPos.Y2 - float(3));
                // End:0x1156
                break;
            // End:0x10DB
            case 20:
                UnderTextForm.FontDrawType = 5;
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, PointNCashIcon, AWinPos.X2 - float(18), AWinPos.Y2 - float(17), AWinPos.X2 - float(5), AWinPos.Y2 - float(4));
                Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(125), AWinPos.Y2 - float(17), AWinPos.X2 - float(23), AWinPos.Y2 - float(4));
                // End:0x1156
                break;
            // End:0xFFFF
            default:
                UnderTextForm.Text = UnderTextForm.Text @ AppendStr;
                Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(140), AWinPos.Y2 - float(20), AWinPos.X2 - float(70), AWinPos.Y2 - float(2));
                // End:0x1156
                break;
                break;
        }
        UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
        UnderTextForm.DrawShadowColor.A = 100;
    }
    // End:0x1227
    if(bShowDamage && instanceInfo != none)
    {
        UnderTextForm.Text = strDamage @ string(instanceInfo.DamageDegree / 1000);
        UnderTextForm.FontDrawType = 8;
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x128F
    if(bShowEquipLevel)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, EquipLevelImage, AWinPos.X1 + float(2), (AWinPos.Y2 - float(2)) - float(32), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x12B2
    if((instanceInfo != none) && int(InvenState) == int(8))
    {
        CheckRedAuction();
    }
    // End:0x140C
    if((bRedAuction == false) && ItemInfo.CostType == 2)
    {
        UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeShop_DurabilityX();
        UnderTextForm.FontSize = 9;
        UnderTextForm.FontSize = 9;
        UnderTextForm.Text = strCannotRepair;
        UnderTextForm.FontDrawType = 6;
        // End:0x13B3
        if((AWinPos.X1 + float(20)) > (AWinPos.X2 - float(72)))
        {
            Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X1 + float(5), (AWinPos.Y2 - float(15)) - float(15), AWinPos.X2 - float(2), (AWinPos.Y2 - float(2)) - float(15));            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X1 + float(5), AWinPos.Y2 - float(15), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
        }
    }
    // End:0x14F9
    if((instanceInfo != none) && int(InvenState) == int(8))
    {
        // End:0x14F6
        if(bRedAuction)
        {
            bRedState = true;
            UnderTextForm.FontDrawType = 6;
            Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X1 + float(2), (AWinPos.Y2 - float(2)) - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);
        }        
    }
    else
    {
        // End:0x1C54
        if(ItemInfo != none)
        {
            ReasonCount = 0;
            // End:0x1546
            if(bShowRestrictionLevel && MyData.myLevel < ItemInfo.EquipLevel)
            {
                bRedLevel = true;
                ReasonCount++;
            }
            // End:0x159B
            if(((bShowRestrictionDurability && ItemInfo.CostType == 0) && instanceInfo != none) && instanceInfo.Durability < 10000)
            {
                bRedRepair = true;
                ReasonCount++;
            }
            // End:0x15F1
            if((bShowRestrictionPrice && ItemInfo.PurchaseType == 0) && MyData.MyPoint < ItemInfo.PointPrice[0])
            {
                bRedPoint = true;
                ReasonCount++;                
            }
            else
            {
                // End:0x1673
                if((((bShowRestrictionPrice && ItemInfo.PurchaseType == 1) && instanceInfo != none) && instanceInfo.CashItemInfo != none) && MyData.MyCash < instanceInfo.CashItemInfo.WZCashPrice[0])
                {
                    bRedCash = true;
                    ReasonCount++;                    
                }
                else
                {
                    // End:0x16EF
                    if(bShowNotShopItem && ItemInfo.AdType == 0)
                    {
                        // End:0x16EC
                        if(((ItemInfo.Grade != 14) && ItemInfo.AdType == 0) || instanceInfo.CashItemInfo.bWZCanBuy == false)
                        {
                            bRedCanBuy = true;
                            ReasonCount++;
                        }                        
                    }
                    else
                    {
                        // End:0x171E
                        if((bShowPCBangLevel == true) && false == MM.CheckUsingItem(ItemInfo))
                        {
                            ReasonCount++;
                        }
                    }
                }
            }
            bNoReasonRedState = false;
            // End:0x1765
            if(bShowCanRepair && (ItemInfo.bRepair == false) || ItemInfo.CostType == 2)
            {
                bNoReasonRedState = true;
            }
            // End:0x183C
            if(bShowCanBuy)
            {
                // End:0x17AC
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
                Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
                UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
            }
            // End:0x1C54
            if((ReasonCount > 0) || bNoReasonRedState)
            {
                bRedState = true;
                XL = ((AWinPos.X2 - AWinPos.X1) - float(25 * ReasonCount)) / float(2);
                YL = ((AWinPos.Y2 - AWinPos.Y1) - float(25)) / float(2);
                // End:0x192E
                if(bRedLevel)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, EquipLevelImage, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x19B4
                if(bRedRepair)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_repair_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x1A3A
                if(bRedCash)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_cash_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x1AC0
                if(bRedPoint)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_point_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x1B7D
                if((((((int(InvenState) == int(7)) || int(InvenState) == int(17)) || int(InvenState) == int(15)) || int(InvenState) == int(0)) || int(InvenState) == int(12)) || int(InvenState) == int(14))
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);                    
                }
                else
                {
                    // End:0x1BF2
                    if((int(InvenState) == int(20)) || int(InvenState) == int(21))
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(20), AWinPos.X2, AWinPos.Y2);                        
                    }
                    else
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1 + float(2), AWinPos.Y1 + float(19), AWinPos.X2 - float(68), AWinPos.Y2 - float(2));
                    }
                }
            }
        }
    }
    switch(RibbonState)
    {
        // End:0x1C62
        case 0:
            // End:0x1DDC
            break;
        // End:0x1CBF
        case 1:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_Own, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1DDC
            break;
        // End:0x1D1D
        case 2:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_New, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1DDC
            break;
        // End:0x1D7B
        case 3:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_Best, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1DDC
            break;
        // End:0x1DD9
        case 4:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_Cool, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1DDC
            break;
        // End:0xFFFF
        default:
            break;
    }
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

function SetGameManager(wGameManager gm)
{
    GameMgr = gm;
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
    strCash="Coin"
    strOneDay="1 Day"
    strCannotBuy="Cannot Repurchase"
    strCannotExpired="Cannot Renew"
    strOnlyPCoin="Coin(P)"
    strRestrictionReason[0]="Not for Auction"
    strRestrictionReason[1]="Used"
    strRestrictionReason[2]="Damage Level"
    strRestrictionReason[3]="Durability"
    strRestrictionReason[4]="Equip"
    strRestrictionReason[5]="Quick Slot"
    strRestrictionReason[6]="Unrepairable"
    strRestrictionReason[7]="Bound Item"
}