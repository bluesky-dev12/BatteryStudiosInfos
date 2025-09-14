/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTROAniItemBoxHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:78
 *	Functions:16
 *
 *******************************************************************************/
class BTROAniItemBoxHK extends RenderObject;

enum EInvenState
{
    E_IB_INVEN,
    E_IB_INVEN_BIG,
    E_IB_REPAIR,
    E_IB_WAREHOUSE,
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
    E_IB_EXPIRED_WARNING
};

var wGameManager GameMgr;
var bool bStartAni;
var float RollAniStep;
var float RollAniNextMulStep;
var int RollCount;
var int RollMaxCount;
var bool bLastReverseRoll;
var float RollStartX;
var bool bScaleAni;
var float ScaleAniStep;
var float ScaleStartX;
var float ScaleAniMax;
var float ScaleAniNextMulStep;
var bool bScaleAni2;
var float ScaleAniStep2;
var float ScaleStartX2;
var float ScaleAniMax2;
var float ScaleAniNextMulStep2;
var int CandidateSize;
var bool bDragMode;
var bool bRedAuction;
var bool bRedState;
var bool bDisplayPart;
var Text PartName;
var string PartSkillName;
var Image PartImage;
var wItemBoxHK ItemInfo;
var array<wItemBoxHK> ItemInfoPool;
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
var BTItemCommonInfoHK MyData;
var Color colCurrentUntilTime;
var string strCurrentUntilTime;
var localized string strGradeBase;
var localized string strGradeShop;
var localized string strGradeCommon;
var localized string strGradeNormal;
var localized string strGradeHigh;
var localized string strGradeRare;
var localized string strGradeLegend;
var localized string strDurability;
var localized string strDamage;
var localized string strLeftTime[5];
var localized string strPoint;
var localized string strCash;
var int RRIndex;
var bool bRegisterQuickSlot;
var localized string strRestrictionReason[6];
var BTROAniItemBoxHK.EInvenState InvenState;
var delegate<OnStartScaleAni> __OnStartScaleAni__Delegate;
var delegate<OnScaleAniChanged> __OnScaleAniChanged__Delegate;
var delegate<OnDramaEnded> __OnDramaEnded__Delegate;
var delegate<OnChangeItemInfo> __OnChangeItemInfo__Delegate;
var delegate<OnChangeItemInfoEnd> __OnChangeItemInfoEnd__Delegate;

delegate OnStartScaleAni(float scaleValue, float ScaleMax);
delegate OnScaleAniChanged(float scaleValue, float ScaleMax);
delegate OnDramaEnded();
function ChangeState(BTROAniItemBoxHK.EInvenState estate)
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
            // End:0x2d2
            break;
        // End:0x92
        case 2:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = true;
            bShowEquipLevel = true;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2d2
            break;
        // End:0xcf
        case 3:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = true;
        // End:0x10f
        case 4:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2d2
            break;
        // End:0x14f
        case 5:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            // End:0x2d2
            break;
        // End:0x18f
        case 6:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = true;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            // End:0x2d2
            break;
        // End:0x1cf
        case 7:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = true;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2d2
            break;
        // End:0x20f
        case 8:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = true;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2d2
            break;
        // End:0x24f
        case 9:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = true;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2d2
            break;
        // End:0x28f
        case 11:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2d2
            break;
        // End:0x2cf
        case 12:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2d2
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
    bBackgroundInfo = true;
    ItemDurability = new class'BTROExpBarHK';
    ItemDurability.Init();
    ItemDurability.back.Image = none;
    ItemDurability.Gauge = class'BTUIResourcePoolHK'.default.sgau_weap_gauge;
    ItemDurability.PercTextPadding[3] = 2.0;
    UnderTextForm = class'BTCustomDrawHK'.static.MakeText(9, 0, "");
    RepairIconImage = class'BTUIResourcePoolHK'.default.img_repair_non;
    CashIconImage = class'BTUIResourcePoolHK'.default.img_cash_non;
    PointIconImage = class'BTUIResourcePoolHK'.default.img_point_non;
    bStartAni = true;
    RollCount = 0;
    RollStartX = -1.0;
    RollAniStep = 0.30;
    RollAniNextMulStep = 0.90;
    RollMaxCount = 18;
    bScaleAni2 = false;
    ScaleStartX2 = 100.0;
    ScaleAniMax2 = 100.0;
    ScaleAniStep2 = -2.50;
    ScaleAniNextMulStep2 = 1.050;
}

function Color GradeToColor(int Grade)
{
    local Color TextColor;

    switch(Grade)
    {
        // End:0x23
        case 1:
            TextColor = class'BTUIColorPoolHK'.static.GradeShop();
            // End:0xcf
            break;
        // End:0x40
        case 2:
            TextColor = class'BTUIColorPoolHK'.static.GradeCommon();
            // End:0xcf
            break;
        // End:0x5d
        case 3:
            TextColor = class'BTUIColorPoolHK'.static.GradeNormal();
            // End:0xcf
            break;
        // End:0x7a
        case 4:
            TextColor = class'BTUIColorPoolHK'.static.GradeHigh();
            // End:0xcf
            break;
        // End:0x97
        case 5:
            TextColor = class'BTUIColorPoolHK'.static.GradeRare();
            // End:0xcf
            break;
        // End:0xb4
        case 6:
            TextColor = class'BTUIColorPoolHK'.static.GradeLegend();
            // End:0xcf
            break;
        // End:0xffff
        default:
            TextColor = class'BTUIColorPoolHK'.static.GradeBase();
            // End:0xcf Break;
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
        // End:0xffff
        default:
            return strGradeBase;
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

    // End:0x17
    if(IsEmpty())
    {
        ItemImage.Image = none;
        return;
    }
    GradeName = class'BTCustomDrawHK'.static.MakeText(9, 0, "");
    GradeName.Text = GradeToText(ItemInfo.Grade);
    GradeName.DrawColor = GradeToColor(ItemInfo.Grade);
    ItemName = class'BTCustomDrawHK'.static.MakeText(9, 0, ItemInfo.ItemName);
    // End:0x113
    if(ItemInfo.bOverlap == true && instanceInfo != none)
    {
        // End:0xe5
        if(instanceInfo.OverlapCount == 0)
        {
            ItemName.Text = ItemName.Text;
        }
        // End:0x113
        else
        {
            ItemName.Text = ItemName.Text $ " x " $ string(instanceInfo.OverlapCount);
        }
    }
    ItemName.DrawColor = GradeName.DrawColor;
    ItemImage = class'BTCustomDrawHK'.static.MakeImage(152, 64, 1, none);
    ItemImage.Image = ItemInfo.ItemImage;
    PartName = class'BTCustomDrawHK'.static.MakeText(9, 0, "");
    PartImage = class'BTCustomDrawHK'.static.MakeImage(152, 64, 1, none);
    bSkill = false;
    // End:0x28e
    if(instanceInfo != none)
    {
        i = 0;
        J0x1ae:
        // End:0x28e [While If]
        if(i < ItemInfo.PartAllList.Length)
        {
            // End:0x284
            if(ItemInfo.PartAllList[i].PartID == instanceInfo.PartID)
            {
                PartName.Text = ItemInfo.PartAllList[i].Name;
                PartImage.Image = ItemInfo.PartAllList[i].PartImage;
                // End:0x281
                if(ItemInfo.PartAllList[i].SkillID != 0)
                {
                    bSkill = true;
                    PartSkillName = ItemInfo.PartAllList[i].SkillName;
                }
            }
            // End:0x28e
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x1ae;
            }
        }
    }
    bDotSight = false;
    bScope = false;
    bSilencer = false;
    bSkill = false;
    // End:0x5b4
    if(instanceInfo != none)
    {
        iSightPartID = instanceInfo.PartID & 1023;
        iBarrelPartID = instanceInfo.PartID & 130048;
        iSilencerPartID = instanceInfo.PartID & 16646144;
        iGunstockPartID = instanceInfo.PartID & 2130706432;
        // End:0x49c
        if(iSightPartID > 1)
        {
            i = 0;
            J0x337:
            // End:0x49c [While If]
            if(i < ItemInfo.PartSightIndices.Length)
            {
                PartIndex = ItemInfo.PartSightIndices[i];
                // End:0x492
                if(iSightPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    // End:0x3f0
                    if(GameMgr.CheckSRItem(ItemInfo.ItemType))
                    {
                        bScope = true;
                        scoImg = class'BTUIResourcePoolHK'.default.icon_rem_sco5;
                        scoImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    }
                    // End:0x430
                    else
                    {
                        bDotSight = true;
                        dotImg = class'BTUIResourcePoolHK'.default.icon_rem_dotd;
                        dotImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    }
                    // End:0x48f
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = class'BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                }
                // End:0x49c
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x337;
                }
            }
        }
        // End:0x5b4
        if(iSilencerPartID > 1 << 17)
        {
            i = 0;
            J0x4b2:
            // End:0x5b4 [While If]
            if(i < ItemInfo.PartSilencerIndices.Length)
            {
                PartIndex = ItemInfo.PartSilencerIndices[i];
                // End:0x5aa
                if(iSilencerPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    bSilencer = true;
                    silImg = class'BTUIResourcePoolHK'.default.icon_rem_siln;
                    silImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    // End:0x5a7
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = class'BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                }
                // End:0x5b4
                else
                {
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x4b2;
                }
            }
        }
    }
    // End:0x85a
    if(instanceInfo != none && ItemInfo.ItemName != "")
    {
        ItemDurability.SetData(instanceInfo.Durability, 100000);
        // End:0x85a
        if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
        {
            // End:0x6be
            if(instanceInfo.LeftTime.Day >= 2)
            {
                colCurrentUntilTime = class'BTUIColorPoolHK'.static.DefaultWhite();
                // End:0x696
                if(instanceInfo.LeftTime.Hour > 0)
                {
                    strCurrentUntilTime = string(instanceInfo.LeftTime.Day + 1) $ strLeftTime[2];
                }
                // End:0x6bb
                else
                {
                    strCurrentUntilTime = string(instanceInfo.LeftTime.Day) $ strLeftTime[2];
                }
            }
            // End:0x85a
            else
            {
                // End:0x788
                if(instanceInfo.LeftTime.Day * 24 + instanceInfo.LeftTime.Hour >= 12)
                {
                    colCurrentUntilTime = class'BTUIColorPoolHK'.static.DefaultWhite();
                    strCurrentUntilTime = string(instanceInfo.LeftTime.Day * 24 + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                    // End:0x785
                    if(instanceInfo.LeftTime.Minute > 0)
                    {
                        strCurrentUntilTime @= string(instanceInfo.LeftTime.Minute) $ strLeftTime[4];
                    }
                }
                // End:0x85a
                else
                {
                    // End:0x7c6
                    if(instanceInfo.LeftTime.Day < 0)
                    {
                        colCurrentUntilTime = class'BTUIColorPoolHK'.static.LabelWarning();
                        strCurrentUntilTime = strLeftTime[1];
                    }
                    // End:0x85a
                    else
                    {
                        colCurrentUntilTime = class'BTUIColorPoolHK'.static.LabelWarning();
                        strCurrentUntilTime = string(instanceInfo.LeftTime.Day * 24 + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                        // End:0x85a
                        if(instanceInfo.LeftTime.Minute > 0)
                        {
                            strCurrentUntilTime @= string(instanceInfo.LeftTime.Minute) $ strLeftTime[4];
                        }
                    }
                }
            }
        }
    }
    EquipLevelImage = class'BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    GameMgr.GetLevelImage(ItemInfo.EquipLevel, 0, EquipLevelImage);
}

function SetCandidateListSize(int CandidateSize)
{
    self.CandidateSize = CandidateSize;
}

delegate OnChangeItemInfo(int Index);
delegate OnChangeItemInfoEnd();
function bool Render(Canvas C, optional float Delta)
{
    local bool bRedPoint, bRedCash, bRedRepair, bRedLevel;
    local int ReasonCount;
    local float XL, YL;
    local FloatBox fb;

    // End:0x13
    if(super.Render(C) == false)
    {
        return true;
    }
    C.Style = 5;
    Delta *= float(100);
    // End:0xf3
    if(bDragMode)
    {
        fb.X1 = AWinPos.X1 + float(2);
        fb.X2 = AWinPos.X2 + float(2);
        fb.Y1 = AWinPos.Y1 + float(2) + float(22);
        fb.Y2 = AWinPos.Y2 - float(2) - float(7);
        class'BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        return true;
    }
    // End:0x149
    if(bBackgroundInfo)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_item_info, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
    }
    // End:0x251
    else
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        // End:0x1fe
        if(bMouseOn)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_on, AWinPos.X1 + float(2), AWinPos.Y1 + float(2), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
        }
        // End:0x251
        if(bFocused)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_lobby_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }
    }
    // End:0x25e
    if(ItemInfo == none)
    {
        return true;
    }
    fb.X1 = AWinPos.X2 - float(2) - float(22);
    fb.Y1 = AWinPos.Y1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y2 = AWinPos.Y1 + float(2) + float(22);
    // End:0x340
    if(bDotSight)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, dotImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0x3aa
    if(bScope)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, scoImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0x414
    if(bSilencer)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, silImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0x47e
    if(bSkill)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, skiImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    class'BTCustomDrawHK'.static.DrawText(C, ItemName, AWinPos.X1 + float(3), AWinPos.Y1 + float(3), AWinPos.X2, AWinPos.Y2);
    // End:0x56e
    if(bBackgroundInfo && ItemName.Text != "")
    {
        C.BtrTextSize(ItemName.Text, ItemName.FontSize, XL, YL);
        class'BTCustomDrawHK'.static.DrawText(C, GradeName, AWinPos.X1 + float(3), AWinPos.Y1 + float(3) + YL + float(3), AWinPos.X2, AWinPos.Y2);
    }
    UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.DefaultWhite();
    // End:0x706
    if(ItemInfo != none && bShowDurability && ItemInfo.ItemName != "")
    {
        // End:0x655
        if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
        {
            ItemDurability.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(72), AWinPos.Y2 - float(10), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
            ItemDurability.Render(C);
        }
        // End:0x706
        else
        {
            // End:0x706
            if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
            {
                UnderTextForm.DrawColor = colCurrentUntilTime;
                UnderTextForm.Text = strCurrentUntilTime;
                UnderTextForm.FontDrawType = 2;
                class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(74), AWinPos.Y2 - float(15), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
            }
        }
    }
    // End:0x86e
    if(ItemInfo != none && bShowPrice)
    {
        // End:0x78d
        if(ItemInfo.PurchaseType == 0)
        {
            UnderTextForm.Text = class'BTCustomDrawHK'.static.ToWonString(string(ItemInfo.PointPrice[0])) @ strPoint;
            UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.Point();
            UnderTextForm.FontDrawType = 8;
        }
        // End:0x7fb
        else
        {
            // End:0x7fb
            if(ItemInfo.PurchaseType == 1)
            {
                UnderTextForm.Text = class'BTCustomDrawHK'.static.ToWonString(string(ItemInfo.CashPrice[0])) @ strCash;
                UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.Cash();
                UnderTextForm.FontDrawType = 8;
            }
        }
        class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
        UnderTextForm.DrawColor = class'BTUIColorPoolHK'.static.DefaultWhite();
    }
    // End:0x913
    if(instanceInfo != none && bShowDamage)
    {
        UnderTextForm.Text = strDamage @ string(instanceInfo.DamageDegree / 1000);
        UnderTextForm.FontDrawType = 8;
        class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x97b
    if(bShowEquipLevel)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, EquipLevelImage, AWinPos.X1 + float(2), AWinPos.Y2 - float(2) - float(32), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    C.DrawColor = class'BTUIColorPoolHK'.static.DefaultWhite();
    fb.X1 = AWinPos.X1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y1 = AWinPos.Y1 + float(2) + float(15);
    fb.Y2 = AWinPos.Y2 - float(2) - float(14);
    // End:0xaad
    if(bDisplayPart)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, PartImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        class'BTCustomDrawHK'.static.DrawText(C, PartName, AWinPos.X1 + float(3), AWinPos.Y1 + float(3), AWinPos.X2, AWinPos.Y2);
        return true;
    }
    // End:0xd97
    else
    {
        // End:0xac6
        if(bBackgroundInfo)
        {
            ItemImage.DrawType = 4;
        }
        // End:0xad3
        else
        {
            ItemImage.DrawType = 1;
        }
        // End:0xcae
        if(bStartAni)
        {
            // End:0xb38
            if(RollStartX > float(1))
            {
                RollStartX = -1.0;
                RollCount += 1;
                RollAniStep *= RollAniNextMulStep;
                // End:0xb2b
                if(RollCount != RollMaxCount)
                {
                    OnChangeItemInfo(Rand(CandidateSize));
                }
                // End:0xb35
                else
                {
                    OnChangeItemInfoEnd();
                }
            }
            // End:0xc04
            else
            {
                // End:0xba7
                if(bLastReverseRoll)
                {
                    RollStartX = 0.0;
                    bStartAni = false;
                    bScaleAni = false;
                    bScaleAni2 = true;
                    ScaleStartX = ScaleStartX2;
                    ScaleAniStep = ScaleAniStep2;
                    ScaleAniMax = ScaleAniMax2;
                    ScaleAniNextMulStep = ScaleAniNextMulStep2;
                    OnStartScaleAni(ScaleStartX, ScaleAniMax);
                }
                // End:0xc04
                else
                {
                    // End:0xbf1
                    if(RollCount == RollMaxCount)
                    {
                        RollStartX += RollAniStep * Delta * 0.030 - RollStartX;
                        // End:0xbee
                        if(RollStartX > 0.010)
                        {
                            bLastReverseRoll = true;
                        }
                    }
                    // End:0xc04
                    else
                    {
                        RollStartX += RollAniStep * Delta;
                    }
                }
            }
            class'BTCustomDrawHK'.static.DrawImageOriginalWithClipArea(C, ItemImage, fb.X1, fb.Y1 + RollStartX * AWinPos.Y2 - AWinPos.Y1, fb.X2, fb.Y2 + RollStartX * AWinPos.Y2 - AWinPos.Y1, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }
        // End:0xd97
        else
        {
            // End:0xd56
            if(bScaleAni2)
            {
                ScaleStartX += ScaleAniStep * Delta;
                ScaleAniStep = ScaleAniStep * ScaleAniNextMulStep;
                // End:0xcfe
                if(ScaleStartX <= float(0))
                {
                    OnDramaEnded();
                    bScaleAni2 = false;
                }
                // End:0xd12
                else
                {
                    OnScaleAniChanged(ScaleStartX, ScaleAniMax);
                }
                class'BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
            }
            // End:0xd97
            else
            {
                class'BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
            }
        }
    }
    // End:0xe8a
    if(instanceInfo != none && InvenState == 7)
    {
        CheckRedAuction();
        // End:0xe87
        if(bRedAuction)
        {
            bRedState = true;
            UnderTextForm.FontDrawType = 6;
            class'BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X1 + float(2), AWinPos.Y2 - float(2) - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);
        }
    }
    // End:0x1220
    else
    {
        // End:0x1220
        if(ItemInfo != none)
        {
            ReasonCount = 0;
            // End:0xed7
            if(bShowRestrictionLevel && MyData.myLevel < ItemInfo.EquipLevel)
            {
                bRedLevel = true;
                ++ ReasonCount;
            }
            // End:0xf16
            if(bShowRestrictionDurability && instanceInfo != none && instanceInfo.Durability < 10000)
            {
                bRedRepair = true;
                ++ ReasonCount;
            }
            // End:0xf6c
            if(bShowRestrictionPrice && ItemInfo.PurchaseType == 0 && MyData.MyPoint < ItemInfo.PointPrice[0])
            {
                bRedPoint = true;
                ++ ReasonCount;
            }
            // End:0xfbf
            else
            {
                // End:0xfbf
                if(bShowRestrictionPrice && ItemInfo.PurchaseType == 1 && MyData.MyCash < ItemInfo.CashPrice[0])
                {
                    bRedCash = true;
                    ++ ReasonCount;
                }
            }
            // End:0x1220
            if(ReasonCount > 0)
            {
                bRedState = true;
                XL = AWinPos.X2 - AWinPos.X1 - float(33 * ReasonCount) / float(2);
                YL = AWinPos.Y2 - AWinPos.Y1 - float(33) / float(2);
                // End:0x108c
                if(bRedLevel)
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, EquipLevelImage, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X2, AWinPos.Y2);
                    XL += float(33);
                }
                // End:0x10f8
                if(bRedRepair)
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_repair_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X2, AWinPos.Y2);
                    XL += float(33);
                }
                // End:0x1164
                if(bRedCash)
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_cash_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X2, AWinPos.Y2);
                    XL += float(33);
                }
                // End:0x11d0
                if(bRedPoint)
                {
                    class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.img_point_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X2, AWinPos.Y2);
                    XL += float(33);
                }
                class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);
            }
        }
    }
    return true;
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
    // End:0x1ad
    else
    {
        // End:0x7b
        if(ItemInfo.bSellAuction == false)
        {
            bRedAuction = true;
            UnderTextForm.Text = strRestrictionReason[0];
            RRIndex = 0;
        }
        // End:0x1ad
        else
        {
            // End:0xca
            if(ItemInfo.CostType == 1 || ItemInfo.CostType == 4)
            {
                bRedAuction = true;
                UnderTextForm.Text = strRestrictionReason[1];
                RRIndex = 1;
            }
            // End:0x1ad
            else
            {
                // End:0x108
                if(instanceInfo.DamageDegree >= 100000)
                {
                    bRedAuction = true;
                    UnderTextForm.Text = strRestrictionReason[2];
                    RRIndex = 2;
                }
                // End:0x1ad
                else
                {
                    // End:0x146
                    if(instanceInfo.Durability < 100000)
                    {
                        bRedAuction = true;
                        UnderTextForm.Text = strRestrictionReason[3];
                        RRIndex = 3;
                    }
                    // End:0x1ad
                    else
                    {
                        // End:0x181
                        if(instanceInfo.SlotPosition <= 8)
                        {
                            bRedAuction = true;
                            UnderTextForm.Text = strRestrictionReason[4];
                            RRIndex = 4;
                        }
                        // End:0x1ad
                        else
                        {
                            // End:0x1ad
                            if(bRegisterQuickSlot)
                            {
                                bRedAuction = true;
                                UnderTextForm.Text = strRestrictionReason[5];
                                RRIndex = 5;
                            }
                        }
                    }
                }
            }
        }
    }
}

function SetGameManager(wGameManager gm)
{
    GameMgr = gm;
}

defaultproperties
{
    strGradeBase="Basic"
    strGradeShop="Store"
    strGradeCommon="Loot (Common)"
    strGradeNormal="Loot (Normal)"
    strGradeHigh="Loot (Superior)"
    strGradeRare="Loot (Rare)"
    strGradeLegend="Loot (Legendary)"
    strDurability="Durability"
    strDamage="Damage Level"
    strLeftTime[0]="Time Remaining"
    strLeftTime[1]="Expired"
    strLeftTime[2]="d"
    strLeftTime[3]="h"
    strLeftTime[4]="m"
}