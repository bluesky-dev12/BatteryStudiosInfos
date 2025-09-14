/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageLobby.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:54
 *	Functions:171
 *
 *******************************************************************************/
class BTPageLobby extends BTNetQuestInfoPageHK
    dependson(BTNetQuestInfoPageHK)
    dependson(BTPageLobby_TcpLogin)
    dependson(BTPageLobby_TCP)
    dependson(BTRefreshTime)
    dependson(BTNuclearButtonHK)
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
var BTRefreshTime rfFriendPosTime;
var int TotalChannelUserCount;
var int TotalRoomCount;
var int RoomStartIndex;
var int RoomPingIndex;
var bool bJoinClanState;
var bool bClanInviteState;
var bool bGoBack;
var bool bGoTutorial;
var string SaveRoomPassword;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK BGRoomList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK BGImageAD2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify TabControlMocker TabControl;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTACLLobbyHK ACLLobby;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTACLLobbyHK ACLLobbyEnterable;
var bool bAllRoomList;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPChatHK TPChat;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPMessengerHK TPMessenger;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTTPMyInfoHK TPMyInfo;
var localized string strDisconnectedChannel;
var localized string strListTop[10];
var localized string strListBottom[5];
var localized string strAllRoomList;
var export editinline BTOwnerDrawCaptionButtonHK ListTopButton[10];
var export editinline BTOwnerDrawCaptionButtonHK ListBottomButton[5];
var export editinline BTOwnerDrawImageHK ListTopImage[10];
var FloatBox ListTopButtonPosition[10];
var FloatBox ListBottomButtonPosition[5];
var export editinline BTOwnerDrawCaptionButtonHK ButtonAD;
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
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTestButton;
var export editinline BTNuclearButtonHK TestButton;
var array<string> DelFriendsList;
var byte bQuickJoin;
var int MapIndex;
var int GameMode;
var int WRestrict;
var delegate<delegateAckEnterRoom> __delegateAckEnterRoom__Delegate;

delegate bool delegateAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3);
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
            // End:0x322
            break;
        // End:0x8a
        case 1:
            page_Main.SetPage(20, false);
            // End:0x322
            break;
        // End:0xa4
        case 2:
            page_Main.SetPage(21, false);
            // End:0x322
            break;
        // End:0xbe
        case 3:
            page_Main.SetPage(22, false);
            // End:0x322
            break;
        // End:0xd8
        case 4:
            page_Main.SetPage(18, false);
            // End:0x322
            break;
        // End:0x1f1
        case 5:
            // End:0x107
            if(MM.kClanName != "")
            {
                page_Main.SetPage(24, false);
            }
            // End:0x1ee
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x322
            break;
        // End:0x1f9
        case 6:
            // End:0x322
            break;
        // End:0x201
        case 7:
            // End:0x322
            break;
        // End:0x218
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x322
            break;
        // End:0x263
        case 9:
            Controller.LogMenuStack();
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x322
            break;
        // End:0x2e7
        case 10:
            // End:0x2e4
            if(bGoBack == false)
            {
                Log("page_Main.TcpChannel.sfReqLeaveChannel(" $ string(MM.kChannelID) $ ")");
                bGoBack = true;
                page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
            }
            // End:0x322
            break;
        // End:0x311
        case 12:
            Log("Cash Shop = " $ string(btn.ButtonID));
            // End:0x322
            break;
        // End:0x31f
        case 20:
            OpenTodayResultPage();
            // End:0x322
            break;
        // End:0xffff
        default:
            return true;
    }
}

function bool TopButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local int valueIndex;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    valueIndex = 0;
    switch(btn.ButtonID)
    {
        // End:0x2e
        case 0:
            // End:0x88
            break;
        // End:0x35
        case 1:
            // End:0x88
            break;
        // End:0x3d
        case 2:
            // End:0x88
            break;
        // End:0x4d
        case 3:
            valueIndex = 2;
            // End:0x88
            break;
        // End:0x5d
        case 4:
            valueIndex = 2;
            // End:0x88
            break;
        // End:0x6d
        case 5:
            valueIndex = 2;
            // End:0x88
            break;
        // End:0x75
        case 6:
            // End:0x88
            break;
        // End:0x7d
        case 7:
            // End:0x88
            break;
        // End:0x85
        case 8:
            // End:0x88
            break;
        // End:0xffff
        default:
            ACLLobby.SortBySelectLocation(btn.ButtonID, valueIndex, btn.Extra > 0);
            ACLLobbyEnterable.SortBySelectLocation(btn.ButtonID, valueIndex, btn.Extra > 0);
            // End:0x115
            if(btn.Extra > 0)
            {
                btn.Extra = 0;
            }
            // End:0x125
            else
            {
                btn.Extra = 1;
            }
            return true;
    }
}

function BTWindowCreateRoom GetWindowCreateRoom()
{
    return BTWindowCreateRoom(Controller.TopPage());
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
    // End:0x8e
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
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
}

function bool BTWindowFindClanHK_OnRequestJoin(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageLobby::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xf3
    if(ClanName != "none" && ClanName != "")
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
        BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(ClanName);
        BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
    }
    return true;
}

function bool BTWindowFindClanHK_OnInfo(GUIComponent Sender)
{
    local string ClanName;

    Log("[BTPageLobby::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8b
    if(ClanName != "none" && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageLobby::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageLobby::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xda
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;
    }
    // End:0x100
    else
    {
        Controller.CloseMenu(false);
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 62);
    }
    return true;
}

function bool BTWindowCreateClanHK_OnOK(GUIComponent Sender)
{
    local string ClanName, Intro, Keyword;
    local int Region;

    Log("[BTPageLobby::BTWindowCreateClanHK_OnOK]");
    // End:0x161
    if(BTWindowCreateClanHK(Controller.TopPage()).CheckDup())
    {
        ClanName = BTWindowCreateClanHK(Controller.TopPage()).ClanName.TextStr;
        Intro = BTWindowCreateClanHK(Controller.TopPage()).ClanIntroduction.TextStr;
        Keyword = BTWindowCreateClanHK(Controller.TopPage()).ClanKeyword.TextStr;
        Region = BTWindowCreateClanHK(Controller.TopPage()).ClanLocation.ComboBox.GetIndex();
        page_Main.SaveClanName = ClanName;
        page_Main.TcpChannel.sfReqCreateClan(ClanName, ClanName, Intro, Keyword, byte(Region));
        Controller.CloseMenu(false);
    }
    // End:0x177
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    Log("[BTPageLobby::BTWindowJoinClan_OK]");
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowCreateRoom_OnOK(GUIComponent Sender)
{
    local string filter;
    local int Capacity, TimeLimit;
    local GameModeInfo gmi;
    local GameRoomInfo NetRoomInfo;
    local export editinline BTWindowCreateRoom WindowCreateRoom;

    Log("[BTPageLobby::BTWindowCreateRoom_OnOK]");
    WindowCreateRoom = GetWindowCreateRoom();
    // End:0x5e
    if(MM.GMLevelFlag & 1 == 1 || WindowCreateRoom == none)
    {
        return true;
    }
    // End:0xaa
    if(WindowCreateRoom.GetGameModeIndex() == 8)
    {
        StartTutorial(WindowCreateRoom.GetMapName());
        page_Main.TcpChannel.sfReqChangeUserState(7, 0);
        return true;
    }
    // End:0x6d0
    else
    {
        filter = WindowCreateRoom.EditRoomName.GetText();
        Controller.ViewportOwner.Actor.Level.GameMgr.FilterBadWords(filter);
        // End:0x13a
        if(filter != WindowCreateRoom.EditRoomName.GetText())
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 103);
            return true;
        }
        Capacity = int(WindowCreateRoom.ComboCapacity.ComboBox.GetText());
        TimeLimit = int(WindowCreateRoom.comboTime.ComboBox.GetText());
        NetRoomInfo.RoomName = WindowCreateRoom.EditRoomName.GetText();
        // End:0x1d9
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
        // End:0x2cd
        if(NetRoomInfo.WeaponLimit == 2 || NetRoomInfo.WeaponLimit == 3 || NetRoomInfo.WeaponLimit >= 8 || NetRoomInfo.WeaponLimit <= 10)
        {
            NetRoomInfo.WeaponLimit = 7;
        }
        NetRoomInfo.MaxUserCnt = byte(Capacity);
        NetRoomInfo.IsTeamValance = byte(WindowCreateRoom.TeamBlanceRadioBtn.getData());
        // End:0x420
        if(class'wGameSettings'.static.IsBotModeIndex(NetRoomInfo.GameModeNum))
        {
            NetRoomInfo.PlayWithBots = 1;
            gmi = class'wGameSettings'.static.GetGameModeByIndex(NetRoomInfo.GameModeNum);
            NetRoomInfo.UserTeamNum = byte(WindowCreateRoom.GetBotModeUserTeam());
            NetRoomInfo.BotModeDifficulty = byte(gmi.BotDifficulty_Default);
            // End:0x3f2
            if(NetRoomInfo.GameModeNum == class'wGameSettings'.static.GetModeIndex_BotTeamDeath() || NetRoomInfo.GameModeNum == class'wGameSettings'.static.GetModeIndex_BotDomination())
            {
                NetRoomInfo.MaxAFUserAndBotNum = NetRoomInfo.MaxUserCnt;
                NetRoomInfo.MaxRSAUserAndBotNum = NetRoomInfo.MaxUserCnt;
            }
            // End:0x420
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
        NetRoomInfo.WeaponLimit = byte(WindowCreateRoom.GetWeaponLimit());
        MM.kGame_TeamBalance = WindowCreateRoom.TeamBlanceRadioBtn.getData();
        NetRoomInfo.BombHold = 1;
        // End:0x67a
        if(WindowCreateRoom.ReSpawnRadioBtn.getData() == false)
        {
            NetRoomInfo.ResponType = 1;
            MM.bSDRespawn = true;
        }
        // End:0x698
        else
        {
            MM.bSDRespawn = false;
            NetRoomInfo.ResponType = 0;
        }
        page_Main.TcpChannel.sfReqCreateGameRoom(NetRoomInfo);
        Controller.TopPage().FadeOut(false, true);
    }
    return true;
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
}

function bool WindowRequestFriend_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestFriendHK Window;
    local string friName;
    local int friID;

    Log("[BTPageLobby::WindowRequestFriend_OnOK]");
    Window = BTWindowRequestFriendHK(Controller.TopPage());
    Window.GetTopFriendInfo(friName, friID);
    Window.DelData();
    page_Main.TcpChannel.sfReqConfirmFriendInvite(friID, friName, 0);
    // End:0xb8
    if(Window.IsExistFrinedList() == true)
    {
        Window.UpdateData();
    }
    // End:0xd3
    else
    {
        Controller.TopPage().FadeOut(false, true);
    }
    return true;
}

function bool WindowRequestFriend_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestFriendHK Window;
    local string friName;
    local int friID;

    Log("[BTPageLobby::WindowRequestFriend_OnCancel]");
    Window = BTWindowRequestFriendHK(Controller.TopPage());
    Window.GetTopFriendInfo(friName, friID);
    Window.DelData();
    page_Main.TcpChannel.sfReqConfirmFriendInvite(friID, friName, 1);
    // End:0xbc
    if(Window.IsExistFrinedList() == true)
    {
        Window.UpdateData();
    }
    // End:0xd7
    else
    {
        Controller.TopPage().FadeOut(false, true);
    }
    return true;
}

function bool BTWindowInviteClan_OnOK(GUIComponent Sender)
{
    Log("[BTPageLobby::BTWindowInviteClan_OnOK]");
    page_Main.TcpChannel.sfReqInviteClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.TopPage().FadeOut(false, true);
    return true;
}

function bool QuickEnter_OnOK()
{
    // End:0x2f
    if(class'BTWindowQuickEnterRoomHK'.default.Map != 255)
    {
        MapIndex = class'BTWindowQuickEnterRoomHK'.default.Map - 1;
    }
    // End:0x43
    else
    {
        MapIndex = class'BTWindowQuickEnterRoomHK'.default.Map;
    }
    GameMode = class'BTWindowQuickEnterRoomHK'.default.GameMode;
    WRestrict = class'BTWindowQuickEnterRoomHK'.default.WeaponRestriction;
    // End:0xa0
    if(!ProcessQuickEnter(MapIndex, GameMode, WRestrict, -1))
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 151);
    }
    bQuickJoin = 1;
    return true;
}

function bool ProcessQuickEnter(int MapIndex, int GameMode, int WRestrict, int botLevel)
{
    local int i;
    local array<wMapInfo> MapInfos;
    local int MapID;

    MapInfos = MatchMaker.MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    PlayerOwner().dblog("WRestrict=" $ string(WRestrict));
    MapID = class'BTWindowQuickEnterRoomHK'.default.MapID;
    // End:0xcc
    if(MapIndex < 0)
    {
        // End:0xb8
        if(class'BTWindowQuickEnterRoomHK'.default.Map != 255)
        {
            MapIndex = class'BTWindowQuickEnterRoomHK'.default.Map - 1;
        }
        // End:0xcc
        else
        {
            MapIndex = class'BTWindowQuickEnterRoomHK'.default.Map;
        }
    }
    i = 0;
    J0xd3:
    // End:0x574 [While If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0x140
        if(float(ACLLobby.ACLRowList[i].DataPerColumn[6].IntValue) >= ACLLobby.ACLRowList[i].DataPerColumn[6].floatValue)
        {
        }
        // End:0x56a
        else
        {
            // End:0x16e
            if(ACLLobby.ACLRowList[i].DataPerColumn[2].IntValue > 0)
            {
            }
            // End:0x56a
            else
            {
                // End:0x1b3
                if(ACLLobby.ACLRowList[i].DataPerColumn[4].tempValue == 1 && MatchMaker.My_Level < 4)
                {
                }
                // End:0x56a
                else
                {
                    // End:0x1e7
                    if(MapIndex == 255 && GameMode == 255 && WRestrict == 0)
                    {
                        MoveToRoom(i);
                        return true;
                    }
                    // End:0x24a
                    if(MapIndex != 255 && GameMode == 255 && WRestrict == 0)
                    {
                        // End:0x24a
                        if(ACLLobby.ACLRowList[i].DataPerColumn[3].tempValue == MapID)
                        {
                            MoveToRoom(i);
                            return true;
                        }
                    }
                    // End:0x2ad
                    if(MapIndex == 255 && GameMode != 255 && WRestrict == 0)
                    {
                        // End:0x2ad
                        if(ACLLobby.ACLRowList[i].DataPerColumn[4].tempValue == GameMode)
                        {
                            MoveToRoom(i);
                            return true;
                        }
                    }
                    // End:0x310
                    if(MapIndex == 255 && GameMode == 255 && WRestrict != 0)
                    {
                        // End:0x310
                        if(ACLLobby.ACLRowList[i].DataPerColumn[5].IntValue == WRestrict)
                        {
                            MoveToRoom(i);
                            return true;
                        }
                    }
                    // End:0x3a4
                    if(MapIndex != 255 && GameMode != 255 && WRestrict == 0)
                    {
                        // End:0x3a4
                        if(ACLLobby.ACLRowList[i].DataPerColumn[4].tempValue == GameMode && ACLLobby.ACLRowList[i].DataPerColumn[3].tempValue == MapID)
                        {
                            MoveToRoom(i);
                            return true;
                        }
                    }
                    // End:0x438
                    if(MapIndex == 255 && GameMode != 255 && WRestrict != 0)
                    {
                        // End:0x438
                        if(ACLLobby.ACLRowList[i].DataPerColumn[4].tempValue == GameMode && ACLLobby.ACLRowList[i].DataPerColumn[5].IntValue == WRestrict)
                        {
                            MoveToRoom(i);
                            return true;
                        }
                    }
                    // End:0x4cc
                    if(MapIndex != 255 && GameMode == 255 && WRestrict != 0)
                    {
                        // End:0x4cc
                        if(ACLLobby.ACLRowList[i].DataPerColumn[5].IntValue == WRestrict && ACLLobby.ACLRowList[i].DataPerColumn[3].tempValue == MapID)
                        {
                            MoveToRoom(i);
                            return true;
                        }
                    }
                    // End:0x56a
                    if(ACLLobby.ACLRowList[i].DataPerColumn[3].tempValue == MapID && ACLLobby.ACLRowList[i].DataPerColumn[5].IntValue == WRestrict && ACLLobby.ACLRowList[i].DataPerColumn[4].tempValue == GameMode)
                    {
                        MoveToRoom(i);
                        return true;
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xd3;
    }
    return false;
}

function OnPopupChannelCheck(BTACLMessengerChannelHK acl, BTCMMessengerChannelHK cm)
{
    local int i;
    local string TargetUser;

    TargetUser = acl.GetUserName(acl.selectIndex);
    cm.ChangeStateByIndex(0, 0);
    i = 1;
    J0x3c:
    // End:0x68 [While If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    // End:0xb8
    if(TargetUser == MM.kUserName)
    {
        // End:0xb6
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
        }
        return;
    }
    // End:0xe5
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
    // End:0x196
    else
    {
        // End:0x196
        if(MM.IsClanMember() && MM.IsClanGrade(1) || MM.IsClanGrade(2))
        {
            cm.ChangeStateByIndex(5, 0);
        }
    }
    cm.ChangeStateByIndex(3, 0);
    // End:0x1d5
    if(!MM.IsBlockUser(TargetUser))
    {
        cm.ChangeStateByIndex(7, 0);
    }
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
        // End:0x7f
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x336
            break;
        // End:0x87
        case 2:
            // End:0x336
            break;
        // End:0xe0
        case 3:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x336
            break;
        // End:0x19d
        case 4:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteFriendHK");
            BTWindowInviteFriendHK(Controller.TopPage()).SetData(acl.GetUserName(acl.selectIndex), acl.GetUserID(acl.selectIndex));
            BTWindowInviteFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowInviteFriend_OnOK;
            // End:0x336
            break;
        // End:0x23b
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x336
            break;
        // End:0x2f6
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
        // End:0xffff
        default:
}

function OnPopupFriendCheck(BTACLMessengerFriendHK acl, BTCMMessengerFriendHK cm)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x33 [While If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    cm.SetLogOnState(acl.GetLogOnState(acl.selectIndex));
    // End:0x1d7
    if(acl.GetLogOnState(acl.selectIndex) > 0)
    {
        // End:0xcb
        if(rfFriendPosTime.CheckCondition())
        {
            page_Main.TcpChannel.sfReqFriendPosition(acl.GetUserName(acl.selectIndex), 3);
        }
        cm.ChangeStateByIndex(0, 0);
        // End:0x13e
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
            // End:0x13b
            if(MM.IsClanMember() == false)
            {
                cm.ChangeStateByIndex(6, 0);
            }
        }
        // End:0x18e
        else
        {
            // End:0x18e
            if(MM.IsClanMember() && MM.IsClanGrade(1) || MM.IsClanGrade(2))
            {
                cm.ChangeStateByIndex(5, 0);
            }
        }
        cm.ChangeStateByIndex(2, 0);
        // End:0x1d7
        if(acl.GetCurPosInt(acl.selectIndex) >= 1)
        {
            cm.ChangeStateByIndex(3, 0);
        }
    }
    cm.ChangeStateByIndex(7, 0);
}

function OnPopupFriend(int ContextMenuIndex, BTACLMessengerFriendHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x3f6
            break;
        // End:0x7f
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x3f6
            break;
        // End:0xd8
        case 2:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x3f6
            break;
        // End:0x21d
        case 3:
            // End:0x21a
            if(page_Main.CheckMoveToChannel(page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))))
            {
                page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            }
            // End:0x3f6
            break;
        // End:0x225
        case 4:
            // End:0x3f6
            break;
        // End:0x2c3
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x3f6
            break;
        // End:0x37e
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x3f6
            break;
        // End:0x3f3
        case 7:
            DelFriendsList.Length = 1;
            DelFriendsList[0] = acl.GetUserName(acl.selectIndex);
            class'BTWindowDefineSelectHK'.static.ShowInfo(Controller, 23, DelFriendsList[0]);
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineSelectHK_23_OnOK;
            // End:0x3f6
            break;
        // End:0xffff
        default:
}

function OnPopupClanCheck(BTACLMessengerClanHK acl, BTCMMessengerClanHK cm)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x33 [While If]
    if(i < 5)
    {
        cm.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    cm.SetLogOnState(acl.GetLogOnState(acl.selectIndex));
    // End:0x138
    if(acl.GetLogOnState(acl.selectIndex) > 0)
    {
        cm.ChangeStateByIndex(0, 0);
        cm.ChangeStateByIndex(1, 0);
        cm.ChangeStateByIndex(2, 0);
        // End:0xef
        if(acl.GetCurPosInt(acl.selectIndex) >= 1)
        {
            cm.ChangeStateByIndex(3, 0);
        }
        // End:0x138
        if(rfFriendPosTime.CheckCondition())
        {
            page_Main.TcpChannel.sfReqFriendPosition(acl.GetUserName(acl.selectIndex), 2);
        }
    }
}

function OnPopupClan(int ContextMenuIndex, BTACLMessengerClanHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x1a1
            break;
        // End:0x70
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(MM.kClanName);
            // End:0x1a1
            break;
        // End:0xc9
        case 2:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x1a1
            break;
        // End:0x196
        case 3:
            page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            // End:0x1a1
            break;
        // End:0x19e
        case 4:
            // End:0x1a1
            break;
        // End:0xffff
        default:
}

function OnPopupBanCheck(BTACLMessengerBanHK acl, BTCMMessengerBanHK cm)
{
    cm.ChangeStateByIndex(0, 0);
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
        // End:0xffff
        default:
}

function OnPopupPCBangCheck(BTACLMessengerPCBangHK acl, BTCMMessengerPCBangHK cm)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x33 [While If]
    if(i < 8)
    {
        cm.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x162
    if(acl.GetCurPos(acl.selectIndex) != 0)
    {
        cm.ChangeStateByIndex(0, 0);
        // End:0xc9
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
            // End:0xc6
            if(MM.IsClanMember() == false)
            {
                cm.ChangeStateByIndex(6, 0);
            }
        }
        // End:0x119
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
}

function OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl)
{
    switch(ContextMenuIndex)
    {
        // End:0x43
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x381
            break;
        // End:0x7f
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x381
            break;
        // End:0xd8
        case 2:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x381
            break;
        // End:0x21d
        case 3:
            // End:0x21a
            if(page_Main.CheckMoveToChannel(page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))))
            {
                page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            }
            // End:0x381
            break;
        // End:0x225
        case 4:
            // End:0x381
            break;
        // End:0x2c3
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x381
            break;
        // End:0x37e
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x381
            break;
        // End:0xffff
        default:
}

function bool OnBottomButton_Click(GUIComponent Sender)
{
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
        // End:0xd0
        case 2:
            Controller.OpenMenu("GUIWarfareControls.BTWindowQuickEnterRoomHK");
            BTWindow = BTWindowHK(Controller.TopPage());
            // End:0x189
            break;
        // End:0x10c
        case 3:
            // End:0xf5
            if(bAllRoomList)
            {
                MoveToRoom(ACLLobby.LastSelectedIndexHistory);
            }
            // End:0x109
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
            // End:0x16f
            if(bAllRoomList)
            {
                btn.Caption = strListBottom[4];
            }
            // End:0x183
            else
            {
                btn.Caption = strAllRoomList;
            }
            // End:0x189
            break;
        // End:0xffff
        default:
            return true;
    }
}

function OpenBTWindowCreateRoom()
{
    Controller.OpenMenu("GUIWarfareControls.BTWindowCreateRoom");
    GetWindowCreateRoom().__OnOK__Delegate = BTWindowCreateRoom_OnOK;
    GetWindowCreateRoom().SetRandomRoomName();
}

function bool ButtonFriendlyClanWar_OnClick(GUIComponent Sender)
{
    Log("[BTPageLobby::ButtonFriendlyClanWar_OnClick]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowCreateRoom");
    GetWindowCreateRoom().__OnOK__Delegate = BTWindowCreateRoom_OnOK;
    GetWindowCreateRoom().SetTitleCaption(strMakeClanWarRoom);
    GetWindowCreateRoom().SetRandomRoomName();
    return true;
}

function bool ButtonRegularClanWar_OnClick(GUIComponent Sender)
{
    Log("[BTPageLobby::ButtonRegularClanWar_OnClick]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowCreateRoom");
    GetWindowCreateRoom().__OnOK__Delegate = BTWindowCreateRoom_OnOK;
    GetWindowCreateRoom().SetTitleCaption(strMakeClanWarRoom);
    GetWindowCreateRoom().SetRandomRoomName();
    return true;
}

function bool BTWindowDefineSelectHK_23_OnOK(GUIComponent Sender)
{
    page_Main.TcpChannel.sfReqDeleteFriend(DelFriendsList);
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    Log("[BTPageLobby::rfAckClanMatch_GetReady]");
    // End:0x50
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kClanMatch_InReadyRoom = true;
    MM.kClanMatch_ReadyRoomID = RoomIndex;
    page_Main.EndAutoMove();
    page_Main.SetPage(26, false);
    return true;
}

function bool rfAckClanMatch_Join(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckClanMatch_Join]");
    // End:0x4c
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    MM.kClanMatch_InReadyRoom = true;
    page_Main.EndAutoMove();
    page_Main.SetPage(26, false);
    return true;
}

function bool rfAckEnterRoom_AfterCreateRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
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
        // End:0x79
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
        // End:0x13d
        if(MM.kUID == OwnerID)
        {
            MM.kGame_bOwner = true;
        }
        // End:0x14e
        else
        {
            MM.kGame_bOwner = false;
        }
        MM.PI_EnterRoom(GameNum, TeamNum);
        UnInitializeDelegate();
        page_Main.SetPage(10, true);
    }
    // End:0x19b
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckEnterRoom_AfterJoinRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageLobby::rfAckEnterRoom_AfterJoinRoom]");
    // End:0x16f
    if(Result == 0)
    {
        // End:0x66
        if(MM.kUID == OwnerID)
        {
            MM.bIsOwner = true;
        }
        // End:0x77
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
        // End:0x12a
        if(MM.kUID == OwnerID)
        {
            MM.kGame_bOwner = true;
        }
        // End:0x13b
        else
        {
            MM.kGame_bOwner = false;
        }
        MM.PI_EnterRoom(GameNum, TeamNum);
        UnInitializeDelegate();
        page_Main.SetPage(10, true);
    }
    // End:0x188
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool BTWindowPasswordHK_OnOK(GUIComponent Sender)
{
    Log("[BTPageLobby::BTWindowPasswordHK_OnOK]");
    SaveRoomPassword = BTWindowPasswordHK(Controller.TopPage()).EditPass.TextStr;
    page_Main.EndAutoMove();
    class'BTWindowStateHK'.static.ShowWindow(Controller, strEnterRoomMessage $ string(MM.kRoomID));
    page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
    __delegateAckEnterRoom__Delegate = rfAckEnterRoom_AfterJoinRoom;
    return true;
}

function bool BTWindowPasswordHK_OnCancel(GUIComponent Sender)
{
    MM.PI_LeavelRoom();
    page_Main.EndAutoMove();
    return true;
}

function bool OnLobby_DblClick(GUIComponent Sender)
{
    Log("[BTPageLobby::OnLobby_DblClick]");
    // End:0x43
    if(bAllRoomList)
    {
        MoveToRoom(ACLLobby.LastSelectedIndex);
    }
    // End:0x57
    else
    {
        MoveToRoom(ACLLobbyEnterable.LastSelectedIndex);
    }
    return true;
}

function bool AutoMoveToRoom(int RoomNum, optional string Password)
{
    local export editinline BTWindowPasswordHK winPass;
    local int RoomIndex;

    Log("[BTPageLobby::AutoMoveToRoom]");
    Log("[BTPageLobby::AutoMoveToRoom]" $ " RoomNum=" $ string(RoomNum));
    page_Main.iRoomNum = RoomNum;
    MM.kRoomID = RoomNum;
    // End:0x9a
    if(Password != "")
    {
        SaveRoomPassword = Password;
    }
    // End:0xa2
    else
    {
        SaveRoomPassword = "";
    }
    RoomIndex = ACLLobby.FindRoomNo(RoomNum);
    // End:0x18c
    if(Password == "" && RoomIndex >= 0 && ACLLobby.ACLRowList[RoomIndex].DataPerColumn[2].IntValue == 1)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowPasswordHK");
        winPass = BTWindowPasswordHK(Controller.TopPage());
        winPass.SetData();
        winPass.__OnOK__Delegate = BTWindowPasswordHK_OnOK;
        winPass.__OnCancel__Delegate = BTWindowPasswordHK_OnCancel;
    }
    // End:0x1e8
    else
    {
        class'BTWindowStateHK'.static.ShowWindow(Controller, strEnterRoomMessage $ string(MM.kRoomID));
        page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
        __delegateAckEnterRoom__Delegate = rfAckEnterRoom_AfterJoinRoom;
    }
    return true;
}

function bool AutoMoveToClanReadyRoom(int RoomNum, optional string Password)
{
    Log("[BTPageLobby::AutoMoveToClanReadyRoom]");
    MM.kClanMatch_InReadyRoom = true;
    MM.kClanMatch_ReadyRoomID = RoomNum;
    page_Main.TcpChannel.sfReqClanMatch_Join(RoomNum);
    return true;
}

function bool AutoMoveReturnClanReadyRoom(int RoomNum, optional string Password)
{
    Log("[BTPageLobby::AutoMoveReturnClanReadyRoom]");
    MM.kClanMatch_InReadyRoom = true;
    MM.kClanMatch_ReadyRoomID = RoomNum;
    page_Main.EndAutoMove();
    page_Main.SetPage(26, false);
    return true;
}

function bool MoveToRoom(int Index)
{
    local BTAutoColumnListDataHK Data;

    Log("[BTPageLobby::MoveToRoom]");
    // End:0x2a
    if(Index < 0)
    {
        return true;
    }
    // End:0x50
    if(bAllRoomList)
    {
        Data = ACLLobby.GetRowByIndex(Index);
    }
    // End:0x6a
    else
    {
        Data = ACLLobbyEnterable.GetRowByIndex(Index);
    }
    // End:0x77
    if(Data == none)
    {
        return true;
    }
    Log("[BTPageLobby::MoveToRoom] RoomNum=(" $ string(Data.DataPerColumn[1].IntValue) $ ", " $ string(Data.DataPerColumn[11].IntValue) $ ")");
    // End:0x274
    if(Data.DataPerColumn[11].IntValue == 0)
    {
        page_Main.iRoomNum = Data.DataPerColumn[1].IntValue;
        MM.kRoomID = Data.DataPerColumn[1].IntValue;
        // End:0x215
        if(MM.GMLevelFlag & 3 == 0 && Data.DataPerColumn[2].IntValue == 1)
        {
            Controller.OpenMenu("GUIWarfareControls.BTWindowPasswordHK");
            BTWindowPasswordHK(Controller.TopPage()).SetData();
            BTWindowPasswordHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPasswordHK_OnOK;
            BTWindowPasswordHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowPasswordHK_OnCancel;
        }
        // End:0x271
        else
        {
            class'BTWindowStateHK'.static.ShowWindow(Controller, strEnterRoomMessage $ string(MM.kRoomID));
            page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
            __delegateAckEnterRoom__Delegate = rfAckEnterRoom_AfterJoinRoom;
        }
    }
    // End:0x367
    else
    {
        // End:0x2d8
        if(MM.GMLevelFlag & 3 == 0 && MM.kClanName == "" || MM.kClanName == "none")
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 187);
            return true;
        }
        MM.kClanMatch_ReadyRoomID = Data.DataPerColumn[11].IntValue;
        Log("page_Main.TcpChannel.sfReqClanMatch_Join(" $ string(MM.kClanMatch_ReadyRoomID) $ ")");
        page_Main.TcpChannel.sfReqClanMatch_Join(MM.kClanMatch_ReadyRoomID);
    }
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local Color orange;
    local Image img, onImg, cliImg;

    orange = class'Canvas'.static.MakeColor(byte(255), 140, 63, byte(255));
    super.InitComponent(MyController, myOwner);
    BGRoomList.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    BGImageAD2.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_1;
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    MyController.ResetFocus();
    ACLLobby.MultiColumnList.__OnDblClick__Delegate = OnLobby_DblClick;
    ACLLobbyEnterable.MultiColumnList.__OnDblClick__Delegate = OnLobby_DblClick;
    img = class'BTUIResourcePoolHK'.default.img_input_x;
    img = class'BTUIResourcePoolHK'.default.img_list_divid;
    i = 0;
    J0x127:
    // End:0x289 [While If]
    if(i < 9)
    {
        ListTopImage[i] = new class'BTOwnerDrawImageHK';
        ListTopImage[i].bUseAWinPos = true;
        ListTopImage[i].AWinPos.X1 = ListTopButtonPosition[i].X2 - float(2);
        ListTopImage[i].AWinPos.Y1 = ListTopButtonPosition[i].Y1 + float(5);
        ListTopImage[i].AWinPos.X2 = ListTopButtonPosition[i].X2 + float(2);
        ListTopImage[i].AWinPos.Y2 = ListTopButtonPosition[i].Y2 - float(5);
        ListTopImage[i].BackgroundImage = img;
        ListTopImage[i].RenderWeight = 0.190;
        ListTopImage[i].InitComponent(Controller, self);
        AppendComponent(ListTopImage[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x127;
    }
    img = class'BTUIResourcePoolHK'.default.butt_list_n;
    ListTopImage[9] = new class'BTOwnerDrawImageHK';
    ListTopImage[9].bUseAWinPos = true;
    ListTopImage[9].AWinPos.X1 = ListTopButtonPosition[0].X1;
    ListTopImage[9].AWinPos.Y1 = ListTopButtonPosition[0].Y1;
    ListTopImage[9].AWinPos.X2 = ListTopButtonPosition[9].X2;
    ListTopImage[9].AWinPos.Y2 = ListTopButtonPosition[9].Y2;
    ListTopImage[9].BackgroundImage = img;
    ListTopImage[9].RenderWeight = 0.10;
    ListTopImage[9].InitComponent(Controller, self);
    AppendComponent(ListTopImage[9]);
    onImg = class'BTUIResourcePoolHK'.default.butt_list_on;
    cliImg = class'BTUIResourcePoolHK'.default.butt_list_cli;
    i = 0;
    J0x3d4:
    // End:0x565 [While If]
    if(i < 10)
    {
        ListTopButton[i] = new class'BTOwnerDrawCaptionButtonHK';
        ListTopButton[i].bUseAWinPos = true;
        ListTopButton[i].AWinPos = ListTopButtonPosition[i];
        ListTopButton[i].buttonImage[1] = onImg;
        ListTopButton[i].buttonImage[3] = cliImg;
        ListTopButton[i].RenderWeight = 0.20;
        ListTopButton[i].SetDefaultListTopButtonFontColor();
        ListTopButton[i].Caption = strListTop[i];
        ListTopButton[i].CaptionDrawType = 4;
        ListTopButton[i].ButtonID = i;
        ListTopButton[i].Extra = 0;
        ListTopButton[i].__OnClick__Delegate = TopButton_OnClick;
        ListTopButton[i].CaptionPadding[3] = 2;
        ListTopButton[i].InitComponent(Controller, self);
        AppendComponent(ListTopButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3d4;
    }
    ListTopButton[9].CaptionPadding[2] = 5;
    img = class'BTCustomDrawHK'.static.MakeImage(64, 32, 15, none);
    i = 0;
    J0x59f:
    // End:0x6f3 [While If]
    if(i < 5)
    {
        ListBottomButton[i] = new class'BTOwnerDrawCaptionButtonHK';
        ListBottomButton[i].bUseAWinPos = true;
        ListBottomButton[i].AWinPos = ListBottomButtonPosition[i];
        ListBottomButton[i].SetDefaultButtonImage();
        ListBottomButton[i].SetDefaultBigButtonFontColor();
        ListBottomButton[i].SetFontSizeAll(12);
        ListBottomButton[i].RenderWeight = 0.90;
        ListBottomButton[i].Caption = strListBottom[i];
        ListBottomButton[i].CaptionDrawType = 4;
        ListBottomButton[i].ButtonID = i;
        ListBottomButton[i].__OnClick__Delegate = OnBottomButton_Click;
        ListBottomButton[i].InitComponent(Controller, self);
        AppendComponent(ListBottomButton[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x59f;
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
    // End:0x81f
    if(MM != none)
    {
        MM.SendPingToChannelServer();
    }
    LabelRoomName.ClipArea.X1 = 0.0;
    LabelRoomName.ClipArea.Y1 = 240.0;
    LabelRoomName.ClipArea.X2 = 280.0;
    LabelRoomName.ClipArea.Y2 = 288.0;
    i = 0;
    J0x88a:
    // End:0x8d0 [While If]
    if(i < TPMessenger.ButtonMsg.Length)
    {
        TPMessenger.ButtonMsg[i].__OnClick__Delegate = TPMessenger_ButtonMsg_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x88a;
    }
    ACLLobby.__OnHitBottom__Delegate = ACLLobby_OnHitBottom;
    TPMessenger.ACLMsg[TPMessenger.0].__OnHitBottom__Delegate = TPMessenger_ACLMsg0_OnHitBottom;
    TestButton = BTNuclearButtonHK(NewComponent(new class'BTNuclearButtonHK', fbTestButton));
    TestButton.__OnCoreClick__Delegate = TestButton_OnClick;
    TestButton.SetVisibility(false);
    MapIndex = class'BTWindowQuickEnterRoomHK'.default.Map;
}

function bool TestButton_OnClick(GUIComponent Sender)
{
    return true;
}

function ACLLobby_OnHitBottom(int Top, int Count, int itemperpage);
function TPMessenger_ACLMsg0_OnHitBottom(int Top, int Count, int itemperpage)
{
    TPMessenger.ACLMsg[TPMessenger.0].MultiColumnList.MyScrollBar.MyGripButton.MenuState = 0;
    // End:0xb1
    if(TPMessenger_ACLMsg0_OnHitBottom_LastTime + 0.10 < PlayerOwner().Level.TimeSeconds)
    {
        page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, Top, 30);
        TPMessenger_ACLMsg0_OnHitBottom_LastTime = PlayerOwner().Level.TimeSeconds;
    }
}

function bool TPMessenger_ButtonMsg_OnClick(GUIComponent Sender)
{
    local int Count, StartTop;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x151
        case 0:
            Count = 6 * 3;
            StartTop = TPMessenger.ACLMsg[TPMessenger.0].MultiColumnList.Top - 6;
            // End:0x86
            if(StartTop < 0)
            {
                Count += StartTop;
                StartTop = 0;
            }
            // End:0x10a
            if(TPMessenger.ACLMsg[TPMessenger.0].MultiColumnList.Top + 6 * 2 > TotalChannelUserCount)
            {
                Count += TotalChannelUserCount - TPMessenger.ACLMsg[TPMessenger.0].MultiColumnList.Top + 6 * 2;
            }
            // End:0x11e
            if(Count < 6)
            {
                Count = 6;
            }
            page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, StartTop, Count);
            // End:0x1be
            break;
        // End:0x170
        case 1:
            page_Main.TcpChannel.sfReqFriendList();
            // End:0x1be
            break;
        // End:0x1b3
        case 2:
            // End:0x1b0
            if(MM.kClanName != "")
            {
                page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
            }
            // End:0x1be
            break;
        // End:0x1bb
        case 3:
            // End:0x1be
            break;
        // End:0xffff
        default:
            TPMessenger.TabControl.SetVisiblePanel(btn.ButtonID);
            return true;
    }
}

function bool Internal_OnPreDraw(Canvas C)
{
    local float CurrentTime;
    local int StartTop, Count;
    local export editinline BTWindowHK BTWindow;

    super(BTNetGUIPageHK).Internal_OnPreDraw(C);
    // End:0x6f
    if(ACLLobby.tT != none)
    {
        ACLLobby.tT.bOverlapControl = QuestInfo.bVisible;
        ACLLobbyEnterable.tT.bOverlapControl = QuestInfo.bVisible;
    }
    // End:0x7a
    if(bStopRefresh)
    {
        return false;
    }
    // End:0x9d
    if(page_Main.page_curr != page_Main.page_Lobby2)
    {
        return false;
    }
    // End:0xb4
    if(page_Main.bConnectedChannelServer == false)
    {
        return false;
    }
    // End:0x13f
    if(page_Main.pwm.IsAvailable() && page_Main.pwm.ListLen(7) > 0)
    {
        BTWindow = BTWindowHK(Controller.TopPage());
        // End:0x13f
        if(BTWindow == none)
        {
            Controller.OpenMenuByObject(page_Main.pwm.Pop(7));
        }
    }
    CurrentTime = PlayerOwner().Level.TimeSeconds;
    // End:0x2d4
    if(CurrentTime - LastRefreshTime[0] > RefreshCycleTime[0])
    {
        // End:0x2c7
        if(TPMessenger.TabControl.CurrentTabIndex == TPMessenger.0)
        {
            Count = 6 * 3;
            StartTop = TPMessenger.ACLMsg[TPMessenger.0].MultiColumnList.Top - 6;
            // End:0x1ff
            if(StartTop < 0)
            {
                Count += StartTop;
                StartTop = 0;
            }
            // End:0x283
            if(TPMessenger.ACLMsg[TPMessenger.0].MultiColumnList.Top + 6 * 2 > TotalChannelUserCount)
            {
                Count += TotalChannelUserCount - TPMessenger.ACLMsg[TPMessenger.0].MultiColumnList.Top + 6 * 2;
            }
            // End:0x297
            if(Count < 6)
            {
                Count = 6;
            }
            page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, StartTop, Count);
        }
        LastRefreshTime[0] = CurrentTime;
    }
    rfFriendPosTime.Update(PlayerOwner().Level.AppDeltaTime);
    return false;
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageLobby_TCP TCP;

    TCP = new class'BTPageLobby_TCP';
    TCP.Owner = self;
    return TCP;
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageLobby_TcpLogin TCP;

    TCP = new class'BTPageLobby_TcpLogin';
    TCP.Owner = self;
    return TCP;
}

function TcpLogin_OnConnect(int ErrCode)
{
    Log("[BTPageLobby::TcpLogin_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x18e
    if(ErrCode == 0)
    {
        // End:0xe1
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0xa1
            if(page_Main.TcpLogin == none)
            {
                Log("page_Main.TcpLogin is none");
            }
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
        }
        // End:0x18b
        else
        {
            Log("[BTPageLobby::TcpLogin_OnConnect] (" $ page_Main.szAccountName $ ", " $ page_Main.szLoginPassword $ ", " $ page_Main.AuthLogin_GUID $ ")");
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
        }
    }
    // End:0x1ce
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
}

function bool ForceDisconnect_OnOK(GUIComponent Sender)
{
    Log("[BTPageLobby::ForceDisconnect_OnOK]");
    page_Main.TcpLogin.sfReqProcessPreLoginUser(MM.kUserName, 0);
    Controller.CloseMenu(false);
    return true;
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageLobby::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log("[BTPageLobby::rfAckLoginInHouseTest] Sucess=" $ string(Sucess) $ " CharName=" $ CharName $ " " $ string(TimeStamp) $ " " $ string(LoginHash1) $ " " $ string(LoginHash2) $ " " $ string(LoginHash3) $ " " $ string(LoginHash4) $ " " $ string(LoginHash5) $ " " $ string(NeedChar) $ " " $ ErrMsg);
    bGoBack = false;
    // End:0x275
    if(Sucess == 0)
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
        // End:0x1d4
        if(NeedChar == 0)
        {
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name : NULL");
            page_Main.SetPage(4, true);
        }
        // End:0x272
        else
        {
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            page_Main.rMM.PI_LeaveChannel();
            UnInitializeDelegate();
            page_Main.SetPage(5, true);
        }
    }
    // End:0x456
    else
    {
        // End:0x2f1
        if(Sucess == 50)
        {
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            page_Main.TcpLogin.sfReqProcessPreLoginUser(page_Main.rMM.kUserName, 0);
        }
        // End:0x456
        else
        {
            // End:0x33a
            if(Sucess == 1)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
            }
            // End:0x456
            else
            {
                // End:0x384
                if(Sucess == 2)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                }
                // End:0x456
                else
                {
                    // End:0x3ce
                    if(Sucess == 3)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                    }
                    // End:0x456
                    else
                    {
                        // End:0x418
                        if(Sucess == 15)
                        {
                            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                        // End:0x456
                        else
                        {
                            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Sucess);
                            BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                    }
                }
            }
        }
    }
    return true;
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckProcessPreLoginUser] Result=" $ string(Result));
    // End:0x85
    if(Result > 1)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    // End:0xf2
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
    }
    // End:0x134
    else
    {
        page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    }
    return true;
}

function InternalOnReOpen()
{
    UnresolvedNativeFunction_97("BTPageLobby::InternalOnReOpen()");
    Log("[BTPageLobby::InternalOnReOpen] Start");
    super.InternalOnReOpen();
    switch(TPMessenger.TabControl.CurrentTabIndex)
    {
        // End:0x7f
        case TPMessenger.0:
            // End:0xdc
            break;
        // End:0x9d
        case TPMessenger.1:
            UpdateFriendList(MatchMaker);
            // End:0xdc
            break;
        // End:0xbb
        case TPMessenger.2:
            UpdateClanList(MatchMaker);
            // End:0xdc
            break;
        // End:0xd9
        case TPMessenger.3:
            UpdatePCBangList(MatchMaker);
            // End:0xdc
            break;
        // End:0xffff
        default:
            Log("[BTPageLobby::InternalOnReOpen] End");
}

function ShowTutorialWindow()
{
    Log("[BTPageLobby::ShowTutorialWindow]");
    class'BTWindowDefineARHK'.static.ShowInfo(Controller, 43);
    BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineARHK_43;
    BTWindowDefineARHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowDefineARHK_43;
}

function bool BTWindowDefineARHK_43(GUIComponent Sender)
{
    Log("[BTPageLobby::BTWindowDefineARHK_43]");
    bGoTutorial = false;
    Controller.CloseMenu(false);
    StartTutorial();
    return true;
}

function StartTutorial(optional string Map)
{
    class'BTWindowDefineStateHK'.static.ShowState(Controller, 2);
    // End:0x3b
    if(Map == "")
    {
        Map = "TUT-BasicTraining";
    }
    Controller.ConsoleCommand("tutorial " $ Map);
}

function bool BTWindowDefineARHK_22_OnOK(GUIComponent Sender)
{
    local bool bTrue;

    bTrue = true;
    PlayerOwner().ConsoleCommand("SETCONFIG_BOOL Graphics UseGore" @ string(bTrue));
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowDefineARHK_22_OnCancel(GUIComponent Sender)
{
    local bool bFalse;

    bFalse = false;
    PlayerOwner().ConsoleCommand("SETCONFIG_BOOL Graphics UseGore" @ string(bFalse));
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowDefineARHK_45_OnOK(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("SETCONFIG_STRING sound VoiceLanguage native");
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowDefineARHK_45_OnCancel(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("SETCONFIG_STRING sound VoiceLanguage foreign");
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowDefineARHK_46_OnOK(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("SETCONFIG_BOOL Controll UseAdvCamShake" @ string(true));
    Controller.ViewportOwner.Actor.Level.GameMgr.bUseAdvCamShake = true;
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowDefineARHK_46_OnCancel(GUIComponent Sender)
{
    PlayerOwner().ConsoleCommand("SETCONFIG_BOOL Controll UseAdvCamShake" @ string(false));
    Controller.ViewportOwner.Actor.Level.GameMgr.bUseAdvCamShake = false;
    Controller.CloseMenu(false);
    return true;
}

function InternalOnOpen()
{
    super.InternalOnOpen();
    UnresolvedNativeFunction_97("BTPageLobby::InternalOnOpen()");
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
    SetTimer(3.0, false, 'RoomPingRefresh');
    ACLLobbyEnterable.SetVisibility(!bAllRoomList);
    // End:0x170
    if(page_Main.rMM.kInterfaceGuideStep == 1)
    {
        ListBottomButton[1].SetFlicker(true);
    }
    // End:0x182
    else
    {
        ListBottomButton[1].SetFlicker(false);
    }
    // End:0x1b0
    if(ACLLobby.ACLRowList.Length > 0)
    {
        ACLLobby.tT.SelectedIndex = 0;
    }
}

function OnBackToLastPage()
{
    Log("[BTPageLobby::OnBackToLastPage] Start");
    RefreshPage();
    page_Main.KeepMoving();
    QuestInfo.SetVisibility(false);
    Log("[BTPageLobby::OnBackToLastPage] End");
    page_Main.TcpChannel.sfReqChangeUserState(0, 0);
}

function OnCompleteOpened()
{
    local export editinline BTWindowDefineARHK BTWindow;

    Log("[BTPageLobby::OnCompleteOpened] Start");
    RefreshPage();
    page_Main.KeepMoving();
    QuestInfo.SetVisibility(false);
    // End:0x127
    if(page_Main.rMM.kCharacterCreation)
    {
        bGoTutorial = true;
        page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineARHK", true, 0);
        BTWindow = BTWindowDefineARHK(page_Main.pwm.Last(7));
        BTWindow.SetContentText_Instance(43);
        BTWindow.__OnOK__Delegate = BTWindowDefineARHK_43;
        BTWindow.__OnCancel__Delegate = BTWindowDefineARHK_43;
        // End:0x127
        if(class'LevelInfo'.default.bTeenVersion == false)
        {
        }
    }
    PlayerOwner().ConsoleCommand("SETCONFIG_BOOL Controll UseAdvCamShake" @ string(false));
    Controller.ViewportOwner.Actor.Level.GameMgr.bUseAdvCamShake = false;
    // End:0x226
    if(PlayerOwner().Level.bTeenVersion == true)
    {
        PlayerOwner().Level.GameMgr.bUseGore = false;
        PlayerOwner().ConsoleCommand("SETCONFIG_BOOL Graphics UseGore" @ string(PlayerOwner().Level.GameMgr.bUseGore));
    }
    page_Main.rMM.bExistUseAdvCamShake = true;
    page_Main.rMM.kCharacterCreation = false;
    page_Main.TcpChannel.sfReqChangeUserState(0, 0);
    Log("[BTPageLobby::OnCompleteOpened] End");
}

function UpdateCharInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateCharInfo]");
    TPMyInfo.SetMyInfoA(MM.kUserName, MM.kLevel, MM.kExp, MM.kStartExp, MM.kEndExp, MM.kLevelMarkID);
}

function UpdateClanInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateClanInfo]");
    TPMyInfo.SetClanInfo(MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, MM.kClanLevel);
    TPMessenger.ReplaceMyClanName(byte(TPMessenger.TabControl.CurrentTabIndex), MM.kUserName, MM.kClanName);
}

function UpdateRankingInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateRankingInfo]");
    TPMyInfo.SetRankingInfo(MM.kRanking, MM.kWin, MM.kLose);
}

function UpdateEquipItemInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateEquipItemInfo]");
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateMoneyInfo]");
    TPMyInfo.SetMoneyInfo(MM.kPoint, MM.kCash);
}

function UpdateRecv_CharInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateRecv_CharInfo]");
    SetCharacterInfo(page_Main.MyClanName, page_Main.MyCharInfo);
}

function UpdatePCBangInfo(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdatePCBangInfo]");
    TPMessenger.UpdatePCBangInfo();
}

function UpdatePositionInfo(wMatchMaker MM);
function UpdateQuestList(wMatchMaker MM);
function UpdateFriendList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageLobby::UpdateFriendList]");
    TPMessenger.SavePos(TPMessenger.1);
    TPMessenger.RemoveAll(TPMessenger.1);
    i = 0;
    J0x5e:
    // End:0x288 [While If]
    if(i < MM.kFriendList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kFriendList[i].ClanName, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, true, MM.kFriendList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kFriendList[i].ClanName, MM.kFriendList[i].ClanLevel);
        TPMessenger.AddFriendUser(MM.kFriendList[i].UserName, MM.kFriendList[i].IsLogOn, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, MM.kFriendList[i].ClanName, MM.kFriendList[i].Level, MM.kFriendList[i].ClanGrade, byte(MM.kFriendList[i].IsLookForClan), MM.kFriendList[i].ClanLevel, MM.kFriendList[i].LevelMarkID);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5e;
    }
    TPMessenger.LoadPos(TPMessenger.1);
    TPMessenger.UpdateFriendlyUser(TPMessenger.1);
}

function UpdateClanList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageLobby::UpdateClanList]");
    TPMessenger.SavePos(TPMessenger.2);
    TPMessenger.RemoveAll(TPMessenger.2);
    i = 0;
    J0x5c:
    // End:0x187 [While If]
    if(i < MM.kClanList.Length)
    {
        // End:0xa4
        if(MM.kClanList[i].UserName == MM.My_szName)
        {
        }
        // End:0x17d
        else
        {
            TPMessenger.AddClanUser(MM.kClanList[i].UserName, MM.kClanList[i].IsLogOn, MM.kClanList[i].Level, MM.kClanList[i].ClanGrade, MM.kClanList[i].ClanWin, MM.kClanList[i].ClanLose, MM.kClanList[i].LevelMarkID, MM.kClanList[i].TitleMarkID);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    TPMessenger.LoadPos(TPMessenger.2);
    TPMessenger.UpdateFriendlyUser(TPMessenger.2);
}

function UpdatePCBangList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageLobby::UpdatePCBangList]");
    TPMessenger.SavePos(TPMessenger.3);
    TPMessenger.RemoveAll(TPMessenger.3);
    i = 0;
    J0x5e:
    // End:0x3b6 [While If]
    if(i < MM.kPCBangList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kPCBangList[i].ClanName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, true, MM.kPCBangList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kPCBangList[i].ClanName, MM.kPCBangList[i].ClanLevel);
        TPMessenger.AddPCBangUser(MM.kPCBangList[i].UserName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, MM.kPCBangList[i].ClanName, MM.kPCBangList[i].Level, MM.kPCBangList[i].ServerShortName, MM.kPCBangList[i].ServerIP, MM.kPCBangList[i].serverPort, MM.kPCBangList[i].CurPos, MM.kPCBangList[i].ChannelNum, MM.kPCBangList[i].ChannelNickName, MM.kPCBangList[i].GameRoomNum, MM.kPCBangList[i].ClanGrade, MM.kPCBangList[i].ClanWin, MM.kPCBangList[i].ClanLose, byte(MM.kPCBangList[i].IsLookForClan), MM.kPCBangList[i].ClanLevel, MM.kPCBangList[i].LevelMarkID, MM.kPCBangList[i].TitleMarkID, MM.kPCBangList[i].Reserved1, MM.kPCBangList[i].Reserved2, MM.kPCBangList[i].Reserved3);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5e;
    }
    TPMessenger.LoadPos(TPMessenger.3);
    TPMessenger.UpdateFriendlyUser(TPMessenger.3);
}

function UpdateBlockList(wMatchMaker MM)
{
    Log("[BTPageLobby::UpdateBlockList]");
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageLobby::UpdateItemList]");
}

function UpdateWebzenItemList(wGameManager GameMgr)
{
    Log("[BTPageLobby::UpdateWebzenItemList]");
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
    // End:0x14d
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
    // End:0x1f6
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
    // End:0x27f
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
    MM.szSeverName = page_Main.ServerName;
    MM.szChannelGroup = page_Main.ServerGroupName;
    MM.szChannelName = page_Main.ChannelName;
    TPMessenger.RemoveAll(TPMessenger.0);
    Log("page_main.TcpChannel.sfReqRoomList(" $ string(MM.kChannelID) $ ", 0, 30 )");
    page_Main.TcpChannel.sfReqRoomList(MM.kChannelID, 0, 30);
    // End:0x617
    if(MM.kClanMatch_InChannel)
    {
        Log("page_main.TcpChannel.sfReqClanMatch_GetPublicWaitRoomList()");
        page_Main.TcpChannel.sfReqClanMatch_GetPublicWaitRoomList();
    }
    Log("page_main.TcpChannel.sfReqChannelUserList(" $ string(MM.kChannelID) $ ", 0, 30 )");
    page_Main.TcpChannel.sfReqChannelUserList(MM.kChannelID, 0, 30);
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
}

function BTPageLobby_OnReceivedPing(wMatchMaker MM, string fromAddr, int msec)
{
    Log("[BTPageLobby::BTPageLobby_OnReceivedPing] fromAddr=" $ fromAddr $ " msec=" $ string(msec));
    ACLLobby.SetRoomPingStatus(fromAddr, msec);
}

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageLobby::InternalOnClose()");
    Log("[BTPageLobby::InternalOnClose]");
    Controller.PopPage();
    OnClose(bCanceled);
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    // End:0x27
    if(key == 13)
    {
        TPChat.InputBox.FocusFirst(none);
    }
    return true;
}

function bool InternalKeyType(out byte key, optional string Unicode)
{
    // End:0x27
    if(key == 13)
    {
        TPChat.InputBox.FocusFirst(none);
    }
    return true;
}

function OnVisibleChannelListChanged(int Index);
function ClearChatLog()
{
    TPChat.ClearAll();
}

function NormalChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatNormal());
}

function ClanChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatClan());
    TPChat.AddChatHistory(2, cL, class'BTUIColorPoolHK'.static.ChatClan());
}

function WhisperChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatWhisper());
    TPChat.AddChatHistory(1, cL, class'BTUIColorPoolHK'.static.ChatWhisper());
}

function SelfChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatSelf());
}

function SystemChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(1, cL, class'BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(2, cL, class'BTUIColorPoolHK'.static.ChatSystem());
}

function BroadCastItemChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatBroadCastItem());
}

function TeamChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatTeam());
}

function bool rfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    Log("[BTPageLobby::rfAckCreateGameRoom] UserID=" $ string(UserID) $ " MM.kUID=" $ string(MM.kUID));
    // End:0x604
    if(Result == 0)
    {
        // End:0x478
        if(UserID == MM.kUID)
        {
            Log("[BTPageLobby::rfAckCreateGameRoom] in to the room");
            MM.szRoomName = NetRoomInfo.RoomName;
            MM.szMapName = NetRoomInfo.MapName;
            MM.iMaxPlayers = NetRoomInfo.MaxUserCnt;
            MM.szGameClass = class'wGameSettings'.static.GetGameModeByIndex(NetRoomInfo.GameModeNum).ClassName;
            MM.eWeaponLimit = NetRoomInfo.WeaponLimit;
            MM.iGoalRound = NetRoomInfo.GameRound;
            MM.iTimeLimit = NetRoomInfo.GameMinute;
            page_Main.iRoomNum = NetRoomInfo.RoomNumber;
            MM.PlayWithBots = NetRoomInfo.PlayWithBots > 0;
            MM.BotUserTeam = NetRoomInfo.UserTeamNum;
            MM.BotDifficulty = NetRoomInfo.BotModeDifficulty;
            MM.BotNum0 = NetRoomInfo.MaxAFUserAndBotNum;
            MM.BotNum1 = NetRoomInfo.MaxRSAUserAndBotNum;
            MM.bMultiBomb = true;
            MM.SD_ChangeAttackTeam = true;
            MM.SD_ChangeRound = 3;
            MM.kRoomID = NetRoomInfo.RoomNumber;
            MM.RI_Clear();
            // End:0x2a5
            if(NetRoomInfo.RoomOwner == MM.kUserName)
            {
                MM.kGame_bOwner = true;
            }
            // End:0x2b6
            else
            {
                MM.kGame_bOwner = false;
            }
            MM.kGame_RoomName = NetRoomInfo.RoomName;
            MM.kGame_Password = NetRoomInfo.Password;
            MM.kGame_MapNum = NetRoomInfo.MapNum;
            MM.kGame_MapName = NetRoomInfo.MapName;
            MM.kGame_GameMode = NetRoomInfo.GameModeNum;
            MM.kGame_UserCount = NetRoomInfo.MaxUserCnt;
            MM.kGame_GameTime = NetRoomInfo.GameMinute;
            MM.kGame_GameRound = NetRoomInfo.GameRound;
            MM.kGame_WeaponLimit = NetRoomInfo.WeaponLimit;
            // End:0x3c5
            if(NetRoomInfo.IsHardCore != 0)
            {
                MM.kGame_bHardCore = true;
            }
            // End:0x3d6
            else
            {
                MM.kGame_bHardCore = false;
            }
            // End:0x3fc
            if(NetRoomInfo.IsTeamValance != 0)
            {
                MM.kGame_TeamBalance = true;
            }
            // End:0x40d
            else
            {
                MM.kGame_TeamBalance = false;
            }
            // End:0x433
            if(NetRoomInfo.ResponType == 1)
            {
                MM.bSDRespawn = true;
            }
            // End:0x444
            else
            {
                MM.bSDRespawn = false;
            }
            __delegateAckEnterRoom__Delegate = rfAckEnterRoom_AfterCreateRoom;
            page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
        }
        // End:0x601
        else
        {
            // End:0x49e
            if(NetRoomInfo.ResponType == 1)
            {
                MM.bSDRespawn = true;
            }
            // End:0x4af
            else
            {
                MM.bSDRespawn = false;
            }
            Log("[BTPageLobby::rfAckCreateGameRoom] Just add room list");
            ACLLobby.AddRoom(0, NetRoomInfo.RoomNumber, NetRoomInfo.IsPassword, NetRoomInfo.RoomName, NetRoomInfo.MapName, NetRoomInfo.MapNum, NetRoomInfo.GameModeNum, NetRoomInfo.WeaponLimit, 1, NetRoomInfo.MaxUserCnt, 0, 0, RoomOwnerIP, NetRoomInfo.GameMinute, NetRoomInfo.IsTeamValance, NetRoomInfo.RoomOwner, NetRoomInfo.BotModeDifficulty, NetRoomInfo.UserTeamNum);
            // End:0x5e4
            if(IsEnterableRoom(bool(NetRoomInfo.IsPassword), 1, NetRoomInfo.MaxUserCnt))
            {
                ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[ACLLobby.ACLRowList.Length - 1]);
            }
            page_Main.rMM.SendPingToOtherUser(RoomOwnerIP);
        }
    }
    // End:0x61d
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageLobby::rfAckEnterChannel]" $ " ID=" $ string(id) $ " UID=" $ string(UID) $ " UserID=" $ UserID $ " Level=" $ string(Level));
    // End:0x101
    if(Result == 0)
    {
        // End:0xf8
        if(UserID != MM.kUserName)
        {
            TPMessenger.AddChannelUser(ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, Level, UserID, UID, ClanGrade, ClanWin, ClanLose, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
        }
        // End:0xfe
        else
        {
            RefreshPage();
        }
    }
    // End:0x15b
    else
    {
        page_Main.EndAutoMove();
        Controller.PopPage();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = LobbyToServerSelection_OnOK;
    }
    return true;
}

function bool LobbyToServerSelection_OnOK(GUIComponent Sender)
{
    Log("[BTPageLobby::LobbyToServerSelection_OnOK]");
    LobbyToServerSelection();
    return true;
}

function bool LobbyToServerSelection()
{
    class'BTWindowDefineStateHK'.static.ShowState(Controller, 7);
    Log("[BTPageLobby::LobbyToServerSelection]");
    Log("[BTPageLobby::LobbyToServerSelection] (" $ page_Main.szAccountName $ ", " $ page_Main.szLoginPassword $ ", " $ page_Main.AuthLogin_GUID $ ")");
    page_Main.rMM.ClearReceivedPingHK();
    // End:0x132
    if(MM.IsUsingTenProtect)
    {
        Log("[BTPageLobby::LobbyToServerSelection] release TenProtect");
        MM.TenProtectStopLocalCheck();
        MM.TenProtectRelease();
    }
    // End:0x16f
    else
    {
        Log("[BTPageLobby::LobbyToServerSelection] not used TenProtect");
    }
    // End:0x199
    if(BTWindowStateHK(Controller.TopPage()) != none)
    {
        Controller.CloseMenu(false);
    }
    MM.kClanMatch_InChannel = false;
    page_Main.ChannelToLogin(page_Main.szLoginServerIP, page_Main.szLoginServerPort);
    return true;
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    local SystemMsgParam MsgInfo;

    Log("[BTPageLobby::rfAckLeaveChannel]");
    // End:0x1b2
    if(Result == 0)
    {
        // End:0x16b
        if(UID == MM.kUID)
        {
            Log("if ( UID == MM.kUID)");
            bStopRefresh = true;
            // End:0x120
            if(bGoBack)
            {
                MsgInfo.MsgCode = 6;
                MsgInfo.CharName = UserID;
                page_Main.TcpChannel.sfReqSendSystemMsg(1, UserID, "", MsgInfo);
                Log("page_Main.TcpChannel.sfReqSendSystemMsg(1, " $ UserID $ ", , msginfo) MsgCode=6");
                page_Main.TcpChannel.sfReqLogOut(3);
            }
            // End:0x168
            else
            {
                page_Main.rMM.ClearReceivedPingHK();
                page_Main.TcpChannel.sfReqEnterRoom(MM.kRoomID, SaveRoomPassword, bQuickJoin);
            }
        }
        // End:0x1af
        else
        {
            Log("TPMessenger.RemoveChannelUser(" $ string(UID) $ ")");
            TPMessenger.RemoveChannelUser(UID);
        }
    }
    // End:0x222
    else
    {
        MM.PI_LeaveChannel();
        MM.PI_LeavelRoom();
        page_Main.EndAutoMove();
        // End:0x209
        if(BTWindowStateHK(Controller.TopPage()) != none)
        {
            Controller.CloseMenu(false);
        }
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageLobby::rfAckEnterRoom]");
    bQuickJoin = 0;
    // End:0xa5
    if(Result == 0)
    {
        delegateAckEnterRoom(GameNum, OwnerID, UID, UserID, TeamNum, Grade, UserIP, ClanName, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    }
    // End:0x20f
    else
    {
        // End:0xcf
        if(BTWindowStateHK(Controller.TopPage()) != none)
        {
            Controller.CloseMenu(false);
        }
        page_Main.TcpChannel.sfReqEnterChannel(MM.kChannelID);
        // End:0x1d8
        if(Result == 151 && page_Main.bAutoMove == true)
        {
            page_Main.EndAutoMove();
            MM.kRoomID = GameNum;
            Controller.OpenMenu("GUIWarfareControls.BTWindowPasswordHK");
            BTWindowPasswordHK(Controller.TopPage()).SetData();
            BTWindowPasswordHK(Controller.TopPage()).__OnOK__Delegate = BTWindowPasswordHK_OnOK;
            BTWindowPasswordHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowPasswordHK_OnCancel;
        }
        // End:0x20f
        else
        {
            MM.PI_LeavelRoom();
            page_Main.EndAutoMove();
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    __delegateAckEnterRoom__Delegate = None;
    return true;
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
}

function bool rfAckRoomList(array<int> GameNum, array<string> Title, array<string> MapName, array<int> MapNum, array<byte> UserCount, array<byte> MaxCount, array<string> ModeName, array<int> ModeNum, array<byte> WeaponLimit, array<byte> IsTeamBalance, array<byte> Status, array<string> RoomOwnerIP, array<int> GameMinute, array<string> RoomOwnerName, array<byte> IsSpecial, array<byte> IsPassword, array<byte> BotDifficult, array<byte> BotModeUserTeamNum)
{
    local int i, GameRoomIndex;

    Log("[BTPageLobby::rfAckRoomList] Title.Length=" $ string(Title.Length) $ ", BotDifficult=" $ string(BotDifficult.Length));
    i = 0;
    J0x5c:
    // End:0x39b [While If]
    if(i < GameNum.Length)
    {
        Log("Title[" $ string(i) $ "]=" $ Title[i] $ ", BotDifficult=" $ string(BotDifficult[i]));
        GameRoomIndex = ACLLobby.FindRoomNo(GameNum[i]);
        // End:0x254
        if(GameRoomIndex >= 0)
        {
            ACLLobby.ReplaceRoom(GameRoomIndex, IsSpecial[i], GameNum[i], IsPassword[i], Title[i], MapName[i], MapNum[i], ModeNum[i], WeaponLimit[i], UserCount[i], MaxCount[i], Status[i], 0, RoomOwnerIP[i], GameMinute[i], IsTeamBalance[i], RoomOwnerName[i], BotDifficult[i], BotModeUserTeamNum[i]);
            // End:0x237
            if(IsEnterableRoom(bool(IsPassword[i]), UserCount[i], MaxCount[i]))
            {
                // End:0x234
                if(ACLLobbyEnterable.FindRoomNo(GameNum[i]) < 0)
                {
                    ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[GameRoomIndex]);
                }
            }
            // End:0x251
            else
            {
                ACLLobbyEnterable.RemoveByGameNumber(GameNum[i]);
            }
        }
        // End:0x391
        else
        {
            ACLLobby.AddRoom(IsSpecial[i], GameNum[i], IsPassword[i], Title[i], MapName[i], MapNum[i], ModeNum[i], WeaponLimit[i], UserCount[i], MaxCount[i], Status[i], 0, RoomOwnerIP[i], GameMinute[i], IsTeamBalance[i], RoomOwnerName[i], BotDifficult[i], BotModeUserTeamNum[i]);
            // End:0x391
            if(IsEnterableRoom(bool(IsPassword[i]), UserCount[i], MaxCount[i]))
            {
                ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[ACLLobby.ACLRowList.Length - 1]);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    // End:0x4bf
    if(page_Main.EnterBotMode)
    {
        Log("[BTPageLobby::rfAckRoomList] enter bot mode");
        page_Main.EnterBotMode = false;
        // End:0x43f
        if(ProcessQuickEnter(-1, 11, -1, 1))
        {
            Log("[BTPageLobby::rfAckRoomList] enter bot mode - success");
        }
        // End:0x4bf
        else
        {
            Log("[BTPageLobby::rfAckRoomList] enter bot mode - fail, let's create a room");
            page_Main.CreateBotMode = true;
            OpenBTWindowCreateRoom();
            GetWindowCreateRoom().SetGameModeByExtraDataIndex(11);
            BTWindowCreateRoom_OnOK(GetWindowCreateRoom());
        }
    }
    return true;
}

function TryEnterBotMode()
{
    // End:0x12a
    if(page_Main.EnterBotMode)
    {
        Log("[BTPageLobby::TryEnterBotMode] enter bot mode");
        page_Main.EnterBotMode = false;
        // End:0xa8
        if(ProcessQuickEnter(-1, 11, -1, 1))
        {
            Log("[BTPageLobby::TryEnterBotMode] enter bot mode - success");
        }
        // End:0x12a
        else
        {
            Log("[BTPageLobby::TryEnterBotMode] enter bot mode - fail, let's create a room");
            page_Main.CreateBotMode = true;
            OpenBTWindowCreateRoom();
            GetWindowCreateRoom().SetGameModeByExtraDataIndex(11);
            BTWindowCreateRoom_OnOK(GetWindowCreateRoom());
        }
    }
}

function bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, array<int> UID, array<string> UserID, array<int> UserLevels, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, int Result, string ErrMsg, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    Log("[BTPageLobby::rfAckChannelUserList]");
    TotalChannelUserCount = TotalCount;
    // End:0x346
    if(Result == 0)
    {
        i = 0;
        J0x44:
        // End:0x2bb [While If]
        if(i < UID.Length)
        {
            GameMgr.cmm.AddClanMark(ClanName[i], ClanPattern[i], ClanBG[i], ClanBL[i], true, IsLookForClan[i] > 0);
            GameMgr.cmm.SetClanLevel(ClanName[i], ClanLevel[i]);
            // End:0x1e7
            if(TPMessenger.ACLMsg[TPMessenger.0].ACLRowList.Length > i + StartIndex)
            {
                TPMessenger.ReplaceChannelUser(i + StartIndex, ClanPattern[i], ClanBG[i], ClanBL[i], ClanName[i], UserLevels[i], UserID[i], UID[i], ClanGrade[i], ClanWin[i], ClanLose[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
            }
            // End:0x2b1
            else
            {
                TPMessenger.AddChannelUser(ClanPattern[i], ClanBG[i], ClanBL[i], ClanName[i], UserLevels[i], UserID[i], UID[i], ClanGrade[i], ClanWin[i], ClanLose[i], IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x44;
        }
        // End:0x343
        if(TPMessenger.ACLMsg[TPMessenger.0].ACLRowList.Length > TotalCount)
        {
            TPMessenger.ACLMsg[TPMessenger.0].RemoveRowArray(TotalCount, TPMessenger.ACLMsg[TPMessenger.0].ACLRowList.Length - TotalCount);
        }
    }
    // End:0x384
    else
    {
        Log("[BTPageLobby::rfAckChannelUserList] Error Result=" $ string(Result));
    }
    return true;
}

function bool rfAckGameRoomDestroy(int GameRoomNum)
{
    Log("[BTPageLobby::rfAckGameRoomDestroy]" $ " gameRoomNum=" $ string(GameRoomNum));
    ACLLobby.RemoveByGameNumber(GameRoomNum);
    ACLLobbyEnterable.RemoveByGameNumber(GameRoomNum);
    return true;
}

function SetCharacterInfo(string ClanName, CharInfo btCharInfo)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageLobby::SetCharacterInfo]");
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    // End:0x255
    if(MyStatus != none)
    {
        MyStatus.ClanName = ClanName;
        MyStatus.Level = btCharInfo.Level;
        MyStatus.nExp = btCharInfo.Exp;
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
}

function bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    local int i;

    Log("[BTPageLobby::rfReqExteriorRoomInfo]" $ " SP=" $ string(SP) $ " RoomNum=" $ string(RoomNumber) $ " RoomName=" $ RoomName $ " Map=" $ MapName $ " IsTeamBalance=" $ string(IsTeamBalance) $ ", WeaponLimit=" $ string(WeaponLimit));
    i = 0;
    J0xb2:
    // End:0x1c6 [While If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0x1bc
        if(ACLLobby.ACLRowList[i].DataPerColumn[0].IntValue == RoomNumber)
        {
            ACLLobby.ChangeRoomInfo(i, RoomName, MapName, MapNum, ModeNum, IsTeamBalance, RoomUserCount, MaxUserCount, RoomState, IsPW, BotDifficult, WeaponLimit, BotModeUserTeamNum);
            // End:0x1a5
            if(IsEnterableRoom(bool(IsPW), RoomUserCount, MaxUserCount))
            {
                // End:0x1a2
                if(ACLLobbyEnterable.FindRoomNo(RoomNumber) < 0)
                {
                    ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[i]);
                }
            }
            // End:0x1b9
            else
            {
                ACLLobbyEnterable.RemoveByGameNumber(RoomNumber);
            }
        }
        // End:0x1c6
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xb2;
        }
    }
    return true;
}

function bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount)
{
    local int i;

    Log("[BTPageLobby::rfReqExteriorRoomUserCount]" $ " RoomNum=" $ string(RoomNumber) $ " RoomuserCount=" $ string(RoomUserCount));
    i = 0;
    J0x66:
    // End:0x183 [While If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0x179
        if(ACLLobby.ACLRowList[i].DataPerColumn[0].IntValue == RoomNumber)
        {
            ACLLobby.ChangeRoomUserCount(i, RoomUserCount);
            // End:0x162
            if(IsEnterableRoom(bool(ACLLobby.ACLRowList[i].DataPerColumn[2].IntValue), RoomUserCount, int(ACLLobby.ACLRowList[i].DataPerColumn[7].floatValue)))
            {
                // End:0x15f
                if(ACLLobbyEnterable.FindRoomNo(RoomNumber) < 0)
                {
                    ACLLobbyEnterable.AddRow(ACLLobby.ACLRowList[i]);
                }
            }
            // End:0x176
            else
            {
                ACLLobbyEnterable.RemoveByGameNumber(RoomNumber);
            }
        }
        // End:0x183
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x66;
        }
    }
    return true;
}

function bool rfReqExteriorRoomState(int RoomNumber, byte RoomState)
{
    local int i;

    Log("[BTPageLobby::rfReqExteriorRoomState]" $ " RoomNumber=" $ string(RoomNumber) $ " RoomState=" $ string(RoomState));
    i = 0;
    J0x61:
    // End:0xd0 [While If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0xc6
        if(ACLLobby.ACLRowList[i].DataPerColumn[0].IntValue == RoomNumber)
        {
            ACLLobby.ChangeRoomState(i, RoomState);
        }
        // End:0xd0
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x61;
        }
    }
    return true;
}

function bool rfReqExteriorRoomOwnerInfo(int RoomNum, string OwnerName, string OwnerIP)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x79 [While If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0x6f
        if(ACLLobby.ACLRowList[i].DataPerColumn[0].IntValue == RoomNum)
        {
            ACLLobby.ChangeRoomOwnerInfo(i, OwnerName, OwnerIP);
        }
        // End:0x79
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x07;
        }
    }
    page_Main.rMM.SendPingToOtherUser(OwnerIP);
    return true;
}

function bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckSendFriendInvite]");
    // End:0x76
    if(Result == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(202, BTWindowInviteFriendHK(Controller.TopPage()).FriendName), 5, true);
    }
    // End:0x8f
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    Log("[BTPageLobby::rfReqRecvFriendInvite]");
    // End:0xf3
    if(BTWindowRequestFriendHK(Controller.TopPage()) == none)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowRequestFriendHK");
        BTWindowRequestFriendHK(Controller.TopPage()).SetData(ReqCharname, ReqUserID, InviteMsg);
        BTWindowRequestFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowRequestFriend_OnOK;
        BTWindowRequestFriendHK(Controller.TopPage()).__OnCancel__Delegate = WindowRequestFriend_OnCancel;
    }
    // End:0x120
    else
    {
        BTWindowRequestFriendHK(Controller.TopPage()).AddData(ReqCharname, ReqUserID, InviteMsg);
    }
    return true;
}

function bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckConfirmFriendInvite]");
    // End:0x62
    if(Result == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(18), 5, true);
        RefreshPage();
    }
    // End:0x7b
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    local string RecvMsg;

    Log("[BTPageLobby::rfReqCompleteFriendInvite] CharnameToBeInvited=" $ CharnameToBeInvited $ " IsPermit=" $ string(IsPermit));
    // End:0x9d
    if(IsPermit == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(22, CharnameToBeInvited), 5, true);
        RefreshPage();
    }
    // End:0x126
    else
    {
        // End:0xc8
        if(IsPermit == 3)
        {
            RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(381);
        }
        // End:0x10f
        else
        {
            // End:0xf3
            if(IsPermit == 4)
            {
                RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(415);
            }
            // End:0x10f
            else
            {
                RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(23, CharnameToBeInvited);
            }
        }
        page_Main.AddChatLog(RecvMsg, 5, true);
    }
    return false;
}

function bool rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log("[BTPageLobby::rfAckGameRoomInfo]");
    return true;
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckDupCheckClanName]");
    // End:0x93
    if(Result == 0)
    {
        BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = true;
        BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck.DisableMe();
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 50);
    }
    // End:0x118
    else
    {
        // End:0xff
        if(Result == 127)
        {
            BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = false;
            BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck.EnableMe();
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 51);
        }
        // End:0x118
        else
        {
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    return true;
}

function bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTPageLobby::rfAckCreateClan]");
    // End:0x214
    if(Result == 0)
    {
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.ClanName = page_Main.SaveClanName;
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
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 53);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = MoveToClanPage_OnOK;
    }
    // End:0x22d
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool MoveToClanPage_OnOK(GUIComponent Sender)
{
    Controller.TopPage().FadeOut(false, true);
    // End:0x97
    if(page_Main.page_curr == page_Main.page_Lobby2 || page_Main.page_curr == page_Main.page_RoomLobby || page_Main.page_curr == page_Main.page_ClanWar)
    {
        page_Main.SetPage(24, false);
    }
    // End:0xa9
    else
    {
        page_Main.SetPage(24, true);
    }
    return true;
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::rfAckDBCharInfo]");
    // End:0x86
    if(bJoinClanState)
    {
        BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
        // End:0x7c
        if(BTWindow != none)
        {
            // End:0x7c
            if(BTWindow.CharName == CharName)
            {
                BTWindow.SetCharInfo(stCharInfo);
            }
        }
        bJoinClanState = false;
        return true;
    }
    Controller.OpenMenu("GUIWarfareControls.BTWindowUserDetailInfoHK");
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetData(CharName, ClanName, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, stCharInfo.DispHeadItem, stCharInfo.DispFaceItem, stCharInfo.DispHeadAddItem, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo);
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetClanInfo(ClanName, CM_Pattern, CM_BG, CM_BL, ClanLevel);
    BTWindowUserDetailInfoHK(Controller.TopPage()).SetSelfIntro(ClanPersonIntro);
    // End:0x1cd
    if(ClanName == "none" || ClanName == "")
    {
        BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.DisableMe();
    }
    // End:0x217
    else
    {
        BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
        BTWindowUserDetailInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowUserDetailInfoHK_OnClanInfo;
    }
    return true;
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    Log("[BTPageLobby::rfAckClanCharPersonelIntro]");
    // End:0x53
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
}

function bool rfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    return true;
}

function bool BTWindowUserDetailInfoHK_OnClanInfo(GUIComponent Sender)
{
    local string ClanName;

    ClanName = BTWindowUserDetailInfoHK(Controller.TopPage()).ClanName;
    Controller.TopPage().FadeOut(false, true);
    TcpChannel.sfReqClanInfo(ClanName);
    return true;
}

function bool BTWindowUserPersonalInfo_OnClanInfo(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    TcpChannel.sfReqClanInfo(MM.kClanName);
    return true;
}

function bool rfAckInviteClan(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckInviteClan]");
    // End:0x48
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x73
    if(MM.InGamePlaying == false)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 41);
    }
    return true;
}

function bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    Log("[BTPageLobby::rfAckJoinClan]");
    // End:0xb0
    if(Result != 0)
    {
        // End:0x95
        if(Result == 537)
        {
            // End:0x77
            if(MM.InGamePlaying)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(135, RealRecvCharName), 5, true);
            }
            // End:0x92
            else
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 135, RealRecvCharName);
            }
        }
        // End:0xb0
        else
        {
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            return true;
        }
    }
    // End:0x1a9
    if(MM.InGamePlaying)
    {
        // End:0x183
        if(SpecificCharName != "" && SpecificCharName != RealRecvCharName)
        {
            // End:0x11c
            if(RealRecvCharClanGrade == 1)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(133, SpecificCharName, RealRecvCharName), 5, true);
            }
            // End:0x180
            else
            {
                // End:0x15a
                if(RealRecvCharClanGrade == 2)
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(134, SpecificCharName, RealRecvCharName), 5, true);
                }
                // End:0x180
                else
                {
                    Log("RealRecvCharClanGrade != 1 && != 2");
                }
            }
        }
        // End:0x1a6
        else
        {
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(42), 5, true);
        }
    }
    // End:0x266
    else
    {
        // End:0x250
        if(SpecificCharName != "" && SpecificCharName != RealRecvCharName)
        {
            // End:0x1f6
            if(RealRecvCharClanGrade == 1)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 133, SpecificCharName, RealRecvCharName);
            }
            // End:0x24d
            else
            {
                // End:0x227
                if(RealRecvCharClanGrade == 2)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 134, SpecificCharName, RealRecvCharName);
                }
                // End:0x24d
                else
                {
                    Log("RealRecvCharClanGrade != 1 && != 2");
                }
            }
        }
        // End:0x266
        else
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 42);
        }
    }
    return true;
}

function bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    Log("[BTPageLobby::rfAckInviteClanResult]");
    // End:0x66
    if(Permit == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(43, CharName), 5, true);
        RefreshPage();
    }
    // End:0x10d
    else
    {
        // End:0x9e
        if(Permit == 1)
        {
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(138, CharName), 5, true);
        }
        // End:0x10d
        else
        {
            // End:0xd7
            if(Permit == 2)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(44, CharName), 5, true);
            }
            // End:0x10d
            else
            {
                // End:0x10d
                if(Permit == 3)
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(145, CharName), 5, true);
                }
            }
        }
    }
    return true;
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageLobby::rfAckSearchClan]");
    // End:0x48
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    // End:0xdc
    if(BTWindow != none)
    {
        BTWindow.SetPageLimit(1, TotalPage);
        BTWindow.SetData(TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    }
    return true;
}

function bool rfAckNotifyNewClanMember(string ClanName, string CharName)
{
    Log("[BTPageLobby::rfAckNotifyNewClanMember]");
    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(54, ClanName, CharName), 5, true);
    TPMessenger.UpdateFriendlyUser(TPMessenger.2);
    return true;
}

function bool rfAckNotifyClanSecession(string ClanName, string CharName)
{
    Log("[BTPageLobby::rfAckNotifyClanSecession]");
    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(59, CharName, ClanName), 5, true);
    return true;
}

function bool rfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::rfReqRecvJoinClan]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowRequestApprovalClanHK");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    BTWindow.SetData(UserIdx, CharName, Message);
    BTWindow.__OnOK__Delegate = BTWindowRequestApprovalClanHK_OnOK;
    BTWindow.__OnCancel__Delegate = BTWindowRequestApprovalClanHK_OnCancel;
    BTWindow.ButtonSuspend.__OnClick__Delegate = BTWindowRequestApprovalClanHK_OnSuspend;
    bJoinClanState = true;
    page_Main.TcpChannel.sfReqDBCharInfo(CharName);
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestApprovalClanHK_OnOK]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    // End:0xaf
    if(BTWindow != none)
    {
        page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 0);
        BTWindow.FadeOut(false, true);
    }
    RefreshPage();
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestApprovalClanHK_OnCancel]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    // End:0xb3
    if(BTWindow != none)
    {
        page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 2);
        BTWindow.FadeOut(false, true);
    }
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageLobby::BTWindowRequestApprovalClanHK_OnSuspend]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    // End:0xb3
    if(BTWindow != none)
    {
        page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 1);
        Controller.CloseMenu(true);
    }
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
}

function bool RefreshPage_OnOK(GUIComponent Sender)
{
    Controller.TopPage().FadeOut(false, true);
    RefreshPage();
    return true;
}

function bool rfAckJoinClanResult(string ClanName, byte Permit, string PermitCharName)
{
    Log("[BTPageLobby::rfAckJoinClanResult]");
    // End:0x64
    if(Permit == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(43, PermitCharName), 5, true);
        RefreshPage();
    }
    // End:0x10b
    else
    {
        // End:0x9c
        if(Permit == 1)
        {
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(137, PermitCharName), 5, true);
        }
        // End:0x10b
        else
        {
            // End:0xd5
            if(Permit == 2)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(44, PermitCharName), 5, true);
            }
            // End:0x10b
            else
            {
                // End:0x10b
                if(Permit == 3)
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(145, PermitCharName), 5, true);
                }
            }
        }
    }
    return true;
}

function bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    Log("[BTPageLobby::rfAckRecvJoinClanResult]");
    // End:0x50
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    Log("[BTPageLobby::rfAckChatWispher]");
    // End:0x5a
    if(Result == 252)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(76, ToCharName), 5, true);
    }
    // End:0xb5
    else
    {
        // End:0x91
        if(Result == 182)
        {
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(77, ToCharName), 5, true);
        }
        // End:0xb5
        else
        {
            // End:0xb5
            if(Result != 0)
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
}

function bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    Log("[BTPageLobby::rfAckDeleteFriend]");
    // End:0x4a
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqFriendList();
    return true;
}

function bool rfReqRecvDeleteFriend(int Result, string FromCharName)
{
    Log("[BTPageLobby::rfReqRecvDeleteFriend]");
    // End:0x4e
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(75, FromCharName), 5, true);
    page_Main.TcpChannel.sfReqFriendList();
    return true;
}

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageLobby::rfAckAdjustClanMemberGrade]");
    // End:0x53
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xaf
    if(CharGrade == 1 && MM.IsClanGrade(1) && MM.kUserName != CharName)
    {
        MM.kInClanGrade = 3;
        MM.UpdateCharInfoAndReqClanUserList();
    }
    // End:0x10d
    if(MM.kUserName == CharName)
    {
        MM.kInClanGrade = CharGrade;
        MM.UpdateCharInfo(MM);
        MM.UpdateClanInfo(MM);
    }
    RefreshPage();
    return true;
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageLobby::rfAckNotifyAdjustClanMemberGrade]");
    // End:0x91
    if(MM.kUserName == CharName)
    {
        MM.kInClanGrade = CharGrade;
        MM.UpdateCharInfo(MM);
        MM.UpdateClanInfo(MM);
    }
    // End:0xd7
    if(CharGrade != 5)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(55, CharName, strClanGrade[CharGrade]), 5, true);
    }
    // End:0xff
    else
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(58, CharName), 5, true);
    }
    RefreshPage();
    return true;
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
        // End:0x1ce
        if(page_Main.bNewAvailableEventQuest)
        {
            ClientTime = GameMgr.GetClientTime(true);
            i = 0;
            J0xce:
            // End:0x1ce [While If]
            if(i < MM.QuestList.Length)
            {
                q = GameMgr.GetQuestInfo(MM.QuestList[i].QuestID);
                // End:0x1c4
                if(q.IsEventQuest() && q.IsEnabledEventQuest(ClientTime))
                {
                    MM.NewQuestList[MM.NewQuestList.Length] = MM.QuestList[i].QuestID;
                    Log("[rfAckQuestGetAvailableEventList]QuestID : " $ string(MM.QuestList[i].QuestID));
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xce;
            }
        }
        // End:0x225
        if(MM.NewQuestList.Length != 0)
        {
            page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowQuestInfoHK");
        }
        page_Main.bNewAvailableEventQuest = false;
    }
    // End:0x27a
    else
    {
        Log("[rfAckQuestGetAvailableEventList Error(" $ string(Result) $ "):" $ ErrMsg);
    }
    return true;
}

function bool IsEnterableRoom(bool bPass, int nUser, int nMaxUser)
{
    return !bPass && nUser < nMaxUser;
}

function bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    local int i;

    Log("[BTPageLobby::rfAckChangedRoomTitle_FromGM] RoomNumber=" $ string(RoomNumber) $ " NewRoomTitle=" $ NewRoomTitle);
    // End:0x83
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x8a:
    // End:0xf7 [While If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        // End:0xed
        if(ACLLobby.ACLRowList[i].DataPerColumn[1].IntValue == RoomNumber)
        {
            ACLLobby.ChangeRoomName(i, NewRoomTitle);
        }
        // End:0xf7
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x8a;
        }
    }
}

function RoomPingRefresh()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x67 [While If]
    if(i < ACLLobby.ACLRowList.Length)
    {
        page_Main.rMM.SendPingToOtherUser(ACLLobby.ACLRowList[i].DataPerColumn[10].strValue);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function bool rfAckNotifyStartTutorial(int Result, int UserID)
{
    Log("[BTPageLobby::rfAckNotifyStartTutorial] Result=" $ string(Result) $ ", UserID=" $ string(UserID));
    // End:0x5f
    if(Result != 0)
    {
        return true;
    }
    TPMessenger.RemoveChannelUser(UserID);
}

function bool rfAckNotifyEndTutorial(int UserID, string CharName, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageLobby::rfAckNotifyEndTutorial] Result=" $ string(Result) $ ", UserID=" $ string(UserID) $ ", UserName=" $ CharName);
    // End:0x73
    if(Result != 0)
    {
        return true;
    }
    // End:0xf1
    if(TPMessenger.FindChannelUser(UserID) < 0)
    {
        TPMessenger.AddChannelUser(ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, Level, CharName, UserID, ClanGrade, ClanWin, ClanLose, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    }
    // End:0x1a7
    if(MM.kUID == UserID)
    {
        Log("[BTPageLobby::rfAckNotifyEndTutorial] UserID=" $ string(UserID));
        MM.kTcpChannel.sfReqMyMoney();
        MM.kTcpChannel.sfReqItemList(MM.kUID);
        MM.kTcpChannel.sfReqUserSkillList(MM.kUID);
    }
}

function bool rfAckClanMatch_StartPublicWaitRoomList(int Result, string ErrMsg, int Count)
{
    Log("[BTPageLobby::rfAckClanMatch_StartPublicWaitRoomList] Result=" $ string(Result) $ ", Count=" $ string(Count));
    return true;
}

function bool rfAckClanMatch_PublicWaitRoomList(array<int> WaitRoomIdx, array<string> LeaderName, array<string> RoomName, array<int> MapNum, array<int> CurUserCount, array<int> MaxUserCount, array<byte> Status)
{
    local int i;
    local string MapName;
    local array<wMapInfo> Maps;

    Log("[BTPageLobby::rfAckClanMatch_PublicWaitRoomList] WaitRoomIdx.Length=" $ string(WaitRoomIdx.Length));
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    Log("================== Start List ==================================");
    i = 0;
    J0xf6:
    // End:0x272 [While If]
    if(i < WaitRoomIdx.Length)
    {
        MapName = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfoByMapNum(Maps, MapNum[i]).FriendlyName;
        Log("RoomNumber=" $ string(WaitRoomIdx[i]) $ ", LeaderName=" $ LeaderName[i] $ ", RoomName=" $ RoomName[i] $ ", MapName=" $ MapName $ ", UCNT=" $ string(CurUserCount[i]) $ "/" $ string(MaxUserCount[i]) $ ", Status=" $ string(Status[i]));
        ACLLobby.AddRoomCW(WaitRoomIdx[i], LeaderName[i], RoomName[i], MapName, MapNum[i], CurUserCount[i], MaxUserCount[i], Status[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xf6;
    }
    Log("================== End List ===================================");
    return true;
}

function bool rfAckClanMatch_EndPublicWaitRoomList()
{
    Log("[BTPageLobby::rfAckClanMatch_EndPublicWaitRoomList]");
    return true;
}

function bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, string RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic)
{
    local array<wMapInfo> Maps;
    local string MapName;

    Log("[BTPageLobby::rfAckClanMatch_PublicWaitRoomChanged] IsPublic=" $ string(IsPublic));
    Maps = PlayerOwner().Level.GetMatchMaker().MapSettings.GetAllMapInfos(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild());
    MapName = PlayerOwner().Level.GetMatchMaker().MapSettings.GetMapInfoByMapNum(Maps, MapNum).FriendlyName;
    Log("RoomNumber=" $ string(WaitRoomIdx) $ ", RoomName=" $ RoomName $ ", MapName=" $ MapName $ ", UCNT=" $ string(CurUserCount) $ "/" $ string(MaxUserCount) $ ", Status=" $ string(Status));
    // End:0x1a6
    if(IsPublic > 0)
    {
        ACLLobby.AddRoomInteligenceCW(WaitRoomIdx, "", RoomName, MapName, MapNum, CurUserCount, MaxUserCount, Status);
    }
    // End:0x1e1
    else
    {
        Log("RemoveByGameNumberCW(" $ string(WaitRoomIdx) $ ")");
        ACLLobby.RemoveByGameNumberCW(WaitRoomIdx);
    }
    return true;
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    Log("[BTPageLobby::rfAckLogOut] Result=" $ string(Result) $ ", Reason=" $ string(Reason));
    Log("[BTPageLobby::rfAckLogOut] (" $ page_Main.szAccountName $ ", " $ page_Main.szLoginPassword $ ", " $ page_Main.AuthLogin_GUID $ ")");
    return LobbyToServerSelection();
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTPageLobby::rfAckMoveToLobby()] MessageType=" $ string(MessageType));
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    switch(MessageType)
    {
        // End:0xc2
        case 5:
            bGoBack = true;
            page_Main.TcpChannel.sfReqLeaveChannel(MM.kChannelID);
            page_Main.rMM.bKickOut = true;
            // End:0xc7
            break;
        // End:0xffff
        default:
            return false;
    }
    return true;
}

function bool rfAckFriendPosition(int Result, string TargetCharName, byte ServerType, string fServername, string fServerShortName, string fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, string ChannelNickName, int GameRoomNum)
{
    local export editinline BTCMMessengerOnOffline CCM;

    // End:0xd9
    if(Result == 0)
    {
        CCM = BTCMMessengerOnOffline(TPMessenger.ACLMsg[TPMessenger.TabControl.GetCurrentTabIndex()].ContextMenu);
        TPMessenger.SetUserServerInfo(fServername, fServerShortName, fServerIP, fServerPort, CurPos, CurState, ChannelNum, ChannelNickName, GameRoomNum);
        // End:0xd9
        if(CCM.IsActiveMoveRoomState() == true)
        {
            // End:0xd9
            if(!page_Main.CheckMoveToChannel(page_Main.FindServerChannelInfoIndexByServerIP(fServerIP, fServerPort, ChannelNum)))
            {
                CCM.ChangeMoveRoomState(false);
            }
        }
    }
    return true;
}

function bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    return true;
}

function bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount)
{
    return true;
}

function bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return true;
}

function bool rfAckGetRankingInfoListEnd()
{
    return true;
}

function bool rfNotifyNewNickName(int Community_Type, string Old_NickName, string New_NickName)
{
    Log("[BTPageLobby::rfNotifyNewNickName()] Community_Type=" $ string(Community_Type));
    // End:0x97
    if(bool(Community_Type & 1 << 1) && TPMessenger.TabControl.CurrentTabIndex == TPMessenger.3)
    {
        TPMessenger.ReplaceUserNickName(1, Old_NickName, New_NickName);
    }
    // End:0xee
    if(bool(Community_Type & 1 << 2) && TPMessenger.TabControl.CurrentTabIndex == TPMessenger.2)
    {
        TPMessenger.ReplaceUserNickName(2, Old_NickName, New_NickName);
    }
    // End:0x145
    if(bool(Community_Type & 1 << 3) && TPMessenger.TabControl.CurrentTabIndex == TPMessenger.1)
    {
        TPMessenger.ReplaceUserNickName(3, Old_NickName, New_NickName);
    }
    // End:0x19c
    if(bool(Community_Type & 1 << 5) && TPMessenger.TabControl.CurrentTabIndex == TPMessenger.0)
    {
        TPMessenger.ReplaceUserNickName(4, Old_NickName, New_NickName);
    }
    // End:0x1d3
    if(!ACLLobby.ChangeRoomOwenrName(Old_NickName, New_NickName))
    {
        ACLLobbyEnterable.ChangeRoomOwenrName(Old_NickName, New_NickName);
    }
    MM.ReplaceBlockNickName(Old_NickName, New_NickName);
    return true;
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    Log("[BTPageLobby::rfReqRecvClanInvite]");
    bClanInviteState = true;
    return false;
}

function bool rfNotifyNewClanName(string New_NickName)
{
    Log("[BTPageLobby::rfNotifyNewClanName()] New_NickName=" $ New_NickName);
    TPMessenger.ReplaceClanName(byte(TPMessenger.TabControl.CurrentTabIndex), MM.kClanName, New_NickName);
    MM.kClanName = New_NickName;
    MM.UpdateClanInfo(MM);
    return true;
}

function bool rfNotifyClanLevelup(string ClanName, int Levelup)
{
    Log("[BTPageLobby::rfNotifyClanLevelup]");
    TPMessenger.ReplaceClanLevel(byte(TPMessenger.TabControl.CurrentTabIndex), ClanName, Levelup);
    MM.kClanLevel = Levelup;
    MM.UpdateClanInfo(MM);
    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(224, ClanName, string(Levelup)), 5, true);
    return true;
}

defaultproperties
{
    strEnterRoomMessage="Joining game"
    strConnectingLogin="Connecting to the login server..."
    RefreshCycleTime[0]=10.0
    RefreshCycleTime[1]=10.0
    begin object name=mBGImageAD2 class=BTOwnerDrawImageHK
        AWinPos=(X1=771.0,Y1=87.0,X2=1014.0,Y2=260.0)
        RenderWeight=0.010
        OnRendered=Internal_OnRendered
    object end
    // Reference: BTOwnerDrawImageHK'BTPageLobby.mBGImageAD2'
    BGImageAD2=mBGImageAD2
    begin object name=mTabControl class=TabControlMocker
        OnVisiblePanelChanged=OnVisibleChannelListChanged
    object end
    // Reference: TabControlMocker'BTPageLobby.mTabControl'
    TabControl=mTabControl
    begin object name=mACLLobby class=BTACLLobbyHKCN
        bUseAWinPos=true
        AWinPos=(X1=12.0,Y1=114.0,X2=728.0,Y2=450.0)
        RenderWeight=0.80
        OnRendered=OnRendered
    object end
    // Reference: BTACLLobbyHKCN'BTPageLobby.mACLLobby'
    ACLLobby=mACLLobby
    begin object name=mACLLobbyEnterable class=BTACLLobbyHKCN
        bUseAWinPos=true
        AWinPos=(X1=12.0,Y1=143.0,X2=745.0,Y2=456.0)
        RenderWeight=0.80
        OnRendered=OnRendered
    object end
    // Reference: BTACLLobbyHKCN'BTPageLobby.mACLLobbyEnterable'
    ACLLobbyEnterable=mACLLobbyEnterable
    bAllRoomList=true
    begin object name=mTPChat class=BTTPChatHKCN
        OnPostDraw=Internal_OnPostDraw
        bUseAWinPos=true
        AWinPos=(X1=10.0,Y1=518.0,X2=460.0,Y2=736.0)
        RenderWeight=0.70
        OnPreDraw=Internal_OnPreDraw
        OnDeActivate=Internal_DeActivate
    object end
    // Reference: BTTPChatHKCN'BTPageLobby.mTPChat'
    TPChat=mTPChat
    begin object name=mTPMessenger class=BTTPMessengerHKCN
        OnPopupChannel=OnPopupChannel
        OnPopupFriend=OnPopupFriend
        OnPopupClan=OnPopupClan
        OnPopupPCBang=OnPopupPCBang
        OnPopupChannelCheck=OnPopupChannelCheck
        OnPopupFriendCheck=OnPopupFriendCheck
        OnPopupClanCheck=OnPopupClanCheck
        OnPopupPCBangCheck=OnPopupPCBangCheck
        bUseAWinPos=true
        AWinPos=(X1=500.0,Y1=518.0,X2=746.0,Y2=733.0)
        RenderWeight=0.90
    object end
    // Reference: BTTPMessengerHKCN'BTPageLobby.mTPMessenger'
    TPMessenger=mTPMessenger
    begin object name=mTPMyInfo class=BTTPMyInfoHKCN
        bUseAWinPos=true
        AWinPos=(X1=772.0,Y1=525.0,X2=1014.0,Y2=735.0)
        RenderWeight=0.60
        OnRendered=OnRendered
    object end
    // Reference: BTTPMyInfoHKCN'BTPageLobby.mTPMyInfo'
    TPMyInfo=mTPMyInfo
    strDisconnectedChannel="Unable to connect to the channel. Try again."
    strListTop[0]="SP"
    strListTop[1]="No."
    strListTop[2]="P/W"
    strListTop[3]="Game Name"
    strListTop[4]="Map"
    strListTop[5]="Mode"
    strListTop[6]="Sub-Mode"
    strListTop[7]="Players"
    strListTop[8]="Status"
    strListTop[9]="Ping"
    strListBottom[0]="Create Game"
    strListBottom[1]="Quick Join"
    strListBottom[2]="Type"
    strListBottom[3]="Join"
    strListBottom[4]="Open Games"
    strAllRoomList="All Games"
    ListTopButtonPosition[0]=(X1=12.0,Y1=116.0,X2=48.0,Y2=142.0)
    ListTopButtonPosition[1]=(X1=48.0,Y1=116.0,X2=84.0,Y2=142.0)
    ListTopButtonPosition[2]=(X1=84.0,Y1=116.0,X2=120.0,Y2=142.0)
    ListTopButtonPosition[3]=(X1=120.0,Y1=116.0,X2=363.0,Y2=142.0)
    ListTopButtonPosition[4]=(X1=363.0,Y1=116.0,X2=454.0,Y2=142.0)
    ListTopButtonPosition[5]=(X1=454.0,Y1=116.0,X2=545.0,Y2=142.0)
    ListTopButtonPosition[6]=(X1=545.0,Y1=116.0,X2=606.0,Y2=142.0)
    ListTopButtonPosition[7]=(X1=606.0,Y1=116.0,X2=657.0,Y2=142.0)
    ListTopButtonPosition[8]=(X1=657.0,Y1=116.0,X2=708.0,Y2=142.0)
    ListTopButtonPosition[9]=(X1=708.0,Y1=116.0,X2=758.0,Y2=142.0)
    ListBottomButtonPosition[0]=(X1=201.0,Y1=460.0,X2=322.0,Y2=492.0)
    ListBottomButtonPosition[1]=(X1=325.0,Y1=460.0,X2=445.0,Y2=492.0)
    ListBottomButtonPosition[2]=(X1=445.0,Y1=460.0,X2=566.0,Y2=492.0)
    ListBottomButtonPosition[3]=(X1=570.0,Y1=460.0,X2=631.0,Y2=492.0)
    ListBottomButtonPosition[4]=(X1=634.0,Y1=460.0,X2=755.0,Y2=492.0)
    strMakeClanWarRoom="Create Clan Battle Game"
    strRegularClanWar="Create Regular Clan Battle Game"
    strFriendlyClanWar="Create Friendly Clan Battle Game"
    strButtonRegularClanWar="Create Clan Battle Prep Game"
    strButtonFriendlyClanWar="Create Friendly Game"
    fbButtonRegularClanWar=(X1=0.0,Y1=460.0,X2=100.0,Y2=492.0)
    fbButtonFriendlyClanWar=(X1=325.0,Y1=460.0,X2=506.0,Y2=492.0)
    fbTestButton=(X1=791.0,Y1=107.0,X2=994.0,Y2=157.0)
    MapIndex=255
    OnOpen=InternalOnOpen
    OnReOpen=InternalOnReOpen
    OnClose=InternalOnClose
    OnPreDraw=Internal_OnPreDraw
    OnKeyType=InternalKeyType
    OnKeyEvent=internalKeyEvent
}