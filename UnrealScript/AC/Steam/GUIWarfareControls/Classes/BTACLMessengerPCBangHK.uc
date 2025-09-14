/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLMessengerPCBangHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:20
 *
 *******************************************************************************/
class BTACLMessengerPCBangHK extends BTACLMessengerCommon
    editinlinenew
    instanced;

var Image CommonSizeImg;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    PlayerOwner().Level.GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
    class'BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, L + float(4) + float(32), t + float(1), L + float(4) + float(64), B - float(1));
    i = 0;
    // End:0xa7
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0xbd
    if(selectIndex == row)
    {
        i = 1;
    }
    Data.Text[i].FontSize = 10;
    C.DrawColor = Data.Text[i].DrawColor;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 91, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L, t, R, B, 0, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function int GetLevel(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
}

function int GetRoomNumber(int row)
{
    return ACLRowList[row].DataPerColumn[1].IntValue;
}

function string GetServerIP(int row)
{
    return ACLRowList[row].DataPerColumn[2].strValue;
}

function int GetCurPos(int row)
{
    return ACLRowList[row].DataPerColumn[3].tempValue;
}

function int GetCurPosInt(int row)
{
    return ACLRowList[row].DataPerColumn[3].tempValue;
}

function int GetServerPort(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
}

function string GetServerName(int row)
{
    return ACLRowList[row].DataPerColumn[3].strValue;
}

function int GetChannelNum(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
}

function string GetClanName(int row)
{
    return ACLRowList[row].DataPerColumn[4].strValue;
}

function int GetClanPatternID(int row)
{
    return ACLRowList[row].DataPerColumn[6].IntValue;
}

function Image GetClanPattern(int row)
{
    return ACLRowList[row].DataPerColumn[6].Image;
}

function Image GetClanBG(int row)
{
    return ACLRowList[row].DataPerColumn[5].Image;
}

function Image GetClanBL(int row)
{
    return ACLRowList[row].DataPerColumn[4].Image;
}

function int GetClanNum(int row)
{
    return ACLRowList[row].DataPerColumn[4].IntValue;
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[7].IntValue;
}

function float GetItemHeight(Canvas C)
{
    return 36.0;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    CommonSizeImg.width = 32.0;
    CommonSizeImg.Height = 32.0;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    ruii = class'BTUIResourcePoolHK'.default.Msg_list_on;
    ruii2 = class'BTUIResourcePoolHK'.default.Msg_list_Focus;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.Msg_list_n;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("ClanMark/Level/UserName", 0.50, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}
