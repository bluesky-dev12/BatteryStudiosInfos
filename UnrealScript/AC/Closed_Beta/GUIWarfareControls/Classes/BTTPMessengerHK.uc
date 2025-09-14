class BTTPMessengerHK extends GUITabPanel
    editinlinenew
    instanced;

enum E_TAB_MENU_TYPE
{
    TAB_MENU_CONNECTED,             // 0
    TAB_MENU_FRIEND,                // 1
    TAB_MENU_CLAN,                  // 2
    TAB_MENU_PCBANG,                // 3
    TAB_MENU_MAX_COUNT              // 4
};

var export editinline BTOwnerDrawCaptionButtonHK ButtonMainPCBang;
var() automated BTStretchedImageHK BackgroundImage;
var() automated BTStretchedImageHK ListBoundImage[3];
var() automated TabControlMocker TabControl;
var array<export editinline BTOwnerDrawCaptionButtonHK> ButtonMsg;
var array<export editinline BTAutoColumnListHK> ACLMsg;
var array<export editinline BTContextMenuHK> CMMsg;
var wMatchMaker MM;
var localized string strConnected;
var localized string strFriend;
var localized string strClan;
var localized string strDeny;
var localized string strPCBang;
var localized string strOffLine;
var localized string strLogout;
var localized string strMainPCBang[4];
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

function int FindChannelUser(int UID)
{
    local int i, Index;

    Index = int(0);
    i = 0;
    J0x11:

    // End:0x75 [Loop If]
    if(i < ACLMsg[Index].ACLRowList.Length)
    {
        // End:0x6B
        if(ACLMsg[Index].ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x11;
    }
    return -1;
    //return;    
}

function AddChannelUser(int ClanPattern, int ClanBG, int ClanBL, string ClanName, int Level, string UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
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
    row.DataPerColumn[2].Image = GameMgr.GetClanMark32(ClanPattern);
    row.DataPerColumn[3].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[5].tempValue = ClanLevel;
    row.DataPerColumn[5].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].IntValue = LevelMarkID;
    // End:0x262
    if(UserName == MM.kUserName)
    {
        row.DataPerColumn[3].tempValue = 1;        
    }
    else
    {
        row.DataPerColumn[3].tempValue = 0;
        // End:0x331
        if(IsFriendlyUser(UserName, ClanName))
        {
            row.DataPerColumn[2].floatValue = 1.0000000;
            row.DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
            row.DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameOn();
            row.DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
    }
    i = 0;
    J0x338:

    // End:0x371 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x338;
    }
    ACLMsg[int(0)].AddRow(row);
    //return;    
}

function ReplaceChannelUser(int Index, int ClanPattern, int ClanBG, int ClanBL, string ClanName, int Level, string UserName, int UID, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local BTAutoColumnListDataHK row;
    local int i;
    local wGameManager GameMgr;

    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row = ACLMsg[int(0)].ACLRowList[Index];
    row.InitData(2);
    row.BackgroundImage = Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.list_commu_n;
    row.DataPerColumn[0].IntValue = ClanPattern;
    row.DataPerColumn[0].strValue = ClanName;
    row.DataPerColumn[1].IntValue = Level;
    row.DataPerColumn[2].strValue = UserName;
    row.DataPerColumn[2].IntValue = UID;
    row.DataPerColumn[3].IntValue = ClanBG;
    row.DataPerColumn[4].IntValue = ClanBL;
    row.DataPerColumn[2].Image = GameMgr.GetClanMark32(ClanPattern);
    row.DataPerColumn[3].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[5].tempValue = ClanLevel;
    row.DataPerColumn[5].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].IntValue = LevelMarkID;
    // End:0x272
    if(UserName == MM.kUserName)
    {
        row.DataPerColumn[3].tempValue = 1;        
    }
    else
    {
        row.DataPerColumn[3].tempValue = 0;
        // End:0x341
        if(IsFriendlyUser(UserName, ClanName))
        {
            row.DataPerColumn[2].floatValue = 1.0000000;
            row.DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
            row.DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameOn();
            row.DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
    }
    i = 0;
    J0x348:

    // End:0x381 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x348;
    }
    //return;    
}

function AddFriendUser(string UserName, byte IsLogOn, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, int ClanGrade, byte IsLookForClan, int ClanLevel, int LevelMarkID)
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
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    row.DataPerColumn[6].tempValue = int(IsLogOn);
    row.DataPerColumn[4].strValue = ClanName;
    row.DataPerColumn[4].IntValue = ClanBG;
    row.DataPerColumn[5].IntValue = ClanBL;
    row.DataPerColumn[6].IntValue = ClanMark;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanMark);
    row.DataPerColumn[5].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[0].tempValue = ClanGrade;
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[7].tempValue = ClanLevel;
    row.DataPerColumn[7].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[7].IntValue = LevelMarkID;
    i = 0;
    J0x288:

    // End:0x2E4 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x288;
    }
    ACLMsg[int(1)].AddRow(row);
    BTACLMessengerFriendHK(ACLMsg[int(1)]).SortByConnectionStatus();
    //return;    
}

function AddClanUser(string UserName, byte IsLogOn, int Level, int ClanGrade, int ClanWinCnt, int ClanLoseCnt, int LevelMarkID, int TitleMarkID)
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
    row.DataPerColumn[0].IntValue = Level;
    row.DataPerColumn[1].strValue = UserName;
    i = 0;
    J0xAE:

    // End:0x10A [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0xAE;
    }
    row.DataPerColumn[3].tempValue = ClanGrade;
    row.DataPerColumn[5].IntValue = ClanWinCnt;
    row.DataPerColumn[5].tempValue = ClanLoseCnt;
    row.DataPerColumn[1].IntValue = int(IsLogOn);
    row.DataPerColumn[2].IntValue = LevelMarkID;
    ACLMsg[int(2)].AddRow(row);
    BTACLMessengerClanHK(ACLMsg[int(2)]).SortByConnectionStatus();
    //return;    
}

function AddPCBangUser(string UserName, int ClanMark, int ClanBG, int ClanBL, string ClanName, int Level, string ServerName, string ServerIP, int serverPort, int CurPos, int ChannelNum, string ChannelNickName, int RoomNum, int ClanGrade, int ClanWin, int ClanLose, byte IsLookForClan, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
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
    // End:0x14D
    if(CurPos == 2)
    {
        row.DataPerColumn[1].IntValue = RoomNum;        
    }
    else
    {
        row.DataPerColumn[1].IntValue = -1;
    }
    row.DataPerColumn[2].strValue = ServerIP;
    row.DataPerColumn[2].IntValue = serverPort;
    // End:0x1C7
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
    // End:0x242
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
    row.DataPerColumn[4].Image = GameMgr.GetClanMark32(ClanBG);
    row.DataPerColumn[5].Image = GameMgr.GetClanMark32(ClanBL);
    row.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanMark);
    row.DataPerColumn[0].tempValue = ClanGrade;
    row.DataPerColumn[1].tempValue = ClanWin;
    row.DataPerColumn[2].tempValue = ClanLose;
    row.DataPerColumn[4].tempValue = int(IsLookForClan);
    row.DataPerColumn[7].tempValue = ClanLevel;
    row.DataPerColumn[7].Image = GameMgr.GetClanLevelImage(ClanLevel);
    row.DataPerColumn[5].strValue = ChannelNickName;
    row.DataPerColumn[7].IntValue = LevelMarkID;
    i = 0;
    J0x458:

    // End:0x4B4 [Loop If]
    if(i < 3)
    {
        row.DataPerColumn[0].Text[i].FontDrawType = 3;
        row.DataPerColumn[1].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x458;
    }
    ACLMsg[int(3)].AddRow(row);
    //return;    
}

function int FindFriendFromUserName(string UserName)
{
    local int i, Index;

    Index = int(1);
    i = 0;
    J0x11:

    // End:0x74 [Loop If]
    if(i < ACLMsg[Index].ACLRowList.Length)
    {
        // End:0x6A
        if(ACLMsg[Index].ACLRowList[i].DataPerColumn[1].strValue == UserName)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x11;
    }
    return -1;
    //return;    
}

function UpdateFriendlyUser(optional int ListIdx)
{
    local int i, Index;

    Index = int(0);
    Log((((("UpdateFriendlyUser : " $ string(ACLMsg[Index].ACLRowList.Length)) $ ", idx:") $ string(ListIdx)) $ ", listLength : ") $ string(ACLMsg[ListIdx].ACLRowList.Length));
    i = 0;
    J0x82:

    // End:0x281 [Loop If]
    if(i < ACLMsg[Index].ACLRowList.Length)
    {
        // End:0x277
        if((ACLMsg[Index].ACLRowList[i].DataPerColumn[2].floatValue == float(0)) && IsFriendlyUser(ACLMsg[Index].ACLRowList[i].DataPerColumn[2].strValue, ACLMsg[Index].ACLRowList[i].DataPerColumn[0].strValue, ListIdx))
        {
            Log("UpdateFriendlyUser : " $ ACLMsg[Index].ACLRowList[i].DataPerColumn[2].strValue);
            ACLMsg[Index].ACLRowList[i].DataPerColumn[2].floatValue = 1.0000000;
            ACLMsg[Index].ACLRowList[i].DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
            ACLMsg[Index].ACLRowList[i].DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameOn();
            ACLMsg[Index].ACLRowList[i].DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls_Decompressed.BTUIColorPoolHK'.static.FriendlyUserNameN();
        }
        ++i;
        // [Loop Continue]
        goto J0x82;
    }
    //return;    
}

function bool IsFriendlyUser(string UserName, optional string ClanName, optional int ListIdx)
{
    local int i, j;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x4A
    if(MM.kUserName == UserName)
    {
        return false;
    }
    // End:0xB5
    if((ClanName != "") && MM.kClanName == ClanName)
    {
        Log((("[BTTPMessenger::IsFriendlyUser] " $ MM.kClanName) $ " == ") $ ClanName);
        return true;
    }
    // End:0x193
    if(ListIdx == 0)
    {
        i = 1;
        J0xC7:

        // End:0x190 [Loop If]
        if(i < ACLMsg.Length)
        {
            // End:0xE8
            if(i == int(2))
            {
                // [Explicit Continue]
                goto J0x186;
            }
            j = 0;
            J0xEF:

            // End:0x186 [Loop If]
            if(j < ACLMsg[i].ACLRowList.Length)
            {
                // End:0x17C
                if(ACLMsg[i].ACLRowList[j].DataPerColumn[1].strValue == UserName)
                {
                    Log((("UpdateFriendlyUser idx :" $ string(ListIdx)) $ ", name :") $ UserName);
                    return true;
                }
                ++j;
                // [Loop Continue]
                goto J0xEF;
            }
            J0x186:

            ++i;
            // [Loop Continue]
            goto J0xC7;
        }        
    }
    else
    {
        // End:0x1B3
        if((ListIdx >= ACLMsg.Length) || ListIdx == 2)
        {
            return false;
        }
        i = 0;
        J0x1BA:

        // End:0x251 [Loop If]
        if(i < ACLMsg[ListIdx].ACLRowList.Length)
        {
            // End:0x247
            if(ACLMsg[ListIdx].ACLRowList[i].DataPerColumn[1].strValue == UserName)
            {
                Log((("UpdateFriendlyUser idx :" $ string(ListIdx)) $ ", Name :") $ UserName);
                return true;
            }
            ++i;
            // [Loop Continue]
            goto J0x1BA;
        }
    }
    return false;
    //return;    
}

function RemoveChannelUser(int UID)
{
    local int i, Index;

    Index = int(0);
    i = 0;
    J0x11:

    // End:0x8C [Loop If]
    if(i < ACLMsg[Index].ACLRowList.Length)
    {
        // End:0x82
        if(ACLMsg[Index].ACLRowList[i].DataPerColumn[2].IntValue == UID)
        {
            ACLMsg[Index].RemoveRow(i);
            // [Explicit Break]
            goto J0x8C;
        }
        i++;
        // [Loop Continue]
        goto J0x11;
    }
    J0x8C:

    //return;    
}

function RemoveAll(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    ACLMsg[int(eTabMenuType)].RemoveAll();
    //return;    
}

function SavePos(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    ACLMsg[int(eTabMenuType)].SavePos();
    //return;    
}

function LoadPos(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    ACLMsg[int(eTabMenuType)].LoadPos();
    //return;    
}

function bool ContextMenu_OnOpen(GUIContextMenu Sender)
{
    local int i;

    i = TabControl.GetCurrentTabIndex();
    // End:0xAD
    if(ACLMsg[i].selectIndex >= 0)
    {
        ACLMsg[i].MultiColumnList.bHotTrack = false;
        BTContextMenuHK(ACLMsg[i].ContextMenu).OpenContextMenu(int(Controller.MouseX), int(Controller.MouseY));
        OnPopupCheck(i, ACLMsg[i]);
        return true;        
    }
    else
    {
        ACLMsg[i].MultiColumnList.bHotTrack = true;
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

delegate OnPopupChannel(int ContextMenuIndex, BTACLMessengerChannelHK acl)
{
    //return;    
}

delegate OnPopupFriend(int ContextMenuIndex, BTACLMessengerFriendHK acl)
{
    //return;    
}

delegate OnPopupClan(int ContextMenuIndex, BTACLMessengerClanHK acl)
{
    //return;    
}

delegate OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl)
{
    //return;    
}

function OnPopupCheck(int Panel, BTAutoColumnListHK acl)
{
    // End:0x38
    if(Panel == int(0))
    {
        OnPopupChannelCheck(BTACLMessengerChannelHK(acl), BTCMMessengerChannelHK(acl.ContextMenu));        
    }
    else
    {
        // End:0x70
        if(Panel == int(1))
        {
            OnPopupFriendCheck(BTACLMessengerFriendHK(acl), BTCMMessengerFriendHK(acl.ContextMenu));            
        }
        else
        {
            // End:0xA8
            if(Panel == int(2))
            {
                OnPopupClanCheck(BTACLMessengerClanHK(acl), BTCMMessengerClanHK(acl.ContextMenu));                
            }
            else
            {
                // End:0xDD
                if(Panel == int(3))
                {
                    OnPopupPCBangCheck(BTACLMessengerPCBangHK(acl), BTCMMessengerPCBangHK(acl.ContextMenu));
                }
            }
        }
    }
    //return;    
}

delegate OnPopupChannelCheck(BTACLMessengerChannelHK acl, BTCMMessengerChannelHK cm)
{
    //return;    
}

delegate OnPopupFriendCheck(BTACLMessengerFriendHK acl, BTCMMessengerFriendHK cm)
{
    //return;    
}

delegate OnPopupClanCheck(BTACLMessengerClanHK acl, BTCMMessengerClanHK cm)
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
        // End:0xA2
        case int(0):
            OnPopupChannel(ContextMenuIndex, BTACLMessengerChannelHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0xCB
        case int(1):
            OnPopupFriend(ContextMenuIndex, BTACLMessengerFriendHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0xF4
        case int(2):
            OnPopupClan(ContextMenuIndex, BTACLMessengerClanHK(ACLMsg[i]));
            // End:0x120
            break;
        // End:0x11D
        case int(3):
            OnPopupPCBang(ContextMenuIndex, BTACLMessengerPCBangHK(ACLMsg[i]));
            // End:0x120
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

function BTACLMessengerChannelHK_OnAdjustWindow(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnAdjustWindow(Top, Count, itemperpage);
    //return;    
}

function BTACLMessengerChannelHK_OnHitBottom(int Top, int Count, int itemperpage)
{
    ChannelUserList_OnHitBottom(Top, Count, itemperpage);
    //return;    
}

function BTACLMessengerChannelHK_OnHitTop(int Top, int Count, int itemperpage)
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
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    ListBoundImage[0].bUseAWinPos = true;
    fb.X1 = AWinPos.X1;
    fb.Y1 = AWinPos.Y1 + float(23);
    fb.X2 = AWinPos.X2;
    fb.Y2 = AWinPos.Y2;
    ListBoundImage[0].AWinPos = fb;
    ListBoundImage[0].bBoundToParent = false;
    ListBoundImage[0].bScaleToParent = false;
    ListBoundImage[0].ApplyAWinPos();
    // End:0x1DF
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
    J0x2C3:

    // End:0x7FB [Loop If]
    if(i < int(4))
    {
        serverButton = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
        serverButton.bUseAWinPos = true;
        fb.X1 = (AWinPos.X1 + float(60 * i)) + float(i);
        fb.Y1 = AWinPos.Y1;
        fb.X2 = (AWinPos.X1 + float(60 * (i + 1))) + float(i);
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
        // End:0x4DC
        if(i == int(0))
        {
            serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerChannelHK';
            BTACLMessengerChannelHK(serverACL).__OnAdjustWindow__Delegate = BTACLMessengerChannelHK_OnAdjustWindow;
            BTACLMessengerChannelHK(serverACL).__OnHitTop__Delegate = BTACLMessengerChannelHK_OnHitTop;
            BTACLMessengerChannelHK(serverACL).__OnHitBottom__Delegate = BTACLMessengerChannelHK_OnHitBottom;            
        }
        else
        {
            // End:0x4FC
            if(i == int(1))
            {
                serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerFriendHK';                
            }
            else
            {
                // End:0x51C
                if(i == int(3))
                {
                    serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerPCBangHK';                    
                }
                else
                {
                    // End:0x539
                    if(i == int(2))
                    {
                        serverACL = new Class'GUIWarfareControls_Decompressed.BTACLMessengerClanHK';
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
        // End:0x6A6
        if(i == int(3))
        {
            fb.X1 = AWinPos.X1 + float(2);
            fb.Y1 = (AWinPos.Y1 + float(2)) + float(23);
            fb.X2 = (AWinPos.X2 - float(2)) - float(15);
            fb.Y2 = ((AWinPos.Y1 + float(2)) + float(23)) + float(34);
            ButtonMainPCBang = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fb));
            ButtonMainPCBang.SetDefaultButtonImage();
            ButtonMainPCBang.SetVisibility(false);
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
        goto J0x2C3;
    }
    i = 0;
    J0x802:

    // End:0x825 [Loop If]
    if(i < int(4))
    {
        AddAclMsgMenu(i);
        ++i;
        // [Loop Continue]
        goto J0x802;
    }
    TabControl.SetVisiblePanel(int(0));
    //return;    
}

function AddAclMsgMenu(int Index)
{
    // End:0x40
    if(Index == int(0))
    {
        ButtonMsg[Index].Caption = strConnected;
        CMMsg[Index] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerChannelHK';        
    }
    else
    {
        // End:0x80
        if(Index == int(1))
        {
            ButtonMsg[Index].Caption = strFriend;
            CMMsg[Index] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerFriendHK';            
        }
        else
        {
            // End:0xC0
            if(Index == int(2))
            {
                ButtonMsg[Index].Caption = strClan;
                CMMsg[Index] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerClanHK';                
            }
            else
            {
                // End:0xFD
                if(Index == int(3))
                {
                    ButtonMsg[Index].Caption = strPCBang;
                    CMMsg[Index] = new Class'GUIWarfareControls_Decompressed.BTCMMessengerPCBangHK';
                }
            }
        }
    }
    CMMsg[Index].InitComponent(self.Controller, none);
    CMMsg[Index].__OnOpen__Delegate = ContextMenu_OnOpen;
    CMMsg[Index].__OnClose__Delegate = ContextMenu_OnClose;
    CMMsg[Index].__OnSelected__Delegate = ContextMenu_OnSelected;
    ACLMsg[Index].ContextMenu = CMMsg[Index];
    //return;    
}

function bool BTWindowDefineARHK_18_19_OnOK(GUIComponent Sender)
{
    MM.kTcpChannel.sfReqRegisterMainPCBang();
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool ButtonMainPCBang_Register_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool ButtonMainPCBang_Change_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function bool ButtonMainPCBang_Playing_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function UpdatePCBangInfo()
{
    //return;    
}

function Internal_OnVisiblePanelChanged(int Index)
{
    // End:0xD6
    if(Index == int(3))
    {
        // End:0x68
        if(false == MM.IsPlayingPCBang())
        {
            ButtonMainPCBang.__OnClick__Delegate = None;
            ButtonMainPCBang.Caption = strMainPCBang[3];
            ACLMsg[Index].RemoveAll();
            return;            
        }
        else
        {
            // End:0xA9
            if(MM.kIsMainPCBang == 0)
            {
                ButtonMainPCBang.__OnClick__Delegate = ButtonMainPCBang_Register_OnClick;
                ButtonMainPCBang.Caption = strMainPCBang[0];                
            }
            else
            {
                ButtonMainPCBang.__OnClick__Delegate = ButtonMainPCBang_Playing_OnClick;
                ButtonMainPCBang.Caption = strMainPCBang[1];
            }
        }        
    }
    else
    {
        ButtonMainPCBang.__OnClick__Delegate = None;
    }
    // End:0x12C
    if((TabControl.GetVisiblePanelIndex() == int(3)) && MM.IsPlayingPCBang() == true)
    {
        ButtonMainPCBang.SetVisibility(true);        
    }
    else
    {
        ButtonMainPCBang.SetVisibility(false);
    }
    //return;    
}

function UpdateTabButtonPosition()
{
    local int VisibleIndex, i;

    VisibleIndex = 0;
    i = 0;
    J0x0E:

    // End:0x120 [Loop If]
    if(i < 4)
    {
        // End:0x116
        if(ButtonMsg[i].bVisible == true)
        {
            ButtonMsg[i].AWinPos.X1 = (AWinPos.X1 + float(60 * VisibleIndex)) + float(VisibleIndex);
            ButtonMsg[i].AWinPos.Y1 = AWinPos.Y1;
            ButtonMsg[i].AWinPos.X2 = (AWinPos.X1 + float(60 * (VisibleIndex + 1))) + float(VisibleIndex);
            ButtonMsg[i].AWinPos.Y2 = AWinPos.Y1 + float(32);
            ButtonMsg[i].ApplyAWinPos();
            VisibleIndex++;
        }
        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    //return;    
}

function ShowTabButton(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    // End:0x3B
    if(ButtonMsg[int(eTabMenuType)].bVisible == false)
    {
        ButtonMsg[int(eTabMenuType)].SetVisibility(true);
        UpdateTabButtonPosition();
    }
    //return;    
}

function HideTabButton(BTTPMessengerHK.E_TAB_MENU_TYPE eTabMenuType)
{
    // End:0x3B
    if(ButtonMsg[int(eTabMenuType)].bVisible == true)
    {
        ButtonMsg[int(eTabMenuType)].SetVisibility(false);
        UpdateTabButtonPosition();
    }
    //return;    
}

function SetUserServerInfo(string szServername, string szServerShortName, string szServerIP, int serverPort, byte CurPos, byte CurState, int ChannelNum, string szChannelNickName, int GameRoomNum)
{
    local int Index, iRowIndex;
    local BTAutoColumnListDataHK row;
    local bool bPlaying;
    local export editinline BTACLMessengerCommon kACL;

    Index = TabControl.GetCurrentTabIndex();
    kACL = BTACLMessengerCommon(ACLMsg[Index]);
    iRowIndex = ACLMsg[Index].selectIndex;
    row = ACLMsg[Index].GetRowByIndex(ACLMsg[Index].selectIndex);
    switch(CurPos)
    {
        // End:0x9C
        case 1:
            kACL.SetCurLocationName(iRowIndex, szChannelNickName);
            // End:0xCE
            break;
        // End:0xCB
        case 2:
            kACL.SetCurLocationName(iRowIndex, (szChannelNickName $ "/") $ string(GameRoomNum));
            // End:0xCE
            break;
        // End:0xFFFF
        default:
            break;
    }
    // End:0xF8
    if(int(CurPos) == 2)
    {
        kACL.SetGameRoomNumber(iRowIndex, GameRoomNum);        
    }
    else
    {
        kACL.SetGameRoomNumber(iRowIndex, -1);
    }
    kACL.SetServerIP(iRowIndex, szServerIP);
    kACL.SetServerPort(iRowIndex, serverPort);
    // End:0x169
    if(int(CurPos) == 0)
    {
        kACL.SetServerName(iRowIndex, "");        
    }
    else
    {
        kACL.SetServerName(iRowIndex, szServername);
    }
    kACL.SetChannelNumber(iRowIndex, ChannelNum);
    kACL.SetCurpos(iRowIndex, int(CurPos));
    kACL.SetChannelName(iRowIndex, szChannelNickName);
    kACL.SetCurState(iRowIndex, int(CurState));
    bPlaying = (int(CurPos) == 2) && int(CurState) == 2;
    // End:0x23D
    if(bPlaying == true)
    {
        BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).SetLogOnState(2);
    }
    BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).SetLocation(szChannelNickName, GameRoomNum);
    // End:0x301
    if(((MM.kRoomID == GameRoomNum) && MM.kServerName == szServername) && MM.kChannelID == ChannelNum)
    {
        BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeMoveRoomState(false);
        BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeInviteState(false);        
    }
    else
    {
        // End:0x397
        if((int(CurPos) >= 1) && MM.kRoomID != -1)
        {
            BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeMoveRoomState(true);
            BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeInviteState(true);
            BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeWispherState(true);            
        }
        else
        {
            BTCMMessengerOnOffline(ACLMsg[Index].ContextMenu).ChangeInviteState(false);
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: [0]BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPMessengerHK.mListBoundImage'
    begin object name="mListBoundImage" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
        Image=Texture'Warfare_GP_UI_UI.Common.panel_1'
    end object
    ListBoundImage=mListBoundImage
    // Reference: BTStretchedImageHK'GUIWarfareControls_Decompressed.BTTPMessengerHK.mListBoundImage3'
    begin object name="mListBoundImage3" class=GUIWarfareControls_Decompressed.BTStretchedImageHK
    end object
    ListBoundImage=mListBoundImage3
    // Reference: TabControlMocker'GUIWarfareControls_Decompressed.BTTPMessengerHK.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls_Decompressed.TabControlMocker
        OnVisiblePanelChanged=BTTPMessengerHK.Internal_OnVisiblePanelChanged
    end object
    TabControl=mTabControl
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
    bBoundToParent=true
    bScaleToParent=true
}