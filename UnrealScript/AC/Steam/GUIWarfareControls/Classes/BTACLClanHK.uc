/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLClanHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class BTACLClanHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var localized string strNoRankState;

function float GetItemHeight(Canvas C)
{
    return 34.0;
}

function AddClan(int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, string ClanName, string ClanMaster, string ClanMemberCount, string ClanCreateDate, string ClanHistory, string ClanRanking, byte ClanRecruit, int ClanRank, int ClanLevel)
{
    local wGameManager GameMgr;
    local BTAutoColumnListDataHK row;
    local int i;

    row = new class'BTAutoColumnListDataHK';
    row.Init(10);
    i = 0;
    J0x27:
    // End:0x84 [While If]
    if(i < 3)
    {
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        row.DataPerColumn[2].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[1].strValue = ClanName;
    row.DataPerColumn[2].strValue = ClanMaster;
    row.DataPerColumn[3].strValue = ClanMemberCount;
    row.DataPerColumn[4].strValue = ClanCreateDate;
    row.DataPerColumn[5].strValue = ClanHistory;
    // End:0x168
    if(ClanRank == 0)
    {
        row.DataPerColumn[6].strValue = strNoRankState;
    }
    // End:0x184
    else
    {
        row.DataPerColumn[6].strValue = ClanRanking;
    }
    row.DataPerColumn[0].IntValue = ClanMarkPattern;
    row.DataPerColumn[1].IntValue = ClanMarkBG;
    row.DataPerColumn[2].IntValue = ClanMarkBL;
    row.DataPerColumn[4].tempValue = ClanRecruit;
    GameMgr.cmm.AddClanMark(ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, true, ClanRecruit > 0);
    GameMgr.cmm.SetClanLevel(ClanName, ClanLevel);
    row.DataPerColumn[7].Image = GameMgr.GetClanMark32(ClanMarkPattern);
    row.DataPerColumn[8].Image = GameMgr.GetClanMark32(ClanMarkBG);
    row.DataPerColumn[9].Image = GameMgr.GetClanMark32(ClanMarkBL);
    AddRow(row);
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    Controller.ViewportOwner.Actor.Level.GameMgr.cmm.Render(C, int(L + float(1)), int(t + float(1)), int(L + float(1) + float(32)), int(B - float(1)), ACLRowList[row].DataPerColumn[1].strValue);
}

function LC_1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    class'BTCustomDrawHK'.static.DrawEllipsisString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L + float(5), t, R - float(5), B, Data.Text[i].DrawShadowColor);
}

function LC_2_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    class'BTCustomDrawHK'.static.DrawEllipsisString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L + float(5), t, R - float(5), B, Data.Text[i].DrawShadowColor);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = class'BTCustomDrawHK'.static.MakeImage(8, 8, 15, texture'list_lobby_on');
    self.LastSelectedImage = class'BTCustomDrawHK'.static.MakeImage(8, 8, 15, texture'list_lobby_cli');
    self.DefaultRowImage = class'BTCustomDrawHK'.static.MakeImage(731, 25, 15, texture'list_lobby_n');
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("clan mark", 251.0 - float(216), 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("clan name", 363.0 - float(251), 7);
    headerInfo.__CustomDraw__Delegate = LC_1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("master nick", 473.0 - float(363), 7);
    headerInfo.__CustomDraw__Delegate = LC_2_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("crew", 523.0 - float(473), 0);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("history", 601.0 - float(523), 0);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("consquence", 713.0 - float(601), 0);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("ranking", 793.0 - float(713), 0);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}

defaultproperties
{
    strNoRankState="None"
}