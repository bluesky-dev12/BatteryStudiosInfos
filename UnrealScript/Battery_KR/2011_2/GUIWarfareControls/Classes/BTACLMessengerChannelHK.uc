class BTACLMessengerChannelHK extends BTAutoColumnListHK
    editinlinenew
    instanced;

var Image CommonSizeImg;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;

    // End:0x83
    if(Data.strValue != "")
    {
        PlayerOwner().Level.GameMgr.cmm.Render(C, int(L + float(2)), int(t + float(1)), int((L + float(2)) + float(32)), int(B - float(1)), Data.strValue);        
    }
    else
    {
        // End:0x11D
        if(ACLRowList[row].DataPerColumn[3].tempValue > 0)
        {
            // End:0x11A
            if(PlayerOwner().Level.GetMatchMaker().kClanLookingFor)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ex_clanmark_02, L + float(2), t + float(1), (L + float(2)) + float(32), B - float(1));
            }            
        }
        else
        {
            // End:0x191
            if(ACLRowList[row].DataPerColumn[4].tempValue > 0)
            {
                Class'Engine.BTCustomDrawHK'.static.DrawImage(C, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.ex_clanmark_02, L + float(2), t + float(1), (L + float(2)) + float(32), B - float(1));
            }
        }
    }
    PlayerOwner().Level.GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, (L + float(4)) + float(32), t + float(1), (L + float(4)) + float(64), B - float(1));
    i = 0;
    // End:0x238
    if(LastSelectedIndex == row)
    {
        i = 2;
    }
    // End:0x24E
    if(selectIndex == row)
    {
        i = 1;
    }
    // End:0x27E
    if(IsFriendlyUser(row))
    {
        C.DrawColor = GetUserNameColor(row, i);        
    }
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 91, 0, 0, 0, Data.Text[i].DrawShadowColor);
    // End:0x40F
    if(self.selectIndex == row)
    {
        // End:0x40F
        if(Data.strValue != "")
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, SelectImage, ((L - float(110)) - float(13)) + float(2), t, L + float(2), B);
            Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[1].FontDrawType, float(Data.Text[1].FontSize), (((L - float(110)) - float(13)) + float(2)) + float(2), t, L - float(2), B, 5, 0, 0, 0, Data.Text[1].DrawShadowColor);
        }
    }
    //return;    
}

function int GetClanID(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
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

function int GetClanPatternID(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
    //return;    
}

function bool IsFriendlyUser(int row)
{
    return ACLRowList[row].DataPerColumn[2].floatValue != float(0);
    //return;    
}

function Color GetUserNameColor(int row, int idx)
{
    return ACLRowList[row].DataPerColumn[2].Text[idx].DrawColor;
    //return;    
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[5].IntValue;
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

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    CommonSizeImg.Width = 32.0000000;
    CommonSizeImg.Height = 32.0000000;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    ruii = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_on;
    ruii2 = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_cli;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("ClanMark/Level/UserName", 1.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}
