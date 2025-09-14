class BTACLMailHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

function LC2_Content(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0000000, L, t, R, B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return 26.0000000;
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
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("date", 62.0000000, 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("sender", 80.0000000, 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("content", 155.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC2_Content;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("item", 94.0000000, 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("state", 82.0000000, 0);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}

function ChangeNonFreeGiftColumnMode()
{
    ACLHeaderList[0].ColumnPerc = 10.0000000;
    ACLHeaderList[1].ColumnPerc = 115.0000000;
    ACLHeaderList[2].ColumnPerc = 254.0000000;
    ACLHeaderList[3].ColumnPerc = 103.0000000;
    ACLHeaderList[4].ColumnPerc = 0.0000000;
    NormalizeColumnPerc();
    //return;    
}

function ChangeMailColumnMode()
{
    ACLHeaderList[0].ColumnPerc = 62.0000000;
    ACLHeaderList[1].ColumnPerc = 80.0000000;
    ACLHeaderList[2].ColumnPerc = 155.0000000;
    ACLHeaderList[3].ColumnPerc = 94.0000000;
    ACLHeaderList[4].ColumnPerc = 52.0000000;
    NormalizeColumnPerc();
    //return;    
}
