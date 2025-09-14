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
    E_IB_SHOP_BIG_CASH              // 17
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
var int RRIndex;
var bool bRegisterQuickSlot;
var localized string strRestrictionReason[8];
var BTROItemBoxHK.EInvenState InvenState;

function ChangeState(BTROItemBoxHK.EInvenState estate)
{
    InvenState = estate;
    switch(estate)
    {
        // End:0x52
        case 0:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0x92
        case 1:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0xD2
        case 2:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = true;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0x112
        case 4:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0x152
        case 3:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = true;
            // End:0x4C5
            break;
        // End:0x192
        case 5:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0x1DA
        case 6:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            bShowLeftSellDate = true;
            // End:0x4C5
            break;
        // End:0x222
        case 16:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            bShowLeftSellDate = true;
            // End:0x4C5
            break;
        // End:0x26A
        case 17:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            bShowLeftSellDate = true;
            // End:0x4C5
            break;
        // End:0x2B2
        case 7:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            bShowLeftSellDate = true;
            // End:0x4C5
            break;
        // End:0x2F2
        case 8:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = true;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0x332
        case 9:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0x372
        case 10:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0x3B2
        case 11:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0x3F2
        case 12:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0x432
        case 13:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x4C5
            break;
        // End:0x47A
        case 14:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowCanRepair = true;
            // End:0x4C5
            break;
        // End:0x4C2
        case 15:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            bShowCanBuy = true;
            // End:0x4C5
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
    CashIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_cash_non;
    PointIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_point_non;
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

    // End:0x7C
    if(((ItemInfo != none) && ItemInfo.CostType == 1) && instanceInfo != none)
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
    local int i, Temp;

    // End:0x17
    if(IsEmpty())
    {
        ItemImage.Image = none;
        return;
    }
    GradeName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    GradeName.Text = GradeToText(ItemInfo.Grade);
    GradeName.DrawColor = GradeToColor(ItemInfo.Grade, ItemInfo.CostType == 2);
    // End:0x139
    if(instanceInfo.CashItemInfo != none)
    {
        // End:0x106
        if(ItemInfo.CostType == 3)
        {
            ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, (("" $ instanceInfo.CashItemInfo.WZItemName) $ " x ") $ string(instanceInfo.CashItemInfo.WZPeriod[0]));            
        }
        else
        {
            ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, instanceInfo.CashItemInfo.WZItemName);
        }        
    }
    else
    {
        ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, ItemInfo.ItemName);
    }
    // End:0x17B
    if(self.bBackgroundInfo)
    {
        ItemName.FontSize = 12;
    }
    // End:0x20D
    if(((instanceInfo.CashItemInfo == none) && ItemInfo.bOverlap == true) && instanceInfo != none)
    {
        // End:0x1DF
        if(instanceInfo.OverlapCount == 0)
        {
            ItemName.Text = ItemName.Text;            
        }
        else
        {
            ItemName.Text = (ItemName.Text $ " x ") $ string(instanceInfo.OverlapCount);
        }
    }
    ItemName.DrawColor = GradeName.DrawColor;
    ItemImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 1, none);
    ItemImage.Image = ItemInfo.ItemImage;
    PartName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    PartImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 64, 1, none);
    PaintImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(152, 57, 28, none);
    bSkill = false;
    // End:0x435
    if(instanceInfo != none)
    {
        i = 0;
        J0x2C4:

        // End:0x3A4 [Loop If]
        if(i < ItemInfo.PartGroupList.Length)
        {
            // End:0x39A
            if(ItemInfo.PartGroupList[i].PartID == instanceInfo.PartID)
            {
                PartName.Text = ItemInfo.PartGroupList[i].Name;
                PartImage.Image = ItemInfo.PartGroupList[i].UI_Image;
                // End:0x397
                if(ItemInfo.PartGroupList[i].SkillID != 0)
                {
                    bSkill = true;
                    PartSkillName = ItemInfo.PartGroupList[i].SkillName;
                }
                // [Explicit Break]
                goto J0x3A4;
            }
            i++;
            // [Loop Continue]
            goto J0x2C4;
        }
        J0x3A4:

        // End:0x435
        if(instanceInfo.PaintID != 0)
        {
            i = 0;
            J0x3BF:

            // End:0x435 [Loop If]
            if(i < ItemInfo.PaintGroupList.Length)
            {
                // End:0x42B
                if(ItemInfo.PaintGroupList[i].PaintingItemID == instanceInfo.PaintID)
                {
                    PaintImage.Image = ItemInfo.PaintGroupList[i].UI_Icon_Box;
                    // [Explicit Break]
                    goto J0x435;
                }
                ++i;
                // [Loop Continue]
                goto J0x3BF;
            }
        }
    }
    J0x435:

    bDotSight = false;
    bScope = false;
    bSilencer = false;
    bSkill = false;
    // End:0x66D
    if(instanceInfo != none)
    {
        i = 0;
        J0x467:

        // End:0x66D [Loop If]
        if(i < ItemInfo.PartGroupList.Length)
        {
            // End:0x663
            if(ItemInfo.PartGroupList[i].PartID == instanceInfo.PartID)
            {
                // End:0x584
                if((ItemInfo.PartGroupList[i].SightID != 0) && ItemInfo.PartGroupList[i].SightImage != none)
                {
                    // End:0x544
                    if(ItemInfo.ItemType == 2)
                    {
                        bScope = true;
                        scoImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_sco5;
                        scoImg.Image = ItemInfo.PartGroupList[i].SightImage;                        
                    }
                    else
                    {
                        bDotSight = true;
                        dotImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_dotd;
                        dotImg.Image = ItemInfo.PartGroupList[i].SightImage;
                    }
                }
                // End:0x604
                if((ItemInfo.PartGroupList[i].SilencerID != 0) && ItemInfo.PartGroupList[i].SilencerImage != none)
                {
                    bSilencer = true;
                    silImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_siln;
                    silImg.Image = ItemInfo.PartGroupList[i].SilencerImage;
                }
                // End:0x663
                if(ItemInfo.PartGroupList[i].SkillID != 0)
                {
                    bSkill = true;
                    skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                    skiImg.Image = ItemInfo.PartGroupList[i].SkillImage;
                }
            }
            i++;
            // [Loop Continue]
            goto J0x467;
        }
    }
    // End:0x9B7
    if(instanceInfo != none)
    {
        ItemDurability.SetData(instanceInfo.Durability, 100000);
        // End:0x8FC
        if(instanceInfo.CashItemInfo == none)
        {
            // End:0x8F9
            if(ItemInfo.CostType == 1)
            {
                // End:0x75D
                if(instanceInfo.LeftTime.Day >= 2)
                {
                    colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
                    // End:0x735
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
                    // End:0x827
                    if(((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) >= 12)
                    {
                        colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
                        strCurrentUntilTime = string((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                        // End:0x824
                        if(instanceInfo.LeftTime.Minute > 0)
                        {
                            strCurrentUntilTime @= (string(instanceInfo.LeftTime.Minute) $ strLeftTime[4]);
                        }                        
                    }
                    else
                    {
                        // End:0x865
                        if(instanceInfo.LeftTime.Day < 0)
                        {
                            colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();
                            strCurrentUntilTime = strLeftTime[1];                            
                        }
                        else
                        {
                            colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();
                            strCurrentUntilTime = string((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                            // End:0x8F9
                            if(instanceInfo.LeftTime.Minute > 0)
                            {
                                strCurrentUntilTime @= (string(instanceInfo.LeftTime.Minute) $ strLeftTime[4]);
                            }
                        }
                    }
                }
            }            
        }
        else
        {
            // End:0x9B7
            if(ItemInfo.CostType == 1)
            {
                colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
                // End:0x985
                if(instanceInfo.CashItemInfo.WZPeriod[0] > (48 * 3600))
                {
                    strCurrentUntilTime = string(instanceInfo.CashItemInfo.WZPeriod[0] / (24 * 3600)) $ strLeftTime[2];                    
                }
                else
                {
                    strCurrentUntilTime = string(instanceInfo.CashItemInfo.WZPeriod[0] / 3600) $ strLeftTime[3];
                }
            }
        }
    }
    // End:0x9E5
    if(ItemInfo != none)
    {
        GameMgr.GetLevelImage(ItemInfo.EquipLevel, 0, EquipLevelImage);
    }
    EquipLevelImage.DrawType = 28;
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
    local bool bRedPoint, bRedCash, bRedRepair, bRedLevel;
    local int ReasonCount;
    local float XL, YL;
    local FloatBox fb;
    local float fbWidth, fbHeight;

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
    // End:0x13E
    if(bBackgroundInfo)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_item_info, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);        
    }
    else
    {
        // End:0x2B5
        if(int(InvenState) == int(3))
        {
            // End:0x1BC
            if(bSelect)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_inven_foc, AWinPos.X1 + float(2), AWinPos.Y1 + float(2), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));                
            }
            else
            {
                // End:0x212
                if(bFocused)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_inven_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                    
                }
                else
                {
                    // End:0x268
                    if(bMouseOn)
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_inven_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                        
                    }
                    else
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_inven_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                    }
                }
            }            
        }
        else
        {
            // End:0x42C
            if(int(InvenState) == int(6))
            {
                // End:0x333
                if(bSelect)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_store_foc, AWinPos.X1 + float(2), AWinPos.Y1 + float(2), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));                    
                }
                else
                {
                    // End:0x389
                    if(bFocused)
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_store_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                        
                    }
                    else
                    {
                        // End:0x3DF
                        if(bMouseOn)
                        {
                            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_store_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                            
                        }
                        else
                        {
                            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_store_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                        }
                    }
                }                
            }
            else
            {
                // End:0x482
                if(bSelect)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);                    
                }
                else
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                    // End:0x51F
                    if(bMouseOn)
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_on, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                    }
                    // End:0x572
                    if(bFocused)
                    {
                        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
                    }
                }
            }
        }
    }
    // End:0x5DF
    if(instanceInfo.PaintID != 0)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, PaintImage, AWinPos.X1 + float(2), AWinPos.Y1 + float(26), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x5EC
    if(ItemInfo == none)
    {
        return true;
    }
    fb.X1 = AWinPos.X1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y1 = (AWinPos.Y1 + float(2)) + float(15);
    fb.Y2 = (AWinPos.Y2 - float(2)) - float(14);
    // End:0x700
    if(bDisplayPart)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, PartImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, PartName, AWinPos.X1 + float(3), AWinPos.Y1 + float(3), AWinPos.X2, AWinPos.Y2);
        return true;        
    }
    else
    {
        // End:0x766
        if(bBackgroundInfo)
        {
            ItemImage.DrawType = 4;
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1 + float(7), fb.X2, fb.Y2 + float(7));            
        }
        else
        {
            ItemImage.DrawType = 1;
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        }
    }
    fb.X1 = (AWinPos.X2 - float(2)) - float(22);
    fb.Y1 = AWinPos.Y1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y2 = (AWinPos.Y1 + float(2)) + float(22);
    // End:0x896
    if(bDotSight)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, dotImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0x900
    if(bScope)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, scoImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0x96A
    if(bSilencer)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, silImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0x9D4
    if(bSkill)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, skiImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, ItemName, (AWinPos.X1 + float(3)) + float(2), (AWinPos.Y1 + float(3)) + float(2), AWinPos.X2, AWinPos.Y2);
    // End:0xADC
    if(bBackgroundInfo && ItemName.Text != "")
    {
        C.BtrTextSize(ItemName.Text, ItemName.FontSize, XL, YL);
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, GradeName, (AWinPos.X1 + float(3)) + float(2), (((AWinPos.Y1 + float(3)) + float(2)) + YL) + float(4), AWinPos.X2, AWinPos.Y2);
    }
    UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    // End:0xD3E
    if(bShowDurability)
    {
        // End:0xC81
        if((((ItemInfo != none) && ItemInfo.ItemName != "") && instanceInfo != none) && instanceInfo.CashItemInfo == none)
        {
            // End:0xBE4
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                ItemDurability.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(72), AWinPos.Y2 - float(10), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
                ItemDurability.Render(C);                
            }
            else
            {
                // End:0xC7E
                if(ItemInfo.CostType == 1)
                {
                    UnderTextForm.DrawColor = colCurrentUntilTime;
                    UnderTextForm.Text = strCurrentUntilTime;
                    UnderTextForm.FontDrawType = 2;
                    Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(74), AWinPos.Y2 - float(15), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
                }
            }            
        }
        else
        {
            // End:0xD3E
            if(((instanceInfo != none) && instanceInfo.CashItemInfo != none) && ItemInfo.CostType == 1)
            {
                UnderTextForm.DrawColor = colCurrentUntilTime;
                UnderTextForm.Text = strCurrentUntilTime;
                UnderTextForm.FontDrawType = 2;
                Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(74), AWinPos.Y2 - float(15), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
            }
        }
    }
    // End:0xF53
    if(bShowPrice && ItemInfo != none)
    {
        UnderTextForm.DrawShadowColor.A = byte(255);
        // End:0xDEF
        if((instanceInfo != none) && instanceInfo.CashItemInfo != none)
        {
            UnderTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(instanceInfo.CashItemInfo.WZCashPrice[0])) @ strCash;
            UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
            UnderTextForm.FontDrawType = 8;            
        }
        else
        {
            // End:0xE60
            if(ItemInfo.PurchaseType == 0)
            {
                UnderTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(ItemInfo.PointPrice[0])) @ strPoint;
                UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Point();
                UnderTextForm.FontDrawType = 8;                
            }
            else
            {
                // End:0xECE
                if(ItemInfo.PurchaseType == 1)
                {
                    UnderTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(ItemInfo.CashPrice[0])) @ strCash;
                    UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
                    UnderTextForm.FontDrawType = 8;
                }
            }
        }
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
        UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
        UnderTextForm.DrawShadowColor.A = 100;
    }
    // End:0xFF8
    if(bShowDamage && instanceInfo != none)
    {
        UnderTextForm.Text = strDamage @ string(instanceInfo.DamageDegree / 1000);
        UnderTextForm.FontDrawType = 8;
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x1060
    if(bShowEquipLevel)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, EquipLevelImage, AWinPos.X1 + float(2), (AWinPos.Y2 - float(2)) - float(32), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x1083
    if((instanceInfo != none) && int(InvenState) == int(8))
    {
        CheckRedAuction();
    }
    // End:0x11DD
    if((bRedAuction == false) && ItemInfo.CostType == 2)
    {
        UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeShop_DurabilityX();
        UnderTextForm.FontSize = 9;
        UnderTextForm.FontSize = 9;
        UnderTextForm.Text = strCannotRepair;
        UnderTextForm.FontDrawType = 6;
        // End:0x1184
        if((AWinPos.X1 + float(20)) > (AWinPos.X2 - float(72)))
        {
            Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X1 + float(5), (AWinPos.Y2 - float(15)) - float(15), AWinPos.X2 - float(2), (AWinPos.Y2 - float(2)) - float(15));            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X1 + float(5), AWinPos.Y2 - float(15), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
        }
    }
    // End:0x12CA
    if((instanceInfo != none) && int(InvenState) == int(8))
    {
        // End:0x12C7
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
        // End:0x17F1
        if(ItemInfo != none)
        {
            ReasonCount = 0;
            // End:0x1317
            if(bShowRestrictionLevel && MyData.myLevel < ItemInfo.EquipLevel)
            {
                bRedLevel = true;
                ReasonCount++;
            }
            // End:0x1356
            if((bShowRestrictionDurability && instanceInfo != none) && instanceInfo.Durability < 10000)
            {
                bRedRepair = true;
                ReasonCount++;
            }
            // End:0x13AC
            if((bShowRestrictionPrice && ItemInfo.PurchaseType == 0) && MyData.MyPoint < ItemInfo.PointPrice[0])
            {
                bRedPoint = true;
                ReasonCount++;                
            }
            else
            {
                // End:0x13FF
                if((bShowRestrictionPrice && ItemInfo.PurchaseType == 1) && MyData.MyCash < ItemInfo.CashPrice[0])
                {
                    bRedCash = true;
                    ReasonCount++;
                }
            }
            bNoReasonRedState = false;
            // End:0x1446
            if(bShowCanRepair && (ItemInfo.bRepair == false) || ItemInfo.CostType == 2)
            {
                bNoReasonRedState = true;
            }
            // End:0x151D
            if(bShowCanBuy)
            {
                // End:0x148D
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
            // End:0x17F1
            if((ReasonCount > 0) || bNoReasonRedState)
            {
                bRedState = true;
                XL = ((AWinPos.X2 - AWinPos.X1) - float(25 * ReasonCount)) / float(2);
                YL = ((AWinPos.Y2 - AWinPos.Y1) - float(25)) / float(2);
                // End:0x160F
                if(bRedLevel)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, EquipLevelImage, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x1695
                if(bRedRepair)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_repair_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x171B
                if(bRedCash)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_cash_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                // End:0x17A1
                if(bRedPoint)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_point_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, (AWinPos.X1 + XL) + float(25), (AWinPos.Y1 + YL) + float(25));
                    XL += float(25);
                }
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);
            }
        }
    }
    switch(RibbonState)
    {
        // End:0x17FF
        case 0:
            // End:0x1949
            break;
        // End:0x1850
        case 1:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_hold, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x1949
            break;
        // End:0x18A2
        case 2:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_new, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x1949
            break;
        // End:0x18F4
        case 3:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_popul, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x1949
            break;
        // End:0x1946
        case 4:
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_recom, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
            // End:0x1949
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
            // End:0xB3
            if(ItemInfo.CostType == 1)
            {
                bRedAuction = true;
                UnderTextForm.Text = strRestrictionReason[1];
                RRIndex = 1;                
            }
            else
            {
                // End:0xFE
                if((instanceInfo != none) && instanceInfo.DamageDegree >= 100000)
                {
                    bRedAuction = true;
                    UnderTextForm.Text = strRestrictionReason[2];
                    RRIndex = 2;                    
                }
                else
                {
                    // End:0x149
                    if((instanceInfo != none) && instanceInfo.Durability < 100000)
                    {
                        bRedAuction = true;
                        UnderTextForm.Text = strRestrictionReason[3];
                        RRIndex = 3;                        
                    }
                    else
                    {
                        // End:0x191
                        if((instanceInfo != none) && instanceInfo.SlotPosition <= 8)
                        {
                            bRedAuction = true;
                            UnderTextForm.Text = strRestrictionReason[4];
                            RRIndex = 4;                            
                        }
                        else
                        {
                            // End:0x1C0
                            if(bRegisterQuickSlot)
                            {
                                bRedAuction = true;
                                UnderTextForm.Text = strRestrictionReason[5];
                                RRIndex = 5;                                
                            }
                            else
                            {
                                // End:0x1F8
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

defaultproperties
{
    strLeftCount="?? ??"
    strCannotRepair="????"
    strGradeBase="??"
    strGradeShop="??"
    strGradeCommon="???(??)"
    strGradeNormal="???(??)"
    strGradeHigh="???(??)"
    strGradeRare="???(??)"
    strGradeLegend="???(??)"
    strGradePCBang="PC?"
    strGradeBaseS="??"
    strGradeShopS="??"
    strGradeCommonS="??"
    strGradeNormalS="??"
    strGradeHighS="??"
    strGradeRareS="??"
    strGradeLegendS="??"
    strDurability="???"
    strDamage="???"
    strLeftTime[0]="????"
    strLeftTime[1]="?? ??"
    strLeftTime[2]="?"
    strLeftTime[3]="??"
    strLeftTime[4]="?"
    strLeftTime[5]="???"
    strPoint="???"
    strCash="??"
    strOneDay="1?"
    strCannotBuy="??? ??"
    strRestrictionReason[0]="?? ??"
    strRestrictionReason[1]="??"
    strRestrictionReason[2]="???"
    strRestrictionReason[3]="???"
    strRestrictionReason[4]="??"
    strRestrictionReason[5]="???"
    strRestrictionReason[6]="?? ??"
    strRestrictionReason[7]="?? ???"
}