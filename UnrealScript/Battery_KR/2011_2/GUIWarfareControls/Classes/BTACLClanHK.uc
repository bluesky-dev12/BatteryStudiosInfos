class BTACLClanHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

function float GetItemHeight(Canvas C)
{
    return 34.0000000;
    //return;    
}

function AddClan(int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, string Clanname, string ClanMaster, string ClanMemberCount, string ClanCreateDate, string ClanHistory, string ClanRanking, byte ClanRecruit, int ClanRank, int ClanLevel)
{
    local wGameManager GameMgr;
    local BTAutoColumnListDataHK row;
    local int i;

    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(10);
    i = 0;
    J0x27:

    // End:0x84 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        row.DataPerColumn[2].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[1].strValue = Clanname;
    row.DataPerColumn[2].strValue = ClanMaster;
    row.DataPerColumn[3].strValue = ClanMemberCount;
    row.DataPerColumn[4].strValue = ClanCreateDate;
    row.DataPerColumn[5].strValue = ClanHistory;
    row.DataPerColumn[6].strValue = ClanRanking;
    row.DataPerColumn[0].IntValue = ClanMarkPattern;
    row.DataPerColumn[1].IntValue = ClanMarkBG;
    row.DataPerColumn[2].IntValue = ClanMarkBL;
    row.DataPerColumn[4].tempValue = int(ClanRecruit);
    GameMgr.cmm.AddClanMark(Clanname, ClanMarkPattern, ClanMarkBG, ClanMarkBL, true, int(ClanRecruit) > 0);
    GameMgr.cmm.SetClanLevel(Clanname, ClanLevel);
    row.DataPerColumn[7].Image = GameMgr.GetClanMark32(ClanMarkPattern);
    row.DataPerColumn[8].Image = GameMgr.GetClanMark32(ClanMarkBG);
    row.DataPerColumn[9].Image = GameMgr.GetClanMark32(ClanMarkBL);
    AddRow(row);
    //return;    
}

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    Controller.ViewportOwner.Actor.Level.GameMgr.cmm.Render(C, int(L + float(1)), int(t + float(1)), int((L + float(1)) + float(32)), int(B - float(1)), ACLRowList[row].DataPerColumn[1].strValue);
    //return;    
}

function LC_1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0000000, L + float(5), t, R - float(5), B, Data.Text[i].DrawShadowColor);
    //return;    
}

function LC_2_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0000000, L + float(5), t, R - float(5), B, Data.Text[i].DrawShadowColor);
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
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("clan mark", 251.0000000 - float(216), 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("clan name", 363.0000000 - float(251), 7);
    headerInfo.__CustomDraw__Delegate = LC_1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("master nick", 473.0000000 - float(363), 7);
    headerInfo.__CustomDraw__Delegate = LC_2_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("crew", 523.0000000 - float(473), 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("history", 601.0000000 - float(523), 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("consquence", 713.0000000 - float(601), 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("ranking", 793.0000000 - float(713), 0);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}
