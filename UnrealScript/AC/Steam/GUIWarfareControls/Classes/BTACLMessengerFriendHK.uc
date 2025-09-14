/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLMessengerFriendHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:32
 *
 *******************************************************************************/
class BTACLMessengerFriendHK extends BTACLMessengerCommon
    editinlinenew
    instanced;

var Image CommonSizeImg;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, Left;

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
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 9, 0, 0, 0, Data.Text[i].DrawShadowColor);
    // End:0x344
    if(self.selectIndex == row && GetCurPos(row) != 0)
    {
        Left = int(L - float(181) + float(2) - float(11));
        // End:0x26f
        if(GetClanName(row) != "")
        {
            class'BTCustomDrawHK'.static.DrawImage(C, SelectImage, float(Left), t, L + float(2), B);
            PlayerOwner().Level.GameMgr.cmm.Render(C, Left + 114 + 11, int(t + float(1)), Left + 114 + 32 + 11, int(B - float(1)), GetClanName(row));
            C.DrawColor = Data.Text[1].DrawColor;
            class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetClanName(row), Data.Text[1].FontDrawType, float(Data.Text[1].FontSize), float(Left + 2), t, float(Left + 110 + 11 - 2), B, 5, 0, 0, 0, Data.Text[1].DrawShadowColor);
        }
        // End:0x2b0
        else
        {
            class'BTCustomDrawHK'.static.DrawImage(C, SelectImage, float(Left + 114 + 11 + 32), t, L + float(2), B);
        }
        PlayerOwner().Level.GameMgr.GetLevelImage(Data.IntValue, GetLevelMarkID(row), CommonSizeImg);
        class'BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, float(Left + 114 + 11 + 2 + 32), t + float(1), float(Left + 114 + 11 + 2 + 64), B - float(1));
    }
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
    // End:0x70
    if(0 == GetLogOnState(row))
    {
        C.DrawColor = C.MakeColor(128, 128, 128, byte(255));
    }
    // End:0x94
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L, t, R, B, 0, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function SetCurpos(int row, int Value)
{
    ACLRowList[row].DataPerColumn[3].tempValue = Value;
}

function SetCurLocationName(int row, string Value)
{
    ACLRowList[row].DataPerColumn[0].strValue = Value;
}

function SetChannelName(int row, string Value)
{
    ACLRowList[row].DataPerColumn[5].strValue = Value;
}

function SetServerPort(int row, int Value)
{
    ACLRowList[row].DataPerColumn[2].IntValue = Value;
}

function SetServerIP(int row, string Value)
{
    ACLRowList[row].DataPerColumn[2].strValue = Value;
}

function SetServerName(int row, string Value)
{
    ACLRowList[row].DataPerColumn[3].strValue = Value;
}

function SetGameRoomNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[1].IntValue = Value;
}

function SetChannelNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[3].IntValue = Value;
}

function SetCurState(int row, int Value)
{
    ACLRowList[row].DataPerColumn[5].tempValue = Value;
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

function int GetCurState(int row)
{
    return ACLRowList[row].DataPerColumn[5].tempValue;
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
    return ACLRowList[row].DataPerColumn[4].Image;
}

function Image GetClanBG(int row)
{
    return ACLRowList[row].DataPerColumn[5].Image;
}

function Image GetClanBL(int row)
{
    return ACLRowList[row].DataPerColumn[6].Image;
}

function int GetClanNum(int row)
{
    return ACLRowList[row].DataPerColumn[4].IntValue;
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[7].IntValue;
}

function int GetLogOnState(int row)
{
    return ACLRowList[row].DataPerColumn[6].tempValue;
}

function SortByConnectionStatus()
{
    local int i;
    local array<BTAutoColumnListDataHK> OffLineList;

    i = 0;
    J0x07:
    // End:0x5d [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x53
        if(GetLogOnState(i) == 0)
        {
            OffLineList[OffLineList.Length] = ACLRowList[i];
            ACLRowList.Remove(i, 1);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x64:
    // End:0x96 [While If]
    if(i < OffLineList.Length)
    {
        ACLRowList[ACLRowList.Length] = OffLineList[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x64;
    }
}

function float GetItemHeight(Canvas C)
{
    return 34.0;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    CommonSizeImg.width = 32.0;
    CommonSizeImg.Height = 32.0;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    ruii = class'BTUIResourcePoolHK'.default.list_commu_on;
    ruii2 = class'BTUIResourcePoolHK'.default.list_commu_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.list_commu_n;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("Location", 0.50, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("UserName", 0.50, 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}
