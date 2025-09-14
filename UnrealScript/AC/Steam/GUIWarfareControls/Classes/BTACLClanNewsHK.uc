/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLClanNewsHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:5
 *
 *******************************************************************************/
class BTACLClanNewsHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var localized string strIssueType[12];

function float GetItemHeight(Canvas C)
{
    return 26.0;
}

function string IssueTypeToString(byte IssueType)
{
    return strIssueType[IssueType];
}

function AddNews(string IssueDate, byte IssueType, string IssuedClanMember)
{
    local BTAutoColumnListDataHK row;
    local int i;

    row = new class'BTAutoColumnListDataHK';
    row.Init(3);
    i = 0;
    J0x27:
    // End:0xa7 [While If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        row.DataPerColumn[2].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    GetDatefromString(IssueDate, "-");
    row.DataPerColumn[0].strValue = IssueDate;
    row.DataPerColumn[1].strValue = IssueTypeToString(IssueType);
    row.DataPerColumn[1].IntValue = IssueType;
    row.DataPerColumn[2].strValue = IssuedClanMember;
    AddRow(row);
}

function LC0_NewsDate(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("date", 840.0 - float(773), 7);
    headerInfo.__CustomDraw__Delegate = LC0_NewsDate;
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("news index", 904.0 - float(840), 0);
    self.AddColumn(headerInfo);
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("nick name", 985.0 - float(904), 0);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
}

defaultproperties
{
    strIssueType[1]="New Member Join"
    strIssueType[2]="Leave"
    strIssueType[3]="Expel"
    strIssueType[4]="Promote"
    strIssueType[5]="Demote"
    strIssueType[6]="Level Up"
    strIssueType[7]="Birthdays This Week"
    strIssueType[8]="Acquire Legends"
    strIssueType[9]="Acquire Rares"
    strIssueType[10]="Acquire Superiors"
    strIssueType[11]="Acquire Normals"
}