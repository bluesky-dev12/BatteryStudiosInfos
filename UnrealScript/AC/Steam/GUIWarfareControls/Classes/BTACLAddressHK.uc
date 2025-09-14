/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLAddressHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:6
 *
 *******************************************************************************/
class BTACLAddressHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

function float GetItemHeight(Canvas C)
{
    return 26.0;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnList.__OnClick__Delegate = MultiColumnList_OnClick;
    self.SelectImage = class'BTUIResourcePoolHK'.default.list_lobby_on;
    self.LastSelectedImage = class'BTUIResourcePoolHK'.default.list_lobby_cli;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.list_lobby_n;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("pos", 461.0 - float(361), 7);
    headerInfo.__CustomDraw__Delegate = LC_0_1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("name", 562.0 - float(461), 7);
    headerInfo.__CustomDraw__Delegate = LC_0_1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("check", 664.0 - float(562), 7);
    headerInfo.__CustomDraw__Delegate = LC2_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}

function AddAddress(string pos, string UserName)
{
    local BTAutoColumnListDataHK row;
    local int i;

    row = new class'BTAutoColumnListDataHK';
    row.Init(3);
    i = 0;
    J0x27:
    // End:0x83 [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    row.DataPerColumn[0].strValue = pos;
    row.DataPerColumn[1].strValue = UserName;
    row.DataPerColumn[2].IntValue = 0;
    AddRow(row);
}

function LC_0_1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, 3, float(Data.Text[i].FontSize), L, t, R, B, 5, 0, 0, 0);
}

function LC2_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    // End:0xa1
    if(Data.IntValue == 0)
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.chek_dis, L, t, R, B);
    }
    // End:0xd7
    else
    {
        class'BTCustomDrawHK'.static.DrawImage(C, class'BTUIResourcePoolHK'.default.chek_ok, L, t, R, B);
    }
}

function bool MultiColumnList_OnClick(GUIComponent Sender)
{
    // End:0x43
    if(ACLRowList[LastSelectedIndexHistory].DataPerColumn[2].IntValue == 0)
    {
        ACLRowList[LastSelectedIndexHistory].DataPerColumn[2].IntValue = 1;
    }
    // End:0x61
    else
    {
        ACLRowList[LastSelectedIndexHistory].DataPerColumn[2].IntValue = 0;
    }
    return true;
}
