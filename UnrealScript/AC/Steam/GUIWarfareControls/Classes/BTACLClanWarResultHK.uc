/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLClanWarResultHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class BTACLClanWarResultHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var localized string strWinLose[2];
var localized string strVS;

function float GetItemHeight(Canvas C)
{
    return 26.0;
}

function addResult(BtrDouble Date, byte IsWin, string EnemyClanname)
{
    local BtrTime MatchDate;
    local BTAutoColumnListDataHK row;
    local int i;

    BtrDoubleToBtrTime(Date, MatchDate);
    row = new class'BTAutoColumnListDataHK';
    row.Init(4);
    i = 0;
    J0x37:
    // End:0xdb [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        row.DataPerColumn[2].Text[i].FontDrawType = 3;
        row.DataPerColumn[3].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    row.DataPerColumn[0].strValue = string(MatchDate.Year) $ "-" $ string(MatchDate.Month) $ "-" $ string(MatchDate.Day);
    row.DataPerColumn[1].strValue = strWinLose[IsWin];
    row.DataPerColumn[2].strValue = strVS;
    row.DataPerColumn[3].strValue = EnemyClanname;
    AddRow(row);
}

function LC0_Date(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
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
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("date", 32.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Date;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("war result", 14.0, 0);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("vs", 10.0, 0);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("enemy clan name", 44.0, 0);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}

defaultproperties
{
    strWinLose[0]="Lose"
    strWinLose[1]="Win"
    strVS="vs."
}