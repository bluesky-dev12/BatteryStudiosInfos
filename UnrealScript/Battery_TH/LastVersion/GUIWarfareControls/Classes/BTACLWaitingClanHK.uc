class BTACLWaitingClanHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

function float GetItemHeight(Canvas C)
{
    return 34.0000000 * (float(Controller.ResY) / 768.0000000);
    //return;    
}

function AddClan(int Level, int Map, int supply)
{
    local wGameManager GameMgr;
    local BTAutoColumnListDataHK row;
    local int i;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(3);
    i = 0;
    J0x56:

    // End:0xD6 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 4;
        row.DataPerColumn[1].Text[i].FontDrawType = 4;
        row.DataPerColumn[2].Text[i].FontDrawType = 4;
        i++;
        // [Loop Continue]
        goto J0x56;
    }
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[0].strValue = "";
    row.DataPerColumn[1].IntValue = Map;
    row.DataPerColumn[1].strValue = "";
    row.DataPerColumn[2].IntValue = supply;
    row.DataPerColumn[2].strValue = "";
    AddRow(row);
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
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("clan level", 372.0000000 - float(252), 3);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("map", 252.0000000 - float(134), 3);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("supply", 134.0000000 - float(19), 3);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}
