/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLCWMessengerChannelHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:12
 *
 *******************************************************************************/
class BTACLCWMessengerChannelHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Image CommonSizeImg;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
    class'BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, L + float(71), t + float(1), L + float(71) + float(32), B - float(1));
    i = 0;
    // End:0xc0
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0xd6
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(71) + float(32), t, L + float(71) + float(32) + float(123), B, 17, 0, 0, 0, Data.Text[i].DrawShadowColor);
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetWinLose(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L + float(71) + float(32) + float(123), t, R, B, 17, 0, 0, 0, Data.Text[i].DrawShadowColor);
    // End:0x4ec
    if(GetClanName(row) != "")
    {
        // End:0x31e
        if(self.selectIndex == row)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, SelectImage, L - float(110) - float(13) + float(2), t, L + float(2), B);
            class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetClanName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L - float(110) - float(13) + float(2) + float(2), t, L - float(2), B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
        }
        // End:0x3a2
        if(ACLRowList[row].DataPerColumn[0].IntValue == 0)
        {
            class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.ex_clanmark, L + float(15), t + float(1), L + float(15) + B - t - float(2), B - float(1));
        }
        // End:0x4ec
        else
        {
            class'BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[4].Image, L + float(15), t + float(1), L + float(15) + B - t - float(2), B - float(1));
            class'BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[3].Image, L + float(15), t + float(1), L + float(15) + B - t - float(2), B - float(1));
            class'BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[2].Image, L + float(15), t + float(1), L + float(15) + B - t - float(2), B - float(1));
        }
    }
}

function int GetClanPattern(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
}

function int GetClanBG(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
}

function int GetClanBL(int row)
{
    return ACLRowList[row].DataPerColumn[4].IntValue;
}

function string GetClanName(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
}

function int GetLevel(int row)
{
    return ACLRowList[row].DataPerColumn[1].IntValue;
}

function int GetUserID(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[2].strValue;
}

function string GetWinLose(int row)
{
    return ACLRowList[row].DataPerColumn[3].strValue;
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[5].IntValue;
}

function float GetItemHeight(Canvas C)
{
    return 34.0;
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
    ruii = class'BTUIResourcePoolHK'.default.list_commu_on;
    ruii2 = class'BTUIResourcePoolHK'.default.list_commu_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.list_commu_n;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("GameState/Level/UserName/WinLose", 1.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}
