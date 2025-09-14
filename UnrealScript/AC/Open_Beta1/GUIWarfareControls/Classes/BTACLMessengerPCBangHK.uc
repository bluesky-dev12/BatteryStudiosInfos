class BTACLMessengerPCBangHK extends BTACLMessengerCommon
    editinlinenew
    instanced;

var Image CommonSizeImg;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    PlayerOwner().Level.GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, (L + float(4)) + float(32), t + float(1), (L + float(4)) + float(64), B - float(1));
    i = 0;
    // End:0xA7
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0xBD
    if(selectIndex == row)
    {
        i = 1;
    }
    Data.Text[i].FontSize = 10;
    C.DrawColor = Data.Text[i].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 91, 0, 0, 0, Data.Text[i].DrawShadowColor);
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
    C.DrawColor = Data.Text[i].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0000000, L, t, R, B, 0, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function int GetLevel(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
    //return;    
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
    //return;    
}

function int GetRoomNumber(int row)
{
    return ACLRowList[row].DataPerColumn[1].IntValue;
    //return;    
}

function string GetServerIP(int row)
{
    return ACLRowList[row].DataPerColumn[2].strValue;
    //return;    
}

function int GetCurPos(int row)
{
    return ACLRowList[row].DataPerColumn[3].tempValue;
    //return;    
}

function int GetCurPosInt(int row)
{
    return ACLRowList[row].DataPerColumn[3].tempValue;
    //return;    
}

function int GetServerPort(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
    //return;    
}

function string GetServerName(int row)
{
    return ACLRowList[row].DataPerColumn[3].strValue;
    //return;    
}

function int GetChannelNum(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
    //return;    
}

function string GetClanName(int row)
{
    return ACLRowList[row].DataPerColumn[4].strValue;
    //return;    
}

function int GetClanPatternID(int row)
{
    return ACLRowList[row].DataPerColumn[6].IntValue;
    //return;    
}

function Image GetClanPattern(int row)
{
    return ACLRowList[row].DataPerColumn[6].Image;
    //return;    
}

function Image GetClanBG(int row)
{
    return ACLRowList[row].DataPerColumn[5].Image;
    //return;    
}

function Image GetClanBL(int row)
{
    return ACLRowList[row].DataPerColumn[4].Image;
    //return;    
}

function int GetClanNum(int row)
{
    return ACLRowList[row].DataPerColumn[4].IntValue;
    //return;    
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[7].IntValue;
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return 36.0000000;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    CommonSizeImg.width = 32.0000000;
    CommonSizeImg.Height = 32.0000000;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    ruii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Msg_list_on;
    ruii2 = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Msg_list_Focus;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.Msg_list_n;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("ClanMark/Level/UserName", 0.5000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}
