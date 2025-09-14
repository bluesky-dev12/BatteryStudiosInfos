class BTACLAddressHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

function float GetItemHeight(Canvas C)
{
    return 26.0000000 * (float(Controller.ResY) / 768.0000000);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    MultiColumnList.bVisibleWhenEmpty = true;
    MultiColumnList.__OnClick__Delegate = MultiColumnList_OnClick;
    self.SelectImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_on;
    self.LastSelectedImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_cli;
    self.DefaultRowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_lobby_n;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("pos", 461.0000000 - float(361), 7);
    headerInfo.__CustomDraw__Delegate = LC_0_1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("name", 562.0000000 - float(461), 7);
    headerInfo.__CustomDraw__Delegate = LC_0_1_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("check", 664.0000000 - float(562), 7);
    headerInfo.__CustomDraw__Delegate = LC2_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}

function AddAddress(string pos, string UserName)
{
    local BTAutoColumnListDataHK row;
    local int i;

    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(3);
    i = 0;
    J0x27:

    // End:0x83 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    row.DataPerColumn[0].strValue = pos;
    row.DataPerColumn[1].strValue = UserName;
    row.DataPerColumn[2].IntValue = 0;
    AddRow(row);
    //return;    
}

function LC_0_1_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, 3, float(Data.Text[i].FontSize), L, t, R, B, 5, 0, 0, 0);
    //return;    
}

function LC2_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
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
    // End:0xA1
    if(Data.IntValue == 0)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.chek_dis, L, t, R, B);        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.chek_ok, L, t, R, B);
    }
    //return;    
}

function bool MultiColumnList_OnClick(GUIComponent Sender)
{
    // End:0x43
    if(ACLRowList[LastSelectedIndexHistory].DataPerColumn[2].IntValue == 0)
    {
        ACLRowList[LastSelectedIndexHistory].DataPerColumn[2].IntValue = 1;        
    }
    else
    {
        ACLRowList[LastSelectedIndexHistory].DataPerColumn[2].IntValue = 0;
    }
    return true;
    //return;    
}
