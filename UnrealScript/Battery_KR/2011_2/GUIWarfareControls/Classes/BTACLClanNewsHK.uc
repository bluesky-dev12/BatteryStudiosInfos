class BTACLClanNewsHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var localized string strIssueType[12];

function float GetItemHeight(Canvas C)
{
    return 26.0000000;
    //return;    
}

function string IssueTypeToString(byte IssueType)
{
    return strIssueType[int(IssueType)];
    //return;    
}

function AddNews(string IssueDate, byte IssueType, string IssuedClanMember)
{
    local BTAutoColumnListDataHK row;
    local int i;

    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(3);
    i = 0;
    J0x27:

    // End:0xA7 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        row.DataPerColumn[2].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    row.DataPerColumn[0].strValue = IssueDate;
    row.DataPerColumn[1].strValue = IssueTypeToString(IssueType);
    row.DataPerColumn[1].IntValue = int(IssueType);
    row.DataPerColumn[2].strValue = IssuedClanMember;
    AddRow(row);
    //return;    
}

function LC0_NewsDate(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    i = 0;
    // End:0x1E
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
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_UI_UI.Lobby.list_lobby_on');
    self.LastSelectedImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_UI_UI.Lobby.list_lobby_cli');
    self.DefaultRowImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(731, 25, 15, Texture'Warfare_UI_UI.Lobby.list_lobby_n');
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("date", 840.0000000 - float(773), 7);
    headerInfo.__CustomDraw__Delegate = LC0_NewsDate;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("news index", 904.0000000 - float(840), 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("nick name", 985.0000000 - float(904), 0);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}

defaultproperties
{
    strIssueType[1]="?? ??"
    strIssueType[2]="??"
    strIssueType[3]="?? ??"
    strIssueType[4]="?? ??"
    strIssueType[5]="?? ??"
    strIssueType[6]="?? ??"
    strIssueType[7]="?? ??"
    strIssueType[8]="?? ??"
    strIssueType[9]="?? ??"
    strIssueType[10]="?? ??"
    strIssueType[11]="?? ??"
}