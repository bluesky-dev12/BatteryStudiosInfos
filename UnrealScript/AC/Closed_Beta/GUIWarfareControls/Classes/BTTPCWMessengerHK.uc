class BTTPCWMessengerHK extends GUITabPanel
    editinlinenew
    instanced;

var export editinline BTOwnerDrawCaptionButtonHK ButtonMainPCBang;
var() automated BTStretchedImageHK BackgroundImage;
var() automated BTStretchedImageHK ListBoundImage[3];
var() automated TabControlMocker TabControl;
var array<export editinline BTOwnerDrawCaptionButtonHK> ButtonMsg;
var array<export editinline BTAutoColumnListHK> ACLMsg;
var array<export editinline BTContextMenuHK> CMMsg;
var localized string strCombatState[3];
var localized string strConnected;
var localized string strFriend;
var localized string strClan;
var localized string strDeny;
var localized string strPCBang;
var localized string strOffLine;
var localized string strLogout;
var localized string strMainPCBang[4];
var localized string strWinLose;
//var delegate<OnPopupChannel> __OnPopupChannel__Delegate;
//var delegate<OnPopupFriend> __OnPopupFriend__Delegate;
//var delegate<OnPopupClan> __OnPopupClan__Delegate;
//var delegate<OnPopupPCBang> __OnPopupPCBang__Delegate;
//var delegate<OnPopupChannelCheck> __OnPopupChannelCheck__Delegate;
//var delegate<OnPopupFriendCheck> __OnPopupFriendCheck__Delegate;
//var delegate<OnPopupClanCheck> __OnPopupClanCheck__Delegate;
//var delegate<OnPopupPCBangCheck> __OnPopupPCBangCheck__Delegate;
//var delegate<ChannelUserList_OnHitBottom> __ChannelUserList_OnHitBottom__Delegate;
//var delegate<ChannelUserList_OnHitTop> __ChannelUserList_OnHitTop__Delegate;
//var delegate<ChannelUserList_OnAdjustWindow> __ChannelUserList_OnAdjustWindow__Delegate;

function AddChannelUser(int ClanPattern, int ClanBG, int ClanBL, string ClanName, int Level, string UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local int i;
    local wGameManager GameMgr;

    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(6);
    row.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
    row.DataPerColumn[0].IntValue = ClanPattern;
    row.DataPerColumn[0].strValue = ClanName;
    row.DataPerColumn[1].IntValue = Level;
    row.DataPerColumn[2].strValue = UserName;
    row.DataPerColumn[2].IntValue = UID;
    row.DataPerColumn[3].IntValue = ClanBG;
    row.DataPerColumn[4].IntValue = ClanBL;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[2].Image = GameMgr.GetClanMark32(ClanPattern);
    row.DataPerColumn[3].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[0].tempValue = ClanGrade;
    row.DataPerColumn[3].strValue = Class'Engine.BTCustomDrawHK'.static.FormatString(strWinLose, string(ClanWinCnt), string(ClanLoseCnt));
    row.DataPerColumn[1].tempValue = ClanWinCnt;
    row.DataPerColumn[2].tempValue = ClanLoseCnt;
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[5].tempValue = ClanLevel;
    row.DataPerColumn[5].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].IntValue = LevelMarkID;
    i = 0;
    J0x2C1:

    // End:0x2FA [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x2C1;
    }
    ACLMsg[2].AddRow(row);
    //return;    
}

function ReplaceChannelUser(int Index, int ClanPattern, int ClanBG, int ClanBL, string ClanName, int Level, string UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local int i;
    local wGameManager GameMgr;

    row = ACLMsg[2].ACLRowList[Index];
    row.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
    row.DataPerColumn[0].IntValue = ClanPattern;
    row.DataPerColumn[0].strValue = ClanName;
    row.DataPerColumn[1].IntValue = Level;
    row.DataPerColumn[2].strValue = UserName;
    row.DataPerColumn[2].IntValue = UID;
    row.DataPerColumn[3].IntValue = ClanBG;
    row.DataPerColumn[4].IntValue = ClanBL;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[2].Image = GameMgr.GetClanMark32(ClanPattern);
    row.DataPerColumn[3].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[0].tempValue = ClanGrade;
    row.DataPerColumn[3].strValue = Class'Engine.BTCustomDrawHK'.static.FormatString(strWinLose, string(ClanWinCnt), string(ClanLoseCnt));
    row.DataPerColumn[1].tempValue = ClanWinCnt;
    row.DataPerColumn[2].tempValue = ClanLoseCnt;
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[5].tempValue = ClanLevel;
    row.DataPerColumn[5].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].IntValue = LevelMarkID;
    i = 0;
    J0x2BE:

    // End:0x2F7 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x2BE;
    }
    //return;    
}

function AddFriendUser(string UserName, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, string ServerName, string ServerIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int IsCombat, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;
    local wGameManager GameMgr;

    uii.Width = 223.0000000;
    uii.Height = 33.0000000;
    uii.Image = Texture'Warfare_GP_UI_UI.Common.list_commu_n';
    uii.DrawType = 15;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(8);
    row.BackgroundImage = uii;
    switch(CurPos)
    {
        // End:0x97
        case 0:
            row.DataPerColumn[0].strValue = "";
            // End:0xED
            break;
        // End:0xB9
        case 1:
            row.DataPerColumn[0].strValue = ChannelNickName;
            // End:0xED
            break;
        // End:0xEA
        case 2:
            row.DataPerColumn[0].strValue = (ChannelNickName $ "/") $ string(RoomNum);
            // End:0xED
            break;
        // End:0xFFFF
        default:
            break;
    }
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    row.DataPerColumn[1].IntValue = RoomNum;
    row.DataPerColumn[2].strValue = ServerIP;
    row.DataPerColumn[2].IntValue = serverPort;
    // End:0x19D
    if(CurPos == 0)
    {
        row.DataPerColumn[3].strValue = "";        
    }
    else
    {
        row.DataPerColumn[3].strValue = ServerName;
    }
    row.DataPerColumn[3].IntValue = ChannelNum;
    row.DataPerColumn[3].tempValue = CurPos;
    // End:0x218
    if(CurPos == 0)
    {
        row.DataPerColumn[4].strValue = "";        
    }
    else
    {
        row.DataPerColumn[4].strValue = ClanName;
    }
    row.DataPerColumn[4].IntValue = ClanBG;
    row.DataPerColumn[5].IntValue = ClanBL;
    row.DataPerColumn[6].IntValue = ClanMark;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanMark);
    row.DataPerColumn[5].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[7].tempValue = ClanLevel;
    row.DataPerColumn[7].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[0].tempValue = ClanGrade;
    row.DataPerColumn[6].strValue = Class'Engine.BTCustomDrawHK'.static.FormatString(strWinLose, string(ClanWinCnt), string(ClanLoseCnt));
    row.DataPerColumn[1].tempValue = ClanWinCnt;
    row.DataPerColumn[2].tempValue = ClanLoseCnt;
    row.DataPerColumn[6].tempValue = IsCombat;
    row.DataPerColumn[5].strValue = strCombatState[IsCombat];
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[6].strValue = ChannelNickName;
    row.DataPerColumn[7].IntValue = LevelMarkID;
    i = 0;
    J0x4A5:

    // End:0x501 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x4A5;
    }
    ACLMsg[1].AddRow(row);
    //return;    
}

function AddClanUser(string UserName, int Level, string ServerName, string ServerIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int IsCombat, int ClanWinCnt, int ClanLoseCnt, string ClanSelfIntro, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;

    uii.Width = 223.0000000;
    uii.Height = 33.0000000;
    uii.Image = Texture'Warfare_GP_UI_UI.Common.list_commu_n';
    uii.DrawType = 15;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(6);
    row.BackgroundImage = uii;
    switch(CurPos)
    {
        // End:0x97
        case 0:
            row.DataPerColumn[0].strValue = "";
            // End:0xED
            break;
        // End:0xB9
        case 1:
            row.DataPerColumn[0].strValue = ChannelNickName;
            // End:0xED
            break;
        // End:0xEA
        case 2:
            row.DataPerColumn[0].strValue = (ChannelNickName $ "/") $ string(RoomNum);
            // End:0xED
            break;
        // End:0xFFFF
        default:
            break;
    }
    row.DataPerColumn[2].strValue = ServerName;
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    i = 0;
    J0x146:

    // End:0x1A2 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x146;
    }
    row.DataPerColumn[0].tempValue = CurPos;
    row.DataPerColumn[1].tempValue = ChannelNum;
    row.DataPerColumn[2].tempValue = RoomNum;
    row.DataPerColumn[3].strValue = ServerIP;
    row.DataPerColumn[3].IntValue = serverPort;
    row.DataPerColumn[3].tempValue = ClanGrade;
    row.DataPerColumn[4].IntValue = IsCombat;
    row.DataPerColumn[4].strValue = strCombatState[IsCombat];
    row.DataPerColumn[5].IntValue = ClanWinCnt;
    row.DataPerColumn[5].tempValue = ClanLoseCnt;
    row.DataPerColumn[5].strValue = Class'Engine.BTCustomDrawHK'.static.FormatString(strWinLose, string(ClanWinCnt), string(ClanLoseCnt));
    row.DataPerColumn[6].strValue = ClanSelfIntro;
    row.DataPerColumn[7].strValue = ChannelNickName;
    row.DataPerColumn[7].IntValue = LevelMarkID;
    ACLMsg[0].AddRow(row);
    BTACLCWMessengerClanHK(ACLMsg[0]).SortByConnectionStatus();
    //return;    
}

function AddPCBangUser(string UserName, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, string ServerName, string ServerIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int ClanWin, int ClanLose, byte IsLookForClan, int IsCombat, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local Image uii;
    local int i;
    local wGameManager GameMgr;

    uii.Width = 223.0000000;
    uii.Height = 33.0000000;
    uii.Image = Texture'Warfare_GP_UI_UI.Common.list_commu_n';
    uii.DrawType = 15;
    row = new Class'GUIWarfareControls_Decompressed.BTAutoColumnListDataHK';
    row.Init(8);
    row.BackgroundImage = uii;
    switch(CurPos)
    {
        // End:0x97
        case 0:
            row.DataPerColumn[0].strValue = "";
            // End:0xED
            break;
        // End:0xB9
        case 1:
            row.DataPerColumn[0].strValue = ChannelNickName;
            // End:0xED
            break;
        // End:0xEA
        case 2:
            row.DataPerColumn[0].strValue = (ChannelNickName $ "/") $ string(RoomNum);
            // End:0xED
            break;
        // End:0xFFFF
        default:
            break;
    }
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    row.DataPerColumn[1].IntValue = RoomNum;
    row.DataPerColumn[2].strValue = ServerIP;
    row.DataPerColumn[2].IntValue = serverPort;
    // End:0x19D
    if(CurPos == 0)
    {
        row.DataPerColumn[3].strValue = "";        
    }
    else
    {
        row.DataPerColumn[3].strValue = ServerName;
    }
    row.DataPerColumn[3].IntValue = ChannelNum;
    row.DataPerColumn[3].tempValue = CurPos;
    // End:0x218
    if(CurPos == 0)
    {
        row.DataPerColumn[4].strValue = "";        
    }
    else
    {
        row.DataPerColumn[4].strValue = ClanName;
    }
    row.DataPerColumn[4].IntValue = ClanBG;
    row.DataPerColumn[5].IntValue = ClanBL;
    row.DataPerColumn[6].IntValue = ClanMark;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanMark);
    row.DataPerColumn[5].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[0].tempValue = ClanGrade;
    row.DataPerColumn[6].strValue = Class'Engine.BTCustomDrawHK'.static.FormatString(strWinLose, string(ClanWin), string(ClanLose));
    row.DataPerColumn[1].tempValue = ClanWin;
    row.DataPerColumn[2].tempValue = ClanLose;
    row.DataPerColumn[6].tempValue = IsCombat;
    row.DataPerColumn[5].strValue = strCombatState[IsCombat];
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[7].tempValue = ClanLevel;
    row.DataPerColumn[7].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[7].strValue = ChannelNickName;
    row.DataPerColumn[7].IntValue = LevelMarkID;
    i = 0;
    J0x4A5:

    // End:0x501 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x4A5;
    }
    ACLMsg[3].AddRow(row);
    //return;    
}

function int FindFriendFromUserName(string UserName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x62 [Loop If]
    if(i < ACLMsg[1].ACLRowList.Length)
    {
        // End:0x58
        if(ACLMsg[1].ACLRowList[i].DataPerColumn[1].strValue == UserName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function RemoveChannelUser(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x76 [Loop If]
    if(i < ACLMsg[0].ACLRowList.Length)
    {
        // End:0x6C
        if(ACLMsg[0].ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            ACLMsg[0].RemoveRow(i);
            // [Explicit Break]
            goto J0x76;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x76:

    //return;    
}

function RemoveAll(int Panel)
{
    ACLMsg[Panel].RemoveAll();
    //return;    
}

function SavePos(int Panel)
{
    ACLMsg[Panel].SavePos();
    //return;    
}

function LoadPos(int Panel)
{
    ACLMsg[Panel].LoadPos();
    //return;    
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    local int i;

    i = TabControl.GetCurrentTabIndex();
    // End:0xAA
    if(ACLMsg[i].selectIndex >= 0)
    {
        ACLMsg[i].MultiColumnList.bHotTrack = false;
        BTContextMenuHK(ACLMsg[i].ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        OnPopupCheck(i, ACLMsg[i]);
        return true;
    }
    return false;
    //return;    
}

function bool ContextMenu_OnClose(GUIContextMenu Sender)
{
    ACLMsg[TabControl.GetCurrentTabIndex()].MultiColumnList.bHotTrack = true;
    return true;
    //return;    
}

delegate OnPopupChannel(int ContextMenuIndex, BTACLCWMessengerChannelHK acl)
{
    //return;    
}

delegate OnPopupFriend(int ContextMenuIndex, BTACLCWMessengerFriendHK acl)
{
    //return;    
}

delegate OnPopupClan(int ContextMenuIndex, BTACLCWMessengerClanHK acl)
{
    //return;    
}

delegate OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl)
{
    //return;    
}

function OnPopupCheck(int Panel, BTAutoColumnListHK acl)
{
    // End:0x36
    if(Panel == 2)
    {
        OnPopupChannelCheck(BTACLCWMessengerChannelHK(acl), BTCMMessengerChannelHK(acl.ContextMenu));        
    }
    else
    {
        // End:0x6B
        if(Panel == 1)
        {
            OnPopupFriendCheck(BTACLCWMessengerFriendHK(acl), BTCMMessengerFriendHK(acl.ContextMenu));            
        }
        else
        {
            // End:0xA0
            if(Panel == 0)
            {
                OnPopupClanCheck(BTACLCWMessengerClanHK(acl), BTCMMessengerClanHK(acl.ContextMenu));                
            }
            else
            {
                // End:0xD3
                if(Panel == 3)
                {
                    OnPopupPCBangCheck(BTACLMessengerPCBangHK(acl), BTCMMessengerPCBangHK(acl.ContextMenu));
                }
            }
        }
    }
    //return;    
}

delegate OnPopupChannelCheck(BTACLCWMessengerChannelHK acl, BTCMMessengerChannelHK cm)
{
    //return;    
}

delegate OnPopupFriendCheck(BTACLCWMessengerFriendHK acl, BTCMMessengerFriendHK cm)
{
    //return;    
}

delegate OnPopupClanCheck(BTACLCWMessengerClanHK acl, BTCMMessengerClanHK cm)
{
    //return;    
}

delegate OnPopupPCBangCheck(BTACLMessengerPCBangHK acl, BTCMMessengerPCBangHK cm)
{
    //return;    
}

function ContextMenu_OnSelected(int ContextMenuIndex)
{
    local int i;

    i = TabControl.GetCurrentTabIndex();
    // End:0x31
    if(ACLMsg[i].selectIndex < 0)
    {
        return;
    }
    Log(("[BTTPMessengerHK::ContextMenu_OnSelected] " $ "Tab = ") $ string(i));
    switch(i)
    {
        // End:0xA0
        case 2:
            OnPopupChannel(ContextMenuIndex, BTACLCWMessengerChannelHK(ACLMsg[i]));
            // End:0x116
            break;
        // End:0xC6
        case 1:
            OnPopupFriend(ContextMenuIndex, BTACLCWMessengerFriendHK(ACLMsg[i]));
            // End:0x116
            break;
        // End:0xEC
        case 0:
            OnPopupClan(ContextMenuIndex, BTACLCWMessengerClanHK(ACLMsg[i]));
            // End:0x116
            break;
        // End:0x113
        case 3:
            OnPopupPCBang(ContextMenuIndex, BTACLMessengerPCBangHK(ACLMsg[i]));
            // End:0x116
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

delegate ChannelUserList_OnHitBottom(int Top, int Count, int itemperpage)
{
    //return;    
}

delegate ChannelUserList_OnHitTop(int Top, int Count, int itemperpage)
{
    //return;    
}

delegate ChannelUserList_OnAdjustWindow(int Top, int Count, int itemperpage)
{
    //return;    
}

function BTACLCWMessengerChannelHK_OnAdjustWindow(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnAdjustWindow(Top, Count, itemperpage);
    //return;    
}

function BTACLCWMessengerChannelHK_OnHitBottom(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnHitBottom(Top, Count, itemperpage);
    //return;    
}

function BTACLCWMessengerChannelHK_OnHitTop(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnHitTop(Top, Count, itemperpage);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline BTAutoColumnListHK serverACL;
    local export editinline BTOwnerDrawCaptionButtonHK serverButton;
    local FloatBox fb;
    local int i;

    super(GUIPanel).InitComponent(MyController, myOwner);
    ListBoundImage[0].bUseAWinPos = true;
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(23);
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    ListBoundImage[0].AWinPos = fb;
    ListBoundImage[0].bBoundToParent = false;
    ListBoundImage[0].bScaleToParent = false;
    ListBoundImage[0].ApplyAWinPos();
    // End:0x1AF
    if(ListBoundImage[1] != none)
    {
        ListBoundImage[1].bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(2);
        fb.Y1 = (AWinPos.Y1 + float(23)) + float(2);
        fb.X2 = (AWinPos.X2 - float(2)) - float(15);
        fb.Y2 = AWinPos.Y2 - float(2);
        ListBoundImage[1].AWinPos = fb;
        ListBoundImage[1].bBoundToParent = false;
        ListBoundImage[1].bScaleToParent = false;
        ListBoundImage[1].ApplyAWinPos();
    }
    ListBoundImage[2].bUseAWinPos = true;
    fb.X1 = (AWinPos.X2 - float(2)) - float(14);
    fb.Y1 = (AWinPos.Y1 + float(23)) + float(2);
    fb.X2 = AWinPos.X2 - float(2);
    fb.Y2 = AWinPos.Y2 - float(2);
    ListBoundImage[2].AWinPos = fb;
    ListBoundImage[2].bBoundToParent = false;
    ListBoundImage[2].bScaleToParent = false;
    ListBoundImage[2].ApplyAWinPos();
    i = 0;
    J0x293:

    // End:0x84F [Loop If]
    if(i < 4)
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = (AWinPos.X1 + float(58 * i)) + float(i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = (AWinPos.X1 + float(58 * (i + 1))) + float(i);
        fb.Y2 = AWinPos.Y1 + float(23);
        serverButton.AWinPos = fb;
        serverButton.RenderWeight = 0.5000000;
        serverButton.Caption = "Test";
        serverButton.CaptionDrawType = 4;
        serverButton.CaptionPadding[1] = 2;
        serverButton.CaptionAlign = 2;
        serverButton.SetDefaultTabButtonImage();
        serverButton.SetDefaultTabButtonFontColor();
        serverButton.bBoundToParent = false;
        serverButton.bScaleToParent = false;
        serverButton.InitComponent(Controller, self);
        AppendComponent(serverButton);
        serverButton.ButtonID = i;
        ButtonMsg[i] = serverButton;
        // End:0x4A8
        if(i == 2)
        {
            serverACL = new Class'GUIWarfareControls_Decompressed.BTACLCWMessengerChannelHK';
            BTACLCWMessengerChannelHK(serverACL).__OnAdjustWindow__Delegate = BTACLCWMessengerChannelHK_OnAdjustWindow;
            BTACLCWMessengerChannelHK(serverACL).__OnHitTop__Delegate = BTACLCWMessengerChannelHK_OnHitTop;
            BTACLCWMessengerChannelHK(serverACL).__OnHitBottom__Delegate = BTACLCWMessengerChannelHK_OnHitBottom;            
        }
        else
        {
            // End:0x4C5
            if(i == 1)
            {
                serverACL = new Class'GUIWarfareControls_Decompressed.BTACLCWMessengerFriendHK';                
            }
            else
            {
                // End:0x4E2
                if(i == 0)
                {
                    serverACL = new Class'GUIWarfareControls_Decompressed.BTACLCWMessengerClanHK';                    
                }
                else
                {
                    // End:0x4FD
                    if(i == 3)
                    {
                        serverACL = new Class'GUIWarfareControls_Decompressed.BTACLCWMessengerPCBangHK';
                    }
                }
            }
        }
        serverACL.bUseAWinPos = true;
        fb.X1 = AWinPos.X1 + float(2);
        fb.Y1 = (AWinPos.Y1 + float(2)) + float(23);
        fb.X2 = (AWinPos.X2 - float(2)) - float(15);
        fb.Y2 = AWinPos.Y2 - float(2);
        serverACL.AWinPos = fb;
        // End:0x6FA
        if(i == 3)
        {
            fb.X1 = AWinPos.X1 + float(2);
            fb.Y1 = (AWinPos.Y1 + float(2)) + float(23);
            fb.X2 = (AWinPos.X2 - float(2)) - float(15);
            fb.Y2 = ((AWinPos.Y1 + float(2)) + float(23)) + float(34);
            ButtonMainPCBang = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fb));
            ButtonMainPCBang.SetDefaultButtonImage();
            ButtonMainPCBang.SetVisibility(false);
            fb.X1 = AWinPos.X1 + float(2);
            fb.Y1 = ((AWinPos.Y1 + float(2)) + float(23)) + float(34);
            fb.X2 = (AWinPos.X2 - float(2)) - float(15);
            fb.Y2 = AWinPos.Y2 - float(2);
            serverACL.AWinPos = fb;
        }
        serverACL.bBoundToParent = false;
        serverACL.bScaleToParent = false;
        serverACL.RenderWeight = 0.5000000;
        serverACL.InitComponent(Controller, self);
        AppendComponent(serverACL);
        fb.X1 = (AWinPos.X2 - float(2)) - float(14);
        fb.Y1 = (AWinPos.Y1 + float(2)) + float(23);
        fb.X2 = AWinPos.X2 - float(2);
        fb.Y2 = AWinPos.Y2 - float(2);
        serverACL.MultiColumnList.MyScrollBar.AWinPos = fb;
        serverACL.MultiColumnList.MyScrollBar.ApplyAWinPos();
        ACLMsg[i] = serverACL;
        TabControl.BindTabButtonAndPanel(ButtonMsg[i], ACLMsg[i]);
        i++;
        // [Loop Continue]
        goto J0x293;
    }
    ButtonMsg[2].Caption = strConnected;
    ButtonMsg[1].Caption = strFriend;
    ButtonMsg[0].Caption = strClan;
    ButtonMsg[3].Caption = strPCBang;
    TabControl.SetVisiblePanel(0);
    CMMsg[2] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerChannelHK';
    CMMsg[1] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerFriendHK';
    CMMsg[0] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerClanHK';
    CMMsg[3] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerPCBangHK';
    i = 0;
    J0x906:

    // End:0x9AA [Loop If]
    if(i < 4)
    {
        CMMsg[i].InitComponent(self.Controller, none);
        CMMsg[i].__OnOpen__Delegate = ContextMenu_OnOpen;
        CMMsg[i].__OnClose__Delegate = ContextMenu_OnClose;
        CMMsg[i].__OnSelected__Delegate = ContextMenu_OnSelected;
        ACLMsg[i].ContextMenu = CMMsg[i];
        i++;
        // [Loop Continue]
        goto J0x906;
    }
    //return;    
}

function UpdateTabButtonPosition()
{
    local int VisibleIndex, i;

    VisibleIndex = 0;
    i = 0;
    J0x0E:

    // End:0x10E [Loop If]
    if(i < 4)
    {
        // End:0x104
        if(ButtonMsg[i].bVisible == true)
        {
            ButtonMsg[i].AWinPos.X1 = AWinPos.X1 + float(61 * VisibleIndex);
            ButtonMsg[i].AWinPos.Y1 = AWinPos.Y1;
            ButtonMsg[i].AWinPos.X2 = AWinPos.X1 + float(61 * (VisibleIndex + 1));
            ButtonMsg[i].AWinPos.Y2 = AWinPos.Y1 + float(22);
            ButtonMsg[i].ApplyAWinPos();
            VisibleIndex++;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    //return;    
}

function ShowTabButton(int Index)
{
    // End:0x37
    if(ButtonMsg[Index].bVisible == false)
    {
        ButtonMsg[Index].SetVisibility(true);
        UpdateTabButtonPosition();
    }
    //return;    
}

function HideTabButton(int Index)
{
    // End:0x37
    if(ButtonMsg[Index].bVisible == true)
    {
        ButtonMsg[Index].SetVisibility(false);
        UpdateTabButtonPosition();
    }
    //return;    
}

function bool BTWindowDefineARHK_18_19_OnOK(GUIComponent Sender)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MM.kTcpChannel.sfReqRegisterMainPCBang();
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool ButtonMainPCBang_Register_OnClick(GUIComponent Sender)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    return true;
    //return;    
}

function bool ButtonMainPCBang_Change_OnClick(GUIComponent Sender)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    return true;
    //return;    
}

function bool ButtonMainPCBang_Playing_OnClick(GUIComponent Sender)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    return true;
    //return;    
}

function UpdatePCBangInfo()
{
    Internal_OnVisiblePanelChanged(3);
    //return;    
}

function Internal_OnVisiblePanelChanged(int Index)
{
    local wMatchMaker MM;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x59
    if(TabControl.GetVisiblePanelIndex() == 3)
    {
        ButtonMainPCBang.SetVisibility(true);        
    }
    else
    {
        ButtonMainPCBang.SetVisibility(false);
    }
    //return;    
}

defaultproperties
{
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPCWMessengerHK.mBackgroundImage'
    begin object name="mBackgroundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        WinTop=0.0000000
        WinLeft=0.0000000
        WinWidth=1.0000000
        WinHeight=1.0000000
    end object
    BackgroundImage=mBackgroundImage
    // Reference: [0]BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPCWMessengerHK.mListBoundImage'
    begin object name="mListBoundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        Image=Texture'Warfare_GP_UI_UI.Common.panel_1'
    end object
    ListBoundImage=mListBoundImage
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPCWMessengerHK.mListBoundImage3'
    begin object name="mListBoundImage3" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        Image=Texture'Warfare_GP_UI_UI.Common.panel_2'
    end object
    ListBoundImage=mListBoundImage3
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPCWMessengerHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
        OnVisiblePanelChanged=BTTPCWMessengerHK.Internal_OnVisiblePanelChanged
    end object
    TabControl=mTabControl
    strCombatState[0]="Waiting"
    strCombatState[1]="In Game"
    strConnected="Online"
    strFriend="Friends"
    strClan="Clan"
    strDeny="Block"
    strPCBang="PC Cafe"
    strOffLine="Offline"
    strLogout="Log Out"
    strMainPCBang[0]="Register Primary PC Cafe"
    strMainPCBang[1]="Playing at Primary PC Cafe"
    strMainPCBang[2]="Change Primary PC Cafe"
    strMainPCBang[3]="You are not in a PC Cafe right now."
    strWinLose="%0 W / %1 L"
    bBoundToParent=true
    bScaleToParent=true
}