class BTACLClanWarResultHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var localized string strWinLose[2];
var localized string strVS;

function float GetItemHeight(Canvas C)
{
    return 26.0000000 * (float(Controller.ResY) / 768.0000000);
    //return;    
}

function addResult(BtrDouble Date, byte IsWin, string EnemyClanname)
{
    local BtrTime MatchDate;
    local BTAutoColumnListDataHK row;
    local int i;

    BtrDoubleToBtrTime(Date, MatchDate);
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(4);
    i = 0;
    J0x37:

    // End:0xDB [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        row.DataPerColumn[2].Text[i].FontDrawType = 3;
        row.DataPerColumn[3].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x37;
    }
    row.DataPerColumn[0].strValue = (((string(MatchDate.Year) $ "-") $ string(MatchDate.Month)) $ "-") $ string(MatchDate.Day);
    row.DataPerColumn[1].strValue = strWinLose[int(IsWin)];
    row.DataPerColumn[2].strValue = strVS;
    row.DataPerColumn[3].strValue = EnemyClanname;
    AddRow(row);
    //return;    
}

function LC0_Date(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    self.SelectImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_TH_UI_UI.Lobby.list_lobby_on');
    self.LastSelectedImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_TH_UI_UI.Lobby.list_lobby_cli');
    self.DefaultRowImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(731, 25, 15, Texture'Warfare_TH_UI_UI.Lobby.list_lobby_n');
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("date", 32.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Date;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("war result", 14.0000000, 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("vs", 10.0000000, 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("enemy clan name", 44.0000000, 0);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}

defaultproperties
{
    strWinLose[0]="???"
    strWinLose[1]="???"
    strVS="VS"
}