/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageRoomLobby.uc
 * Package Imports:
 *	GUIWarfare
 *	XInterface
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Enums:1
 *	Properties:75
 *	Functions:224
 *
 *******************************************************************************/
class BTPageRoomLobby extends BTNetQuestInfoPageHK
    dependson(BTNetQuestInfoPageHK)
    dependson(BTConsole)
    dependson(BTRefreshTime)
    dependson(BTPageRoomLobby_TcpLogin)
    dependson(BTPageRoomLobby_TCP)
    editinlinenew
    instanced;

const UserPingRefreshTime = 5;

enum E_MyAction
{
    E_MY_ACTION_NONE,
    E_MY_ACTION_INTERVENTION
};

var int OutofSeatTime;
var int OwnerOutofSeatTime;
var float LastKeySleepTime;
var bool bAllReady;
var int PrevGameMode;
var bool bPrevTeamBalance;
var localized string strTeamBalance[3];
var localized string strBotModeWarn[2];
var localized string strNoviceMode;
var localized string strBotMode;
var float TimeAutoStart;
var float TPMessenger_ACLMsg0_OnHitBottom_LastTime;
var bool bGoToClanPage;
var float LastRefreshTime[2];
var float RefreshCycleTime[2];
var BTRefreshTime rfFriendPosTime;
var int TotalChannelUserCount;
var int CurrentRoomState;
var bool bJoinClanState;
var bool bClanInviteState;
var bool bSafeLeaveRoom;
var export editinline BTOwnerDrawImageHK LabelTeamSelect;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTeam;
var export editinline BTOwnerDrawImageHK LabelTeam;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbLabelTeamTopLine;
var export editinline BTOwnerDrawImageHK LabelTeamTopLine;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonTeam[2];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTeam[2];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPTeamList[2];
var export editinline BTTPTeamMemberList TPTeamList[2];
var array<BTAutoColumnListDataHK> UserListDB;
var array<BTAutoColumnListDataHK> GMList;
var int GMNumAF;
var int GMNumRSA;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPChat;
var export editinline BTTPChatHK TPChat;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPMessenger;
var export editinline BTTPMessengerHKCN TPMessenger;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPMyInfo;
var export editinline BTTPMyInfoHK TPMyInfo;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbTPRoomInfo;
var export editinline BTTPRoomInfoHK TPRoomInfo;
var localized string strButtonStart[3];
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonStart;
var export editinline BTOwnerDrawCaptionButtonHK ButtonStart;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbButtonTemp;
var export editinline BTOwnerDrawCaptionButtonHK ButtonTemp;
var transient wMatchMaker MatchMaker;
var array<GameModeInfo> GameModes;
var bool bReadyToGame;
var bool bNoInitialRoomInfo;
var bool bShowHostWarning;
var localized string strExpiredItem;
var localized string CannotChangeHostTitle;
var localized string CannotChangeHostMessage;
var localized string WaitingMessage;
var localized string MessageNewHost;
var localized string MessageNewGuestPre;
var localized string MessageNewGuestPost;
var localized string MessageHostChangeEnable[2];
var localized string strLowHostScoreWarning[2];
var int NewOwnerID;
var int MinHostPoint;
var int MinWaringHostPoint;
var int MaxWaringHostPoint;
var float SendPingIntervalTime;
var BTPageRoomLobby.E_MyAction MyAction;
var export editinline BTLabelTutorialQuestInfoHK LabelPopupTutorial;
var array<int> ReceivedPingID;
var array<int> ReceivedPingValue;
var array<string> DelFriendsList;
var() /*0x00000000-0x80000000*/ databinding editinlinenotify FloatBox fbBGDeco;
var export editinline BTOwnerDrawImageHK BGDeco;
var export editinline BTOwnerDrawCaptionButtonHK MyInfoBtn;
var delegate<CurrentButtonClickBehavior> __CurrentButtonClickBehavior__Delegate;

function bool BTWindowRoomInfoHK_OnOK(GUIComponent Sender)
{
    local string filter;
    local GameRoomInfo NetRoomInfo;
    local export editinline BTWindowRoomInfoHK BTWindow;

    BTWindow = BTWindowRoomInfoHK(Controller.TopPage());
    Log("[BTPageRoomLobby::BTWindowRoomInfoHK_OnOK]");
    // End:0x83
    if(BTWindow.EditRoomName.TextStr == "")
    {
        Controller.TopPage().FadeOut(false, true);
        return true;
    }
    filter = BTWindow.EditRoomName.TextStr;
    Controller.ViewportOwner.Actor.Level.GameMgr.FilterBadWords(filter);
    // End:0x111
    if(filter != BTWindow.EditRoomName.TextStr)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 103);
        return true;
    }
    // End:0x453
    if(MM.bIsOwner)
    {
        NetRoomInfo.RoomNumber = MM.kRoomID;
        NetRoomInfo.RoomName = BTWindow.EditRoomName.TextStr;
        NetRoomInfo.TeamCnt = 2;
        NetRoomInfo.MapName = BTWindow.GetMap();
        NetRoomInfo.MapNum = byte(BTWindow.GetSelectedMapID());
        NetRoomInfo.GameModeNum = byte(BTWindow.GetGameModeIndex());
        NetRoomInfo.GameClass = class'wGameSettings'.static.GetGameModeByIndex(NetRoomInfo.GameModeNum).ClassName;
        NetRoomInfo.WeaponLimit = byte(BTWindow.GetWeaponRestrictionIndex());
        NetRoomInfo.IsHardCore = byte(BTWindow.GetIsHardCore());
        NetRoomInfo.MaxUserCnt = byte(int(BTWindow.GetUserCount()));
        NetRoomInfo.GameRound = int(BTWindow.GetTargetScore());
        NetRoomInfo.GameMinute = int(BTWindow.GetGameTime());
        NetRoomInfo.PlayWithBots = byte(BTWindow.IsPlayWithBots());
        NetRoomInfo.UserTeamNum = byte(BTWindow.GetBotModeUserTeam());
        PlayerOwner().dblog("NetRoomInfo.UserTeamNum=" $ string(NetRoomInfo.UserTeamNum));
        NetRoomInfo.MaxAFUserAndBotNum = byte(BTWindow.GetAFBotCount());
        NetRoomInfo.MaxRSAUserAndBotNum = byte(BTWindow.GetRSABotCount());
        NetRoomInfo.BotModeDifficulty = byte(BTWindow.GetBotModeDifficulty());
        // End:0x362
        if(BTWindow.RadioTeamBalance.getData())
        {
            NetRoomInfo.IsTeamValance = 1;
        }
        // End:0x36f
        else
        {
            NetRoomInfo.IsTeamValance = 0;
        }
        // End:0x391
        if(BTWindow.GetMultiBomb())
        {
            NetRoomInfo.BombHold = 0;
        }
        // End:0x39e
        else
        {
            NetRoomInfo.BombHold = 1;
        }
        // End:0x3cc
        if(BTWindow.EditPassword.TextStr != "")
        {
            NetRoomInfo.IsPassword = 1;
        }
        // End:0x3d9
        else
        {
            NetRoomInfo.IsPassword = 0;
        }
        NetRoomInfo.Password = BTWindow.EditPassword.TextStr;
        // End:0x429
        if(BTWindow.ReSpawnRadioBtn.getData() == false)
        {
            NetRoomInfo.ResponType = 1;
        }
        // End:0x436
        else
        {
            NetRoomInfo.ResponType = 0;
        }
        page_Main.TcpChannel.sfReqChangeRoomSetting(NetRoomInfo);
    }
    Controller.TopPage().FadeOut(false, true);
    return true;
}

function bool WindowInviteFriend_OnOK(GUIComponent Sender)
{
    local bool bTemp;
    local string imsg;
    local export editinline BTWindowInviteFriendHK Window;

    Window = BTWindowInviteFriendHK(Controller.TopPage());
    imsg = Window.MultiLineEditMsg.GetText();
    bTemp = page_Main.TcpChannel.sfReqSendFriendInvite(Window.friendUID, Window.FriendName, imsg);
    Controller.TopPage().FadeOut(false, true);
    return true;
}

function bool BTWindowInviteClan_OnOK(GUIComponent Sender)
{
    page_Main.TcpChannel.sfReqInviteClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
}

function bool ButtonRoomInfo_OnClick(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::ButtonRoomInfo_OnClick]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowRoomInfoHK");
    BTWindowRoomInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowRoomInfoHK_OnOK;
    return true;
}

function bool GotoInventory_OnOK(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::BasicItemDurabilityWarn_OnOK]");
    Controller.CloseMenu(false);
    page_Main.SetPage(22, false);
    return true;
}

function bool GotoStartGame_OnOK(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::GotoStartGame_OnOK]");
    Controller.CloseMenu(false);
    CurrentButtonClickBehavior(Sender);
    return true;
}

function bool CheckPrimaryWeaponDurability()
{
    local int i, j;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageRoomLobby::CheckPrimaryWeaponDurability]");
    i = 0;
    J0x3a:
    // End:0x140 [While If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        // End:0x136
        if(GameMgr.InstanceItemLists[i].SlotPosition != 13)
        {
            ItemInfo = GameMgr.FindUIItem(GameMgr.InstanceItemLists[i].ItemID);
            // End:0x136
            if(false == MM.CheckUsingItem(ItemInfo))
            {
                // End:0xfb
                if(MM.bIsOwner || CurrentRoomState == 1)
                {
                    class'BTWindowDefineARHK'.static.ShowInfo(Controller, 29);
                }
                // End:0x111
                else
                {
                    class'BTWindowDefineARHK'.static.ShowInfo(Controller, 28);
                }
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                return false;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    i = 0;
    J0x147:
    // End:0x275 [While If]
    if(i < GameMgr.QuickSlotBoxList.Length)
    {
        j = 0;
        J0x167:
        // End:0x26b [While If]
        if(j < 4)
        {
            // End:0x261
            if(GameMgr.QuickSlotBoxList[i].ItemID[j] != 0)
            {
                ItemInfo = GameMgr.FindUIItem(GameMgr.QuickSlotBoxList[i].ItemID[j]);
                // End:0x261
                if(false == MM.CheckUsingItem(ItemInfo))
                {
                    // End:0x226
                    if(MM.bIsOwner || CurrentRoomState == 1)
                    {
                        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 29);
                    }
                    // End:0x23c
                    else
                    {
                        class'BTWindowDefineARHK'.static.ShowInfo(Controller, 28);
                    }
                    BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                    return false;
                }
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x167;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x147;
    }
    i = 0;
    J0x27c:
    // End:0x3af [While If]
    if(i < 2)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x3a5
        if(instanceInfo != none && instanceInfo.Durability < 1000)
        {
            // End:0x3a5
            if(instanceInfo.ItemID == 2000 || instanceInfo.ItemID == 1010)
            {
                ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
                // End:0x3a5
                if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
                {
                    class'BTWindowDefineSelectHK'.static.ShowInfo(Controller, 19);
                    BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                    BTWindowDefineSelectHK(Controller.TopPage()).__OnCancel__Delegate = GotoStartGame_OnOK;
                    return false;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27c;
    }
    i = 0;
    J0x3b6:
    // End:0x494 [While If]
    if(i < 4)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x48a
        if(instanceInfo != none && instanceInfo.Durability < 1000)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x48a
            if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 66);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                return false;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3b6;
    }
    i = 0;
    J0x49b:
    // End:0x5f0 [While If]
    if(i < GameMgr.QuickSlotBoxList.Length)
    {
        j = 0;
        J0x4bb:
        // End:0x5e6 [While If]
        if(j < 4)
        {
            // End:0x5dc
            if(UnresolvedNativeFunction_99(GameMgr.QuickSlotBoxList[i].UniqueID[j], EmptyBtrDouble()))
            {
                instanceInfo = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[i].UniqueID[j]);
                // End:0x5dc
                if(instanceInfo != none && instanceInfo.Durability < 1000)
                {
                    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
                    // End:0x5dc
                    if(ItemInfo.CostType == 0 || ItemInfo.CostType == 2)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 67);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                        return false;
                    }
                }
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x4bb;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x49b;
    }
    return true;
}

delegate bool CurrentButtonClickBehavior(GUIComponent Sender);
function bool ButtonStart_OnClick_Before_CheckDurability(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::ButtonStart_OnClick_Before_CheckDurability]");
    // End:0x4f
    if(CheckPrimaryWeaponDurability() == false)
    {
        return true;
    }
    CurrentButtonClickBehavior(Sender);
    return true;
}

function bool ButtonStart_OnClick(GUIComponent Sender)
{
    local int LimitCount, GameUserCount;

    Log("[BTPageRoomLobby::ButtonStart_OnClick]" $ " owner=" $ string(MM.bIsOwner));
    Log("[BTPageRoomLobby::ButtonStart_OnClick] NatType=" $ string(page_Main.NatType));
    Controller.PopPage();
    // End:0xc7
    if(MM.kGame_TeamBalance)
    {
        class'BTWindowDefineStateHK'.static.ShowState(Controller, 3);
    }
    // End:0xdd
    else
    {
        class'BTWindowDefineStateHK'.static.ShowState(Controller, 2);
    }
    // End:0x135
    if(page_Main.NatType < 0)
    {
        Log("[BTPageRoomLobby::ButtonStart_OnClick]" @ "NatType Not Determined");
    }
    // End:0x71a
    if(MM.bIsOwner)
    {
        // End:0x162
        if(MM.GMLevelFlag & 1 == 1)
        {
            return true;
        }
        GameUserCount = TPTeamList[0].ACLList.ACLRowList.Length + TPTeamList[1].ACLList.ACLRowList.Length - GMNumAF - GMNumRSA;
        // End:0x60b
        if(MM.kClanMatch_InChannel && Controller.ViewportOwner.Actor.Level.bServiceBuild == true)
        {
            // End:0x23a
            if(page_Main.kClanWarUserCountIgnore == false && GameUserCount <= 7)
            {
                Controller.PopPage();
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 193);
                return true;
            }
            // End:0x2a3
            if(TPTeamList[0].ACLList.IsAllReady() == false || TPTeamList[1].ACLList.IsAllReady() == false)
            {
                Controller.PopPage();
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 189);
                return true;
            }
            // End:0x31a
            if(page_Main.kClanWarUserCountIgnore == false && TPTeamList[0].ACLList.GetReadyUserCount() != TPTeamList[1].ACLList.GetReadyUserCount())
            {
                Controller.PopPage();
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 194);
                return true;
            }
            // End:0x331
            if(GameUserCount <= 8)
            {
                LimitCount = 3;
            }
            // End:0x37e
            else
            {
                // End:0x348
                if(GameUserCount <= 10)
                {
                    LimitCount = 3;
                }
                // End:0x37e
                else
                {
                    // End:0x35f
                    if(GameUserCount <= 12)
                    {
                        LimitCount = 4;
                    }
                    // End:0x37e
                    else
                    {
                        // End:0x376
                        if(GameUserCount <= 14)
                        {
                            LimitCount = 5;
                        }
                        // End:0x37e
                        else
                        {
                            LimitCount = 6;
                        }
                    }
                }
            }
            // End:0x455
            if(page_Main.kClanWarUserCountIgnore == false && TPTeamList[0].ACLList.GetMaxSameClanUserCount() < LimitCount && TPTeamList[1].ACLList.GetMaxSameClanUserCount() < LimitCount)
            {
                Controller.PopPage();
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 190, "AF, RSA", string(TPTeamList[0].ACLList.ACLRowList.Length + TPTeamList[1].ACLList.ACLRowList.Length / 2), string(LimitCount));
                return true;
            }
            // End:0x5ab
            else
            {
                // End:0x501
                if(page_Main.kClanWarUserCountIgnore == false && TPTeamList[0].ACLList.GetMaxSameClanUserCount() < LimitCount)
                {
                    Controller.PopPage();
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 190, "AF", string(TPTeamList[0].ACLList.ACLRowList.Length + TPTeamList[1].ACLList.ACLRowList.Length / 2), string(LimitCount));
                    return true;
                }
                // End:0x5ab
                else
                {
                    // End:0x5ab
                    if(page_Main.kClanWarUserCountIgnore == false && TPTeamList[1].ACLList.GetMaxSameClanUserCount() < LimitCount)
                    {
                        Controller.PopPage();
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 190, "RSA", string(TPTeamList[0].ACLList.ACLRowList.Length + TPTeamList[1].ACLList.ACLRowList.Length / 2), string(LimitCount));
                        return true;
                    }
                }
            }
            // End:0x60b
            if(TPTeamList[0].ACLList.GetMaxSameClanName() == TPTeamList[1].ACLList.GetMaxSameClanName())
            {
                Controller.PopPage();
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 191);
                return true;
            }
        }
        // End:0x6a5
        if(MM.szGameClass == "wGame.wDeathMatch" && TPTeamList[0].ACLList.ACLRowList.Length + TPTeamList[1].ACLList.ACLRowList.Length - GMNumAF - GMNumRSA > 8)
        {
            Controller.PopPage();
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 25);
            return true;
        }
        Log("[BTPageRoomLobby::ButtonStart_OnClick]" @ "NatType OK, Start Game Request");
        page_Main.TcpChannel.sfReqStartGame(MM.kRoomID);
    }
    // End:0x89d
    else
    {
        // End:0x772
        if(MM.GMLevelFlag & 3 == 0 && MM.kClanMatch_InChannel)
        {
            Controller.PopPage();
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 188);
            return true;
        }
        // End:0x89d
        else
        {
            // End:0x7d5
            if(MM.InGamePlaying == true)
            {
                Log("BTPageRoomLobby::ButtonStart_OnClick() MM.InGamePlaying is true. error!!");
                return false;
            }
            // End:0x83a
            if(MM.bPendingStarted == true)
            {
                Log("BTPageRoomLobby::ButtonStart_OnClick() MM.bPendingStarted is true. error!!");
                return false;
            }
            Log("[BTPageRoomLobby::ButtonStart_OnClick]" @ "NatType OK, Join Game Request");
            page_Main.TcpChannel.sfReqConnectGame();
        }
    }
    // End:0x8e7
    if(page_Main.rMM.kInterfaceGuideStep == 2)
    {
        page_Main.rMM.kInterfaceGuideStep = 3;
        ButtonStart.SetFlicker(false);
    }
    return true;
}

function bool ButtonReady_OnClick(GUIComponent Sender)
{
    local byte ustate;

    // End:0x1b
    if(MM.GMLevelFlag & 1 == 1)
    {
        return true;
    }
    Log("[BTPageRoomLobby::ButtonReady_OnClick]");
    // End:0x9d
    if(page_Main.NatType < 0)
    {
        Log("[BTPageRoomLobby::ButtonReady_OnClick]" @ "NatType Not Determined");
    }
    // End:0x101
    if(bReadyToGame == false)
    {
        ustate = 1;
        Log("[BTPageRoomLobby::ButtonReady_OnClick]" @ "NatType OK, Ready state Request");
    }
    // End:0x158
    else
    {
        ustate = 0;
        Log("[BTPageRoomLobby::ButtonReady_OnClick]" @ "NatType OK, Waiting State Request");
    }
    page_Main.TcpChannel.sfReqChangeUserState(ustate, 1);
    // End:0x1c1
    if(page_Main.rMM.kInterfaceGuideStep == 2)
    {
        page_Main.rMM.kInterfaceGuideStep = 3;
        ButtonStart.SetFlicker(false);
    }
    return true;
}

function bool ButtonTeam_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local int GMNum;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0xa5
    if(MatchMaker.PlayWithBots == true)
    {
        // End:0xa2
        if(MatchMaker.BotUserTeam != 2 && MatchMaker.BotUserTeam != btn.ButtonID)
        {
            // End:0x8a
            if(MatchMaker.BotUserTeam == 0)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 220);
            }
            // End:0xa0
            else
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 221);
            }
            return true;
        }
    }
    // End:0x102
    else
    {
        // End:0x102
        if(MatchMaker.kClanMatch_InChannel == true)
        {
            // End:0x102
            if(TPTeamList[0].GetUserCount() != 0 && TPTeamList[1].GetUserCount() != 0)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 225);
                return true;
            }
        }
    }
    // End:0x191
    if(MatchMaker.kClanMatch_InChannel == true)
    {
        // End:0x191
        if(TPTeamList[0].GetUserCount() == 0 || TPTeamList[1].GetUserCount() == 0)
        {
            // End:0x191
            if(TPTeamList[0].GetUserCount() >= 2 || TPTeamList[1].GetUserCount() >= 2)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 225);
                return true;
            }
        }
    }
    // End:0x1b3
    if(btn.ButtonID == 0)
    {
        GMNum = GMNumAF;
    }
    // End:0x1be
    else
    {
        GMNum = GMNumRSA;
    }
    // End:0x1df
    if(bReadyToGame)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 28);
        return true;
    }
    // End:0x226
    if(TPTeamList[btn.ButtonID].ACLList.ACLRowList.Length - GMNum >= MM.kGame_UserCount / 2)
    {
        return false;
    }
    page_Main.TcpChannel.sfReqChangeTeam(btn.ButtonID);
    return true;
}

function bool CanInviteUser()
{
    return true;
}

function bool CheckInviteUser(optional int CurPos, optional int CurState, optional string szNickName, optional string szClanName)
{
    // End:0x37
    if(CurPos == 2 && CurState == 2)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 132, szNickName);
        return false;
    }
    return true;
}

function UpdateRoomOwner(int UID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x8e [While If]
    if(i < UserListDB.Length)
    {
        // End:0x62
        if(UserListDB[i].DataPerColumn[6].IntValue == UID)
        {
            UserListDB[i].DataPerColumn[4].floatValue = 0.0;
        }
        // End:0x84
        else
        {
            UserListDB[i].DataPerColumn[4].floatValue = 1.0;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    RefreshUserList();
}

function bool ChangeButtonTeam(int Team)
{
    // End:0x20e
    if(Team == 0)
    {
        ButtonTeam[0].buttonImage[0] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].buttonImage[1] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].buttonImage[2] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].buttonImage[3] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].buttonImage[4] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].__OnClick__Delegate = None;
        LabelTeamSelect.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(ButtonTeam[0].AWinPos.X1 - float(2), ButtonTeam[0].AWinPos.Y1 - float(2), TPTeamList[0].AWinPos.X2 + float(2), TPTeamList[0].AWinPos.Y2);
        ButtonTeam[1].buttonImage[0] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].buttonImage[1] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
        ButtonTeam[1].buttonImage[2] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_n;
        ButtonTeam[1].buttonImage[3] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
        ButtonTeam[1].buttonImage[4] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
        ButtonTeam[1].__OnClick__Delegate = ButtonTeam_OnClick;
    }
    // End:0x40e
    else
    {
        ButtonTeam[0].buttonImage[0] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].buttonImage[1] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
        ButtonTeam[0].buttonImage[2] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_n;
        ButtonTeam[0].buttonImage[3] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
        ButtonTeam[0].buttonImage[4] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
        ButtonTeam[0].__OnClick__Delegate = ButtonTeam_OnClick;
        ButtonTeam[1].buttonImage[0] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].buttonImage[1] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].buttonImage[2] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].buttonImage[3] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].buttonImage[4] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].__OnClick__Delegate = None;
        LabelTeamSelect.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(ButtonTeam[1].AWinPos.X1 - float(2), ButtonTeam[1].AWinPos.Y1 - float(2), TPTeamList[1].AWinPos.X2 + float(2), TPTeamList[1].AWinPos.Y2);
    }
    LabelTeamSelect.ApplyAWinPos();
    return true;
}

function ChangeButtonStart()
{
    Log("[BTPageRoomLobby::ChangeButtonStart]" $ " owner=" $ string(MM.bIsOwner));
    ChangeButtonTeam(MM.kTeamID);
    // End:0x116
    if(MM.bIsOwner || CurrentRoomState == 1)
    {
        ButtonStart.Caption = strButtonStart[0];
        // End:0xcc
        if(MM.bIsOwner)
        {
            TPRoomInfo.ButtonRoomInfo.Caption = TPRoomInfo.strButtonRoomInfo[0];
        }
        // End:0xf4
        else
        {
            TPRoomInfo.ButtonRoomInfo.Caption = TPRoomInfo.strButtonRoomInfo[1];
        }
        ButtonStart.__OnClick__Delegate = ButtonStart_OnClick_Before_CheckDurability;
        __CurrentButtonClickBehavior__Delegate = ButtonStart_OnClick;
    }
    // End:0x196
    else
    {
        // End:0x139
        if(bReadyToGame)
        {
            ButtonStart.Caption = strButtonStart[2];
        }
        // End:0x14f
        else
        {
            ButtonStart.Caption = strButtonStart[1];
        }
        TPRoomInfo.ButtonRoomInfo.Caption = TPRoomInfo.strButtonRoomInfo[1];
        ButtonStart.__OnClick__Delegate = ButtonStart_OnClick_Before_CheckDurability;
        __CurrentButtonClickBehavior__Delegate = ButtonReady_OnClick;
    }
}

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    Log("[BTPageRoomLobby::HeaderButton_OnClick] MenuID=" $ string(btn.ButtonID));
    // End:0x7e
    if(bSafeLeaveRoom)
    {
        Log("Safe Leave Room Processing");
        return true;
    }
    // End:0x9f
    if(bReadyToGame)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return true;
    }
    switch(btn.ButtonID)
    {
        // End:0xc8
        case 0:
            page_Main.SetPage(23, false);
            // End:0x34c
            break;
        // End:0xe1
        case 1:
            page_Main.SetPage(20, false);
            // End:0x34c
            break;
        // End:0xfb
        case 2:
            page_Main.SetPage(21, false);
            // End:0x34c
            break;
        // End:0x115
        case 3:
            page_Main.SetPage(22, false);
            // End:0x34c
            break;
        // End:0x12f
        case 4:
            page_Main.SetPage(18, false);
            // End:0x34c
            break;
        // End:0x250
        case 5:
            // End:0x166
            if(MM.kClanName != "")
            {
                bGoToClanPage = true;
                page_Main.SetPage(24, false);
            }
            // End:0x24d
            else
            {
                Controller.OpenMenu("GUIWarfareControls.BTWindowClanMenuHK");
                BTWindowClanMenuHK(Controller.TopPage()).SetClanLookingFor(MM.kClanLookingFor);
                BTWindowClanMenuHK(Controller.TopPage()).ButtonCreateClan.__OnClick__Delegate = ClanMenu_ButtonCreateClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonFindClan.__OnClick__Delegate = ClanMenu_ButtonFindClan_OnClick;
                BTWindowClanMenuHK(Controller.TopPage()).ButtonOK.__OnClick__Delegate = ClanMenu_ButtonLookingForClan_OnClick;
            }
            // End:0x34c
            break;
        // End:0x258
        case 6:
            // End:0x34c
            break;
        // End:0x260
        case 7:
            // End:0x34c
            break;
        // End:0x277
        case 8:
            page_Main.ShowHelpWindow();
            // End:0x34c
            break;
        // End:0x2b3
        case 9:
            Controller.OpenMenu("GUIWarfareControls.BTWindowOptionHK");
            // End:0x34c
            break;
        // End:0x33b
        case 10:
            // End:0x30a
            if(MM.kClanMatch_InMatchRoom)
            {
                page_Main.StartAutoMove(MM.kServerID, MM.kChannelID, MM.kClanMatch_ReadyRoomID, "", 2);
            }
            // End:0x338
            else
            {
                bSafeLeaveRoom = true;
                page_Main.TcpChannel.sfReqLeaveRoom(MM.kRoomID);
            }
            // End:0x34c
            break;
        // End:0x349
        case 20:
            OpenTodayResultPage();
            // End:0x34c
            break;
        // End:0xffff
        default:
            return true;
    }
}

function bool ClanMenu_ButtonLookingForClan_OnClick(GUIComponent Sender)
{
    local bool bCurLookingFor;

    Log("[BTPageRoomLobby::ClanMenu_ButtonLookingForClan_OnClick]");
    bCurLookingFor = MM.kClanLookingFor;
    // End:0x78
    if(bCurLookingFor)
    {
        page_Main.TcpChannel.sfReqSetLookForClan(0);
    }
    // End:0x92
    else
    {
        page_Main.TcpChannel.sfReqSetLookForClan(1);
    }
    return true;
}

function bool ClanMenu_ButtonFindClan_OnClick(GUIComponent Sender)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageRoomLobby::ClanMenu_ButtonFindClan_OnClick]");
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

    Log("[BTPageRoomLobby::BTWindowFindClanHK_OnRequestJoin]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0xf7
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

    Log("[BTPageRoomLobby::BTWindowFindClanHK_OnInfo]");
    ClanName = BTWindowFindClanHK(Controller.TopPage()).GetSelectClanName();
    // End:0x8f
    if(ClanName != "none" && ClanName != "")
    {
        page_Main.TcpChannel.sfReqClanInfo(ClanName);
    }
    return true;
}

function bool ClanMenu_ButtonCreateClan_OnClick(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::ClanMenu_ButtonCreateClan_OnClick]");
    Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanNeedPointHK");
    BTWindowCreateClanNeedPointHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanNeedPointHK_OnClick;
    return true;
}

function bool BTWindowCreateClanNeedPointHK_OnClick(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::BTWindowCreateClanNeedPointHK_OnClick]");
    // End:0xde
    if(MM.kPoint >= 5000)
    {
        Controller.ReplaceMenu2("GUIWarfareControls.BTWindowCreateClanHK");
        BTWindowCreateClanHK(Controller.TopPage()).TcpChannel = page_Main.TcpChannel;
        BTWindowCreateClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowCreateClanHK_OnOK;
    }
    // End:0x104
    else
    {
        Controller.CloseMenu(false);
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 62);
    }
    return true;
}

function bool BTWindowCreateClanHK_OnOK(GUIComponent Sender)
{
    local string ClanName, URL, Intro, Keyword;
    local int Region;

    Log("[BTPageRoomLobby::BTWindowCreateClanHK_OnOK]");
    // End:0x165
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
    // End:0x17b
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 52);
    }
    return true;
}

function InitializeTeamList()
{
    LabelTeamTopLine = NewLabelComponent(fbLabelTeamTopLine, class'BTUIResourcePoolHK'.default.empty);
    LabelTeamTopLine.SetFontSizeAll(11);
    ButtonTeam[0] = NewButtonComponent(fbButtonTeam[0]);
    ButtonTeam[0].buttonImage[0] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_n;
    ButtonTeam[0].buttonImage[1] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
    ButtonTeam[0].buttonImage[2] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
    ButtonTeam[0].buttonImage[3] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
    ButtonTeam[0].buttonImage[4] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
    ButtonTeam[0].ButtonID = 0;
    ButtonTeam[1] = NewButtonComponent(fbButtonTeam[1]);
    ButtonTeam[1].buttonImage[0] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_n;
    ButtonTeam[1].buttonImage[1] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
    ButtonTeam[1].buttonImage[2] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
    ButtonTeam[1].buttonImage[3] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
    ButtonTeam[1].buttonImage[4] = class'BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
    ButtonTeam[1].ButtonID = 1;
    TPTeamList[0] = BTTPTeamMemberList(NewComponent(new class'BTTPTeamMemberList', fbTPTeamList[0]));
    TPTeamList[0].__OnPopupCheck__Delegate = TPTeamList_OnPopupCheck;
    TPTeamList[0].__OnPopup__Delegate = TPTeamList_OnPopup;
    TPTeamList[1] = BTTPTeamMemberList(NewComponent(new class'BTTPTeamMemberList', fbTPTeamList[1]));
    TPTeamList[1].__OnPopupCheck__Delegate = TPTeamList_OnPopupCheck;
    TPTeamList[1].__OnPopup__Delegate = TPTeamList_OnPopup;
    LabelTeamSelect = NewLabelComponent(AWinPos, class'BTUIResourcePoolHK'.default.butt_list_cli);
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    NewBackground = NewLabelComponent(fbNewBackground, class'BTUIResourcePoolHK'.default.new_Page_Thema, 0.000130);
    BGDeco = NewLabelComponent(fbBGDeco, class'BTUIResourcePoolHK'.default.RoomLoby_BG_Deco, 0.10);
    InitializeTeamList();
    TPMessenger = BTTPMessengerHKCN(NewComponent(new class'BTTPMessengerHKCN', fbTPMessenger, 0.90));
    TPMessenger.__OnPopupChannel__Delegate = OnPopupChannel;
    TPMessenger.__OnPopupFriend__Delegate = OnPopupFriend;
    TPMessenger.__OnPopupClan__Delegate = OnPopupClan;
    TPMessenger.__OnPopupPCBang__Delegate = OnPopupPCBang;
    TPMessenger.__OnPopupChannelCheck__Delegate = OnPopupChannelCheck;
    TPMessenger.__OnPopupFriendCheck__Delegate = OnPopupFriendCheck;
    TPMessenger.__OnPopupClanCheck__Delegate = OnPopupClanCheck;
    TPMessenger.__OnPopupPCBangCheck__Delegate = OnPopupPCBangCheck;
    TPMessenger.HideTabButton(TPMessenger.3);
    TPMyInfo = BTTPMyInfoHKCN(NewComponent(new class'BTTPMyInfoHKCN', fbTPMyInfo, 0.80));
    TPRoomInfo = BTTPRoomInfoHK(NewComponent(new class'BTTPRoomInfoHK', fbTPRoomInfo));
    TPRoomInfo.ButtonRoomInfo.__OnClick__Delegate = ButtonRoomInfo_OnClick;
    TPChat = BTTPChatHK(NewComponent(new class'BTTPChatHKCN', fbTPChat));
    page_Main.TPChat = TPChat;
    TPChat.InputBox.__OnChat__Delegate = page_Main.Internal_OnChat;
    TPChat.InputBox.__OnInputTab__Delegate = page_Main.TPChat_OnInputTab;
    TPChat.InputBox.__OnInputSpace__Delegate = page_Main.TPChat_OnInputSpace;
    TPChat.__OnChageChatMode__Delegate = page_Main.TPChat_OnChageChatMode;
    TPChat.__ChangeTab_OnClick__Delegate = page_Main.TPChat_ChangeTab_OnClick;
    TPChat.InputBox.__OnFunctionKey__Delegate = page_Main.Internal_OnFunctionKey;
    ButtonStart = NewButtonComponent(fbButtonStart, 0.70);
    ButtonStart.SetGameStartBtnImage();
    ButtonStart.SetDefaultBigButtonFontColor();
    ButtonStart.SetFontSizeAll(23);
    ButtonStart.Caption = strButtonStart[1];
    ButtonStart.__OnKeyEvent__Delegate = ButtonStart_OnKeyEvent;
    // End:0x388
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        ButtonTemp = NewButtonComponent(fbButtonTemp);
        ButtonTemp.SetDefaultBigButtonImage();
        ButtonTemp.__OnClick__Delegate = ButtonTemp_OnClick;
    }
    Log("[BTPageRoomLobby::InitComponent]");
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameModes = class'wGameSettings'.static.GetAllGameModes();
    MyController.ResetFocus();
    LabelRoomName.ClipArea.X1 = 0.0;
    LabelRoomName.ClipArea.Y1 = 288.0;
    LabelRoomName.ClipArea.X2 = 280.0;
    LabelRoomName.ClipArea.Y2 = 336.0;
    i = 0;
    J0x46b:
    // End:0x4b1 [While If]
    if(i < TPMessenger.ButtonMsg.Length)
    {
        TPMessenger.ButtonMsg[i].__OnClick__Delegate = TPMessenger_ButtonMsg_OnClick;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x46b;
    }
    TPMessenger.ACLMsg[0].__OnHitBottom__Delegate = TPMessenger_ACLMsg0_OnHitBottom;
    LabelPopupTutorial = BTLabelTutorialQuestInfoHK(NewComponent(new class'BTLabelTutorialQuestInfoHK', class'BTCustomDrawHK'.static.MakeFloatBox(10.0, 508.0, 1014.0, 735.0), 0.99990));
    LabelPopupTutorial.bAcceptsInput = true;
    page_Main.rMM.__OnRecivedPing__Delegate = OnReceivedPing;
    MyInfoBtn = NewButtonComponent(class'BTCustomDrawHK'.static.MakeFloatBox(973.0, 503.0, 1023.0, 555.0), 0.90);
    MyInfoBtn.buttonImage[0] = class'BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_n;
    MyInfoBtn.buttonImage[1] = class'BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_on;
    MyInfoBtn.buttonImage[2] = class'BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_n;
    MyInfoBtn.buttonImage[3] = class'BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_cli;
    MyInfoBtn.buttonImage[4] = class'BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_block;
    MyInfoBtn.buttonImage[5] = class'BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_on;
    MyInfoBtn.Caption = "";
    MyInfoBtn.__OnClick__Delegate = MyInfo_OnClick;
    rfFriendPosTime = new class'BTRefreshTime';
    rfFriendPosTime.SetMaxTime(1.50);
}

function bool MyInfo_OnClick(GUIComponent Sender)
{
    // End:0x1c4
    if(MM.kUserName == TPMyInfo.myName)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowUserPersonalInfo");
        BTWindowUserPersonalInfo(Controller.TopPage()).SetTcpChannel(page_Main.TcpChannel);
        BTWindowUserPersonalInfo(Controller.TopPage()).SetCharInfo(page_Main.MyCharInfo);
        BTWindowUserPersonalInfo(Controller.TopPage()).SetClanInfo(page_Main.MyClanInfo);
        BTWindowUserPersonalInfo(Controller.TopPage()).UpdateCharInfo();
        BTWindowUserPersonalInfo(Controller.TopPage()).UpdateRequestServer();
        // End:0x177
        if(MM.kClanName == "none" || MM.kClanName == "")
        {
            BTWindowUserPersonalInfo(Controller.TopPage()).ButtonOK.DisableMe();
        }
        // End:0x1c1
        else
        {
            BTWindowUserPersonalInfo(Controller.TopPage()).ButtonOK.EnableMe();
            BTWindowUserPersonalInfo(Controller.TopPage()).__OnOK__Delegate = BTWindowUserPersonalInfo_OnClanInfo;
        }
    }
    // End:0x1ea
    else
    {
        page_Main.TcpChannel.sfReqDBCharInfo(TPMyInfo.myName);
    }
    return true;
}

function TPMessenger_ACLMsg0_OnHitBottom(int Top, int Count, int itemperpage)
{
    TPMessenger.ACLMsg[0].MultiColumnList.MyScrollBar.MyGripButton.MenuState = 0;
    // End:0xa5
    if(TPMessenger_ACLMsg0_OnHitBottom_LastTime + 0.10 < PlayerOwner().Level.TimeSeconds)
    {
        page_Main.TcpChannel.sfReqChannelUserListInGameRoom(MM.kChannelID, Top, 30);
        TPMessenger_ACLMsg0_OnHitBottom_LastTime = PlayerOwner().Level.TimeSeconds;
    }
}

function bool TPMessenger_ButtonMsg_OnClick(GUIComponent Sender)
{
    local int StartTop, Count;
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    switch(btn.ButtonID)
    {
        // End:0x18a
        case 0:
            Count = 6 * 3;
            StartTop = TPMessenger.ACLMsg[0].MultiColumnList.Top - 6;
            // End:0x7a
            if(StartTop < 0)
            {
                Count += StartTop;
                StartTop = 0;
            }
            // End:0xe6
            if(TPMessenger.ACLMsg[0].MultiColumnList.Top + 6 * 2 > TotalChannelUserCount)
            {
                Count += TotalChannelUserCount - TPMessenger.ACLMsg[0].MultiColumnList.Top + 6 * 2;
            }
            // End:0x143
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
            {
                TPChat.AddChatHistory(2, "RefreshTime", class'BTUIColorPoolHK'.static.ChatSelf());
            }
            // End:0x157
            if(Count < 6)
            {
                Count = 6;
            }
            page_Main.TcpChannel.sfReqChannelUserListInGameRoom(MM.kChannelID, StartTop, Count);
            // End:0x1f7
            break;
        // End:0x1a9
        case 1:
            page_Main.TcpChannel.sfReqFriendList();
            // End:0x1f7
            break;
        // End:0x1ec
        case 2:
            // End:0x1e9
            if(MM.kClanName != "")
            {
                page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
            }
            // End:0x1f7
            break;
        // End:0x1f4
        case 3:
            // End:0x1f7
            break;
        // End:0xffff
        default:
            TPMessenger.TabControl.SetVisiblePanel(btn.ButtonID);
            return true;
    }
}

function bool InternalOnPreDraw(Canvas C)
{
    local export editinline BTWindowHK BTWindow;
    local float CurrentTime;
    local int StartTop, Count;

    Internal_OnPreDraw(C);
    // End:0x63
    if(TimeAutoStart != float(-1) && Controller.ViewportOwner.Actor.Level.TimeSeconds > TimeAutoStart)
    {
        TimeAutoStart = -1.0;
        ButtonStart_OnClick(none);
    }
    // End:0x6e
    if(bSafeLeaveRoom)
    {
        return false;
    }
    // End:0x91
    if(page_Main.page_curr != page_Main.page_RoomLobby)
    {
        return false;
    }
    // End:0xa8
    if(page_Main.bConnectedChannelServer == false)
    {
        return false;
    }
    // End:0x133
    if(page_Main.pwm.IsAvailable() && page_Main.pwm.ListLen(10) > 0)
    {
        BTWindow = BTWindowHK(Controller.TopPage());
        // End:0x133
        if(BTWindow == none)
        {
            Controller.OpenMenuByObject(page_Main.pwm.Pop(10));
        }
    }
    CurrentTime = PlayerOwner().Level.TimeSeconds;
    // End:0x2f5
    if(CurrentTime - LastRefreshTime[0] > RefreshCycleTime[0])
    {
        // End:0x2e8
        if(TPMessenger.TabControl.CurrentTabIndex == 0)
        {
            Count = 6 * 3;
            StartTop = TPMessenger.ACLMsg[0].MultiColumnList.Top - 6;
            // End:0x1db
            if(StartTop < 0)
            {
                Count += StartTop;
                StartTop = 0;
            }
            // End:0x247
            if(TPMessenger.ACLMsg[0].MultiColumnList.Top + 6 * 2 > TotalChannelUserCount)
            {
                Count += TotalChannelUserCount - TPMessenger.ACLMsg[0].MultiColumnList.Top + 6 * 2;
            }
            // End:0x2a4
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
            {
                TPChat.AddChatHistory(2, "RefreshTime", class'BTUIColorPoolHK'.static.ChatSelf());
            }
            // End:0x2b8
            if(Count < 6)
            {
                Count = 6;
            }
            page_Main.TcpChannel.sfReqChannelUserListInGameRoom(MM.kChannelID, StartTop, Count);
        }
        LastRefreshTime[0] = CurrentTime;
    }
    rfFriendPosTime.Update(PlayerOwner().Level.AppDeltaTime);
    return false;
}

function SendPingAndSendHostPoint()
{
    // End:0x0d
    if(MatchMaker == none)
    {
        return;
    }
    // End:0x23
    if(!MatchMaker.bShowWarningHostPoint)
    {
        return;
    }
    // End:0x64
    if(PlayerOwner() != none && PlayerOwner().PlayerReplicationInfo != none)
    {
        MM.iAvgPing = PlayerOwner().PlayerReplicationInfo.Ping;
    }
    MM.CalculateHostPoint(false);
    Log("[BTPageRoomLobby::SendPingAndSendHostPoint] SendReqGetUserOwnerScore/iAvgPing" $ string(MM.iAvgPing) $ "/HWPoint:" $ string(MM.iHardwarePoint) $ "/HostPoint:" $ string(MM.GetHostPoint()));
    // End:0x153
    if(page_Main.TcpChannel != none)
    {
        page_Main.TcpChannel.sfReqUpdateMyHostPriorityPoint(MM.GetHostPoint());
    }
}

function MessageHostUnsuitableness()
{
    local int iPoint;

    // End:0x0d
    if(MatchMaker == none)
    {
        return;
    }
    iPoint = MM.GetHostPoint();
    // End:0x69
    if(MM.bIsOwner && iPoint >= MinWaringHostPoint)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 78, MM.kUserName);
    }
    MM.bShowMessageHostUnsuitableness = false;
}

function bool ButtonStart_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x41
    if(iKey == 13)
    {
        TPChat.InputBox.SetFocus(none);
        return true;
    }
    return false;
}

function StartNetworkChecking(int ClientsCount, optional bool bConnectGame)
{
    Log("[BTPageRoomLobby::StartNetworkChecking()]");
    // End:0x56
    if(MM.StartNetworkChecking(ClientsCount, bConnectGame) == true)
    {
        OpenNetworkCheckingWindow();
    }
    // End:0xb4
    else
    {
        class'BTWindowInfoHK'.static.ShowWindow(Controller, "", GetErrMsg(GetLastErrCode()));
        MM.SendErrorReportC(GetLastErrCode(), 5, GetErrMsg(GetLastErrCode()));
        page_Main.TcpChannel.sfReqFailedStartGame(1);
    }
}

function FailedNetworkChecking(string ErrMsg, optional int Code)
{
    Log("[BTPageRoomLobby::FailedNetworkChecking()]");
    // End:0x8e
    if(MM.FailedNetworkChecking() == true)
    {
        CloseNetworkCheckingWindow();
        Controller.PopPage();
        class'BTWindowInfoHK'.static.ShowWindow(Controller, "", ErrMsg);
        MM.SendErrorReportC(Code, 5, ErrMsg);
    }
}

function OpenNetworkCheckingWindow()
{
    // End:0x71
    if(Controller.GetLastMenu().IsA('BTWindowStateHK') == false)
    {
        Controller.PopPage();
        // End:0x5b
        if(MM.kGame_TeamBalance)
        {
            class'BTWindowDefineStateHK'.static.ShowState(Controller, 3);
        }
        // End:0x71
        else
        {
            class'BTWindowDefineStateHK'.static.ShowState(Controller, 2);
        }
    }
}

function CloseNetworkCheckingWindow(optional bool bNotInitial)
{
    local export editinline GUIPage LastMenu;

    LastMenu = Controller.GetLastMenu();
    // End:0x57
    if(LastMenu.IsA('BTWindowStateHK') == true)
    {
        bNoInitialRoomInfo = bNotInitial;
        Controller.TopPage().FadeOut(false, true);
    }
    // End:0x96
    else
    {
        // End:0x96
        if(LastMenu.IsA('BTWindowInfoHK') == true)
        {
            bNoInitialRoomInfo = bNotInitial;
            Controller.TopPage().FadeOut(false, true);
        }
    }
}

function InternalOnReOpen()
{
    UnresolvedNativeFunction_97("BTPageRoomLobby::InternalOnReOpen()");
    Log("[BTPageRoomLobby::InternalOnReOpen] Start");
    super.InternalOnReOpen();
    switch(TPMessenger.TabControl.CurrentTabIndex)
    {
        // End:0x87
        case TPMessenger.0:
            // End:0xe4
            break;
        // End:0xa5
        case TPMessenger.1:
            UpdateFriendList(MatchMaker);
            // End:0xe4
            break;
        // End:0xc3
        case TPMessenger.2:
            UpdateClanList(MatchMaker);
            // End:0xe4
            break;
        // End:0xe1
        case TPMessenger.3:
            UpdatePCBangList(MatchMaker);
            // End:0xe4
            break;
        // End:0xffff
        default:
            Log("[BTPageRoomLobby::InternalOnReOpen] End");
}

function InternalOnOpen()
{
    super.InternalOnOpen();
    UnresolvedNativeFunction_97("BTPageRoomLobby::InternalOnOpen()");
    Log("[BTPageRoomLobby::InternalOnOpen] Start [IME] BTTcpHandler.bTutorial=" $ string(int(BTTcpHandler(page_Main.TcpChannel).bTutorial)));
    QuestInfo.SetVisibility(false);
    // End:0xd4
    if(page_Main.rMM.kLevel <= 0)
    {
        LabelPopupTutorial.StartShow();
    }
    Controller.ViewportOwner.Actor.ConsoleCommand("toggleime 1");
    Controller.ViewportOwner.Actor.ConsoleCommand("SETIMECONVERSION 1");
    // End:0x169
    if(MM.bIsOwner)
    {
        ReceivedPingID.Length = 0;
        ReceivedPingValue.Length = 0;
        SetTimer(5.0, true, 'UserPingRefresh');
    }
    bShowHostWarning = false;
    bVisible = !page_Main.InTutorial;
    page_Main.CreateBotMode = false;
    MM.BotTutorial = false;
    // End:0x2c1
    if(BTTcpHandler(page_Main.TcpChannel).bTutorial == false)
    {
        // End:0x217
        if(page_Main.rMM.kInterfaceGuideStep == 1)
        {
            page_Main.rMM.kInterfaceGuideStep = 2;
            ButtonStart.SetFlicker(true);
        }
        // End:0x253
        if(page_Main.rMM.kInterfaceGuideStep == 4)
        {
            TPTopMenu.Quest.SetFlicker(true);
        }
        // End:0x26c
        else
        {
            TPTopMenu.Quest.SetFlicker(false);
        }
        // End:0x2a8
        if(page_Main.rMM.kInterfaceGuideStep == 3)
        {
            TPTopMenu.Inventory.SetFlicker(true);
        }
        // End:0x2c1
        else
        {
            TPTopMenu.Inventory.SetFlicker(false);
        }
    }
}

function OnBackToLastPage()
{
    Log("[BTPageRoomLobby::OnBackToLastPage] Start");
    RefreshPage();
    // End:0x54
    if(bGoToClanPage)
    {
        page_Main.TcpChannel.sfReqNotifyMyCharInfoToRoomUser();
    }
    QuestInfo.SetVisibility(false);
    // End:0x90
    if(page_Main.rMM.kLevel <= 0)
    {
        LabelPopupTutorial.StartShow();
    }
    page_Main.KeepMoving();
    Log("[BTPageRoomLobby::OnBackToLastPage] End");
}

function OnCompleteOpened()
{
    Log("[BTPageRoomLobby::OnCompleteOpened] Start");
    Controller.PushPage();
    RefreshPage();
    QuestInfo.SetVisibility(false);
    // End:0x7e
    if(page_Main.rMM.kLevel <= 0)
    {
        LabelPopupTutorial.StartShow();
    }
    page_Main.KeepMoving();
    Log("[BTPageRoomLobby::OnCompleteOpened] End");
    BTTcpHandler(page_Main.TcpChannel).OnPageRoomLobbyInited();
    // End:0x11c
    if(MM.bAutoStart)
    {
        TimeAutoStart = Controller.ViewportOwner.Actor.Level.TimeSeconds + float(4);
    }
}

function UpdateCharInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateCharInfo]");
    TPMyInfo.SetMyInfoA(MM.kUserName, MM.kLevel, MM.kExp, MM.kStartExp, MM.kEndExp, MM.kLevelMarkID);
}

function UpdateClanInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateClanInfo]");
    TPMyInfo.SetClanInfo(MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, MM.kClanLevel);
    TPMessenger.ReplaceMyClanName(byte(TPMessenger.TabControl.CurrentTabIndex), MM.kUserName, MM.kClanName);
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateMoneyInfo]");
    TPMyInfo.SetMoneyInfo(MM.kPoint, MM.kCash);
}

function UpdateRankingInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateRankingInfo]");
    TPMyInfo.SetRankingInfo(MM.kRanking, MM.kWin, MM.kLose);
}

function UpdateEquipItemInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateEquipItemInfo]");
}

function UpdatePCBangInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdatePCBangInfo]");
    TPMessenger.UpdatePCBangInfo();
}

function UpdatePositionInfo(wMatchMaker MM);
function UpdateQuestList(wMatchMaker MM);
function UpdateRecv_CharInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateRecv_CharInfo]");
    // End:0x3c
    if(MM.bShowMessageHostUnsuitableness)
    {
    }
    SetCharacterInfo(page_Main.MyClanName, page_Main.MyCharInfo);
    page_Main.CheckItemWarning();
}

function UpdateGameRoomInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateGameRoomInfo]");
    // End:0x7e
    if(bPrevTeamBalance == false && MM.kGame_TeamBalance)
    {
        page_Main.AddChatLog(strTeamBalance[0], 5, true);
        page_Main.AddChatLog(strTeamBalance[1], 5, true);
    }
    // End:0xb8
    else
    {
        // End:0xb8
        if(bPrevTeamBalance && MM.kGame_TeamBalance == false)
        {
            page_Main.AddChatLog(strTeamBalance[2], 5, true);
        }
    }
    // End:0x101
    if(MM.kGame_GameMode == 11 && PrevGameMode != MM.kGame_GameMode)
    {
        page_Main.AddChatLog(strNoviceMode, 5, true);
    }
    // End:0x169
    else
    {
        // End:0x169
        if(class'wGameSettings'.static.IsBotModeIndex(MM.kGame_GameMode) && PrevGameMode != MM.kGame_GameMode && MM.kLevel > 3)
        {
            page_Main.AddChatLog(strBotMode, 5, true);
        }
    }
}

function UpdateFriendList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageRoomLobby::UpdateFriendList]");
    TPMessenger.SavePos(TPMessenger.1);
    TPMessenger.RemoveAll(TPMessenger.1);
    i = 0;
    J0x62:
    // End:0x28c [While If]
    if(i < MM.kFriendList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kFriendList[i].ClanName, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, true, MM.kFriendList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kFriendList[i].ClanName, MM.kFriendList[i].ClanLevel);
        TPMessenger.AddFriendUser(MM.kFriendList[i].UserName, MM.kFriendList[i].IsLogOn, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, MM.kFriendList[i].ClanName, MM.kFriendList[i].Level, MM.kFriendList[i].ClanGrade, byte(MM.kFriendList[i].IsLookForClan), MM.kFriendList[i].ClanLevel, MM.kFriendList[i].LevelMarkID);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    TPMessenger.LoadPos(TPMessenger.1);
    UpdateFriendlyUser(TPMessenger.1);
}

function UpdateClanList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageRoomLobby::UpdateClanList]");
    TPMessenger.SavePos(TPMessenger.2);
    TPMessenger.RemoveAll(TPMessenger.2);
    i = 0;
    J0x60:
    // End:0x18b [While If]
    if(i < MM.kClanList.Length)
    {
        // End:0xa8
        if(MM.kClanList[i].UserName == MM.My_szName)
        {
        }
        // End:0x181
        else
        {
            TPMessenger.AddClanUser(MM.kClanList[i].UserName, MM.kClanList[i].IsLogOn, MM.kClanList[i].Level, MM.kClanList[i].ClanGrade, MM.kClanList[i].ClanWin, MM.kClanList[i].ClanLose, MM.kClanList[i].LevelMarkID, MM.kClanList[i].TitleMarkID);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x60;
    }
    TPMessenger.LoadPos(TPMessenger.2);
    UpdateFriendlyUser(TPMessenger.2);
}

function UpdatePCBangList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageRoomLobby::UpdatePCBangList]");
    TPMessenger.SavePos(TPMessenger.3);
    TPMessenger.RemoveAll(TPMessenger.3);
    i = 0;
    J0x62:
    // End:0x3ba [While If]
    if(i < MM.kPCBangList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kPCBangList[i].ClanName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, true, MM.kPCBangList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kPCBangList[i].ClanName, MM.kPCBangList[i].ClanLevel);
        TPMessenger.AddPCBangUser(MM.kPCBangList[i].UserName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, MM.kPCBangList[i].ClanName, MM.kPCBangList[i].Level, MM.kPCBangList[i].ServerShortName, MM.kPCBangList[i].ServerIP, MM.kPCBangList[i].serverPort, MM.kPCBangList[i].CurPos, MM.kPCBangList[i].ChannelNum, MM.kPCBangList[i].ChannelNickName, MM.kPCBangList[i].GameRoomNum, MM.kPCBangList[i].ClanGrade, MM.kPCBangList[i].ClanWin, MM.kPCBangList[i].ClanLose, byte(MM.kPCBangList[i].IsLookForClan), MM.kPCBangList[i].ClanLevel, MM.kPCBangList[i].LevelMarkID, MM.kPCBangList[i].TitleMarkID, MM.kPCBangList[i].Reserved1, MM.kPCBangList[i].Reserved2, MM.kPCBangList[i].Reserved3);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    TPMessenger.LoadPos(TPMessenger.3);
    UpdateFriendlyUser(TPMessenger.3);
}

function UpdateFriendlyUser(int UserListIdx)
{
    local int i, j;

    i = 0;
    J0x07:
    // End:0x84 [While If]
    if(i < 2)
    {
        j = 0;
        J0x1a:
        // End:0x7a [While If]
        if(j < TPTeamList[i].ACLList.ACLRowList.Length)
        {
            SetFriendlyUser(TPTeamList[i].ACLList.ACLRowList[j], UserListIdx);
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x1a;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    TPMessenger.UpdateFriendlyUser(UserListIdx);
}

function SetFriendlyUser(BTAutoColumnListDataHK ACLData, optional int UserListIdx)
{
    Log("[BTPageRoomLobby::SetFriendlyUser] (" $ ACLData.DataPerColumn[2].strValue $ ", " $ ACLData.DataPerColumn[3].strValue $ ")");
    // End:0x178
    if(TPMessenger.IsFriendlyUser(ACLData.DataPerColumn[2].strValue, ACLData.DataPerColumn[3].strValue, UserListIdx))
    {
        Log("[BTPageRoomLobby::SetFriendlyUser] Success");
        ACLData.DataPerColumn[2].floatValue = 1.0;
        ACLData.DataPerColumn[2].Text[0].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameN();
        ACLData.DataPerColumn[2].Text[1].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameOn();
        ACLData.DataPerColumn[2].Text[2].DrawColor = class'BTUIColorPoolHK'.static.FriendlyUserNameN();
    }
}

function UpdateBlockList(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateBlockList]");
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageRoomLobby::UpdateItemList]");
}

function UpdateWebzenItemList(wGameManager GameMgr)
{
    Log("[BTPageRoomLobby::UpdateWebzenItemList]");
}

function UpdateExpiredItemList(BTNetMainMenu MainMenu)
{
    Log("[BTPageRoomLobby::UpdateExpiredItemList]");
    // End:0x63
    if(MM.bForceGameOut)
    {
        MM.bForceGameOut = false;
        page_Main.bWarningDurabilityAndExpired = true;
    }
    // End:0x74
    else
    {
        page_Main.bWarningDurabilityAndExpired = false;
    }
}

function UpdateDurabilityWarningItemList(BTNetMainMenu MainMenu)
{
    Log("[BTPageRoomLobby::UpdateDurabilityWarningItemList]");
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
    MM.__UpdatePCBangInfo__Delegate = UpdatePCBangInfo;
    MM.__UpdatePositionInfo__Delegate = UpdatePositionInfo;
    MM.__UpdateQuestList__Delegate = UpdateQuestList;
    MM.__UpdateGameRoomInfo__Delegate = UpdateGameRoomInfo;
    MM.__UpdateRecv_CharInfo__Delegate = UpdateRecv_CharInfo;
    MM.__UpdatePCBangList__Delegate = UpdatePCBangList;
    MM.__UpdateBlockList__Delegate = UpdateBlockList;
    MM.__UpdateClanList__Delegate = UpdateClanList;
    MM.__UpdateFriendList__Delegate = UpdateFriendList;
    page_Main.__UpdateExpiredItemList__Delegate = UpdateExpiredItemList;
    page_Main.__UpdateDurabilityWarningItemList__Delegate = UpdateDurabilityWarningItemList;
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
    MM.__UpdatePCBangInfo__Delegate = None;
    MM.__UpdatePositionInfo__Delegate = None;
    MM.__UpdateQuestList__Delegate = None;
    MM.__UpdateGameRoomInfo__Delegate = None;
    MM.__UpdateRecv_CharInfo__Delegate = None;
    MM.__UpdatePCBangList__Delegate = None;
    MM.__UpdateBlockList__Delegate = None;
    MM.__UpdateClanList__Delegate = None;
    MM.__UpdateFriendList__Delegate = None;
    page_Main.__UpdateExpiredItemList__Delegate = None;
    page_Main.__UpdateDurabilityWarningItemList__Delegate = None;
    GameMgr.__UpdateItemList__Delegate = None;
    GameMgr.__UpdateWebzenItemList__Delegate = None;
}

function RefreshPage()
{
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x5d
    if(MM == none)
    {
        Log("MM is none");
        MM = page_Main.rMM;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0xbe
    if(GameMgr == none)
    {
        Log("GameMgr is none");
        GameMgr = page_Main.rGameMgr;
    }
    super(BTNetGUIPageHK).RefreshPage();
    MM.SetCurpos(2);
    MM.kMainMenu = page_Main;
    InitializeDelegate();
    InitialRoomInfo();
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
    // End:0x30f
    if(float(MM.kTeamID) % float(2) == float(0))
    {
        currentBGM = "bgm_af_theme";
    }
    // End:0x324
    else
    {
        currentBGM = "bgm_rsa_theme";
    }
    page_Main.LastMainPageBGM = currentBGM;
    PlayerOwner().Player.Console.SetOneBGM(currentBGM);
    ChangeButtonStart();
    bReadyToGame = false;
    page_Main.TcpChannel.sfReqChangeUserState(0, 0);
    page_Main.TcpChannel.sfReqIsGameRoomPlaying(MM.kRoomID);
    LastRefreshTime[0] = PlayerOwner().Level.TimeSeconds;
    LastRefreshTime[1] = LastRefreshTime[0];
    // End:0x408
    if(MM.bShowWarningHostPoint)
    {
        SendPingAndSendHostPoint();
        // End:0x408
        if(MM.bShowMessageHostUnsuitableness)
        {
            MessageHostUnsuitableness();
        }
    }
    MM.SetTcpTimeOutInUI();
    // End:0x46d
    if(Controller.ViewportOwner.Actor.Level == none)
    {
        PlayerOwner().dblog("Level is none!!!!!!!!!!!!!!!!!!!!");
    }
    // End:0x4b1
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        MM.__QuestLog__Delegate = QuestLog;
    }
    page_Main.rMM.__OnRecivedPing__Delegate = OnReceivedPing;
}

function QuestLog(string Msg)
{
    // End:0x75
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        Log("[BTPageRoomLobby::QuestLog]");
        page_Main.AddChatLog("QuestLog = " $ Msg, 5, true);
    }
}

function SetCharacterInfo(string ClanName, CharInfo btCharInfo)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageRoomLobby::SetCharacterInfo]");
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    // End:0x259
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

function InternalOnClose(optional bool bCanceled)
{
    UnresolvedNativeFunction_97("BTPageRoomLobby::InternalOnClose()");
    Log("[BTPageRoomLobby::InternalOnClose] ");
    OnClose(bCanceled);
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    local Engine.Interactions.EInputKey iKey;
    local Engine.Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x5b
    if(iKey == 18 && iAction == 5)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(196), 5, true);
    }
    // End:0x86
    if(iKey == 13)
    {
        TPChat.InputBox.FocusFirst(none);
        return true;
    }
    return false;
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageRoomLobby_TCP TCP;

    TCP = new class'BTPageRoomLobby_TCP';
    TCP.Owner = self;
    return TCP;
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageRoomLobby_TcpLogin TCP;

    TCP = new class'BTPageRoomLobby_TcpLogin';
    TCP.Owner = self;
    return TCP;
}

function BTConsole GetConsole()
{
    return BTConsole(Controller.ViewportOwner.Console);
}

function InitialRoomInfo()
{
    Log("[BTPageRoomLobby::InitialRoomInfo]");
    MM.ResetGameFlag();
    GetConsole().SetTermBetweenBGM(2.0);
    GetConsole().BGMFadeInTime = class'BTConsole'.default.BGMFadeInTime;
    GetConsole().BGMFadeOutTime = class'BTConsole'.default.BGMFadeOutTime;
    page_Main.TcpChannel.sfReqRoomUserList(MM.kRoomID);
    page_Main.TcpChannel.sfReqGameRoomInfo(MM.kRoomID, MM.kUID);
    page_Main.TcpChannel.sfReqCharInfo();
    GetConsole().ClearMessageItems();
    GetConsole().SetChatEnabled(false);
    TPMessenger.RemoveAll(TPMessenger.0);
    page_Main.TcpChannel.sfReqChannelUserListInGameRoom(MM.kChannelID, 0, 30);
    page_Main.TcpChannel.sfReqFriendList();
    page_Main.TcpChannel.sfReqBlockUserList();
}

function string FindFriendlyGameMode(string GameMode)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4c [While If]
    if(i < GameModes.Length)
    {
        // End:0x42
        if(GameModes[i].ClassName == GameMode)
        {
            return GameModes[i].UserFriendlyName;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function string FindFriendlyGameModeByIndex(int GameModeIndex)
{
    return class'wGameSettings'.static.GetGameModeByIndex(GameModeIndex).UserFriendlyName;
}

function UpdateRoomInfoByMatchMaker()
{
    local string UserCountString, strGameTime;

    Log("[BTPageRoomLobby::UpdateRoomInfoByMatchMaker]");
    // End:0x75
    if(MM.kGame_GameMode == class'wGameSettings'.static.GetModeIndex_Defence())
    {
        UserCountString = string(MM.kGame_UserCount);
        strGameTime = "-";
    }
    // End:0xc8
    else
    {
        UserCountString = string(MM.kGame_UserCount / 2) @ "vs" @ string(MM.kGame_UserCount / 2);
        strGameTime = string(MM.kGame_GameTime) $ ":00";
    }
    LabelTeamTopLine.Caption = MM.kServerGroupName $ " / " $ MM.kServerName $ " / " $ MM.kChannelName $ " / [" $ string(MM.kRoomID) $ "] " $ MM.kGame_RoomName;
    self.TPRoomInfo.SetData(MM.MapSettings.GetMapInfo(MM.kGame_MapName).FriendlyName, MM.kGame_MapName, FindFriendlyGameModeByIndex(MM.kGame_GameMode), MM.kGame_TeamBalance, strGameTime, string(MM.kGame_GameRound), UserCountString, MM.kGame_GameMode, MM.BotDifficulty, MM.kGame_WeaponLimit, MM.BotUserTeam);
}

function bool IsUserCountFull()
{
    // End:0x67
    if(MM.UserInfos.Length == MM.kGame_UserCount)
    {
        PlayerOwner().dblog("(MM.UserInfos.Length == MM.kGame_UserCount) == true");
    }
    // End:0xaa
    else
    {
        PlayerOwner().dblog("(MM.UserInfos.Length == MM.kGame_UserCount) == false");
    }
    return MM.UserInfos.Length == MM.kGame_UserCount;
}

function int GetUserCount()
{
    return MM.UserInfos.Length;
}

function int GetReadyAllUserCount()
{
    return TPTeamList[0].ACLList.GetReadyUserCount() + TPTeamList[1].ACLList.GetReadyUserCount();
}

function bool IsUserAllReady()
{
    // End:0x16
    if(MM.kGame_UserCount <= 1)
    {
        return false;
    }
    // End:0x42
    if(bAllReady)
    {
        PlayerOwner().dblog("bAllReady == true");
    }
    // End:0x63
    else
    {
        PlayerOwner().dblog("bAllReady == false");
    }
    return bAllReady;
}

function StartGame(optional string IP, optional int Port)
{
    local int i, j;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local PlayerController PC;
    local OptionGraphicAdvanceInfo Settings;
    local bool bSuccessStartMatch;
    local wMyPlayerStatus MyStatus;

    bSuccessStartMatch = false;
    Log("[BTPageRoomLobby::StartGame]");
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    // End:0x93
    if(MyStatus == none)
    {
        Log("MyStatus is none");
        MyStatus = page_Main.rMyStatus;
    }
    PC = PlayerOwner();
    Settings = class'BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
    class'BTTPOptionGraphicAdvanceHK'.static.SetAdvanceSettings(PC, Settings, Settings, false, true);
    GetConsole().FontReset();
    page_Main.CompleteDurabilityWarningItem();
    MM.bRecvProtocolUpdateQuest = false;
    MM.GenerateMissionList(GameMgr);
    // End:0x15a
    if(MM.UserInfos.Length <= 5 && !MM.BotTutorial)
    {
        MM.bNoUpdateQuestInfo = true;
    }
    // End:0x16b
    else
    {
        MM.bNoUpdateQuestInfo = false;
    }
    MyStatus.ItemList.Length = GameMgr.InstanceItemLists.Length;
    i = 0;
    J0x191:
    // End:0x3b4 [While If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        // End:0x3aa
        if(instanceInfo != none)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            MyStatus.ItemList[i].iItemID = instanceInfo.ItemID;
            MyStatus.ItemList[i].iUniqueID = instanceInfo.UniqueID;
            MyStatus.ItemList[i].iItemType = ItemInfo.ItemType;
            MyStatus.ItemList[i].iDurability = instanceInfo.Durability;
            MyStatus.ItemList[i].iUntilTime = instanceInfo.UntilTime;
            MyStatus.ItemList[i].iSlotPosition = instanceInfo.SlotPosition;
            MyStatus.ItemList[i].iDamageDegree = instanceInfo.DamageDegree;
            MyStatus.ItemList[i].iItemUsed = instanceInfo.ItemState;
            MyStatus.ItemList[i].iOverlapCount = instanceInfo.OverlapCount;
            MyStatus.ItemList[i].iPartsID = instanceInfo.PartID;
            MyStatus.ItemList[i].iPaintID = instanceInfo.PaintID;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x191;
    }
    MyStatus.SkillList.Length = GameMgr.SkillBoxList.Length;
    i = 0;
    J0x3da:
    // End:0x4d9 [While If]
    if(i < GameMgr.SkillBoxList.Length)
    {
        MyStatus.SkillList[i].bySlotPosition = GameMgr.SkillBoxList[i].SlotPos;
        MyStatus.SkillList[i].iSkillID = GameMgr.SkillBoxList[i].SkillID;
        MyStatus.SkillList[i].iUniqueSkillID = GameMgr.SkillBoxList[i].UniqueSkillID;
        MyStatus.SkillList[i].iUntilTime = GameMgr.SkillBoxList[i].UntilTime;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3da;
    }
    MyStatus.QuickSlotList.Length = GameMgr.QuickSlotBoxList.Length;
    i = 0;
    J0x4ff:
    // End:0x777 [While If]
    if(i < GameMgr.QuickSlotBoxList.Length)
    {
        MyStatus.QuickSlotList[i].iUniqueSlotID = GameMgr.QuickSlotBoxList[i].QuickSlotID;
        MyStatus.QuickSlotList[i].strName = GameMgr.QuickSlotBoxList[i].QuickSlotName;
        j = 0;
        J0x58d:
        // End:0x76d [While If]
        if(j < 4)
        {
            // End:0x636
            if(GameMgr.QuickSlotBoxList[i].SkillID[j] == 0)
            {
                instanceInfo = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[i].UniqueID[j]);
                // End:0x633
                if(instanceInfo != none)
                {
                    MyStatus.QuickSlotList[i].iPartsID[j] = instanceInfo.PartID;
                }
            }
            // End:0x657
            else
            {
                MyStatus.QuickSlotList[i].iPartsID[j] = 0;
            }
            MyStatus.QuickSlotList[i].iItemID[j] = GameMgr.QuickSlotBoxList[i].ItemID[j];
            MyStatus.QuickSlotList[i].iSkillID[j] = GameMgr.QuickSlotBoxList[i].SkillID[j];
            MyStatus.QuickSlotList[i].iUniqueItemUID[j] = GameMgr.QuickSlotBoxList[i].UniqueID[j];
            MyStatus.QuickSlotList[i].iUniqueSkillID[j] = GameMgr.QuickSlotBoxList[i].UniqueSkillID[j];
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x58d;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4ff;
    }
    MM.bForceGameOut = false;
    MM.BotTutorial = MM.kGame_GameMode == 8;
    MM.BeginnerMode = MM.kGame_GameMode == 11;
    // End:0x825
    if(MM.InGamePlaying == true)
    {
        Log("BTPageRoomLobby::StartGame() MM.InGamePlaying is true. error!!");
        return;
    }
    // End:0x870
    if(MM.bIsOwner == true)
    {
        bSuccessStartMatch = MM.StartMatch(MM.kRoomID, MM.bIsOwner);
    }
    // End:0x8ad
    else
    {
        bSuccessStartMatch = MM.StartMatch(MM.kRoomID, MM.bIsOwner, IP, Port);
    }
    CloseNetworkCheckingWindow(true);
    MM.bPendingStarted = false;
    // End:0x946
    if(bSuccessStartMatch == true)
    {
        MM.InGameOver = 0;
        PlayerOwner().ResetKeySleepTime();
        MM.InGamePlaying = true;
        MM.StartLoading();
        SetMatchBGM();
        GetConsole().SetChatEnabled(true);
        GetConsole().TcpHandler = page_Main.TcpChannel;
    }
    // End:0x9df
    else
    {
        Log("BTPageRoomLobby::StartGame() MM.StartMatch() return false. error!");
        MM.ClearConsole();
        class'BTWindowInfoHK'.static.ShowWindow(Controller, "", GetErrMsg(GetLastErrCode()));
        MM.SendErrorReportC(GetLastErrCode(), 5, GetErrMsg(GetLastErrCode()));
    }
}

function GameOver()
{
    Log("[BTPageRoomLobby::GameOver]");
    // End:0x82
    if(MM.IsLoading() == true)
    {
        page_Main.bWarningDurabilityAndExpired = false;
        Log("BTPageRoomLobby::GameOver() MM.IsLoading() return true");
    }
    // End:0xf8
    else
    {
        // End:0xf8
        if(MM.InGamePlaying)
        {
            MM.InGameOver = 1;
            page_Main.SetPage(12, false);
            // End:0xf8
            if(PlayerOwner().myHUD != none)
            {
                PlayerOwner().myHUD.bShowScoreBoard = false;
                PlayerOwner().myHUD.bShowLocalStats = false;
            }
        }
    }
    ResetCombatLog();
    Controller.ViewportOwner.Actor.Level.SetCapture(false);
    GetConsole().FontReset();
    page_Main.TcpChannel.sfReqCharInfo();
    page_Main.TcpChannel.sfReqGetServerTime();
}

function SetMatchBGM()
{
    Log("[BTPageRoomLobby::SetMatchBGM]");
    GetConsole().SetTermBetweenBGM(9999.0);
    GetConsole().StopBGM();
    GetConsole().BGMFadeInTime = 0.50;
    GetConsole().BGMFadeOutTime = 3.0;
}

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
    local MessageItem msgItem;

    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatClan());
    TPChat.AddChatHistory(2, cL, class'BTUIColorPoolHK'.static.ChatClan());
    // End:0x8d
    if(MM.InGamePlaying)
    {
        msgItem = GetConsole().ConstructMessageItem(cL, 5);
        GetConsole().AddMessageItem(msgItem);
    }
}

function WhisperChatLog(string cL)
{
    local MessageItem msgItem;

    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatWhisper());
    TPChat.AddChatHistory(1, cL, class'BTUIColorPoolHK'.static.ChatWhisper());
    // End:0x8c
    if(MM.InGamePlaying)
    {
        msgItem = GetConsole().ConstructMessageItem(cL, 4);
        GetConsole().AddMessageItem(msgItem);
    }
}

function SelfChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatSelf());
}

function SystemChatLog(string cL)
{
    local MessageItem msgItem;

    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(1, cL, class'BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(2, cL, class'BTUIColorPoolHK'.static.ChatSystem());
    // End:0xb1
    if(MM.InGamePlaying)
    {
        msgItem = GetConsole().ConstructMessageItem(cL, 6);
        GetConsole().AddMessageItem(msgItem);
    }
}

function BroadCastItemChatLog(string cL)
{
    local MessageItem msgItem;

    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatBroadCastItem());
    // End:0x68
    if(MM.InGamePlaying)
    {
        msgItem = GetConsole().ConstructMessageItem(cL, 10);
        GetConsole().AddMessageItem(msgItem);
    }
}

function TeamChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, class'BTUIColorPoolHK'.static.ChatTeam());
}

function bool rfAckGameHostInfo(int GameNumber, string UserID, string IP, int Port, int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckGameHostInfo] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    return true;
}

function bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying)
{
    Log("[BTPageRoomLobby::rfAckIsGameRoomPlaying]");
    CurrentRoomState = IsPlaying;
    // End:0x4d
    if(CurrentRoomState == 0)
    {
        bReadyToGame = false;
    }
    ChangeButtonStart();
    return true;
}

function bool rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log("[rfAckGameRoomInfo] GameType=" $ RoomInfo.GameClass);
    // End:0x456
    if(Result == 0)
    {
        // End:0x453
        if(MM.kRoomID == RoomInfo.RoomNumber)
        {
            MM.szRoomName = RoomInfo.RoomName;
            MM.szMapName = RoomInfo.MapName;
            MM.szGameClass = class'wGameSettings'.static.GetGameModeByIndex(RoomInfo.GameModeNum).ClassName;
            MM.iMaxPlayers = RoomInfo.MaxUserCnt;
            MM.iTimeLimit = RoomInfo.GameMinute;
            MM.iGoalRound = RoomInfo.GameRound;
            MM.eWeaponLimit = RoomInfo.WeaponLimit;
            Log("RoomInfo.PlayWithBots=" $ string(RoomInfo.PlayWithBots));
            MM.PlayWithBots = RoomInfo.PlayWithBots != 0;
            MM.BotUserTeam = RoomInfo.UserTeamNum;
            MM.BotDifficulty = RoomInfo.BotModeDifficulty;
            MM.BotNum0 = RoomInfo.MaxAFUserAndBotNum;
            MM.BotNum1 = RoomInfo.MaxRSAUserAndBotNum;
            // End:0x1f5
            if(RoomInfo.BombHold == 0)
            {
                MM.bMultiBomb = true;
            }
            // End:0x206
            else
            {
                MM.bMultiBomb = false;
            }
            MM.kGame_RoomName = RoomInfo.RoomName;
            // End:0x261
            if(RoomInfo.RoomOwner == MM.kUserName)
            {
                MM.bIsOwner = true;
                MM.kGame_bOwner = true;
            }
            // End:0x283
            else
            {
                MM.bIsOwner = false;
                MM.kGame_bOwner = false;
            }
            MM.kGame_Password = RoomInfo.Password;
            MM.kGame_MapNum = RoomInfo.MapNum;
            MM.kGame_MapName = RoomInfo.MapName;
            MM.kGame_GameMode = RoomInfo.GameModeNum;
            MM.kGame_UserCount = RoomInfo.MaxUserCnt;
            MM.kGame_GameTime = RoomInfo.GameMinute;
            MM.kGame_GameRound = RoomInfo.GameRound;
            MM.kGame_WeaponLimit = RoomInfo.WeaponLimit;
            // End:0x379
            if(RoomInfo.IsHardCore != 0)
            {
                MM.kGame_bHardCore = true;
            }
            // End:0x38a
            else
            {
                MM.kGame_bHardCore = false;
            }
            bPrevTeamBalance = false;
            // End:0x3b8
            if(RoomInfo.IsTeamValance != 0)
            {
                MM.kGame_TeamBalance = true;
            }
            // End:0x3c9
            else
            {
                MM.kGame_TeamBalance = false;
            }
            PrevGameMode = -1;
            MM.UpdateGameRoomInfo(MM);
            UpdateRoomInfoByMatchMaker();
            bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
            // End:0x453
            if(IsUserAllReady() && IsUserCountFull())
            {
                PlayerOwner().ResetKeySleepTime();
            }
        }
    }
    // End:0x46f
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckSelectMap]");
    // End:0xae
    if(Result == 0)
    {
        MM.szMapName = MapName;
        MM.kGame_MapName = MapName;
        MM.kGame_MapNum = MM.MapSettings.GetMapInfo(MapName).MapID;
        MM.UpdateGameRoomInfo(MM);
        UpdateRoomInfoByMatchMaker();
    }
    // End:0xc7
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckChangeGameMode]");
    // End:0x96
    if(Result == 0)
    {
        MM.szGameClass = class'wGameSettings'.static.GetGameModeByIndex(GameModeNum).ClassName;
        MM.kGame_GameMode = GameModeNum;
        MM.UpdateGameRoomInfo(MM);
        UpdateRoomInfoByMatchMaker();
    }
    // End:0xaf
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckStartGame]");
    // End:0x277
    if(Result == 0)
    {
        // End:0x9c
        if(MM.InGamePlaying == true)
        {
            Log("BTPageRoomLobby::rfAckStartGame() MM.InGamePlaying is true. error!!");
            bReadyToGame = false;
            ChangeButtonStart();
            return false;
        }
        Log("[BTPageRoomLobby::rfAckStartGame] MM.kIsInDSChannel=" $ string(MM.kIsInDSChannel) $ " bTutorial=" $ string(BTTcpHandler(page_Main.TcpChannel).bTutorial));
        // End:0x1b4
        if(MM.kIsInDSChannel && !BTTcpHandler(page_Main.TcpChannel).bTutorial)
        {
            // End:0x1a3
            if(MM.kGame_bOwner)
            {
                MM.kDS_SavedOwnerInfo = true;
                MM.bIsOwner = false;
                MM.kGame_bOwner = false;
                bReadyToGame = true;
                ChangeButtonStart();
            }
            // End:0x1b4
            else
            {
                MM.kDS_SavedOwnerInfo = false;
            }
        }
        Log("MM.bIsOwner=" $ string(MM.bIsOwner));
        Log("MM.kGame_bOwner=" $ string(MM.kGame_bOwner));
        // End:0x221
        if(MM.bIsOwner == true)
        {
            StartNetworkChecking(ClientsCount);
        }
        // End:0x253
        else
        {
            // End:0x234
            if(bReadyToGame)
            {
                StartNetworkChecking(0);
            }
            // End:0x253
            else
            {
                Log("Start GameRoom Without Me");
                return true;
            }
        }
        MM.InGameOver = 0;
        MM.ResultIsBootyGet = false;
    }
    // End:0x343
    else
    {
        Controller.PopPage();
        bReadyToGame = false;
        ChangeButtonStart();
        // End:0x2df
        if(Result == 514)
        {
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 48);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
        }
        // End:0x343
        else
        {
            // End:0x32a
            if(Result == 627)
            {
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 49);
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
            }
            // End:0x343
            else
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
}

function bool rfAckRegisterOtherUdpInfo(int UID, string IP, int Port, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    local string strInterventionErrLog;

    Log("[BTPageRoomLobby::rfAckRegisterOtherUdpInfo] UID=" $ string(UID) $ " IP=" $ IP $ " Port=" $ string(Port) $ " NatType=" $ string(NatType) $ " Intervention=" $ string(Intervention) $ "HostInnerIP=" $ HostInnerIP $ "HostInnerPort=" $ string(HostInnerPort));
    // End:0x2bb
    if(MM.bIsOwner == true)
    {
        // End:0x1fa
        if(Intervention == 1)
        {
            // End:0x1fa
            if(MM.IsCompletedLoading() == false)
            {
                Log("[BTPageRoomLobby::rfAckRegisterOtherUdpInfo] Host Loading. Can't process intervention user");
                strInterventionErrLog = "Host Loading. Can't process intervention user. UID=" $ string(UID) $ " IP=" $ IP $ " Port=" $ string(Port) $ " Intervention=" $ string(Intervention);
                page_Main.TcpChannel.sfReqWriteServerLog(0, strInterventionErrLog);
                return true;
            }
        }
        // End:0x2b8
        if(MM.HostInitNatChecker(UID, IP, Port, NatType, Intervention) == false)
        {
            // End:0x2b8
            if(GetLastErrCode() == 5087)
            {
                Log("[BTPageRoomLobby::rfAckRegisterOtherUdpInfo] Host Loading. Can't process all loading user");
                page_Main.TcpChannel.sfReqForceFailedClientLoading(UID, GetLastErrCode());
            }
        }
    }
    // End:0x2ed
    else
    {
        MM.ClientInitNatChecker(UID, IP, Port, NatType, Intervention, HostInnerIP, HostInnerPort);
    }
    return true;
}

function bool rfAckDisconnectGame(int Result, int DisconnectUserID, string DisconnectUserName)
{
    Log("[BTPageRoomLobby::rfAckDisconnectGame] Result:" $ string(Result) $ ", ErrMsg:" $ DisconnectUserName);
    // End:0x15d
    if(Result == 0)
    {
        bReadyToGame = false;
        ChangeButtonStart();
        // End:0xef
        if(DisconnectUserID == MM.kUID)
        {
            Log("[BTPageRoomLobby::rfAckDisconnectGame] DisconnectUserID:" $ string(DisconnectUserID) $ " UID:" $ string(MM.kUID));
            MM.EndMatch();
        }
        // End:0x15a
        if(MM.InGamePlaying == true)
        {
            // End:0x15a
            if(MM.bIsOwner == true)
            {
                // End:0x15a
                if(MM.kUID != DisconnectUserID)
                {
                    MM.ForceDisconnectUDPConnectionHostSide(DisconnectUserID);
                    MM.SetDisconnectedUser(true, DisconnectUserID);
                }
            }
        }
    }
    // End:0x176
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    Log("[END] rfAckGameOver");
    Log("[BTPageRoomLobby::rfAckGameOver()] Result=" $ string(Result) $ ", ErrMsg:[" $ ErrMsg $ "]");
    // End:0x26d
    if(Result == 0)
    {
        // End:0xc6
        if(MatchMaker == none)
        {
            Log("[CYH] BTPageRoomLobby::rfAckGameOver() MatchMaker is none. error!!");
            return false;
        }
        // End:0x14f
        if(MM.bIsLoading == true)
        {
            Log("[CYH] BTPageRoomLobby::rfAckGameOver() MM.bIsLoading is true. ForceGameOver() call.");
            MM.ForceGameOver(PlayerOwner().PlayerReplicationInfo);
            return false;
        }
        // End:0x1d2
        if(MM.InGamePlaying == true)
        {
            // End:0x1b6
            if(Result == 0)
            {
                Log("[CYH] BTPageRoomLobby::rfAckGameOver() Normal game over process.");
            }
            // End:0x1cf
            else
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
        // End:0x26a
        else
        {
            // End:0x240
            if(MM.bPendingStarted == true)
            {
                Log("BTPageRoomLobby::rfAckGameOver() MM.bPendingStarted == true.");
                FailedNetworkChecking(GetErrMsg(5071), 5071);
            }
            // End:0x26a
            else
            {
                Log("[CYH] BTPageRoomLobby::rfAckGameOver()");
            }
        }
    }
    // End:0x286
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckGameOverEnd(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckGameOverEnd]");
    // End:0x3b
    if(Result == 0)
    {
        GameOver();
    }
    // End:0x54
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    ChangeButtonStart();
    return true;
}

function bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local wMatchUserInfo UserInfo;
    local int NewIndex;
    local string RecvClanName;

    Log("[BTPageRoomLobby::rfAckEnterRoom]");
    // End:0x580
    if(Result == 0)
    {
        UserInfo = new class'wMatchUserInfo';
        NewIndex = MM.UserInfos.Length;
        MM.UserInfos[NewIndex] = UserInfo;
        MM.UserInfos[NewIndex].UID = UID;
        MM.UserInfos[NewIndex].UserName = UserID;
        MM.UserInfos[NewIndex].Grade = Grade;
        MM.UserInfos[NewIndex].IsHost = false;
        MM.UserInfos[NewIndex].UserIP = UserIP;
        MM.UserInfos[NewIndex].TeamNum = TeamNum;
        // End:0x166
        if(ClanName == "" || ClanName == "none")
        {
            RecvClanName = "";
        }
        // End:0x171
        else
        {
            RecvClanName = ClanName;
        }
        MM.UserInfos[NewIndex].ClanName = RecvClanName;
        MM.UserInfos[NewIndex].ClanMark = Clan_Mark_Pattern;
        MM.UserInfos[NewIndex].ClanBG = Clan_Mark_BG;
        MM.UserInfos[NewIndex].ClanBL = Clan_Mark_BL;
        MM.UserInfos[NewIndex].IsLookingFor = IsLookFor;
        MM.UserInfos[NewIndex].ClanLevel = ClanLevel;
        MM.UserInfos[NewIndex].LevelMarkID = LevelMarkID;
        MM.UserInfos[NewIndex].TitleMarkID = TitleMarkID;
        MM.UserInfos[NewIndex].Reserved1 = Reserved1;
        MM.UserInfos[NewIndex].Reserved2 = Reserved2;
        MM.UserInfos[NewIndex].Reserved3 = Reserved3;
        // End:0x3fd
        if(UID == MM.kUID)
        {
            MM.My_iTeam = TeamNum;
            MM.kTeamID = TeamNum;
            // End:0x39e
            if(Reserved1 != 2)
            {
                SaveUserData(MakeTeamMemberData(UID, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, Grade, UserID, RecvClanName, 0, 1, 0, UserIP, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, TeamNum, Reserved2, Reserved3, true));
            }
            // End:0x3fa
            else
            {
                SaveUserData(MakeTeamMemberData(UID, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, Grade, UserID, RecvClanName, 0, 1, 0, UserIP, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, TeamNum, Reserved2, Reserved3, true, true));
            }
        }
        // End:0x508
        else
        {
            // End:0x467
            if(Reserved1 != 2)
            {
                SaveUserData(MakeTeamMemberData(UID, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, Grade, UserID, RecvClanName, 0, 1, 0, UserIP, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, TeamNum, Reserved2, Reserved3, false));
            }
            // End:0x4c3
            else
            {
                SaveUserData(MakeTeamMemberData(UID, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, Grade, UserID, RecvClanName, 0, 1, 0, UserIP, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, TeamNum, Reserved2, Reserved3, false, true));
            }
            // End:0x508
            if(MM.InGamePlaying == false && GetUserCount() == 2 && MM.kGame_bOwner)
            {
                PlayerOwner().ResetKeySleepTime();
            }
        }
        // End:0x537
        if(MM.bIsOwner)
        {
            page_Main.rMM.SendPingToOtherUser(UserIP);
        }
        RefreshUserList();
        bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
    }
    // End:0x5a8
    else
    {
        page_Main.EndAutoMove();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    SendPingAndSendHostPoint();
    return true;
}

function bool rfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    local int lp1, i2;

    Log("[BTPageRoomLobby::rfAckLeaveRoom]");
    // End:0x2af
    if(Result == 0)
    {
        // End:0xe6
        if(UserID == MM.kUserName)
        {
            MM.SetHostBlocking(false);
            Log("page_Main.TcpChannel.sfReqEnterChannel(" $ string(MM.kChannelID) $ ")");
            page_Main.iRoomNum = -1;
            MM.PI_LeavelRoom();
            page_Main.TcpChannel.sfReqEnterChannel(MM.kChannelID);
        }
        // End:0x2ac
        else
        {
            lp1 = 0;
            J0xed:
            // End:0x14f [While If]
            if(lp1 < MM.UserInfos.Length)
            {
                // End:0x145
                if(MM.UserInfos[lp1].UID == UID)
                {
                    MM.UserInfos.Remove(lp1, 1);
                }
                // End:0x14f
                else
                {
                    ++ lp1;
                    // This is an implied JumpToken; Continue!
                    goto J0xed;
                }
            }
            i2 = 0;
            J0x156:
            // End:0x1a2 [While If]
            if(i2 < UserListDB.Length)
            {
                // End:0x198
                if(UserListDB[i2].DataPerColumn[6].IntValue == UID)
                {
                    UserListDB.Remove(i2, 1);
                }
                ++ i2;
                // This is an implied JumpToken; Continue!
                goto J0x156;
            }
            RefreshUserList();
            bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
            // End:0x2ac
            if(MM.GMLevelFlag & 3 > 0 && MM.UserInfos.Length - GMList.Length <= 0)
            {
                Log("page_Main.TcpChannel.sfReqEnterChannel(" $ string(MM.kChannelID) $ ")");
                page_Main.iRoomNum = -1;
                MM.PI_LeavelRoom();
                page_Main.TcpChannel.sfReqEnterChannel(MM.kChannelID);
            }
        }
    }
    // End:0x2df
    else
    {
        page_Main.EndAutoMove();
        bSafeLeaveRoom = false;
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    SendPingAndSendHostPoint();
    return true;
}

function bool rfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    local int PrevTeam;
    local wMatchUserInfo mui;
    local BTAutoColumnListDataHK Data;

    Log("[BTPageRoomLobby::rfAckChangeTeam]");
    // End:0x1cd
    if(Result == 0)
    {
        // End:0xf9
        if(UID == MM.kUID)
        {
            MM.My_iTeam = TeamNum;
            MM.kTeamID = TeamNum;
            ChangeButtonStart();
            // End:0xac
            if(float(MM.kTeamID) % float(2) == float(0))
            {
                currentBGM = "bgm_af_theme";
            }
            // End:0xc1
            else
            {
                currentBGM = "bgm_rsa_theme";
            }
            page_Main.LastMainPageBGM = currentBGM;
            PlayerOwner().Player.Console.SetOneBGM(currentBGM);
        }
        mui = MM.GetUserInfoByUID(UID);
        mui.TeamNum = TeamNum;
        PrevTeam = 0;
        Data = TPTeamList[PrevTeam].ACLList.FindTeamMember(UID);
        // End:0x192
        if(Data == none)
        {
            PrevTeam = 1;
            Data = TPTeamList[PrevTeam].ACLList.FindTeamMember(UID);
        }
        RemoveInUserList(UID);
        Data.DataPerColumn[9].IntValue = TeamNum;
        SaveUserData(Data);
        RefreshUserList();
    }
    // End:0x1e6
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckConnectGame(int UserID, int Result)
{
    Log("[BTPageRoomLobby::rfAckConnectGame]");
    // End:0x10e
    if(Result == 0)
    {
        // End:0xd3
        if(MM.bIsOwner == true)
        {
            // End:0x9d
            if(MM.InGamePlaying == true)
            {
                page_Main.TcpChannel.sfReqSetUserBootySeedValue(UserID, MM.playingLevelInfo.Game.GetBootySeedValue());
            }
            // End:0xd0
            else
            {
                // End:0xd0
                if(MM.IsLoading() == true)
                {
                    page_Main.TcpChannel.sfReqSetUserBootySeedValue(UserID, 0);
                }
            }
        }
        // End:0x10b
        else
        {
            // End:0x10b
            if(UserID == MM.kUID)
            {
                MyAction = 1;
                page_Main.TcpChannel.sfReqGetIsHostBlocking();
            }
        }
    }
    // End:0x233
    else
    {
        // End:0x167
        if(MM.kIsInDSChannel && MM.kDS_SavedOwnerInfo)
        {
            MM.kDS_SavedOwnerInfo = false;
            MM.kGame_bOwner = true;
            MM.bIsOwner = true;
        }
        bReadyToGame = false;
        ChangeButtonStart();
        Controller.PopPage();
        // End:0x1cf
        if(Result == 514)
        {
            class'BTWindowDefineARHK'.static.ShowInfo(Controller, 48);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
        }
        // End:0x233
        else
        {
            // End:0x21a
            if(Result == 627)
            {
                class'BTWindowDefineARHK'.static.ShowInfo(Controller, 49);
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
            }
            // End:0x233
            else
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
}

function bool rfAckUpdateScore(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> EXPBonuses, array<int> Points, array<int> PointBonuses, array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID)
{
    local int lp1, lp2, k, i, SortOrder;

    local bool bSwap;
    local ResultInfo Result, tmp;

    Log("[BTPageRoomLobby::rfAckUpdateScore]");
    MM.ResultInfos.Remove(0, MM.ResultInfos.Length);
    lp1 = 0;
    J0x4d:
    // End:0x2a1 [While If]
    if(lp1 < UserIDs.Length)
    {
        Log("[BTPageRoomLobby::rfAckUpdateScore] UID=" $ string(UserIDs[lp1]) $ " Nick=" $ NickNames[lp1] $ " Scores=" $ string(Scores[lp1]) $ " Kills=" $ string(Kills[lp1]) $ " Assists=" $ string(Assists[lp1]) $ " Deaths=" $ string(Deaths[lp1]) $ " EXP=" $ string(EXPs[lp1]) $ " EXPBonus=" $ string(EXPBonuses[lp1]) $ " Point=" $ string(Points[lp1]) $ " PointBonus=" $ string(PointBonuses[lp1]));
        Result.UserID = UserIDs[lp1];
        Result.Nick = NickNames[lp1];
        Result.Score = Scores[lp1];
        Result.Kill = Kills[lp1];
        Result.Assist = Assists[lp1];
        Result.Death = Deaths[lp1];
        Result.Exp = EXPs[lp1];
        Result.ExpBonus = EXPBonuses[lp1];
        Result.Point = Points[lp1];
        Result.PointBonus = PointBonuses[lp1];
        Result.Team = TeamIDs[lp1];
        MM.ResultInfos[lp1] = Result;
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    lp1 = 0;
    J0x2a8:
    // End:0x343 [While If]
    if(lp1 < MM.ResultInfos.Length)
    {
        Log("[BTPageRoomLobby::rfAckUpdateScore] BEFORE UID=" $ string(MM.ResultInfos[lp1].UserID) $ " Score=" $ string(MM.ResultInfos[lp1].Score));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x2a8;
    }
    lp1 = 1;
    J0x34a:
    // End:0x6bb [While If]
    if(lp1 < MM.ResultInfos.Length)
    {
        lp2 = lp1 - 1;
        J0x371:
        // End:0x6b1 [While If]
        if(lp2 >= 0)
        {
            // End:0x3c3
            if(MM.ResultInfos[lp2].Score < MM.ResultInfos[lp2 + 1].Score)
            {
                SortOrder[0] = 2;
            }
            // End:0x412
            else
            {
                // End:0x409
                if(MM.ResultInfos[lp2].Score == MM.ResultInfos[lp2 + 1].Score)
                {
                    SortOrder[0] = 1;
                }
                // End:0x412
                else
                {
                    SortOrder[0] = 0;
                }
            }
            // End:0x459
            if(MM.ResultInfos[lp2].Kill < MM.ResultInfos[lp2 + 1].Kill)
            {
                SortOrder[1] = 2;
            }
            // End:0x4a8
            else
            {
                // End:0x49f
                if(MM.ResultInfos[lp2].Kill == MM.ResultInfos[lp2 + 1].Kill)
                {
                    SortOrder[1] = 1;
                }
                // End:0x4a8
                else
                {
                    SortOrder[1] = 0;
                }
            }
            // End:0x4f0
            if(MM.ResultInfos[lp2].Assist < MM.ResultInfos[lp2 + 1].Assist)
            {
                SortOrder[2] = 2;
            }
            // End:0x541
            else
            {
                // End:0x537
                if(MM.ResultInfos[lp2].Assist == MM.ResultInfos[lp2 + 1].Assist)
                {
                    SortOrder[2] = 1;
                }
                // End:0x541
                else
                {
                    SortOrder[2] = 0;
                }
            }
            // End:0x589
            if(MM.ResultInfos[lp2].Death > MM.ResultInfos[lp2 + 1].Death)
            {
                SortOrder[3] = 2;
            }
            // End:0x5da
            else
            {
                // End:0x5d0
                if(MM.ResultInfos[lp2].Death == MM.ResultInfos[lp2 + 1].Death)
                {
                    SortOrder[3] = 1;
                }
                // End:0x5da
                else
                {
                    SortOrder[3] = 0;
                }
            }
            bSwap = false;
            i = 0;
            J0x5e9:
            // End:0x63b [While If]
            if(i < 4)
            {
                // End:0x615
                if(SortOrder[i] == 2)
                {
                    bSwap = true;
                    // This is an implied JumpToken;
                    goto J0x63b;
                }
                // End:0x631
                else
                {
                    // End:0x631
                    if(SortOrder[i] == 0)
                    {
                        bSwap = false;
                    }
                    // End:0x63b
                    else
                    {
                    }
                    ++ i;
                    // This is an implied JumpToken; Continue!
                    goto J0x5e9;
                }
            }
            // End:0x6a7
            if(bSwap)
            {
                tmp = MM.ResultInfos[lp2];
                MM.ResultInfos[lp2] = MM.ResultInfos[lp2 + 1];
                MM.ResultInfos[lp2 + 1] = tmp;
            }
            -- lp2;
            // This is an implied JumpToken; Continue!
            goto J0x371;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x34a;
    }
    lp1 = 0;
    J0x6c2:
    // End:0x7d4 [While If]
    if(lp1 < BonusOwnerID.Length)
    {
        lp2 = 0;
        J0x6d9:
        // End:0x7ca [While If]
        if(lp2 < MM.ResultInfos.Length)
        {
            // End:0x7c0
            if(MM.ResultInfos[lp2].UserID == BonusOwnerID[lp1])
            {
                k = 0;
                J0x722:
                // End:0x7c0 [While If]
                if(k < 9)
                {
                    // End:0x763
                    if(MM.ResultInfos[lp2].BonusID[k] == BonusID[lp1])
                    {
                        // This is an implied JumpToken;
                        goto J0x7c0;
                    }
                    // End:0x7b6
                    else
                    {
                        // End:0x7b6
                        if(MM.ResultInfos[lp2].BonusID[k] == 0)
                        {
                            MM.ResultInfos[lp2].BonusID[k] = BonusID[lp1];
                        }
                        // End:0x7c0
                        else
                        {
                        }
                        ++ k;
                        // This is an implied JumpToken; Continue!
                        goto J0x722;
                    }
                }
            }
            ++ lp2;
            // This is an implied JumpToken; Continue!
            goto J0x6d9;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x6c2;
    }
    lp1 = 0;
    J0x7db:
    // End:0x876 [While If]
    if(lp1 < MM.ResultInfos.Length)
    {
        Log("[BTPageRoomLobby::rfAckUpdateScore]  AFTER UID=" $ string(MM.ResultInfos[lp1].UserID) $ " Score=" $ string(MM.ResultInfos[lp1].Score));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x7db;
    }
    MM.ResultTeamScores = TeamScores;
    MM.ResultBonusOwnerID = BonusOwnerID;
    MM.ResultBonusID = BonusID;
    return true;
}

function bool rfAckEntryItemList(array<int> UserIDs, array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<BtrDouble> UniqueID, array<int> PaintID, int Result, string ErrMsg)
{
    local int lp1, lp2, idx;
    local EquippedItemInfo ItemInfo;

    Log("[BTPageRoomLobby::rfAckEntryItemList]");
    lp1 = 0;
    J0x30:
    // End:0xe1 [While If]
    if(lp1 < UserIDs.Length)
    {
        lp2 = 0;
        J0x47:
        // End:0xd7 [While If]
        if(lp2 < MM.UserInfos.Length)
        {
            // End:0xcd
            if(MM.UserInfos[lp2].UID == UserIDs[lp1])
            {
                MM.UserInfos[lp2].EquippedItems.Remove(0, MM.UserInfos[lp2].EquippedItems.Length);
            }
            // End:0xd7
            else
            {
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0x47;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x30;
    }
    lp1 = 0;
    J0xe8:
    // End:0x34b [While If]
    if(lp1 < UserIDs.Length)
    {
        lp2 = 0;
        J0xff:
        // End:0x341 [While If]
        if(lp2 < MM.UserInfos.Length)
        {
            // End:0x337
            if(MM.UserInfos[lp2].UID == UserIDs[lp1])
            {
                idx = MM.UserInfos[lp2].EquippedItems.Length;
                MM.UserInfos[lp2].EquippedItems[idx] = ItemInfo;
                MM.UserInfos[lp2].EquippedItems[idx].ItemID = ItemIDs[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].SlotPosition = SlotPositions[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].AddPartID = AddPartsID[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].UniqueID = UniqueID[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].Painting_Item_ID = GameMgr.GetPaintingItemIDbyPaintingID(PaintID[lp1]);
                Log("[BTPageRoomLobby::rfAckEntryItemList] UserName=" $ MM.UserInfos[lp2].UserName $ " EquippedItemID=" $ string(MM.UserInfos[lp2].EquippedItems[idx].ItemID));
            }
            ++ lp2;
            // This is an implied JumpToken; Continue!
            goto J0xff;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xe8;
    }
    // End:0x36f
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, string ErrMsg)
{
    local int lp1;

    Log("[:rfAckChangeRoomOwner] GameNum=" $ string(GameNum) $ " OldOnwer=" $ string(OldOwner) $ " NewOwner=" $ string(NewOwner) $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    Log("MyUID=" $ string(MM.kUID));
    // End:0xea
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        Log("[rfAckChangeRoomOwner] error!!");
        return true;
    }
    // End:0x740
    else
    {
        // End:0x1ae
        if(MM.InGamePlaying)
        {
            // End:0x14b
            if(OldOwner == MM.kUID)
            {
                // End:0x14b
                if(MM.kIsInDSChannel && MM.kDS_SavedOwnerInfo)
                {
                    MM.kDS_SavedOwnerInfo = false;
                }
            }
            // End:0x19d
            if(NewOwner == MM.kUID)
            {
                // End:0x189
                if(MM.kIsInDSChannel)
                {
                    MM.kDS_SavedOwnerInfo = true;
                }
                // End:0x19a
                else
                {
                    MM.kDS_SavedOwnerInfo = false;
                }
            }
            // End:0x1ae
            else
            {
                MM.kDS_SavedOwnerInfo = false;
            }
        }
        bShowHostWarning = false;
        lp1 = 0;
        J0x1bd:
        // End:0x32e [While If]
        if(lp1 < MM.UserInfos.Length)
        {
            Log("UID=" $ string(MM.UserInfos[lp1].UID) $ " Name=" $ MM.UserInfos[lp1].UserName);
            // End:0x2bc
            if(MM.UserInfos[lp1].UID == OldOwner)
            {
                Log("MM.UserInfos - Found OldOwner");
                MM.UserInfos[lp1].IsHost = false;
                MM.OldHostName = MM.UserInfos[lp1].UserName;
            }
            // End:0x324
            if(MM.UserInfos[lp1].UID == NewOwner)
            {
                Log("MM.UserInfos - Found NewOwner");
                MM.UserInfos[lp1].IsHost = true;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x1bd;
        }
        // End:0x373
        if(OldOwner == MM.kUID)
        {
            MM.kGame_bOwner = false;
            MM.bIsOwner = false;
            bReadyToGame = false;
        }
        // End:0x4a6
        else
        {
            // End:0x4a6
            if(NewOwner == MM.kUID)
            {
                PlayerOwner().ResetKeySleepTime();
                MM.bShowMessageHostUnsuitableness = true;
                bReadyToGame = false;
                // End:0x3e7
                if(!MM.InGamePlaying)
                {
                    MM.bIsOwner = true;
                    MM.kGame_bOwner = true;
                }
                lp1 = 0;
                J0x3ee:
                // End:0x488 [While If]
                if(lp1 < MM.UserInfos.Length)
                {
                    // End:0x449
                    if(MM.UserInfos[lp1].UID == NewOwner)
                    {
                        page_Main.rMM.SendPingToChannelServer();
                    }
                    // End:0x47e
                    else
                    {
                        page_Main.rMM.SendPingToOtherUser(MM.UserInfos[lp1].UserIP);
                    }
                    ++ lp1;
                    // This is an implied JumpToken; Continue!
                    goto J0x3ee;
                }
                ReceivedPingID.Length = 0;
                ReceivedPingValue.Length = 0;
                SetTimer(5.0, true, 'UserPingRefresh');
            }
        }
        ChangeButtonStart();
        UpdateRoomOwner(NewOwner);
        // End:0x4cc
        if(MM.kIsInDSChannel)
        {
        }
        // End:0x740
        else
        {
            MM.SetChangingHostFlag(true);
            // End:0x4fb
            if(MM.bChangingHost)
            {
                PlayerOwner().ClientFadeToBlackWhite2();
            }
            MM.SetChangeHostMessageFlag();
            // End:0x688
            if(MM.InGamePlaying)
            {
                // End:0x5ba
                if(MM.IsCompletedLoading() == true)
                {
                    // End:0x56d
                    if(MM.bIsOwner)
                    {
                        GetConsole().AddMessageItem(GetConsole().ConstructMessageItem(MessageNewHost, 6));
                    }
                    // End:0x5ba
                    else
                    {
                        GetConsole().AddMessageItem(GetConsole().ConstructMessageItem(MessageNewGuestPre $ MM.GetUserInfoByUID(NewOwner).UserName $ MessageNewGuestPost, 6));
                    }
                }
                // End:0x685
                if(MM.bIntervention == true)
                {
                    // End:0x5f8
                    if(MM.IsCompletedLoading() == true)
                    {
                        MM.bIntervention = false;
                    }
                    // End:0x685
                    else
                    {
                        Log("BTPageRoomLobby::rfAckChangeRoomOwner() InGamePlaying=" $ string(MM.InGamePlaying) $ " bIntervention=" $ string(MM.bIntervention));
                        MM.ForceDisconnectGameWithErrMessage(GetErrMsg(5082));
                    }
                }
            }
            // End:0x740
            else
            {
                // End:0x740
                if(MM.bPendingStarted == true)
                {
                    Log("BTPageRoomLobby::rfAckChangeRoomOwner() bPendingStarted=" $ string(MM.bPendingStarted) $ " bIntervention=" $ string(MM.bIntervention));
                    page_Main.TcpChannel.sfReqRemoveCheckTeamBalanceList();
                    FailedNetworkChecking(GetErrMsg(5081), 5081);
                }
            }
        }
    }
    return true;
}

function bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckForceGameOver] Result:" $ string(Result) $ "ErrMsg:" $ ErrMsg);
    // End:0xa4
    if(MatchMaker == none)
    {
        Log("[CYH] BTPageRoomLobby::rfAckForceGameOver() MatchMaker is none. error!!");
        return true;
    }
    // End:0xca
    if(Result == 0)
    {
        MM.ForceGameOver(PlayerOwner().PlayerReplicationInfo);
    }
    return true;
}

function bool rfAckGetBooty(int Result, string ErrMsg, array<int> PrizeWinUserID, array<int> BootyItemID, array<int> BootyPartsID)
{
    local int i;

    Log("[END] rfAckGetBotty");
    Log("[BTPageRoomLobby::rfAckGetBooty]");
    // End:0x36d
    if(Result == 0)
    {
        MM.ResultIsGiveType = 0;
        MM.ResultIsBootyGet = true;
        MM.ResultIsOverlapWeapon = false;
        MM.ResultBootyInfo.Length = 2;
        i = 0;
        J0x92:
        // End:0x122 [While If]
        if(i < MM.ResultBootyInfo.Length)
        {
            MM.ResultBootyInfo[i].ItemID = 0;
            MM.ResultBootyInfo[i].PartsID = 0;
            MM.ResultBootyInfo[i].PrizeWinUserID = 0;
            MM.ResultBootyInfo[i].PrizeWinUserName = "";
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x92;
        }
        i = 0;
        J0x129:
        // End:0x2d7 [While If]
        if(i < PrizeWinUserID.Length)
        {
            MM.ResultBootyInfo[i].PrizeWinUserID = PrizeWinUserID[i];
            MM.ResultBootyInfo[i].PrizeWinUserName = MM.GetUserInfoByUID(MM.ResultBootyInfo[i].PrizeWinUserID).UserName;
            Log("PrizeWinUserName = " $ MM.ResultBootyInfo[i].PrizeWinUserName);
            MM.ResultBootyInfo[i].ItemID = BootyItemID[i];
            MM.ResultBootyInfo[i].PartsID = BootyPartsID[i];
            // End:0x2cd
            if(MM.ResultBootyInfo[i].PrizeWinUserName == MM.kUserName)
            {
                // End:0x2cd
                if(Controller.ViewportOwner.Actor.Level.GameMgr.FindInstanceItemSameWeapon(MM.ResultBootyInfo[i].ItemID, MM.ResultBootyInfo[i].PartsID) != none)
                {
                    MM.ResultIsOverlapWeapon = true;
                }
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x129;
        }
        i = PrizeWinUserID.Length;
        J0x2e3:
        // End:0x36a [While If]
        if(i < 2)
        {
            MM.ResultBootyInfo[i].PrizeWinUserID = -1;
            MM.ResultBootyInfo[i].PrizeWinUserName = "";
            MM.ResultBootyInfo[i].ItemID = 0;
            MM.ResultBootyInfo[i].PartsID = 0;
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x2e3;
        }
    }
    // End:0x3a0
    else
    {
        MM.ResultIsBootyGet = false;
        MM.ResultIsOverlapWeapon = false;
        MM.ResultBootyInfo.Length = 0;
    }
    // End:0x3c4
    if(Result > 1)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckEntrySkillList(array<int> UserIDs, array<int> SkillIDs, array<int> SlotPositions, int Result, string ErrMsg)
{
    local int lp1, lp2, idx;
    local EquippedSkillInfo SkillInfo;

    Log("[BTPageRoomLobby::rfAckEntrySkillList]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    // End:0x2d8
    if(Result == 0)
    {
        lp1 = 0;
        J0x64:
        // End:0x115 [While If]
        if(lp1 < UserIDs.Length)
        {
            lp2 = 0;
            J0x7b:
            // End:0x10b [While If]
            if(lp2 < MM.UserInfos.Length)
            {
                // End:0x101
                if(MM.UserInfos[lp2].UID == UserIDs[lp1])
                {
                    MM.UserInfos[lp2].EquippedSkills.Remove(0, MM.UserInfos[lp2].EquippedSkills.Length);
                }
                // End:0x10b
                else
                {
                    ++ lp2;
                    // This is an implied JumpToken; Continue!
                    goto J0x7b;
                }
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x64;
        }
        lp1 = 0;
        J0x11c:
        // End:0x2d5 [While If]
        if(lp1 < UserIDs.Length)
        {
            lp2 = 0;
            J0x133:
            // End:0x2cb [While If]
            if(lp2 < MM.UserInfos.Length)
            {
                // End:0x2c1
                if(MM.UserInfos[lp2].UID == UserIDs[lp1])
                {
                    idx = MM.UserInfos[lp2].EquippedSkills.Length;
                    MM.UserInfos[lp2].EquippedSkills[idx] = SkillInfo;
                    MM.UserInfos[lp2].EquippedSkills[idx].SkillID = SkillIDs[lp1];
                    MM.UserInfos[lp2].EquippedSkills[idx].SlotPosition = SlotPositions[lp1];
                    Log("[BTPageRoomLobby::rfAckEntryItemList] UserName=" $ MM.UserInfos[lp2].UserName $ " EquippedSkillID=" $ string(MM.UserInfos[lp2].EquippedSkills[idx].SkillID));
                }
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0x133;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x11c;
        }
    }
    // End:0x30f
    else
    {
        // End:0x2e7
        if(Result == 113)
        {
        }
        // End:0x30f
        else
        {
            // End:0x2f6
            if(Result == 213)
            {
            }
            // End:0x30f
            else
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
}

function bool rfAckGetBootyChoose(int Result, string ErrMsg, byte GiveType, BtrDouble ItemUniqueNumber, int ItemID, int PartID, byte ItemType, BtrDouble UntilTime, int StackCount, int PaintID)
{
    local wItemBoxHK itemBox;

    // End:0x0d
    if(Result != 0)
    {
        return true;
    }
    Log("[rfAckGetBootyChoose] GUIWarfare.BTPageRoomLobby.rfAckGetBootyChoose - Result : " $ string(Result) $ " / ErrMsg : " $ ErrMsg);
    page_Main.rMM.ResultIsGiveType = GiveType;
    // End:0x19f
    if(GiveType == 1 || GiveType == 3 || GiveType == 4)
    {
        itemBox = GameMgr.FindUIItem(ItemID);
        // End:0x19f
        if(itemBox != none)
        {
            // End:0x150
            if(GameMgr.CheckSkillItem(itemBox.ItemType))
            {
                GameMgr.AddInstanceItemByParameter(ItemID, UnresolvedNativeFunction_99(0), UnresolvedNativeFunction_99(ItemUniqueNumber), 13, 1, 100000, PartID, PaintID, StackCount, 0, UntilTime);
            }
            // End:0x187
            else
            {
                GameMgr.AddInstanceItemByParameter(ItemID, ItemUniqueNumber, 0, 13, 1, 100000, PartID, PaintID, StackCount, 0, UntilTime);
            }
            GameMgr.UpdateItemList(GameMgr);
        }
    }
    return true;
}

function bool rfAckChangeHost(byte ClientNum)
{
    Log("[BTPageRoomLobby::rfAckChangeHost]");
    MM.ChangeHost(ClientNum);
    return true;
}

function bool rfAckChangeNewGuest(string HostIP)
{
    Log("[BTPageRoomLobby::rfAckChangeNewGuest]");
    MM.ChangeNewGuest(HostIP);
    return true;
}

function bool rfAckEntryQSlotIDList(int UserNum, array<byte> QSlotDispOrder, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<int> TWItemID1, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID)
{
    local int lp1, lp2, lp3, idx;
    local EquippedQSlotInfo tmSlot;

    Log("[BTPageRoomLobby::rfAckEntryQSlotIDList]");
    lp1 = 0;
    J0x33:
    // End:0x22d [While If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x223
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            // End:0x156
            if(MM.UserInfos[lp1].EquippedQSlots.Length == 0)
            {
                MM.UserInfos[lp1].EquippedQSlots[0] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[1] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[2] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[3] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[4] = tmSlot;
            }
            // End:0x220
            else
            {
                lp2 = 0;
                J0x15d:
                // End:0x220 [While If]
                if(lp2 < 5)
                {
                    lp3 = 0;
                    J0x170:
                    // End:0x216 [While If]
                    if(lp3 < 4)
                    {
                        MM.UserInfos[lp1].EquippedQSlots[lp2].ItemID[lp3] = 0;
                        MM.UserInfos[lp1].EquippedQSlots[lp2].PartsID[lp3] = 0;
                        MM.UserInfos[lp1].EquippedQSlots[lp2].SkillID[lp3] = 0;
                        ++ lp3;
                        // This is an implied JumpToken; Continue!
                        goto J0x170;
                    }
                    ++ lp2;
                    // This is an implied JumpToken; Continue!
                    goto J0x15d;
                }
            }
        }
        // End:0x22d
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x33;
        }
    }
    lp1 = 0;
    J0x234:
    // End:0x5bc [While If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x5b2
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            lp2 = 0;
            J0x27b:
            // End:0x5af [While If]
            if(lp2 < QSlotDispOrder.Length)
            {
                idx = QSlotDispOrder[lp2] - 1;
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[0] = MWItemID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[1] = PistolItemID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[2] = TWItemID1[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[3] = TWItemID2[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[0] = MWPartID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[1] = PistolPartID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[2] = 0;
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[3] = 0;
                MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[0] = Skill1ID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[1] = Skill2ID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[2] = Skill3ID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[3] = Skill4ID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].Painting_Item_ID[0] = GameMgr.GetPaintingItemIDbyPaintingID(MWPaintID[lp2]);
                MM.UserInfos[lp1].EquippedQSlots[idx].Painting_Item_ID[1] = GameMgr.GetPaintingItemIDbyPaintingID(PistolPaintID[lp2]);
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0x27b;
            }
        }
        // End:0x5bc
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x234;
        }
    }
    return true;
}

function bool rfAckEntryQSlotUniqueIDList(int UserNum, array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<BtrDouble> PistolUniqueID, array<BtrDouble> TW1UniqueID, array<BtrDouble> TW2UniqueID)
{
    local int lp1, lp2, lp3, idx;
    local EquippedQSlotInfo tmSlot;

    Log("[BTPageRoomLobby::rfAckEntryQSlotUniqueIDList]");
    lp1 = 0;
    J0x39:
    // End:0x1d8 [While If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x1ce
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            // End:0x15c
            if(MM.UserInfos[lp1].EquippedQSlots.Length == 0)
            {
                MM.UserInfos[lp1].EquippedQSlots[0] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[1] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[2] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[3] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[4] = tmSlot;
            }
            // End:0x1cb
            else
            {
                lp2 = 0;
                J0x163:
                // End:0x1cb [While If]
                if(lp2 < 5)
                {
                    lp3 = 0;
                    J0x176:
                    // End:0x1c1 [While If]
                    if(lp3 < 4)
                    {
                        MM.UserInfos[lp1].EquippedQSlots[lp2].ItemUniqueID[lp3] = EmptyBtrDouble();
                        ++ lp3;
                        // This is an implied JumpToken; Continue!
                        goto J0x176;
                    }
                    ++ lp2;
                    // This is an implied JumpToken; Continue!
                    goto J0x163;
                }
            }
        }
        // End:0x1d8
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x39;
        }
    }
    lp1 = 0;
    J0x1df:
    // End:0x33d [While If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x333
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            lp2 = 0;
            J0x226:
            // End:0x330 [While If]
            if(lp2 < QSlotDispOrder.Length)
            {
                idx = QSlotDispOrder[lp2] - 1;
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[0] = MWUniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[1] = PistolUniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[2] = TW1UniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[3] = TW2UniqueID[lp2];
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0x226;
            }
        }
        // End:0x33d
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x1df;
        }
    }
    return true;
}

function bool rfAckUpdateWeaponDurability(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> Durability, array<byte> IsDestroy, array<BtrDouble> FailedWeaponUniqueID)
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageRoomLobby::rfAckUpdateWeaponDurability]");
    // End:0x58
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    PlayerOwner().dblog("=========================================");
    PlayerOwner().dblog("UpdateWeaponDurability.Length = " $ string(UniqueItemID.Length));
    PlayerOwner().dblog("=========================================");
    page_Main.DestroyedDurabilityXItems.Length = 0;
    i = 0;
    J0x119:
    // End:0x3b5 [While If]
    if(i < UniqueItemID.Length)
    {
        PlayerOwner().dblog("i=" $ string(i));
        // End:0x2a0
        if(IsDestroy[i] == 1)
        {
            instanceInfo = GameMgr.FindInstanceItem(UniqueItemID[i]);
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            page_Main.DestroyedDurabilityXItems.Length = page_Main.DestroyedDurabilityXItems.Length + 1;
            page_Main.DestroyedDurabilityXItems[page_Main.DestroyedDurabilityXItems.Length - 1] = ItemInfo.ItemName;
            page_Main.bWarningDurabilityAndExpired = true;
            PlayerOwner().dblog(ItemInfo.ItemName $ " is destroyed!! (ItemID = " $ string(ItemInfo.ItemID) $ ")");
            GameMgr.ChangeInstance_DefaultWeapon(instanceInfo.SlotPosition);
            GameMgr.RemoveInstanceItem(UniqueItemID[i]);
            GameMgr.RemoveQuickSlotBoxItem(UniqueItemID[i]);
        }
        // End:0x3ab
        else
        {
            instanceInfo = GameMgr.FindInstanceItem(UniqueItemID[i]);
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            PlayerOwner().dblog(ItemInfo.ItemName $ " is changed !! (ItemID = " $ string(ItemInfo.ItemID) $ ")");
            PlayerOwner().dblog("Dur = (" $ string(instanceInfo.Durability) $ " => " $ string(instanceInfo.Durability - Durability[i]) $ ")");
            GameMgr.ChangeInstance_ItemReduceDurability(UniqueItemID[i], Durability[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x119;
    }
    PlayerOwner().dblog("=========================================");
    GameMgr.UpdateItemList(GameMgr);
    page_Main.CompleteDurabilityWarningItem();
    i = 0;
    J0x41b:
    // End:0x54b [While If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        ItemInfo = GameMgr.FindUIItem(GameMgr.InstanceItemLists[i].ItemID);
        // End:0x541
        if(ItemInfo.CostType == 0)
        {
            // End:0x541
            if(GameMgr.InstanceItemLists[i].Durability < 10000)
            {
                page_Main.AddDurabilityWarningItem(GameMgr.InstanceItemLists[i].UniqueID, GameMgr.InstanceItemLists[i].ItemID, GameMgr.InstanceItemLists[i].SlotPosition, GameMgr.InstanceItemLists[i].PartID, GameMgr.InstanceItemLists[i].Durability);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x41b;
    }
    page_Main.UpdateDurabilityWarningItemList(page_Main);
    return true;
}

function bool rfReqRelayServerOff()
{
    Log("[BTPageRoomLobby::rfReqRelayServerOff]");
    MM.IsRelayServerOff = true;
    return true;
}

function bool rfAckSuccessStartGame(int Result, string ErrMsg, byte IsHost, string HostIP, int HostPort, int LoadingStep)
{
    Log("[BTPageRoomLobby::rfAckSuccessStartGame] Result=" $ string(Result) $ ", IsHost=" $ string(IsHost) $ "HostIP=" $ HostIP $ ", " $ "HostPort=" $ string(HostPort) $ "LoadingStep=" $ string(LoadingStep));
    // End:0xfa
    if(MM.bPendingStarted == false)
    {
        Log("BTPageRoomLobby::rfAckSuccessStartGame() MM.bPendingStarted == false.");
        return true;
    }
    // End:0x118
    if(Result == 0)
    {
        StartGame(HostIP, HostPort);
    }
    // End:0x177
    else
    {
        // End:0x14d
        if(MM.bIsOwner == true)
        {
            page_Main.TcpChannel.sfReqFailedStartGame(LoadingStep);
        }
        // End:0x177
        else
        {
            // End:0x177
            if(IsHost == 0)
            {
                page_Main.TcpChannel.sfReqFailedStartGame(LoadingStep);
            }
        }
    }
    return true;
}

function bool rfAckFailedStartGame(int Result, string ErrMsg, byte IsHost, int FailedUserID, int LoadingStep)
{
    Log("[BTPageRoomLobby::rfAckFailedStartGame] Result=" $ string(Result) $ ", " $ "FailedUserID=" $ string(FailedUserID) $ " IsHost=" $ string(IsHost) $ "LoadingStep=" $ string(LoadingStep));
    // End:0xe3
    if(MM.kIsInDSChannel && MM.kDS_SavedOwnerInfo)
    {
        MM.kDS_SavedOwnerInfo = false;
        MM.kGame_bOwner = true;
        MM.bIsOwner = true;
    }
    bReadyToGame = false;
    ChangeButtonStart();
    // End:0x150
    if(MM.bPendingStarted == false)
    {
        Log("BTPageRoomLobby::rfAckFailedStartGame() MM.bPendingStarted == false.");
        return true;
    }
    // End:0x1b2
    if(Result == 127)
    {
        // End:0x193
        if(FailedUserID == MM.kUID)
        {
            FailedNetworkChecking(MM.GetMyNetworkCheckFailedMsg(LoadingStep), 127);
        }
        // End:0x1af
        else
        {
            FailedNetworkChecking(MM.GetHostNetworkCheckFailedMsg(LoadingStep), 127);
        }
    }
    // End:0x301
    else
    {
        // End:0x2c9
        if(Result == 128)
        {
            // End:0x292
            if(MM.bIsOwner == true)
            {
                // End:0x1fa
                if(MM.ConnectClientNum > 0)
                {
                    -- MM.ConnectClientNum;
                }
                // End:0x247
                else
                {
                    Log("BTPageRoomLobby::rfAckFailedStartGame() MM.ConnectClientNum <= 0. error!!");
                }
                // End:0x28f
                if(MM.kIsInDSChannel && FailedUserID == MM.kUID)
                {
                    FailedNetworkChecking(MM.GetMyNetworkCheckFailedMsg(LoadingStep), 128);
                }
            }
            // End:0x2c6
            else
            {
                // End:0x2c6
                if(FailedUserID == MM.kUID)
                {
                    FailedNetworkChecking(MM.GetMyNetworkCheckFailedMsg(LoadingStep), 128);
                }
            }
        }
        // End:0x301
        else
        {
            FailedNetworkChecking(MM.GetMyNetworkCheckFailedMsg(LoadingStep), Result);
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    return true;
}

function bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState)
{
    Log("[BTPageRoomLobby::rfAckNotifyLoadingState] Result=" $ string(Result) $ ", " $ "UserID=" $ string(UserID) $ ", " $ "LoadingState=" $ string(LoadingState));
    // End:0xdd
    if(LoadingState == 0)
    {
        // End:0xbd
        if(UserID == MM.kUID)
        {
            Log("My Loading State Failed!");
        }
        // End:0xdd
        else
        {
            Log("Another User Loading Failed!");
        }
    }
    // End:0x10b
    if(MM.InGamePlaying == true)
    {
        MM.DrawOtherLoadingState(UserID, LoadingState);
    }
    return true;
}

function bool rfAckChangeUserState(int Result, string ErrMsg, array<int> UserIDs, array<byte> Positions, array<int> Numbers, array<byte> OldStates, array<byte> NewStates)
{
    local int i, j, UserID, Number;
    local byte Position, oldstate, NewState;
    local bool ImGM;

    Log("[BTPageRoomLobby::rfAckChangeUserState]");
    // End:0x178
    if(Result != 0)
    {
        bReadyToGame = false;
        ChangeButtonStart();
        // End:0x160
        if(CurrentRoomState == 0)
        {
            // End:0xc0
            if(Result == 514)
            {
                class'BTWindowDefineARHK'.static.ShowInfo(Controller.TopPage().Controller, 48);
                BTWindowDefineARHK(Controller.TopPage().Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
            }
            // End:0x15d
            else
            {
                // End:0x131
                if(Result == 627)
                {
                    class'BTWindowDefineARHK'.static.ShowInfo(Controller.TopPage().Controller, 49);
                    BTWindowDefineARHK(Controller.TopPage().Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                }
                // End:0x15d
                else
                {
                    class'BTWindowErrorDefineHK'.static.ShowError(Controller.TopPage().Controller, Result);
                }
            }
        }
        // End:0x176
        else
        {
            Log(class'BTWindowErrorDefineHK'.static.GetFormatString(Result));
        }
        return true;
    }
    i = 0;
    J0x17f:
    // End:0x40a [While If]
    if(i < UserIDs.Length)
    {
        UserID = UserIDs[i];
        Number = Numbers[i];
        Position = Positions[i];
        oldstate = OldStates[i];
        NewState = NewStates[i];
        // End:0x1fe
        if(Number != MM.kRoomID)
        {
            return true;
        }
        // End:0x361
        if(UserID == MM.kUID)
        {
            Log("My UserState UserID=" $ string(UserID) $ ", " $ "State=" $ string(oldstate) $ " -> " $ string(NewState));
            j = 0;
            J0x268:
            // End:0x2b3 [While If]
            if(j < GMList.Length)
            {
                // End:0x2a9
                if(GMList[j].DataPerColumn[6].IntValue == UserID)
                {
                    ImGM = true;
                }
                // End:0x2b3
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x268;
                }
            }
            // End:0x2f4
            if(!ImGM)
            {
                TPTeamList[MM.kTeamID].ACLList.ChangeTeamMemberStatus(UserID, NewState);
            }
            // End:0x335
            else
            {
                TPTeamList[GMList[j].DataPerColumn[9].IntValue].ACLList.ChangeTeamMemberStatus(UserID, NewState);
            }
            // End:0x350
            if(NewState == 1)
            {
                bReadyToGame = true;
            }
            // End:0x358
            else
            {
                bReadyToGame = false;
            }
            ChangeButtonStart();
        }
        // End:0x400
        else
        {
            Log("Team UserState UserID=" $ string(UserID) $ ", " $ "State=" $ string(oldstate) $ " -> " $ string(NewState));
            // End:0x400
            if(TPTeamList[0].ACLList.ChangeTeamMemberStatus(UserID, NewState) == false)
            {
                TPTeamList[1].ACLList.ChangeTeamMemberStatus(UserID, NewState);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17f;
    }
    bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
    // End:0x46b
    if(IsUserAllReady() && IsUserCountFull())
    {
        PlayerOwner().ResetKeySleepTime();
    }
    return true;
}

function bool rfAckChangeRoomSetting(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log("[BTPageRoomLobby::rfAckChangeRoomSetting]" $ " TeamCnt=" $ string(RoomInfo.TeamCnt) $ " MapName=" $ RoomInfo.MapName $ " GameMode=" $ RoomInfo.GameClass $ " WeaponLimit=" $ string(RoomInfo.WeaponLimit) $ " IsHardCore=" $ string(RoomInfo.IsHardCore) $ " TotlaPlayerCnt=" $ string(RoomInfo.MaxUserCnt) $ " GameRoundNumber=" $ string(RoomInfo.GameRound) $ " GameMinute=" $ string(RoomInfo.GameMinute) $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    // End:0x6f9
    if(Result == 0)
    {
        MM.szRoomName = RoomInfo.RoomName;
        MM.szRoomPassword = RoomInfo.Password;
        MM.szMapName = RoomInfo.MapName;
        MM.szGameClass = class'wGameSettings'.static.GetGameModeByIndex(RoomInfo.GameModeNum).ClassName;
        MM.eWeaponLimit = RoomInfo.WeaponLimit;
        MM.iMaxPlayers = RoomInfo.MaxUserCnt;
        MM.iGoalRound = RoomInfo.GameRound;
        MM.iTimeLimit = RoomInfo.GameMinute;
        MM.bHardCore = RoomInfo.IsHardCore != 0;
        MM.bAutobalance = RoomInfo.IsTeamValance != 0;
        Log("RoomInfo.PlayWithBots=" $ string(RoomInfo.PlayWithBots));
        MM.PlayWithBots = RoomInfo.PlayWithBots != 0;
        MM.BotUserTeam = RoomInfo.UserTeamNum;
        MM.BotNum0 = RoomInfo.MaxAFUserAndBotNum;
        MM.BotNum1 = RoomInfo.MaxRSAUserAndBotNum;
        MM.BotDifficulty = RoomInfo.BotModeDifficulty;
        // End:0x345
        if(RoomInfo.BombHold == 0)
        {
            MM.bMultiBomb = true;
        }
        // End:0x356
        else
        {
            MM.bMultiBomb = false;
        }
        MM.kGame_RoomName = RoomInfo.RoomName;
        // End:0x3b1
        if(RoomInfo.RoomOwner == MM.kUserName)
        {
            MM.bIsOwner = true;
            MM.kGame_bOwner = true;
        }
        // End:0x3d3
        else
        {
            MM.bIsOwner = false;
            MM.kGame_bOwner = false;
        }
        MM.kGame_Password = RoomInfo.Password;
        MM.kGame_MapNum = RoomInfo.MapNum;
        MM.kGame_MapName = RoomInfo.MapName;
        MM.kGame_GameMode = RoomInfo.GameModeNum;
        MM.kGame_UserCount = RoomInfo.MaxUserCnt;
        MM.kGame_GameTime = RoomInfo.GameMinute;
        MM.kGame_GameRound = RoomInfo.GameRound;
        // End:0x516
        if(MM.kGame_WeaponLimit != RoomInfo.WeaponLimit)
        {
            // End:0x4e0
            if(RoomInfo.WeaponLimit == 5)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(180), 5, true);
            }
            // End:0x516
            else
            {
                // End:0x516
                if(RoomInfo.WeaponLimit == 6)
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(181), 5, true);
                }
            }
        }
        MM.kGame_WeaponLimit = RoomInfo.WeaponLimit;
        // End:0x557
        if(RoomInfo.IsHardCore != 0)
        {
            MM.kGame_bHardCore = true;
        }
        // End:0x568
        else
        {
            MM.kGame_bHardCore = false;
        }
        bPrevTeamBalance = MM.kGame_TeamBalance;
        // End:0x5a4
        if(RoomInfo.IsTeamValance != 0)
        {
            MM.kGame_TeamBalance = true;
        }
        // End:0x5b5
        else
        {
            MM.kGame_TeamBalance = false;
        }
        PrevGameMode = -1;
        // End:0x5e6
        if(RoomInfo.ResponType == 1)
        {
            MM.bSDRespawn = true;
        }
        // End:0x5f7
        else
        {
            MM.bSDRespawn = false;
        }
        MM.UpdateGameRoomInfo(MM);
        UpdateRoomInfoByMatchMaker();
        // End:0x695
        if(MM.kGame_GameMode == class'wGameSettings'.static.GetModeIndex_SD() && MM.kLevel < 4)
        {
            CurrentRoomState = 0;
            bReadyToGame = false;
            ChangeButtonStart();
            page_Main.TcpChannel.sfReqChangeUserState(0, 1);
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 171);
        }
        bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
        // End:0x6f6
        if(IsUserAllReady() && IsUserCountFull())
        {
            PlayerOwner().ResetKeySleepTime();
        }
    }
    // End:0x712
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageRoomLobby::rfAckEnterChannel]");
    bSafeLeaveRoom = false;
    // End:0xf1
    if(Result == 0)
    {
        // End:0xb9
        if(UID == MM.kUID)
        {
            Log("page_Main.SetPage( EPage_Lobby2, true )");
            page_Main.ResetChatLog();
            MM.kClanMatch_InMatchRoom = false;
            UnInitializeDelegate();
            page_Main.SetPage(7, true);
        }
        // End:0xee
        else
        {
            Log("[BTPageRoomLobby::rfAckEnterChannel] someone else");
        }
    }
    // End:0x13c
    else
    {
        page_Main.EndAutoMove();
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = RoomLobbyToServerSelection_OnOK;
    }
    return true;
}

function bool RoomLobbyToServerSelection_OnOK(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::RoomLobbyToServerSelection_OnOK]");
    RoomLobbyToServerSelection();
    return true;
}

function RoomLobbyToServerSelection()
{
    Log("[BTPageRoomLobby::RoomLobbyToServerSelection]");
    // End:0x5b
    if(BTWindowStateHK(Controller.TopPage()) != none)
    {
        Controller.CloseMenu(false);
    }
    UnInitializeDelegate();
    page_Main.ChannelToLogin(page_Main.szLoginServerIP, page_Main.szLoginServerPort);
}

function TcpLogin_OnConnect(int ErrCode)
{
    Log("[BTPageRoomLobby::TcpLogin_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x196
    if(ErrCode == 0)
    {
        // End:0xe5
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0xa5
            if(page_Main.TcpLogin == none)
            {
                Log("page_Main.TcpLogin is none");
            }
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
        }
        // End:0x193
        else
        {
            Log("[BTPageRoomLobby::TcpLogin_OnConnect] (" $ page_Main.szAccountName $ ", " $ page_Main.szLoginPassword $ ", " $ page_Main.AuthLogin_GUID $ ")");
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
        }
    }
    // End:0x1d6
    else
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 6, string(ErrCode));
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    }
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log("[BTPageRoomLobby::rfAckLoginInHouseTest] Sucess=" $ string(Sucess) $ " CharName=" $ CharName $ " " $ string(TimeStamp) $ " " $ string(LoginHash1) $ " " $ string(LoginHash2) $ " " $ string(LoginHash3) $ " " $ string(LoginHash4) $ " " $ string(LoginHash5) $ " " $ string(NeedChar) $ " " $ ErrMsg);
    Controller.PopPage();
    // End:0x26b
    if(Sucess == 0)
    {
        page_Main.BirthDay = BDay;
        page_Main.Sex = Sex;
        page_Main.LoginTimeStamp = TimeStamp;
        page_Main.LoginHash1 = LoginHash1;
        page_Main.LoginHash2 = LoginHash2;
        page_Main.LoginHash3 = LoginHash3;
        page_Main.LoginHash4 = LoginHash4;
        page_Main.LoginHash5 = LoginHash5;
        // End:0x1d0
        if(NeedChar == 0)
        {
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name : NULL");
            page_Main.SetPage(4, true);
        }
        // End:0x268
        else
        {
            UnresolvedNativeFunction_97("NeedChar :" $ string(NeedChar));
            UnresolvedNativeFunction_97("Character name :" $ CharName);
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            page_Main.rMM.PI_LeaveChannel();
            page_Main.SetPage(5, true);
        }
    }
    // End:0x55f
    else
    {
        // End:0x3fa
        if(Sucess == 50)
        {
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            Log("Retry Login!!");
            // End:0x373
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
            {
                Log("page_Main.TcpLogin.sfReqLoginInHouseTest(" $ page_Main.AuthLogin_AccountID $ ")");
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
            }
            // End:0x3f7
            else
            {
                Log("page_Main.TcpLogin.sfReqLoginInHouseTest(" $ page_Main.szAccountName $ ")");
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
            }
        }
        // End:0x55f
        else
        {
            // End:0x443
            if(Sucess == 1)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
            }
            // End:0x55f
            else
            {
                // End:0x48d
                if(Sucess == 2)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                }
                // End:0x55f
                else
                {
                    // End:0x4d7
                    if(Sucess == 3)
                    {
                        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                    }
                    // End:0x55f
                    else
                    {
                        // End:0x521
                        if(Sucess == 15)
                        {
                            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 4);
                            BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
                        }
                        // End:0x55f
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
    Log("[BTPageRoomLobby::rfAckProcessPreLoginUser] Result=" $ string(Result));
    // End:0x89
    if(Result > 1)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    // End:0xf6
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
    {
        page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);
    }
    // End:0x138
    else
    {
        page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
    }
    return true;
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
}

function RemoveInUserList(int UID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x53 [While If]
    if(i < UserListDB.Length)
    {
        // End:0x49
        if(UserListDB[i].DataPerColumn[6].IntValue == UID)
        {
            UserListDB.Remove(i, 1);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function RefreshUserList()
{
    local int i, GMListIndex, addACLRowIdx, TeamNum, GMIndex;

    TPTeamList[0].ACLList.RemoveAll();
    TPTeamList[1].ACLList.RemoveAll();
    GMList.Remove(0, GMList.Length);
    GMIndex = 0;
    GMNumAF = 0;
    GMNumRSA = 0;
    i = 0;
    J0x5d:
    // End:0x166 [While If]
    if(i < UserListDB.Length)
    {
        TeamNum = UserListDB[i].DataPerColumn[9].IntValue;
        // End:0xe3
        if(UserListDB[i].DataPerColumn[3].IntValue == 1)
        {
            GMListIndex = GMList.Length;
            GMList.Insert(GMListIndex, 1);
            GMList[GMListIndex] = UserListDB[i];
        }
        // End:0x10c
        else
        {
            TPTeamList[TeamNum].ACLList.AddRow(UserListDB[i]);
        }
        addACLRowIdx = TPTeamList[TeamNum].ACLList.ACLRowList.Length - 1;
        SetFriendlyUser(TPTeamList[TeamNum].ACLList.ACLRowList[addACLRowIdx]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5d;
    }
    i = 0;
    J0x16d:
    // End:0x3ba [While If]
    if(i < GMList.Length)
    {
        // End:0x243
        if(TPTeamList[1].ACLList.ACLRowList.Length < 7 && GMNumAF >= 2)
        {
            GMList[i].DataPerColumn[9].IntValue = 1;
            TPTeamList[1].ACLList.AddRow(GMList[++ GMIndex]);
            addACLRowIdx = TPTeamList[1].ACLList.ACLRowList.Length - 1;
            SetFriendlyUser(TPTeamList[1].ACLList.ACLRowList[addACLRowIdx]);
            ++ GMNumRSA;
        }
        // End:0x3b0
        else
        {
            // End:0x2fb
            if(TPTeamList[0].ACLList.ACLRowList.Length < 8)
            {
                GMList[i].DataPerColumn[9].IntValue = 0;
                TPTeamList[0].ACLList.AddRow(GMList[++ GMIndex]);
                addACLRowIdx = TPTeamList[0].ACLList.ACLRowList.Length - 1;
                SetFriendlyUser(TPTeamList[0].ACLList.ACLRowList[addACLRowIdx]);
                ++ GMNumAF;
            }
            // End:0x3b0
            else
            {
                // End:0x3b0
                if(TPTeamList[1].ACLList.ACLRowList.Length < 8)
                {
                    GMList[i].DataPerColumn[9].IntValue = 1;
                    TPTeamList[1].ACLList.AddRow(GMList[++ GMIndex]);
                    addACLRowIdx = TPTeamList[1].ACLList.ACLRowList.Length - 1;
                    SetFriendlyUser(TPTeamList[1].ACLList.ACLRowList[addACLRowIdx]);
                    ++ GMNumRSA;
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x16d;
    }
    // End:0x3da
    if(GMList.Length > 0)
    {
        MM.isGMRoom = true;
    }
    // End:0x3eb
    else
    {
        MM.isGMRoom = false;
    }
}

function bool rfAckRoomUserList(array<int> UID, array<string> UserName, array<int> Grade, array<int> TeamNum, array<byte> Statue, array<byte> IsHost, array<string> UserIP, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<byte> IsLookingFor, array<int> GMUID, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int lp1, lp2;
    local wMatchUserInfo UserInfo;
    local string RecvClanName;
    local bool bisGM;

    Log("[BTPageRoomLobby::rfAckRoomUserList]");
    UserListDB.Remove(0, UserListDB.Length);
    MM.UserInfos.Remove(0, MM.UserInfos.Length);
    lp1 = 0;
    J0x5b:
    // End:0x7f3 [While If]
    if(lp1 < UID.Length)
    {
        bisGM = false;
        UserInfo = new class'wMatchUserInfo';
        MM.UserInfos[lp1] = UserInfo;
        MM.UserInfos[lp1].UID = UID[lp1];
        MM.UserInfos[lp1].UserName = UserName[lp1];
        MM.UserInfos[lp1].Grade = Grade[lp1];
        MM.UserInfos[lp1].IsHost = IsHost[lp1] == 0;
        MM.UserInfos[lp1].UserIP = UserIP[lp1];
        MM.UserInfos[lp1].TeamNum = TeamNum[lp1];
        // End:0x1cd
        if(ClanName[lp1] == "" || ClanName[lp1] == "none")
        {
            RecvClanName = "";
        }
        // End:0x1de
        else
        {
            RecvClanName = ClanName[lp1];
        }
        MM.UserInfos[lp1].ClanName = RecvClanName;
        MM.UserInfos[lp1].ClanMark = CM_Pattern[lp1];
        MM.UserInfos[lp1].ClanBG = CM_BG[lp1];
        MM.UserInfos[lp1].ClanBL = CM_BL[lp1];
        MM.UserInfos[lp1].IsLookingFor = IsLookingFor[lp1];
        MM.UserInfos[lp1].ClanLevel = ClanLevel[lp1];
        MM.UserInfos[lp1].LevelMarkID = LevelMarkID[lp1];
        MM.UserInfos[lp1].TitleMarkID = TitleMarkID[lp1];
        MM.UserInfos[lp1].Reserved1 = Reserved1[lp1];
        MM.UserInfos[lp1].Reserved2 = Reserved2[lp1];
        MM.UserInfos[lp1].Reserved3 = Reserved3[lp1];
        GameMgr.cmm.AddClanMark(RecvClanName, CM_Pattern[lp1], CM_BG[lp1], CM_BL[lp1], true, IsLookingFor[lp1] > 0);
        GameMgr.cmm.SetClanLevel(RecvClanName, ClanLevel[lp1]);
        lp2 = 0;
        J0x41b:
        // End:0x458 [While If]
        if(lp2 < GMUID.Length)
        {
            // End:0x44e
            if(UID[lp1] == GMUID[lp2])
            {
                bisGM = true;
            }
            ++ lp2;
            // This is an implied JumpToken; Continue!
            goto J0x41b;
        }
        // End:0x64e
        if(UID[lp1] == MM.kUID)
        {
            MM.My_iTeam = TeamNum[lp1];
            MM.kTeamID = TeamNum[lp1];
            ChangeButtonStart();
            // End:0x584
            if(bisGM)
            {
                SaveUserData(MakeTeamMemberData(UID[lp1], CM_Pattern[lp1], CM_BG[lp1], CM_BL[lp1], Grade[lp1], UserName[lp1], RecvClanName, Statue[lp1], IsHost[lp1], 0, UserIP[lp1], IsLookingFor[lp1], ClanLevel[lp1], LevelMarkID[lp1], TitleMarkID[lp1], TeamNum[lp1], Reserved2[lp1], Reserved3[lp1], true, true));
            }
            // End:0x64b
            else
            {
                SaveUserData(MakeTeamMemberData(UID[lp1], CM_Pattern[lp1], CM_BG[lp1], CM_BL[lp1], Grade[lp1], UserName[lp1], RecvClanName, Statue[lp1], IsHost[lp1], 0, UserIP[lp1], IsLookingFor[lp1], ClanLevel[lp1], LevelMarkID[lp1], TitleMarkID[lp1], TeamNum[lp1], Reserved2[lp1], Reserved3[lp1], true));
            }
        }
        // End:0x7e9
        else
        {
            // End:0x722
            if(bisGM)
            {
                SaveUserData(MakeTeamMemberData(UID[lp1], CM_Pattern[lp1], CM_BG[lp1], CM_BL[lp1], Grade[lp1], UserName[lp1], RecvClanName, Statue[lp1], IsHost[lp1], 0, UserIP[lp1], IsLookingFor[lp1], ClanLevel[lp1], LevelMarkID[lp1], TitleMarkID[lp1], TeamNum[lp1], Reserved2[lp1], Reserved3[lp1], false, true));
            }
            // End:0x7e9
            else
            {
                SaveUserData(MakeTeamMemberData(UID[lp1], CM_Pattern[lp1], CM_BG[lp1], CM_BL[lp1], Grade[lp1], UserName[lp1], RecvClanName, Statue[lp1], IsHost[lp1], 0, UserIP[lp1], IsLookingFor[lp1], ClanLevel[lp1], LevelMarkID[lp1], TitleMarkID[lp1], TeamNum[lp1], Reserved2[lp1], Reserved3[lp1], false));
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x5b;
    }
    RefreshUserList();
    SendPingAndSendHostPoint();
    bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
    // End:0x860
    if(IsUserAllReady() && IsUserCountFull())
    {
        PlayerOwner().ResetKeySleepTime();
    }
    return true;
}

function bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckSendFriendInvite] Result=" $ string(Result));
    // End:0x8b
    if(Result == 0)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(202, BTWindowInviteFriendHK(Controller.TopPage()).FriendName), 5, true);
    }
    // End:0xa4
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
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

function bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfReqRecvFriendInvite] ReqUserID=" $ string(ReqUserID));
    // End:0x10c
    if(IsGameReadyOrPlaying())
    {
        // End:0xb2
        if(MM.InGamePlaying || MM.bPendingStarted)
        {
            page_Main.TcpChannel.sfReqConfirmFriendInvite(ReqUserID, ReqCharname, 3);
            RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(185, ReqCharname);
        }
        // End:0xf2
        else
        {
            page_Main.TcpChannel.sfReqConfirmFriendInvite(ReqUserID, ReqCharname, 4);
            RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(105, ReqCharname);
        }
        page_Main.AddChatLog(RecvMsg, 5, true);
    }
    // End:0x204
    else
    {
        // End:0x1d7
        if(BTWindowRequestFriendHK(Controller.TopPage()) == none)
        {
            Controller.OpenMenu("GUIWarfareControls.BTWindowRequestFriendHK");
            BTWindowRequestFriendHK(Controller.TopPage()).SetData(ReqCharname, ReqUserID, InviteMsg);
            BTWindowRequestFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowRequestFriend_OnOK;
            BTWindowRequestFriendHK(Controller.TopPage()).__OnCancel__Delegate = WindowRequestFriend_OnCancel;
        }
        // End:0x204
        else
        {
            BTWindowRequestFriendHK(Controller.TopPage()).AddData(ReqCharname, ReqUserID, InviteMsg);
        }
    }
    return true;
}

function bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfAckConfirmFriendInvite] Result=" $ string(Result));
    // End:0x8e
    if(Result == 0)
    {
        RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(18);
        page_Main.AddChatLog(RecvMsg, 5, true);
        // End:0x8b
        if(IsGameReadyOrPlaying() == false)
        {
            RefreshPage();
        }
    }
    // End:0xa7
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool rfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfReqCompleteFriendInvite]");
    // End:0x85
    if(IsPermit == 0)
    {
        RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(22, CharnameToBeInvited);
        page_Main.AddChatLog(RecvMsg, 5, true);
        // End:0x82
        if(IsGameReadyOrPlaying() == false)
        {
            RefreshPage();
        }
    }
    // End:0x11a
    else
    {
        // End:0xb0
        if(IsPermit == 3)
        {
            RecvMsg = class'BTWindowErrorDefineHK'.static.GetFormatString(381);
        }
        // End:0xf7
        else
        {
            // End:0xdb
            if(IsPermit == 4)
            {
                RecvMsg = class'BTWindowErrorDefineHK'.static.GetFormatString(415);
            }
            // End:0xf7
            else
            {
                RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(23, CharnameToBeInvited);
            }
        }
        page_Main.AddChatLog(RecvMsg, 5, true);
        // End:0x11a
        if(IsGameReadyOrPlaying() == false)
        {
        }
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
    // End:0xb6
    if(MM.kClanMatch_InChannel)
    {
        // End:0xb3
        if(CheckEnterRoom_InClanChannel(acl.GetClanName(acl.selectIndex)))
        {
            cm.ChangeStateByIndex(2, 0);
        }
    }
    // End:0xc9
    else
    {
        cm.ChangeStateByIndex(2, 0);
    }
    // End:0x119
    if(TargetUser == MM.kUserName)
    {
        // End:0x117
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
        }
        return;
    }
    // End:0x146
    if(TPMessenger.FindFriendFromUserName(TargetUser) < 0)
    {
        cm.ChangeStateByIndex(4, 0);
    }
    // End:0x1a7
    if(acl.GetClanName(acl.selectIndex) != "")
    {
        cm.ChangeStateByIndex(1, 0);
        // End:0x1a4
        if(MM.kClanName == "")
        {
            cm.ChangeStateByIndex(6, 0);
        }
    }
    // End:0x1fc
    else
    {
        // End:0x1fc
        if(MM.kClanName != "" && MM.kInClanGrade == 1 || MM.kInClanGrade == 2)
        {
            cm.ChangeStateByIndex(5, 0);
        }
    }
    cm.ChangeStateByIndex(3, 0);
    // End:0x23b
    if(!MM.IsBlockUser(TargetUser))
    {
        cm.ChangeStateByIndex(7, 0);
    }
}

function OnPopupChannel(int ContextMenuIndex, BTACLMessengerChannelHK acl)
{
    // End:0x2f
    if(IsGameReadyOrPlaying() && ContextMenuIndex != 3)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return;
    }
    switch(ContextMenuIndex)
    {
        // End:0x72
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x3e2
            break;
        // End:0xae
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x3e2
            break;
        // End:0x133
        case 2:
            // End:0x130
            if(CheckInviteUser(1, 0, acl.GetUserName(acl.selectIndex), acl.GetClanName(acl.selectIndex)) == true)
            {
                page_Main.TcpChannel.sfReqInviteGameRoom(acl.GetUserName(acl.selectIndex));
            }
            // End:0x3e2
            break;
        // End:0x18c
        case 3:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x3e2
            break;
        // End:0x249
        case 4:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteFriendHK");
            BTWindowInviteFriendHK(Controller.TopPage()).SetData(acl.GetUserName(acl.selectIndex), acl.GetUserID(acl.selectIndex));
            BTWindowInviteFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowInviteFriend_OnOK;
            // End:0x3e2
            break;
        // End:0x2e7
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x3e2
            break;
        // End:0x3a2
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x3e2
            break;
        // End:0x3df
        case 7:
            page_Main.TcpChannel.sfReqAddBlockUserList(acl.GetUserName(acl.selectIndex));
            // End:0x3e2
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
    // End:0x200
    if(acl.GetLogOnState(acl.selectIndex) > 0)
    {
        cm.ChangeStateByIndex(0, 0);
        // End:0xf5
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
            // End:0xf2
            if(MM.kClanName == "")
            {
                cm.ChangeStateByIndex(6, 0);
            }
        }
        // End:0x16e
        else
        {
            // End:0x16e
            if(MM.kClanName != "" && MM.kInClanGrade == 1 || MM.kInClanGrade == 2)
            {
                // End:0x16e
                if(acl.GetClanName(acl.selectIndex) == "")
                {
                    cm.ChangeStateByIndex(5, 0);
                }
            }
        }
        cm.ChangeStateByIndex(2, 0);
        // End:0x1b7
        if(acl.GetCurPosInt(acl.selectIndex) >= 1)
        {
            cm.ChangeStateByIndex(3, 0);
        }
        // End:0x200
        if(rfFriendPosTime.CheckCondition())
        {
            page_Main.TcpChannel.sfReqFriendPosition(acl.GetUserName(acl.selectIndex), 3);
        }
    }
    cm.ChangeStateByIndex(7, 0);
}

function OnPopupFriend(int ContextMenuIndex, BTACLMessengerFriendHK acl)
{
    // End:0x2f
    if(IsGameReadyOrPlaying() && ContextMenuIndex != 2)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return;
    }
    switch(ContextMenuIndex)
    {
        // End:0x72
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x4bd
            break;
        // End:0xae
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x4bd
            break;
        // End:0x107
        case 2:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x4bd
            break;
        // End:0x24c
        case 3:
            // End:0x249
            if(page_Main.CheckMoveToChannel(page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))))
            {
                page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            }
            // End:0x4bd
            break;
        // End:0x2ec
        case 4:
            // End:0x2e9
            if(CheckInviteUser(acl.GetCurPos(acl.selectIndex), acl.GetCurState(acl.selectIndex), acl.GetUserName(acl.selectIndex)) == true)
            {
                page_Main.TcpChannel.sfReqInviteGameRoom(acl.GetUserName(acl.selectIndex));
            }
            // End:0x4bd
            break;
        // End:0x38a
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x4bd
            break;
        // End:0x445
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x4bd
            break;
        // End:0x4ba
        case 7:
            DelFriendsList.Length = 1;
            DelFriendsList[0] = acl.GetUserName(acl.selectIndex);
            class'BTWindowDefineSelectHK'.static.ShowInfo(Controller, 23, DelFriendsList[0]);
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineSelectHK_23_OnOK;
            // End:0x4bd
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
    // End:0x2f
    if(IsGameReadyOrPlaying() && ContextMenuIndex != 2)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return;
    }
    switch(ContextMenuIndex)
    {
        // End:0x72
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x276
            break;
        // End:0x9f
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(MM.kClanName);
            // End:0x276
            break;
        // End:0xf8
        case 2:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x276
            break;
        // End:0x1c5
        case 3:
            page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            // End:0x276
            break;
        // End:0x273
        case 4:
            // End:0x270
            if(CheckInviteUser(acl.GetCurPosInt(acl.selectIndex), acl.GetCurState(acl.selectIndex), acl.GetUserName(acl.selectIndex), MatchMaker.kClanName) == true)
            {
                page_Main.TcpChannel.sfReqInviteGameRoom(acl.GetUserName(acl.selectIndex));
            }
            // End:0x276
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
    if(i < 7)
    {
        cm.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    // End:0x17a
    if(acl.GetCurPos(acl.selectIndex) != 0)
    {
        cm.ChangeStateByIndex(0, 0);
        // End:0xc9
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
            // End:0xc6
            if(MM.kClanName == "")
            {
                cm.ChangeStateByIndex(6, 0);
            }
        }
        // End:0x11e
        else
        {
            // End:0x11e
            if(MM.kClanName != "" && MM.kInClanGrade == 1 || MM.kInClanGrade == 2)
            {
                cm.ChangeStateByIndex(5, 0);
            }
        }
        cm.ChangeStateByIndex(2, 0);
        // End:0x167
        if(acl.GetCurPosInt(acl.selectIndex) >= 1)
        {
            cm.ChangeStateByIndex(3, 0);
        }
        cm.ChangeStateByIndex(4, 0);
    }
}

function OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl)
{
    // End:0x2f
    if(IsGameReadyOrPlaying() && ContextMenuIndex != 2)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return;
    }
    switch(ContextMenuIndex)
    {
        // End:0x72
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x3b0
            break;
        // End:0xae
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x3b0
            break;
        // End:0x107
        case 2:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x3b0
            break;
        // End:0x24c
        case 3:
            // End:0x249
            if(page_Main.CheckMoveToChannel(page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))))
            {
                page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            }
            // End:0x3b0
            break;
        // End:0x254
        case 4:
            // End:0x3b0
            break;
        // End:0x2f2
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x3b0
            break;
        // End:0x3ad
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x3b0
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

function TPTeamList_OnPopup(int ContextMenuIndex, BTACLTeamMemberListHK acl)
{
    Log("[BTPageRoomLobby::TPTeamList_OnPopup] ContextMenuIndex=" $ string(ContextMenuIndex));
    // End:0x73
    if(IsGameReadyOrPlaying() && ContextMenuIndex != 4)
    {
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return;
    }
    switch(ContextMenuIndex)
    {
        // End:0x113
        case 0:
            Log("page_Main.TcpChannel.sfReqGetUserHostPriorityPoint(" $ string(acl.GetUserID(acl.selectIndex)) $ ")");
            page_Main.TcpChannel.sfReqGetUserHostPriorityPoint(acl.GetUserID(acl.selectIndex));
            // End:0x510
            break;
        // End:0x1e7
        case 1:
            Log("page_Main.TcpChannel.sfReqBanUser(" $ string(MM.kRoomID) $ ", " $ string(MM.kUID) $ ", " $ string(acl.GetUserID(acl.selectIndex)) $ ")");
            page_Main.TcpChannel.sfReqBanUser(MM.kRoomID, MM.kUID, acl.GetUserID(acl.selectIndex));
            // End:0x510
            break;
        // End:0x224
        case 2:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x510
            break;
        // End:0x261
        case 3:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x510
            break;
        // End:0x2ba
        case 4:
            TPChat.SetEditText("/w " $ acl.GetUserName(acl.selectIndex) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x510
            break;
        // End:0x377
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteFriendHK");
            BTWindowInviteFriendHK(Controller.TopPage()).SetData(acl.GetUserName(acl.selectIndex), acl.GetUserID(acl.selectIndex));
            BTWindowInviteFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowInviteFriend_OnOK;
            // End:0x510
            break;
        // End:0x415
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x510
            break;
        // End:0x4d0
        case 7:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x510
            break;
        // End:0x50d
        case 8:
            page_Main.TcpChannel.sfReqAddBlockUserList(acl.GetUserName(acl.selectIndex));
            // End:0x510
            break;
        // End:0xffff
        default:
}

function TPTeamList_OnPopupCheck(BTACLTeamMemberListHK acl, BTCMTeamMemberListHK cm)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x33 [While If]
    if(i < 9)
    {
        cm.ChangeStateByIndex(i, 1);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    cm.ChangeStateByIndex(2, 0);
    // End:0x7d
    if(acl.GetClanName(acl.selectIndex) != "")
    {
        cm.ChangeStateByIndex(3, 0);
    }
    // End:0x242
    if(acl.ACLRowList[acl.selectIndex].DataPerColumn[6].IntValue != MM.kUID)
    {
        // End:0xf4
        if(MM.bIsOwner)
        {
            cm.ChangeStateByIndex(0, 0);
            cm.ChangeStateByIndex(1, 0);
        }
        cm.ChangeStateByIndex(4, 0);
        // End:0x14c
        if(TPMessenger.FindFriendFromUserName(acl.GetUserName(acl.selectIndex)) < 0)
        {
            cm.ChangeStateByIndex(5, 0);
        }
        // End:0x1b0
        if(MM.kClanName != "" && MM.kInClanGrade == 1 && acl.GetClanName(acl.selectIndex) == "")
        {
            cm.ChangeStateByIndex(6, 0);
        }
        // End:0x1fe
        if(MM.kClanName == "" && acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(7, 0);
        }
        // End:0x242
        if(!MM.IsBlockUser(acl.GetUserName(acl.selectIndex)))
        {
            cm.ChangeStateByIndex(8, 0);
        }
    }
}

function bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckBanUser] Result=" $ string(Result) $ ", GameNum=" $ string(GameNum) $ ", BanUID=" $ string(BanUID));
    // End:0x87
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x10f
    if(BanUID == MM.kUID)
    {
        page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineInfoHK", true, 0);
        BTWindowDefineInfoHK(page_Main.pwm.Last(7)).SetContentText_Instance(172);
    }
    return true;
}

function bool rfReqNotifyChangeRoomState(byte RoomState)
{
    Log("[BTPageRoomLobby::rfReqNotifyChangeRoomState] RoomState:" $ string(RoomState));
    CurrentRoomState = RoomState;
    // End:0x65
    if(CurrentRoomState == 0)
    {
        bReadyToGame = false;
    }
    ChangeButtonStart();
    return true;
}

function bool rfAckForceDisconnectUDPFromHost(int Result)
{
    Log("[BTPageRoomLobby::rfAckForceDisconnectUDPFromHost] Result:" $ string(Result));
    return true;
}

function bool rfReqRecvForceDisconnectUDPFromHost(int Result)
{
    Log("[BTPageRoomLobby::rfReqRecvForceDisconnectUDPFromHost] Result:" $ string(Result));
    // End:0x72
    if(MM.bIsOwner == false)
    {
        MM.ForceDisconnectUDPConnectionClientSide();
    }
    // End:0xbf
    else
    {
        Log("BTPageRoomLobby::rfReqRecvForceDisconnectUDPFromHost() host side. error!!");
    }
    return true;
}

function bool BTWindowChangeHost_OnOK(GUIComponent Sender)
{
    Log("page_Main.TcpChannel.sfReqChangeRoomOwner(" $ string(MM.kRoomID) $ ", " $ string(MM.kUID) $ ", " $ string(NewOwnerID) $ ")");
    page_Main.TcpChannel.sfReqChangeRoomOwner(MM.kRoomID, MM.kUID, NewOwnerID);
    Controller.CloseMenu(false);
    return true;
}

function bool BTWindowChangeHost_OnCancel(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::BTWindowChangeHost_OnCancel]");
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint)
{
    local wMatchUserInfo UserInfo;
    local string UserName;

    Log("[BTPageRoomLobby::rfAckGetUserHostPriorityPoint] Result:" $ string(Result) $ "/UserID:" $ string(UserID) $ "/OwnerScore:" $ string(HostPriorityPoint));
    // End:0x80
    if(0 != Result)
    {
        return false;
    }
    // End:0x14f
    if(HostPriorityPoint < MinWaringHostPoint)
    {
        Log("page_Main.TcpChannel.sfReqChangeRoomOwner(" $ string(MM.kRoomID) $ ", " $ string(MM.kUID) $ ", " $ string(UserID) $ ")" $ "/HostPoint:" $ string(HostPriorityPoint));
        page_Main.TcpChannel.sfReqChangeRoomOwner(MM.kRoomID, MM.kUID, UserID);
    }
    // End:0x1e9
    else
    {
        UserInfo = MM.GetUserInfoByUID(UserID);
        UserName = UserInfo.UserName;
        class'BTWindowDefineSelectHK'.static.ShowInfo(Controller, 21, UserName);
        NewOwnerID = UserID;
        BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowChangeHost_OnOK;
        BTWindowDefineSelectHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowChangeHost_OnCancel;
    }
    return true;
}

function bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    MM.CheckHolePunchingResult(Result, Phrase, InterventionUserID, Intervention, FailedUserIDs);
    return true;
}

function bool rfAckNotifyHostBlocking(int Result, byte Blocking)
{
    Log("BTPageRoomLobby::rfAckNotifyHostBlocking() Result=" $ string(Result) $ " Blocking=" $ string(Blocking));
    // End:0x77
    if(Result == 0)
    {
        MM.SetHostBlocking(bool(Blocking));
    }
    return true;
}

function bool rfAckGetIsHostBlocking(int Result, byte Blocking)
{
    Log("BTPageRoomLobby::rfAckGetIsHostBlocking() Result=" $ string(Result) $ " Blocking=" $ string(Blocking));
    MM.SetHostBlocking(bool(Blocking));
    switch(MyAction)
    {
        // End:0xbd
        case 1:
            // End:0x8d
            if(Result == 0)
            {
                StartNetworkChecking(0, true);
            }
            // End:0xba
            else
            {
                CloseNetworkCheckingWindow();
                bReadyToGame = false;
                ChangeButtonStart();
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
            // End:0x115
            break;
        // End:0xffff
        default:
            Log("BTPageRoomLobby::rfAckGetIsHostBlocking() MyAction is Invalid. MyAction=" $ string(MyAction));
            MyAction = 0;
            return true;
    }
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckDupCheckClanName]");
    // End:0x97
    if(Result == 0)
    {
        BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = true;
        BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck.DisableMe();
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 50);
    }
    // End:0x11c
    else
    {
        // End:0x103
        if(Result == 127)
        {
            BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = false;
            BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck.EnableMe();
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 51);
        }
        // End:0x11c
        else
        {
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    return true;
}

function bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTPageRoomLobby::rfAckCreateClan]");
    // End:0x246
    if(Result == 0)
    {
        Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer.ClanName = page_Main.SaveClanName;
        page_Main.MyClanName = page_Main.SaveClanName;
        MM.kClanName = page_Main.SaveClanName;
        MM.kInClanGrade = 1;
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
        page_Main.TcpChannel.sfReqClanUserList(page_Main.SaveClanName);
        class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 53);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = MoveToClanPage_OnOK;
        page_Main.TcpChannel.sfReqNotifyMyCharInfoToRoomUser();
    }
    // End:0x25f
    else
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
}

function bool MoveToClanPage_OnOK(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    // End:0x8c
    if(page_Main.page_curr == page_Main.page_Lobby2 || page_Main.page_curr == page_Main.page_RoomLobby || page_Main.page_curr == page_Main.page_ClanWar)
    {
        page_Main.SetPage(24, false);
    }
    // End:0x9e
    else
    {
        page_Main.SetPage(24, true);
    }
    return true;
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageRoomLobby::rfAckDBCharInfo]");
    // End:0x230
    if(Controller.TopPage() == self)
    {
        // End:0x9f
        if(bJoinClanState)
        {
            BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
            // End:0x95
            if(BTWindow != none)
            {
                // End:0x95
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
        // End:0x1e6
        if(ClanName == "none" || ClanName == "")
        {
            BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.DisableMe();
        }
        // End:0x230
        else
        {
            BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
            BTWindowUserDetailInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowUserDetailInfoHK_OnClanInfo;
        }
    }
    return true;
}

function bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    BTWindowUserPersonalInfo(Controller.TopPage()).UpdateCharDetailInfo(MaxSerial, MaxScore, MaxKill, MaxAssist, Serial3, Serial5, Serial7, Serial10, Serial15, AR, SMG, SR, SW, Melee, Grenade, FlashBang, Foot, AT4, MG, Fire, RPG7, TimeBomb, IcendiaryBomb, ClusterBomb, ByChopper, Artillery, KillChopper, FirstKill, LastKill, AllKill, Dominate, InstallBomb, DefuseBomb);
    return true;
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    Log("[BTPageRoomLobby::rfAckClanCharPersonelIntro]");
    // End:0x57
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
    Controller.CloseMenu(true);
    TcpChannel.sfReqClanInfo(ClanName);
    return true;
}

function bool BTWindowUserPersonalInfo_OnClanInfo(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    TcpChannel.sfReqClanInfo(MM.kClanName);
    return true;
}

function UpdateRecv_ClanInfo(BTNetMainMenu MainMenu)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageRoomLobby::UpdateRecv_ClanInfo]");
    // End:0x8b
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

function bool rfAckInviteClan(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckInviteClan]");
    // End:0x4c
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 41);
    return true;
}

function bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    Log("[BTPageRoomLobby::rfAckJoinClan]");
    // End:0xb6
    if(Result != 0)
    {
        // End:0x99
        if(Result == 537)
        {
            // End:0x7b
            if(MM.InGamePlaying)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(135, RealRecvCharName), 5, true);
            }
            // End:0x96
            else
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 135, RealRecvCharName);
            }
        }
        // End:0xb4
        else
        {
            class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            return true;
        }
        return true;
    }
    // End:0x1af
    if(MM.InGamePlaying)
    {
        // End:0x189
        if(SpecificCharName != "" && SpecificCharName != RealRecvCharName)
        {
            // End:0x122
            if(RealRecvCharClanGrade == 1)
            {
                page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(133, SpecificCharName, RealRecvCharName), 5, true);
            }
            // End:0x186
            else
            {
                // End:0x160
                if(RealRecvCharClanGrade == 2)
                {
                    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(134, SpecificCharName, RealRecvCharName), 5, true);
                }
                // End:0x186
                else
                {
                    Log("RealRecvCharClanGrade != 1 && != 2");
                }
            }
        }
        // End:0x1ac
        else
        {
            page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(42), 5, true);
        }
    }
    // End:0x26c
    else
    {
        // End:0x256
        if(SpecificCharName != "" && SpecificCharName != RealRecvCharName)
        {
            // End:0x1fc
            if(RealRecvCharClanGrade == 1)
            {
                class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 133, SpecificCharName, RealRecvCharName);
            }
            // End:0x253
            else
            {
                // End:0x22d
                if(RealRecvCharClanGrade == 2)
                {
                    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 134, SpecificCharName, RealRecvCharName);
                }
                // End:0x253
                else
                {
                    Log("RealRecvCharClanGrade != 1 && != 2");
                }
            }
        }
        // End:0x26c
        else
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 42);
        }
    }
    return true;
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfReqRecvClanInvite]");
    // End:0x97
    if(IsGameReadyOrPlaying())
    {
        page_Main.TcpChannel.sfAckRecvClanInvite(InviterUserDBID, InviterCharname, InviteMsg, ClanName, 3);
        RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(106, InviterCharname);
        page_Main.AddChatLog(RecvMsg, 5, true);
    }
    // End:0xa1
    else
    {
        bClanInviteState = true;
        return false;
    }
    return true;
}

function bool BTWindowDefineSelectHK_23_OnOK(GUIComponent Sender)
{
    page_Main.TcpChannel.sfReqDeleteFriend(DelFriendsList);
    Controller.CloseMenu(false);
    return true;
}

function bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    local string Message;

    Log("[BTPageRoomLobby::rfAckInviteClanResult]");
    // End:0x6a
    if(Permit == 0)
    {
        Message = class'BTWindowDefineInfoHK'.static.GetFormatString(43, CharName);
        // End:0x67
        if(IsGameReadyOrPlaying() == false)
        {
            RefreshPage();
        }
    }
    // End:0xed
    else
    {
        // End:0x96
        if(Permit == 1)
        {
            Message = class'BTWindowDefineInfoHK'.static.GetFormatString(138, CharName);
        }
        // End:0xed
        else
        {
            // End:0xc3
            if(Permit == 2)
            {
                Message = class'BTWindowDefineInfoHK'.static.GetFormatString(44, CharName);
            }
            // End:0xed
            else
            {
                // End:0xed
                if(Permit == 3)
                {
                    Message = class'BTWindowDefineInfoHK'.static.GetFormatString(145, CharName);
                }
            }
        }
    }
    page_Main.AddChatLog(Message, 5, true);
    return true;
}

function bool IsGameReadyOrPlaying()
{
    return MM.InGamePlaying || bReadyToGame || MM.bPendingStarted;
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckRecvClanInviteResult]");
    // End:0x56
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqNotifyMyCharInfoToRoomUser();
    // End:0x80
    if(IsGameReadyOrPlaying() == false)
    {
        RefreshPage();
    }
    return true;
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageRoomLobby::rfAckSearchClan]");
    // End:0x4c
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    // End:0xe0
    if(BTWindow != none)
    {
        BTWindow.SetPageLimit(1, TotalPage);
        BTWindow.SetData(TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    }
    return true;
}

function bool rfAckNotifyNewClanMember(string ClanName, string CharName)
{
    local string Message;

    Log("[BTPageRoomLobby::rfAckNotifyNewClanMember]");
    Message = class'BTWindowDefineInfoHK'.static.GetFormatString(54, ClanName, CharName);
    page_Main.AddChatLog(Message, 5, true);
    // End:0x79
    if(IsGameReadyOrPlaying() == false)
    {
        RefreshPage();
    }
    return true;
}

function bool rfAckNotifyClanSecession(string ClanName, string CharName)
{
    local MessageItem msgItem;
    local string Message;

    Log("[BTPageRoomLobby::rfAckNotifyClanSecession]");
    Message = class'BTWindowDefineInfoHK'.static.GetFormatString(59, CharName, ClanName);
    page_Main.AddChatLog(Message, 5, true);
    // End:0xab
    if(MM.InGamePlaying)
    {
        msgItem = GetConsole().ConstructMessageItem(Message, 6);
        GetConsole().AddMessageItem(msgItem);
    }
    return true;
}

function bool rfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    local string RecvMsg;
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageRoomLobby::rfReqRecvJoinClan]");
    // End:0x90
    if(IsGameReadyOrPlaying())
    {
        page_Main.TcpChannel.sfAckRecvJoinClan(UserIdx, CharName, Message, 3);
        RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(107, CharName);
        page_Main.AddChatLog(RecvMsg, 5, true);
    }
    // End:0x173
    else
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowRequestApprovalClanHK");
        BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
        BTWindow.SetData(UserIdx, CharName, Message);
        BTWindow.__OnOK__Delegate = BTWindowRequestApprovalClanHK_OnOK;
        BTWindow.__OnCancel__Delegate = BTWindowRequestApprovalClanHK_OnCancel;
        BTWindow.ButtonSuspend.__OnClick__Delegate = BTWindowRequestApprovalClanHK_OnSuspend;
        bJoinClanState = true;
        page_Main.TcpChannel.sfReqDBCharInfo(CharName);
    }
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageRoomLobby::BTWindowRequestApprovalClanHK_OnOK]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 0);
    Controller.CloseMenu(true);
    // End:0xb9
    if(IsGameReadyOrPlaying() == false)
    {
        RefreshPage();
    }
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageRoomLobby::BTWindowRequestApprovalClanHK_OnCancel]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 2);
    Controller.CloseMenu(true);
    return true;
}

function bool BTWindowRequestApprovalClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageRoomLobby::BTWindowRequestApprovalClanHK_OnSuspend]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 1);
    Controller.CloseMenu(true);
    class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
}

function bool rfAckJoinClanResult(string CharName, byte Permit, string PermitCharName)
{
    local string Message;

    Log("[BTPageRoomLobby::rfAckJoinClanResult]");
    // End:0x68
    if(Permit == 0)
    {
        Message = class'BTWindowDefineInfoHK'.static.GetFormatString(43, CharName);
        // End:0x65
        if(IsGameReadyOrPlaying() == false)
        {
            RefreshPage();
        }
    }
    // End:0xeb
    else
    {
        // End:0x94
        if(Permit == 1)
        {
            Message = class'BTWindowDefineInfoHK'.static.GetFormatString(137, CharName);
        }
        // End:0xeb
        else
        {
            // End:0xc1
            if(Permit == 2)
            {
                Message = class'BTWindowDefineInfoHK'.static.GetFormatString(44, CharName);
            }
            // End:0xeb
            else
            {
                // End:0xeb
                if(Permit == 3)
                {
                    Message = class'BTWindowDefineInfoHK'.static.GetFormatString(145, PermitCharName);
                }
            }
        }
    }
    page_Main.AddChatLog(Message, 5, true);
    return true;
}

function bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckRecvJoinClanResult]");
    // End:0x54
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqNotifyMyCharInfoToRoomUser();
    // End:0x7e
    if(IsGameReadyOrPlaying() == false)
    {
        RefreshPage();
    }
    return true;
}

function bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    local int i;

    Log("[BTPageRoomLobby::rfReqNotifyLevelUp]");
    // End:0x17d
    if(LevelUpUserID == MM.kUID)
    {
        page_Main.LevelUpInfo.bLevelUp = true;
        page_Main.LevelUpInfo.bCompleteLevelUp = false;
        page_Main.LevelUpInfo.Level = Level;
        page_Main.LevelUpInfo.Exp = Exp;
        page_Main.LevelUpInfo.ItemID.Length = ItemID.Length;
        i = 0;
        J0xc1:
        // End:0x10e [While If]
        if(i < page_Main.LevelUpInfo.ItemID.Length)
        {
            page_Main.LevelUpInfo.ItemID[i] = ItemID[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0xc1;
        }
        page_Main.LevelUpInfo.PartID.Length = PartID.Length;
        i = 0;
        J0x130:
        // End:0x17d [While If]
        if(i < page_Main.LevelUpInfo.PartID.Length)
        {
            page_Main.LevelUpInfo.PartID[i] = PartID[i];
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x130;
        }
    }
    return true;
}

function bool rfAckAcquirePromotionItems(int UID, int Result, string ErrMsg, array<BtrDouble> ItemUniqueID, array<int> ItemIDs, array<int> PartIDs)
{
    local int i;
    local bool bRecvPoint, bRecvItem;

    Log("[BTPageRoomLobby::rfAckAcquirePromotionItems]");
    // End:0x8b
    if(Result != 0)
    {
        // End:0x70
        if(UID != MM.kUID && page_Main.LevelUpInfo.bCompleteLevelUp == false)
        {
        }
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xa5
    if(UID != MM.kUID)
    {
        return true;
    }
    page_Main.LevelUpInfo.bCompleteLevelUp = true;
    i = 0;
    J0xc2:
    // End:0x11b [While If]
    if(i < ItemUniqueID.Length)
    {
        // End:0x109
        if(ItemIDs[i] == 0)
        {
            MM.kPoint += PartIDs[i];
            bRecvPoint = true;
        }
        // End:0x111
        else
        {
            bRecvItem = true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc2;
    }
    // End:0x13c
    if(bRecvPoint)
    {
        MM.UpdateMoneyInfo(MM);
    }
    // End:0x167
    if(bRecvItem)
    {
        MM.kNeedUpdateItemList = true;
        MM.kNeedUpdateSkillList = true;
    }
    return true;
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfAckChatWispher]");
    // End:0x69
    if(Result == 252)
    {
        RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(76, ToCharName);
        page_Main.AddChatLog(RecvMsg, 5, true);
    }
    // End:0xcf
    else
    {
        // End:0xab
        if(Result == 182)
        {
            RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(77, ToCharName);
            page_Main.AddChatLog(RecvMsg, 5, true);
        }
        // End:0xcf
        else
        {
            // End:0xcf
            if(Result != 0)
            {
                class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
}

function bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, array<int> UID, array<string> CharName, array<int> UserLevel, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<byte> IsLookForClan, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    Log("[BTPageRoomLobby::rfAckChannelUserList]");
    TotalChannelUserCount = TotalCount;
    // End:0x3ca
    if(Result == 0)
    {
        i = 0;
        J0x48:
        // End:0x277 [While If]
        if(i < UID.Length)
        {
            GameMgr.cmm.AddClanMark(ClanName[i], ClanPattern[i], ClanBG[i], ClanBL[i], true, IsLookForClan[i] > 0);
            GameMgr.cmm.SetClanLevel(ClanName[i], ClanLevel[i]);
            // End:0x1c1
            if(TPMessenger.ACLMsg[0].ACLRowList.Length > i + StartIndex)
            {
                TPMessenger.ReplaceChannelUser(i + StartIndex, ClanPattern[i], ClanBG[i], ClanBL[i], ClanName[i], UserLevel[i], CharName[i], UID[i], 0, 0, 0, IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
            }
            // End:0x26d
            else
            {
                TPMessenger.AddChannelUser(ClanPattern[i], ClanBG[i], ClanBL[i], ClanName[i], UserLevel[i], CharName[i], UID[i], 0, 0, 0, IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x48;
        }
        // End:0x2db
        if(TPMessenger.ACLMsg[0].ACLRowList.Length > TotalCount)
        {
            TPMessenger.ACLMsg[0].RemoveRowArray(TotalCount, TPMessenger.ACLMsg[0].ACLRowList.Length - TotalCount);
        }
        // End:0x3c7
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
        {
            TPChat.AddChatHistory(2, "TotalCount=" $ string(TotalCount) $ " ACL.Top=" $ string(TPMessenger.ACLMsg[0].MultiColumnList.Top) $ " ACL.ACLRowList.Length=" $ string(TPMessenger.ACLMsg[0].ACLRowList.Length) $ " UID.Length=" $ string(UID.Length), class'BTUIColorPoolHK'.static.ChatSystem());
        }
    }
    // End:0x40c
    else
    {
        Log("[BTPageRoomLobby::rfAckChannelUserList] Error Result=" $ string(Result));
    }
    return true;
}

function bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    Log("[BTPageRoomLobby::rfAckDeleteFriend]");
    // End:0x4e
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
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfReqRecvDeleteFriend]");
    // End:0x52
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    RecvMsg = class'BTWindowDefineInfoHK'.static.GetFormatString(75, FromCharName);
    page_Main.AddChatLog(RecvMsg, 5, true);
    page_Main.TcpChannel.sfReqFriendList();
    return true;
}

function bool rfReqNotifyDisconnectHostInLoading(int Result, string ErrMsg, int HostID)
{
    Log("[BTPageRoomLobby::rfReqNotifyDisconnectHostInLoading]");
    Log("[BTPageRoomLobby::rfReqNotifyDisconnectHostInLoading] MM.bPendingStarted=" $ string(MM.bPendingStarted) $ " MM.InGamePlaying=" $ string(MM.InGamePlaying) $ " MM.bSendedLoadingFailed=" $ string(MM.bSendedLoadingFailed));
    // End:0x17c
    if(MM.bSendedLoadingFailed == false)
    {
        // End:0x14d
        if(MM.bPendingStarted == true)
        {
            page_Main.TcpChannel.sfReqRemoveCheckTeamBalanceList();
            FailedNetworkChecking(GetErrMsg(5080), 5080);
        }
        // End:0x17c
        else
        {
            // End:0x17c
            if(MM.InGamePlaying == true)
            {
                MM.ForceDisconnectGameWithErrMessage(GetErrMsg(5072));
            }
        }
    }
    return true;
}

function bool rfAckNotifyMyCharInfoToRoomUser(int Result, string ErrMsg, int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost, string UserIP, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor)
{
    local int i, Index;
    local string RecvClanName;

    Log("[BTPageRoomLobby::rfAckNotifyMyCharInfoToRoomUser] UserName=" $ UserName);
    // End:0x6d
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x74:
    // End:0x413 [While If]
    if(i < MM.UserInfos.Length)
    {
        // End:0x409
        if(MM.UserInfos[i].UID == UID)
        {
            MM.UserInfos[i].UID = UID;
            MM.UserInfos[i].UserName = UserName;
            MM.UserInfos[i].Grade = Grade;
            MM.UserInfos[i].IsHost = IsHost == 0;
            MM.UserInfos[i].UserIP = UserIP;
            MM.UserInfos[i].TeamNum = TeamNum;
            // End:0x1b5
            if(ClanName == "" || ClanName == "none")
            {
                RecvClanName = "";
            }
            // End:0x1c0
            else
            {
                RecvClanName = ClanName;
            }
            Log("RecvClanName=" $ RecvClanName $ ", ClanMark=" $ string(CM_Pattern) $ ", ClanBG=" $ string(CM_BG) $ ", CM_BL=" $ string(CM_BL));
            MM.UserInfos[i].ClanName = RecvClanName;
            MM.UserInfos[i].ClanMark = CM_Pattern;
            MM.UserInfos[i].ClanBG = CM_BG;
            MM.UserInfos[i].ClanBL = CM_BL;
            // End:0x34d
            if(UID == MM.kUID)
            {
                MM.My_iTeam = TeamNum;
                MM.kTeamID = TeamNum;
                ChangeButtonStart();
                TPTeamList[TeamNum].ACLList.ChangeTeamMember(UID, CM_Pattern, CM_BG, CM_BL, Grade, UserName, RecvClanName, Statue, IsHost, 3, UserIP, IsLookFor, 0, true);
            }
            // End:0x406
            else
            {
                TPTeamList[TeamNum].ACLList.ChangeTeamMember(UID, CM_Pattern, CM_BG, CM_BL, Grade, UserName, RecvClanName, Statue, IsHost, 3, UserIP, IsLookFor, 0);
                Index = TPTeamList[TeamNum].ACLList.FindTeamMemberIndex(UID);
                // End:0x406
                if(Index >= 0)
                {
                    SetFriendlyUser(TPTeamList[TeamNum].ACLList.ACLRowList[Index]);
                }
            }
        }
        // End:0x413
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x74;
        }
    }
    SendPingAndSendHostPoint();
    return true;
}

function bool rfAckRegisterMyUdpInfo(int Result, string ErrMsg)
{
    // End:0x0e
    if(Result == 0)
    {
    }
    // End:0x54
    else
    {
        // End:0x3a
        if(Result == 422)
        {
            MM.ForceDisconnectGameWithErrMessage(GetErrMsg(5083));
        }
        // End:0x54
        else
        {
            MM.ForceDisconnectGameWithErrMessage(GetErrMsg(5084));
        }
    }
    return true;
}

function bool rfAckStartHolePunching(int Result, string ErrMsg, int GameType, int ReqStartUserID)
{
    // End:0x5a
    if(Result != 0)
    {
        Log("[BTPageRoomLobby::rfAckStartHolePunching] Result is " $ string(Result) $ " error!!");
        return true;
    }
    // End:0x8b
    if(MM.bIsOwner == true)
    {
        MM.StartHolePunchingHost(GameType, ReqStartUserID);
    }
    // End:0xa4
    else
    {
        MM.StartHolePunchingClient(GameType, ReqStartUserID);
    }
    return true;
}

function bool rfReqRecvForceFailedClientLoading(int ErrCode)
{
    // End:0x78
    if(MM.bIsOwner == true)
    {
        Log("[BTPageRoomLobby::rfReqRecvForceFailedClientLoading] this is Host!! error!! ErrCode=" $ string(ErrCode));
        return true;
    }
    // End:0xc1
    if(MM.bPendingStarted == true || MM.InGamePlaying == true)
    {
        MM.ForceDisconnectGameWithErrMessage(GetErrMsg(ErrCode));
    }
    // End:0x161
    else
    {
        Log("[BTPageRoomLobby::rfReqRecvForceFailedClientLoading] bPendingStarted=" $ string(MM.bPendingStarted) $ " InGamePlaying=" $ string(MM.InGamePlaying) $ " error!! ErrCode=" $ string(ErrCode));
    }
    return true;
}

function int FindTeamNumInArray(array<int> UserID, array<int> TeamNum, int FindUserID)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x42 [While If]
    if(i < UserID.Length)
    {
        // End:0x38
        if(UserID[i] == FindUserID)
        {
            return TeamNum[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return -1;
}

function bool rfAckAutoChangedTeamUserList(array<int> UserID, array<int> TeamNum)
{
    local int i, j, PrevTeam;
    local wMatchUserInfo mui;
    local BTAutoColumnListDataHK Data;
    local bool IsGM;

    Log("[BTPageRoomLobby::rfAckAutoChangedTeamUserList]" $ "UserID.Length=" $ string(UserID.Length));
    IsGM = false;
    i = 0;
    J0x5e:
    // End:0x33a [While If]
    if(i < MM.UserInfos.Length)
    {
        mui = MM.UserInfos[i];
        j = 0;
        J0x98:
        // End:0x13f [While If]
        if(j < GMList.Length)
        {
            // End:0x135
            if(GMList[j].DataPerColumn[6].IntValue == mui.UID)
            {
                IsGM = true;
                // End:0x135
                if(TPTeamList[0].ACLList.RemoveTeamMemberByUID(mui.UID) == false)
                {
                    TPTeamList[1].ACLList.RemoveTeamMemberByUID(mui.UID);
                }
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x98;
        }
        // End:0x14b
        if(IsGM)
        {
        }
        // End:0x330
        else
        {
            mui.TeamNum = FindTeamNumInArray(UserID, TeamNum, mui.UID);
            // End:0x25b
            if(mui.UID == MM.kUID)
            {
                MM.My_iTeam = mui.TeamNum;
                MM.kTeamID = mui.TeamNum;
                ChangeButtonStart();
                // End:0x20e
                if(float(MM.My_iTeam) % float(2) == float(0))
                {
                    currentBGM = "bgm_af_theme";
                }
                // End:0x223
                else
                {
                    currentBGM = "bgm_rsa_theme";
                }
                page_Main.LastMainPageBGM = currentBGM;
                PlayerOwner().Player.Console.SetOneBGM(currentBGM);
            }
            PrevTeam = 0;
            Data = TPTeamList[PrevTeam].ACLList.FindTeamMember(mui.UID);
            // End:0x2d8
            if(Data == none)
            {
                PrevTeam = 1;
                Data = TPTeamList[PrevTeam].ACLList.FindTeamMember(mui.UID);
            }
            TPTeamList[mui.TeamNum].ACLList.AddRow(Data);
            TPTeamList[PrevTeam].ACLList.RemoveTeamMemberByUID(mui.UID);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5e;
    }
    return true;
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    PlayerOwner().Level.Game.rfAckGetBotID(Result, RequestedAFCount, RequestedRSACount, AFBotID, RSABotID);
    return true;
}

function bool ButtonTemp_OnClick(GUIComponent Sender)
{
    page_Main.TcpChannel.sfReqCheckEquipedWeaponDurability();
    return true;
}

function bool rfAckCheckEquipedWeaponDurability(int Result, array<BtrDouble> ItemUniqueID, array<int> ItemSlotNum)
{
    local int i, Priority;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageRoomLobby::rfAckCheckEquipedWeaponDurability]");
    // This is an implied JumpToken; Continue!
    PlayerOwner().NativeFunctionToken(ArgumentOutOfRangeException);
    // Failed to format nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 14 & Type:If Position:479
    // Failed to format remaining nests!:System.ArgumentOutOfRangeException: Index was out of range. Must be non-negative and less than the size of the collection.
Parameter name: index
   at UELib.Core.UStruct.UByteCodeDecompiler.DecompileNests(Boolean outputAllRemainingNests)
   at UELib.Core.UStruct.UByteCodeDecompiler.Decompile()
    // 14 & Type:If Position:479
}

function bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    Log("[BTPageRoomLobby::rfAckChangedRoomTitle_FromGM] RoomNumber=" $ string(RoomNumber) $ " NewRoomTitle=" $ NewRoomTitle);
    // End:0x87
    if(Result != 0)
    {
        class'BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xd1
    if(MM.kRoomID == RoomNumber)
    {
        MM.szRoomName = NewRoomTitle;
        MM.UpdateGameRoomInfo(MM);
        UpdateRoomInfoByMatchMaker();
    }
    return true;
}

function bool rfAckRoomUserPingInfo(array<int> UnqueID, array<int> Ping, int HostScore)
{
    local int i;

    Log("[BTPageRoomLobby::sfAckRoomUserPingInfo] " $ string(UnqueID.Length) $ "," $ string(Ping.Length) $ "," $ string(HostScore));
    i = 0;
    J0x5b:
    // End:0xdb [While If]
    if(i < UnqueID.Length)
    {
        // End:0xd1
        if(TPTeamList[0].ACLList.ChangePingInfo(UnqueID[i], Ping[i]) == false)
        {
            TPTeamList[1].ACLList.ChangePingInfo(UnqueID[i], Ping[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5b;
    }
    // End:0x18c
    if(bShowHostWarning && HostScore >= MinWaringHostPoint)
    {
        i = 0;
        J0xfc:
        // End:0x18c [While If]
        if(i < MM.UserInfos.Length)
        {
            // End:0x182
            if(MM.UserInfos[i].IsHost)
            {
                page_Main.AddChatLog(strLowHostScoreWarning[0] $ MM.UserInfos[i].UserName $ strLowHostScoreWarning[1], 5, true);
                bShowHostWarning = false;
            }
            // End:0x18c
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xfc;
            }
        }
    }
    return true;
}

function OnReceivedPing(wMatchMaker MM, string fromAddr, int msec)
{
    local int nIdx, i;

    nIdx = MM.ReceivedPing(fromAddr, msec);
    // End:0x1c8
    if(nIdx >= 0)
    {
        // End:0xd9
        if(IsGameReadyOrPlaying())
        {
            ReceivedPingID.Length = 0;
            ReceivedPingValue.Length = 0;
            i = 0;
            J0x4a:
            // End:0xbf [While If]
            if(i < MM.UserInfos.Length)
            {
                ReceivedPingID[i] = MM.UserInfos[i].UID;
                ReceivedPingValue[i] = MM.UserInfos[i].iReceivedPing;
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x4a;
            }
            ReceivedPingValue[nIdx] = msec;
            sfReqRoomUserPingInfo();
        }
        // End:0x1c8
        else
        {
            // End:0x157
            if(TPTeamList[0].ACLList.ChangePingInfo(MM.UserInfos[nIdx].UID, msec) == false)
            {
                TPTeamList[1].ACLList.ChangePingInfo(MM.UserInfos[nIdx].UID, msec);
            }
            // End:0x18c
            if(MM.UserInfos[nIdx].IsHost)
            {
                MM.kServerPing = msec;
            }
            ReceivedPingID[ReceivedPingID.Length] = MM.UserInfos[nIdx].UID;
            ReceivedPingValue[ReceivedPingValue.Length] = msec;
        }
    }
}

function sfReqRoomUserPingInfo()
{
    local int HostScore;

    HostScore = MM.CalculateHostPoint(false);
    // End:0xb8
    if(!IsGameReadyOrPlaying() && bShowHostWarning && HostScore >= MinWaringHostPoint)
    {
        // End:0x76
        if(MM.bShowMessageHostUnsuitableness)
        {
            class'BTWindowDefineInfoHK'.static.ShowInfo(Controller, 78, MM.kUserName);
        }
        // End:0x9f
        else
        {
            page_Main.AddChatLog(MM.kUserName $ MessageHostChangeEnable[0], 5, true);
        }
        MM.bShowMessageHostUnsuitableness = false;
        bShowHostWarning = false;
    }
    // End:0x14f
    if(ReceivedPingID.Length > 0)
    {
        Log("[BTPageRoomLobby::sfReqRoomUserPingInfo] " $ string(ReceivedPingID.Length) $ "," $ string(ReceivedPingValue.Length) $ "," $ string(HostScore));
        page_Main.TcpChannel.sfReqRoomUserPingInfo(ReceivedPingID, ReceivedPingValue, HostScore);
        ReceivedPingID.Length = 0;
        ReceivedPingValue.Length = 0;
    }
}

function SendPingToAll()
{
    local int i;

    i = 0;
    J0x07:
    // End:0xaa [While If]
    if(i < MM.UserInfos.Length)
    {
        // End:0x6b
        if(MM.UserInfos[i].UID == MM.kUID)
        {
            page_Main.rMM.SendPingToChannelServer();
        }
        // End:0xa0
        else
        {
            page_Main.rMM.SendPingToOtherUser(MM.UserInfos[i].UserIP);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function UserPingRefresh()
{
    // End:0x21
    if(MM.bIsOwner)
    {
        sfReqRoomUserPingInfo();
        SendPingToAll();
    }
    // End:0x29
    else
    {
        KillTimer('UserPingRefresh');
    }
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageRoomLobby::rfAckNotifyAdjustClanMemberGrade]");
    // End:0x95
    if(MM.kUserName == CharName)
    {
        MM.kInClanGrade = CharGrade;
        MM.UpdateCharInfo(MM);
        MM.UpdateClanInfo(MM);
    }
    // End:0xdb
    if(CharGrade != 5)
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(55, CharName, strClanGrade[CharGrade]), 5, true);
    }
    // End:0x103
    else
    {
        page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(58, CharName), 5, true);
    }
    // End:0x115
    if(IsGameReadyOrPlaying() == false)
    {
        RefreshPage();
    }
    return true;
}

function bool rfReqInGameRoomUserInfoChanged()
{
    Log("[BTPageRoomLobby::rfReqInGameRoomUserInfoChanged]");
    // End:0xb2
    if(MM.InGamePlaying == false)
    {
        Log("page_Main.TcpChannel.sfReqRoomUserList(" $ string(MM.kRoomID) $ ")");
        page_Main.TcpChannel.sfReqRoomUserList(MM.kRoomID);
    }
    return true;
}

function bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel)
{
    local int i;

    Log("[BTPageRoomLobby::rfReqInGameRoomUserClanLevelChanged] UID = " $ string(UserID) $ ", ClanLevel=" $ string(ClanLevel));
    // End:0x129
    if(MM.InGamePlaying == false)
    {
        i = 0;
        J0x7f:
        // End:0x115 [While If]
        if(i < MM.UserInfos.Length)
        {
            // End:0x10b
            if(MM.UserInfos[i].UID == UserID)
            {
                Log("SetClanLevel");
                GameMgr.cmm.SetClanLevel(MM.UserInfos[i].ClanName, ClanLevel);
                return true;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x7f;
        }
        Log("Can not Find UID");
    }
    return true;
}

function bool rfAckNotifyUpdateCharInfo_LevelMark(string CharName, int LevelMarkID)
{
    local int i;

    Log("[BTPageRoomLobby::rfAckNotifyUpdateCharInfo_LevelMark] CharName = " $ CharName $ ", LevelMarkID=" $ string(LevelMarkID));
    i = 0;
    J0x6f:
    // End:0xb6 [While If]
    if(i < 2)
    {
        // End:0xac
        if(TPTeamList[i].ACLList.ChangeLevelMarkID(CharName, LevelMarkID) == true)
        {
        }
        // End:0xb6
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x6f;
        }
    }
    return true;
}

function bool rfAckFriendPosition(int Result, string TargetCharName, byte ServerType, string fServername, string fServerShortName, string fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, string ChannelNickName, int GameRoomNum)
{
    local export editinline BTCMMessengerOnOffline CCM;
    local export editinline BTACLMessengerCommon acl;

    // End:0x17b
    if(Result == 0)
    {
        CCM = BTCMMessengerOnOffline(TPMessenger.ACLMsg[TPMessenger.TabControl.GetCurrentTabIndex()].ContextMenu);
        acl = BTACLMessengerCommon(TPMessenger.ACLMsg[TPMessenger.TabControl.GetCurrentTabIndex()]);
        TPMessenger.SetUserServerInfo(fServername, fServerShortName, fServerIP, fServerPort, CurPos, CurState, ChannelNum, ChannelNickName, GameRoomNum);
        // End:0xc1
        if(CCM == none)
        {
            return true;
        }
        // End:0x118
        if(CCM.IsActiveMoveRoomState() == true)
        {
            // End:0x118
            if(!page_Main.CheckMoveToChannel(page_Main.FindServerChannelInfoIndexByServerIP(fServerIP, fServerPort, ChannelNum)))
            {
                CCM.ChangeMoveRoomState(false);
            }
        }
        // End:0x17b
        if(CCM.IsActiveInviteState() == true)
        {
            // End:0x17b
            if(MatchMaker.kClanMatch_InChannel == true)
            {
                // End:0x17b
                if(false == CheckEnterRoom_InClanChannel(acl.GetClanName(acl.selectIndex)))
                {
                    CCM.ChangeInviteState(false);
                }
            }
        }
    }
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
    // End:0x2b
    if(bool(Community_Type & 1 << 1))
    {
        TPMessenger.ReplaceUserNickName(1, Old_NickName, New_NickName);
    }
    // End:0x57
    if(bool(Community_Type & 1 << 2))
    {
        TPMessenger.ReplaceUserNickName(2, Old_NickName, New_NickName);
    }
    // End:0x83
    if(bool(Community_Type & 1 << 3))
    {
        TPMessenger.ReplaceUserNickName(3, Old_NickName, New_NickName);
    }
    // End:0xaf
    if(bool(Community_Type & 1 << 5))
    {
        TPMessenger.ReplaceUserNickName(4, Old_NickName, New_NickName);
    }
    // End:0x10d
    if(bool(Community_Type & 1 << 4))
    {
        // End:0x10d
        if(!TPTeamList[0].ACLList.ReplaceUserNickName(Old_NickName, New_NickName))
        {
            TPTeamList[1].ACLList.ReplaceUserNickName(Old_NickName, New_NickName);
        }
    }
    MM.ReplaceBlockNickName(Old_NickName, New_NickName);
    MM.ReplaceUserName(Old_NickName, New_NickName);
    return true;
}

function bool rfNotifyNewClanName(string New_NickName)
{
    Log("[BTPageRoomLobby::rfNotifyNewClanName()] New_NickName=" $ New_NickName);
    TPMessenger.ReplaceClanName(byte(TPMessenger.TabControl.CurrentTabIndex), MM.kClanName, New_NickName);
    TPTeamList[0].ACLList.ReplaceClanName(MM.kClanName, New_NickName);
    TPTeamList[1].ACLList.ReplaceClanName(MM.kClanName, New_NickName);
    MM.kClanName = New_NickName;
    MM.UpdateClanInfo(MM);
    return true;
}

function bool rfNotifyClanLevelup(string ClanName, int Levelup)
{
    Log("[BTPageRoomLobby::rfNotifyClanLevelup]");
    TPMessenger.ReplaceClanLevel(byte(TPMessenger.TabControl.CurrentTabIndex), ClanName, Levelup);
    TPTeamList[0].ACLList.ReplaceClanLevel(ClanName, Levelup);
    TPTeamList[1].ACLList.ReplaceClanLevel(ClanName, Levelup);
    MM.kClanLevel = Levelup;
    MM.UpdateClanInfo(MM);
    page_Main.AddChatLog(class'BTWindowDefineInfoHK'.static.GetFormatString(224, ClanName, string(Levelup)), 5, true);
    return true;
}

function SaveUserData(BTAutoColumnListDataHK Item)
{
    local int idx;

    idx = UserListDB.Length;
    UserListDB.Insert(idx, 1);
    UserListDB[idx] = Item;
}

function BTAutoColumnListDataHK MakeTeamMemberData(int UID, int ClanMark, int ClanBG, int ClanBL, int Level, string NickName, string ClanName, int Status, int Host, int Ping, string UserIP, byte LookingFor, int ClanLevel, int LevelMarkID, int TitleMarkID, int TeamNum, int Reserved2, int Reserved3, optional bool bMe, optional bool bisGM)
{
    local BTAutoColumnListDataHK Data;
    local int i;
    local wGameManager GameMgr;

    Data = new class'BTAutoColumnListDataHK';
    Data.Init(10);
    i = 0;
    J0x27:
    // End:0x85 [While If]
    if(i < 3)
    {
        Data.DataPerColumn[2].Text[i].FontDrawType = 3;
        Data.DataPerColumn[3].Text[i].FontDrawType = 3;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x27;
    }
    i = 0;
    J0x8c:
    // End:0x10e [While If]
    if(i < 9)
    {
        // End:0xd4
        if(bMe)
        {
            Data.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.myName();
        }
        // End:0x104
        else
        {
            Data.DataPerColumn[i].Text[0].DrawColor = class'BTUIColorPoolHK'.static.DefaultWhite();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x8c;
    }
    Data.DataPerColumn[0].IntValue = ClanMark;
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    Data.DataPerColumn[1].IntValue = Level;
    Data.DataPerColumn[1].tempValue = LevelMarkID;
    Data.DataPerColumn[2].strValue = NickName;
    Data.DataPerColumn[2].IntValue = int(bMe);
    Data.DataPerColumn[3].strValue = ClanName;
    Data.DataPerColumn[3].IntValue = int(bisGM);
    Data.DataPerColumn[4].IntValue = Status;
    Data.DataPerColumn[4].floatValue = float(Host);
    Data.DataPerColumn[5].strValue = UserIP;
    Data.DataPerColumn[5].IntValue = Ping;
    Data.DataPerColumn[6].Image = GameMgr.GetClanMark32(ClanMark);
    Data.DataPerColumn[6].IntValue = UID;
    Data.DataPerColumn[7].IntValue = ClanBG;
    Data.DataPerColumn[7].Image = GameMgr.GetClanMark32(ClanBG);
    Data.DataPerColumn[8].IntValue = ClanBL;
    Data.DataPerColumn[8].Image = GameMgr.GetClanMark32(ClanBL);
    Data.DataPerColumn[4].tempValue = LookingFor;
    Data.DataPerColumn[5].tempValue = ClanLevel;
    Data.DataPerColumn[9].Image = class'BTCustomDrawHK'.static.MakeImage(16, 16, 0, GameMgr.GetClanLevelTexture(ClanLevel));
    Data.DataPerColumn[9].IntValue = TeamNum;
    // End:0x439
    if(NickName == Controller.ViewportOwner.Actor.Level.GetMatchMaker().kUserName)
    {
        Data.DataPerColumn[3].tempValue = 1;
    }
    // End:0x451
    else
    {
        Data.DataPerColumn[3].tempValue = 0;
    }
    // End:0x475
    if(bisGM)
    {
        Data.DataPerColumn[2].IntValue = 1;
    }
    // End:0x48d
    else
    {
        Data.DataPerColumn[2].IntValue = 0;
    }
    return Data;
}

function bool CheckEnterRoom_InClanChannel(string szClanName)
{
    local int lp1;
    local string szInRoomClanName[2];

    // End:0x0e
    if(szClanName == "")
    {
        return false;
    }
    lp1 = 0;
    J0x15:
    // End:0x82 [While If]
    if(lp1 < 2)
    {
        // End:0x4d
        if(TPTeamList[lp1].GetUserCount() == 0)
        {
            szInRoomClanName[lp1] = "";
        }
        // End:0x78
        else
        {
            szInRoomClanName[lp1] = TPTeamList[lp1].ACLList.GetClanName(0);
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    // End:0xa2
    if(szInRoomClanName[0] == "" || szInRoomClanName[1] == "")
    {
        return true;
    }
    // End:0xc8
    if(szInRoomClanName[0] == szClanName || szInRoomClanName[1] == szClanName)
    {
        return true;
    }
    return false;
}

defaultproperties
{
    OutofSeatTime=90
    OwnerOutofSeatTime=30
    strTeamBalance[0]="Team Balance is active. You earn +5% EXP and Points."
    strTeamBalance[1]="If the Team Balance option is set, players are automatically assigned to a team when the game starts to maintain team balance, regardless of their preference."
    strTeamBalance[2]="Team Balance has been disabled by the host."
    strBotModeWarn[0]="Private First Class (3) or lower still gain 100% EXP from Bot modes."
    strBotModeWarn[1]="Bot modes reward less EXP and Points than normal modes."
    strNoviceMode="Rookie missions are played against the AI (computer). Respawns are fixed and enemy locations are always displayed on the mini-map."
    strBotMode="Bot modes are fought against the AI (computer). They give less rewards than other modes."
    TimeAutoStart=-1.0
    RefreshCycleTime[0]=10.0
    RefreshCycleTime[1]=10.0
    fbLabelTeam=(X1=10.0,Y1=87.0,X2=761.0,Y2=498.0)
    fbLabelTeamTopLine=(X1=10.0,Y1=100.0,X2=747.0,Y2=115.0)
    fbButtonTeam[0]=(X1=12.0,Y1=137.0,X2=374.0,Y2=184.0)
    fbButtonTeam[1]=(X1=383.0,Y1=137.0,X2=745.0,Y2=184.0)
    fbTPTeamList[0]=(X1=12.0,Y1=207.0,X2=374.0,Y2=495.0)
    fbTPTeamList[1]=(X1=383.0,Y1=207.0,X2=745.0,Y2=495.0)
    fbTPChat=(X1=10.0,Y1=518.0,X2=460.0,Y2=736.0)
    fbTPMessenger=(X1=500.0,Y1=518.0,X2=746.0,Y2=733.0)
    fbTPMyInfo=(X1=772.0,Y1=525.0,X2=1014.0,Y2=735.0)
    fbTPRoomInfo=(X1=771.0,Y1=87.0,X2=1014.0,Y2=424.0)
    strButtonStart[0]="Start Game"
    strButtonStart[1]="Ready"
    strButtonStart[2]="Cancel"
    fbButtonStart=(X1=771.0,Y1=434.0,X2=1014.0,Y2=498.0)
    fbButtonTemp=(X1=771.0,Y1=499.0,X2=1014.0,Y2=520.0)
    CannotChangeHostTitle="Change Host"
    CannotChangeHostMessage="Disconnected from the host. The Change Host function for both Search & Destroy and Domination is currently undergoing internal testing."
    WaitingMessage="Configuring network connection settings. Wait a moment."
    MessageNewHost="Host change is in progress. You are the new host."
    MessageNewGuestPre="Host change is in progress."
    MessageNewGuestPost=" is the new host."
    MessageHostChangeEnable[0]="Your PC specs are below the recommended to be a host. As a result, the game may not run smoothly. We recommend changing the host to another user."
    MessageHostChangeEnable[1]="s PC specs are below the recommended to be a host. As a result, the game may not run smoothly. Do you still want to change the host to this user?"
    strLowHostScoreWarning[0]="The host ("
    strLowHostScoreWarning[1]=") has low PC specs or a poor ping. The game may not run smoothly."
    MinHostPoint=100
    MinWaringHostPoint=100
    MaxWaringHostPoint=999
    SendPingIntervalTime=10.0
    fbBGDeco=(X1=0.0,Y1=0.0,X2=1024.0,Y2=768.0)
    OnOpen=InternalOnOpen
    OnReOpen=InternalOnReOpen
    OnClose=InternalOnClose
    OnPreDraw=InternalOnPreDraw
    OnKeyEvent=internalKeyEvent
}