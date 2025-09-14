/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLAuctionHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:19
 *
 *******************************************************************************/
class BTACLAuctionHK extends BTAutoColumnListHK
    dependson(BTItemCommonInfoHK)
    editinlinenew
    instanced;

var BTRODecorateStringHK decoTimeLine;
var BTRODecorateStringHK decoHTU;
var localized string strHTU[2];
var localized string strDHMS[4];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify BTROItemBoxHK tT;
var localized string strUntilTime[5];
var localized string strUntilTimeLine[5];
var Image LevelImg;
var BTItemCommonInfoHK MyData;
var Color RedColor;
var Color BlueColor;
var array<BTAutoColumnListDataHK> ACLPoolList;

function Color DamageToColor(int Damage)
{
    // End:0x1f
    if(Damage >= 75000)
    {
        return class'BTUIColorPoolHK'.static.Damage4();
    }
    // End:0x3e
    if(Damage >= 51000)
    {
        return class'BTUIColorPoolHK'.static.Damage3();
    }
    // End:0x5d
    if(Damage >= 26000)
    {
        return class'BTUIColorPoolHK'.static.Damage2();
    }
    // End:0x7c
    if(Damage >= 11000)
    {
        return class'BTUIColorPoolHK'.static.Damage1();
    }
    return class'BTUIColorPoolHK'.static.Damage0();
}

function string UntilTimeToText(int UntilTime)
{
    // End:0x15
    if(UntilTime >= 24)
    {
        return strUntilTime[4];
    }
    // End:0x2a
    if(UntilTime >= 12)
    {
        return strUntilTime[3];
    }
    // End:0x3f
    if(UntilTime >= 6)
    {
        return strUntilTime[2];
    }
    // End:0x53
    if(UntilTime >= 2)
    {
        return strUntilTime[1];
    }
    return strUntilTime[0];
}

function string UntilTimeLineToText(int UntilTime)
{
    // End:0x15
    if(UntilTime >= 24)
    {
        return strUntilTimeLine[4];
    }
    // End:0x2a
    if(UntilTime >= 12)
    {
        return strUntilTimeLine[3];
    }
    // End:0x3f
    if(UntilTime >= 6)
    {
        return strUntilTimeLine[2];
    }
    // End:0x53
    if(UntilTime >= 2)
    {
        return strUntilTimeLine[1];
    }
    return strUntilTimeLine[0];
}

function float GetItemHeight(Canvas C)
{
    return 26.0;
}

function AddAuctionItem(int UniqueID, int ItemID, int PartsID, BtrTime UntilTime, int CurrentBiddingPrice, int InstantlyBuyingPrice, int ItemDamage, string CurrentBiddingUser, string SellerName, int ItemCount, optional bool bShowTime)
{
    local string LeftTime;
    local wGameManager GameMgr;
    local wItemBoxHK ItemInfo;
    local BTAutoColumnListDataHK row;
    local int i;

    row = new class'BTAutoColumnListDataHK';
    row.Init(10);
    i = 0;
    J0x27:
    // End:0xcc [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[5].Text[i].FontDrawType = 5;
        row.DataPerColumn[6].Text[i].FontDrawType = 5;
        row.DataPerColumn[7].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[0].IntValue = GameMgr.FindUIItemReturnIndex(ItemID);
    // End:0x142
    if(row.DataPerColumn[0].IntValue < 0)
    {
        return;
    }
    ItemInfo = GameMgr.UIShowItemLists[row.DataPerColumn[0].IntValue];
    row.DataPerColumn[0].tempValue = ItemCount;
    // End:0x1ce
    if(ItemInfo.bOverlap)
    {
        row.DataPerColumn[0].strValue = ItemInfo.ItemName $ "x" $ string(ItemCount);
    }
    // End:0x1f2
    else
    {
        row.DataPerColumn[0].strValue = ItemInfo.ItemName;
    }
    row.DataPerColumn[1].strValue = tT.GradeToShortText(ItemInfo.Grade);
    row.DataPerColumn[1].IntValue = ItemInfo.Grade;
    row.DataPerColumn[2].IntValue = ItemInfo.EquipLevel;
    row.DataPerColumn[3].strValue = string(ItemDamage / 1000);
    row.DataPerColumn[3].IntValue = ItemDamage;
    // End:0x2dd
    if(UntilTime.Day > 0)
    {
        LeftTime = string(UntilTime.Day) $ strDHMS[1];
    }
    // End:0x358
    else
    {
        // End:0x2fd
        if(UntilTime.Day < 0)
        {
            LeftTime = strDHMS[0];
        }
        // End:0x358
        else
        {
            // End:0x32c
            if(UntilTime.Hour > 0)
            {
                LeftTime = string(UntilTime.Hour) $ strDHMS[2];
            }
            // End:0x358
            else
            {
                // End:0x358
                if(UntilTime.Minute > 0)
                {
                    LeftTime = string(UntilTime.Minute) $ strDHMS[3];
                }
            }
        }
    }
    row.DataPerColumn[4].IntValue = UntilTime.Hour + UntilTime.Day * 24;
    // End:0x3b1
    if(bShowTime)
    {
        row.DataPerColumn[4].strValue = LeftTime;
    }
    // End:0x427
    else
    {
        // End:0x3f4
        if(UntilTime.Day < 0 || UntilTime.Hour < 0)
        {
            row.DataPerColumn[4].strValue = UntilTimeToText(0);
        }
        // End:0x427
        else
        {
            row.DataPerColumn[4].strValue = UntilTimeToText(row.DataPerColumn[4].IntValue);
        }
    }
    row.DataPerColumn[5].strValue = class'BTCustomDrawHK'.static.ToWonString(string(CurrentBiddingPrice));
    row.DataPerColumn[5].IntValue = CurrentBiddingPrice;
    row.DataPerColumn[6].IntValue = InstantlyBuyingPrice;
    // End:0x4b3
    if(InstantlyBuyingPrice == 0)
    {
        row.DataPerColumn[6].strValue = "";
    }
    // End:0x4e0
    else
    {
        row.DataPerColumn[6].strValue = class'BTCustomDrawHK'.static.ToWonString(string(InstantlyBuyingPrice));
    }
    row.DataPerColumn[7].strValue = CurrentBiddingUser;
    row.DataPerColumn[7].IntValue = ItemID;
    row.DataPerColumn[8].IntValue = UniqueID;
    row.DataPerColumn[8].strValue = SellerName;
    row.DataPerColumn[9].IntValue = PartsID;
    i = 0;
    J0x573:
    // End:0x610 [While If]
    if(i < 8)
    {
        // End:0x606
        if(i != 1 && i != 4 && i != 7)
        {
            row.DataPerColumn[i].Text[1].DrawShadowColor = class'BTUIColorPoolHK'.static.ChatNormal();
            row.DataPerColumn[i].Text[1].DrawShadowColor = class'BTUIColorPoolHK'.static.DefaultShadow();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x573;
    }
    AddRow(row);
    ACLPoolList.Length = ACLPoolList.Length + 1;
    ACLPoolList[ACLPoolList.Length - 1] = row;
}

function Clear()
{
    RemoveAll();
    ACLPoolList.Length = 0;
}

function int GetInstanctlyBuyingPrice(int row)
{
    return ACLRowList[row].DataPerColumn[6].IntValue;
}

function CheckMyRegisterItemByUniqueID(int UniqueID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x6a [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x60
        if(ACLRowList[i].DataPerColumn[8].IntValue == UniqueID)
        {
            ACLRowList[i].DataPerColumn[0].floatValue = 1.0;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function CheckMyBiddingItemByUniqueID(BtrDouble UniqueID)
{
    local int i;
    local BtrDouble bd;

    i = 0;
    J0x07:
    // End:0xa3 [While If]
    if(i < ACLRowList.Length)
    {
        bd.dummy_1_DO_NOT_USE = ACLRowList[i].DataPerColumn[8].IntValue;
        bd.dummy_2_DO_NOT_USE = ACLRowList[i].DataPerColumn[8].tempValue;
        // End:0x99
        if(UnresolvedNativeFunction_99(bd, UniqueID))
        {
            ACLRowList[i].DataPerColumn[7].floatValue = 1.0;
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function LC0_Draw_ItemName(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1e
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    // End:0x7b
    if(i == 0)
    {
        C.DrawColor = tT.GradeToColor(ACLRowList[row].DataPerColumn[1].IntValue);
    }
    // End:0xb0
    else
    {
        C.DrawColor = ACLRowList[row].DataPerColumn[1].Text[i].DrawColor;
    }
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L, t, R, B, 3, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function LC1_Draw_Grade(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1e
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    class'BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
}

function LC2_Draw_Level(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wGameManager GameMgr;

    i = 0;
    // End:0x1e
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    GameMgr.GetLevelImage(Data.IntValue, 0, LevelImg);
    class'BTCustomDrawHK'.static.DrawImage(C, LevelImg, L, t, R, B);
}

function LC3_Draw_Damage(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1e
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    // End:0x61
    if(i == 0)
    {
        C.DrawColor = DamageToColor(Data.IntValue);
    }
    // End:0x85
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    class'BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
}

function LC4_Draw_Limit(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1e
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x152
    if(selectIndex == row)
    {
        i = 1;
        // End:0x141
        if(float(int(Controller.MouseX)) > L && float(int(Controller.MouseX)) < R)
        {
            decoTimeLine.bVisible = true;
            decoTimeLine.AWinPos.X1 = float(int(Controller.MouseX));
            decoTimeLine.AWinPos.X2 = float(int(Controller.MouseX) + 88);
            decoTimeLine.AWinPos.Y1 = float(int(Controller.MouseY));
            decoTimeLine.AWinPos.Y2 = float(int(Controller.MouseY) + 24);
            decoTimeLine.SetData(UntilTimeLineToText(Data.IntValue));
        }
        // End:0x152
        else
        {
            decoTimeLine.bVisible = false;
        }
    }
    // End:0x16e
    if(selectIndex < 0)
    {
        decoTimeLine.bVisible = false;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    class'BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
}

function LC5_Draw_HTP(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1e
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    // End:0x75
    if(i == 0 && Data.IntValue > MyData.MyPoint)
    {
        C.DrawColor = RedColor;
    }
    // End:0x99
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 0, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function LC6_Draw_IPP(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1e
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x34
    if(selectIndex == row)
    {
        i = 1;
    }
    // End:0x75
    if(i == 0 && Data.IntValue > MyData.MyPoint)
    {
        C.DrawColor = RedColor;
    }
    // End:0x99
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 0, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function LC7_Draw_HTU(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    i = 0;
    // End:0x4e
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x163
    if(selectIndex == row)
    {
        i = 1;
        // End:0x152
        if(float(int(Controller.MouseX)) > L && float(int(Controller.MouseX)) < R)
        {
            decoHTU.bVisible = true;
            decoHTU.AWinPos.X1 = float(int(Controller.MouseX));
            decoHTU.AWinPos.X2 = float(int(Controller.MouseX) + 147);
            decoHTU.AWinPos.Y1 = float(int(Controller.MouseY));
            decoHTU.AWinPos.Y2 = float(int(Controller.MouseY) + 45);
        }
        // End:0x163
        else
        {
            decoHTU.bVisible = false;
        }
    }
    // End:0x17f
    if(selectIndex < 0)
    {
        decoHTU.bVisible = false;
    }
    // End:0x25a
    if(i != 0)
    {
        C.DrawColor = Data.Text[i].DrawColor;
        // End:0x246
        if(selectIndex == row && MM != none && MM.kUserName == Data.strValue)
        {
            // End:0x22d
            if(ACLRowList[row].DataPerColumn[8].strValue == Data.strValue)
            {
                decoHTU.SetData(strHTU[0]);
            }
            // End:0x243
            else
            {
                decoHTU.SetData(strHTU[1]);
            }
        }
        // End:0x257
        else
        {
            decoHTU.bVisible = false;
        }
    }
    // End:0x2da
    else
    {
        // End:0x2da
        if(MM != none && MM.kUserName == Data.strValue)
        {
            // End:0x2c6
            if(ACLRowList[row].DataPerColumn[8].strValue == Data.strValue)
            {
                C.DrawColor = RedColor;
            }
            // End:0x2da
            else
            {
                C.DrawColor = BlueColor;
            }
        }
    }
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    RedColor = class'Canvas'.static.MakeColor(byte(255), 49, 52);
    BlueColor = class'Canvas'.static.MakeColor(70, 183, 223);
    LevelImg = class'BTCustomDrawHK'.static.MakeImage(32, 32, 26, none);
    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.OnClickSound = 9;
    MultiColumnBox.OnClickSound = 9;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = class'BTUIResourcePoolHK'.default.list_lobby_on;
    self.LastSelectedImage = class'BTUIResourcePoolHK'.default.list_lobby_cli;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.list_lobby_n;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("ItemName", 618.0 - float(512), 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw_ItemName;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Grade", 653.0 - float(618), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw_Grade;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Level", 689.0 - float(653), 7);
    headerInfo.__CustomDraw__Delegate = LC2_Draw_Level;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Damage", 731.0 - float(689), 7);
    headerInfo.__CustomDraw__Delegate = LC3_Draw_Damage;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Limit", 773.0 - float(731), 7);
    headerInfo.__CustomDraw__Delegate = LC4_Draw_Limit;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Highest Tender Price", 844.0 - float(773), 7);
    headerInfo.__CustomDraw__Delegate = LC5_Draw_HTP;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Immediately Purchase Price", 915.0 - float(844), 7);
    headerInfo.__CustomDraw__Delegate = LC6_Draw_IPP;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Highest Tender User", 1012.0 - float(915) - float(15), 7);
    headerInfo.__CustomDraw__Delegate = LC7_Draw_HTU;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    tT = new class'BTROItemBoxHK';
    tT.Init();
    decoTimeLine = new class'BTRODecorateStringHK';
    decoTimeLine.Init();
    decoHTU = new class'BTRODecorateStringHK';
    decoHTU.Init();
    decoHTU.OriginalString.FontDrawType = 3;
}

function Internal_OnRendered(Canvas C)
{
    decoHTU.Render(C);
    decoTimeLine.Render(C);
}

defaultproperties
{
    strHTU[0]="The seller is the highest bidder for this item."
    strHTU[1]="You are currently the highest bidder for this item."
    strDHMS[0]="Expired"
    strDHMS[1]="d"
    strDHMS[2]="h"
    strDHMS[3]="m"
    strUntilTime[0]="Shortest"
    strUntilTime[1]="Short"
    strUntilTime[2]="Medium"
    strUntilTime[3]="Long"
    strUntilTime[4]="Longest"
    strUntilTimeLine[0]="< 2 hrs"
    strUntilTimeLine[1]="2 - 6 hrs"
    strUntilTimeLine[2]="6 - 12 hrs"
    strUntilTimeLine[3]="12 - 24 hrs"
    strUntilTimeLine[4]="24 - 48 hrs"
    OnRendered=Internal_OnRendered
}