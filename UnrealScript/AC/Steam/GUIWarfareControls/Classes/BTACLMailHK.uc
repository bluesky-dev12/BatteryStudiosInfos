/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLMailHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:5
 *
 *******************************************************************************/
class BTACLMailHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

function LC2_Content(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    class'BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0, L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
}

function float GetItemHeight(Canvas C)
{
    return 26.0;
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
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("date", 62.0, 0);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("sender", 80.0, 0);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("content", 155.0, 7);
    headerInfo.__CustomDraw__Delegate = LC2_Content;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("item", 94.0, 0);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("state", 82.0, 0);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}

function ChangeNonFreeGiftColumnMode()
{
    ACLHeaderList[0].ColumnPerc = 10.0;
    ACLHeaderList[1].ColumnPerc = 115.0;
    ACLHeaderList[2].ColumnPerc = 254.0;
    ACLHeaderList[3].ColumnPerc = 103.0;
    ACLHeaderList[4].ColumnPerc = 0.0;
    NormalizeColumnPerc();
}

function ChangeMailColumnMode()
{
    ACLHeaderList[0].ColumnPerc = 62.0;
    ACLHeaderList[1].ColumnPerc = 80.0;
    ACLHeaderList[2].ColumnPerc = 155.0;
    ACLHeaderList[3].ColumnPerc = 94.0;
    ACLHeaderList[4].ColumnPerc = 52.0;
    NormalizeColumnPerc();
}
