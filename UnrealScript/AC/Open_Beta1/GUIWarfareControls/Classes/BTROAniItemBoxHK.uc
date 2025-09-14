class BTROAniItemBoxHK extends RenderObject;

enum EInvenState
{
    E_IB_INVEN,                     // 0
    E_IB_INVEN_BIG,                 // 1
    E_IB_REPAIR,                    // 2
    E_IB_WAREHOUSE,                 // 3
    E_IB_WAREHOUSE_SKILL,           // 4
    E_IB_SHOP,                      // 5
    E_IB_SHOP_BIG,                  // 6
    E_IB_AUCTION,                   // 7
    E_IB_AUCTION_BIG,               // 8
    E_IB_MAIL,                      // 9
    E_IB_POINTBOX,                  // 10
    E_IB_ITEMBOX,                   // 11
    E_IB_PROMOTION,                 // 12
    E_IB_DURABILITY_WARNING,        // 13
    E_IB_EXPIRED_WARNING            // 14
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
//var delegate<OnStartScaleAni> __OnStartScaleAni__Delegate;
//var delegate<OnScaleAniChanged> __OnScaleAniChanged__Delegate;
//var delegate<OnDramaEnded> __OnDramaEnded__Delegate;
//var delegate<OnChangeItemInfo> __OnChangeItemInfo__Delegate;
//var delegate<OnChangeItemInfoEnd> __OnChangeItemInfoEnd__Delegate;

delegate OnStartScaleAni(float scaleValue, float ScaleMax)
{
    //return;    
}

delegate OnScaleAniChanged(float scaleValue, float ScaleMax)
{
    //return;    
}

delegate OnDramaEnded()
{
    //return;    
}

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
            // End:0x2D2
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
            // End:0x2D2
            break;
        // End:0xCF
        case 3:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = true;
        // End:0x10F
        case 4:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2D2
            break;
        // End:0x14F
        case 5:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            // End:0x2D2
            break;
        // End:0x18F
        case 6:
            bShowDurability = false;
            bShowPrice = true;
            bShowDamage = false;
            bShowEquipLevel = true;
            bShowRestrictionLevel = true;
            bShowRestrictionPrice = true;
            bShowRestrictionDurability = false;
            // End:0x2D2
            break;
        // End:0x1CF
        case 7:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = true;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2D2
            break;
        // End:0x20F
        case 8:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = true;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2D2
            break;
        // End:0x24F
        case 9:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = true;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2D2
            break;
        // End:0x28F
        case 11:
            bShowDurability = true;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2D2
            break;
        // End:0x2CF
        case 12:
            bShowDurability = false;
            bShowPrice = false;
            bShowDamage = false;
            bShowEquipLevel = false;
            bShowRestrictionLevel = false;
            bShowRestrictionPrice = false;
            bShowRestrictionDurability = false;
            // End:0x2D2
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
    bBackgroundInfo = true;
    ItemDurability = new Class'GUIWarfareControls_Decompressed.BTROExpBarHK';
    ItemDurability.Init();
    ItemDurability.back.Image = none;
    ItemDurability.Gauge = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.sgau_weap_gauge;
    ItemDurability.PercTextPadding[3] = 2.0000000;
    UnderTextForm = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    RepairIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_repair_non;
    CashIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_cash_non;
    PointIconImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_point_non;
    bStartAni = true;
    RollCount = 0;
    RollStartX = -1.0000000;
    RollAniStep = 0.3000000;
    RollAniNextMulStep = 0.9000000;
    RollMaxCount = 18;
    bScaleAni2 = false;
    ScaleStartX2 = 100.0000000;
    ScaleAniMax2 = 100.0000000;
    ScaleAniStep2 = -2.5000000;
    ScaleAniNextMulStep2 = 1.0500000;
    //return;    
}

function Color GradeToColor(int Grade)
{
    local Color TextColor;

    switch(Grade)
    {
        // End:0x23
        case 1:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeShop();
            // End:0xCF
            break;
        // End:0x40
        case 2:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeCommon();
            // End:0xCF
            break;
        // End:0x5D
        case 3:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeNormal();
            // End:0xCF
            break;
        // End:0x7A
        case 4:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeHigh();
            // End:0xCF
            break;
        // End:0x97
        case 5:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeRare();
            // End:0xCF
            break;
        // End:0xB4
        case 6:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeLegend();
            // End:0xCF
            break;
        // End:0xFFFF
        default:
            TextColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.GradeBase();
            // End:0xCF
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
        // End:0xFFFF
        default:
            return strGradeBase;
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

    // End:0x17
    if(IsEmpty())
    {
        ItemImage.Image = none;
        return;
    }
    GradeName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, "");
    GradeName.Text = GradeToText(ItemInfo.Grade);
    GradeName.DrawColor = GradeToColor(ItemInfo.Grade);
    ItemName = Class'Engine.BTCustomDrawHK'.static.MakeText(9, 0, ItemInfo.ItemName);
    // End:0x113
    if((ItemInfo.bOverlap == true) && instanceInfo != none)
    {
        // End:0xE5
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
    bSkill = false;
    // End:0x28E
    if(instanceInfo != none)
    {
        i = 0;
        J0x1AE:

        // End:0x28E [Loop If]
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
                // [Explicit Break]
                goto J0x28E;
            }
            i++;
            // [Loop Continue]
            goto J0x1AE;
        }
    }
    J0x28E:

    bDotSight = false;
    bScope = false;
    bSilencer = false;
    bSkill = false;
    // End:0x5B4
    if(instanceInfo != none)
    {
        iSightPartID = instanceInfo.PartID & 1023;
        iBarrelPartID = instanceInfo.PartID & 130048;
        iSilencerPartID = instanceInfo.PartID & 16646144;
        iGunstockPartID = instanceInfo.PartID & 2130706432;
        // End:0x49C
        if(iSightPartID > 1)
        {
            i = 0;
            J0x337:

            // End:0x49C [Loop If]
            if(i < ItemInfo.PartSightIndices.Length)
            {
                PartIndex = ItemInfo.PartSightIndices[i];
                // End:0x492
                if(iSightPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    // End:0x3F0
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
                    // End:0x48F
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                    // [Explicit Break]
                    goto J0x49C;
                }
                i++;
                // [Loop Continue]
                goto J0x337;
            }
        }
        J0x49C:

        // End:0x5B4
        if(iSilencerPartID > (1 << 17))
        {
            i = 0;
            J0x4B2:

            // End:0x5B4 [Loop If]
            if(i < ItemInfo.PartSilencerIndices.Length)
            {
                PartIndex = ItemInfo.PartSilencerIndices[i];
                // End:0x5AA
                if(iSilencerPartID == ItemInfo.PartAllList[PartIndex].PartID)
                {
                    bSilencer = true;
                    silImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_siln;
                    silImg.Image = ItemInfo.PartAllList[PartIndex].PartIconImage;
                    // End:0x5A7
                    if(ItemInfo.PartAllList[PartIndex].SkillID != 0)
                    {
                        bSkill = true;
                        skiImg = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.icon_rem_skil;
                        skiImg.Image = ItemInfo.PartAllList[PartIndex].SkillImage;
                    }
                    // [Explicit Break]
                    goto J0x5B4;
                }
                i++;
                // [Loop Continue]
                goto J0x4B2;
            }
        }
    }
    J0x5B4:

    // End:0x85A
    if((instanceInfo != none) && ItemInfo.ItemName != "")
    {
        ItemDurability.SetData(instanceInfo.Durability, 100000);
        // End:0x85A
        if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
        {
            // End:0x6BE
            if(instanceInfo.LeftTime.Day >= 2)
            {
                colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
                // End:0x696
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
                // End:0x788
                if(((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) >= 12)
                {
                    colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
                    strCurrentUntilTime = string((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                    // End:0x785
                    if(instanceInfo.LeftTime.Minute > 0)
                    {
                        strCurrentUntilTime @= (string(instanceInfo.LeftTime.Minute) $ strLeftTime[4]);
                    }                    
                }
                else
                {
                    // End:0x7C6
                    if(instanceInfo.LeftTime.Day < 0)
                    {
                        colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();
                        strCurrentUntilTime = strLeftTime[1];                        
                    }
                    else
                    {
                        colCurrentUntilTime = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.LabelWarning();
                        strCurrentUntilTime = string((instanceInfo.LeftTime.Day * 24) + instanceInfo.LeftTime.Hour) $ strLeftTime[3];
                        // End:0x85A
                        if(instanceInfo.LeftTime.Minute > 0)
                        {
                            strCurrentUntilTime @= (string(instanceInfo.LeftTime.Minute) $ strLeftTime[4]);
                        }
                    }
                }
            }
        }
    }
    EquipLevelImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(32, 32, 0, none);
    GameMgr.GetLevelImage(ItemInfo.EquipLevel, 0, EquipLevelImage);
    //return;    
}

function SetCandidateListSize(int CandidateSize)
{
    self.CandidateSize = CandidateSize;
    //return;    
}

delegate OnChangeItemInfo(int Index)
{
    //return;    
}

delegate OnChangeItemInfoEnd()
{
    //return;    
}

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
    // End:0xF3
    if(bDragMode)
    {
        fb.X1 = AWinPos.X1 + float(2);
        fb.X2 = AWinPos.X2 + float(2);
        fb.Y1 = (AWinPos.Y1 + float(2)) + float(22);
        fb.Y2 = (AWinPos.Y2 - float(2)) - float(7);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        return true;
    }
    // End:0x149
    if(bBackgroundInfo)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_item_info, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_n, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        // End:0x1FE
        if(bMouseOn)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_on, AWinPos.X1 + float(2), AWinPos.Y1 + float(2), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
        }
        // End:0x251
        if(bFocused)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli, AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);
        }
    }
    // End:0x25E
    if(ItemInfo == none)
    {
        return true;
    }
    fb.X1 = (AWinPos.X2 - float(2)) - float(22);
    fb.Y1 = AWinPos.Y1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y2 = (AWinPos.Y1 + float(2)) + float(22);
    // End:0x340
    if(bDotSight)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, dotImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0x3AA
    if(bScope)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, scoImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0x414
    if(bSilencer)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, silImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    // End:0x47E
    if(bSkill)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, skiImg, fb.X1, fb.Y1, fb.X2, fb.Y2);
        fb.X1 -= float(24);
        fb.X2 -= float(24);
    }
    Class'Engine.BTCustomDrawHK'.static.DrawText(C, ItemName, AWinPos.X1 + float(3), AWinPos.Y1 + float(3), AWinPos.X2, AWinPos.Y2);
    // End:0x56E
    if(bBackgroundInfo && ItemName.Text != "")
    {
        C.BtrTextSize(ItemName.Text, ItemName.FontSize, XL, YL);
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, GradeName, AWinPos.X1 + float(3), ((AWinPos.Y1 + float(3)) + YL) + float(3), AWinPos.X2, AWinPos.Y2);
    }
    UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    // End:0x706
    if(((ItemInfo != none) && bShowDurability) && ItemInfo.ItemName != "")
    {
        // End:0x655
        if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
        {
            ItemDurability.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(AWinPos.X2 - float(72), AWinPos.Y2 - float(10), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
            ItemDurability.Render(C);            
        }
        else
        {
            // End:0x706
            if((ItemInfo.CostType == 1) || ItemInfo.CostType == 4)
            {
                UnderTextForm.DrawColor = colCurrentUntilTime;
                UnderTextForm.Text = strCurrentUntilTime;
                UnderTextForm.FontDrawType = 2;
                Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(74), AWinPos.Y2 - float(15), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
            }
        }
    }
    // End:0x86E
    if((ItemInfo != none) && bShowPrice)
    {
        // End:0x78D
        if(ItemInfo.PurchaseType == 0)
        {
            UnderTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(ItemInfo.PointPrice[0])) @ strPoint;
            UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Point();
            UnderTextForm.FontDrawType = 8;            
        }
        else
        {
            // End:0x7FB
            if(ItemInfo.PurchaseType == 1)
            {
                UnderTextForm.Text = Class'Engine.BTCustomDrawHK'.static.ToWonString(string(ItemInfo.CashPrice[0])) @ strCash;
                UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.Cash();
                UnderTextForm.FontDrawType = 8;
            }
        }
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
        UnderTextForm.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    }
    // End:0x913
    if((instanceInfo != none) && bShowDamage)
    {
        UnderTextForm.Text = strDamage @ string(instanceInfo.DamageDegree / 1000);
        UnderTextForm.FontDrawType = 8;
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, UnderTextForm, AWinPos.X2 - float(73), AWinPos.Y2 - float(20), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    // End:0x97B
    if(bShowEquipLevel)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, EquipLevelImage, AWinPos.X1 + float(2), (AWinPos.Y2 - float(2)) - float(32), AWinPos.X2 - float(2), AWinPos.Y2 - float(2));
    }
    C.DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.DefaultWhite();
    fb.X1 = AWinPos.X1 + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y1 = (AWinPos.Y1 + float(2)) + float(15);
    fb.Y2 = (AWinPos.Y2 - float(2)) - float(14);
    // End:0xAAD
    if(bDisplayPart)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, PartImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
        Class'Engine.BTCustomDrawHK'.static.DrawText(C, PartName, AWinPos.X1 + float(3), AWinPos.Y1 + float(3), AWinPos.X2, AWinPos.Y2);
        return true;        
    }
    else
    {
        // End:0xAC6
        if(bBackgroundInfo)
        {
            ItemImage.DrawType = 4;            
        }
        else
        {
            ItemImage.DrawType = 1;
        }
        // End:0xCAE
        if(bStartAni)
        {
            // End:0xB38
            if(RollStartX > float(1))
            {
                RollStartX = -1.0000000;
                RollCount += 1;
                RollAniStep *= RollAniNextMulStep;
                // End:0xB2B
                if(RollCount != RollMaxCount)
                {
                    OnChangeItemInfo(Rand(CandidateSize));                    
                }
                else
                {
                    OnChangeItemInfoEnd();
                }                
            }
            else
            {
                // End:0xBA7
                if(bLastReverseRoll)
                {
                    RollStartX = 0.0000000;
                    bStartAni = false;
                    bScaleAni = false;
                    bScaleAni2 = true;
                    ScaleStartX = ScaleStartX2;
                    ScaleAniStep = ScaleAniStep2;
                    ScaleAniMax = ScaleAniMax2;
                    ScaleAniNextMulStep = ScaleAniNextMulStep2;
                    OnStartScaleAni(ScaleStartX, ScaleAniMax);                    
                }
                else
                {
                    // End:0xBF1
                    if(RollCount == RollMaxCount)
                    {
                        RollStartX += ((RollAniStep * Delta) * (0.0300000 - RollStartX));
                        // End:0xBEE
                        if(RollStartX > 0.0100000)
                        {
                            bLastReverseRoll = true;
                        }                        
                    }
                    else
                    {
                        RollStartX += (RollAniStep * Delta);
                    }
                }
            }
            Class'Engine.BTCustomDrawHK'.static.DrawImageOriginalWithClipArea(C, ItemImage, fb.X1, fb.Y1 + (RollStartX * (AWinPos.Y2 - AWinPos.Y1)), fb.X2, fb.Y2 + (RollStartX * (AWinPos.Y2 - AWinPos.Y1)), AWinPos.X1, AWinPos.Y1, AWinPos.X2, AWinPos.Y2);            
        }
        else
        {
            // End:0xD56
            if(bScaleAni2)
            {
                ScaleStartX += (ScaleAniStep * Delta);
                ScaleAniStep = ScaleAniStep * ScaleAniNextMulStep;
                // End:0xCFE
                if(ScaleStartX <= float(0))
                {
                    OnDramaEnded();
                    bScaleAni2 = false;                    
                }
                else
                {
                    OnScaleAniChanged(ScaleStartX, ScaleAniMax);
                }
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);                
            }
            else
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ItemImage, fb.X1, fb.Y1, fb.X2, fb.Y2);
            }
        }
    }
    // End:0xE8A
    if((instanceInfo != none) && int(InvenState) == int(7))
    {
        CheckRedAuction();
        // End:0xE87
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
        // End:0x1220
        if(ItemInfo != none)
        {
            ReasonCount = 0;
            // End:0xED7
            if(bShowRestrictionLevel && MyData.myLevel < ItemInfo.EquipLevel)
            {
                bRedLevel = true;
                ReasonCount++;
            }
            // End:0xF16
            if((bShowRestrictionDurability && instanceInfo != none) && instanceInfo.Durability < 10000)
            {
                bRedRepair = true;
                ReasonCount++;
            }
            // End:0xF6C
            if((bShowRestrictionPrice && ItemInfo.PurchaseType == 0) && MyData.MyPoint < ItemInfo.PointPrice[0])
            {
                bRedPoint = true;
                ReasonCount++;                
            }
            else
            {
                // End:0xFBF
                if((bShowRestrictionPrice && ItemInfo.PurchaseType == 1) && MyData.MyCash < ItemInfo.CashPrice[0])
                {
                    bRedCash = true;
                    ReasonCount++;
                }
            }
            // End:0x1220
            if(ReasonCount > 0)
            {
                bRedState = true;
                XL = ((AWinPos.X2 - AWinPos.X1) - float(33 * ReasonCount)) / float(2);
                YL = ((AWinPos.Y2 - AWinPos.Y1) - float(33)) / float(2);
                // End:0x108C
                if(bRedLevel)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, EquipLevelImage, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X2, AWinPos.Y2);
                    XL += float(33);
                }
                // End:0x10F8
                if(bRedRepair)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_repair_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X2, AWinPos.Y2);
                    XL += float(33);
                }
                // End:0x1164
                if(bRedCash)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_cash_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X2, AWinPos.Y2);
                    XL += float(33);
                }
                // End:0x11D0
                if(bRedPoint)
                {
                    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_point_non, AWinPos.X1 + XL, AWinPos.Y1 + YL, AWinPos.X2, AWinPos.Y2);
                    XL += float(33);
                }
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_item_non, AWinPos.X1, AWinPos.Y1 + float(25), AWinPos.X2, AWinPos.Y2);
            }
        }
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
                // End:0x108
                if(instanceInfo.DamageDegree >= 100000)
                {
                    bRedAuction = true;
                    UnderTextForm.Text = strRestrictionReason[2];
                    RRIndex = 2;                    
                }
                else
                {
                    // End:0x146
                    if(instanceInfo.Durability < 100000)
                    {
                        bRedAuction = true;
                        UnderTextForm.Text = strRestrictionReason[3];
                        RRIndex = 3;                        
                    }
                    else
                    {
                        // End:0x181
                        if(instanceInfo.SlotPosition <= 8)
                        {
                            bRedAuction = true;
                            UnderTextForm.Text = strRestrictionReason[4];
                            RRIndex = 4;                            
                        }
                        else
                        {
                            // End:0x1AD
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
    //return;    
}

function SetGameManager(wGameManager gm)
{
    GameMgr = gm;
    //return;    
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