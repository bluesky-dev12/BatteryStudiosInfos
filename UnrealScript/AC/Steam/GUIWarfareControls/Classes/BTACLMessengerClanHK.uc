/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTACLMessengerClanHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:27
 *
 *******************************************************************************/
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
    PlayerOwner().Level.GameMgr.cmm.Render(C, int(L + float(2)), int(t + float(1)), int(L + float(2) + float(32)), int(B - float(1)), MM.kClanName);
    PlayerOwner().Level.GameMgr.GetLevelImage(GetLevel(row), GetLevelMarkID(row), CommonSizeImg);
    class'BTCustomDrawHK'.static.DrawImage(C, CommonSizeImg, L + float(4) + float(32), t + float(1), L + float(4) + float(64), B - float(1));
    i = 0;
    // End:0x16f
    if(0 == GetLogOnState(row))
    {
        C.DrawColor = C.MakeColor(100, 100, 100, byte(255));
    }
    // End:0x193
    else
    {
        C.DrawColor = Data.Text[i].DrawColor;
    }
    class'BTCustomDrawHK'.static.DrawStringPaddingOffset(C, GetUserName(row), Data.Text[i].FontDrawType, float(Data.Text[i].FontSize), L, t, R, B, 91, 0, 0, 0, Data.Text[i].DrawShadowColor);
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
}

function SetCurpos(int row, int Value)
{
    ACLRowList[row].DataPerColumn[0].tempValue = Value;
}

function SetCurLocationName(int row, string Value);
function SetChannelName(int row, string Value);
function SetServerPort(int row, int Value)
{
    ACLRowList[row].DataPerColumn[3].IntValue = Value;
}

function SetServerIP(int row, string Value)
{
    ACLRowList[row].DataPerColumn[3].strValue = Value;
}

function SetServerName(int row, string Value);
function SetGameRoomNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[2].tempValue = Value;
}

function SetChannelNumber(int row, int Value)
{
    ACLRowList[row].DataPerColumn[1].tempValue = Value;
}

function SetCurState(int row, int Value)
{
    ACLRowList[row].DataPerColumn[4].tempValue = Value;
}

function int GetLevel(int row)
{
    return ACLRowList[row].DataPerColumn[0].IntValue;
}

function int GetCurState(int row)
{
    return ACLRowList[row].DataPerColumn[4].tempValue;
}

function string GetCurPos(int row)
{
    return ACLRowList[row].DataPerColumn[0].strValue;
}

function int GetCurPosInt(int row)
{
    return ACLRowList[row].DataPerColumn[0].tempValue;
}

function string GetUserName(int row)
{
    return ACLRowList[row].DataPerColumn[1].strValue;
}

function string GetServerIP(int row)
{
    return ACLRowList[row].DataPerColumn[3].strValue;
}

function int GetServerPort(int row)
{
    return ACLRowList[row].DataPerColumn[3].IntValue;
}

function int GetChannelNum(int row)
{
    return ACLRowList[row].DataPerColumn[1].tempValue;
}

function int GetRoomNumber(int row)
{
    return ACLRowList[row].DataPerColumn[2].tempValue;
}

function string GetSelfIntro(int row)
{
    // End:0x23
    if(row < 0 || ACLRowList.Length <= row)
    {
        return "";
    }
    // End:0x42
    else
    {
        // End:0x42
        if(ACLRowList[row].DataPerColumn.Length <= 4)
        {
            return "";
        }
    }
    return ACLRowList[row].DataPerColumn[4].strValue;
}

function int GetLevelMarkID(int row)
{
    return ACLRowList[row].DataPerColumn[2].IntValue;
}

function int GetLogOnState(int row)
{
    return ACLRowList[row].DataPerColumn[1].IntValue;
}

function float GetItemHeight(Canvas C)
{
    return 36.0;
}

function SortByConnectionStatus()
{
    local int i;
    local array<BTAutoColumnListDataHK> OffLineList;

    i = 0;
    J0x07:
    // End:0x5d [While If]
    if(i < ACLRowList.Length)
    {
        // End:0x53
        if(GetLogOnState(i) == 0)
        {
            OffLineList[OffLineList.Length] = ACLRowList[i];
            ACLRowList.Remove(i, 1);
            -- i;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    i = 0;
    J0x64:
    // End:0x96 [While If]
    if(i < OffLineList.Length)
    {
        ACLRowList[ACLRowList.Length] = OffLineList[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x64;
    }
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local BTAutoColumnListHeaderHK headerInfo;
    local Image ruii, ruii2;

    super.InitComponent(MyController, myOwner);
    MultiColumnList.bAlwaysShowScrollbar = true;
    MultiColumnBox.bDisplayHeader = false;
    CommonSizeImg.width = 32.0;
    CommonSizeImg.Height = 32.0;
    CommonSizeImg.DrawType = 21;
    CommonSizeImg.DrawColor = WhiteColor;
    ruii = class'BTUIResourcePoolHK'.default.Msg_list_on;
    ruii2 = class'BTUIResourcePoolHK'.default.Msg_list_Focus;
    self.SelectImage = ruii;
    self.LastSelectedImage = ruii2;
    self.DefaultRowImage = class'BTUIResourcePoolHK'.default.Msg_list_n;
    headerInfo = class'BTAutoColumnListHeaderHK'.static.MakeHeader("ClanMark/Level/UserName", 1.0, 7);
    headerInfo.__CustomDraw__Delegate = LC0_Draw;
    self.AddColumn(headerInfo);
    NormalizeColumnPerc();
    btToolTip = new class'BTRODecorateStringHK';
    btToolTip.Init();
    btToolTip.OriginalString.FontDrawType = 3;
    btToolTip.InternalPadding[0] = 5;
    btToolTip.InternalPadding[1] = 5;
    btToolTip.InternalPadding[2] = 5;
    btToolTip.InternalPadding[3] = 5;
}

function GUIToolTip MultiColumnList_OnBeginToolTip()
{
    __deleClanName__Delegate = None;
    // End:0x3f
    if(MultiColumnList.ToolTip != none)
    {
        return MultiColumnList.ToolTip.EnterArea();
    }
    // End:0x70
    else
    {
        // End:0x70
        if(MultiColumnList.MenuOwner != none)
        {
            return MultiColumnList.MenuOwner.OnBeginTooltip();
        }
    }
    return none;
}

defaultproperties
{
    OnRendered=Internal_OnRendered
}