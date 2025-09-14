/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROItemBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:90
 *	Functions:13
 *
 *******************************************************************************/
class BTROItemBoxHK extends RenderObject
    dependson(RenderObject)
    dependson(BTUIColorPoolHK)
    dependson(BTROExpBarHK)
    dependson(BTItemCommonInfoHK);

enum EInvenState
{
    E_IB_INVEN,
    E_IB_INVEN_BIG,
    E_IB_REPAIR,
    E_IB_WAREHOUSE,
    E_IB_WAREHOUSE_CASH,
    E_IB_WAREHOUSE_SKILL,
    E_IB_SHOP,
    E_IB_SHOP_BIG,
    E_IB_AUCTION,
    E_IB_AUCTION_BIG,
    E_IB_MAIL,
    E_IB_POINTBOX,
    E_IB_ITEMBOX,
    E_IB_PROMOTION,
    E_IB_DURABILITY_WARNING,
    E_IB_EXPIRED_WARNING,
    E_IB_SHOP_CASH,
    E_IB_SHOP_BIG_CASH,
    E_IB_SHOP_BUY_TERM,
    E_IB_EQUIP_ITEM,
    E_IB_REMODEL_SHOP,
    E_IB_REMODEL_INVEN
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
            // End:0x72d
            break;
        // End:0xb2
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
            // End:0x72d
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
            // End:0x72d
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
            // End:0x72d
            break;
        // End:0x1a2
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
            // End:0x72d
            break;
        // End:0x1f2
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
            // End:0x72d
            break;
        // End:0x24a
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
            // End:0x72d
            break;
        // End:0x2a2
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
            // End:0x72d
            break;
        // End:0x2fa
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
            // End:0x72d
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
            // End:0x72d
            break;
        // End:0x3a2
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
            // End:0x72d
            break;
        // End:0x3ea
        case 9:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowPCBangLevel = false;
            // End:0x72d
            break;
        // End:0x43a
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
            // End:0x72d
            break;
        // End:0x48a
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
            // End:0x72d
            break;
        // End:0x4da
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
            // End:0x72d
            break;
        // End:0x52a
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
            // End:0x72d
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
            // End:0x72d
            break;
        // End:0x5d2
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
            // End:0x72d
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
            // End:0x72d
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
            // End:0x72d
            break;
        // End:0x6da
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
            // End:0x72d
            break;
        // End:0x72a
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
            // End:0x72d
            break;
        // End:0xffff
        default:
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
    ItemDurability = new class'BTROExpBarHK';
    ItemDurability.Init();
    ItemDurability.back.Image = none;
    ItemDurability.Gauge = class'BTUIResourcePoolHK'.default.sgau_weap_gauge;
    ItemDurability.PercTextPadding[3] = 2.0;
    UnderTextForm = class'BTCustomDrawHK'.static.MakeText(9, 0, "");
    RepairIconImage = class'BTUIResourcePoolHK'.default.img_repair_non;
    CashIconImage = class'BTUIResourcePoolHK'.default.new_img_cash;
    PointIconImage = class'BTUIResourcePoolHK'.default.new_img_point;
}

function Color GradeToColor(int Grade, optional bool bDurabilityX)
{
    local Color TextColor;

    switch(Grade)
    {
        // End:0x44
        case 1:
            // End:0x2c
            if(bDurabilityX)
            {
                TextColor = class'BTUIColorPoolHK'.static.GradeShop_DurabilityX();
            }
            // End:0x41
            else
            {
                TextColor = class'BTUIColorPoolHK'.static.GradeShop();
            }
            // End:0x10d
            break;
        // End:0x61
        case 2:
            TextColor = class'BTUIColorPoolHK'.static.GradeCommon();
            // End:0x10d
            break;
        // End:0x7e
        case 3:
            TextColor = class'BTUIColorPoolHK'.static.GradeNormal();
            // End:0x10d
            break;
        // End:0x9b
        case 4:
            TextColor = class'BTUIColorPoolHK'.static.GradeHigh();
            // End:0x10d
            break;
        // End:0xb8
        case 5:
            TextColor = class'BTUIColorPoolHK'.static.GradeRare();
            // End:0x10d
            break;
        // End:0xd5
        case 6:
            TextColor = class'BTUIColorPoolHK'.static.GradeLegend();
            // End:0x10d
            break;
        // End:0xf2
        case 7:
            TextColor = class'BTUIColorPoolHK'.static.GradePCBang();
            // End:0x10d
            break;
        // End:0xffff
        default:
            TextColor = class'BTUIColorPoolHK'.static.GradeBase();
            // End:0x10d Break;
            break;
    }
    return TextColor;
}

function string GradeToText(int Grade)
{
    switch(Grade)
    {
        // End:0x11
        case 1:
            return strGradeShop;
        // End:0x1c
        case 2:
            return strGradeCommon;
        // End:0x27
        case 3:
            return strGradeNormal;
        // End:0x32
        case 4:
            return strGradeHigh;
        // End:0x3d
        case 5:
            return strGradeRare;
        // End:0x48
        case 6:
            return strGradeLegend;
        // End:0x53
        case 7:
            return strGradePCBang;
        // End:0xffff
        default:
            return strGradeBase;
    }
}

function string GradeToShortText(int Grade)
{
    switch(Grade)
    {
        // End:0x11
        case 1:
            return strGradeShopS;
        // End:0x1c
        case 2:
            return strGradeCommonS;
        // End:0x27
        case 3:
            return strGradeNormalS;
        // End:0x32
        case 4:
            return strGradeHighS;
        // End:0x3d
        case 5:
            return strGradeRareS;
        // End:0x48
        case 6:
            return strGradeLegendS;
        // End:0x53
        case 7:
            return strGradePCBangS;
        // End:0xffff
        default:
            return strGradeBaseS;
    }
}

function UpdateTime(BtrDouble D)
{
    local BtrTime t, t2;

    // End:0x93
    if(ItemInfo != none && ItemInfo.CostType == 1 || ItemInfo.CostType == 4 && instanceInfo != none)
    {
        BtrDoubleToBtrTime(instanceInfo.UntilTime, t);
        BtrDoubleToBtrTime(D, t2);
        instanceInfo.LeftTime = BtrTimeSubstract(t, t2);
        Update();
    }
}

function bool IsEmpty()
{
    return ItemInfo == none;
}

function Update(optional Canvas C, optional float Delta)
{
    local int i, iSightPartID, iSilencerPartID, iBarrelPartID, iGunstockPartID, PartIndex;

    local wWeaponCustomPartsParam wcpp;
    local wSkillBaseParam cSkillParam;
    local Texture tempSkillImage;
    local wPaintGroupParam pgp;

    tempSkillImage = Texture(DynamicLoadObject("Warfare_GP_UI_UI.Store.icon_rem_skil", class'Texture'));
    // End:0x53
    if(IsEmpty())
    {
        ItemImage.Image = none;
        return;
    }
    GradeName = class'BTCustomDrawHK'.static.MakeText(9, 0, "");
    GradeName.Text = GradeToText(ItemInfo.Grade);
    GradeName.DrawColor = GradeToColor(ItemInfo.Grade, ItemInfo.CostType == 2);
    // End:0x198
    if(ItemInfo.IsCashItem() == true && instanceInfo != none && instanceInfo.CashItemInfo != none)
    {
        // End:0x14a
        if(instanceInfo != none && instanceInfo.CashItemInfo != none)
        {
            ItemName = class'BTCustomDrawHK'.static.MakeText(9, 0, instanceInfo.CashItemInfo.WZItemName);
        }
        // End:0x195
        else
        {
            ItemName = class'BTCustomDrawHK'.static.MakeText(9, 0, ItemInfo.ItemName);
            ItemName.Text = "no registered unit item";
        }
    }
    // End:0x1bf
    else
    {
        ItemName = class'BTCustomDrawHK'.static.MakeText(9, 0, ItemInfo.ItemName);
    }
    // End:0x210
    if(self.bBackgroundInfo)
    {
        ItemName.FontSize = 12;
        ItemName.FontDrawType = 1;
        ItemName.DrawColor = class'Canvas'.static.MakeColor(byte(255), 192, 0, byte(255));
    }
    // End:0x225
    else
    {
        ItemName.DrawColor = GradeName.DrawColor;
    }
    // End:0x2b6
    if(instanceInfo != none && ItemInfo.bOverlap == true)
    {
        // End:0x273
        if(instanceInfo.OverlapCount == 0)
        {
            ItemName.Text = ItemName.Text;
        }
        // End:0x2b6
        else
        {
            // End:0x2b6
            if(ItemInfo.CostType == 3)
            {
                ItemName.Text = ItemName.Text $ " x " $ string(instanceInfo.OverlapCount);
            }
        }
    }
    ItemImage = class'BTCustomDrawHK'.static.MakeImage(152, 64, 1, none);
    ItemImage.Image = ItemInfo.ItemImage;
    PartName = class'BTCustomDrawHK'.static.MakeText(9, 0, "");
    PartImage = class'BTCustomDrawHK'.static.MakeImage(152, 64, 1, none);
    PaintImage = class'BTCustomDrawHK'.static.MakeImage(152, 57, 28, none);
    bSkill = false;
    // End:0x525
    if(instanceInfo != none)
    {
        i = 0;
        J0x358:
        // End:0x438 [While If]
        if(i < ItemInfo.PartAllList.Length)
        {
            // End:0x42e
            if(ItemInfo.PartAllList[i].PartID == instanceInfo.PartID)
            {
                PartName.Text = ItemInfo.PartAllList[i].Name;
                PartImage.Image = ItemInfo.PartAllList[i].PartImage;
                // End:0x42b
                if(ItemInfo.PartAllList[i].SkillID != 0)
                {
                    bSkill = true;
                    PartSkillName = ItemInfo.PartAllList[i].SkillName;
                }
            }
            // End:0x438
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x358;
            }
        }
        // End:0x525
        if(instanceInfo.PaintID != 0)
        {
            i = 0;
            J0x453:
            // End:0x4c9 [While If]
            if(i < ItemInfo.PaintGroupList.Length)
            {
                // End:0x4bf
                if(ItemInfo.PaintGroupList[i].PaintingItemID == instanceInfo.PaintID)
                {
                    PaintImage.Image = ItemInfo.PaintGroupList[i].UI_Icon_Box;
                }
                // End:0x4c9
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x453;
                }
            }
            // End:0x525
            if(PaintImage.Image == none)
            {
                pgp = GameMgr.GetPaintGroupParam(instanceInfo.PaintID);
                PaintImage.Image = Texture(DynamicLoadObject(pgp.strUI_Icon, class'Texture'));
            }
        }
    }
    bDotSight = false;
    bScope = false;
    bSilencer = false;
    bSkill = false;
    // End:0x9d9
    if(instanceInfo != none)
    {
        iSightPartID = instanceInfo.PartID & 1023;
        iBarrelPartID = instanceInfo.PartID & 130048;
        iSilencerPartID = instanceInfo.PartID & 16646144;
        iGunstockPartID = instanceInfo.PartID & 2130706432;
        // End:0x7fa
        if(iSightPartID > 1)
        {
            // End:0x68e
            if(ItemInfo.PartSightIndices.Length == 0)
            {
                wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSightPartID);
                // End:0x68e
                if(wcpp != none && wcpp.iItemID > 0)
                {
                    // End:0x68e
                    if(wcpp.iSkillID != 0)
                    {
                        cSkillParam = GameMgr.GetSkillParam(wcpp.iSkillID);
                        bSkill = true;
                        PartSkillName = cSkillParam.strName;
                        skiImg = class'BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = tempSkillImage;
                    }
                }
            }
            i = 0;
            J0x695:
            // End:0x7fa [While If]
            if(i < ItemInfo.PartSightIndices.Length)
            {
                PartIndex = ItemInfo.PartSightIndices[i];
                // End:0x7f0
                if(iSightPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    // End:0x74e
                    if(GameMgr.CheckSRItem(ItemInfo.ItemType))
                    {
                        bScope = true;
                        scoImg = class'BTUIResourcePoolHK'.default.icon_rem_sco5;
                        scoImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    }
                    // End:0x78e
                    else
                    {
                        bDotSight = true;
                        dotImg = class'BTUIResourcePoolHK'.default.icon_rem_dotd;
                        dotImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    }
                    // End:0x7ed
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = class'BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                }
                // End:0x7fa
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x695;
                }
            }
        }
        // End:0x9d9
        if(iSilencerPartID > 1 << 17)
        {
            // End:0x8d0
            if(ItemInfo.PartSilencerIndices.Length == 0)
            {
                wcpp = GameMgr.GetWeaponCustomPartsParamByUnionedPartID(iSilencerPartID);
                // End:0x8d0
                if(wcpp != none && wcpp.iItemID > 0)
                {
                    // End:0x8d0
                    if(wcpp.iSkillID != 0)
                    {
                        cSkillParam = GameMgr.GetSkillParam(wcpp.iSkillID);
                        bSkill = true;
                        PartSkillName = cSkillParam.strName;
                        skiImg = class'BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = tempSkillImage;
                    }
                }
            }
            i = 0;
            J0x8d7:
            // End:0x9d9 [While If]
            if(i < ItemInfo.PartSilencerIndices.Length)
            {
                PartIndex = ItemInfo.PartSilencerIndices[i];
                // End:0x9cf
                if(iSilencerPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    bSilencer = true;
                    silImg = class'BTUIResourcePoolHK'.default.icon_rem_siln;
                    silImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    // End:0x9cc
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = class'BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                }
                // End:0x9d9
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x8d7;
                }
            }
        }
    }
    // End:0xd01
    if(instanceInfo != none)
    {
        ItemDurability.SetData(instanceInfo.Durability, 100000);
        // End:0xd01
        if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
        {
            // End:0xacc
            if(instanceInfo.LeftTime.Day >= 2)
            {
                colCurrentUntilTime = class'BTUIColorPoolHK'.static.DefaultWhite();
                // End:0xaa4
                if(instanceInfo.LeftTime.Hour > 0)
                {
                    strCurrentUntilTime = string(instanceInfo.LeftTime.Day + 1) $ strLeftTime[2];
                }
                // End:0xac9
                else
                {
                    strCurrentUntilTime = string(instanceInfo.LeftTime.Day) $ strLeftTime[2];
                }
            }
            // End:0xd01
            else
            {
                // End:0xb96
                if(instanceInfo.LeftTime.Day * 24 + instanceInfo.LeftTime.Hour >= 12)
                {
                    colCurrentUntilTime = class'BTUIColorPoolHK'.static.DefaultWhite();
                    strCurrentUntilTime = string(instanceInfo.LeftTime.Day * 24 + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                    // End:0xb93
                    if(instanceInfo.LeftTime.Minute > 0)
                    {
                        strCurrentUntilTime @= string(instanceInfo.LeftTime.Minute) $ strLeftTime[4];
                    }
                }
                // End:0xd01
                else
                {
                    // End:0xc6d
                    if(instanceInfo.LeftTime.Day < 0 || instanceInfo.LeftTime.Hour < 0 || instanceInfo.LeftTime.Minute < 0 || instanceInfo.LeftTime.Second < 0)
                    {
                        colCurrentUntilTime = class'BTUIColorPoolHK'.static.LabelWarning();
                        // End:0xc5d
                        if(false == bool(GameMgr.GetItemType(ItemInfo, instanceInfo) & GameMgr.FlagBuyShop))
                        {
                            strCurrentUntilTime = strLeftTime[1] $ strCannotExpired;
                        }
                        // End:0xc6a
                        else
                        {
                            strCurrentUntilTime = strLeftTime[1];
                        }
                    }
                    // End:0xd01
                    else
                    {
                        colCurrentUntilTime = class'BTUIColorPoolHK'.static.LabelWarning();
                        strCurrentUntilTime = string(instanceInfo.LeftTime.Day * 24 + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                        // End:0xd01
                        if(instanceInfo.LeftTime.Minute > 0)
                        {
                            strCurrentUntilTime @= string(instanceInfo.LeftTime.Minute) $ strLeftTime[4];
                        }
                    }
                }
            }
        }
    }
    EquipLevelImage = class'BTCustomDrawHK'.static.MakeImage(32, 32, 28, ItemInfo.EquipLevelImage);
    // End:0xd58
    if(GameMgr != none)
    {
        GameMgr.GetLevelImage(ItemInfo.EquipLevel, 0, EquipLevelImage);
    }
    bStartAni = true;
    RollCount = 0;
    RollMaxCount = 15;
    RollAniStep = 1.0;
    RollStartX = -1.0;
    bScaleAni = false;
    ScaleAniStep = 0.10;
    ScaleStartX = 5.0;
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
    // End:0xe8
    if(bDragMode)
    {
        fb.X1 = AWinPos.X1 + float(2);
        fb.X2 = AWinPos.X2 + float(2);
        fb.Y1 = AWinPos.Y1 + float(2) + float(22);
        fb.Y2 = AWinPos.Y2 - float(2) - float(7);
        class'BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        return true;
    }
    // End:0x12a
    if(bBackgroundInfo)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_item_info, 0.0, 0.0, 0.0, 0.0);
    }
    // End:0x65f
    else
    {
        // End:0x245
        if(InvenState == 3 || InvenState == 5)
        {
            // End:0x1a2
            if(bSelect)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Item_List_Sel, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            }
            // End:0x242
            else
            {
                // End:0x1f8
                if(bMouseOn)
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Item_List_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                }
                // End:0x242
                else
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Item_List_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                }
            }
        }
        // End:0x65f
        else
        {
            // End:0x36c
            if(InvenState == 6 || InvenState == 16)
            {
                // End:0x273
                if(bSelect)
                {
                }
                // End:0x369
                else
                {
                    // End:0x2c9
                    if(bFocused)
                    {
                        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Item_List_Sel, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                    }
                    // End:0x369
                    else
                    {
                        // End:0x31f
                        if(bMouseOn)
                        {
                            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Item_List_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                        }
                        // End:0x369
                        else
                        {
                            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Item_List_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                        }
                    }
                }
            }
            // End:0x65f
            else
            {
                // End:0x475
                if(InvenState == 20)
                {
                    // End:0x3d2
                    if(bFocused)
                    {
                        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ItemRemodel_List_BG_Focus, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                    }
                    // End:0x472
                    else
                    {
                        // End:0x428
                        if(bMouseOn)
                        {
                            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ItemRemodel_List_BG_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                        }
                        // End:0x472
                        else
                        {
                            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ItemRemodel_List_BG_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                        }
                    }
                }
                // End:0x65f
                else
                {
                    // End:0x488
                    if(InvenState == 21)
                    {
                    }
                    // End:0x65f
                    else
                    {
                        // End:0x563
                        if(InvenState == 18)
                        {
                            fb.X1 = AWinPos.X1 + float(2);
                            fb.X2 = AWinPos.X2 - float(2);
                            fb.Y1 = AWinPos.Y1 + float(2) + float(15);
                            fb.Y2 = AWinPos.Y2 - float(2) - float(14);
                            ItemImage.DrawType = 1;
                            class'BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
                            return true;
                        }
                        // End:0x65f
                        else
                        {
                            // End:0x5b9
                            if(bSelect)
                            {
                                class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_lobby_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                            }
                            // End:0x65f
                            else
                            {
                                // End:0x60c
                                if(bMouseOn)
                                {
                                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                                }
                                // End:0x65f
                                if(bFocused)
                                {
                                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_lobby_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    // End:0x6d9
    if(instanceInfo != none && instanceInfo.PaintID != 0)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, PaintImage, AWinPos.X1 + float(2), AWinPos.Y1 + float(26), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x6e6
    if(ItemInfo == none)
    {
        return true;
    }
    fb.X1 = AWinPos.X1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y1 = AWinPos.Y1 + float(2) + float(15);
    fb.Y2 = AWinPos.Y2 - float(2) - float(14);
    // End:0x7fa
    if(bDisplayPart)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, PartImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        class'BTCustomDrawHK'.static.DrawText(C, PartName, AWinPos.X1 + float(3), AWinPos.Y1 + float(3), AWinPos.X2, AWinPos.Y2);
        return true;
    }
    // End:0x950
    else
    {
        // End:0x860
        if(bBackgroundInfo)
        {
            ItemImage.DrawType = 4;
            class'BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1 + float(7), fb.X2, fb.Y2 + float(7));
        }
        // End:0x950
        else
        {
            ItemImage.DrawType = 1;
            // End:0x90f
            if(InvenState == 6 || InvenState == 3 || InvenState == 5 || InvenState == 16 || InvenState == 15)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2 - float(75), fb.Y2);
            }
            // End:0x950
            else
            {
                class'BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
            }
        }
    }
    fb.X1 = AWinPos.X2 - float(2) - float(22);
    fb.Y1 = AWinPos.Y1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y2 = AWinPos.Y1 + float(2) + float(22);
    // End:0xa32
    if(bDotSight)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, dotImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0xa9c
    if(bScope)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, scoImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0xb06
    if(bSilencer)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, silImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0xb70
    if(bSkill)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, skiImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    class'BTCustomDrawHK'.static.DrawText(C, ItemName, AWinPos.X1 + float(3) + float(2), AWinPos.Y1 + float(3) + float(2), AWinPos.X2, AWinPos.Y2);
    UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.DefaultWhite();
    // End:0xdd0
    if(bShowDurability)
    {
        // End:0xdd0
        if(ItemInfo != none && ItemInfo.ItemName != "")
        {
            // End:0xd1f
            if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
            {
                // End:0xcaa
                if(InvenState != 10)
                {
                    ItemDurability.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(90), AWinPos.Y1 + float(69), AWinPos.X1 + float(158), AWinPos.Y1 + float(79));
                }
                // End:0xd08
                else
                {
                    ItemDurability.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X1 + float(90), AWinPos.Y1 + float(99), AWinPos.X1 + float(158), AWinPos.Y1 + float(109));
                }
                ItemDurability.Render(C);
            }
            // End:0xdd0
            else
            {
                // End:0xdd0
                if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
                {
                    UnderTextForm.DrawColor = colCurrentUntilTime;
                    UnderTextForm.Text = strCurrentUntilTime;
                    UnderTextForm.FontDrawType = 2;
                    class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(152), AWinPos.Y2 - float(15), AWinPos.X2 - float(80), AWinPos.Y2 - float(2));
                }
            }
        }
    }
    // End:0x1182
    if(bShowPrice && ItemInfo != none)
    {
        UnderTextForm.DrawShadowColor.A = byte(255);
        // End:0xea0
        if(instanceInfo != none && instanceInfo.CashItemInfo != none)
        {
            AppendStr = GetCoinAppendString(!instanceInfo.CashItemInfo.EnableCCoin);
            UnderTextForm.Text = class'BTCustomDrawHK'.static.ToWonString(string(instanceInfo.CashItemInfo.WZCashPrice[0]));
            UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.Cash();
            UnderTextForm.FontDrawType = 8;
        }
        // End:0xf9f
        else
        {
            // End:0xf20
            if(ItemInfo.PurchaseType == 0)
            {
                AppendStr = strPoint;
                PointNCashIcon = PointIconImage;
                UnderTextForm.Text = class'BTCustomDrawHK'.static.ToWonString(string(ItemInfo.PointPrice[0]));
                UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.Point();
                UnderTextForm.FontDrawType = 8;
            }
            // End:0xf9f
            else
            {
                // End:0xf9f
                if(ItemInfo.PurchaseType == 1)
                {
                    AppendStr = GetCoinAppendString(false);
                    PointNCashIcon = CashIconImage;
                    UnderTextForm.Text = class'BTCustomDrawHK'.static.ToWonString(string(ItemInfo.CashPrice[0]));
                    UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.Cash();
                    UnderTextForm.FontDrawType = 8;
                }
            }
        }
        switch(InvenState)
        {
            // End:0x1014
            case 21:
                UnderTextForm.FontDrawType = 3;
                class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(157), AWinPos.Y2 - float(16), AWinPos.X2 - float(68), AWinPos.Y2 - float(3));
                // End:0x1156
                break;
            // End:0x10db
            case 20:
                UnderTextForm.FontDrawType = 5;
                class'BTCustomDrawHK'.static.DrawImage(C, PointNCashIcon, AWinPos.X2 - float(18), AWinPos.Y2 - float(17), AWinPos.X2 - float(5), AWinPos.Y2 - float(4));
                class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(125), AWinPos.Y2 - float(17), AWinPos.X2 - float(23), AWinPos.Y2 - float(4));
                // End:0x1156
                break;
            // End:0xffff
            default:
                UnderTextForm.Text = UnderTextForm.Text @ AppendStr;
                class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(140), AWinPos.Y2 - float(20), AWinPos.X2 - float(70), AWinPos.Y2 - float(2));
                // End:0x1156 Break;
                break;
        }
        UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.DefaultWhite();
        UnderTextForm.DrawShadowColor.A = 100;
    }
    // End:0x1227
    if(bShowDamage && instanceInfo != none)
    {
        UnderTextForm.Text = strDamage @ string(instanceInfo.DamageDegree / 1000);
        UnderTextForm.FontDrawType = 8;
        class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x128f
    if(bShowEquipLevel)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, EquipLevelImage, AWinPos.X1 + float(2), AWinPos.Y2 - float(2) - float(32), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x12b2
    if(instanceInfo != none && InvenState == 8)
    {
        CheckRedAuction();
    }
    // End:0x140c
    if(bRedAuction == false && ItemInfo.CostType == 2)
    {
        UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.GradeShop_DurabilityX();
        UnderTextForm.FontSize = 9;
        UnderTextForm.FontSize = 9;
        UnderTextForm.Text = strCannotRepair;
        UnderTextForm.FontDrawType = 6;
        // End:0x13b3
        if(AWinPos.X1 + float(20) > AWinPos.X2 - float(72))
        {
            class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X1 + float(5), AWinPos.Y2 - float(15) - float(15), AWinPos.X2 - float(2), AWinPos.Y2 - float(2) - float(15));
        }
        // End:0x140c
        else
        {
            class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X1 + float(5), AWinPos.Y2 - float(15), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
        }
    }
    // End:0x14f9
    if(instanceInfo != none && InvenState == 8)
    {
        // End:0x14f6
        if(bRedAuction)
        {
            bRedState = true;
            UnderTextForm.FontDrawType = 6;
            class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X1 + float(2), AWinPos.Y2 - float(2) - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);
        }
    }
    // End:0x1c54
    else
    {
        // End:0x1c54
        if(ItemInfo != none)
        {
            ReasonCount = 0;
            // End:0x1546
            if(bShowRestrictionLevel && MyData.myLevel < ItemInfo.EquipLevel)
            {
                bRedLevel = true;
                ++ ReasonCount;
            }
            // End:0x159b
            if(bShowRestrictionDurability && ItemInfo.CostType == 0 && instanceInfo != none && instanceInfo.Durability < 10000)
            {
                bRedRepair = true;
                ++ ReasonCount;
            }
            // End:0x15f1
            if(bShowRestrictionPrice && ItemInfo.PurchaseType == 0 && MyData.MyPoint < ItemInfo.PointPrice[0])
            {
                bRedPoint = true;
                ++ ReasonCount;
            }
            // End:0x171e
            else
            {
                // End:0x1673
                if(bShowRestrictionPrice && ItemInfo.PurchaseType == 1 && instanceInfo != none && instanceInfo.CashItemInfo != none && MyData.MyCash < instanceInfo.CashItemInfo.WZCashPrice[0])
                {
                    bRedCash = true;
                    ++ ReasonCount;
                }
                // End:0x171e
                else
                {
                    // End:0x16ef
                    if(bShowNotShopItem && ItemInfo.AdType == 0)
                    {
                        // End:0x16ec
                        if(ItemInfo.Grade != 14 && ItemInfo.AdType == 0 || instanceInfo.CashItemInfo.bWZCanBuy == false)
                        {
                            bRedCanBuy = true;
                            ++ ReasonCount;
                        }
                    }
                    // End:0x171e
                    else
                    {
                        // End:0x171e
                        if(bShowPCBangLevel == true && false == MM.CheckUsingItem(ItemInfo))
                        {
                            ++ ReasonCount;
                        }
                    }
                }
            }
            bNoReasonRedState = false;
            // End:0x1765
            if(bShowCanRepair && ItemInfo.bRepair == false || ItemInfo.CostType == 2)
            {
                bNoReasonRedState = true;
            }
            // End:0x183c
            if(bShowCanBuy)
            {
                // End:0x17ac
                if(ItemInfo.PointPrice[0] == 0)
                {
                    bNoReasonRedState = true;
                    UnderTextForm.Text = strCannotBuy;
                    UnderTextForm.FontDrawType = 8;
                }
                // End:0x17c9
                else
                {
                    UnderTextForm.Text = strOneDay;
                    UnderTextForm.FontDrawType = 8;
                }
                class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
                UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.DefaultWhite();
            }
            // End:0x1c54
            if(ReasonCount > 0 || bNoReasonRedState)
            {
                bRedState = true;
                XL = AWinPos.X2 - AWinPos.X1 - float(25 * ReasonCount) / float(2);
                YL = AWinPos.Y2 - AWinPos.Y1 - float(25) / float(2);
                // End:0x192e
                if(bRedLevel)
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, EquipLevelImage, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X1 + XL + float(25), AWinPos.Y1 + YL + float(25));
                    XL += float(25);
                }
                // End:0x19b4
                if(bRedRepair)
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_repair_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X1 + XL + float(25), AWinPos.Y1 + YL + float(25));
                    XL += float(25);
                }
                // End:0x1a3a
                if(bRedCash)
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_cash_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X1 + XL + float(25), AWinPos.Y1 + YL + float(25));
                    XL += float(25);
                }
                // End:0x1ac0
                if(bRedPoint)
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_point_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X1 + XL + float(25), AWinPos.Y1 + YL + float(25));
                    XL += float(25);
                }
                // End:0x1b7d
                if(InvenState == 7 || InvenState == 17 || InvenState == 15 || InvenState == 0 || InvenState == 12 || InvenState == 14)
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);
                }
                // End:0x1c54
                else
                {
                    // End:0x1bf2
                    if(InvenState == 20 || InvenState == 21)
                    {
                        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(20), AWinPos.X2, AWinPos.Y2);
                    }
                    // End:0x1c54
                    else
                    {
                        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1 + float(2), AWinPos.Y1 + float(19), AWinPos.X2 - float(68), AWinPos.Y2 - float(2));
                    }
                }
            }
        }
    }
    switch(RibbonState)
    {
        // End:0x1c62
        case 0:
            // End:0x1ddc
            break;
        // End:0x1cbf
        case 1:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_Own, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1ddc
            break;
        // End:0x1d1d
        case 2:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_New, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1ddc
            break;
        // End:0x1d7b
        case 3:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_Best, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1ddc
            break;
        // End:0x1dd9
        case 4:
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.Store_Item_Prop_Mark_Cool, AWinPos.X2 - float(41), AWinPos.Y1, AWinPos.X2, AWinPos.Y1 + float(41));
            // End:0x1ddc
            break;
        // End:0xffff
        default:
            return true;
    }
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
    // End:0x20f
    else
    {
        // End:0x7b
        if(ItemInfo.bSellAuction == false)
        {
            bRedAuction = true;
            UnderTextForm.Text = strRestrictionReason[0];
            RRIndex = 0;
        }
        // End:0x20f
        else
        {
            // End:0xca
            if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
            {
                bRedAuction = true;
                UnderTextForm.Text = strRestrictionReason[1];
                RRIndex = 1;
            }
            // End:0x20f
            else
            {
                // End:0x115
                if(instanceInfo != none && instanceInfo.DamageDegree >= 100000)
                {
                    bRedAuction = true;
                    UnderTextForm.Text = strRestrictionReason[2];
                    RRIndex = 2;
                }
                // End:0x20f
                else
                {
                    // End:0x160
                    if(instanceInfo != none && instanceInfo.Durability < 100000)
                    {
                        bRedAuction = true;
                        UnderTextForm.Text = strRestrictionReason[3];
                        RRIndex = 3;
                    }
                    // End:0x20f
                    else
                    {
                        // End:0x1a8
                        if(instanceInfo != none && instanceInfo.SlotPosition <= 8)
                        {
                            bRedAuction = true;
                            UnderTextForm.Text = strRestrictionReason[4];
                            RRIndex = 4;
                        }
                        // End:0x20f
                        else
                        {
                            // End:0x1d7
                            if(bRegisterQuickSlot)
                            {
                                bRedAuction = true;
                                UnderTextForm.Text = strRestrictionReason[5];
                                RRIndex = 5;
                            }
                            // End:0x20f
                            else
                            {
                                // End:0x20f
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
}

function SetMatchMaker(wMatchMaker wMM)
{
    MM = wMM;
}

function SetGameManager(wGameManager gm)
{
    GameMgr = gm;
}

function string GetCoinAppendString(bool onlyPCoin)
{
    local string strCashType;

    // End:0x17
    if(onlyPCoin)
    {
        strCashType = strOnlyPCoin;
    }
    // End:0x22
    else
    {
        strCashType = strCash;
    }
    return strCashType;
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
    strRestrictionReason[0]="Not for Auction"
    strRestrictionReason[1]="Used"
    strRestrictionReason[2]="Damage Level"
    strRestrictionReason[3]="Durability"
    strRestrictionReason[4]="Equip"
    strRestrictionReason[5]="Quick Slot"
    strRestrictionReason[6]="Unrepairable"
    strRestrictionReason[7]="Bound Item"
}