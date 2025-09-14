/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLWaitingClanHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class BTACLWaitingClanHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

function float GetItemHeight(Canvas C)
{
    return 34.0;
}

function AddClan(int Level, int Map, int supply)
{
    local wGameManager GameMgr;
    local BTAutoColumnListDataHK row;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row = new class'BTAutoColumnListDataHK';
    row.Init(3);
    i = 0;
    J0x56:
    // End:0xd6 [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 4;
        row.DataPerColumn[1].Text[i].FontDrawType = 4;
        row.DataPerColumn[2].Text[i].FontDrawType = 4;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x56;
    }
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[0].strValue = "";
    row.DataPerColumn[1].IntValue = Map;
    row.DataPerColumn[1].strValue = "";
    row.DataPerColumn[2].IntValue = supply;
    row.DataPerColumn[2].strValue = "";
    AddRow(row);
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
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("clan level", 372.0 - float(252), 3);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("map", 252.0 - float(134), 3);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("supply", 134.0 - float(19), 3);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}
