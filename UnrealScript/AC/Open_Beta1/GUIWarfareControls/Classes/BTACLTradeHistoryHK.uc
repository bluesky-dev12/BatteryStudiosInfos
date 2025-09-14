class BTACLTradeHistoryHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Color damageColor[5];

function float GetItemHeight(Canvas C)
{
    return 26.0000000;
    //return;    
}

function AddItem(string s1, int Damage, string s2)
{
    local BTAutoColumnListDataHK row;
    local int i;

    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(3);
    row.DataPerColumn[0].Text[i].FontDrawType = 3;
    row.DataPerColumn[0].strValue = s1;
    row.DataPerColumn[1].IntValue = Damage;
    row.DataPerColumn[1].strValue = string(Damage);
    row.DataPerColumn[2].strValue = s2;
    AddRow(row);
    //return;    
}

function Color DamageToColor(int Damage)
{
    // End:0x24
    if(Damage >= 75)
    {
        return Class'Engine.Canvas'.static.MakeColor(byte(255), 49, 52);
    }
    // End:0x46
    if(Damage >= 51)
    {
        return Class'Engine.Canvas'.static.MakeColor(154, 84, 0);
    }
    // End:0x68
    if(Damage >= 26)
    {
        return Class'Engine.Canvas'.static.MakeColor(70, 183, 223);
    }
    // End:0x8A
    if(Damage >= 11)
    {
        return Class'Engine.Canvas'.static.MakeColor(124, 241, 126);
    }
    return Class'Engine.Canvas'.static.MakeColor(byte(255), byte(255), byte(255));
    //return;    
}

function LC1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    C.DrawColor = DamageToColor(Data.IntValue);
    Class'Engine.BTCustomDrawHK'.static.DrawString(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, Data.Text[i].DrawShadowColor);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnBox.bDisplayHeader = false;
    self.SelectImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_GP_UI_UI.Lobby.list_lobby_on');
    self.LastSelectedImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(8, 8, 15, Texture'Warfare_GP_UI_UI.Lobby.list_lobby_cli');
    self.DefaultRowImage = Class'Engine.BTCustomDrawHK'.static.MakeImage(731, 25, 15, Texture'Warfare_GP_UI_UI.Lobby.list_lobby_n');
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("seller", 450.0000000 - float(333), 0);
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("damage", 570.0000000 - float(450), 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("sell price", 677.0000000 - float(570), 0);
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}
