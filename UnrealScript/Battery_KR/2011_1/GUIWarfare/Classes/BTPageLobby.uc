class BTPageLobby extends BTNetQuestInfoPageHK
    editinlinenew
    instanced;

const SendPingDelayTime = 3;

var float ACLLobby_OnHitBottom_LastTime;
var float TPMessenger_ACLMsg0_OnHitBottom_LastTime;
var localized string strEnterRoomMessage;
var localized string strConnectingLogin;
var bool bStopRefresh;
var float LastRefreshTime[2];
var float RefreshCycleTime[2];
var int TotalChannelUserCount;
var int TotalRoomCount;
var int RoomStartIndex;
var int RoomPingIndex;
var bool bJoinClanState;
var bool bClanInviteState;
var bool bGoBack;
var bool bGoTutorial;
var string SaveRoomPassword;
var() automated BTOwnerDrawImageHK BGRoomList;
var() automated BTOwnerDrawImageHK BGImageAD2;
var() automated TabControlMocker TabControl;
var() automated BTACLLobbyHK ACLLobby;
var() automated BTACLLobbyHK ACLLobbyEnterable;
var bool bAllRoomList;
var() automated BTTPChatHK TPChat;
var() automated BTTPMessengerHK TPMessenger;
var() automated BTTPMyInfoHK TPMyInfo;
var localized string strDisconnectedChannel;
var localized string strListTop[10];
var localized string strListBottom[5];
var localized string strAllRoomList;
var export editinline BTOwnerDrawImageHK ListTopChannelName;
var export editinline BTOwnerDrawCaptionButtonHK ListTopButton[10];
var export editinline BTOwnerDrawCaptionButtonHK ListBottomButton[5];
var export editinline BTOwnerDrawImageHK ListTopImage[10];
var FloatBox ListTopChannelNamePosition;
var FloatBox ListTopButtonPosition[10];
var FloatBox ListBottomButtonPosition[5];
var export editinline BTOwnerDrawImageHK LabelAD;
var localized string strMakeClanWarRoom;
var localized string strRegularClanWar;
var localized string strFriendlyClanWar;
var localized string strButtonRegularClanWar;
var localized string strButtonFriendlyClanWar;
var FloatBox fbButtonRegularClanWar;
var FloatBox fbButtonFriendlyClanWar;
var export editinline BTOwnerDrawCaptionButtonHK ButtonRegularClanWar;
var export editinline BTOwnerDrawCaptionButtonHK ButtonFriendlyClanWar;
var transient wMatchMaker MatchMaker;
var() automated FloatBox fbTestButton;
var export editinline BTNuclearButtonHK TestButton;
//var delegate<delegateAckEnterRoom> __delegateAckEnterRoom__Delegate;

delegate bool delegateAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string Clanname, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    //return;    
}

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local wMyPlayerStatus MyStatus;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    switch(btn.ButtonID)
    {
        // End:0x71
        case 0:
            page_Main.SetPage(23, false);
            // End:0x300
            break;
        // End:0x8A
        case 1:
            page_Main.SetPage(20, false);
            // End:0x300
            break;
        // End:0xA4
        case 2:
            page_Main.SetPage(21, false);
            // End:0x300
            break;
        // End:0xBE
        case 3:
            page_Main.SetPage(22, false);
            // End:0x300
            break;
        // End:0xD8
        case 4:
            page_Main.SetPage(18, false);
            // End:0x300
            break;
        // End:0x1F1
        case 5:
            // End:0x107
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, false);                
            }
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x300
            break;
        // End:0x1F9
        case 6:
            // End:0x300
            break;
        // End:0x201
        case 7:
            // End:0x300
            break;
        // End:0x218
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x300
            break;
        // End:0x263
        case 9:
            Controller.LogMenuStack();
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x300
            break;
        // End:0x2FD
        case 10:
            // End:0x2FA
            if(bGoBack == false)
            {
                Log(("page_Main.TcpChannel.sfReqLeaveChannel(" $ string(MM.kChannelID)) $ ")");
                bGoBack = true;
                page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
                Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 7);
            }
            // End:0x300
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function bool TopButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local int valueIndex;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    valueIndex = 0;
    switch(btn.ButtonID)
    {
        // End:0x2E
        case 0:
            // End:0x88
            break;
        // End:0x35
        case 1:
            // End:0x88
            break;
        // End:0x3D
        case 2:
            // End:0x88
            break;
        // End:0x4D
        case 3:
            valueIndex = 2;
            // End:0x88
            break;
        // End:0x5D
        case 4:
            valueIndex = 2;
            // End:0x88
            break;
        // End:0x6D
        case 5:
            valueIndex = 3;
            // End:0x88
            break;
        // End:0x75
        case 6:
            // End:0x88
            break;
        // End:0x7D
        case 7:
            // End:0x88
            break;
        // End:0x85
        case 8:
            // End:0x88
            break;
        // End:0xFFFF
        default:
            break;
    }
    ACLLobby.SortBySelectLocation(btn.ButtonID, valueIndex, btn.Extra > 0);
    ACLLobbyEnterable.SortBySelectLocation(btn.ButtonID, valueIndex, btn.Extra > 0);
    // End:0x115
    if(btn.Extra > 0)
    {
        btn.Extra = 0;        
    }
    else
    {
        btn.Extra = 1;
    }
    return true;
    //return;    
}

function BTWindowCreateRoom GetWindowCreateRoom()
{
    return BTWindowCreateRoom(Controller.TopPage());
    //return;    
}

function bool ClanMenu_ButtonLookingForClan_OnClick(GUIComponent Sender)
{
    local bool bCurLookingFor;

    Log("[BTPageLobby::ClanMenu_ButtonLookingForClan_OnClick]");
    bCurLookingFor = MM.kClanLookingFor;
    // End:0x74
    if(bCurLookingFor)
    {
        page_Main.TcpChannel.sfReqSetLookForClan(0);        
    }
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
    //return;    
}

function bool ClanMenu_ButtonFindClan_OnClick(GUIComponent Sender)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageLobby::ClanMenu_ButtonFindClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowFindClanHK");
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    BTWindow.TcpChannel = page_Main.TcpChannel;
    BTWindow.__OnOK__Delegate = BTWindowFindClanHK_OnRequestJoin;
    BTWindow.ButtonInfo.__OnClick__Delegate = BTWindowFindClanHK_OnInfo;
    return true;
    //return;    
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    local string Clanname;

    Log("[BTPageLobby::BTWindowFindClanHK_OnRequestJoin]");
    Clanname = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xF3
    if((Clanname != "none") && Clanname != "")
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
        BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(Clanname);
        BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
    }
    //return;    
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string Clanname;

    Log("[BTPageLobby::BTWindowFindClanHK_OnInfo]");
    Clanname = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8B
    if((Clanname != "none") && Clanname != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(Clanname);
    }
    //return;    
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageLobby::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
    //return;    
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageLobby::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xDA
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;        
    }
    else
    {
        Controller.CloseMenu(false);
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 62);
    }
    return true;
    //return;    
}

function bool BTWindowCreateClanHK_OnOK(GUIComponent Sender)
{
    local string Clanname, URL, Intro, Keyword;
    local int Region;

    Log("[BTPageLobby::BTWindowCreateClanHK_OnOK]");
    // End:0x158
    if(BTWindowCreateClanHK(Controller.TopPage()).CheckDup())
    {
        Clanname = BTWindowCreateClanHK(Controller.TopPage()).Clanname.TextStr;
        Intro = BTWindowCreateClanHK(Controller.TopPage()).ClanIntroduction.TextStr;
        Keyword = BTWindowCreateClanHK(Controller.TopPage()).ClanKeyword.TextStr;
        Region = BTWindowCreateClanHK(Controller.TopPage()).RadioGroup.GetSelectIndex();
        page_Main.SaveClanName = Clanname;
        page_Main.TcpChannel.sfReqCreateClan(Clanname, Clanname, Intro, Keyword, byte(Region));
        Controller.CloseMenu(false);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
    //return;    
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageLobby::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool BTWindowCreateRoom_OnOK(GUIComponent Sender)
{
    local string filter;
    local int Capacity, TimeLimit;
    local string Mode;
    local GameModeInfo gmi;
    local GameRoomInfo NetRoomInfo;
    local export editinline BTWindowCreateRoom WindowCreateRoom;

    Log("[BTPageLobby::BTWindowCreateRoom_OnOK]");
    WindowCreateRoom = GetWindowCreateRoom();
    // End:0x57
    if(MM.kGM || WindowCreateRoom == none)
    {
        return true;
    }
    // End:0x87
    if(WindowCreateRoom.GetGameModeIndex() == 8)
    {
        StartTutorial(WindowCreateRoom.GetMapName());
        return true;        
    }
    else
    {
        filter = WindowCreateRoom.EditRoomName.GetText();
        Controller.ViewportOwner.Actor.Level.GameMgr.FilterBadWords(filter);
        // End:0x117
        if(filter != WindowCreateRoom.EditRoomName.GetText())
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 103);
            return true;
        }
        Capacity = int(WindowCreateRoom.ComboCapacity.ComboBox.GetText());
        TimeLimit = int(Class'Engine.wGameSettings'.static.GetDefaultTimeLimit_ModeNum(WindowCreateRoom.GetGameModeIndex(), WindowCreateRoom.ComboScore.ComboBox.TextStr));
        NetRoomInfo.RoomName = WindowCreateRoom.EditRoomName.GetText();
        // End:0x1D3
        if(NetRoomInfo.RoomName == "")
        {
            NetRoomInfo.RoomName = WindowCreateRoom.DefaultRandomRoomName;
        }
        NetRoomInfo.TeamCnt = 2;
        NetRoomInfo.MapName = WindowCreateRoom.GetMapName();
        NetRoomInfo.MapNum = byte(WindowCreateRoom.GetSelectedMapID());
        NetRoomInfo.GameClass = WindowCreateRoom.GetGameModeClass();
        NetRoomInfo.GameModeNum = byte(WindowCreateRoom.GetGameModeIndex());
        NetRoomInfo.WeaponLimit = byte(WindowCreateRoom.GetWeaponLimit());
        NetRoomInfo.MaxUserCnt = byte(Capacity);
        // End:0x396
        if(Class'Engine.wGameSettings'.static.IsBotModeIndex(int(NetRoomInfo.GameModeNum)))
        {
            NetRoomInfo.PlayWithBots = 1;
            gmi = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(NetRoomInfo.GameModeNum));
            NetRoomInfo.UserTeamNum = byte(WindowCreateRoom.GetBotModeUserTeam());
            NetRoomInfo.BotModeDifficulty = byte(gmi.BotDifficulty_Default);
            // End:0x368
            if((int(NetRoomInfo.GameModeNum) == Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeath()) || int(NetRoomInfo.GameModeNum) == Class'Engine.wGameSettings'.static.GetModeIndex_BotDomination())
            {
                NetRoomInfo.MaxAFUserAndBotNum = NetRoomInfo.MaxUserCnt;
                NetRoomInfo.MaxRSAUserAndBotNum = NetRoomInfo.MaxUserCnt;                
            }
            else
            {
                NetRoomInfo.MaxAFUserAndBotNum = byte(gmi.BotNum0_Default);
                NetRoomInfo.MaxRSAUserAndBotNum = byte(gmi.BotNum1_Default);
            }
        }
        NetRoomInfo.IsHardCore = 0;
        NetRoomInfo.GameRound = int(WindowCreateRoom.ComboScore.ComboBox.TextStr);
        NetRoomInfo.GameMinute = TimeLimit;
        NetRoomInfo.Password = WindowCreateRoom.EditPassword.GetText();
        SaveRoomPassword = WindowCreateRoom.EditPassword.GetText();
        MM.RI_Clear();
        MM.kGame_RoomName = WindowCreateRoom.EditRoomName.GetText();
        MM.kGame_bOwner = true;
        MM.kGame_Password = WindowCreateRoom.EditPassword.GetText();
        MM.kGame_MapNum = WindowCreateRoom.GetSelectedMapID();
        MM.kGame_MapName = WindowCreateRoom.GetMapName();
        MM.kGame_GameMode = WindowCreateRoom.GetGameModeIndex();
        MM.kGame_UserCount = Capacity;
        MM.kGame_GameTime = TimeLimit;
        MM.kGame_GameRound = int(WindowCreateRoom.ComboScore.ComboBox.TextStr);
        MM.kGame_WeaponLimit = WindowCreateRoom.GetWeaponLimit();
        NetRoomInfo.BombHold = 1;
        page_Main.TcpChannel.sfReqCreateGameRoom(NetRoomInfo);
        Controller.TopPage().FadeOut(false, true);
    }
    return true;
    //return;    
}

function bool WindowInviteFriend_OnOK(GUIComponent Sender)
{
    local bool bTemp;
    local string imsg;
    local export editinline BTWindowInviteFriendHK Window;

    Log("[BTPageLobby::WindowInviteFriend_OnOK]");
    Window = BTWindowInviteFriendHK(Controller.TopPage());
    imsg = Window.MultiLineEditMsg.GetText();
    bTemp = page_Main.TcpChannel.sfReqSendFriendInvite(Window.friendUID, Window.FriendName, imsg);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool WindowRequestFriend_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestFriendHK Window;

    Log("[BTPageLobby::WindowRequestFriend_OnOK]");
    Window = BTWindowRequestFriendHK(Controller.TopPage());
    page_Main.TcpChannel.sfReqConfirmFriendInvite(Window.friendUID, Window.FriendName, 0);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool WindowRequestFriend_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestFriendHK Window;

    Log("[BTPageLobby::WindowRequestFriend_OnCancel]");
    Window = BTWindowRequestFriendHK(Controller.TopPage());
    page_Main.TcpChannel.sfReqConfirmFriendInvite(Window.friendUID, Window.FriendName, 1);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool BTWindowInviteClan_OnOK(GUIComponent Sender)
{
    Log("[BTPageLobby::BTWindowInviteClan_OnOK]");
    page_Main.TcpChannel.sfReqInviteClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool QuickEnter_OnOK()
{
    local int MapIndex, GameMode, WRestrict;

    MapIndex = Class'GUIWarfareControls.BTWindowQuickEnterRoomHK'.default.Map - 1;
    GameMode = Class'GUIWarfareControls.BTWindowQuickEnterRoomHK'.default.GameMode - 1;
    WRestrict = Class'GUIWarfareControls.BTWindowQuickEnterRoomHK'.default.WeaponRestriction - 1;
    // End:0x7A
    if(!ProcessQuickEnter(MapIndex, GameMode, WRestrict, -1))
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 151);
    }
    return true;
    //return;    
}

function bool ProcessQuickEnter(int MapIndex, int GameMode, int WRestrict, int botLevel)
{
    local int i;
    local array<wMapInfo> MapInfos;
    local array<int> RoomList;

    MapInfos = MatchMaker.MapSettings.GetAllMapInfos();
    PlayerOwner().dblog("WRestrict=" $ string(WRestrict));
    i = 0;
    J0x47:

    // End:0x201 [Loop If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0x1F7
        if(((((((MapIndex < 0) || ACLLobby.ACLRowList[i].DataPerColumn[2].tempValue == MapInfos[MapIndex].MapID) && (GameMode < 0) || ACLLobby.ACLRowList[i].DataPerColumn[5].tempValue == GameMode) && (WRestrict < 0) || ACLLobby.ACLRowList[i].DataPerColumn[6].IntValue == WRestrict) && (botLevel < 0) || ACLLobby.ACLRowList[i].DataPerColumn[10].tempValue == botLevel) && float(ACLLobby.ACLRowList[i].DataPerColumn[7].IntValue) < ACLLobby.ACLRowList[i].DataPerColumn[7].floatValue) && ACLLobby.ACLRowList[i].DataPerColumn[2].IntValue == 0)
        {
            RoomList[RoomList.Length] = i;
        }
        ++i;
        // [Loop Continue]
        goto J0x47;
    }
    // End:0x2A8
    if(RoomList.Length != 0)
    {
        i = 1;
        J0x214:

        // End:0x296 [Loop If]
        if(i < RoomList.Length)
        {
            // End:0x28C
            if(ACLLobby.ACLRowList[RoomList[0]].DataPerColumn[1].IntValue > ACLLobby.ACLRowList[RoomList[i]].DataPerColumn[1].IntValue)
            {
                RoomList[0] = RoomList[i];
            }
            ++i;
            // [Loop Continue]
            goto J0x214;
        }
        MoveToRoom(RoomList[0]);
        return true;        
    }
    else
    {
        return false;
    }
    //return;    
}

function OnPopupChannelCheck(BTACLMessengerChannelHK acl, BTCMMessengerChannelHK cm)
{
    local int i;
    local string TargetUser;

    TargetUser = acl.GetUserName(acl.selectIndex);
    cm.ChangeStateByIndex(0, 0);
    i = 1;
    J0x3C:

    // End:0x68 [Loop If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x3C;
    }
    // End:0xB8
    if(TargetUser == MM.kUserName)
    {
        // End:0xB6
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
        }
        return;
    }
    // End:0xE5
    if(TPMessenger.FindFriendFromUserName(TargetUser) < 0)
    {
        cm.ChangeStateByIndex(4, 0);
    }
    // End:0x146
    if(acl.GetClanName(acl.selectIndex) != "")
    {
        cm.ChangeStateByIndex(1, 0);
        // End:0x143
        if(MM.IsClanMember() == false)
        {
            cm.ChangeStateByIndex(6, 0);
        }        
    }
    else
    {
        // End:0x196
        if(MM.IsClanMember() && MM.IsClanGrade(1) || MM.IsClanGrade(2))
        {
            cm.ChangeStateByIndex(5, 0);
        }
    }
    cm.ChangeStateByIndex(3, 0);
    cm.ChangeStateByIndex(7, 0);
    //return;    
}

function OnPopupChannel(int ContextMenuIndex, BTACLMessengerChannelHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x336
            break;
        // End:0x7F
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x336
            break;
        // End:0x87
        case 2:
            // End:0x336
            break;
        // End:0xE0
        case 3:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x336
            break;
        // End:0x19D
        case 4:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteFriendHK");
            BTWindowInviteFriendHK(Controller.TopPage()).SetData(acl.GetUserName(acl.selectIndex), acl.GetUserID(acl.selectIndex));
            BTWindowInviteFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowInviteFriend_OnOK;
            // End:0x336
            break;
        // End:0x23B
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x336
            break;
        // End:0x2F6
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x336
            break;
        // End:0x333
        case 7:
            page_Main.TcpChannel.sfReqAddBlockUserList(acl.GetUserName(acl.selectIndex));
            // End:0x336
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OnPopupFriendCheck(BTACLMessengerFriendHK acl, BTCMMessengerFriendHK cm)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x33 [Loop If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x162
    if(acl.GetCurPos(acl.selectIndex) != 0)
    {
        cm.ChangeStateByIndex(0, 0);
        // End:0xC9
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
            // End:0xC6
            if(MM.IsClanMember() == false)
            {
                cm.ChangeStateByIndex(6, 0);
            }            
        }
        else
        {
            // End:0x119
            if(MM.IsClanMember() && MM.IsClanGrade(1) || MM.IsClanGrade(2))
            {
                cm.ChangeStateByIndex(5, 0);
            }
        }
        cm.ChangeStateByIndex(2, 0);
        // End:0x162
        if(acl.GetCurPosInt(acl.selectIndex) >= 1)
        {
            cm.ChangeStateByIndex(3, 0);
        }
    }
    cm.ChangeStateByIndex(7, 0);
    //return;    
}

function OnPopupFriend(int ContextMenuIndex, BTACLMessengerFriendHK acl)
{
    local array<string> friendlist;

    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x35B
            break;
        // End:0x7F
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x35B
            break;
        // End:0xD8
        case 2:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x35B
            break;
        // End:0x1A5
        case 3:
            page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            // End:0x35B
            break;
        // End:0x1AD
        case 4:
            // End:0x35B
            break;
        // End:0x24B
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x35B
            break;
        // End:0x306
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x35B
            break;
        // End:0x358
        case 7:
            friendlist.Length = 1;
            friendlist[0] = acl.GetUserName(acl.selectIndex);
            page_Main.TcpChannel.sfReqDeleteFriend(friendlist);
            // End:0x35B
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OnPopupClanCheck(BTACLMessengerClanHK acl, BTCMMessengerClanHK cm)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x33 [Loop If]
    if(i < 5)
    {
        cm.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x55
    if(acl.IsOffLine(acl.selectIndex))
    {
        return;
    }
    cm.ChangeStateByIndex(0, 0);
    cm.ChangeStateByIndex(1, 0);
    cm.ChangeStateByIndex(2, 0);
    // End:0xC2
    if(acl.GetCurPosInt(acl.selectIndex) >= 1)
    {
        cm.ChangeStateByIndex(3, 0);
    }
    //return;    
}

function OnPopupClan(int ContextMenuIndex, BTACLMessengerClanHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x1A1
            break;
        // End:0x70
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(MM.kClanName);
            // End:0x1A1
            break;
        // End:0xC9
        case 2:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x1A1
            break;
        // End:0x196
        case 3:
            page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            // End:0x1A1
            break;
        // End:0x19E
        case 4:
            // End:0x1A1
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OnPopupBanCheck(BTACLMessengerBanHK acl, BTCMMessengerBanHK cm)
{
    cm.ChangeStateByIndex(0, 0);
    //return;    
}

function OnPopupBan(int ContextMenuIndex, BTACLMessengerBanHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqRemoveBlockUserList(acl.GetUserName(acl.selectIndex));
            // End:0x46
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function OnPopupPCBangCheck(BTACLMessengerPCBangHK acl, BTCMMessengerPCBangHK cm)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x33 [Loop If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x162
    if(acl.GetCurPos(acl.selectIndex) != 0)
    {
        cm.ChangeStateByIndex(0, 0);
        // End:0xC9
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
            // End:0xC6
            if(MM.IsClanMember() == false)
            {
                cm.ChangeStateByIndex(6, 0);
            }            
        }
        else
        {
            // End:0x119
            if(MM.IsClanMember() && MM.IsClanGrade(1) || MM.IsClanGrade(2))
            {
                cm.ChangeStateByIndex(5, 0);
            }
        }
        cm.ChangeStateByIndex(2, 0);
        // End:0x162
        if(acl.GetCurPosInt(acl.selectIndex) >= 1)
        {
            cm.ChangeStateByIndex(3, 0);
        }
    }
    cm.ChangeStateByIndex(7, 0);
    //return;    
}

function OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl)
{
    local array<string> friendlist;

    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x309
            break;
        // End:0x7F
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x309
            break;
        // End:0xD8
        case 2:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x309
            break;
        // End:0x1A5
        case 3:
            page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            // End:0x309
            break;
        // End:0x1AD
        case 4:
            // End:0x309
            break;
        // End:0x24B
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x309
            break;
        // End:0x306
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x309
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool OnBottomButton_Click(GUIComponent Sender)
{
    local BTAutoColumnListDataHK Data;
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local export editinline BTWindowHK BTWindow;

    Log("[BTPageLobby::OnBottomButton_Click]");
    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x65
        case 0:
            OpenBTWindowCreateRoom();
            GetWindowCreateRoom().SetGameModeByExtraDataIndex(0);
            // End:0x189
            break;
        // End:0x72
        case 1:
            QuickEnter_OnOK();
            // End:0x189
            break;
        // End:0xD0
        case 2:
            Controller.OpenMenu("GUIWarfareControls.BTWindowQuickEnterRoomHK");
            BTWindow = BTWindowHK(Controller.TopPage());
            // End:0x189
            break;
        // End:0x10C
        case 3:
            // End:0xF5
            if(bAllRoomList)
            {
                MoveToRoom(ACLLobby.LastSelectedIndexHistory);                
            }
            else
            {
                MoveToRoom(ACLLobbyEnterable.LastSelectedIndexHistory);
            }
            // End:0x189
            break;
        // End:0x186
        case 4:
            bAllRoomList = !bAllRoomList;
            ACLLobby.SetVisibility(bAllRoomList);
            ACLLobbyEnterable.SetVisibility(!bAllRoomList);
            // End:0x16F
            if(bAllRoomList)
            {
                btn.Caption = strListBottom[4];                
            }
            else
            {
                btn.Caption = strAllRoomList;
            }
            // End:0x189
            break;
        // End:0xFFFF
        default:
            break;
    }
    return true;
    //return;    
}

function OpenBTWindowCreateRoom()
{
    Controller.OpenMenu("GUIWarfareControls.BTWindowCreateRoom");
    GetWindowCreateRoom().__OnOK__Delegate = BTWindowCreateRoom_OnOK;
    GetWindowCreateRoom().SetRandomRoomName();
    //return;    
}

function bool ButtonFriendlyClanWar_OnClick(GUIComponent Sender)
{
    Log("[BTPageLobby::ButtonFriendlyClanWar_OnClick]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowCreateRoom");
    GetWindowCreateRoom().__OnOK__Delegate = BTWindowCreateRoom_OnOK;
    GetWindowCreateRoom().SetTitleCaption(strMakeClanWarRoom);
    GetWindowCreateRoom().SetRandomRoomName();
    return true;
    //return;    
}

function bool ButtonRegularClanWar_OnClick(GUIComponent Sender)
{
    Log("[BTPageLobby::ButtonRegularClanWar_OnClick]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowCreateRoom");
    GetWindowCreateRoom().__OnOK__Delegate = BTWindowCreateRoom_OnOK;
    GetWindowCreateRoom().SetTitleCaption(strMakeClanWarRoom);
    GetWindowCreateRoom().SetRandomRoomName();
    return true;
    //return;    
}

function bool rfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    Log("[BTPageLobby::rfAckClanMatch_GetReady]");
    // End:0x50
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kClanMatch_InReadyRoom = true;
    MM.kClanMatch_ReadyRoomID = RoomIndex;
    page_Main.EndAutoMove();
    page_Main.SetPage(26, false);
    return true;
    //return;    
}

function bool rfAckClanMatch_Join(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckClanMatch_Join]");
    // End:0x4C
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kClanMatch_InReadyRoom = true;
    page_Main.EndAutoMove();
    page_Main.SetPage(26, false);
    return true;
    //return;    
}

function bool rfAckEnterRoom_AfterCreateRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string Clanname, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageLobby::rfAckEnterRoom_AfterCreateRoom]");
    // End:0x182
    if(Result == 0)
    {
        // End:0x68
        if(MM.kUID == OwnerID)
        {
            MM.bIsOwner = true;            
        }
        else
        {
            MM.bIsOwner = false;
        }
        MM.My_iRoom = GameNum;
        page_Main.iRoomNum = GameNum;
        MM.My_iTeam = TeamNum;
        MM.bShowMessageHostUnsuitableness = true;
        MM.szRoomPassword = self.SaveRoomPassword;
        Controller.PopPage();
        page_Main.ResetChatLog();
        page_Main.GameRoomID = GameNum;
        // End:0x13D
        if(MM.kUID == OwnerID)
        {
            MM.kGame_bOwner = true;            
        }
        else
        {
            MM.kGame_bOwner = false;
        }
        MM.PI_EnterRoom(GameNum, TeamNum);
        UnInitializeDelegate();
        page_Main.SetPage(10, true);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckEnterRoom_AfterJoinRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string Clanname, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageLobby::rfAckEnterRoom_AfterJoinRoom]");
    // End:0x16F
    if(Result == 0)
    {
        // End:0x66
        if(MM.kUID == OwnerID)
        {
            MM.bIsOwner = true;            
        }
        else
        {
            MM.bIsOwner = false;
        }
        MM.My_iRoom = GameNum;
        page_Main.iRoomNum = GameNum;
        MM.My_iTeam = TeamNum;
        MM.szRoomPassword = self.SaveRoomPassword;
        Controller.PopPage();
        page_Main.ResetChatLog();
        page_Main.GameRoomID = GameNum;
        // End:0x12A
        if(MM.kUID == OwnerID)
        {
            MM.kGame_bOwner = true;            
        }
        else
        {
            MM.kGame_bOwner = false;
        }
        MM.PI_EnterRoom(GameNum, TeamNum);
        UnInitializeDelegate();
        page_Main.SetPage(10, true);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool BTWindowPasswordHK_OnOK(GUIComponent Sender)
{
    Log("[BTPageLobby::BTWindowPasswordHK_OnOK]");
    SaveRoomPassword = BTWindowPasswordHK(Controller.TopPage()).EditPass.TextStr;
    page_Main.EndAutoMove();
    Class'GUIWarfareControls.BTWindowStateHK'.static.ShowWindow(Controller, string(MM.kRoomID) $ strEnterRoomMessage);
    page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
    __delegateAckEnterRoom__Delegate = rfAckEnterRoom_AfterJoinRoom;
    //return;    
}

function bool BTWindowPasswordHK_OnCancel(GUIComponent Sender)
{
    MM.PI_LeavelRoom();
    page_Main.EndAutoMove();
    return true;
    //return;    
}

function bool OnLobby_DblClick(GUIComponent Sender)
{
    Log("[BTPageLobby::OnLobby_DblClick]");
    // End:0x43
    if(bAllRoomList)
    {
        MoveToRoom(ACLLobby.LastSelectedIndex);        
    }
    else
    {
        MoveToRoom(ACLLobbyEnterable.LastSelectedIndex);
    }
    return true;
    //return;    
}

function bool AutoMoveToRoom(int RoomNum, optional string Password)
{
    local export editinline BTWindowPasswordHK winPass;
    local BTAutoColumnListDataHK Data;
    local int RoomIndex;

    Log("[BTPageLobby::AutoMoveToRoom]");
    Log(("[BTPageLobby::AutoMoveToRoom]" $ " RoomNum=") $ string(RoomNum));
    page_Main.iRoomNum = RoomNum;
    MM.kRoomID = RoomNum;
    // End:0x9A
    if(Password != "")
    {
        SaveRoomPassword = Password;        
    }
    else
    {
        SaveRoomPassword = "";
    }
    RoomIndex = ACLLobby.FindRoomNo(RoomNum);
    // End:0x18C
    if(((Password == "") && RoomIndex >= 0) && ACLLobby.ACLRowList[RoomIndex].DataPerColumn[2].IntValue == 1)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowPasswordHK");
        winPass = BTWindowPasswordHK(Controller.TopPage());
        winPass.SetData();
        winPass.__OnOK__Delegate = BTWindowPasswordHK_OnOK;
        winPass.__OnCancel__Delegate = BTWindowPasswordHK_OnCancel;        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowStateHK'.static.ShowWindow(Controller, string(MM.kRoomID) $ strEnterRoomMessage);
        page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
        __delegateAckEnterRoom__Delegate = rfAckEnterRoom_AfterJoinRoom;
    }
    return true;
    //return;    
}

function bool AutoMoveToClanReadyRoom(int RoomNum, optional string Password)
{
    Log("[BTPageLobby::AutoMoveToClanReadyRoom]");
    MM.kClanMatch_InReadyRoom = true;
    MM.kClanMatch_ReadyRoomID = RoomNum;
    page_Main.TcpChannel.sfReqClanMatch_Join(RoomNum);
    return true;
    //return;    
}

function bool AutoMoveReturnClanReadyRoom(int RoomNum, optional string Password)
{
    Log("[BTPageLobby::AutoMoveReturnClanReadyRoom]");
    MM.kClanMatch_InReadyRoom = true;
    MM.kClanMatch_ReadyRoomID = RoomNum;
    page_Main.EndAutoMove();
    page_Main.SetPage(26, false);
    return true;
    //return;    
}

function bool MoveToRoom(int Index)
{
    local BTAutoColumnListDataHK Data;

    Log("[BTPageLobby::MoveToRoom]");
    // End:0x2A
    if(Index < 0)
    {
        return true;
    }
    // End:0x50
    if(bAllRoomList)
    {
        Data = ACLLobby.GetRowByIndex(Index);        
    }
    else
    {
        Data = ACLLobbyEnterable.GetRowByIndex(Index);
    }
    // End:0x77
    if(Data == none)
    {
        return true;
    }
    Log(((("[BTPageLobby::MoveToRoom] RoomNum=(" $ string(Data.DataPerColumn[1].IntValue)) $ ", ") $ string(Data.DataPerColumn[11].IntValue)) $ ")");
    // End:0x26F
    if(Data.DataPerColumn[11].IntValue == 0)
    {
        page_Main.iRoomNum = Data.DataPerColumn[1].IntValue;
        MM.kRoomID = Data.DataPerColumn[1].IntValue;
        // End:0x210
        if((MM.kGM == false) && Data.DataPerColumn[2].IntValue == 1)
        {
            Controller.OpenMenu("GUIWarfareControls.BTWindowPasswordHK");
            BTWindowPasswordHK(Controller.TopPage()).SetData();
            BTWindowPasswordHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPasswordHK_OnOK;
            BTWindowPasswordHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowPasswordHK_OnCancel;            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowStateHK'.static.ShowWindow(Controller, string(MM.kRoomID) $ strEnterRoomMessage);
            page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
            __delegateAckEnterRoom__Delegate = rfAckEnterRoom_AfterJoinRoom;
        }        
    }
    else
    {
        // End:0x2CE
        if((MM.kGM == false) && (MM.kClanName == "") || MM.kClanName == "none")
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 187);
            return true;
        }
        MM.kClanMatch_ReadyRoomID = Data.DataPerColumn[11].IntValue;
        Log(("page_Main.TcpChannel.sfReqClanMatch_Join(" $ string(MM.kClanMatch_ReadyRoomID)) $ ")");
        page_Main.TcpChannel.sfReqClanMatch_Join(MM.kClanMatch_ReadyRoomID);
    }
    return true;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local Color orange;
    local Image img, onImg, cliImg;

    orange = Class'Engine.Canvas'.static.MakeColor(byte(255), 140, 63, byte(255));
    super.InitComponent(MyController, myOwner);
    BGRoomList.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1;
    BGImageAD2.BackgroundImage = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.panel_1;
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MyController.ResetFocus();
    ACLLobby.MultiColumnList.__OnDblClick__Delegate = OnLobby_DblClick;
    ACLLobbyEnterable.MultiColumnList.__OnDblClick__Delegate = OnLobby_DblClick;
    img = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_input_x;
    ListTopChannelName = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    ListTopChannelName.bUseAWinPos = true;
    ListTopChannelName.AWinPos = ListTopChannelNamePosition;
    ListTopChannelName.BackgroundImage = img;
    ListTopChannelName.RenderWeight = 0.2000000;
    ListTopChannelName.Caption = "";
    ListTopChannelName.CaptionDrawType = 4;
    ListTopChannelName.InitComponent(Controller, self);
    AppendComponent(ListTopChannelName);
    ListTopChannelName.SetFontSizeAll(11);
    img = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.img_list_divid;
    i = 0;
    J0x1D6:

    // End:0x338 [Loop If]
    if(i < 9)
    {
        ListTopImage[i] = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
        ListTopImage[i].bUseAWinPos = true;
        ListTopImage[i].AWinPos.X1 = ListTopButtonPosition[i].X2 - float(2);
        ListTopImage[i].AWinPos.Y1 = ListTopButtonPosition[i].Y1 + float(5);
        ListTopImage[i].AWinPos.X2 = ListTopButtonPosition[i].X2 + float(2);
        ListTopImage[i].AWinPos.Y2 = ListTopButtonPosition[i].Y2 - float(5);
        ListTopImage[i].BackgroundImage = img;
        ListTopImage[i].RenderWeight = 0.1900000;
        ListTopImage[i].InitComponent(Controller, self);
        AppendComponent(ListTopImage[i]);
        i++;
        // [Loop Continue]
        goto J0x1D6;
    }
    img = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_n;
    ListTopImage[9] = new Class'GUIWarfareControls.BTOwnerDrawImageHK';
    ListTopImage[9].bUseAWinPos = true;
    ListTopImage[9].AWinPos.X1 = ListTopButtonPosition[0].X1;
    ListTopImage[9].AWinPos.Y1 = ListTopButtonPosition[0].Y1;
    ListTopImage[9].AWinPos.X2 = ListTopButtonPosition[9].X2;
    ListTopImage[9].AWinPos.Y2 = ListTopButtonPosition[9].Y2;
    ListTopImage[9].BackgroundImage = img;
    ListTopImage[9].RenderWeight = 0.1000000;
    ListTopImage[9].InitComponent(Controller, self);
    AppendComponent(ListTopImage[9]);
    onImg = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_on;
    cliImg = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_cli;
    i = 0;
    J0x483:

    // End:0x614 [Loop If]
    if(i < 10)
    {
        ListTopButton[i] = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
        ListTopButton[i].bUseAWinPos = true;
        ListTopButton[i].AWinPos = ListTopButtonPosition[i];
        ListTopButton[i].buttonImage[1] = onImg;
        ListTopButton[i].buttonImage[3] = cliImg;
        ListTopButton[i].RenderWeight = 0.2000000;
        ListTopButton[i].SetDefaultListTopButtonFontColor();
        ListTopButton[i].Caption = strListTop[i];
        ListTopButton[i].CaptionDrawType = 4;
        ListTopButton[i].ButtonID = i;
        ListTopButton[i].Extra = 0;
        ListTopButton[i].__OnClick__Delegate = TopButton_OnClick;
        ListTopButton[i].CaptionPadding[3] = 2;
        ListTopButton[i].InitComponent(Controller, self);
        AppendComponent(ListTopButton[i]);
        i++;
        // [Loop Continue]
        goto J0x483;
    }
    ListTopButton[9].CaptionPadding[2] = 5;
    img = Class'Engine.BTCustomDrawHK'.static.MakeImage(64, 32, 15, none);
    i = 0;
    J0x64E:

    // End:0x7A2 [Loop If]
    if(i < 5)
    {
        ListBottomButton[i] = new Class'GUIWarfareControls.BTOwnerDrawCaptionButtonHK';
        ListBottomButton[i].bUseAWinPos = true;
        ListBottomButton[i].AWinPos = ListBottomButtonPosition[i];
        ListBottomButton[i].SetDefaultButtonImage();
        ListBottomButton[i].SetDefaultBigButtonFontColor();
        ListBottomButton[i].SetFontSizeAll(12);
        ListBottomButton[i].RenderWeight = 0.2000000;
        ListBottomButton[i].Caption = strListBottom[i];
        ListBottomButton[i].CaptionDrawType = 4;
        ListBottomButton[i].ButtonID = i;
        ListBottomButton[i].__OnClick__Delegate = OnBottomButton_Click;
        ListBottomButton[i].InitComponent(Controller, self);
        AppendComponent(ListBottomButton[i]);
        i++;
        // [Loop Continue]
        goto J0x64E;
    }
    ButtonRegularClanWar = NewButtonComponent(fbButtonRegularClanWar);
    ButtonRegularClanWar.SetDefaultButtonImage();
    ButtonRegularClanWar.SetFontSizeAll(12);
    ButtonRegularClanWar.CaptionDrawType = 4;
    ButtonRegularClanWar.Caption = strButtonRegularClanWar;
    ButtonRegularClanWar.DisableMe();
    ButtonRegularClanWar.SetVisibility(false);
    ButtonRegularClanWar.__OnClick__Delegate = ButtonRegularClanWar_OnClick;
    ButtonFriendlyClanWar = NewButtonComponent(fbButtonFriendlyClanWar);
    ButtonFriendlyClanWar.SetDefaultButtonImage();
    ButtonFriendlyClanWar.SetFontSizeAll(12);
    ButtonFriendlyClanWar.CaptionDrawType = 4;
    ButtonFriendlyClanWar.Caption = strMakeClanWarRoom;
    ButtonFriendlyClanWar.DisableMe();
    ButtonFriendlyClanWar.SetVisibility(false);
    ButtonFriendlyClanWar.__OnClick__Delegate = ButtonFriendlyClanWar_OnClick;
    LabelAD = NewLabelComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(773.0000000, 89.0000000, 1012.0000000, 258.0000000), Class'GUIWarfareControls.BTUIResourcePoolHK'.default.ad2);
    // End:0x90B
    if(MM != none)
    {
        MM.SendPingToChannelServer();
    }
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 240.0000000;
    LabelRoomName.ClipArea.X2 = 280.0000000;
    LabelRoomName.ClipArea.Y2 = 288.0000000;
    i = 0;
    J0x976:

    // End:0x9BC [Loop If]
    if(i < TPMessenger.ButtonMsg.Length)
    {
        TPMessenger.ButtonMsg[i].__OnClick__Delegate = TPMessenger_ButtonMsg_OnClick;
        i++;
        // [Loop Continue]
        goto J0x976;
    }
    ACLLobby.__OnHitBottom__Delegate = ACLLobby_OnHitBottom;
    TPMessenger.ACLMsg[0].__OnHitBottom__Delegate = TPMessenger_ACLMsg0_OnHitBottom;
    TestButton = BTNuclearButtonHK(NewComponent(new Class'GUIWarfare_Decompressed.BTNuclearButtonHK', fbTestButton));
    TestButton.__OnCoreClick__Delegate = TestButton_OnClick;
    TestButton.SetVisibility(false);
    //return;    
}

function bool TestButton_OnClick(GUIComponent Sender)
{
    return true;
    //return;    
}

function ACLLobby_OnHitBottom(int Top, int Count, int itemperpage)
{
    //return;    
}

function TPMessenger_ACLMsg0_OnHitBottom(int Top, int Count, int itemperpage)
{
    TPMessenger.ACLMsg[0].MultiColumnList.MyScrollBar.MyGripButton.MenuState = 0;
    // End:0xA5
    if((TPMessenger_ACLMsg0_OnHitBottom_LastTime + 0.1000000) < PlayerOwner().Level.TimeSeconds)
    {
        page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, Top, 30);
        TPMessenger_ACLMsg0_OnHitBottom_LastTime = PlayerOwner().Level.TimeSeconds;
    }
    //return;    
}

function bool TPMessenger_ButtonMsg_OnClick(GUIComponent Sender)
{
    local int Count, StartTop;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x18A
        case 0:
            Count = 6 * 3;
            StartTop = TPMessenger.ACLMsg[0].MultiColumnList.Top - 6;
            // End:0x7A
            if(StartTop < 0)
            {
                Count += StartTop;
                StartTop = 0;
            }
            // End:0xE6
            if((TPMessenger.ACLMsg[0].MultiColumnList.Top + (6 * 2)) > TotalChannelUserCount)
            {
                Count += (TotalChannelUserCount - (TPMessenger.ACLMsg[0].MultiColumnList.Top + (6 * 2)));
            }
            // End:0x143
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
            {
                TPChat.AddChatHistory(2, "RefreshTime", Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
            }
            // End:0x157
            if(Count < 6)
            {
                Count = 6;
            }
            page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, StartTop, Count);
            // End:0x239
            break;
        // End:0x1A9
        case 1:
            page_Main.TcpChannel.sfReqFriendList();
            // End:0x239
            break;
        // End:0x1EC
        case 2:
            // End:0x1E9
            if(page_Main.MyClanName != "")
            {
                page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
            }
            // End:0x239
            break;
        // End:0x236
        case 3:
            // End:0x233
            if((MM.kIsRegisteredPCBang > 0) && MM.kIsPaidPCBang > 0)
            {
                page_Main.TcpChannel.sfReqPCBangUserList();
            }
            // End:0x239
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPMessenger.TabControl.SetVisiblePanel(btn.ButtonID);
    //return;    
}

function bool Internal_OnPreDraw(Canvas C)
{
    local float CurrentTime;
    local int StartTop, Count;
    local export editinline BTWindowHK BTWindow;

    super(BTNetGUIPageHK).Internal_OnPreDraw(C);
    ACLLobby.tT.bOverlapControl = QuestInfo.bVisible;
    ACLLobbyEnterable.tT.bOverlapControl = QuestInfo.bVisible;
    // End:0x66
    if(bStopRefresh)
    {
        return false;
    }
    // End:0x89
    if(page_Main.page_curr != page_Main.page_Lobby2)
    {
        return false;
    }
    // End:0xA0
    if(page_Main.bConnectedChannelServer == false)
    {
        return false;
    }
    // End:0x12B
    if(page_Main.pwm.IsAvailable() && page_Main.pwm.ListLen(7) > 0)
    {
        BTWindow = BTWindowHK(Controller.TopPage());
        // End:0x12B
        if(BTWindow == none)
        {
            Controller.OpenMenuByObject(page_Main.pwm.Pop(7));
        }
    }
    CurrentTime = PlayerOwner().Level.TimeSeconds;
    // End:0x2ED
    if((CurrentTime - LastRefreshTime[0]) > RefreshCycleTime[0])
    {
        // End:0x2E0
        if(TPMessenger.TabControl.CurrentTabIndex == 0)
        {
            Count = 6 * 3;
            StartTop = TPMessenger.ACLMsg[0].MultiColumnList.Top - 6;
            // End:0x1D3
            if(StartTop < 0)
            {
                Count += StartTop;
                StartTop = 0;
            }
            // End:0x23F
            if((TPMessenger.ACLMsg[0].MultiColumnList.Top + (6 * 2)) > TotalChannelUserCount)
            {
                Count += (TotalChannelUserCount - (TPMessenger.ACLMsg[0].MultiColumnList.Top + (6 * 2)));
            }
            // End:0x29C
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
            {
                TPChat.AddChatHistory(2, "RefreshTime", Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
            }
            // End:0x2B0
            if(Count < 6)
            {
                Count = 6;
            }
            page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, StartTop, Count);
        }
        LastRefreshTime[0] = CurrentTime;
    }
    // End:0x3A2
    if((CurrentTime - LastRefreshTime[1]) > RefreshCycleTime[1])
    {
        // End:0x395
        if(TPMessenger.TabControl.CurrentTabIndex == 3)
        {
            // End:0x395
            if((MM.kIsRegisteredPCBang > 0) && MM.kIsPaidPCBang > 0)
            {
                Log("page_Main.TcpChannel.sfReqPCBangUserList()");
                page_Main.TcpChannel.sfReqPCBangUserList();
            }
        }
        LastRefreshTime[1] = CurrentTime;
    }
    return false;
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageLobby_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageLobby_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageLobby_TcpLogin TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageLobby_TcpLogin';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function TcpLogin_OnConnect(int ErrCode)
{
    Log("[BTPageLobby::TcpLogin_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x193
    if(ErrCode == 0)
    {
        // End:0x14E
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            Log(((((("page_Main.TcpLogin.sfReqLoginWithWZAuth(" $ page_Main.AuthLogin_AccountID) $ ", ") $ page_Main.AuthLogin_GUID) $ ", ") $ page_Main.AuthLogin_AuthKey) $ ")");
            // End:0x10E
            if(page_Main.TcpLogin == none)
            {
                Log("page_Main.TcpLogin is none");
            }
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);            
        }
        else
        {
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
    //return;    
}

function bool ForceDisconnect_OnOK(GUIComponent Sender)
{
    Log("[BTPageLobby::ForceDisconnect_OnOK]");
    page_Main.TcpLogin.sfReqProcessPreLoginUser(MM.kUserName, 0);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageLobby::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
    //return;    
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log((((((((((((((((((("[BTPageLobby::rfAckLoginInHouseTest] Sucess=" $ string(Sucess)) $ " CharName=") $ CharName) $ " ") $ string(TimeStamp)) $ " ") $ string(LoginHash1)) $ " ") $ string(LoginHash2)) $ " ") $ string(LoginHash3)) $ " ") $ string(LoginHash4)) $ " ") $ string(LoginHash5)) $ " ") $ string(NeedChar)) $ " ") $ ErrMsg);
    bGoBack = false;
    // End:0x275
    if(int(Sucess) == 0)
    {
        Controller.PopPage();
        page_Main.BirthDay = BDay;
        page_Main.Sex = Sex;
        page_Main.LoginTimeStamp = TimeStamp;
        page_Main.LoginHash1 = LoginHash1;
        page_Main.LoginHash2 = LoginHash2;
        page_Main.LoginHash3 = LoginHash3;
        page_Main.LoginHash4 = LoginHash4;
        page_Main.LoginHash5 = LoginHash5;
        // End:0x1D4
        if(int(NeedChar) == 0)
        {
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name : NULL");
            page_Main.SetPage(4, true);            
        }
        else
        {
            __NFUN_270__("NeedChar :" $ string(NeedChar));
            __NFUN_270__("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            page_Main.rMM.PI_LeaveChannel();
            UnInitializeDelegate();
            page_Main.SetPage(5, true);
        }        
    }
    else
    {
        // End:0x2F1
        if(int(Sucess) == 50)
        {
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            page_Main.TcpLogin.sfReqProcessPreLoginUser(page_Main.rMM.kUserName, 0);            
        }
        else
        {
            // End:0x33A
            if(int(Sucess) == 1)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                
            }
            else
            {
                // End:0x384
                if(int(Sucess) == 2)
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                    
                }
                else
                {
                    // End:0x3CE
                    if(int(Sucess) == 3)
                    {
                        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                        
                    }
                    else
                    {
                        // End:0x418
                        if(int(Sucess) == 15)
                        {
                            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                            
                        }
                        else
                        {
                            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, int(Sucess));
                            BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                    }
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckProcessPreLoginUser] Result=" $ string(Result));
    // End:0x85
    if(Result > 1)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    // End:0xF2
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);        
    }
    else
    {
        page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    }
    return true;
    //return;    
}

function InternalOnReOpen()
{
    __NFUN_270__("BTPageLobby::InternalOnReOpen()");
    Log("[BTPageLobby::InternalOnReOpen] Start");
    Log("[BTPageLobby::InternalOnReOpen] End");
    //return;    
}

function ShowTutorialWindow()
{
    Log("[BTPageLobby::ShowTutorialWindow]");
    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 43);
    BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_43;
    BTWindowDefineARHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowDefineARHK_43;
    //return;    
}

function bool BTWindowDefineARHK_43(GUIComponent Sender)
{
    Log("[BTPageLobby::BTWindowDefineARHK_43]");
    bGoTutorial = false;
    Controller.CloseMenu(false);
    StartTutorial();
    //return;    
}

function StartTutorial(optional string Map)
{
    Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 2);
    // End:0x35
    if(Map == "")
    {
        Map = "dm-downtown";
    }
    Controller.ConsoleCommand("tutorial " $ Map);
    //return;    
}

function bool BTWindowDefineARHK_22_OnOK(GUIComponent Sender)
{
    local bool bTrue;

    bTrue = true;
    PlayerOwner().ConsoleCommand("SETCONFIG_BOOL Graphics UseGore" @ string(bTrue));
    Controller.CloseMenu(false);
    //return;    
}

function bool BTWindowDefineARHK_22_OnCancel(GUIComponent Sender)
{
    local bool bFalse;

    bFalse = false;
    PlayerOwner().ConsoleCommand("SETCONFIG_BOOL Graphics UseGore" @ string(bFalse));
    Controller.CloseMenu(false);
    //return;    
}

function bool BTWindowDefineARHK_45_OnOK(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("SETCONFIG_STRING sound VoiceLanguage native");
    Controller.CloseMenu(false);
    //return;    
}

function bool BTWindowDefineARHK_45_OnCancel(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("SETCONFIG_STRING sound VoiceLanguage foreign");
    Controller.CloseMenu(false);
    //return;    
}

function bool BTWindowDefineARHK_46_OnOK(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("SETCONFIG_BOOL Controll UseAdvCamShake" @ string(true));
    Controller.ViewportOwner.Actor.Level.GameMgr.bUseAdvCamShake = true;
    Controller.CloseMenu(false);
    //return;    
}

function bool BTWindowDefineARHK_46_OnCancel(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("SETCONFIG_BOOL Controll UseAdvCamShake" @ string(false));
    Controller.ViewportOwner.Actor.Level.GameMgr.bUseAdvCamShake = false;
    Controller.CloseMenu(false);
    //return;    
}

function InternalOnOpen()
{
    local int i;

    super.InternalOnOpen();
    __NFUN_270__("BTPageLobby::InternalOnOpen()");
    Log("[BTPageLobby::InternalOnOpen] Start [IME]");
    Controller.PushPage();
    QuestInfo.SetVisibility(false);
    Controller.ConsoleCommand("toggleime 1");
    Controller.ConsoleCommand("SETIMECONVERSION 1");
    // End:0x117
    if(page_Main.bNewAvailableEventQuest)
    {
        Log("page_Main.TcpChannel.sfReqQuestGetAvailableEventList()");
        page_Main.TcpChannel.sfReqQuestGetAvailableEventList();
    }
    SetTimer(3.0000000, false, 'RoomPingRefresh');
    ACLLobbyEnterable.SetVisibility(!bAllRoomList);
    //return;    
}

function OnBackToLastPage()
{
    Log("[BTPageLobby::OnBackToLastPage] Start");
    RefreshPage();
    page_Main.KeepMoving();
    QuestInfo.SetVisibility(false);
    Log("[BTPageLobby::OnBackToLastPage] End");
    //return;    
}

function OnCompleteOpened()
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageLobby::OnCompleteOpened] Start");
    RefreshPage();
    page_Main.KeepMoving();
    QuestInfo.SetVisibility(false);
    // End:0x269
    if(page_Main.rMM.kCharacterCreation)
    {
        bGoTutorial = true;
        page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineARHK", true, 0);
        BTWindow = BTWindowDefineARHK(page_Main.pwm.Last(7));
        BTWindow.SetContentText_Instance(43);
        BTWindow.__OnOK__Delegate = BTWindowDefineARHK_43;
        BTWindow.__OnCancel__Delegate = BTWindowDefineARHK_43;
        // End:0x1C8
        if(Class'Engine.LevelInfo'.default.bTeenVersion == false)
        {
            page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineARHK", true, 0);
            BTWindow = BTWindowDefineARHK(page_Main.pwm.Last(7));
            BTWindow.SetContentText_Instance(22);
            BTWindow.__OnOK__Delegate = BTWindowDefineARHK_22_OnOK;
            BTWindow.__OnCancel__Delegate = BTWindowDefineARHK_22_OnCancel;
        }
        page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineARHK", true, 0);
        BTWindow = BTWindowDefineARHK(page_Main.pwm.Last(7));
        BTWindow.SetContentText_Instance(45);
        BTWindow.__OnOK__Delegate = BTWindowDefineARHK_45_OnOK;
        BTWindow.__OnCancel__Delegate = BTWindowDefineARHK_45_OnCancel;
    }
    // End:0x345
    if(page_Main.rMM.kCharacterCreation || page_Main.rMM.bExistUseAdvCamShake == false)
    {
        page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineARHK", true, 0);
        BTWindow = BTWindowDefineARHK(page_Main.pwm.Last(7));
        BTWindow.SetContentText_Instance(46);
        BTWindow.__OnOK__Delegate = BTWindowDefineARHK_46_OnOK;
        BTWindow.__OnCancel__Delegate = BTWindowDefineARHK_46_OnCancel;
    }
    page_Main.rMM.bExistUseAdvCamShake = true;
    page_Main.rMM.kCharacterCreation = false;
    Log("[BTPageLobby::OnCompleteOpened] End");
    //return;    
}

function UpdateCharInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateCharInfo]");
    TPMyInfo.SetMyInfoA(MM.kUserName, MM.kLevel, MM.kExp, MM.kStartExp, MM.kEndExp, MM.kLevelMarkID);
    TPMyInfo.SetClanInfo(MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, MM.kClanLevel);
    // End:0x111
    if(MM.IsClanMember())
    {
        page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
    }
    //return;    
}

function UpdateClanInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateClanInfo]");
    //return;    
}

function UpdateRankingInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateRankingInfo]");
    TPMyInfo.SetRankingInfo(MM.kRanking, MM.kWin, MM.kLose);
    //return;    
}

function UpdateEquipItemInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateEquipItemInfo]");
    //return;    
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateMoneyInfo]");
    TPMyInfo.SetMoneyInfo(MM.kPoint, MM.kCash);
    //return;    
}

function UpdateRecv_CharInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateRecv_CharInfo]");
    SetCharacterInfo(page_Main.MyClanName, page_Main.MyCharInfo);
    //return;    
}

function UpdatePCBangInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdatePCBangInfo]");
    TPMessenger.UpdatePCBangInfo();
    //return;    
}

function UpdatePositionInfo(wMatchMaker MM)
{
    //return;    
}

function UpdateQuestList(wMatchMaker MM)
{
    //return;    
}

function UpdateFriendList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageLobby::UpdateFriendList]");
    TPMessenger.SavePos(1);
    TPMessenger.RemoveAll(1);
    i = 0;
    J0x4A:

    // End:0x3A2 [Loop If]
    if(i < MM.kFriendList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kFriendList[i].Clanname, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, true, MM.kFriendList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kFriendList[i].Clanname, MM.kFriendList[i].ClanLevel);
        TPMessenger.AddFriendUser(MM.kFriendList[i].UserName, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, MM.kFriendList[i].Clanname, MM.kFriendList[i].Level, MM.kFriendList[i].ServerShortName, MM.kFriendList[i].serverIP, MM.kFriendList[i].serverPort, int(MM.kFriendList[i].CurPos), MM.kFriendList[i].ChannelNum, MM.kFriendList[i].ChannelNickName, MM.kFriendList[i].GameRoomNum, MM.kFriendList[i].ClanGrade, MM.kFriendList[i].ClanWin, MM.kFriendList[i].ClanLose, byte(MM.kFriendList[i].IsLookForClan), MM.kFriendList[i].ClanLevel, MM.kFriendList[i].LevelMarkID, MM.kFriendList[i].TitleMarkID, MM.kFriendList[i].Reserved1, MM.kFriendList[i].Reserved2, MM.kFriendList[i].Reserved3);
        i++;
        // [Loop Continue]
        goto J0x4A;
    }
    TPMessenger.LoadPos(1);
    TPMessenger.UpdateFriendlyUser(1);
    //return;    
}

function UpdateClanList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageLobby::UpdateClanList]");
    TPMessenger.SavePos(2);
    TPMessenger.RemoveAll(2);
    i = 0;
    J0x4A:

    // End:0x25D [Loop If]
    if(i < MM.kClanList.Length)
    {
        TPMessenger.AddClanUser(MM.kClanList[i].UserName, MM.kClanList[i].Level, MM.kClanList[i].ServerShortName, MM.kClanList[i].serverIP, MM.kClanList[i].serverPort, int(MM.kClanList[i].CurPos), MM.kClanList[i].ChannelNum, MM.kClanList[i].ChannelNickName, MM.kClanList[i].GameRoomNum, int(MM.kClanList[i].ClanGrade), int(MM.kClanList[i].IsCombat), MM.kClanList[i].ClanWin, MM.kClanList[i].ClanLose, MM.kClanList[i].ClanSelfIntro, MM.kClanList[i].LevelMarkID, MM.kClanList[i].TitleMarkID, MM.kClanList[i].Reserved1, MM.kClanList[i].Reserved2, MM.kClanList[i].Reserved3);
        i++;
        // [Loop Continue]
        goto J0x4A;
    }
    TPMessenger.LoadPos(2);
    TPMessenger.UpdateFriendlyUser(2);
    //return;    
}

function UpdatePCBangList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageLobby::UpdatePCBangList]");
    TPMessenger.SavePos(3);
    TPMessenger.RemoveAll(3);
    i = 0;
    J0x4C:

    // End:0x3A4 [Loop If]
    if(i < MM.kPCBangList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kPCBangList[i].Clanname, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, true, MM.kPCBangList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kPCBangList[i].Clanname, MM.kPCBangList[i].ClanLevel);
        TPMessenger.AddPCBangUser(MM.kPCBangList[i].UserName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, MM.kPCBangList[i].Clanname, MM.kPCBangList[i].Level, MM.kPCBangList[i].ServerShortName, MM.kPCBangList[i].serverIP, MM.kPCBangList[i].serverPort, int(MM.kPCBangList[i].CurPos), MM.kPCBangList[i].ChannelNum, MM.kPCBangList[i].ChannelNickName, MM.kPCBangList[i].GameRoomNum, MM.kPCBangList[i].ClanGrade, MM.kPCBangList[i].ClanWin, MM.kPCBangList[i].ClanLose, byte(MM.kPCBangList[i].IsLookForClan), MM.kPCBangList[i].ClanLevel, MM.kPCBangList[i].LevelMarkID, MM.kPCBangList[i].TitleMarkID, MM.kPCBangList[i].Reserved1, MM.kPCBangList[i].Reserved2, MM.kPCBangList[i].Reserved3);
        i++;
        // [Loop Continue]
        goto J0x4C;
    }
    TPMessenger.LoadPos(3);
    TPMessenger.UpdateFriendlyUser(3);
    //return;    
}

function UpdateBlockList(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateBlockList]");
    //return;    
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageLobby::UpdateItemList]");
    //return;    
}

function UpdateWebzenItemList(wGameManager GameMgr)
{
    Log("[BTPageLobby::UpdateWebzenItemList]");
    //return;    
}

function InitializeDelegate()
{
    MM.__UpdateClanInfo__Delegate = UpdateClanInfo;
    page_Main.__UpdateRecv_ClanInfo__Delegate = UpdateRecv_ClanInfo;
    MM.__UpdateCharInfo__Delegate = UpdateCharInfo;
    MM.__UpdateRankingInfo__Delegate = UpdateRankingInfo;
    MM.__UpdateEquipItemInfo__Delegate = UpdateEquipItemInfo;
    MM.__UpdateMoneyInfo__Delegate = UpdateMoneyInfo;
    MM.__UpdateClanInfo__Delegate = UpdateClanInfo;
    MM.__UpdatePositionInfo__Delegate = UpdatePositionInfo;
    MM.__UpdatePCBangInfo__Delegate = UpdatePCBangInfo;
    MM.__UpdateQuestList__Delegate = UpdateQuestList;
    MM.__UpdateRecv_CharInfo__Delegate = UpdateRecv_CharInfo;
    MM.__UpdatePCBangList__Delegate = UpdatePCBangList;
    MM.__UpdateBlockList__Delegate = UpdateBlockList;
    MM.__UpdateClanList__Delegate = UpdateClanList;
    MM.__UpdateFriendList__Delegate = UpdateFriendList;
    GameMgr.__UpdateItemList__Delegate = UpdateItemList;
    GameMgr.__UpdateWebzenItemList__Delegate = UpdateWebzenItemList;
    //return;    
}

function UnInitializeDelegate()
{
    MM.__UpdateClanInfo__Delegate = None;
    page_Main.__UpdateRecv_ClanInfo__Delegate = None;
    MM.__UpdateCharInfo__Delegate = None;
    MM.__UpdateRankingInfo__Delegate = None;
    MM.__UpdateEquipItemInfo__Delegate = None;
    MM.__UpdateMoneyInfo__Delegate = None;
    MM.__UpdateClanInfo__Delegate = None;
    MM.__UpdatePositionInfo__Delegate = None;
    MM.__UpdatePCBangInfo__Delegate = None;
    MM.__UpdateQuestList__Delegate = None;
    MM.__UpdateRecv_CharInfo__Delegate = None;
    MM.__UpdatePCBangList__Delegate = None;
    MM.__UpdateBlockList__Delegate = None;
    MM.__UpdateClanList__Delegate = None;
    MM.__UpdateFriendList__Delegate = None;
    GameMgr.__UpdateItemList__Delegate = None;
    GameMgr.__UpdateWebzenItemList__Delegate = None;
    //return;    
}

function RefreshPage()
{
    local wMyPlayerStatus MyStatus;

    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    super(BTNetGUIPageHK).RefreshPage();
    MM.SetCurpos(1);
    MM.kMainMenu = page_Main;
    InitializeDelegate();
    // End:0x14D
    if(MM.kClanMatch_InChannel)
    {
        ListBottomButton[0].DisableMe();
        ListBottomButton[0].SetVisibility(false);
        ListBottomButton[1].DisableMe();
        ListBottomButton[1].SetVisibility(false);
        ListBottomButton[2].DisableMe();
        ListBottomButton[2].SetVisibility(false);
        ButtonRegularClanWar.DisableMe();
        ButtonRegularClanWar.SetVisibility(false);
        ButtonFriendlyClanWar.EnableMe();
        ButtonFriendlyClanWar.SetVisibility(true);        
    }
    else
    {
        ListBottomButton[0].EnableMe();
        ListBottomButton[0].SetVisibility(true);
        ListBottomButton[1].EnableMe();
        ListBottomButton[1].SetVisibility(true);
        ListBottomButton[2].EnableMe();
        ListBottomButton[2].SetVisibility(true);
        ButtonRegularClanWar.DisableMe();
        ButtonRegularClanWar.SetVisibility(false);
        ButtonFriendlyClanWar.DisableMe();
        ButtonFriendlyClanWar.SetVisibility(false);
    }
    // End:0x27F
    if(page_Main.rMM.bHasChannelTCP == false)
    {
        Log("[BTPageLobby::RefreshPage] Disconnected Channel Server");
        Log("Controller.CloseMenu(false)");
        Controller.CloseMenu(false);
        return;
    }
    currentBGM = page_Main.DefaultLobbyBGM;
    page_Main.LastMainPageBGM = currentBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    ACLLobby.RemoveAll();
    ACLLobbyEnterable.RemoveAll();
    page_Main.__ClearChatLog__Delegate = ClearChatLog;
    page_Main.__NormalChatLog__Delegate = NormalChatLog;
    page_Main.__ClanChatLog__Delegate = ClanChatLog;
    page_Main.__WhisperChatLog__Delegate = WhisperChatLog;
    page_Main.__SelfChatLog__Delegate = SelfChatLog;
    page_Main.__SystemChatLog__Delegate = SystemChatLog;
    page_Main.__BroadCastItemChatLog__Delegate = BroadCastItemChatLog;
    page_Main.__TeamChatLog__Delegate = TeamChatLog;
    page_Main.UpdateChatLog();
    page_Main.TPChat = TPChat;
    TPChat.InputBox.__OnChat__Delegate = page_Main.Internal_OnChat;
    TPChat.InputBox.__OnInputTab__Delegate = page_Main.TPChat_OnInputTab;
    TPChat.InputBox.__OnInputSpace__Delegate = page_Main.TPChat_OnInputSpace;
    TPChat.__OnChageChatMode__Delegate = page_Main.TPChat_OnChageChatMode;
    TPChat.__ChangeTab_OnClick__Delegate = page_Main.TPChat_ChangeTab_OnClick;
    TPChat.InputBox.__OnFunctionKey__Delegate = page_Main.Internal_OnFunctionKey;
    TPChat.InputBox.FocusFirst(none);
    page_Main.PrevChatMode.ChatType = 1;
    TPChat.SetChatState(page_Main.PrevChatMode.ChatType);
    ListTopChannelName.Caption = (((page_Main.ServerGroupName $ " / ") $ page_Main.ServerName) $ " / ") $ page_Main.ChannelName;
    MM.szSeverName = page_Main.ServerName;
    MM.szChannelGroup = page_Main.ServerGroupName;
    MM.szChannelName = page_Main.ChannelName;
    TPMessenger.RemoveAll(0);
    TPMessenger.RemoveAll(1);
    TPMessenger.RemoveAll(2);
    TPMessenger.RemoveAll(3);
    Log(("page_main.TcpChannel.sfReqRoomList(" $ string(MM.kChannelID)) $ ", 0, 30 )");
    page_Main.TcpChannel.sfReqRoomList(MM.kChannelID, 0, 30);
    // End:0x68A
    if(MM.kClanMatch_InChannel)
    {
        Log("page_main.TcpChannel.sfReqClanMatch_GetPublicWaitRoomList()");
        page_Main.TcpChannel.sfReqClanMatch_GetPublicWaitRoomList();
    }
    Log(("page_main.TcpChannel.sfReqChannelUserList(" $ string(MM.kChannelID)) $ ", 0, 30 )");
    page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, 0, 30);
    Log("page_main.TcpChannel.sfReqFriendList()");
    page_Main.TcpChannel.sfReqFriendList();
    TPMessenger.UpdatePCBangInfo();
    // End:0x7C1
    if((MM.kIsRegisteredPCBang > 0) && MM.kIsPaidPCBang > 0)
    {
        Log("page_main.TcpChannel.sfReqPCBangUserList()");
        page_Main.TcpChannel.sfReqPCBangUserList();
    }
    Log("page_main.TcpChannel.sfReqBlockUserList()");
    page_Main.TcpChannel.sfReqBlockUserList();
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    Log("page_main.TcpChannel.sfReqCharInfo()");
    page_Main.pwm.StopProcess();
    page_Main.TcpChannel.sfReqCharInfo();
    page_Main.rMM.__OnRecivedPing__Delegate = BTPageLobby_OnReceivedPing;
    bStopRefresh = false;
    LastRefreshTime[0] = PlayerOwner().Level.TimeSeconds;
    LastRefreshTime[1] = LastRefreshTime[0];
    page_Main.CheckItemWarning();
    //return;    
}

function BTPageLobby_OnReceivedPing(wMatchMaker MM, string fromAddr, int msec)
{
    Log((("[BTPageLobby::BTPageLobby_OnReceivedPing] fromAddr=" $ fromAddr) $ " msec=") $ string(msec));
    ACLLobby.SetRoomPingStatus(fromAddr, msec);
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageLobby::InternalOnClose()");
    Log("[BTPageLobby::InternalOnClose]");
    Controller.PopPage();
    OnClose(bCanceled);
    //return;    
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    // End:0x27
    if(int(key) == 13)
    {
        TPChat.InputBox.FocusFirst(none);
    }
    return true;
    //return;    
}

function bool InternalKeyType(out byte key, optional string Unicode)
{
    // End:0x27
    if(int(key) == 13)
    {
        TPChat.InputBox.FocusFirst(none);
    }
    return true;
    //return;    
}

function OnVisibleChannelListChanged(int Index)
{
    //return;    
}

function ClearChatLog()
{
    TPChat.ClearAll();
    //return;    
}

function NormalChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatNormal());
    //return;    
}

function ClanChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    TPChat.AddChatHistory(2, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    //return;    
}

function WhisperChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    TPChat.AddChatHistory(1, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    //return;    
}

function SelfChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
    //return;    
}

function SystemChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(1, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(2, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    //return;    
}

function BroadCastItemChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatBroadCastItem());
    //return;    
}

function TeamChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeam());
    //return;    
}

function bool rfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    Log((("[BTPageLobby::rfAckCreateGameRoom] UserID=" $ string(UserID)) $ " MM.kUID=") $ string(MM.kUID));
    // End:0x596
    if(Result == 0)
    {
        // End:0x441
        if(UserID == MM.kUID)
        {
            Log("[BTPageLobby::rfAckCreateGameRoom] in to the room");
            MM.szRoomName = NetRoomInfo.RoomName;
            MM.szMapName = NetRoomInfo.MapName;
            MM.iMaxPlayers = int(NetRoomInfo.MaxUserCnt);
            MM.szGameClass = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(NetRoomInfo.GameModeNum)).ClassName;
            MM.eWeaponLimit = NetRoomInfo.WeaponLimit;
            MM.iGoalRound = NetRoomInfo.GameRound;
            MM.iTimeLimit = NetRoomInfo.GameMinute;
            page_Main.iRoomNum = NetRoomInfo.RoomNumber;
            MM.PlayWithBots = int(NetRoomInfo.PlayWithBots) > 0;
            MM.BotUserTeam = int(NetRoomInfo.UserTeamNum);
            MM.BotDifficulty = int(NetRoomInfo.BotModeDifficulty);
            MM.BotNum0 = int(NetRoomInfo.MaxAFUserAndBotNum);
            MM.BotNum1 = int(NetRoomInfo.MaxRSAUserAndBotNum);
            MM.bMultiBomb = true;
            MM.SD_ChangeAttackTeam = true;
            MM.SD_ChangeRound = 3;
            MM.kRoomID = NetRoomInfo.RoomNumber;
            MM.RI_Clear();
            // End:0x2A5
            if(NetRoomInfo.RoomOwner == MM.kUserName)
            {
                MM.kGame_bOwner = true;                
            }
            else
            {
                MM.kGame_bOwner = false;
            }
            MM.kGame_RoomName = NetRoomInfo.RoomName;
            MM.kGame_Password = NetRoomInfo.Password;
            MM.kGame_MapNum = int(NetRoomInfo.MapNum);
            MM.kGame_MapName = NetRoomInfo.MapName;
            MM.kGame_GameMode = int(NetRoomInfo.GameModeNum);
            MM.kGame_UserCount = int(NetRoomInfo.MaxUserCnt);
            MM.kGame_GameTime = NetRoomInfo.GameMinute;
            MM.kGame_GameRound = NetRoomInfo.GameRound;
            MM.kGame_WeaponLimit = int(NetRoomInfo.WeaponLimit);
            // End:0x3C5
            if(int(NetRoomInfo.IsHardCore) != 0)
            {
                MM.kGame_bHardCore = true;                
            }
            else
            {
                MM.kGame_bHardCore = false;
            }
            // End:0x3FC
            if(int(NetRoomInfo.IsTeamValance) != 0)
            {
                MM.kGame_TeamBalance = true;                
            }
            else
            {
                MM.kGame_TeamBalance = false;
            }
            __delegateAckEnterRoom__Delegate = rfAckEnterRoom_AfterCreateRoom;
            page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);            
        }
        else
        {
            Log("[BTPageLobby::rfAckCreateGameRoom] Just add room list");
            ACLLobby.AddRoom(0, NetRoomInfo.RoomNumber, int(NetRoomInfo.IsPassword), NetRoomInfo.RoomName, NetRoomInfo.MapName, int(NetRoomInfo.MapNum), int(NetRoomInfo.GameModeNum), int(NetRoomInfo.WeaponLimit), 1, int(NetRoomInfo.MaxUserCnt), 0, 0, RoomOwnerIP, NetRoomInfo.GameMinute, int(NetRoomInfo.IsTeamValance), NetRoomInfo.RoomOwner, int(NetRoomInfo.BotModeDifficulty), int(NetRoomInfo.UserTeamNum));
            // End:0x576
            if(IsEnterableRoom(bool(NetRoomInfo.IsPassword), 1, int(NetRoomInfo.MaxUserCnt)))
            {
                ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[ACLLobby.ACLRowList.Length - 1]);
            }
            page_Main.rMM.SendPingToOtherUser(RoomOwnerIP);
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string Clanname, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log(((((((("[BTPageLobby::rfAckEnterChannel]" $ " ID=") $ string(id)) $ " UID=") $ string(UID)) $ " UserID=") $ UserID) $ " Level=") $ string(Level));
    // End:0x101
    if(Result == 0)
    {
        // End:0xF8
        if(UserID != MM.kUserName)
        {
            TPMessenger.AddChannelUser(ClanMarkPattern, ClanMarkBG, ClanMarkBL, Clanname, Level, UserID, UID, ClanGrade, ClanWin, ClanLose, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);            
        }
        else
        {
            RefreshPage();
        }        
    }
    else
    {
        page_Main.EndAutoMove();
        Controller.PopPage();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = LobbyToServerSelection_OnOK;
    }
    return true;
    //return;    
}

function bool LobbyToServerSelection_OnOK(GUIComponent Sender)
{
    Log("[BTPageLobby::LobbyToServerSelection_OnOK]");
    LobbyToServerSelection();
    //return;    
}

function LobbyToServerSelection()
{
    Log("[BTPageLobby::LobbyToServerSelection]");
    page_Main.rMM.ClearReceivedPingHK();
    // End:0x6B
    if(BTWindowStateHK(Controller.TopPage()) != none)
    {
        Controller.CloseMenu(false);
    }
    MM.kClanMatch_InChannel = false;
    page_Main.ChannelToLogin(page_Main.szLoginServerIP, page_Main.szLoginServerPort);
    //return;    
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    local SystemMsgParam MsgInfo;

    Log("[BTPageLobby::rfAckLeaveChannel]");
    // End:0x199
    if(Result == 0)
    {
        // End:0x152
        if(UID == MM.kUID)
        {
            Log("if ( UID == MM.kUID)");
            bStopRefresh = true;
            // End:0x10C
            if(bGoBack)
            {
                MsgInfo.MsgCode = 6;
                MsgInfo.CharName = UserID;
                page_Main.TcpChannel.sfReqSendSystemMsg(1, UserID, "", MsgInfo);
                Log(("page_Main.TcpChannel.sfReqSendSystemMsg(1, " $ UserID) $ ", , msginfo) MsgCode=6");
                LobbyToServerSelection();                
            }
            else
            {
                page_Main.rMM.ClearReceivedPingHK();
                page_Main.TcpChannel.sfReqEnterRoom(MM.kRoomID, SaveRoomPassword);
            }            
        }
        else
        {
            Log(("TPMessenger.RemoveChannelUser(" $ string(UID)) $ ")");
            TPMessenger.RemoveChannelUser(UID);
        }        
    }
    else
    {
        MM.PI_LeaveChannel();
        MM.PI_LeavelRoom();
        page_Main.EndAutoMove();
        // End:0x1F0
        if(BTWindowStateHK(Controller.TopPage()) != none)
        {
            Controller.CloseMenu(false);
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string Clanname, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageLobby::rfAckEnterRoom]");
    // End:0x9D
    if(Result == 0)
    {
        delegateAckEnterRoom(GameNum, OwnerID, UID, UserID, TeamNum, Grade, UserIP, Clanname, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);        
    }
    else
    {
        // End:0xC7
        if(BTWindowStateHK(Controller.TopPage()) != none)
        {
            Controller.CloseMenu(false);
        }
        page_Main.TcpChannel.sfReqEnterChannel(MM.kChannelID);
        // End:0x1D0
        if((Result == 151) && page_Main.bAutoMove == true)
        {
            page_Main.EndAutoMove();
            MM.kRoomID = GameNum;
            Controller.OpenMenu("GUIWarfareControls.BTWindowPasswordHK");
            BTWindowPasswordHK(Controller.TopPage()).SetData();
            BTWindowPasswordHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPasswordHK_OnOK;
            BTWindowPasswordHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowPasswordHK_OnCancel;            
        }
        else
        {
            MM.PI_LeavelRoom();
            page_Main.EndAutoMove();
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    __delegateAckEnterRoom__Delegate = None;
    return true;
    //return;    
}

function bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex)
{
    Log("  TotalCount=" $ string(TotalCount));
    RoomStartIndex = StartIndex;
    TotalRoomCount = TotalCount;
    // End:0x41
    if(TotalCount == 0)
    {
        TryEnterBotMode();
    }
    return true;
    //return;    
}

function bool rfAckRoomList(array<int> GameNum, array<string> Title, array<string> MapName, array<int> MapNum, array<byte> UserCount, array<byte> MaxCount, array<string> ModeName, array<int> ModeNum, array<byte> WeaponLimit, array<byte> IsTeamBalance, array<byte> Status, array<string> RoomOwnerIP, array<int> GameMinute, array<string> RoomOwnerName, array<byte> IsSpecial, array<byte> IsPassword, array<byte> BotDifficult, array<byte> BotModeUserTeamNum)
{
    local int i, GameRoomIndex;

    Log((("[BTPageLobby::rfAckRoomList] Title.Length=" $ string(Title.Length)) $ ", BotDifficult=") $ string(BotDifficult.Length));
    i = 0;
    J0x5C:

    // End:0x39B [Loop If]
    if(i < GameNum.Length)
    {
        Log((((("Title[" $ string(i)) $ "]=") $ Title[i]) $ ", BotDifficult=") $ string(BotDifficult[i]));
        GameRoomIndex = ACLLobby.FindRoomNo(GameNum[i]);
        // End:0x254
        if(GameRoomIndex >= 0)
        {
            ACLLobby.ReplaceRoom(GameRoomIndex, int(IsSpecial[i]), GameNum[i], int(IsPassword[i]), Title[i], MapName[i], MapNum[i], ModeNum[i], int(WeaponLimit[i]), int(UserCount[i]), int(MaxCount[i]), int(Status[i]), 0, RoomOwnerIP[i], GameMinute[i], int(IsTeamBalance[i]), RoomOwnerName[i], int(BotDifficult[i]), int(BotModeUserTeamNum[i]));
            // End:0x237
            if(IsEnterableRoom(bool(IsPassword[i]), int(UserCount[i]), int(MaxCount[i])))
            {
                // End:0x234
                if(ACLLobbyEnterable.FindRoomNo(GameNum[i]) < 0)
                {
                    ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[GameRoomIndex]);
                }                
            }
            else
            {
                ACLLobbyEnterable.RemoveByGameNumber(GameNum[i]);
            }
            // [Explicit Continue]
            goto J0x391;
        }
        ACLLobby.AddRoom(int(IsSpecial[i]), GameNum[i], int(IsPassword[i]), Title[i], MapName[i], MapNum[i], ModeNum[i], int(WeaponLimit[i]), int(UserCount[i]), int(MaxCount[i]), int(Status[i]), 0, RoomOwnerIP[i], GameMinute[i], int(IsTeamBalance[i]), RoomOwnerName[i], int(BotDifficult[i]), int(BotModeUserTeamNum[i]));
        // End:0x391
        if(IsEnterableRoom(bool(IsPassword[i]), int(UserCount[i]), int(MaxCount[i])))
        {
            ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[ACLLobby.ACLRowList.Length - 1]);
        }
        J0x391:

        i++;
        // [Loop Continue]
        goto J0x5C;
    }
    TryEnterBotMode();
    return true;
    //return;    
}

function TryEnterBotMode()
{
    // End:0x12A
    if(page_Main.EnterBotMode)
    {
        Log("[BTPageLobby::TryEnterBotMode] enter bot mode");
        page_Main.EnterBotMode = false;
        // End:0xA8
        if(ProcessQuickEnter(-1, 11, -1, 1))
        {
            Log("[BTPageLobby::TryEnterBotMode] enter bot mode - success");            
        }
        else
        {
            Log("[BTPageLobby::TryEnterBotMode] enter bot mode - fail, let's create a room");
            page_Main.CreateBotMode = true;
            OpenBTWindowCreateRoom();
            GetWindowCreateRoom().SetGameModeByExtraDataIndex(11);
            BTWindowCreateRoom_OnOK(GetWindowCreateRoom());
        }
    }
    //return;    
}

function bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, array<int> UID, array<string> UserID, array<int> UserLevels, array<string> Clanname, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, int Result, string ErrMsg, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    Log("[BTPageLobby::rfAckChannelUserList]");
    TotalChannelUserCount = TotalCount;
    // End:0x402
    if(Result == 0)
    {
        i = 0;
        J0x44:

        // End:0x2AF [Loop If]
        if(i < UID.Length)
        {
            GameMgr.cmm.AddClanMark(Clanname[i], ClanPattern[i], ClanBG[i], ClanBL[i], true, int(IsLookForClan[i]) > 0);
            GameMgr.cmm.SetClanLevel(Clanname[i], ClanLevel[i]);
            // End:0x1DB
            if(TPMessenger.ACLMsg[0].ACLRowList.Length > (i + StartIndex))
            {
                TPMessenger.ReplaceChannelUser(i + StartIndex, ClanPattern[i], ClanBG[i], ClanBL[i], Clanname[i], UserLevels[i], UserID[i], UID[i], ClanGrade[i], ClanWin[i], ClanLose[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
                // [Explicit Continue]
                goto J0x2A5;
            }
            TPMessenger.AddChannelUser(ClanPattern[i], ClanBG[i], ClanBL[i], Clanname[i], UserLevels[i], UserID[i], UID[i], ClanGrade[i], ClanWin[i], ClanLose[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
            J0x2A5:

            i++;
            // [Loop Continue]
            goto J0x44;
        }
        // End:0x313
        if(TPMessenger.ACLMsg[0].ACLRowList.Length > TotalCount)
        {
            TPMessenger.ACLMsg[0].RemoveRowArray(TotalCount, TPMessenger.ACLMsg[0].ACLRowList.Length - TotalCount);
        }
        // End:0x3FF
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
        {
            TPChat.AddChatHistory(2, (((((("TotalCount=" $ string(TotalCount)) $ " ACL.Top=") $ string(TPMessenger.ACLMsg[0].MultiColumnList.Top)) $ " ACL.ACLRowList.Length=") $ string(TPMessenger.ACLMsg[0].ACLRowList.Length)) $ " UID.Length=") $ string(UID.Length), Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
        }        
    }
    else
    {
        Log("[BTPageLobby::rfAckChannelUserList] Error Result=" $ string(Result));
    }
    return true;
    //return;    
}

function bool rfAckGameRoomDestroy(int GameRoomNum)
{
    Log(("[BTPageLobby::rfAckGameRoomDestroy]" $ " gameRoomNum=") $ string(GameRoomNum));
    ACLLobby.RemoveByGameNumber(GameRoomNum);
    ACLLobbyEnterable.RemoveByGameNumber(GameRoomNum);
    return true;
    //return;    
}

function SetCharacterInfo(string Clanname, CharInfo btCharInfo)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageLobby::SetCharacterInfo]");
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    // End:0x255
    if(MyStatus != none)
    {
        MyStatus.Clanname = Clanname;
        MyStatus.Level = btCharInfo.Level;
        MyStatus.Exp = btCharInfo.Exp;
        MyStatus.Stamina = btCharInfo.Stamina;
        MyStatus.HP = btCharInfo.HP;
        MyStatus.Ranking = btCharInfo.Ranking;
        MyStatus.Kill = btCharInfo.Kill;
        MyStatus.Death = btCharInfo.Death;
        MyStatus.Win = btCharInfo.Win;
        MyStatus.Lose = btCharInfo.Lose;
        MyStatus.TeamKill = btCharInfo.TeamKill;
        MyStatus.Assist = btCharInfo.Assist;
        MyStatus.Point = btCharInfo.Point;
        MyStatus.Cash = btCharInfo.Cash;
        MyStatus.HeadShot2 = btCharInfo.HeadShot2;
        MyStatus.DisCon = btCharInfo.DisCon;
        MyStatus.TotPlayTime = btCharInfo.TotPlayTime;
        MyStatus.DispHeadItem = btCharInfo.DispHeadItem;
        MyStatus.DispHeadAddItem = btCharInfo.DispHeadAddItem;
        MyStatus.DispFaceItem = btCharInfo.DispFaceItem;
    }
    //return;    
}

function bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    local int i;

    Log(((((((((((("[BTPageLobby::rfReqExteriorRoomInfo]" $ " SP=") $ string(SP)) $ " RoomNum=") $ string(RoomNumber)) $ " RoomName=") $ RoomName) $ " Map=") $ MapName) $ " IsTeamBalance=") $ string(IsTeamBalance)) $ ", WeaponLimit=") $ string(WeaponLimit));
    i = 0;
    J0xB2:

    // End:0x1C6 [Loop If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0x1BC
        if(ACLLobby.ACLRowList[i].DataPerColumn[1].IntValue == RoomNumber)
        {
            ACLLobby.ChangeRoomInfo(i, RoomName, MapName, MapNum, ModeNum, IsTeamBalance, RoomUserCount, MaxUserCount, int(RoomState), IsPW, BotDifficult, WeaponLimit, BotModeUserTeamNum);
            // End:0x1A5
            if(IsEnterableRoom(bool(IsPW), RoomUserCount, MaxUserCount))
            {
                // End:0x1A2
                if(ACLLobbyEnterable.FindRoomNo(RoomNumber) < 0)
                {
                    ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[i]);
                }                
            }
            else
            {
                ACLLobbyEnterable.RemoveByGameNumber(RoomNumber);
            }
            // [Explicit Break]
            goto J0x1C6;
        }
        i++;
        // [Loop Continue]
        goto J0xB2;
    }
    J0x1C6:

    return true;
    //return;    
}

function bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount)
{
    local int i;

    Log(((("[BTPageLobby::rfReqExteriorRoomUserCount]" $ " RoomNum=") $ string(RoomNumber)) $ " RoomuserCount=") $ string(RoomUserCount));
    i = 0;
    J0x66:

    // End:0x183 [Loop If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0x179
        if(ACLLobby.ACLRowList[i].DataPerColumn[1].IntValue == RoomNumber)
        {
            ACLLobby.ChangeRoomUserCount(i, RoomUserCount);
            // End:0x162
            if(IsEnterableRoom(bool(ACLLobby.ACLRowList[i].DataPerColumn[2].IntValue), RoomUserCount, int(ACLLobby.ACLRowList[i].DataPerColumn[7].floatValue)))
            {
                // End:0x15F
                if(ACLLobbyEnterable.FindRoomNo(RoomNumber) < 0)
                {
                    ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[i]);
                }                
            }
            else
            {
                ACLLobbyEnterable.RemoveByGameNumber(RoomNumber);
            }
            // [Explicit Break]
            goto J0x183;
        }
        i++;
        // [Loop Continue]
        goto J0x66;
    }
    J0x183:

    return true;
    //return;    
}

function bool rfReqExteriorRoomState(int RoomNumber, byte RoomState)
{
    local int i;

    Log(((("[BTPageLobby::rfReqExteriorRoomState]" $ " RoomNumber=") $ string(RoomNumber)) $ " RoomState=") $ string(RoomState));
    i = 0;
    J0x61:

    // End:0xD0 [Loop If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0xC6
        if(ACLLobby.ACLRowList[i].DataPerColumn[1].IntValue == RoomNumber)
        {
            ACLLobby.ChangeRoomState(i, int(RoomState));
            // [Explicit Break]
            goto J0xD0;
        }
        i++;
        // [Loop Continue]
        goto J0x61;
    }
    J0xD0:

    return true;
    //return;    
}

function bool rfReqExteriorRoomOwnerInfo(int RoomNum, string OwnerName, string OwnerIP)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x79 [Loop If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0x6F
        if(ACLLobby.ACLRowList[i].DataPerColumn[1].IntValue == RoomNum)
        {
            ACLLobby.ChangeRoomOwnerInfo(i, OwnerName, OwnerIP);
            // [Explicit Break]
            goto J0x79;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x79:

    page_Main.rMM.SendPingToOtherUser(OwnerIP);
    return true;
    //return;    
}

function bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckSendFriendInvite]");
    // End:0x36
    if(Result == 0)
    {        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    Log("[BTPageLobby::rfReqRecvFriendInvite]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowRequestFriendHK");
    BTWindowRequestFriendHK(Controller.TopPage()).SetData(ReqCharname, ReqUserID, InviteMsg);
    BTWindowRequestFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowRequestFriend_OnOK;
    BTWindowRequestFriendHK(Controller.TopPage()).__OnCancel__Delegate = WindowRequestFriend_OnCancel;
    return true;
    //return;    
}

function bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckConfirmFriendInvite]");
    // End:0x62
    if(Result == 0)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(18), 5, true);
        RefreshPage();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    local string RecvMsg;

    Log((("[BTPageLobby::rfReqCompleteFriendInvite] CharnameToBeInvited=" $ CharnameToBeInvited) $ " IsPermit=") $ string(IsPermit));
    // End:0x9D
    if(int(IsPermit) == 0)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(22, CharnameToBeInvited), 5, true);
        RefreshPage();        
    }
    else
    {
        // End:0xC8
        if(int(IsPermit) == 3)
        {
            RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(381);            
        }
        else
        {
            // End:0xF3
            if(int(IsPermit) == 4)
            {
                RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(415);                
            }
            else
            {
                RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(23, CharnameToBeInvited);
            }
        }
        page_Main.AddChatLog(RecvMsg, 5, true);
    }
    return false;
    //return;    
}

function bool rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log("[BTPageLobby::rfAckGameRoomInfo]");
    return true;
    //return;    
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckDupCheckClanName]");
    // End:0x95
    if(Result == 0)
    {
        BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = true;
        BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck[0].DisableMe();
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 50);        
    }
    else
    {
        // End:0x103
        if(Result == 127)
        {
            BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = false;
            BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck[0].EnableMe();
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 51);            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    return true;
    //return;    
}

function bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTPageLobby::rfAckCreateClan]");
    // End:0x214
    if(Result == 0)
    {
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.Clanname = page_Main.SaveClanName;
        page_Main.MyClanName = page_Main.SaveClanName;
        MM.kClanName = page_Main.SaveClanName;
        MM.kInClanGrade = 1;
        MM.kClanLevel = 1;
        MM.kClanPattern = 0;
        MM.kClanBG = 0;
        MM.kClanBL = 0;
        GameMgr.SP.kClanPattern_Img.Image = none;
        GameMgr.SP.kClanBG_Img.Image = none;
        GameMgr.SP.kClanBL_Img.Image = none;
        MM.kPoint -= 5000;
        MM.UpdateCharInfoAndReqClanUserList();
        MM.UpdateMoneyInfo(MM);
        GameMgr.AddInstanceItemByParameter(17019, ItemIdx, 0, 13, 1, 100000, 0, 0, StackCount);
        GameMgr.UpdateItemList(GameMgr);
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 53);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = MoveToClanPage_OnOK;        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool MoveToClanPage_OnOK(GUIComponent Sender)
{
    Controller.TopPage().FadeOut(false, true);
    // End:0x97
    if(((page_Main.page_curr == page_Main.page_Lobby2) || page_Main.page_curr == page_Main.page_RoomLobby) || page_Main.page_curr == page_Main.page_ClanWar)
    {
        page_Main.SetPage(24, false);        
    }
    else
    {
        page_Main.SetPage(24, true);
    }
    return true;
    //return;    
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string Clanname, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::rfAckDBCharInfo]");
    // End:0x86
    if(bJoinClanState)
    {
        BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
        // End:0x7C
        if(BTWindow != none)
        {
            // End:0x7C
            if(BTWindow.CharName == CharName)
            {
                BTWindow.SetCharInfo(stCharInfo);
            }
        }
        bJoinClanState = false;
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowUserDetailInfoHK");
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetData(CharName, Clanname, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, stCharInfo.DispHeadItem, stCharInfo.DispFaceItem, stCharInfo.DispHeadAddItem, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo);
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetClanInfo(Clanname, CM_Pattern, CM_BG, CM_BL, ClanLevel);
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetSelfIntro(ClanPersonIntro);
    // End:0x1CD
    if((Clanname == "none") || Clanname == "")
    {
        BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.DisableMe();        
    }
    else
    {
        BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
        BTWindowUserDetailInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowUserDetailInfoHK_OnClanInfo;
    }
    return true;
    //return;    
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    Log("[BTPageLobby::rfAckClanCharPersonelIntro]");
    // End:0x53
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfReqClanCharPersonelIntro(string Clanname, string CharName)
{
    return true;
    //return;    
}

function bool BTWindowUserDetailInfoHK_OnClanInfo(GUIComponent Sender)
{
    local string Clanname;

    Clanname = BTWindowUserDetailInfoHK(Controller.TopPage()).Clanname;
    Controller.TopPage().FadeOut(false, true);
    TcpChannel.sfReqClanInfo(Clanname);
    return true;
    //return;    
}

function bool rfAckInviteClan(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckInviteClan]");
    // End:0x48
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x73
    if(MM.InGamePlaying == false)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 41);
    }
    return true;
    //return;    
}

function bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    Log("[BTPageLobby::rfAckJoinClan]");
    // End:0xB0
    if(Result != 0)
    {
        // End:0x95
        if(Result == 537)
        {
            // End:0x77
            if(MM.InGamePlaying)
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(135, RealRecvCharName), 5, true);                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 135, RealRecvCharName);
            }            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            return true;
        }
    }
    // End:0x1A9
    if(MM.InGamePlaying)
    {
        // End:0x183
        if((SpecificCharName != "") && SpecificCharName != RealRecvCharName)
        {
            // End:0x11C
            if(int(RealRecvCharClanGrade) == 1)
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(133, SpecificCharName, RealRecvCharName), 5, true);                
            }
            else
            {
                // End:0x15A
                if(int(RealRecvCharClanGrade) == 2)
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(134, SpecificCharName, RealRecvCharName), 5, true);                    
                }
                else
                {
                    Log("RealRecvCharClanGrade != 1 && != 2");
                }
            }            
        }
        else
        {
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(42), 5, true);
        }        
    }
    else
    {
        // End:0x250
        if((SpecificCharName != "") && SpecificCharName != RealRecvCharName)
        {
            // End:0x1F6
            if(int(RealRecvCharClanGrade) == 1)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 133, SpecificCharName, RealRecvCharName);                
            }
            else
            {
                // End:0x227
                if(int(RealRecvCharClanGrade) == 2)
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 134, SpecificCharName, RealRecvCharName);                    
                }
                else
                {
                    Log("RealRecvCharClanGrade != 1 && != 2");
                }
            }            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 42);
        }
    }
    return true;
    //return;    
}

function bool rfReqRecvClanInvite(string InviterCharname, string Clanname, string InviteMsg)
{
    Log("[BTPageLobby::rfReqRecvClanInvite]");
    bClanInviteState = true;
    TcpChannel.sfReqClanInfo(Clanname);
    Controller.OpenMenu("GUIWarfareControls.BTWindowRequestClanHK");
    BTWindowRequestClanHK(Controller.TopPage()).SetData(InviterCharname, Clanname, InviteMsg);
    BTWindowRequestClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowRequestClanHK_OnOK;
    BTWindowRequestClanHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowRequestClanHK_OnCancel;
    BTWindowRequestClanHK(Controller.TopPage()).ButtonSuspend.__OnClick__Delegate = BTWindowRequestClanHK_OnSuspend;
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnOK]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.Clanname, 0);
    Controller.TopPage().FadeOut(false, true);
    RefreshPage();
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnCancel]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.Clanname, 2);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool BTWindowRequestClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestClanHK_OnSuspend]");
    BTWindow = BTWindowRequestClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvClanInvite(BTWindow.InviterCharname, BTWindow.InviteMsg, BTWindow.Clanname, 1);
    Controller.CloseMenu(true);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
    //return;    
}

function bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    Log("[BTPageLobby::rfAckInviteClanResult]");
    // End:0x66
    if(int(Permit) == 0)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(43, CharName), 5, true);
        RefreshPage();        
    }
    else
    {
        // End:0x9E
        if(int(Permit) == 1)
        {
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(138, CharName), 5, true);            
        }
        else
        {
            // End:0xD7
            if(int(Permit) == 2)
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(44, CharName), 5, true);                
            }
            else
            {
                // End:0x10D
                if(int(Permit) == 3)
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(145, CharName), 5, true);
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckRecvClanInviteResult]");
    // End:0x52
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> Clanname, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    local export editinline BTWindowFindClanHK BTWindow;
    local int i;

    Log("[BTPageLobby::rfAckSearchClan]");
    // End:0x48
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    // End:0xDC
    if(BTWindow != none)
    {
        BTWindow.SetPageLimit(1, TotalPage);
        BTWindow.SetData(TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, Clanname, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    }
    return true;
    //return;    
}

function bool rfAckNotifyNewClanMember(string Clanname, string CharName)
{
    Log("[BTPageLobby::rfAckNotifyNewClanMember]");
    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(54, Clanname, CharName), 5, true);
    TPMessenger.UpdateFriendlyUser(2);
    return true;
    //return;    
}

function bool rfAckNotifyClanSecession(string Clanname, string CharName)
{
    Log("[BTPageLobby::rfAckNotifyClanSecession]");
    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(59, CharName, Clanname), 5, true);
    return true;
    //return;    
}

function bool rfReqRecvJoinClan(string CharName, string Message)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::rfReqRecvJoinClan]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowRequestApprovalClanHK");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    BTWindow.SetData(CharName, Message);
    BTWindow.__OnOK__Delegate = BTWindowRequestApprovalClanHK_OnOK;
    BTWindow.__OnCancel__Delegate = BTWindowRequestApprovalClanHK_OnCancel;
    BTWindow.ButtonSuspend.__OnClick__Delegate = BTWindowRequestApprovalClanHK_OnSuspend;
    bJoinClanState = true;
    page_Main.TcpChannel.sfReqDBCharInfo(CharName);
    return true;
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestApprovalClanHK_OnOK]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    // End:0xA1
    if(BTWindow != none)
    {
        page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.CharName, BTWindow.InviteMsg, 0);
        BTWindow.FadeOut(false, true);
    }
    RefreshPage();
    return true;
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestApprovalClanHK_OnCancel]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    // End:0xA5
    if(BTWindow != none)
    {
        page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.CharName, BTWindow.InviteMsg, 2);
        BTWindow.FadeOut(false, true);
    }
    return true;
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestApprovalClanHK_OnSuspend]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    // End:0xA5
    if(BTWindow != none)
    {
        page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.CharName, BTWindow.InviteMsg, 1);
        Controller.CloseMenu(true);
    }
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
    //return;    
}

function bool RefreshPage_OnOK(GUIComponent Sender)
{
    Controller.TopPage().FadeOut(false, true);
    RefreshPage();
    //return;    
}

function bool rfAckJoinClanResult(string Clanname, byte Permit, string PermitCharName)
{
    Log("[BTPageLobby::rfAckJoinClanResult]");
    // End:0x64
    if(int(Permit) == 0)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(43, PermitCharName), 5, true);
        RefreshPage();        
    }
    else
    {
        // End:0x9C
        if(int(Permit) == 1)
        {
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(137, PermitCharName), 5, true);            
        }
        else
        {
            // End:0xD5
            if(int(Permit) == 2)
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(44, PermitCharName), 5, true);                
            }
            else
            {
                // End:0x10B
                if(int(Permit) == 3)
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(145, PermitCharName), 5, true);
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckRecvJoinClanResult]");
    // End:0x50
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    Log("[BTPageLobby::rfAckChatWispher]");
    // End:0x5A
    if(Result == 252)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(76, ToCharName), 5, true);        
    }
    else
    {
        // End:0x91
        if(Result == 182)
        {
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(77, ToCharName), 5, true);            
        }
        else
        {
            // End:0xB5
            if(Result != 0)
            {
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    Log("[BTPageLobby::rfAckDeleteFriend]");
    // End:0x4A
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqFriendList();
    return true;
    //return;    
}

function bool rfReqRecvDeleteFriend(int Result, string FromCharName)
{
    Log("[BTPageLobby::rfReqRecvDeleteFriend]");
    // End:0x4E
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(75, FromCharName), 5, true);
    page_Main.TcpChannel.sfReqFriendList();
    return true;
    //return;    
}

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string Clanname, string CharName, byte CharGrade)
{
    Log("[BTPageLobby::rfAckAdjustClanMemberGrade]");
    // End:0x53
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xAF
    if(((int(CharGrade) == 1) && MM.IsClanGrade(1)) && MM.kUserName != CharName)
    {
        MM.kInClanGrade = 3;
        MM.UpdateCharInfoAndReqClanUserList();
    }
    // End:0xF5
    if(MM.kUserName == CharName)
    {
        MM.kInClanGrade = int(CharGrade);
        MM.UpdateCharInfo(MM);
    }
    RefreshPage();
    return true;
    //return;    
}

function bool rfAckNotifyAdjustClanMemberGrade(string Clanname, string CharName, byte CharGrade)
{
    Log("[BTPageLobby::rfAckNotifyAdjustClanMemberGrade]");
    // End:0x79
    if(MM.kUserName == CharName)
    {
        MM.kInClanGrade = int(CharGrade);
        MM.UpdateCharInfo(MM);
    }
    // End:0xBF
    if(int(CharGrade) != 5)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(55, CharName, strClanGrade[int(CharGrade)]), 5, true);        
    }
    else
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(58, CharName), 5, true);
    }
    RefreshPage();
    return true;
    //return;    
}

function UpdateRecv_ClanInfo(BTNetMainMenu MainMenu)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageLobby::UpdateRecv_ClanInfo]");
    // End:0x87
    if(bClanInviteState)
    {
        Log("bClanInviteState=On");
        BTWindow = BTWindowRequestClanHK(Controller.TopPage());
        BTWindow.SetClanInfo(MainMenu.kRecvClanInfo);
        bClanInviteState = false;
        return;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowClanInfoHK");
    BTWindowClanInfoHK(Controller.TopPage()).SetData(MainMenu.kRecvClanInfo);
    //return;    
}

function bool rfAckQuestGetAvailableEventList(int Result, string ErrMsg, array<int> QuestID)
{
    local int i;
    local wQuestParam q;
    local BtrDouble ClientTime;

    Log("[BTPageLobby::rfAckQuestGetAvailableEventList]");
    PlayerOwner().dblog("[BTPageLobby::rfAckQuestGetAvailableEventList]");
    // End:0x239
    if(Result == 0)
    {
        MM.AddQuestArray(QuestID);
        MM.NewQuestList.Length = 0;
        // End:0x1CE
        if(page_Main.bNewAvailableEventQuest)
        {
            ClientTime = GameMgr.GetClientTime(true);
            i = 0;
            J0xCE:

            // End:0x1CE [Loop If]
            if(i < MM.QuestList.Length)
            {
                q = GameMgr.GetQuestInfo(MM.QuestList[i].QuestID);
                // End:0x1C4
                if(q.IsEventQuest() && q.IsEnabledEventQuest(ClientTime))
                {
                    MM.NewQuestList[MM.NewQuestList.Length] = MM.QuestList[i].QuestID;
                    Log("[rfAckQuestGetAvailableEventList]QuestID : " $ string(MM.QuestList[i].QuestID));
                }
                ++i;
                // [Loop Continue]
                goto J0xCE;
            }
        }
        // End:0x225
        if(MM.NewQuestList.Length != 0)
        {
            page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowQuestInfoHK");
        }
        page_Main.bNewAvailableEventQuest = false;        
    }
    else
    {
        Log((("[rfAckQuestGetAvailableEventList Error(" $ string(Result)) $ "):") $ ErrMsg);
    }
    return true;
    //return;    
}

function bool IsEnterableRoom(bool bPass, int nUser, int nMaxUser)
{
    return !bPass && nUser < nMaxUser;
    //return;    
}

function bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    local int i;

    Log((("[BTPageLobby::rfAckChangedRoomTitle_FromGM] RoomNumber=" $ string(RoomNumber)) $ " NewRoomTitle=") $ NewRoomTitle);
    // End:0x83
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x8A:

    // End:0xF7 [Loop If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0xED
        if(ACLLobby.ACLRowList[i].DataPerColumn[1].IntValue == RoomNumber)
        {
            ACLLobby.ChangeRoomName(i, NewRoomTitle);
            // [Explicit Break]
            goto J0xF7;
        }
        i++;
        // [Loop Continue]
        goto J0x8A;
    }
    J0xF7:

    //return;    
}

function RoomPingRefresh()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x67 [Loop If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        page_Main.rMM.SendPingToOtherUser(ACLLobby.ACLRowList[i].DataPerColumn[10].strValue);
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function bool rfAckNotifyStartTutorial(int Result, int UserID)
{
    Log((("[BTPageLobby::rfAckNotifyStartTutorial] Result=" $ string(Result)) $ ", UserID=") $ string(UserID));
    // End:0x5F
    if(Result != 0)
    {
        return true;
    }
    TPMessenger.RemoveChannelUser(UserID);
    //return;    
}

function bool rfAckNotifyEndTutorial(int UserID, string CharName, int Level, string Clanname, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log((((("[BTPageLobby::rfAckNotifyEndTutorial] Result=" $ string(Result)) $ ", UserID=") $ string(UserID)) $ ", UserName=") $ CharName);
    // End:0x73
    if(Result != 0)
    {
        return true;
    }
    // End:0xF1
    if(TPMessenger.FindChannelUser(UserID) < 0)
    {
        TPMessenger.AddChannelUser(ClanMarkPattern, ClanMarkBG, ClanMarkBL, Clanname, Level, CharName, UserID, ClanGrade, ClanWin, ClanLose, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    }
    //return;    
}

function bool rfAckClanMatch_StartPublicWaitRoomList(int Result, string ErrMsg, int Count)
{
    Log((("[BTPageLobby::rfAckClanMatch_StartPublicWaitRoomList] Result=" $ string(Result)) $ ", Count=") $ string(Count));
    //return;    
}

function bool rfAckClanMatch_PublicWaitRoomList(array<int> WaitRoomIdx, array<string> LeaderName, array<string> RoomName, array<int> MapNum, array<int> CurUserCount, array<int> MaxUserCount, array<byte> Status)
{
    local int i;
    local string MapName;
    local array<wMapInfo> Maps;

    Log("[BTPageLobby::rfAckClanMatch_PublicWaitRoomList] WaitRoomIdx.Length=" $ string(WaitRoomIdx.Length));
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos();
    Log("================== Start List ==================================");
    i = 0;
    J0xCC:

    // End:0x248 [Loop If]
    if(i < WaitRoomIdx.Length)
    {
        MapName = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfoByMapNum(Maps, MapNum[i]).FriendlyName;
        Log((((((((((((("RoomNumber=" $ string(WaitRoomIdx[i])) $ ", LeaderName=") $ LeaderName[i]) $ ", RoomName=") $ RoomName[i]) $ ", MapName=") $ MapName) $ ", UCNT=") $ string(CurUserCount[i])) $ "/") $ string(MaxUserCount[i])) $ ", Status=") $ string(Status[i]));
        ACLLobby.AddRoomCW(WaitRoomIdx[i], LeaderName[i], RoomName[i], MapName, MapNum[i], CurUserCount[i], MaxUserCount[i], int(Status[i]));
        i++;
        // [Loop Continue]
        goto J0xCC;
    }
    Log("================== End List ===================================");
    return true;
    //return;    
}

function bool rfAckClanMatch_EndPublicWaitRoomList()
{
    Log("[BTPageLobby::rfAckClanMatch_EndPublicWaitRoomList]");
    //return;    
}

function bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, string RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic)
{
    local array<wMapInfo> Maps;
    local string MapName;

    Log("[BTPageLobby::rfAckClanMatch_PublicWaitRoomChanged] IsPublic=" $ string(IsPublic));
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos();
    MapName = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfoByMapNum(Maps, MapNum).FriendlyName;
    Log((((((((((("RoomNumber=" $ string(WaitRoomIdx)) $ ", RoomName=") $ RoomName) $ ", MapName=") $ MapName) $ ", UCNT=") $ string(CurUserCount)) $ "/") $ string(MaxUserCount)) $ ", Status=") $ string(Status));
    // End:0x17C
    if(int(IsPublic) > 0)
    {
        ACLLobby.AddRoomInteligenceCW(WaitRoomIdx, "", RoomName, MapName, MapNum, CurUserCount, MaxUserCount, int(Status));        
    }
    else
    {
        Log(("RemoveByGameNumberCW(" $ string(WaitRoomIdx)) $ ")");
        ACLLobby.RemoveByGameNumberCW(WaitRoomIdx);
    }
    return true;
    //return;    
}

defaultproperties
{
    strEnterRoomMessage="? ?? ?? ????..."
    strConnectingLogin="??? ??? ??????..."
    RefreshCycleTime[0]=10.0000000
    RefreshCycleTime[1]=10.0000000
    // Reference: BTOwnerDrawImageHK'GUIWarfare_Decompressed.BTPageLobby.mBGRoomList'
    begin object name="mBGRoomList" class=GUIWarfareControls.BTOwnerDrawImageHK
        AWinPos=(X1=10.0000000,Y1=87.0000000,X2=761.0000000,Y2=498.0000000)
        RenderWeight=0.0100000
        OnRendered=mBGRoomList.Internal_OnRendered
    end object
    BGRoomList=mBGRoomList
    // Reference: BTOwnerDrawImageHK'GUIWarfare_Decompressed.BTPageLobby.mBGImageAD2'
    begin object name="mBGImageAD2" class=GUIWarfareControls.BTOwnerDrawImageHK
        AWinPos=(X1=771.0000000,Y1=87.0000000,X2=1014.0000000,Y2=260.0000000)
        RenderWeight=0.0100000
        OnRendered=mBGImageAD2.Internal_OnRendered
    end object
    BGImageAD2=mBGImageAD2
    // Reference: TabControlMocker'GUIWarfare_Decompressed.BTPageLobby.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls.TabControlMocker
        OnVisiblePanelChanged=BTPageLobby.OnVisibleChannelListChanged
    end object
    TabControl=mTabControl
    // Reference: BTACLLobbyHK'GUIWarfare_Decompressed.BTPageLobby.mACLLobby'
    begin object name="mACLLobby" class=GUIWarfareControls.BTACLLobbyHK
        bUseAWinPos=true
        AWinPos=(X1=12.0000000,Y1=143.0000000,X2=745.0000000,Y2=456.0000000)
        OnRendered=mACLLobby.OnRendered
    end object
    ACLLobby=mACLLobby
    // Reference: BTACLLobbyHK'GUIWarfare_Decompressed.BTPageLobby.mACLLobbyEnterable'
    begin object name="mACLLobbyEnterable" class=GUIWarfareControls.BTACLLobbyHK
        bUseAWinPos=true
        AWinPos=(X1=12.0000000,Y1=143.0000000,X2=745.0000000,Y2=456.0000000)
        OnRendered=mACLLobbyEnterable.OnRendered
    end object
    ACLLobbyEnterable=mACLLobbyEnterable
    bAllRoomList=true
    // Reference: BTTPChatHK'GUIWarfare_Decompressed.BTPageLobby.mTPChat'
    begin object name="mTPChat" class=GUIWarfareControls.BTTPChatHK
        OnPostDraw=mTPChat.Internal_OnPostDraw
        bUseAWinPos=true
        AWinPos=(X1=10.0000000,Y1=504.0000000,X2=761.0000000,Y2=735.0000000)
        RenderWeight=0.4000000
        OnPreDraw=mTPChat.Internal_OnPreDraw
        OnDeActivate=mTPChat.Internal_DeActivate
    end object
    TPChat=mTPChat
    // Reference: BTTPMessengerHK'GUIWarfare_Decompressed.BTPageLobby.mTPMessenger'
    begin object name="mTPMessenger" class=GUIWarfareControls.BTTPMessengerHK
        OnPopupChannel=BTPageLobby.OnPopupChannel
        OnPopupFriend=BTPageLobby.OnPopupFriend
        OnPopupClan=BTPageLobby.OnPopupClan
        OnPopupPCBang=BTPageLobby.OnPopupPCBang
        OnPopupChannelCheck=BTPageLobby.OnPopupChannelCheck
        OnPopupFriendCheck=BTPageLobby.OnPopupFriendCheck
        OnPopupClanCheck=BTPageLobby.OnPopupClanCheck
        OnPopupPCBangCheck=BTPageLobby.OnPopupPCBangCheck
        bUseAWinPos=true
        AWinPos=(X1=771.0000000,Y1=267.0000000,X2=1014.0000000,Y2=498.0000000)
        RenderWeight=0.6000000
    end object
    TPMessenger=mTPMessenger
    // Reference: BTTPMyInfoHK'GUIWarfare_Decompressed.BTPageLobby.mTPMyInfo'
    begin object name="mTPMyInfo" class=GUIWarfareControls.BTTPMyInfoHK
        bUseAWinPos=true
        AWinPos=(X1=771.0000000,Y1=508.0000000,X2=1014.0000000,Y2=735.0000000)
        OnRendered=mTPMyInfo.OnRendered
    end object
    TPMyInfo=mTPMyInfo
    strDisconnectedChannel="??? ???? ??????. ?? ??????"
    strListTop[0]="SP"
    strListTop[1]="NO"
    strListTop[2]="??"
    strListTop[3]="???"
    strListTop[4]="?"
    strListTop[5]="?? ??"
    strListTop[6]="????"
    strListTop[7]="??"
    strListTop[8]="??"
    strListTop[9]="?"
    strListBottom[0]="? ???"
    strListBottom[1]="?? ??"
    strListBottom[2]="??"
    strListBottom[3]="??"
    strListBottom[4]="?? ???"
    strAllRoomList="???"
    ListTopChannelNamePosition=(X1=12.0000000,Y1=89.0000000,X2=758.0000000,Y2=115.0000000)
    ListTopButtonPosition[0]=(X1=12.0000000,Y1=116.0000000,X2=48.0000000,Y2=142.0000000)
    ListTopButtonPosition[1]=(X1=48.0000000,Y1=116.0000000,X2=84.0000000,Y2=142.0000000)
    ListTopButtonPosition[2]=(X1=84.0000000,Y1=116.0000000,X2=120.0000000,Y2=142.0000000)
    ListTopButtonPosition[3]=(X1=120.0000000,Y1=116.0000000,X2=363.0000000,Y2=142.0000000)
    ListTopButtonPosition[4]=(X1=363.0000000,Y1=116.0000000,X2=454.0000000,Y2=142.0000000)
    ListTopButtonPosition[5]=(X1=454.0000000,Y1=116.0000000,X2=545.0000000,Y2=142.0000000)
    ListTopButtonPosition[6]=(X1=545.0000000,Y1=116.0000000,X2=606.0000000,Y2=142.0000000)
    ListTopButtonPosition[7]=(X1=606.0000000,Y1=116.0000000,X2=657.0000000,Y2=142.0000000)
    ListTopButtonPosition[8]=(X1=657.0000000,Y1=116.0000000,X2=708.0000000,Y2=142.0000000)
    ListTopButtonPosition[9]=(X1=708.0000000,Y1=116.0000000,X2=758.0000000,Y2=142.0000000)
    ListBottomButtonPosition[0]=(X1=201.0000000,Y1=460.0000000,X2=322.0000000,Y2=492.0000000)
    ListBottomButtonPosition[1]=(X1=325.0000000,Y1=460.0000000,X2=445.0000000,Y2=492.0000000)
    ListBottomButtonPosition[2]=(X1=445.0000000,Y1=460.0000000,X2=506.0000000,Y2=492.0000000)
    ListBottomButtonPosition[3]=(X1=510.0000000,Y1=460.0000000,X2=631.0000000,Y2=492.0000000)
    ListBottomButtonPosition[4]=(X1=634.0000000,Y1=460.0000000,X2=755.0000000,Y2=492.0000000)
    strMakeClanWarRoom="??? ? ???"
    strRegularClanWar="?? ??? ? ???"
    strFriendlyClanWar="?? ??? ? ???"
    strButtonRegularClanWar="??? ??? ???"
    strButtonFriendlyClanWar="??? ???"
    fbButtonRegularClanWar=(X1=0.0000000,Y1=460.0000000,X2=100.0000000,Y2=492.0000000)
    fbButtonFriendlyClanWar=(X1=325.0000000,Y1=460.0000000,X2=506.0000000,Y2=492.0000000)
    fbTestButton=(X1=791.0000000,Y1=107.0000000,X2=994.0000000,Y2=157.0000000)
    OnOpen=BTPageLobby.InternalOnOpen
    OnReOpen=BTPageLobby.InternalOnReOpen
    OnClose=BTPageLobby.InternalOnClose
    OnPreDraw=BTPageLobby.Internal_OnPreDraw
    OnKeyType=BTPageLobby.InternalKeyType
    OnKeyEvent=BTPageLobby.internalKeyEvent
}