class BTACLMessengerClanHK extends BTACLMessengerCommon
    editinlinenew
    instanced;

var Image CommonSizeImg;
var BTRODecorateStringHK btToolTip;

function LC0_Draw(Canvas C, float L, float t, float R, float B, ACLData Data, int Column, int row)
{
    local int i;
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    PlayerOwner().Level.GameMgr.cmm.Render(C, int(L + float(2)), int(t + float(1)), int((L + float(2)) + float(32)), int(B - float(1)), MM.kClanName);
    PlayerOwner().Level.GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
    Class'Engine.BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, (L + float(4)) + float(32), t + float(1), (L + float(4)) + float(64), B - float(1));
    i = 0;
    // End:0x16F
    if(0 == (GetLogOnState(row)))
    {
        C.DrawColor = C.MakeColor(100, 100, 100, byte(255));        
    }
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    Class'Engine.BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 91, 0, 0, 0, Data.Text[i].DrawShadowColor);
    //return;    
}

function Internal_OnRendered(Canvas Canvas)
{
    // End:0x82
    if(selectIndex >= 0)
    {
        btToolTip.OriginalString.Text = GetSelfIntro(selectIndex);
        // End:0x82
        if(btToolTip.OriginalString.Text != "")
        {
            btToolTip.AWinPos = GetTooltipPos(170, 20);
            btToolTip.bNeedUpdate = true;
            btToolTip.Render(Canvas);
        }
    }
    //return;    
}

function SetCurpos(int row, int Value)
{
    ACLRowList[row].DataPerColumn[0].tempValue = Value;
    //return;    
}

function SetCurLocationName(int row, string Value)
{
    //return;    
}

function SetChannelName(int row, string Value)
{
    //return;    
}

function SetServerPort(int row, int Value)
{
    ACLRowList[row].DataPerColumn[3].IntValue = Value;
    //return;    
}

function SetServerIP(int row, string Value)
{
    ACLRowList[row].DataPerColumn[3].strValue = Value;
    //return;    
}

function SetServerName(int row, string Value)
{
    //return;    
}

function SetGameRoomNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[2].tempValue = Value;
    //return;    
}

function SetChannelNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[1].tempValue = Value;
    //return;    
}

function SetCurState(int row, int Value)
{
    ACLRowList[row].DataPerColumn[4].tempValue = Value;
    //return;    
}

function int GetLevel(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
    //return;    
}

function int GetCurState(int row)
{
    return ACLRowList[row].DataPerColumn[4].tempValue;
    //return;    
}

function string GetCurPos(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
    //return;    
}

function int GetCurPosInt(int row)
{
    return ACLRowList[row].DataPerColumn[0].tempValue;
    //return;    
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
    //return;    
}

function string GetServerIP(int row)
{
    return ACLRowList[row].DataPerColumn[3].strValue;
    //return;    
}

function int GetServerPort(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
    //return;    
}

function int GetChannelNum(int row)
{
    return ACLRowList[row].DataPerColumn[1].tempValue;
    //return;    
}

function int GetRoomNumber(int row)
{
    return ACLRowList[row].DataPerColumn[2].tempValue;
    //return;    
}

function string GetSelfIntro(int row)
{
    // End:0x23
    if((row < 0) || ACLRowList.Length <= row)
    {
        return "";        
    }
    else
    {
        // End:0x42
        if(ACLRowList[row].DataPerColumn.Length <= 4)
        {
            return "";
        }
    }
    return ACLRowList[row].DataPerColumn[4].strValue;
    //return;    
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
    //return;    
}

function int GetLogOnState(int row)
{
    return ACLRowList[row].DataPerColumn[1].IntValue;
    //return;    
}

function float GetItemHeight(Canvas C)
{
    return 36.0000000;
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
    headerInfo = Class'GUIWarfareControls_Decompressed.BTAutoColumnListHeaderHK'.static.MakeHeader("ClanMark/Level/UserName", 1.0000000, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    btToolTip = new Class'GUIWarfareControls_Decompressed.BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 5;
    btToolTip.InternalPadding[3] = 5;
    //return;    
}

function GUIToolTip MultiColumnList_OnBeginToolTip()
{
    __deleClanName__Delegate = None;
    // End:0x3F
    if(MultiColumnList.ToolTip != none)
    {
        return MultiColumnList.ToolTip.EnterArea();        
    }
    else
    {
        // End:0x70
        if(MultiColumnList.MenuOwner != none)
        {
            return MultiColumnList.MenuOwner.OnBeginTooltip();
        }
    }
    return none;
    //return;    
}

defaultproperties
{
    OnRendered=BTACLMessengerClanHK.Internal_OnRendered
}