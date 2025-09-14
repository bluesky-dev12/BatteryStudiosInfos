class BTACLMessengerFriendHK extends BTACLMessengerCommon
    editinlinenew
    instanced;

var Image CommonSizeImg;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i, Left;

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
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 9, 0, 0, 0, Data.Text[i].DrawShadowColor);
    // End:0x344
    if((self.selectIndex == row) && (GetCurPos(row)) != 0)
    {
        Left = int(((L - float(181)) + float(2)) - float(11));
        // End:0x26F
        if((GetClanName(row)) != "")
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, SelectImage, float(Left), t, L + float(2), B);
            PlayerOwner().Level.GameMgr.cmm.Render(C, (Left + 114) + 11, int(t + float(1)), ((Left + 114) + 32) + 11, int(B - float(1)), GetClanName(row));
            C.DrawColor = Data.Text[1].DrawColor;
            Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetClanName(row), Data.Text[1].FontDrawType, float(Data.Text[1].FontSize), float(Left + 2), t, float(((Left + 110) + 11) - 2), B, 5, 0, 0, 0, Data.Text[1].DrawShadowColor);            
        }
        else
        {
            Class'Engine.BTCustomDrawHK'.static.DrawImage(C, SelectImage, float(((Left + 114) + 11) + 32), t, L + float(2), B);
        }
        PlayerOwner().Level.GameMgr.GetLevelImage(Data.IntValue, GetLevelMarkID(row), CommonSizeImg);
        Class'Engine.BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, float((((Left + 114) + 11) + 2) + 32), t + float(1), float((((Left + 114) + 11) + 2) + 64), B - float(1));
    }
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
    // End:0x70
    if(0 == (GetLogOnState(row)))
    {
        C.DrawColor = C.MakeColor(128, 128, 128, byte(255));        
    }
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawEllipsisStringPaddingOffset(C, Data.strValue, Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), 1.0000000, L, t, R, B, 0, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function SetCurpos(int row, int Value)
{
    ACLRowList[row].DataPerColumn[3].tempValue = Value;
    //return;    
}

function SetCurLocationName(int row, string Value)
{
    ACLRowList[row].DataPerColumn[0].strValue = Value;
    //return;    
}

function SetChannelName(int row, string Value)
{
    ACLRowList[row].DataPerColumn[5].strValue = Value;
    //return;    
}

function SetServerPort(int row, int Value)
{
    ACLRowList[row].DataPerColumn[2].IntValue = Value;
    //return;    
}

function SetServerIP(int row, string Value)
{
    ACLRowList[row].DataPerColumn[2].strValue = Value;
    //return;    
}

function SetServerName(int row, string Value)
{
    ACLRowList[row].DataPerColumn[3].strValue = Value;
    //return;    
}

function SetGameRoomNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[1].IntValue = Value;
    //return;    
}

function SetChannelNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[3].IntValue = Value;
    //return;    
}

function SetCurState(int row, int Value)
{
    ACLRowList[row].DataPerColumn[5].tempValue = Value;
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

function int GetCurState(int row)
{
    return ACLRowList[row].DataPerColumn[5].tempValue;
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
    return ACLRowList[row].DataPerColumn[4].Image;
    //return;    
}

function Image GetClanBG(int row)
{
    return ACLRowList[row].DataPerColumn[5].Image;
    //return;    
}

function Image GetClanBL(int row)
{
    return ACLRowList[row].DataPerColumn[6].Image;
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

function int GetLogOnState(int row)
{
    return ACLRowList[row].DataPerColumn[6].tempValue;
    //return;    
}

function SortByConnectionStatus()
{
    local int i;
    local array<BTAutoColumnListDataHK> OffLineList;

    i = 0;
    J0x07:

    // End:0x5D [Loop If]
    if(i < ACLRowList.Length)
    {
        // End:0x53
        if((GetLogOnState(i)) == 0)
        {
            OffLineList[OffLineList.Length] = ACLRowList[i];
            ACLRowList.Remove(i, 1);
            i--;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x64:

    // End:0x96 [Loop If]
    if(i < OffLineList.Length)
    {
        ACLRowList[ACLRowList.Length] = OffLineList[i];
        i++;
        // [Loop Continue]
        goto J0x64;
    }
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

    CommonSizeImg.width = 32.0000000;
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
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("Location", 0.5000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("UserName", 0.5000000, 7);
    headerInfo.__CustomDraw__Delegate = LC1_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    //return;    
}
