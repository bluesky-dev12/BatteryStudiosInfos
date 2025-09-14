class BTACLCWMessengerFriendHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Image CommonSizeImg;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local FloatBox Coordi;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    i = 0;
    // End:0x4D
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x63
    if(selectIndex == row)
    {
        i = 1;
    }
    Data.Text[i].FontSize = 10;
    C.DrawColor = Data.Text[i].DrawColor;
    // End:0x22E
    if((GetCurPos(row)) != 0)
    {
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetCombatState(row), 3, float(Data.Text[i].FontSize), L, t, L + float(71), B, 15, 0, 0, 0, Data.Text[i].DrawShadowColor);
        GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, L + float(71), t + float(1), (L + float(71)) + float(32), B - float(1));
        C.DrawColor = Data.Text[i].DrawColor;
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetWinLose(row), 3, float(Data.Text[i].FontSize), ((L + float(71)) + float(32)) + float(123), t, R, B, 17, 0, 0, 0, Data.Text[i].DrawShadowColor);        
    }
    else
    {
        Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetDataPerColumn0_strValue(row), 3, float(Data.Text[i].FontSize), L, t, (L + float(71)) + float(32), B, 15, 0, 0, 0, Data.Text[i].DrawShadowColor);
    }
    C.DrawColor = Data.Text[i].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), 3, float(Data.Text[i].FontSize), (L + float(71)) + float(32), t, ((L + float(71)) + float(32)) + float(123), B, 17, 0, 0, 0, Data.Text[i].DrawShadowColor);
    // End:0x623
    if(self.selectIndex == row)
    {
        // End:0x623
        if((GetClanName(row)) != "")
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, SelectImage, L - float(155), t, L + float(2), B);
            C.DrawColor = Data.Text[i].DrawColor;
            Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetClanName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), ((L - float(155)) + float(32)) + float(2), t, L - float(2), B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
            // End:0x4DF
            if(ACLRowList[row].DataPerColumn[6].IntValue == 0)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ex_clanmark, (L - float(155)) + float(2), t + float(1), ((L - float(155)) + float(32)) + float(2), B - float(1));                
            }
            else
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[6].Image, (L - float(155)) + float(2), t + float(1), ((L - float(155)) + float(32)) + float(2), B - float(1));
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[5].Image, (L - float(155)) + float(2), t + float(1), ((L - float(155)) + float(32)) + float(2), B - float(1));
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[4].Image, (L - float(155)) + float(2), t + float(1), ((L - float(155)) + float(32)) + float(2), B - float(1));
            }
        }
    }
    //return;    
}

function string GetCombatState(int row)
{
    return ACLRowList[row].DataPerColumn[5].strValue;
    //return;    
}

function string GetWinLose(int row)
{
    return ACLRowList[row].DataPerColumn[6].strValue;
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

function int GetServerPort(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
    //return;    
}

function string GetDataPerColumn0_strValue(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
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
    return 34.0000000;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    CommonSizeImg.Width = 32.0000000;
    CommonSizeImg.Height = 32.0000000;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    ruii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_on;
    ruii2 = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("", 1.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}
