class BTACLCWMessengerChannelHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Image CommonSizeImg;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, L + float(71), t + float(1), (L + float(71)) + float(32), B - float(1));
    i = 0;
    // End:0xC0
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0xD6
    if(selectIndex == row)
    {
        i = 1;
    }
    C.DrawColor = Data.Text[i].DrawColor;
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), (L + float(71)) + float(32), t, ((L + float(71)) + float(32)) + float(123), B, 17, 0, 0, 0, Data.Text[i].DrawShadowColor);
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetWinLose(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), ((L + float(71)) + float(32)) + float(123), t, R, B, 17, 0, 0, 0, Data.Text[i].DrawShadowColor);
    // End:0x4EC
    if((GetClanName(row)) != "")
    {
        // End:0x31E
        if(self.selectIndex == row)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, SelectImage, ((L - float(110)) - float(13)) + float(2), t, L + float(2), B);
            Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetClanName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), (((L - float(110)) - float(13)) + float(2)) + float(2), t, L - float(2), B, 5, 0, 0, 0, Data.Text[i].DrawShadowColor);
        }
        // End:0x3A2
        if(ACLRowList[row].DataPerColumn[0].IntValue == 0)
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ex_clanmark, L + float(15), t + float(1), (((L + float(15)) + B) - t) - float(2), B - float(1));            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[4].Image, L + float(15), t + float(1), (((L + float(15)) + B) - t) - float(2), B - float(1));
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[3].Image, L + float(15), t + float(1), (((L + float(15)) + B) - t) - float(2), B - float(1));
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, ACLRowList[row].DataPerColumn[2].Image, L + float(15), t + float(1), (((L + float(15)) + B) - t) - float(2), B - float(1));
        }
    }
    //return;    
}

function int GetClanPattern(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
    //return;    
}

function int GetClanBG(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
    //return;    
}

function int GetClanBL(int row)
{
    return ACLRowList[row].DataPerColumn[4].IntValue;
    //return;    
}

function string GetClanName(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
    //return;    
}

function int GetLevel(int row)
{
    return ACLRowList[row].DataPerColumn[1].IntValue;
    //return;    
}

function int GetUserID(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
    //return;    
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[2].strValue;
    //return;    
}

function string GetWinLose(int row)
{
    return ACLRowList[row].DataPerColumn[3].strValue;
    //return;    
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[5].IntValue;
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return 34.0000000 * (float(Controller.ResY) / 768.0000000);
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
    ruii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_on;
    ruii2 = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("GameState/Level/UserName/WinLose", 1.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}
