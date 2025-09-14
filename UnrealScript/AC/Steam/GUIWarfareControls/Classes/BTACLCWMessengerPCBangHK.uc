/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLCWMessengerPCBangHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:17
 *
 *******************************************************************************/
class BTACLCWMessengerPCBangHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Image CommonSizeImg;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    // End:0x4d
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x63
    if(selectIndex == row)
    {
        i = 1;
    }
    Data.Text[i].FontSize = 10;
    C.DrawColor = Data.Text[i].DrawColor;
    // End:0x22e
    if(GetCurPos(row) != 0)
    {
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetCombatState(row), 3, float(Data.Text[i].FontSize), L, t, L + float(71), B, 15, 0, 0, 0, Data.Text[i].DrawShadowColor);
        GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
        class'BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, L + float(71), t + float(1), L + float(71) + float(32), B - float(1));
        C.DrawColor = Data.Text[i].DrawColor;
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetWinLose(row), 3, float(Data.Text[i].FontSize), L + float(71) + float(32) + float(123), t, R, B, 17, 0, 0, 0, Data.Text[i].DrawShadowColor);
    }
    // End:0x2a0
    else
    {
        class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetDataPerColumn0_strValue(row), 3, float(Data.Text[i].FontSize), L, t, L + float(71) + float(32), B, 15, 0, 0, 0, Data.Text[i].DrawShadowColor);
    }
    C.DrawColor = Data.Text[i].DrawColor;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), 3, float(Data.Text[i].FontSize), L + float(71) + float(32), t, L + float(71) + float(32) + float(123), B, 17, 0, 0, 0, Data.Text[i].DrawShadowColor);
    // End:0x623
    if(self.selectIndex == row)
    {
        // End:0x623
        if(GetClanName(row) != "")
        {
            class'BTCustomDrawHK'.static.DrawImage(C, SelectImage, L - float(155), t, L + float(2), B);
            C.DrawColor = Data.Text[i].DrawColor;
            class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetClanName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L - float(155) + float(32) + float(2), t, L - float(2), B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
            // End:0x4df
            if(ACLRowList[row].DataPerColumn[6].IntValue == 0)
            {
                class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ex_clanmark, L - float(155) + float(2), t + float(1), L - float(155) + float(32) + float(2), B - float(1));
            }
            // End:0x623
            else
            {
                class'BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[5].Image, L - float(155) + float(2), t + float(1), L - float(155) + float(32) + float(2), B - float(1));
                class'BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[4].Image, L - float(155) + float(2), t + float(1), L - float(155) + float(32) + float(2), B - float(1));
                class'BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[6].Image, L - float(155) + float(2), t + float(1), L - float(155) + float(32) + float(2), B - float(1));
            }
        }
    }
}

function string GetCombatState(int row)
{
    return ACLRowList[row].DataPerColumn[5].strValue;
}

function string GetWinLose(int row)
{
    return ACLRowList[row].DataPerColumn[6].strValue;
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

function int GetServerPort(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
}

function string GetDataPerColumn0_strValue(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
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
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("", 1.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}
