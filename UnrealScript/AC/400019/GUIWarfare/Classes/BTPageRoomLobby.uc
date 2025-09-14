class BTPageRoomLobby extends BTNetQuestInfoPageHK
    editinlinenew
    instanced;

const UserPingRefreshTime = 5;

enum E_MyAction
{
    E_MY_ACTION_NONE,               // 0
    E_MY_ACTION_INTERVENTION        // 1
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
var() automated FloatBox fbLabelTeam;
var export editinline BTOwnerDrawImageHK LabelTeam;
var() automated FloatBox fbLabelTeamTopLine;
var export editinline BTOwnerDrawImageHK LabelTeamTopLine;
var() automated FloatBox fbButtonTeam[2];
var export editinline BTOwnerDrawCaptionButtonHK ButtonTeam[2];
var() automated FloatBox fbTPTeamList[2];
var export editinline BTTPTeamMemberList TPTeamList[2];
var array<BTAutoColumnListDataHK> UserListDB;
var array<BTAutoColumnListDataHK> GMList;
var int GMNumAF;
var int GMNumRSA;
var() automated FloatBox fbTPChat;
var export editinline BTTPChatHK TPChat;
var() automated FloatBox fbTPMessenger;
var export editinline BTTPMessengerHKCN TPMessenger;
var() automated FloatBox fbTPMyInfo;
var export editinline BTTPMyInfoHK TPMyInfo;
var() automated FloatBox fbTPRoomInfo;
var export editinline BTTPRoomInfoHK TPRoomInfo;
var localized string strButtonStart[3];
var() automated FloatBox fbButtonStart;
var export editinline BTOwnerDrawCaptionButtonHK ButtonStart;
var() automated FloatBox fbButtonTemp;
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
var() automated FloatBox fbBGDeco;
var export editinline BTOwnerDrawImageHK BGDeco;
var export editinline BTOwnerDrawCaptionButtonHK MyInfoBtn;
//var delegate<CurrentButtonClickBehavior> __CurrentButtonClickBehavior__Delegate;

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
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 103);
        return true;
    }
    // End:0x49D
    if(MM.bIsOwner)
    {
        NetRoomInfo.RoomNumber = MM.kRoomID;
        NetRoomInfo.RoomName = BTWindow.EditRoomName.TextStr;
        NetRoomInfo.TeamCnt = 2;
        NetRoomInfo.MapName = BTWindow.GetMap();
        NetRoomInfo.MapNum = byte(BTWindow.GetSelectedMapID());
        NetRoomInfo.GameModeNum = byte(BTWindow.GetGameModeIndex());
        NetRoomInfo.GameClass = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(NetRoomInfo.GameModeNum)).ClassName;
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
        else
        {
            NetRoomInfo.IsTeamValance = 0;
        }
        // End:0x391
        if(BTWindow.GetMultiBomb())
        {
            NetRoomInfo.BombHold = 1;            
        }
        else
        {
            NetRoomInfo.BombHold = 0;
        }
        // End:0x3CC
        if(BTWindow.EditPassword.TextStr != "")
        {
            NetRoomInfo.IsPassword = 1;            
        }
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
        else
        {
            NetRoomInfo.ResponType = 0;
        }
        // End:0x480
        if(BTWindow.GetGameModeIndex() == Class'Engine.wGameSettings'.static.GetModeIndex_Defence())
        {
            NetRoomInfo.TeamCnt = 2;
            NetRoomInfo.UserTeamNum = 0;
            NetRoomInfo.ResponType = 1;
        }
        page_Main.TcpChannel.sfReqChangeRoomSetting(NetRoomInfo);
    }
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool WindowInviteFriend_OnOK(GUIComponent Sender)
{
    local bool bTemp;
    local string imsg;
    local export editinline BTWindowInviteFriendHK window;

    window = BTWindowInviteFriendHK(Controller.TopPage());
    imsg = window.MultiLineEditMsg.GetText();
    bTemp = page_Main.TcpChannel.sfReqSendFriendInvite(window.friendUID, window.FriendName, imsg);
    Controller.TopPage().FadeOut(false, true);
    return true;
    //return;    
}

function bool BTWindowInviteClan_OnOK(GUIComponent Sender)
{
    page_Main.TcpChannel.sfReqInviteClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool BTWindowJoinClan_OK(GUIComponent Sender)
{
    page_Main.TcpChannel.sfReqJoinClan(BTWindowInviteClanHK(Controller.TopPage()).SaveData, BTWindowInviteClanHK(Controller.TopPage()).SaveInviterName, BTWindowInviteClanHK(Controller.TopPage()).ClanInviteMsg.TextStr);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool ButtonRoomInfo_OnClick(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::ButtonRoomInfo_OnClick]");
    Controller.OpenMenu("GUIWarfareControls.BTWindowRoomInfoHK");
    BTWindowRoomInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowRoomInfoHK_OnOK;
    return true;
    //return;    
}

function bool GotoInventory_OnOK(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::BasicItemDurabilityWarn_OnOK]");
    Controller.CloseMenu(false);
    page_Main.SetPage(22, false);
    return true;
    //return;    
}

function bool GotoStartGame_OnOK(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::GotoStartGame_OnOK]");
    Controller.CloseMenu(false);
    CurrentButtonClickBehavior(Sender);
    return true;
    //return;    
}

function bool CheckPrimaryWeaponDurability()
{
    local int i, j;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageRoomLobby::CheckPrimaryWeaponDurability]");
    i = 0;
    J0x3A:

    // End:0x140 [Loop If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        // End:0x136
        if(GameMgr.InstanceItemLists[i].SlotPosition != 13)
        {
            ItemInfo = GameMgr.FindUIItem(GameMgr.InstanceItemLists[i].ItemID);
            // End:0x136
            if(false == MM.CheckUsingItem(ItemInfo))
            {
                // End:0xFB
                if(MM.bIsOwner || CurrentRoomState == 1)
                {
                    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 29);                    
                }
                else
                {
                    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 28);
                }
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                return false;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x3A;
    }
    i = 0;
    J0x147:

    // End:0x275 [Loop If]
    if(i < GameMgr.QuickSlotBoxList.Length)
    {
        j = 0;
        J0x167:

        // End:0x26B [Loop If]
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
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 29);                        
                    }
                    else
                    {
                        Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 28);
                    }
                    BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                    return false;
                }
            }
            j++;
            // [Loop Continue]
            goto J0x167;
        }
        i++;
        // [Loop Continue]
        goto J0x147;
    }
    i = 0;
    J0x27C:

    // End:0x3AF [Loop If]
    if(i < 2)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x3A5
        if((instanceInfo != none) && instanceInfo.Durability < 1000)
        {
            // End:0x3A5
            if((instanceInfo.ItemID == 2000) || instanceInfo.ItemID == 1010)
            {
                ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
                // End:0x3A5
                if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
                {
                    Class'GUIWarfareControls.BTWindowDefineSelectHK'.static.ShowInfo(Controller, 19);
                    BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                    BTWindowDefineSelectHK(Controller.TopPage()).__OnCancel__Delegate = GotoStartGame_OnOK;
                    return false;
                }
            }
        }
        i++;
        // [Loop Continue]
        goto J0x27C;
    }
    i = 0;
    J0x3B6:

    // End:0x494 [Loop If]
    if(i < 4)
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(i);
        // End:0x48A
        if((instanceInfo != none) && instanceInfo.Durability < 1000)
        {
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            // End:0x48A
            if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 66);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                return false;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x3B6;
    }
    i = 0;
    J0x49B:

    // End:0x5F0 [Loop If]
    if(i < GameMgr.QuickSlotBoxList.Length)
    {
        j = 0;
        J0x4BB:

        // End:0x5E6 [Loop If]
        if(j < 4)
        {
            // End:0x5DC
            if(__NFUN_913__(GameMgr.QuickSlotBoxList[i].UniqueID[j], EmptyBtrDouble()))
            {
                instanceInfo = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[i].UniqueID[j]);
                // End:0x5DC
                if((instanceInfo != none) && instanceInfo.Durability < 1000)
                {
                    ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
                    // End:0x5DC
                    if((ItemInfo.CostType == 0) || ItemInfo.CostType == 2)
                    {
                        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 67);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                        return false;
                    }
                }
            }
            j++;
            // [Loop Continue]
            goto J0x4BB;
        }
        i++;
        // [Loop Continue]
        goto J0x49B;
    }
    return true;
    //return;    
}

function bool CheckCanUseWeapon()
{
    local int i;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;
    local wWeaponManager WeaponMgr;

    WeaponMgr = Controller.ViewportOwner.Actor.Level.WeaponMgr;
    // End:0x2BF
    if(TPRoomInfo.ModeNum == Class'Engine.wGameSettings'.static.GetModeIndex_Alien())
    {
        instanceInfo = GameMgr.FindInstanceItemBySlotPos(2);
        ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        // End:0x14E
        if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
        {
            // End:0x14E
            if(!WeaponMgr.IsUseWeapon_InGame(MM.kGame_GameMode, ItemInfo.ItemID))
            {
                // End:0x113
                if(MM.bIsOwner || CurrentRoomState == 1)
                {
                    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 74);                    
                }
                else
                {
                    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 73);
                }
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                return false;
            }
        }
        i = 0;
        J0x155:

        // End:0x2BF [Loop If]
        if(i < GameMgr.QuickSlotBoxList.Length)
        {
            // End:0x2B5
            if(__NFUN_913__(GameMgr.QuickSlotBoxList[i].UniqueID[2], EmptyBtrDouble()))
            {
                instanceInfo = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[i].UniqueID[2]);
                ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
                // End:0x2B5
                if(GameMgr.CheckThrowingWeapon(ItemInfo.ItemType))
                {
                    // End:0x2B5
                    if(!WeaponMgr.IsUseWeapon_InGame(MM.kGame_GameMode, ItemInfo.ItemID))
                    {
                        // End:0x27A
                        if(MM.bIsOwner || CurrentRoomState == 1)
                        {
                            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 74);                            
                        }
                        else
                        {
                            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 73);
                        }
                        BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;
                        return false;
                    }
                }
            }
            i++;
            // [Loop Continue]
            goto J0x155;
        }
    }
    return true;
    //return;    
}

function bool CheckGameModeStartCondition()
{
    // End:0x91
    if(Controller.ViewportOwner.Actor.Level.bServiceBuild == true)
    {
        // End:0x91
        if(TPRoomInfo.ModeNum == Class'Engine.wGameSettings'.static.GetModeIndex_Alien())
        {
            // End:0x91
            if((TPTeamList[0].ACLList.GetReadyUserCount() + TPTeamList[1].ACLList.GetReadyUserCount()) < 2)
            {
                return false;
            }
        }
    }
    return true;
    //return;    
}

delegate bool CurrentButtonClickBehavior(GUIComponent Sender)
{
    //return;    
}

function bool ButtonStart_OnClick_Before_CheckDurability(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::ButtonStart_OnClick_Before_CheckDurability]");
    // End:0x4F
    if((CheckPrimaryWeaponDurability()) == false)
    {
        return true;
    }
    // End:0x5D
    if((CheckCanUseWeapon()) == false)
    {
        return true;
    }
    CurrentButtonClickBehavior(Sender);
    return true;
    //return;    
}

function bool ButtonStart_OnClick(GUIComponent Sender)
{
    local int LimitCount, GameUserCount;

    Log(("[BTPageRoomLobby::ButtonStart_OnClick]" $ " owner=") $ string(MM.bIsOwner));
    Log("[BTPageRoomLobby::ButtonStart_OnClick] NatType=" $ string(page_Main.NatType));
    Controller.PopPage();
    // End:0xC7
    if(MM.kGame_TeamBalance)
    {
        Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 3);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 2);
    }
    // End:0x135
    if(page_Main.NatType < 0)
    {
        Log("[BTPageRoomLobby::ButtonStart_OnClick]" @ "NatType Not Determined");
    }
    // End:0x728
    if(MM.bIsOwner)
    {
        // End:0x162
        if((int(MM.GMLevelFlag) & 1) == 1)
        {
            return true;
        }
        // End:0x170
        if((CheckGameModeStartCondition()) == false)
        {
            return true;
        }
        GameUserCount = ((TPTeamList[0].ACLList.ACLRowList.Length + TPTeamList[1].ACLList.ACLRowList.Length) - GMNumAF) - GMNumRSA;
        // End:0x619
        if(MM.kClanMatch_InChannel && Controller.ViewportOwner.Actor.Level.bServiceBuild == true)
        {
            // End:0x248
            if((page_Main.kClanWarUserCountIgnore == false) && GameUserCount <= 7)
            {
                Controller.PopPage();
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 193);
                return true;
            }
            // End:0x2B1
            if((TPTeamList[0].ACLList.IsAllReady() == false) || TPTeamList[1].ACLList.IsAllReady() == false)
            {
                Controller.PopPage();
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 189);
                return true;
            }
            // End:0x328
            if((page_Main.kClanWarUserCountIgnore == false) && TPTeamList[0].ACLList.GetReadyUserCount() != TPTeamList[1].ACLList.GetReadyUserCount())
            {
                Controller.PopPage();
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 194);
                return true;
            }
            // End:0x33F
            if(GameUserCount <= 8)
            {
                LimitCount = 3;                
            }
            else
            {
                // End:0x356
                if(GameUserCount <= 10)
                {
                    LimitCount = 3;                    
                }
                else
                {
                    // End:0x36D
                    if(GameUserCount <= 12)
                    {
                        LimitCount = 4;                        
                    }
                    else
                    {
                        // End:0x384
                        if(GameUserCount <= 14)
                        {
                            LimitCount = 5;                            
                        }
                        else
                        {
                            LimitCount = 6;
                        }
                    }
                }
            }
            // End:0x463
            if(((page_Main.kClanWarUserCountIgnore == false) && TPTeamList[0].ACLList.GetMaxSameClanUserCount() < LimitCount) && TPTeamList[1].ACLList.GetMaxSameClanUserCount() < LimitCount)
            {
                Controller.PopPage();
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 190, "AF, RSA", string((TPTeamList[0].ACLList.ACLRowList.Length + TPTeamList[1].ACLList.ACLRowList.Length) / 2), string(LimitCount));
                return true;                
            }
            else
            {
                // End:0x50F
                if((page_Main.kClanWarUserCountIgnore == false) && TPTeamList[0].ACLList.GetMaxSameClanUserCount() < LimitCount)
                {
                    Controller.PopPage();
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 190, "AF", string((TPTeamList[0].ACLList.ACLRowList.Length + TPTeamList[1].ACLList.ACLRowList.Length) / 2), string(LimitCount));
                    return true;                    
                }
                else
                {
                    // End:0x5B9
                    if((page_Main.kClanWarUserCountIgnore == false) && TPTeamList[1].ACLList.GetMaxSameClanUserCount() < LimitCount)
                    {
                        Controller.PopPage();
                        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 190, "RSA", string((TPTeamList[0].ACLList.ACLRowList.Length + TPTeamList[1].ACLList.ACLRowList.Length) / 2), string(LimitCount));
                        return true;
                    }
                }
            }
            // End:0x619
            if(TPTeamList[0].ACLList.GetMaxSameClanName() == TPTeamList[1].ACLList.GetMaxSameClanName())
            {
                Controller.PopPage();
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 191);
                return true;
            }
        }
        // End:0x6B3
        if((MM.szGameClass == "wGame.wDeathMatch") && (((TPTeamList[0].ACLList.ACLRowList.Length + TPTeamList[1].ACLList.ACLRowList.Length) - GMNumAF) - GMNumRSA) > 8)
        {
            Controller.PopPage();
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 25);
            return true;
        }
        Log("[BTPageRoomLobby::ButtonStart_OnClick]" @ "NatType OK, Start Game Request");
        page_Main.TcpChannel.sfReqStartGame(MM.kRoomID);        
    }
    else
    {
        // End:0x780
        if(((int(MM.GMLevelFlag) & 3) == 0) && MM.kClanMatch_InChannel)
        {
            Controller.PopPage();
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 188);
            return true;            
        }
        else
        {
            // End:0x7E3
            if(MM.InGamePlaying == true)
            {
                Log("BTPageRoomLobby::ButtonStart_OnClick() MM.InGamePlaying is true. error!!");
                return false;
            }
            // End:0x848
            if(MM.bPendingStarted == true)
            {
                Log("BTPageRoomLobby::ButtonStart_OnClick() MM.bPendingStarted is true. error!!");
                return false;
            }
            Log("[BTPageRoomLobby::ButtonStart_OnClick]" @ "NatType OK, Join Game Request");
            page_Main.TcpChannel.sfReqConnectGame();
        }
    }
    // End:0x8F5
    if(int(page_Main.rMM.kInterfaceGuideStep) == 2)
    {
        page_Main.rMM.kInterfaceGuideStep = 3;
        ButtonStart.SetFlicker(false);
    }
    return true;
    //return;    
}

function bool ButtonReady_OnClick(GUIComponent Sender)
{
    local byte ustate;

    // End:0x1B
    if((int(MM.GMLevelFlag) & 1) == 1)
    {
        return true;
    }
    Log("[BTPageRoomLobby::ButtonReady_OnClick]");
    // End:0x9D
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
    else
    {
        ustate = 0;
        Log("[BTPageRoomLobby::ButtonReady_OnClick]" @ "NatType OK, Waiting state Request");
    }
    page_Main.TcpChannel.sfReqChangeUserState(ustate, 1);
    // End:0x1C1
    if(int(page_Main.rMM.kInterfaceGuideStep) == 2)
    {
        page_Main.rMM.kInterfaceGuideStep = 3;
        ButtonStart.SetFlicker(false);
    }
    return true;
    //return;    
}

function bool ButtonTeam_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;
    local int GMNum;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    // End:0xA5
    if(MatchMaker.PlayWithBots == true)
    {
        // End:0xA2
        if((MatchMaker.BotUserTeam != 2) && MatchMaker.BotUserTeam != btn.ButtonID)
        {
            // End:0x8A
            if(MatchMaker.BotUserTeam == 0)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 220);                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 221);
            }
            return true;
        }        
    }
    else
    {
        // End:0x102
        if(MatchMaker.kClanMatch_InChannel == true)
        {
            // End:0x102
            if((TPTeamList[0].GetUserCount() != 0) && TPTeamList[1].GetUserCount() != 0)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 225);
                return true;
            }
        }
    }
    // End:0x191
    if(MatchMaker.kClanMatch_InChannel == true)
    {
        // End:0x191
        if((TPTeamList[0].GetUserCount() == 0) || TPTeamList[1].GetUserCount() == 0)
        {
            // End:0x191
            if((TPTeamList[0].GetUserCount() >= 2) || TPTeamList[1].GetUserCount() >= 2)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 225);
                return true;
            }
        }
    }
    // End:0x1B3
    if(btn.ButtonID == 0)
    {
        GMNum = GMNumAF;        
    }
    else
    {
        GMNum = GMNumRSA;
    }
    // End:0x1DF
    if(bReadyToGame)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 28);
        return true;
    }
    // End:0x226
    if((TPTeamList[btn.ButtonID].ACLList.ACLRowList.Length - GMNum) >= (MM.kGame_UserCount / 2))
    {
        return false;
    }
    page_Main.TcpChannel.sfReqChangeTeam(btn.ButtonID);
    return true;
    //return;    
}

function bool CanInviteUser()
{
    return true;
    //return;    
}

function bool CheckInviteUser(optional int CurPos, optional int CurState, optional string szNickName, optional string szClanName)
{
    // End:0x37
    if((CurPos == 2) && CurState == 2)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 132, szNickName);
        return false;
    }
    return true;
    //return;    
}

function UpdateRoomOwner(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x8E [Loop If]
    if(i < UserListDB.Length)
    {
        // End:0x62
        if(UserListDB[i].DataPerColumn[6].IntValue == UID)
        {
            UserListDB[i].DataPerColumn[4].floatValue = 0.0000000;
            // [Explicit Continue]
            goto J0x84;
        }
        UserListDB[i].DataPerColumn[4].floatValue = 1.0000000;
        J0x84:

        i++;
        // [Loop Continue]
        goto J0x07;
    }
    RefreshUserList();
    //return;    
}

function bool ChangeButtonTeam(int Team)
{
    // End:0x20E
    if(Team == 0)
    {
        ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].__OnClick__Delegate = None;
        LabelTeamSelect.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(ButtonTeam[0].AWinPos.X1 - float(2), ButtonTeam[0].AWinPos.Y1 - float(2), TPTeamList[0].AWinPos.X2 + float(2), TPTeamList[0].AWinPos.Y2);
        ButtonTeam[1].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
        ButtonTeam[1].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_n;
        ButtonTeam[1].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
        ButtonTeam[1].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
        ButtonTeam[1].__OnClick__Delegate = ButtonTeam_OnClick;        
    }
    else
    {
        ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_Cli;
        ButtonTeam[0].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
        ButtonTeam[0].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_n;
        ButtonTeam[0].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
        ButtonTeam[0].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
        ButtonTeam[0].__OnClick__Delegate = ButtonTeam_OnClick;
        ButtonTeam[1].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_Cli;
        ButtonTeam[1].__OnClick__Delegate = None;
        LabelTeamSelect.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(ButtonTeam[1].AWinPos.X1 - float(2), ButtonTeam[1].AWinPos.Y1 - float(2), TPTeamList[1].AWinPos.X2 + float(2), TPTeamList[1].AWinPos.Y2);
    }
    LabelTeamSelect.ApplyAWinPos();
    return true;
    //return;    
}

function ChangeButtonStart()
{
    Log(("[BTPageRoomLobby::ChangeButtonStart]" $ " owner=") $ string(MM.bIsOwner));
    ChangeButtonTeam(MM.kTeamID);
    // End:0x116
    if(MM.bIsOwner || CurrentRoomState == 1)
    {
        ButtonStart.Caption = strButtonStart[0];
        // End:0xCC
        if(MM.bIsOwner)
        {
            TPRoomInfo.ButtonRoomInfo.Caption = TPRoomInfo.strButtonRoomInfo[0];            
        }
        else
        {
            TPRoomInfo.ButtonRoomInfo.Caption = TPRoomInfo.strButtonRoomInfo[1];
        }
        ButtonStart.__OnClick__Delegate = ButtonStart_OnClick_Before_CheckDurability;
        __CurrentButtonClickBehavior__Delegate = ButtonStart_OnClick;        
    }
    else
    {
        // End:0x139
        if(bReadyToGame)
        {
            ButtonStart.Caption = strButtonStart[2];            
        }
        else
        {
            ButtonStart.Caption = strButtonStart[1];
        }
        TPRoomInfo.ButtonRoomInfo.Caption = TPRoomInfo.strButtonRoomInfo[1];
        ButtonStart.__OnClick__Delegate = ButtonStart_OnClick_Before_CheckDurability;
        __CurrentButtonClickBehavior__Delegate = ButtonReady_OnClick;
    }
    //return;    
}

function bool HeaderButton_OnClick(GUIComponent Sender)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(Sender);
    Log("[BTPageRoomLobby::HeaderButton_OnClick] MenuID=" $ string(btn.ButtonID));
    // End:0x7E
    if(bSafeLeaveRoom)
    {
        Log("Safe Leave Room Processing");
        return true;
    }
    // End:0x9F
    if(bReadyToGame)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return true;
    }
    // End:0x13F
    if(btn.ButtonID == int(TPTopMenu.5))
    {
        // End:0x111
        if(MM.kClanMatch_InMatchRoom)
        {
            page_Main.StartAutoMove(MM.kServerID, MM.kChannelID, MM.kClanMatch_ReadyRoomID, "", 2);            
        }
        else
        {
            bSafeLeaveRoom = true;
            page_Main.TcpChannel.sfReqLeaveRoom(MM.kRoomID);
        }
    }
    return super(BTNetGUIPageHK).HeaderButton_OnClick(Sender);
    //return;    
}

function InitializeTeamList()
{
    LabelTeamTopLine = NewLabelComponent(fbLabelTeamTopLine, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.empty);
    LabelTeamTopLine.SetFontSizeAll(11);
    ButtonTeam[0] = NewButtonComponent(fbButtonTeam[0]);
    ButtonTeam[0].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_n;
    ButtonTeam[0].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
    ButtonTeam[0].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
    ButtonTeam[0].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
    ButtonTeam[0].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_AF_On;
    ButtonTeam[0].ButtonID = 0;
    ButtonTeam[1] = NewButtonComponent(fbButtonTeam[1]);
    ButtonTeam[1].buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_n;
    ButtonTeam[1].buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
    ButtonTeam[1].buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
    ButtonTeam[1].buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
    ButtonTeam[1].buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.WaitRoom_Team_RSA_On;
    ButtonTeam[1].ButtonID = 1;
    TPTeamList[0] = BTTPTeamMemberList(NewComponent(new Class'GUIWarfareControls.BTTPTeamMemberList', fbTPTeamList[0]));
    TPTeamList[0].__OnPopupCheck__Delegate = TPTeamList_OnPopupCheck;
    TPTeamList[0].__OnPopup__Delegate = TPTeamList_OnPopup;
    TPTeamList[1] = BTTPTeamMemberList(NewComponent(new Class'GUIWarfareControls.BTTPTeamMemberList', fbTPTeamList[1]));
    TPTeamList[1].__OnPopupCheck__Delegate = TPTeamList_OnPopupCheck;
    TPTeamList[1].__OnPopup__Delegate = TPTeamList_OnPopup;
    LabelTeamSelect = NewLabelComponent(AWinPos, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.butt_list_cli);
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    TPTopMenu.__HeaderButton_OnClick__Delegate = HeaderButton_OnClick;
    SkipTopMenuIndex = int(TPTopMenu.5);
    NewBackground = NewLabelComponent(fbNewBackground, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.new_Page_Thema, 0.0001300);
    BGDeco = NewLabelComponent(fbBGDeco, Class'GUIWarfareControls.BTUIResourcePoolHK'.default.RoomLoby_BG_Deco, 0.1000000);
    InitializeTeamList();
    TPMessenger = BTTPMessengerHKCN(NewComponent(new Class'GUIWarfareControls.BTTPMessengerHKCN', fbTPMessenger, 0.9000000));
    TPMessenger.__OnPopupChannel__Delegate = OnPopupChannel;
    TPMessenger.__OnPopupFriend__Delegate = OnPopupFriend;
    TPMessenger.__OnPopupClan__Delegate = OnPopupClan;
    TPMessenger.__OnPopupPCBang__Delegate = OnPopupPCBang;
    TPMessenger.__OnPopupChannelCheck__Delegate = OnPopupChannelCheck;
    TPMessenger.__OnPopupFriendCheck__Delegate = OnPopupFriendCheck;
    TPMessenger.__OnPopupClanCheck__Delegate = OnPopupClanCheck;
    TPMessenger.__OnPopupPCBangCheck__Delegate = OnPopupPCBangCheck;
    TPMessenger.HideTabButton(TPMessenger.3);
    TPMyInfo = BTTPMyInfoHKCN(NewComponent(new Class'GUIWarfareControls.BTTPMyInfoHKCN', fbTPMyInfo, 0.8000000));
    TPRoomInfo = BTTPRoomInfoHK(NewComponent(new Class'GUIWarfareControls.BTTPRoomInfoHK', fbTPRoomInfo));
    TPRoomInfo.ButtonRoomInfo.__OnClick__Delegate = ButtonRoomInfo_OnClick;
    TPChat = BTTPChatHK(NewComponent(new Class'GUIWarfareControls.BTTPChatHKCN', fbTPChat));
    page_Main.TPChat = TPChat;
    TPChat.InputBox.__OnChat__Delegate = page_Main.Internal_OnChat;
    TPChat.InputBox.__OnInputTab__Delegate = page_Main.TPChat_OnInputTab;
    TPChat.InputBox.__OnInputSpace__Delegate = page_Main.TPChat_OnInputSpace;
    TPChat.__OnChageChatMode__Delegate = page_Main.TPChat_OnChageChatMode;
    TPChat.__ChangeTab_OnClick__Delegate = page_Main.TPChat_ChangeTab_OnClick;
    TPChat.InputBox.__OnFunctionKey__Delegate = page_Main.Internal_OnFunctionKey;
    ButtonStart = NewButtonComponent(fbButtonStart, 0.7000000);
    ButtonStart.SetGameStartBtnImage();
    ButtonStart.SetDefaultBigButtonFontColor();
    ButtonStart.SetFontSizeAll(23);
    ButtonStart.Caption = strButtonStart[1];
    ButtonStart.__OnKeyEvent__Delegate = ButtonStart_OnKeyEvent;
    // End:0x39B
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        ButtonTemp = NewButtonComponent(fbButtonTemp);
        ButtonTemp.SetDefaultBigButtonImage();
        ButtonTemp.__OnClick__Delegate = ButtonTemp_OnClick;
    }
    Log("[BTPageRoomLobby::InitComponent]");
    MatchMaker = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    GameModes = Class'Engine.wGameSettings'.static.GetAllGameModes();
    MyController.ResetFocus();
    LabelRoomName.ClipArea.X1 = 0.0000000;
    LabelRoomName.ClipArea.Y1 = 288.0000000;
    LabelRoomName.ClipArea.X2 = 280.0000000;
    LabelRoomName.ClipArea.Y2 = 336.0000000;
    i = 0;
    J0x47E:

    // End:0x4C4 [Loop If]
    if(i < TPMessenger.ButtonMsg.Length)
    {
        TPMessenger.ButtonMsg[i].__OnClick__Delegate = TPMessenger_ButtonMsg_OnClick;
        i++;
        // [Loop Continue]
        goto J0x47E;
    }
    TPMessenger.ACLMsg[0].__OnHitBottom__Delegate = TPMessenger_ACLMsg0_OnHitBottom;
    LabelPopupTutorial = BTLabelTutorialQuestInfoHK(NewComponent(new Class'GUIWarfareControls.BTLabelTutorialQuestInfoHK', Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(10.0000000, 508.0000000, 1014.0000000, 735.0000000), 0.9999000));
    LabelPopupTutorial.bAcceptsInput = true;
    page_Main.rMM.__OnRecivedPing__Delegate = OnReceivedPing;
    MyInfoBtn = NewButtonComponent(Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(973.0000000, 503.0000000, 1023.0000000, 555.0000000), 0.9000000);
    MyInfoBtn.buttonImage[0] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_n;
    MyInfoBtn.buttonImage[1] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_on;
    MyInfoBtn.buttonImage[2] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_n;
    MyInfoBtn.buttonImage[3] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_cli;
    MyInfoBtn.buttonImage[4] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_block;
    MyInfoBtn.buttonImage[5] = Class'GUIWarfareControls.BTUIResourcePoolHK'.default.Lobby_MyInfo_Btn_on;
    MyInfoBtn.Caption = "";
    MyInfoBtn.__OnClick__Delegate = MyInfo_OnClick;
    rfFriendPosTime = new Class'GUIWarfare_Decompressed.BTRefreshTime';
    rfFriendPosTime.SetMaxTime(1.5000000);
    //return;    
}

function bool MyInfo_OnClick(GUIComponent Sender)
{
    // End:0x1C4
    if(MM.kUserName == TPMyInfo.myName)
    {
        Controller.OpenMenu("GUIWarfareControls.BTWindowUserPersonalInfo");
        BTWindowUserPersonalInfo(Controller.TopPage()).setTcpChannel(page_Main.TcpChannel);
        BTWindowUserPersonalInfo(Controller.TopPage()).SetCharInfo(page_Main.MyCharInfo);
        BTWindowUserPersonalInfo(Controller.TopPage()).SetClanInfo(page_Main.MyClanInfo);
        BTWindowUserPersonalInfo(Controller.TopPage()).UpdateCharInfo();
        BTWindowUserPersonalInfo(Controller.TopPage()).UpdateRequestServer();
        // End:0x177
        if((MM.kClanName == "none") || MM.kClanName == "")
        {
            BTWindowUserPersonalInfo(Controller.TopPage()).ButtonOK.DisableMe();            
        }
        else
        {
            BTWindowUserPersonalInfo(Controller.TopPage()).ButtonOK.EnableMe();
            BTWindowUserPersonalInfo(Controller.TopPage()).__OnOK__Delegate = BTWindowUserPersonalInfo_OnClanInfo;
        }        
    }
    else
    {
        page_Main.TcpChannel.sfReqDBCharInfo(TPMyInfo.myName);
    }
    return true;
    //return;    
}

function TPMessenger_ACLMsg0_OnHitBottom(int Top, int Count, int itemperpage)
{
    TPMessenger.ACLMsg[0].MultiColumnList.MyScrollBar.MyGripButton.MenuState = 0;
    // End:0xA5
    if((TPMessenger_ACLMsg0_OnHitBottom_LastTime + 0.1000000) < PlayerOwner().Level.TimeSeconds)
    {
        page_Main.TcpChannel.sfReqChannelUserListInGameRoom(MM.kChannelID, Top, 30);
        TPMessenger_ACLMsg0_OnHitBottom_LastTime = PlayerOwner().Level.TimeSeconds;
    }
    //return;    
}

function bool TPMessenger_ButtonMsg_OnClick(GUIComponent Sender)
{
    local int StartTop, Count;
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
            page_Main.TcpChannel.sfReqChannelUserListInGameRoom(MM.kChannelID, StartTop, Count);
            // End:0x1F7
            break;
        // End:0x1A9
        case 1:
            page_Main.TcpChannel.sfReqFriendList();
            // End:0x1F7
            break;
        // End:0x1EC
        case 2:
            // End:0x1E9
            if(MM.kClanName != "")
            {
                page_Main.TcpChannel.sfReqClanUserList(MM.kClanName);
            }
            // End:0x1F7
            break;
        // End:0x1F4
        case 3:
            // End:0x1F7
            break;
        // End:0xFFFF
        default:
            break;
    }
    TPMessenger.TabControl.SetVisiblePanel(btn.ButtonID);
    return true;
    //return;    
}

function bool InternalOnPreDraw(Canvas C)
{
    local export editinline BTWindowHK BTWindow;
    local float CurrentTime;
    local int StartTop, Count;

    Internal_OnPreDraw(C);
    // End:0x63
    if((TimeAutoStart != float(-1)) && Controller.ViewportOwner.Actor.Level.TimeSeconds > TimeAutoStart)
    {
        TimeAutoStart = -1.0000000;
        ButtonStart_OnClick(none);
    }
    // End:0x6E
    if(bSafeLeaveRoom)
    {
        return false;
    }
    // End:0x91
    if(page_Main.page_curr != page_Main.page_RoomLobby)
    {
        return false;
    }
    // End:0xA8
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
    // End:0x2F5
    if((CurrentTime - LastRefreshTime[0]) > RefreshCycleTime[0])
    {
        // End:0x2E8
        if(TPMessenger.TabControl.CurrentTabIndex == 0)
        {
            Count = 6 * 3;
            StartTop = TPMessenger.ACLMsg[0].MultiColumnList.Top - 6;
            // End:0x1DB
            if(StartTop < 0)
            {
                Count += StartTop;
                StartTop = 0;
            }
            // End:0x247
            if((TPMessenger.ACLMsg[0].MultiColumnList.Top + (6 * 2)) > TotalChannelUserCount)
            {
                Count += (TotalChannelUserCount - (TPMessenger.ACLMsg[0].MultiColumnList.Top + (6 * 2)));
            }
            // End:0x2A4
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
            {
                TPChat.AddChatHistory(2, "RefreshTime", Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
            }
            // End:0x2B8
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
    //return;    
}

function SendPingAndSendHostPoint()
{
    // End:0x0D
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
    if((PlayerOwner() != none) && PlayerOwner().PlayerReplicationInfo != none)
    {
        MM.iAvgPing = PlayerOwner().PlayerReplicationInfo.Ping;
    }
    MM.CalculateHostPoint(false);
    Log((((("[BTPageRoomLobby::SendPingAndSendHostPoint] SendReqGetUserOwnerScore/iAvgPing" $ string(MM.iAvgPing)) $ "/HWPoint:") $ string(MM.iHardwarePoint)) $ "/HostPoint:") $ string(MM.GetHostPoint()));
    // End:0x153
    if(page_Main.TcpChannel != none)
    {
        page_Main.TcpChannel.sfReqUpdateMyHostPriorityPoint(MM.GetHostPoint());
    }
    //return;    
}

function MessageHostUnsuitableness()
{
    local int iPoint;

    // End:0x0D
    if(MatchMaker == none)
    {
        return;
    }
    iPoint = MM.GetHostPoint();
    // End:0x69
    if(MM.bIsOwner && iPoint >= MinWaringHostPoint)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 78, MM.kUserName);
    }
    MM.bShowMessageHostUnsuitableness = false;
    //return;    
}

function bool ButtonStart_OnKeyEvent(out byte key, out byte Action, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x41
    if(int(iKey) == int(13))
    {
        TPChat.InputBox.SetFocus(none);
        return true;
    }
    return false;
    //return;    
}

function StartNetworkChecking(int ClientsCount, optional bool bConnectGame)
{
    Log("[BTPageRoomLobby::StartNetworkChecking()]");
    // End:0x56
    if(MM.StartNetworkChecking(ClientsCount, bConnectGame) == true)
    {
        OpenNetworkCheckingWindow();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowInfoHK'.static.ShowWindow(Controller, "", GetErrMsg(GetLastErrCode()));
        MM.SendErrorReportC(GetLastErrCode(), 5, GetErrMsg(GetLastErrCode()));
        page_Main.TcpChannel.sfReqFailedStartGame(1);
    }
    //return;    
}

function FailedNetworkChecking(string ErrMsg, optional int Code)
{
    Log("[BTPageRoomLobby::FailedNetworkChecking()]");
    // End:0x8E
    if(MM.FailedNetworkChecking() == true)
    {
        CloseNetworkCheckingWindow();
        Controller.PopPage();
        Class'GUIWarfareControls.BTWindowInfoHK'.static.ShowWindow(Controller, "", ErrMsg);
        MM.SendErrorReportC(Code, 5, ErrMsg);
    }
    //return;    
}

function OpenNetworkCheckingWindow()
{
    // End:0x71
    if(Controller.GetLastMenu().IsA('BTWindowStateHK') == false)
    {
        Controller.PopPage();
        // End:0x5B
        if(MM.kGame_TeamBalance)
        {
            Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 3);            
        }
        else
        {
            Class'GUIWarfareControls.BTWindowDefineStateHK'.static.ShowState(Controller, 2);
        }
    }
    //return;    
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
    else
    {
        // End:0x96
        if(LastMenu.IsA('BTWindowInfoHK') == true)
        {
            bNoInitialRoomInfo = bNotInitial;
            Controller.TopPage().FadeOut(false, true);
        }
    }
    //return;    
}

function InternalOnReOpen()
{
    __NFUN_270__("BTPageRoomLobby::InternalOnReOpen()");
    Log("[BTPageRoomLobby::InternalOnReOpen] Start");
    super.InternalOnReOpen();
    switch(TPMessenger.TabControl.CurrentTabIndex)
    {
        // End:0x87
        case int(TPMessenger.0):
            // End:0xE4
            break;
        // End:0xA5
        case int(TPMessenger.1):
            UpdateFriendList(MatchMaker);
            // End:0xE4
            break;
        // End:0xC3
        case int(TPMessenger.2):
            UpdateClanList(MatchMaker);
            // End:0xE4
            break;
        // End:0xE1
        case int(TPMessenger.3):
            UpdatePCBangList(MatchMaker);
            // End:0xE4
            break;
        // End:0xFFFF
        default:
            break;
    }
    Log("[BTPageRoomLobby::InternalOnReOpen] End");
    //return;    
}

function InternalOnOpen()
{
    super.InternalOnOpen();
    __NFUN_270__("BTPageRoomLobby::InternalOnOpen()");
    Log("[BTPageRoomLobby::InternalOnOpen] Start [IME] BTTcpHandler.bTutorial=" $ string(int(BTTcpHandler(page_Main.TcpChannel).bTutorial)));
    // End:0xC4
    if(page_Main.rMM.kLevel <= 0)
    {
        LabelPopupTutorial.StartShow();
    }
    Controller.ViewportOwner.Actor.ConsoleCommand("toggleime 1");
    Controller.ViewportOwner.Actor.ConsoleCommand("SETIMECONVERSION 1");
    // End:0x159
    if(MM.bIsOwner)
    {
        ReceivedPingID.Length = 0;
        ReceivedPingValue.Length = 0;
        SetTimer(5.0000000, true, 'UserPingRefresh');
    }
    bShowHostWarning = false;
    bVisible = !page_Main.InTutorial;
    page_Main.CreateBotMode = false;
    MM.BotTutorial = false;
    // End:0x2B1
    if(BTTcpHandler(page_Main.TcpChannel).bTutorial == false)
    {
        // End:0x207
        if(int(page_Main.rMM.kInterfaceGuideStep) == 1)
        {
            page_Main.rMM.kInterfaceGuideStep = 2;
            ButtonStart.SetFlicker(true);
        }
        // End:0x243
        if(int(page_Main.rMM.kInterfaceGuideStep) == 4)
        {
            TPTopMenu.Quest.SetFlicker(true);            
        }
        else
        {
            TPTopMenu.Quest.SetFlicker(false);
        }
        // End:0x298
        if(int(page_Main.rMM.kInterfaceGuideStep) == 3)
        {
            TPTopMenu.Inventory.SetFlicker(true);            
        }
        else
        {
            TPTopMenu.Inventory.SetFlicker(false);
        }
    }
    //return;    
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
    // End:0x80
    if(page_Main.rMM.kLevel <= 0)
    {
        LabelPopupTutorial.StartShow();
    }
    page_Main.KeepMoving();
    Log("[BTPageRoomLobby::OnBackToLastPage] End");
    //return;    
}

function OnCompleteOpened()
{
    Log("[BTPageRoomLobby::OnCompleteOpened] Start");
    Controller.PushPage();
    RefreshPage();
    // End:0x6E
    if(page_Main.rMM.kLevel <= 0)
    {
        LabelPopupTutorial.StartShow();
    }
    page_Main.KeepMoving();
    Log("[BTPageRoomLobby::OnCompleteOpened] End");
    BTTcpHandler(page_Main.TcpChannel).OnPageRoomLobbyInited();
    // End:0x10C
    if(MM.bAutoStart)
    {
        TimeAutoStart = Controller.ViewportOwner.Actor.Level.TimeSeconds + float(4);
    }
    //return;    
}

function UpdateCharInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateCharInfo]");
    TPMyInfo.SetMyInfoA(MM.kUserName, MM.kLevel, MM.kExp, MM.kStartExp, MM.kEndExp, MM.kLevelMarkID);
    //return;    
}

function UpdateClanInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateClanInfo]");
    TPMyInfo.SetClanInfo(MM.kClanName, MM.kClanPattern, MM.kClanBG, MM.kClanBL, MM.kClanLevel);
    TPMessenger.ReplaceMyClanName(byte(TPMessenger.TabControl.CurrentTabIndex), MM.kUserName, MM.kClanName);
    //return;    
}

function UpdateMoneyInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateMoneyInfo]");
    TPMyInfo.SetMoneyInfo(MM.kPoint, MM.kCash);
    //return;    
}

function UpdateRankingInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateRankingInfo]");
    TPMyInfo.SetRankingInfo(MM.kRanking, MM.kWin, MM.kLose);
    //return;    
}

function UpdateEquipItemInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateEquipItemInfo]");
    //return;    
}

function UpdatePCBangInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdatePCBangInfo]");
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

function UpdateRecv_CharInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateRecv_CharInfo]");
    // End:0x3C
    if(MM.bShowMessageHostUnsuitableness)
    {
    }
    SetCharacterInfo(page_Main.MyClanName, page_Main.MyCharInfo);
    page_Main.CheckItemWarning();
    //return;    
}

function UpdateGameRoomInfo(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateGameRoomInfo]");
    // End:0x7E
    if((bPrevTeamBalance == false) && MM.kGame_TeamBalance)
    {
        page_Main.AddChatLog(strTeamBalance[0], 5, true);
        page_Main.AddChatLog(strTeamBalance[1], 5, true);        
    }
    else
    {
        // End:0xB8
        if(bPrevTeamBalance && MM.kGame_TeamBalance == false)
        {
            page_Main.AddChatLog(strTeamBalance[2], 5, true);
        }
    }
    // End:0x10E
    if((MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner()) && PrevGameMode != MM.kGame_GameMode)
    {
        page_Main.AddChatLog(strNoviceMode, 5, true);        
    }
    else
    {
        // End:0x176
        if((Class'Engine.wGameSettings'.static.IsBotModeIndex(MM.kGame_GameMode) && PrevGameMode != MM.kGame_GameMode) && MM.kLevel > 3)
        {
            page_Main.AddChatLog(strBotMode, 5, true);
        }
    }
    //return;    
}

function UpdateFriendList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageRoomLobby::UpdateFriendList]");
    TPMessenger.SavePos(TPMessenger.1);
    TPMessenger.RemoveAll(TPMessenger.1);
    i = 0;
    J0x62:

    // End:0x28C [Loop If]
    if(i < MM.kFriendList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kFriendList[i].ClanName, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, true, MM.kFriendList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kFriendList[i].ClanName, MM.kFriendList[i].ClanLevel);
        TPMessenger.AddFriendUser(MM.kFriendList[i].UserName, MM.kFriendList[i].IsLogOn, MM.kFriendList[i].ClanPattern, MM.kFriendList[i].ClanBG, MM.kFriendList[i].ClanBL, MM.kFriendList[i].ClanName, MM.kFriendList[i].Level, MM.kFriendList[i].ClanGrade, byte(MM.kFriendList[i].IsLookForClan), MM.kFriendList[i].ClanLevel, MM.kFriendList[i].LevelMarkID);
        i++;
        // [Loop Continue]
        goto J0x62;
    }
    TPMessenger.LoadPos(TPMessenger.1);
    UpdateFriendlyUser(int(TPMessenger.1));
    //return;    
}

function UpdateClanList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageRoomLobby::UpdateClanList]");
    TPMessenger.SavePos(TPMessenger.2);
    TPMessenger.RemoveAll(TPMessenger.2);
    i = 0;
    J0x60:

    // End:0x18B [Loop If]
    if(i < MM.kClanList.Length)
    {
        // End:0xA8
        if(MM.kClanList[i].UserName == MM.My_szName)
        {
            // [Explicit Continue]
            goto J0x181;
        }
        TPMessenger.AddClanUser(MM.kClanList[i].UserName, MM.kClanList[i].IsLogOn, MM.kClanList[i].Level, int(MM.kClanList[i].ClanGrade), MM.kClanList[i].ClanWin, MM.kClanList[i].ClanLose, MM.kClanList[i].LevelMarkID, MM.kClanList[i].TitleMarkID);
        J0x181:

        i++;
        // [Loop Continue]
        goto J0x60;
    }
    TPMessenger.LoadPos(TPMessenger.2);
    UpdateFriendlyUser(int(TPMessenger.2));
    //return;    
}

function UpdatePCBangList(wMatchMaker MM)
{
    local int i;

    Log("[BTPageRoomLobby::UpdatePCBangList]");
    TPMessenger.SavePos(TPMessenger.3);
    TPMessenger.RemoveAll(TPMessenger.3);
    i = 0;
    J0x62:

    // End:0x3BA [Loop If]
    if(i < MM.kPCBangList.Length)
    {
        GameMgr.cmm.AddClanMark(MM.kPCBangList[i].ClanName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, true, MM.kPCBangList[i].IsLookForClan > 0);
        GameMgr.cmm.SetClanLevel(MM.kPCBangList[i].ClanName, MM.kPCBangList[i].ClanLevel);
        TPMessenger.AddPCBangUser(MM.kPCBangList[i].UserName, MM.kPCBangList[i].ClanPattern, MM.kPCBangList[i].ClanBG, MM.kPCBangList[i].ClanBL, MM.kPCBangList[i].ClanName, MM.kPCBangList[i].Level, MM.kPCBangList[i].ServerShortName, MM.kPCBangList[i].ServerIP, MM.kPCBangList[i].serverPort, int(MM.kPCBangList[i].CurPos), MM.kPCBangList[i].ChannelNum, MM.kPCBangList[i].ChannelNickName, MM.kPCBangList[i].GameRoomNum, MM.kPCBangList[i].ClanGrade, MM.kPCBangList[i].ClanWin, MM.kPCBangList[i].ClanLose, byte(MM.kPCBangList[i].IsLookForClan), MM.kPCBangList[i].ClanLevel, MM.kPCBangList[i].LevelMarkID, MM.kPCBangList[i].TitleMarkID, MM.kPCBangList[i].Reserved1, MM.kPCBangList[i].Reserved2, MM.kPCBangList[i].Reserved3);
        i++;
        // [Loop Continue]
        goto J0x62;
    }
    TPMessenger.LoadPos(TPMessenger.3);
    UpdateFriendlyUser(int(TPMessenger.3));
    //return;    
}

function UpdateFriendlyUser(int UserListIdx)
{
    local int i, j;

    i = 0;
    J0x07:

    // End:0x84 [Loop If]
    if(i < 2)
    {
        j = 0;
        J0x1A:

        // End:0x7A [Loop If]
        if(j < TPTeamList[i].ACLList.ACLRowList.Length)
        {
            SetFriendlyUser(TPTeamList[i].ACLList.ACLRowList[j], UserListIdx);
            ++j;
            // [Loop Continue]
            goto J0x1A;
        }
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    TPMessenger.UpdateFriendlyUser(UserListIdx);
    //return;    
}

function SetFriendlyUser(BTAutoColumnListDataHK ACLData, optional int UserListIdx)
{
    Log(((("[BTPageRoomLobby::SetFriendlyUser] (" $ ACLData.DataPerColumn[2].strValue) $ ", ") $ ACLData.DataPerColumn[3].strValue) $ ")");
    // End:0x178
    if(TPMessenger.IsFriendlyUser(ACLData.DataPerColumn[2].strValue, ACLData.DataPerColumn[3].strValue, UserListIdx))
    {
        Log("[BTPageRoomLobby::SetFriendlyUser] Success");
        ACLData.DataPerColumn[2].floatValue = 1.0000000;
        ACLData.DataPerColumn[2].Text[0].DrawColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.FriendlyUserNameN();
        ACLData.DataPerColumn[2].Text[1].DrawColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.FriendlyUserNameOn();
        ACLData.DataPerColumn[2].Text[2].DrawColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.FriendlyUserNameN();
    }
    //return;    
}

function UpdateBlockList(wMatchMaker MM)
{
    Log("[BTPageRoomLobby::UpdateBlockList]");
    //return;    
}

function UpdateItemList(wGameManager GameMgr)
{
    Log("[BTPageRoomLobby::UpdateItemList]");
    //return;    
}

function UpdateWebzenItemList(wGameManager GameMgr)
{
    Log("[BTPageRoomLobby::UpdateWebzenItemList]");
    //return;    
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
    else
    {
        page_Main.bWarningDurabilityAndExpired = false;
    }
    //return;    
}

function UpdateDurabilityWarningItemList(BTNetMainMenu MainMenu)
{
    Log("[BTPageRoomLobby::UpdateDurabilityWarningItemList]");
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
    //return;    
}

function RefreshPage()
{
    MM = Controller.ViewportOwner.Actor.Level.GetMatchMaker();
    // End:0x5D
    if(MM == none)
    {
        Log("MM is none");
        MM = page_Main.rMM;
    }
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0xBE
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
    // End:0x30F
    if((float(MM.kTeamID) % float(2)) == float(0))
    {
        currentBGM = "bgm_af_theme";        
    }
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
    // End:0x46D
    if(Controller.ViewportOwner.Actor.Level == none)
    {
        PlayerOwner().dblog("Level is none!!!!!!!!!!!!!!!!!!!!");
    }
    // End:0x4B1
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        MM.__QuestLog__Delegate = QuestLog;
    }
    page_Main.rMM.__OnRecivedPing__Delegate = OnReceivedPing;
    //return;    
}

function QuestLog(string Msg)
{
    // End:0x75
    if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
    {
        Log("[BTPageRoomLobby::QuestLog]");
        page_Main.AddChatLog("QuestLog = " $ Msg, 5, true);
    }
    //return;    
}

function SetCharacterInfo(string ClanName, CharInfo btCharInfo)
{
    local wMyPlayerStatus MyStatus;

    Log("[BTPageRoomLobby::SetCharacterInfo]");
    MyStatus = Controller.ViewportOwner.Actor.Level.CharMgr.MyPlayer;
    // End:0x28B
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
        MyStatus.DispFaceItem = btCharInfo.DispFaceItem;
        MyStatus.DispBackpack = btCharInfo.DispBackpack;
        MyStatus.DispPouch = btCharInfo.DispPouch;
        MyStatus.DispCamouflage = btCharInfo.DispCamouflage;
    }
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    __NFUN_270__("BTPageRoomLobby::InternalOnClose()");
    Log("[BTPageRoomLobby::InternalOnClose] ");
    OnClose(bCanceled);
    //return;    
}

function bool internalKeyEvent(out byte key, out byte Action, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iAction;

    iKey = key;
    iAction = Action;
    // End:0x5B
    if((int(iKey) == int(18)) && int(iAction) == int(5))
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(196), 5, true);
    }
    // End:0x86
    if(int(iKey) == int(13))
    {
        TPChat.InputBox.FocusFirst(none);
        return true;
    }
    return false;
    //return;    
}

function BTTcpLink_Channel GetTcpChannel()
{
    local BTPageRoomLobby_TCP TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageRoomLobby_TCP';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function BTTcpLink_Login GetTcpLogin()
{
    local BTPageRoomLobby_TcpLogin TCP;

    TCP = new Class'GUIWarfare_Decompressed.BTPageRoomLobby_TcpLogin';
    TCP.Owner = self;
    return TCP;
    //return;    
}

function BTConsole GetConsole()
{
    return BTConsole(Controller.ViewportOwner.Console);
    //return;    
}

function InitialRoomInfo()
{
    Log("[BTPageRoomLobby::InitialRoomInfo]");
    MM.ResetGameFlag();
    GetConsole().SetTermBetweenBGM(2.0000000);
    GetConsole().BGMFadeInTime = Class'GUIWarfare_Decompressed.BTConsole'.default.BGMFadeInTime;
    GetConsole().BGMFadeOutTime = Class'GUIWarfare_Decompressed.BTConsole'.default.BGMFadeOutTime;
    page_Main.TcpChannel.sfReqRoomUserList(MM.kRoomID);
    page_Main.TcpChannel.sfReqGameRoomInfo(MM.kRoomID, MM.kUID);
    page_Main.TcpChannel.sfReqCharInfo();
    GetConsole().ClearMessageItems();
    GetConsole().SetChatEnabled(false);
    TPMessenger.RemoveAll(TPMessenger.0);
    page_Main.TcpChannel.sfReqChannelUserListInGameRoom(MM.kChannelID, 0, 30);
    page_Main.TcpChannel.sfReqFriendList();
    page_Main.TcpChannel.sfReqBlockUserList();
    //return;    
}

function string FindFriendlyGameMode(string GameMode)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4C [Loop If]
    if(i < GameModes.Length)
    {
        // End:0x42
        if(GameModes[i].ClassName == GameMode)
        {
            return GameModes[i].UserFriendlyName;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function string FindFriendlyGameModeByIndex(int GameModeIndex)
{
    return Class'Engine.wGameSettings'.static.GetGameModeByIndex(GameModeIndex).UserFriendlyName;
    //return;    
}

function UpdateRoomInfoByMatchMaker()
{
    local string UserCountString, strGameTime;

    Log("[BTPageRoomLobby::UpdateRoomInfoByMatchMaker]");
    // End:0x99
    if(MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_Defence())
    {
        UserCountString = string(MM.kGame_UserCount);
        strGameTime = "-";
        // End:0x96
        if(!self.IsA('BTPageRoomLobby_Defence'))
        {
            page_Main.SetPage(10, true);
        }        
    }
    else
    {
        UserCountString = (string(MM.kGame_UserCount / 2) @ "vs") @ string(MM.kGame_UserCount / 2);
        strGameTime = string(MM.kGame_GameTime) $ ":00";
        // End:0x10E
        if(self.IsA('BTPageRoomLobby_Defence'))
        {
            page_Main.SetPage(10, true);
        }
    }
    LabelTeamTopLine.Caption = (((((((MM.kServerGroupName $ " / ") $ MM.kServerName) $ " / ") $ MM.kChannelName) $ " / [") $ string(MM.kRoomID)) $ "] ") $ MM.kGame_RoomName;
    self.TPRoomInfo.SetData(MM.MapSettings.GetMapInfo(MM.kGame_MapName).FriendlyName, MM.kGame_MapName, FindFriendlyGameModeByIndex(MM.kGame_GameMode), MM.kGame_TeamBalance, strGameTime, string(MM.kGame_GameRound), UserCountString, MM.kGame_GameMode, MM.BotDifficulty, MM.kGame_WeaponLimit, MM.BotUserTeam);
    //return;    
}

function bool IsUserCountFull()
{
    // End:0x67
    if(MM.UserInfos.Length == MM.kGame_UserCount)
    {
        PlayerOwner().dblog("(MM.UserInfos.Length == MM.kGame_UserCount) == true");        
    }
    else
    {
        PlayerOwner().dblog("(MM.UserInfos.Length == MM.kGame_UserCount) == false");
    }
    return MM.UserInfos.Length == MM.kGame_UserCount;
    //return;    
}

function int GetUserCount()
{
    return MM.UserInfos.Length;
    //return;    
}

function int GetReadyAllUserCount()
{
    return TPTeamList[0].ACLList.GetReadyUserCount() + TPTeamList[1].ACLList.GetReadyUserCount();
    //return;    
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
    else
    {
        PlayerOwner().dblog("bAllReady == false");
    }
    return bAllReady;
    //return;    
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
    local byte byModeItem;

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
    Settings = Class'GUIWarfareControls.BTTPOptionGraphicAdvanceHK'.static.GetAdvanceSettings(PC);
    Class'GUIWarfareControls.BTTPOptionGraphicAdvanceHK'.static.SetAdvanceSettings(PC, Settings, Settings, false, true);
    GetConsole().FontReset();
    page_Main.CompleteDurabilityWarningItem();
    MM.bRecvProtocolUpdateQuest = false;
    MM.GenerateMissionList(GameMgr);
    // End:0x15A
    if((MM.UserInfos.Length <= 5) && !MM.BotTutorial)
    {
        MM.bNoUpdateQuestInfo = true;        
    }
    else
    {
        MM.bNoUpdateQuestInfo = false;
    }
    MyStatus.ItemList.Length = GameMgr.InstanceItemLists.Length;
    i = 0;
    J0x191:

    // End:0x3B4 [Loop If]
    if(i < GameMgr.InstanceItemLists.Length)
    {
        instanceInfo = GameMgr.InstanceItemLists[i];
        // End:0x3AA
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
        i++;
        // [Loop Continue]
        goto J0x191;
    }
    MyStatus.SkillList.Length = GameMgr.SkillBoxList.Length;
    i = 0;
    J0x3DA:

    // End:0x53C [Loop If]
    if(i < GameMgr.SkillBoxList.Length)
    {
        MyStatus.SkillList[i].iSkillID = GameMgr.SkillBoxList[i].SkillID;
        MyStatus.SkillList[i].iUniqueSkillID = GameMgr.SkillBoxList[i].UniqueSkillID;
        MyStatus.SkillList[i].iUntilTime = GameMgr.SkillBoxList[i].UntilTime;
        // End:0x4FB
        if(!GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, GameMgr.SkillBoxList[i].SkillID, byModeItem))
        {
            MyStatus.SkillList[i].bySlotPosition = 13;
            // [Explicit Continue]
            goto J0x532;
        }
        MyStatus.SkillList[i].bySlotPosition = GameMgr.SkillBoxList[i].SlotPos;
        J0x532:

        i++;
        // [Loop Continue]
        goto J0x3DA;
    }
    MyStatus.QuickSlotList.Length = GameMgr.QuickSlotBoxList.Length;
    i = 0;
    J0x562:

    // End:0x84C [Loop If]
    if(i < GameMgr.QuickSlotBoxList.Length)
    {
        MyStatus.QuickSlotList[i].iUniqueSlotID = GameMgr.QuickSlotBoxList[i].QuickSlotID;
        MyStatus.QuickSlotList[i].strName = GameMgr.QuickSlotBoxList[i].QuickSlotName;
        j = 0;
        J0x5F0:

        // End:0x842 [Loop If]
        if(j < 4)
        {
            // End:0x66E
            if(!GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, GameMgr.QuickSlotBoxList[i].SkillID[j], byModeItem))
            {
                MyStatus.QuickSlotList[i].iSkillID[j] = -1;                
            }
            else
            {
                MyStatus.QuickSlotList[i].iSkillID[j] = GameMgr.QuickSlotBoxList[i].SkillID[j];
                // End:0x74E
                if(GameMgr.QuickSlotBoxList[i].SkillID[j] == 0)
                {
                    instanceInfo = GameMgr.FindInstanceItem(GameMgr.QuickSlotBoxList[i].UniqueID[j]);
                    // End:0x74B
                    if(instanceInfo != none)
                    {
                        MyStatus.QuickSlotList[i].iPartsID[j] = instanceInfo.PartID;
                    }                    
                }
                else
                {
                    MyStatus.QuickSlotList[i].iPartsID[j] = 0;
                }
            }
            MyStatus.QuickSlotList[i].iItemID[j] = GameMgr.QuickSlotBoxList[i].ItemID[j];
            MyStatus.QuickSlotList[i].iUniqueItemUID[j] = GameMgr.QuickSlotBoxList[i].UniqueID[j];
            MyStatus.QuickSlotList[i].iUniqueSkillID[j] = GameMgr.QuickSlotBoxList[i].UniqueSkillID[j];
            j++;
            // [Loop Continue]
            goto J0x5F0;
        }
        i++;
        // [Loop Continue]
        goto J0x562;
    }
    MM.bForceGameOut = false;
    MM.BotTutorial = MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_BotTutorial();
    MM.BeginnerMode = MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner();
    // End:0x914
    if(MM.InGamePlaying == true)
    {
        Log("BTPageRoomLobby::StartGame() MM.InGamePlaying is true. error!!");
        return;
    }
    // End:0x95F
    if(MM.bIsOwner == true)
    {
        bSuccessStartMatch = MM.StartMatch(MM.kRoomID, MM.bIsOwner);        
    }
    else
    {
        bSuccessStartMatch = MM.StartMatch(MM.kRoomID, MM.bIsOwner, IP, Port);
    }
    PlayerOwner().CloseWeb("");
    CloseNetworkCheckingWindow(true);
    MM.bPendingStarted = false;
    // End:0xA44
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
    else
    {
        Log("BTPageRoomLobby::StartGame() MM.StartMatch() return false. error!");
        MM.ClearConsole();
        Class'GUIWarfareControls.BTWindowInfoHK'.static.ShowWindow(Controller, "", GetErrMsg(GetLastErrCode()));
        MM.SendErrorReportC(GetLastErrCode(), 5, GetErrMsg(GetLastErrCode()));
    }
    //return;    
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
    else
    {
        // End:0xF8
        if(MM.InGamePlaying)
        {
            MM.InGameOver = 1;
            page_Main.SetPage(12, false);
            // End:0xF8
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
    //return;    
}

function SetMatchBGM()
{
    Log("[BTPageRoomLobby::SetMatchBGM]");
    GetConsole().SetTermBetweenBGM(9999.0000000);
    GetConsole().StopBGM();
    GetConsole().BGMFadeInTime = 0.5000000;
    GetConsole().BGMFadeOutTime = 3.0000000;
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
    local MessageItem msgItem;

    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    TPChat.AddChatHistory(2, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatClan());
    // End:0x8D
    if(MM.InGamePlaying)
    {
        msgItem = GetConsole().ConstructMessageItem(cL, 5);
        GetConsole().AddMessageItem(msgItem);
    }
    //return;    
}

function WhisperChatLog(string cL)
{
    local MessageItem msgItem;

    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    TPChat.AddChatHistory(1, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatWhisper());
    // End:0x8C
    if(MM.InGamePlaying)
    {
        msgItem = GetConsole().ConstructMessageItem(cL, 4);
        GetConsole().AddMessageItem(msgItem);
    }
    //return;    
}

function SelfChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSelf());
    //return;    
}

function SystemChatLog(string cL)
{
    local MessageItem msgItem;

    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(1, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    TPChat.AddChatHistory(2, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
    // End:0xB1
    if(MM.InGamePlaying)
    {
        msgItem = GetConsole().ConstructMessageItem(cL, 6);
        GetConsole().AddMessageItem(msgItem);
    }
    //return;    
}

function BroadCastItemChatLog(string cL)
{
    local MessageItem msgItem;

    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatBroadCastItem());
    // End:0x68
    if(MM.InGamePlaying)
    {
        msgItem = GetConsole().ConstructMessageItem(cL, 10);
        GetConsole().AddMessageItem(msgItem);
    }
    //return;    
}

function TeamChatLog(string cL)
{
    TPChat.AddChatHistory(0, cL, Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatTeam());
    //return;    
}

function bool rfAckGameHostInfo(int GameNumber, string UserID, string IP, int Port, int Result, string ErrMsg)
{
    Log((("[BTPageRoomLobby::rfAckGameHostInfo] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    return true;
    //return;    
}

function bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying)
{
    Log("[BTPageRoomLobby::rfAckIsGameRoomPlaying]");
    CurrentRoomState = int(IsPlaying);
    // End:0x4D
    if(CurrentRoomState == 0)
    {
        bReadyToGame = false;
    }
    ChangeButtonStart();
    return true;
    //return;    
}

function bool rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log("[rfAckGameRoomInfo] GameType=" $ RoomInfo.GameClass);
    // End:0x574
    if(Result == 0)
    {
        // End:0x571
        if(MM.kRoomID == RoomInfo.RoomNumber)
        {
            MM.szRoomName = RoomInfo.RoomName;
            MM.szMapName = RoomInfo.MapName;
            MM.szGameClass = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(RoomInfo.GameModeNum)).ClassName;
            MM.iMaxPlayers = int(RoomInfo.MaxUserCnt);
            MM.iTimeLimit = RoomInfo.GameMinute;
            MM.iGoalRound = RoomInfo.GameRound;
            MM.eWeaponLimit = RoomInfo.WeaponLimit;
            Log("RoomInfo.PlayWithBots=" $ string(RoomInfo.PlayWithBots));
            MM.PlayWithBots = int(RoomInfo.PlayWithBots) != 0;
            MM.BotUserTeam = int(RoomInfo.UserTeamNum);
            MM.BotDifficulty = int(RoomInfo.BotModeDifficulty);
            MM.BotNum0 = int(RoomInfo.MaxAFUserAndBotNum);
            MM.BotNum1 = int(RoomInfo.MaxRSAUserAndBotNum);
            MM.bMultiBomb = bool(RoomInfo.BombHold);
            MM.kGame_RoomName = RoomInfo.RoomName;
            // End:0x246
            if(RoomInfo.RoomOwner == MM.kUserName)
            {
                MM.bIsOwner = true;
                MM.kGame_bOwner = true;                
            }
            else
            {
                MM.bIsOwner = false;
                MM.kGame_bOwner = false;
            }
            MM.kGame_Password = RoomInfo.Password;
            MM.kGame_MapNum = int(RoomInfo.MapNum);
            MM.kGame_MapName = RoomInfo.MapName;
            MM.kGame_GameMode = int(RoomInfo.GameModeNum);
            MM.kGame_UserCount = int(RoomInfo.MaxUserCnt);
            MM.kGame_GameTime = RoomInfo.GameMinute;
            MM.kGame_GameRound = RoomInfo.GameRound;
            MM.kGame_WeaponLimit = int(RoomInfo.WeaponLimit);
            // End:0x35E
            if(int(RoomInfo.IsHardCore) != 0)
            {
                MM.kGame_bHardCore = true;                
            }
            else
            {
                MM.kGame_bHardCore = false;
            }
            bPrevTeamBalance = false;
            // End:0x39D
            if(int(RoomInfo.IsTeamValance) != 0)
            {
                MM.kGame_TeamBalance = true;                
            }
            else
            {
                MM.kGame_TeamBalance = false;
            }
            // End:0x3D4
            if(int(RoomInfo.ResponType) == 1)
            {
                MM.bSDRespawn = true;                
            }
            else
            {
                MM.bSDRespawn = false;
            }
            PrevGameMode = -1;
            // End:0x487
            if(MM.bSDRespawn && MM.szGameClass == "WGame.wTeamGame")
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(227), 5, true);
                // End:0x487
                if(MM.kNotifyGrenadeLimited == false)
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 227);
                    MM.kNotifyGrenadeLimited = true;
                }
            }
            MM.UpdateGameRoomInfo(MM);
            UpdateRoomInfoByMatchMaker();
            bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
            // End:0x506
            if((IsUserAllReady()) && IsUserCountFull())
            {
                PlayerOwner().ResetKeySleepTime();
            }
            // End:0x54F
            if(MM.szGameClass ~= MM.GetDefenceGameInfo())
            {
                // End:0x54C
                if(!self.IsA('BTPageRoomLobby_Defence'))
                {
                    page_Main.SetPage(10, true);
                }                
            }
            else
            {
                // End:0x571
                if(self.IsA('BTPageRoomLobby_Defence'))
                {
                    page_Main.SetPage(10, true);
                }
            }
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckSelectMap]");
    // End:0xAE
    if(Result == 0)
    {
        MM.szMapName = MapName;
        MM.kGame_MapName = MapName;
        MM.kGame_MapNum = MM.MapSettings.GetMapInfo(MapName).MapID;
        MM.UpdateGameRoomInfo(MM);
        UpdateRoomInfoByMatchMaker();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckChangeGameMode]");
    // End:0x96
    if(Result == 0)
    {
        MM.szGameClass = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(GameModeNum)).ClassName;
        MM.kGame_GameMode = int(GameModeNum);
        MM.UpdateGameRoomInfo(MM);
        UpdateRoomInfoByMatchMaker();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckStartGame]");
    // End:0x277
    if(Result == 0)
    {
        // End:0x9C
        if(MM.InGamePlaying == true)
        {
            Log("BTPageRoomLobby::rfAckStartGame() MM.InGamePlaying is true. error!!");
            bReadyToGame = false;
            ChangeButtonStart();
            return false;
        }
        Log((("[BTPageRoomLobby::rfAckStartGame] MM.kIsInDSChannel=" $ string(MM.kIsInDSChannel)) $ " bTutorial=") $ string(BTTcpHandler(page_Main.TcpChannel).bTutorial));
        // End:0x1B4
        if(MM.kIsInDSChannel && !BTTcpHandler(page_Main.TcpChannel).bTutorial)
        {
            // End:0x1A3
            if(MM.kGame_bOwner)
            {
                MM.kDS_SavedOwnerInfo = true;
                MM.bIsOwner = false;
                MM.kGame_bOwner = false;
                bReadyToGame = true;
                ChangeButtonStart();                
            }
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
        else
        {
            // End:0x234
            if(bReadyToGame)
            {
                StartNetworkChecking(0);                
            }
            else
            {
                Log("Start GameRoom Without Me");
                return true;
            }
        }
        MM.InGameOver = 0;
        MM.ResultIsBootyGet = false;        
    }
    else
    {
        Controller.PopPage();
        bReadyToGame = false;
        ChangeButtonStart();
        // End:0x2DF
        if(Result == 514)
        {
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 48);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;            
        }
        else
        {
            // End:0x32A
            if(Result == 627)
            {
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 49);
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckRegisterOtherUdpInfo(int UID, string IP, int Port, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    local string strInterventionErrLog;

    Log((((((((((((("[BTPageRoomLobby::rfAckRegisterOtherUdpInfo] UID=" $ string(UID)) $ " IP=") $ IP) $ " Port=") $ string(Port)) $ " NatType=") $ string(NatType)) $ " Intervention=") $ string(Intervention)) $ "HostInnerIP=") $ HostInnerIP) $ "HostInnerPort=") $ string(HostInnerPort));
    // End:0x2BB
    if(MM.bIsOwner == true)
    {
        // End:0x1FA
        if(int(Intervention) == 1)
        {
            // End:0x1FA
            if(MM.IsCompletedLoading() == false)
            {
                Log("[BTPageRoomLobby::rfAckRegisterOtherUdpInfo] Host Loading. Can't process intervention user");
                strInterventionErrLog = (((((("Host Loading. Can't process intervention user. UID=" $ string(UID)) $ " IP=") $ IP) $ " Port=") $ string(Port)) $ " Intervention=") $ string(Intervention);
                page_Main.TcpChannel.sfReqWriteServerLog(0, strInterventionErrLog);
                return true;
            }
        }
        // End:0x2B8
        if(MM.HostInitNatChecker(UID, IP, Port, NatType, Intervention) == false)
        {
            // End:0x2B8
            if(GetLastErrCode() == 5087)
            {
                Log("[BTPageRoomLobby::rfAckRegisterOtherUdpInfo] Host Loading. Can't process all loading user");
                page_Main.TcpChannel.sfReqForceFailedClientLoading(UID, GetLastErrCode());
            }
        }        
    }
    else
    {
        MM.ClientInitNatChecker(UID, IP, Port, NatType, Intervention, HostInnerIP, HostInnerPort);
    }
    return true;
    //return;    
}

function bool rfAckDisconnectGame(int Result, int DisconnectUserID, string DisconnectUserName)
{
    Log((("[BTPageRoomLobby::rfAckDisconnectGame] Result:" $ string(Result)) $ ", ErrMsg:") $ DisconnectUserName);
    // End:0x19E
    if(Result == 0)
    {
        bReadyToGame = false;
        ChangeButtonStart();
        // End:0xEF
        if(DisconnectUserID == MM.kUID)
        {
            Log((("[BTPageRoomLobby::rfAckDisconnectGame] DisconnectUserID:" $ string(DisconnectUserID)) $ " UID:") $ string(MM.kUID));
            MM.EndMatch();
        }
        // End:0x15A
        if(MM.InGamePlaying == true)
        {
            // End:0x15A
            if(MM.bIsOwner == true)
            {
                // End:0x15A
                if(MM.kUID != DisconnectUserID)
                {
                    MM.ForceDisconnectUDPConnectionHostSide(DisconnectUserID);
                    MM.SetDisconnectedUser(true, DisconnectUserID);
                }
            }
        }
        // End:0x19B
        if(page_Main.ExpiredItems.bExpiredItem || page_Main.DurWarningItems.bDurWarningItem)
        {
            page_Main.bWarningDurabilityAndExpired = true;
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    Log("[END] rfAckGameOver");
    Log(((("[BTPageRoomLobby::rfAckGameOver()] Result=" $ string(Result)) $ ", ErrMsg:[") $ ErrMsg) $ "]");
    // End:0x26D
    if(Result == 0)
    {
        // End:0xC6
        if(MatchMaker == none)
        {
            Log("[CYH] BTPageRoomLobby::rfAckGameOver() MatchMaker is none. error!!");
            return false;
        }
        // End:0x14F
        if(MM.bIsLoading == true)
        {
            Log("[CYH] BTPageRoomLobby::rfAckGameOver() MM.bIsLoading is true. ForceGameOver() call.");
            MM.ForceGameOver(PlayerOwner().PlayerReplicationInfo);
            return false;
        }
        // End:0x1D2
        if(MM.InGamePlaying == true)
        {
            // End:0x1B6
            if(Result == 0)
            {
                Log("[CYH] BTPageRoomLobby::rfAckGameOver() Normal game over process.");                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }            
        }
        else
        {
            // End:0x240
            if(MM.bPendingStarted == true)
            {
                Log("BTPageRoomLobby::rfAckGameOver() MM.bPendingStarted == true.");
                FailedNetworkChecking(GetErrMsg(5071), 5071);                
            }
            else
            {
                Log("[CYH] BTPageRoomLobby::rfAckGameOver()");
            }
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckGameOverEnd(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckGameOverEnd]");
    // End:0x3B
    if(Result == 0)
    {
        GameOver();        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    ChangeButtonStart();
    return true;
    //return;    
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
        UserInfo = new Class'Engine.wMatchUserInfo';
        NewIndex = MM.UserInfos.Length;
        MM.UserInfos[NewIndex] = UserInfo;
        MM.UserInfos[NewIndex].UID = UID;
        MM.UserInfos[NewIndex].UserName = UserID;
        MM.UserInfos[NewIndex].Grade = Grade;
        MM.UserInfos[NewIndex].IsHost = false;
        MM.UserInfos[NewIndex].UserIP = UserIP;
        MM.UserInfos[NewIndex].TeamNum = TeamNum;
        // End:0x166
        if((ClanName == "") || ClanName == "none")
        {
            RecvClanName = "";            
        }
        else
        {
            RecvClanName = ClanName;
        }
        MM.UserInfos[NewIndex].ClanName = RecvClanName;
        MM.UserInfos[NewIndex].ClanMark = Clan_Mark_Pattern;
        MM.UserInfos[NewIndex].ClanBG = Clan_Mark_BG;
        MM.UserInfos[NewIndex].ClanBL = Clan_Mark_BL;
        MM.UserInfos[NewIndex].IsLookingFor = int(IsLookFor);
        MM.UserInfos[NewIndex].ClanLevel = ClanLevel;
        MM.UserInfos[NewIndex].LevelMarkID = LevelMarkID;
        MM.UserInfos[NewIndex].TitleMarkID = TitleMarkID;
        MM.UserInfos[NewIndex].Reserved1 = Reserved1;
        MM.UserInfos[NewIndex].Reserved2 = Reserved2;
        MM.UserInfos[NewIndex].Reserved3 = Reserved3;
        // End:0x3FD
        if(UID == MM.kUID)
        {
            MM.My_iTeam = TeamNum;
            MM.kTeamID = TeamNum;
            // End:0x39E
            if(Reserved1 != 2)
            {
                SaveUserData(MakeTeamMemberData(UID, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, Grade, UserID, RecvClanName, 0, 1, 0, UserIP, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, TeamNum, Reserved2, Reserved3, true));                
            }
            else
            {
                SaveUserData(MakeTeamMemberData(UID, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, Grade, UserID, RecvClanName, 0, 1, 0, UserIP, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, TeamNum, Reserved2, Reserved3, true, true));
            }            
        }
        else
        {
            // End:0x467
            if(Reserved1 != 2)
            {
                SaveUserData(MakeTeamMemberData(UID, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, Grade, UserID, RecvClanName, 0, 1, 0, UserIP, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, TeamNum, Reserved2, Reserved3, false));                
            }
            else
            {
                SaveUserData(MakeTeamMemberData(UID, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, Grade, UserID, RecvClanName, 0, 1, 0, UserIP, IsLookFor, ClanLevel, LevelMarkID, TitleMarkID, TeamNum, Reserved2, Reserved3, false, true));
            }
            // End:0x508
            if(((MM.InGamePlaying == false) && (GetUserCount()) == 2) && MM.kGame_bOwner)
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
    else
    {
        page_Main.EndAutoMove();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    SendPingAndSendHostPoint();
    return true;
    //return;    
}

function bool rfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    local int lp1, i2;

    Log("[BTPageRoomLobby::rfAckLeaveRoom]");
    // End:0x2AF
    if(Result == 0)
    {
        // End:0xE6
        if(UserID == MM.kUserName)
        {
            MM.SetHostBlocking(false);
            Log(("page_Main.TcpChannel.sfReqEnterChannel(" $ string(MM.kChannelID)) $ ")");
            page_Main.iRoomNum = -1;
            MM.PI_LeavelRoom();
            page_Main.TcpChannel.sfReqEnterChannel(MM.kChannelID);            
        }
        else
        {
            lp1 = 0;
            J0xED:

            // End:0x14F [Loop If]
            if(lp1 < MM.UserInfos.Length)
            {
                // End:0x145
                if(MM.UserInfos[lp1].UID == UID)
                {
                    MM.UserInfos.Remove(lp1, 1);
                    // [Explicit Break]
                    goto J0x14F;
                }
                lp1++;
                // [Loop Continue]
                goto J0xED;
            }
            J0x14F:

            i2 = 0;
            J0x156:

            // End:0x1A2 [Loop If]
            if(i2 < UserListDB.Length)
            {
                // End:0x198
                if(UserListDB[i2].DataPerColumn[6].IntValue == UID)
                {
                    UserListDB.Remove(i2, 1);
                }
                i2++;
                // [Loop Continue]
                goto J0x156;
            }
            RefreshUserList();
            bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
            // End:0x2AC
            if(((int(MM.GMLevelFlag) & 3) > 0) && (MM.UserInfos.Length - GMList.Length) <= 0)
            {
                Log(("page_Main.TcpChannel.sfReqEnterChannel(" $ string(MM.kChannelID)) $ ")");
                page_Main.iRoomNum = -1;
                MM.PI_LeavelRoom();
                page_Main.TcpChannel.sfReqEnterChannel(MM.kChannelID);
            }
        }        
    }
    else
    {
        page_Main.EndAutoMove();
        bSafeLeaveRoom = false;
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    SendPingAndSendHostPoint();
    return true;
    //return;    
}

function bool rfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    local int PrevTeam;
    local wMatchUserInfo mui;
    local BTAutoColumnListDataHK Data;

    Log("[BTPageRoomLobby::rfAckChangeTeam]");
    // End:0x268
    if(Result == 0)
    {
        // End:0xCC
        if(TeamNum == 4)
        {
            Log("[BTPageRoomLobby::rfAckChangeTeam] TeamNum => 4");
            // End:0xCA
            if((MM.playingLevelInfo != none) && int(MM.playingLevelInfo.NetMode) == int(NM_ListenServer))
            {
                MM.playingLevelInfo.Game.CheckLives(none);
            }
            return true;
        }
        // End:0x194
        if(UID == MM.kUID)
        {
            MM.My_iTeam = TeamNum;
            MM.kTeamID = TeamNum;
            ChangeButtonStart();
            // End:0x147
            if((float(MM.kTeamID) % float(2)) == float(0))
            {
                currentBGM = "bgm_af_theme";                
            }
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
        // End:0x22D
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
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckConnectGame(int UserID, int Result)
{
    Log("[BTPageRoomLobby::rfAckConnectGame]");
    // End:0x10E
    if(Result == 0)
    {
        // End:0xD3
        if(MM.bIsOwner == true)
        {
            // End:0x9D
            if(MM.InGamePlaying == true)
            {
                page_Main.TcpChannel.sfReqSetUserBootySeedValue(UserID, MM.playingLevelInfo.Game.GetBootySeedValue());                
            }
            else
            {
                // End:0xD0
                if(MM.IsLoading() == true)
                {
                    page_Main.TcpChannel.sfReqSetUserBootySeedValue(UserID, 0);
                }
            }            
        }
        else
        {
            // End:0x10B
            if(UserID == MM.kUID)
            {
                MyAction = 1;
                page_Main.TcpChannel.sfReqGetIsHostBlocking();
            }
        }        
    }
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
        // End:0x1CF
        if(Result == 514)
        {
            Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 48);
            BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;            
        }
        else
        {
            // End:0x21A
            if(Result == 627)
            {
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller, 49);
                BTWindowDefineARHK(Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckUpdateScore(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> EXPBonuses, array<int> Points, array<int> PointBonuses, array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID)
{
    local int lp1, lp2, k, i, SortOrder;

    local bool bSwap;
    local ResultInfo Result, tmp;

    Log("[BTPageRoomLobby::rfAckUpdateScore]");
    MM.ResultInfos.Remove(0, MM.ResultInfos.Length);
    lp1 = 0;
    J0x4D:

    // End:0x2A1 [Loop If]
    if(lp1 < UserIDs.Length)
    {
        Log((((((((((((((((((("[BTPageRoomLobby::rfAckUpdateScore] UID=" $ string(UserIDs[lp1])) $ " Nick=") $ NickNames[lp1]) $ " Scores=") $ string(Scores[lp1])) $ " Kills=") $ string(Kills[lp1])) $ " Assists=") $ string(Assists[lp1])) $ " Deaths=") $ string(Deaths[lp1])) $ " EXP=") $ string(EXPs[lp1])) $ " EXPBonus=") $ string(EXPBonuses[lp1])) $ " Point=") $ string(Points[lp1])) $ " PointBonus=") $ string(PointBonuses[lp1]));
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
        Result.Team = int(TeamIDs[lp1]);
        MM.ResultInfos[lp1] = Result;
        lp1++;
        // [Loop Continue]
        goto J0x4D;
    }
    lp1 = 0;
    J0x2A8:

    // End:0x343 [Loop If]
    if(lp1 < MM.ResultInfos.Length)
    {
        Log((("[BTPageRoomLobby::rfAckUpdateScore] BEFORE UID=" $ string(MM.ResultInfos[lp1].UserID)) $ " Score=") $ string(MM.ResultInfos[lp1].Score));
        lp1++;
        // [Loop Continue]
        goto J0x2A8;
    }
    lp1 = 1;
    J0x34A:

    // End:0x6BB [Loop If]
    if(lp1 < MM.ResultInfos.Length)
    {
        lp2 = lp1 - 1;
        J0x371:

        // End:0x6B1 [Loop If]
        if(lp2 >= 0)
        {
            // End:0x3C3
            if(MM.ResultInfos[lp2].Score < MM.ResultInfos[lp2 + 1].Score)
            {
                SortOrder[0] = 2;                
            }
            else
            {
                // End:0x409
                if(MM.ResultInfos[lp2].Score == MM.ResultInfos[lp2 + 1].Score)
                {
                    SortOrder[0] = 1;                    
                }
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
            else
            {
                // End:0x49F
                if(MM.ResultInfos[lp2].Kill == MM.ResultInfos[lp2 + 1].Kill)
                {
                    SortOrder[1] = 1;                    
                }
                else
                {
                    SortOrder[1] = 0;
                }
            }
            // End:0x4F0
            if(MM.ResultInfos[lp2].Assist < MM.ResultInfos[lp2 + 1].Assist)
            {
                SortOrder[2] = 2;                
            }
            else
            {
                // End:0x537
                if(MM.ResultInfos[lp2].Assist == MM.ResultInfos[lp2 + 1].Assist)
                {
                    SortOrder[2] = 1;                    
                }
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
            else
            {
                // End:0x5D0
                if(MM.ResultInfos[lp2].Death == MM.ResultInfos[lp2 + 1].Death)
                {
                    SortOrder[3] = 1;                    
                }
                else
                {
                    SortOrder[3] = 0;
                }
            }
            bSwap = false;
            i = 0;
            J0x5E9:

            // End:0x63B [Loop If]
            if(i < 4)
            {
                // End:0x615
                if(SortOrder[i] == 2)
                {
                    bSwap = true;
                    // [Explicit Break]
                    goto J0x63B;
                    // [Explicit Continue]
                    goto J0x631;
                }
                // End:0x631
                if(SortOrder[i] == 0)
                {
                    bSwap = false;
                    // [Explicit Break]
                    goto J0x63B;
                }
                J0x631:

                i++;
                // [Loop Continue]
                goto J0x5E9;
            }
            J0x63B:

            // End:0x6A7
            if(bSwap)
            {
                tmp = MM.ResultInfos[lp2];
                MM.ResultInfos[lp2] = MM.ResultInfos[lp2 + 1];
                MM.ResultInfos[lp2 + 1] = tmp;
            }
            lp2--;
            // [Loop Continue]
            goto J0x371;
        }
        lp1++;
        // [Loop Continue]
        goto J0x34A;
    }
    lp1 = 0;
    J0x6C2:

    // End:0x7D4 [Loop If]
    if(lp1 < BonusOwnerID.Length)
    {
        lp2 = 0;
        J0x6D9:

        // End:0x7CA [Loop If]
        if(lp2 < MM.ResultInfos.Length)
        {
            // End:0x7C0
            if(MM.ResultInfos[lp2].UserID == BonusOwnerID[lp1])
            {
                k = 0;
                J0x722:

                // End:0x7C0 [Loop If]
                if(k < 9)
                {
                    // End:0x763
                    if(MM.ResultInfos[lp2].BonusID[k] == BonusID[lp1])
                    {
                        // [Explicit Break]
                        goto J0x7C0;
                        // [Explicit Continue]
                        goto J0x7B6;
                    }
                    // End:0x7B6
                    if(MM.ResultInfos[lp2].BonusID[k] == 0)
                    {
                        MM.ResultInfos[lp2].BonusID[k] = BonusID[lp1];
                        // [Explicit Break]
                        goto J0x7C0;
                    }
                    J0x7B6:

                    k++;
                    // [Loop Continue]
                    goto J0x722;
                }
            }
            J0x7C0:

            lp2++;
            // [Loop Continue]
            goto J0x6D9;
        }
        lp1++;
        // [Loop Continue]
        goto J0x6C2;
    }
    lp1 = 0;
    J0x7DB:

    // End:0x876 [Loop If]
    if(lp1 < MM.ResultInfos.Length)
    {
        Log((("[BTPageRoomLobby::rfAckUpdateScore]  AFTER UID=" $ string(MM.ResultInfos[lp1].UserID)) $ " Score=") $ string(MM.ResultInfos[lp1].Score));
        lp1++;
        // [Loop Continue]
        goto J0x7DB;
    }
    MM.ResultTeamScores = TeamScores;
    MM.ResultBonusOwnerID = BonusOwnerID;
    MM.ResultBonusID = BonusID;
    Log("[BTPageServerSelection::rfAckQuestUpdate] page_Main.TcpChannel.sfReqQuestList()");
    page_Main.rMM.bNoUpdateQuestInfo = false;
    page_Main.TcpChannel.sfReqQuestList();
    return true;
    //return;    
}

function bool rfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, array<int> ScoreRewardUserID, array<byte> ScoreRewardTYPE, array<int> ScoreRewardID, array<int> ScoreRewardCount)
{
    local int lp1;
    local RewardInfo Reward;

    Log("[BTPageRoomLobby::rfAckAIRewardResult]");
    MM.RewardInfos.Remove(0, MM.RewardInfos.Length);
    lp1 = 0;
    J0x50:

    // End:0x220 [Loop If]
    if(lp1 < ScoreRewardUserID.Length)
    {
        Log((((((((("[BTPageRoomLobby::rfAckAIRewardResult] UID=" $ string(ScoreRewardUserID[lp1])) $ " ScoreRewardID=") $ string(ScoreRewardID[lp1])) $ " ScoreRewardCount=") $ string(ScoreRewardCount[lp1])) $ " ClearRewardID=") $ string(ClearRewardID)) $ " ClearRewardCount=") $ string(ClearRewardCount));
        Reward.iUserID = ScoreRewardUserID[lp1];
        Reward.iScoreRewardID = ScoreRewardID[lp1];
        Reward.iClearRewardID = ClearRewardID;
        Reward.byScoreRewardTYPE = ScoreRewardTYPE[lp1];
        Reward.byClearRewardTYPE = ClearRewardTYPE;
        Reward.byScoreRewardItemCount = byte(ScoreRewardCount[lp1]);
        Reward.byClearRewardItemCount = byte(ClearRewardCount);
        MM.RewardInfos[lp1] = Reward;
        // End:0x216
        if(MM.kUID == Reward.iUserID)
        {
            // End:0x216
            if((Reward.iScoreRewardID > 0) || Reward.iClearRewardID > 0)
            {
                MM.kNeedUpdateItemList = true;
            }
        }
        lp1++;
        // [Loop Continue]
        goto J0x50;
    }
    return true;
    //return;    
}

function bool rfAckEntryItemList(array<int> UserIDs, array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<BtrDouble> UniqueID, array<int> PaintID, int Result, string ErrMsg)
{
    local int lp1, lp2, idx;
    local EquippedItemInfo EquippedItemInfo;
    local byte byModeItem;

    Log("[BTPageRoomLobby::rfAckEntryItemList]");
    idx = 0;
    lp1 = 0;
    J0x37:

    // End:0xE8 [Loop If]
    if(lp1 < UserIDs.Length)
    {
        lp2 = 0;
        J0x4E:

        // End:0xDE [Loop If]
        if(lp2 < MM.UserInfos.Length)
        {
            // End:0xD4
            if(MM.UserInfos[lp2].UID == UserIDs[lp1])
            {
                MM.UserInfos[lp2].EquippedItems.Remove(0, MM.UserInfos[lp2].EquippedItems.Length);
                // [Explicit Break]
                goto J0xDE;
            }
            lp2++;
            // [Loop Continue]
            goto J0x4E;
        }
        J0xDE:

        lp1++;
        // [Loop Continue]
        goto J0x37;
    }
    lp1 = 0;
    J0xEF:

    // End:0x3B5 [Loop If]
    if(lp1 < UserIDs.Length)
    {
        lp2 = 0;
        J0x106:

        // End:0x3AB [Loop If]
        if(lp2 < MM.UserInfos.Length)
        {
            // End:0x3A1
            if(MM.UserInfos[lp2].UID == UserIDs[lp1])
            {
                // End:0x181
                if(!GameMgr.IsUseItem_InGame(MM.kGame_GameMode, ItemIDs[lp1], byModeItem))
                {
                    // [Explicit Continue]
                    goto J0x3A1;
                }
                idx = MM.UserInfos[lp2].EquippedItems.Length;
                MM.UserInfos[lp2].EquippedItems[idx] = EquippedItemInfo;
                MM.UserInfos[lp2].EquippedItems[idx].ItemID = ItemIDs[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].SlotPosition = SlotPositions[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].AddPartID = AddPartsID[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].UniqueID = UniqueID[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].Painting_Item_ID = GameMgr.GetPaintingItemIDbyPaintingID(PaintID[lp1]);
                MM.UserInfos[lp2].EquippedItems[idx].byModeItem = byModeItem;
                Log((("[BTPageRoomLobby::rfAckEntryItemList] UserName=" $ MM.UserInfos[lp2].UserName) $ " EquippedItemID=") $ string(MM.UserInfos[lp2].EquippedItems[idx].ItemID));
            }
            J0x3A1:

            lp2++;
            // [Loop Continue]
            goto J0x106;
        }
        lp1++;
        // [Loop Continue]
        goto J0xEF;
    }
    // End:0x3D9
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, string ErrMsg)
{
    local int lp1;

    Log((((((((("[:rfAckChangeRoomOwner] GameNum=" $ string(GameNum)) $ " OldOnwer=") $ string(OldOwner)) $ " NewOwner=") $ string(NewOwner)) $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    Log("MyUID=" $ string(MM.kUID));
    // End:0xEA
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        Log("[rfAckChangeRoomOwner] error!!");
        return true;        
    }
    else
    {
        // End:0x1AE
        if(MM.InGamePlaying)
        {
            // End:0x14B
            if(OldOwner == MM.kUID)
            {
                // End:0x14B
                if(MM.kIsInDSChannel && MM.kDS_SavedOwnerInfo)
                {
                    MM.kDS_SavedOwnerInfo = false;
                }
            }
            // End:0x19D
            if(NewOwner == MM.kUID)
            {
                // End:0x189
                if(MM.kIsInDSChannel)
                {
                    MM.kDS_SavedOwnerInfo = true;                    
                }
                else
                {
                    MM.kDS_SavedOwnerInfo = false;
                }                
            }
            else
            {
                MM.kDS_SavedOwnerInfo = false;
            }
        }
        bShowHostWarning = false;
        lp1 = 0;
        J0x1BD:

        // End:0x32E [Loop If]
        if(lp1 < MM.UserInfos.Length)
        {
            Log((("UID=" $ string(MM.UserInfos[lp1].UID)) $ " Name=") $ MM.UserInfos[lp1].UserName);
            // End:0x2BC
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
            lp1++;
            // [Loop Continue]
            goto J0x1BD;
        }
        // End:0x373
        if(OldOwner == MM.kUID)
        {
            MM.kGame_bOwner = false;
            MM.bIsOwner = false;
            bReadyToGame = false;            
        }
        else
        {
            // End:0x4A6
            if(NewOwner == MM.kUID)
            {
                PlayerOwner().ResetKeySleepTime();
                MM.bShowMessageHostUnsuitableness = true;
                bReadyToGame = false;
                // End:0x3E7
                if(!MM.InGamePlaying)
                {
                    MM.bIsOwner = true;
                    MM.kGame_bOwner = true;
                }
                lp1 = 0;
                J0x3EE:

                // End:0x488 [Loop If]
                if(lp1 < MM.UserInfos.Length)
                {
                    // End:0x449
                    if(MM.UserInfos[lp1].UID == NewOwner)
                    {
                        page_Main.rMM.SendPingToChannelServer();
                        // [Explicit Continue]
                        goto J0x47E;
                    }
                    page_Main.rMM.SendPingToOtherUser(MM.UserInfos[lp1].UserIP);
                    J0x47E:

                    ++lp1;
                    // [Loop Continue]
                    goto J0x3EE;
                }
                ReceivedPingID.Length = 0;
                ReceivedPingValue.Length = 0;
                SetTimer(5.0000000, true, 'UserPingRefresh');
            }
        }
        ChangeButtonStart();
        UpdateRoomOwner(NewOwner);
        // End:0x4CC
        if(MM.kIsInDSChannel)
        {            
        }
        else
        {
            MM.SetChangingHostFlag(true);
            // End:0x4FB
            if(MM.bChangingHost)
            {
                PlayerOwner().ClientFadeToBlackWhite2();
            }
            MM.SetChangeHostMessageFlag();
            // End:0x688
            if(MM.InGamePlaying)
            {
                // End:0x5BA
                if(MM.IsCompletedLoading() == true)
                {
                    // End:0x56D
                    if(MM.bIsOwner)
                    {
                        GetConsole().AddMessageItem(GetConsole().ConstructMessageItem(MessageNewHost, 6));                        
                    }
                    else
                    {
                        GetConsole().AddMessageItem(GetConsole().ConstructMessageItem((MessageNewGuestPre $ MM.GetUserInfoByUID(NewOwner).UserName) $ MessageNewGuestPost, 6));
                    }
                }
                // End:0x685
                if(MM.bIntervention == true)
                {
                    // End:0x5F8
                    if(MM.IsCompletedLoading() == true)
                    {
                        MM.bIntervention = false;                        
                    }
                    else
                    {
                        Log((("BTPageRoomLobby::rfAckChangeRoomOwner() InGamePlaying=" $ string(MM.InGamePlaying)) $ " bIntervention=") $ string(MM.bIntervention));
                        MM.ForceDisconnectGameWithErrMessage(GetErrMsg(5082));
                    }
                }                
            }
            else
            {
                // End:0x740
                if(MM.bPendingStarted == true)
                {
                    Log((("BTPageRoomLobby::rfAckChangeRoomOwner() bPendingStarted=" $ string(MM.bPendingStarted)) $ " bIntervention=") $ string(MM.bIntervention));
                    page_Main.TcpChannel.sfReqRemoveCheckTeamBalanceList();
                    FailedNetworkChecking(GetErrMsg(5081), 5081);
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, string ErrMsg)
{
    Log((("[BTPageRoomLobby::rfAckForceGameOver] Result:" $ string(Result)) $ "ErrMsg:") $ ErrMsg);
    // End:0xA4
    if(MatchMaker == none)
    {
        Log("[CYH] BTPageRoomLobby::rfAckForceGameOver() MatchMaker is none. error!!");
        return true;
    }
    // End:0xCA
    if(Result == 0)
    {
        MM.ForceGameOver(PlayerOwner().PlayerReplicationInfo);
    }
    return true;
    //return;    
}

function bool rfAckGetBooty(int Result, string ErrMsg, array<int> PrizeWinUserID, array<int> BootyItemID, array<int> BootyPartsID)
{
    local int i;

    Log("[END] rfAckGetBotty");
    Log("[BTPageRoomLobby::rfAckGetBooty]");
    // End:0x36D
    if(Result == 0)
    {
        MM.ResultIsGiveType = 0;
        MM.ResultIsBootyGet = true;
        MM.ResultIsOverlapWeapon = false;
        MM.ResultBootyInfo.Length = 2;
        i = 0;
        J0x92:

        // End:0x122 [Loop If]
        if(i < MM.ResultBootyInfo.Length)
        {
            MM.ResultBootyInfo[i].ItemID = 0;
            MM.ResultBootyInfo[i].PartsID = 0;
            MM.ResultBootyInfo[i].PrizeWinUserID = 0;
            MM.ResultBootyInfo[i].PrizeWinUserName = "";
            i++;
            // [Loop Continue]
            goto J0x92;
        }
        i = 0;
        J0x129:

        // End:0x2D7 [Loop If]
        if(i < PrizeWinUserID.Length)
        {
            MM.ResultBootyInfo[i].PrizeWinUserID = PrizeWinUserID[i];
            MM.ResultBootyInfo[i].PrizeWinUserName = MM.GetUserInfoByUID(MM.ResultBootyInfo[i].PrizeWinUserID).UserName;
            Log("PrizeWinUserName = " $ MM.ResultBootyInfo[i].PrizeWinUserName);
            MM.ResultBootyInfo[i].ItemID = BootyItemID[i];
            MM.ResultBootyInfo[i].PartsID = BootyPartsID[i];
            // End:0x2CD
            if(MM.ResultBootyInfo[i].PrizeWinUserName == MM.kUserName)
            {
                // End:0x2CD
                if(Controller.ViewportOwner.Actor.Level.GameMgr.FindInstanceItemSameWeapon(MM.ResultBootyInfo[i].ItemID, MM.ResultBootyInfo[i].PartsID) != none)
                {
                    MM.ResultIsOverlapWeapon = true;
                }
            }
            i++;
            // [Loop Continue]
            goto J0x129;
        }
        i = PrizeWinUserID.Length;
        J0x2E3:

        // End:0x36A [Loop If]
        if(i < 2)
        {
            MM.ResultBootyInfo[i].PrizeWinUserID = -1;
            MM.ResultBootyInfo[i].PrizeWinUserName = "";
            MM.ResultBootyInfo[i].ItemID = 0;
            MM.ResultBootyInfo[i].PartsID = 0;
            i++;
            // [Loop Continue]
            goto J0x2E3;
        }        
    }
    else
    {
        MM.ResultIsBootyGet = false;
        MM.ResultIsOverlapWeapon = false;
        MM.ResultBootyInfo.Length = 0;
    }
    // End:0x3C4
    if(Result > 1)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckEntrySkillList(array<int> UserIDs, array<int> SkillIDs, array<int> SlotPositions, int Result, string ErrMsg)
{
    local int lp1, lp2, idx;
    local EquippedSkillInfo EquippedSkillInfo;
    local byte byModeItem;

    Log(((("[BTPageRoomLobby::rfAckEntrySkillList]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    GameMgr = Controller.ViewportOwner.Actor.Level.GameMgr;
    // End:0x36B
    if(Result == 0)
    {
        lp1 = 0;
        J0x93:

        // End:0x144 [Loop If]
        if(lp1 < UserIDs.Length)
        {
            lp2 = 0;
            J0xAA:

            // End:0x13A [Loop If]
            if(lp2 < MM.UserInfos.Length)
            {
                // End:0x130
                if(MM.UserInfos[lp2].UID == UserIDs[lp1])
                {
                    MM.UserInfos[lp2].EquippedSkills.Remove(0, MM.UserInfos[lp2].EquippedSkills.Length);
                    // [Explicit Break]
                    goto J0x13A;
                }
                lp2++;
                // [Loop Continue]
                goto J0xAA;
            }
            J0x13A:

            lp1++;
            // [Loop Continue]
            goto J0x93;
        }
        lp1 = 0;
        J0x14B:

        // End:0x368 [Loop If]
        if(lp1 < UserIDs.Length)
        {
            lp2 = 0;
            J0x162:

            // End:0x35E [Loop If]
            if(lp2 < MM.UserInfos.Length)
            {
                // End:0x354
                if(MM.UserInfos[lp2].UID == UserIDs[lp1])
                {
                    // End:0x1DD
                    if(!GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, SkillIDs[lp1], byModeItem))
                    {
                        // [Explicit Continue]
                        goto J0x354;
                    }
                    idx = MM.UserInfos[lp2].EquippedSkills.Length;
                    MM.UserInfos[lp2].EquippedSkills[idx] = EquippedSkillInfo;
                    MM.UserInfos[lp2].EquippedSkills[idx].SkillID = SkillIDs[lp1];
                    MM.UserInfos[lp2].EquippedSkills[idx].SlotPosition = SlotPositions[lp1];
                    MM.UserInfos[lp2].EquippedSkills[idx].byModeItem = byModeItem;
                    Log((("[BTPageRoomLobby::rfAckEntrySkillList] UserName=" $ MM.UserInfos[lp2].UserName) $ " EquippedSkillID=") $ string(MM.UserInfos[lp2].EquippedSkills[idx].SkillID));
                }
                J0x354:

                lp2++;
                // [Loop Continue]
                goto J0x162;
            }
            lp1++;
            // [Loop Continue]
            goto J0x14B;
        }        
    }
    else
    {
        // End:0x37A
        if(Result == 113)
        {            
        }
        else
        {
            // End:0x389
            if(Result == 213)
            {                
            }
            else
            {
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckGetBootyChoose(int Result, string ErrMsg, byte GiveType, BtrDouble ItemUniqueNumber, int ItemID, int PartID, byte ItemType, BtrDouble UntilTime, int StackCount, int PaintID)
{
    local wItemBoxHK itemBox;

    // End:0x0D
    if(Result != 0)
    {
        return true;
    }
    Log((("[rfAckGetBootyChoose] GUIWarfare.BTPageRoomLobby.rfAckGetBootyChoose - Result : " $ string(Result)) $ " / ErrMsg : ") $ ErrMsg);
    page_Main.rMM.ResultIsGiveType = GiveType;
    // End:0x1A3
    if(((int(GiveType) == 1) || int(GiveType) == 3) || int(GiveType) == 4)
    {
        itemBox = GameMgr.FindUIItem(ItemID);
        // End:0x1A3
        if(itemBox != none)
        {
            // End:0x152
            if(GameMgr.CheckSkillItem(itemBox.ItemType))
            {
                GameMgr.AddInstanceItemByParameter(ItemID, __NFUN_921__(0), __NFUN_923__(ItemUniqueNumber), int(13), 1, 100000, PartID, PaintID, StackCount, 0, UntilTime);                
            }
            else
            {
                GameMgr.AddInstanceItemByParameter(ItemID, ItemUniqueNumber, 0, int(13), 1, 100000, PartID, PaintID, StackCount, 0, UntilTime);
            }
            GameMgr.UpdateItemList(GameMgr);
        }
    }
    return true;
    //return;    
}

function bool rfAckChangeHost(byte ClientNum)
{
    Log("[BTPageRoomLobby::rfAckChangeHost]");
    MM.ChangeHost(int(ClientNum));
    return true;
    //return;    
}

function bool rfAckChangeNewGuest(string HostIP)
{
    Log("[BTPageRoomLobby::rfAckChangeNewGuest]");
    MM.ChangeNewGuest(HostIP);
    return true;
    //return;    
}

function bool rfAckEntryQSlotIDList(int UserNum, array<byte> QSlotDispOrder, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<int> TWItemID1, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID)
{
    local int lp1, lp2, lp3, idx;
    local EquippedQSlotInfo tmSlot;
    local byte byModeItem;

    Log("[BTPageRoomLobby::rfAckEntryQSlotIDList]");
    lp1 = 0;
    J0x33:

    // End:0x22D [Loop If]
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
            else
            {
                lp2 = 0;
                J0x15D:

                // End:0x220 [Loop If]
                if(lp2 < 5)
                {
                    lp3 = 0;
                    J0x170:

                    // End:0x216 [Loop If]
                    if(lp3 < 4)
                    {
                        MM.UserInfos[lp1].EquippedQSlots[lp2].ItemID[lp3] = 0;
                        MM.UserInfos[lp1].EquippedQSlots[lp2].PartsID[lp3] = 0;
                        MM.UserInfos[lp1].EquippedQSlots[lp2].SkillID[lp3] = 0;
                        lp3++;
                        // [Loop Continue]
                        goto J0x170;
                    }
                    lp2++;
                    // [Loop Continue]
                    goto J0x15D;
                }
            }
            // [Explicit Break]
            goto J0x22D;
        }
        lp1++;
        // [Loop Continue]
        goto J0x33;
    }
    J0x22D:

    lp1 = 0;
    J0x234:

    // End:0x73A [Loop If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x730
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            lp2 = 0;
            J0x27B:

            // End:0x72D [Loop If]
            if(lp2 < QSlotDispOrder.Length)
            {
                idx = int(QSlotDispOrder[lp2]) - 1;
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[0] = MWItemID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[1] = PistolItemID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[2] = TWItemID1[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[3] = TWItemID2[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[0] = MWPartID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[1] = PistolPartID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[2] = 0;
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[3] = 0;
                // End:0x4AA
                if(GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, Skill1ID[lp2], byModeItem))
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[0] = Skill1ID[lp2];                    
                }
                else
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[0] = 0;
                }
                // End:0x53F
                if(GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, Skill2ID[lp2], byModeItem))
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[1] = Skill2ID[lp2];                    
                }
                else
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[1] = 0;
                }
                // End:0x5D5
                if(GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, Skill3ID[lp2], byModeItem))
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[2] = Skill3ID[lp2];                    
                }
                else
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[2] = 0;
                }
                // End:0x66C
                if(GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, Skill4ID[lp2], byModeItem))
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[3] = Skill4ID[lp2];                    
                }
                else
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[3] = 0;
                }
                MM.UserInfos[lp1].EquippedQSlots[idx].Painting_Item_ID[0] = GameMgr.GetPaintingItemIDbyPaintingID(MWPaintID[lp2]);
                MM.UserInfos[lp1].EquippedQSlots[idx].Painting_Item_ID[1] = GameMgr.GetPaintingItemIDbyPaintingID(PistolPaintID[lp2]);
                lp2++;
                // [Loop Continue]
                goto J0x27B;
            }
            // [Explicit Break]
            goto J0x73A;
        }
        lp1++;
        // [Loop Continue]
        goto J0x234;
    }
    J0x73A:

    return true;
    //return;    
}

function bool rfAckEntryQSlotUniqueIDList(int UserNum, array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<BtrDouble> PistolUniqueID, array<BtrDouble> TW1UniqueID, array<BtrDouble> TW2UniqueID)
{
    local int lp1, lp2, lp3, idx;
    local EquippedQSlotInfo tmSlot;

    Log("[BTPageRoomLobby::rfAckEntryQSlotUniqueIDList]");
    lp1 = 0;
    J0x39:

    // End:0x1D8 [Loop If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x1CE
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            // End:0x15C
            if(MM.UserInfos[lp1].EquippedQSlots.Length == 0)
            {
                MM.UserInfos[lp1].EquippedQSlots[0] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[1] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[2] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[3] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[4] = tmSlot;                
            }
            else
            {
                lp2 = 0;
                J0x163:

                // End:0x1CB [Loop If]
                if(lp2 < 5)
                {
                    lp3 = 0;
                    J0x176:

                    // End:0x1C1 [Loop If]
                    if(lp3 < 4)
                    {
                        MM.UserInfos[lp1].EquippedQSlots[lp2].ItemUniqueID[lp3] = EmptyBtrDouble();
                        lp3++;
                        // [Loop Continue]
                        goto J0x176;
                    }
                    lp2++;
                    // [Loop Continue]
                    goto J0x163;
                }
            }
            // [Explicit Break]
            goto J0x1D8;
        }
        lp1++;
        // [Loop Continue]
        goto J0x39;
    }
    J0x1D8:

    lp1 = 0;
    J0x1DF:

    // End:0x33D [Loop If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x333
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            lp2 = 0;
            J0x226:

            // End:0x330 [Loop If]
            if(lp2 < QSlotDispOrder.Length)
            {
                idx = int(QSlotDispOrder[lp2]) - 1;
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[0] = MWUniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[1] = PistolUniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[2] = TW1UniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[3] = TW2UniqueID[lp2];
                lp2++;
                // [Loop Continue]
                goto J0x226;
            }
            // [Explicit Break]
            goto J0x33D;
        }
        lp1++;
        // [Loop Continue]
        goto J0x1DF;
    }
    J0x33D:

    return true;
    //return;    
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
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    PlayerOwner().dblog("=========================================");
    PlayerOwner().dblog("UpdateWeaponDurability.Length = " $ string(UniqueItemID.Length));
    PlayerOwner().dblog("=========================================");
    page_Main.DestroyedDurabilityXItems.Length = 0;
    i = 0;
    J0x119:

    // End:0x3B5 [Loop If]
    if(i < UniqueItemID.Length)
    {
        PlayerOwner().dblog("i=" $ string(i));
        // End:0x2A0
        if(int(IsDestroy[i]) == 1)
        {
            instanceInfo = GameMgr.FindInstanceItem(UniqueItemID[i]);
            ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
            page_Main.DestroyedDurabilityXItems.Length = page_Main.DestroyedDurabilityXItems.Length + 1;
            page_Main.DestroyedDurabilityXItems[page_Main.DestroyedDurabilityXItems.Length - 1] = ItemInfo.ItemName;
            page_Main.bWarningDurabilityAndExpired = true;
            PlayerOwner().dblog(((ItemInfo.ItemName $ " is destroyed!! (ItemID = ") $ string(ItemInfo.ItemID)) $ ")");
            GameMgr.ChangeInstance_DefaultWeapon(instanceInfo.SlotPosition);
            GameMgr.RemoveInstanceItem(UniqueItemID[i]);
            GameMgr.RemoveQuickSlotBoxItem(UniqueItemID[i]);
            // [Explicit Continue]
            goto J0x3AB;
        }
        instanceInfo = GameMgr.FindInstanceItem(UniqueItemID[i]);
        ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        PlayerOwner().dblog(((ItemInfo.ItemName $ " is changed !! (ItemID = ") $ string(ItemInfo.ItemID)) $ ")");
        PlayerOwner().dblog(((("Dur = (" $ string(instanceInfo.Durability)) $ " => ") $ string(instanceInfo.Durability - Durability[i])) $ ")");
        GameMgr.ChangeInstance_ItemReduceDurability(UniqueItemID[i], Durability[i]);
        J0x3AB:

        i++;
        // [Loop Continue]
        goto J0x119;
    }
    PlayerOwner().dblog("=========================================");
    GameMgr.UpdateItemList(GameMgr);
    page_Main.CompleteDurabilityWarningItem();
    i = 0;
    J0x41B:

    // End:0x54B [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x41B;
    }
    page_Main.UpdateDurabilityWarningItemList(page_Main);
    return true;
    //return;    
}

function bool rfReqRelayServerOff()
{
    Log("[BTPageRoomLobby::rfReqRelayServerOff]");
    MM.IsRelayServerOff = true;
    return true;
    //return;    
}

function bool rfAckSuccessStartGame(int Result, string ErrMsg, byte IsHost, string HostIP, int HostPort, int LoadingStep)
{
    Log(((((((((("[BTPageRoomLobby::rfAckSuccessStartGame] Result=" $ string(Result)) $ ", IsHost=") $ string(IsHost)) $ "HostIP=") $ HostIP) $ ", ") $ "HostPort=") $ string(HostPort)) $ "LoadingStep=") $ string(LoadingStep));
    // End:0xFA
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
    else
    {
        // End:0x14D
        if(MM.bIsOwner == true)
        {
            page_Main.TcpChannel.sfReqFailedStartGame(LoadingStep);            
        }
        else
        {
            // End:0x177
            if(int(IsHost) == 0)
            {
                page_Main.TcpChannel.sfReqFailedStartGame(LoadingStep);
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckFailedStartGame(int Result, string ErrMsg, byte IsHost, int FailedUserID, int LoadingStep)
{
    Log(((((((("[BTPageRoomLobby::rfAckFailedStartGame] Result=" $ string(Result)) $ ", ") $ "FailedUserID=") $ string(FailedUserID)) $ " IsHost=") $ string(IsHost)) $ "LoadingStep=") $ string(LoadingStep));
    // End:0xE3
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
    // End:0x1B2
    if(Result == 127)
    {
        // End:0x193
        if(FailedUserID == MM.kUID)
        {
            FailedNetworkChecking(MM.GetMyNetworkCheckFailedMsg(LoadingStep), 127);            
        }
        else
        {
            FailedNetworkChecking(MM.GetHostNetworkCheckFailedMsg(LoadingStep), 127);
        }        
    }
    else
    {
        // End:0x2C9
        if(Result == 128)
        {
            // End:0x292
            if(MM.bIsOwner == true)
            {
                // End:0x1FA
                if(MM.ConnectClientNum > 0)
                {
                    MM.ConnectClientNum--;                    
                }
                else
                {
                    Log("BTPageRoomLobby::rfAckFailedStartGame() MM.ConnectClientNum <= 0. error!!");
                }
                // End:0x28F
                if(MM.kIsInDSChannel && FailedUserID == MM.kUID)
                {
                    FailedNetworkChecking(MM.GetMyNetworkCheckFailedMsg(LoadingStep), 128);
                }                
            }
            else
            {
                // End:0x2C6
                if(FailedUserID == MM.kUID)
                {
                    FailedNetworkChecking(MM.GetMyNetworkCheckFailedMsg(LoadingStep), 128);
                }
            }            
        }
        else
        {
            FailedNetworkChecking(MM.GetMyNetworkCheckFailedMsg(LoadingStep), Result);
            Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        }
    }
    return true;
    //return;    
}

function bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState)
{
    Log((((((("[BTPageRoomLobby::rfAckNotifyLoadingState] Result=" $ string(Result)) $ ", ") $ "UserID=") $ string(UserID)) $ ", ") $ "LoadingState=") $ string(LoadingState));
    // End:0xDD
    if(int(LoadingState) == 0)
    {
        // End:0xBD
        if(UserID == MM.kUID)
        {
            Log("My Loading State Failed!");            
        }
        else
        {
            Log("Another User Loading Failed!");
        }
    }
    // End:0x10B
    if(MM.InGamePlaying == true)
    {
        MM.DrawOtherLoadingState(UserID, LoadingState);
    }
    return true;
    //return;    
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
            // End:0xC0
            if(Result == 514)
            {
                Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller.TopPage().Controller, 48);
                BTWindowDefineARHK(Controller.TopPage().Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;                
            }
            else
            {
                // End:0x131
                if(Result == 627)
                {
                    Class'GUIWarfareControls.BTWindowDefineARHK'.static.ShowInfo(Controller.TopPage().Controller, 49);
                    BTWindowDefineARHK(Controller.TopPage().Controller.TopPage()).__OnOK__Delegate = GotoInventory_OnOK;                    
                }
                else
                {
                    Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller.TopPage().Controller, Result);
                }
            }            
        }
        else
        {
            Log(Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.GetFormatString(Result));
        }
        return true;
    }
    i = 0;
    J0x17F:

    // End:0x40A [Loop If]
    if(i < UserIDs.Length)
    {
        UserID = UserIDs[i];
        Number = Numbers[i];
        Position = Positions[i];
        oldstate = OldStates[i];
        NewState = NewStates[i];
        // End:0x1FE
        if(Number != MM.kRoomID)
        {
            return true;
        }
        // End:0x361
        if(UserID == MM.kUID)
        {
            Log(((((("My UserState UserID=" $ string(UserID)) $ ", ") $ "State=") $ string(oldstate)) $ " -> ") $ string(NewState));
            j = 0;
            J0x268:

            // End:0x2B3 [Loop If]
            if(j < GMList.Length)
            {
                // End:0x2A9
                if(GMList[j].DataPerColumn[6].IntValue == UserID)
                {
                    ImGM = true;
                    // [Explicit Break]
                    goto J0x2B3;
                }
                j++;
                // [Loop Continue]
                goto J0x268;
            }
            J0x2B3:

            // End:0x2F4
            if(!ImGM)
            {
                TPTeamList[MM.kTeamID].ACLList.ChangeTeamMemberStatus(UserID, int(NewState));                
            }
            else
            {
                TPTeamList[GMList[j].DataPerColumn[9].IntValue].ACLList.ChangeTeamMemberStatus(UserID, int(NewState));
            }
            // End:0x350
            if(int(NewState) == int(1))
            {
                bReadyToGame = true;                
            }
            else
            {
                bReadyToGame = false;
            }
            ChangeButtonStart();
            // [Explicit Continue]
            goto J0x400;
        }
        Log(((((("Team UserState UserID=" $ string(UserID)) $ ", ") $ "State=") $ string(oldstate)) $ " -> ") $ string(NewState));
        // End:0x400
        if(TPTeamList[0].ACLList.ChangeTeamMemberStatus(UserID, int(NewState)) == false)
        {
            TPTeamList[1].ACLList.ChangeTeamMemberStatus(UserID, int(NewState));
        }
        J0x400:

        i++;
        // [Loop Continue]
        goto J0x17F;
    }
    bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
    // End:0x46B
    if((IsUserAllReady()) && IsUserCountFull())
    {
        PlayerOwner().ResetKeySleepTime();
    }
    return true;
    //return;    
}

function bool rfAckChangeRoomSetting(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    local int OldGameMode;
    local bool bOldSDRespawn;

    OldGameMode = MM.kGame_GameMode;
    bOldSDRespawn = MM.bSDRespawn;
    Log(((((((((((((((((((("[BTPageRoomLobby::rfAckChangeRoomSetting]" $ " TeamCnt=") $ string(RoomInfo.TeamCnt)) $ " MapName=") $ RoomInfo.MapName) $ " GameMode=") $ RoomInfo.GameClass) $ " WeaponLimit=") $ string(RoomInfo.WeaponLimit)) $ " IsHardCore=") $ string(RoomInfo.IsHardCore)) $ " TotlaPlayerCnt=") $ string(RoomInfo.MaxUserCnt)) $ " GameRoundNumber=") $ string(RoomInfo.GameRound)) $ " GameMinute=") $ string(RoomInfo.GameMinute)) $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    // End:0x7D5
    if(Result == 0)
    {
        MM.szRoomName = RoomInfo.RoomName;
        MM.szRoomPassword = RoomInfo.Password;
        MM.szMapName = RoomInfo.MapName;
        MM.szGameClass = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(RoomInfo.GameModeNum)).ClassName;
        MM.eWeaponLimit = RoomInfo.WeaponLimit;
        MM.iMaxPlayers = int(RoomInfo.MaxUserCnt);
        MM.iGoalRound = RoomInfo.GameRound;
        MM.iTimeLimit = RoomInfo.GameMinute;
        MM.bHardCore = int(RoomInfo.IsHardCore) != 0;
        MM.bAutobalance = int(RoomInfo.IsTeamValance) != 0;
        Log("RoomInfo.PlayWithBots=" $ string(RoomInfo.PlayWithBots));
        MM.PlayWithBots = int(RoomInfo.PlayWithBots) != 0;
        MM.BotUserTeam = int(RoomInfo.UserTeamNum);
        MM.BotNum0 = int(RoomInfo.MaxAFUserAndBotNum);
        MM.BotNum1 = int(RoomInfo.MaxRSAUserAndBotNum);
        MM.BotDifficulty = int(RoomInfo.BotModeDifficulty);
        MM.bMultiBomb = bool(RoomInfo.BombHold);
        MM.kGame_RoomName = RoomInfo.RoomName;
        // End:0x3C0
        if(RoomInfo.RoomOwner == MM.kUserName)
        {
            MM.bIsOwner = true;
            MM.kGame_bOwner = true;            
        }
        else
        {
            MM.bIsOwner = false;
            MM.kGame_bOwner = false;
        }
        MM.kGame_Password = RoomInfo.Password;
        MM.kGame_MapNum = int(RoomInfo.MapNum);
        MM.kGame_MapName = RoomInfo.MapName;
        MM.kGame_GameMode = int(RoomInfo.GameModeNum);
        MM.kGame_UserCount = int(RoomInfo.MaxUserCnt);
        MM.kGame_GameTime = RoomInfo.GameMinute;
        MM.kGame_GameRound = RoomInfo.GameRound;
        // End:0x525
        if(MM.kGame_WeaponLimit != int(RoomInfo.WeaponLimit))
        {
            // End:0x4EF
            if(int(RoomInfo.WeaponLimit) == 5)
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(180), 5, true);                
            }
            else
            {
                // End:0x525
                if(int(RoomInfo.WeaponLimit) == 6)
                {
                    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(181), 5, true);
                }
            }
        }
        MM.kGame_WeaponLimit = int(RoomInfo.WeaponLimit);
        // End:0x566
        if(int(RoomInfo.IsHardCore) != 0)
        {
            MM.kGame_bHardCore = true;            
        }
        else
        {
            MM.kGame_bHardCore = false;
        }
        bPrevTeamBalance = MM.kGame_TeamBalance;
        // End:0x5B3
        if(int(RoomInfo.IsTeamValance) != 0)
        {
            MM.kGame_TeamBalance = true;            
        }
        else
        {
            MM.kGame_TeamBalance = false;
        }
        PrevGameMode = -1;
        // End:0x5F5
        if(int(RoomInfo.ResponType) == 1)
        {
            MM.bSDRespawn = true;            
        }
        else
        {
            MM.bSDRespawn = false;
        }
        // End:0x6D3
        if((((OldGameMode != MM.kGame_GameMode) || bOldSDRespawn != MM.bSDRespawn) && MM.bSDRespawn) && MM.szGameClass == "WGame.wTeamGame")
        {
            page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(227), 5, true);
            // End:0x6D3
            if(MM.kNotifyGrenadeLimited == false)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 227);
                MM.kNotifyGrenadeLimited = true;
            }
        }
        MM.UpdateGameRoomInfo(MM);
        UpdateRoomInfoByMatchMaker();
        // End:0x771
        if((MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_SD()) && MM.kLevel < 4)
        {
            CurrentRoomState = 0;
            bReadyToGame = false;
            ChangeButtonStart();
            page_Main.TcpChannel.sfReqChangeUserState(0, 1);
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 171);
        }
        bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
        // End:0x7D2
        if((IsUserAllReady()) && IsUserCountFull())
        {
            PlayerOwner().ResetKeySleepTime();
        }        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTPageRoomLobby::rfAckEnterChannel]");
    bSafeLeaveRoom = false;
    // End:0xF1
    if(Result == 0)
    {
        // End:0xB9
        if(UID == MM.kUID)
        {
            Log("page_Main.SetPage( EPage_Lobby2, true )");
            page_Main.ResetChatLog();
            MM.kClanMatch_InMatchRoom = false;
            UnInitializeDelegate();
            page_Main.SetPage(7, true);            
        }
        else
        {
            Log("[BTPageRoomLobby::rfAckEnterChannel] someone else");
        }        
    }
    else
    {
        page_Main.EndAutoMove();
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = RoomLobbyToServerSelection_OnOK;
    }
    return true;
    //return;    
}

function bool RoomLobbyToServerSelection_OnOK(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::RoomLobbyToServerSelection_OnOK]");
    RoomLobbyToServerSelection();
    return true;
    //return;    
}

function RoomLobbyToServerSelection()
{
    Log("[BTPageRoomLobby::RoomLobbyToServerSelection]");
    // End:0x5B
    if(BTWindowStateHK(Controller.TopPage()) != none)
    {
        Controller.CloseMenu(false);
    }
    UnInitializeDelegate();
    page_Main.ChannelToLogin(page_Main.szLoginServerIP, page_Main.szLoginServerPort);
    //return;    
}

function TcpLogin_OnConnect(int ErrCode)
{
    Log("[BTPageRoomLobby::TcpLogin_OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x196
    if(ErrCode == 0)
    {
        // End:0xE5
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
        {
            // End:0xA5
            if(page_Main.TcpLogin == none)
            {
                Log("page_Main.TcpLogin is none");
            }
            page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);            
        }
        else
        {
            Log(((((("[BTPageRoomLobby::TcpLogin_OnConnect] (" $ page_Main.szAccountName) $ ", ") $ page_Main.szLoginPassword) $ ", ") $ page_Main.AuthLogin_GUID) $ ")");
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

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log((((((((((((((((((("[BTPageRoomLobby::rfAckLoginInHouseTest] Sucess=" $ string(Sucess)) $ " CharName=") $ CharName) $ " ") $ string(TimeStamp)) $ " ") $ string(LoginHash1)) $ " ") $ string(LoginHash2)) $ " ") $ string(LoginHash3)) $ " ") $ string(LoginHash4)) $ " ") $ string(LoginHash5)) $ " ") $ string(NeedChar)) $ " ") $ ErrMsg);
    Controller.PopPage();
    // End:0x26B
    if(int(Sucess) == 0)
    {
        page_Main.BirthDay = BDay;
        page_Main.Sex = Sex;
        page_Main.LoginTimeStamp = TimeStamp;
        page_Main.LoginHash1 = LoginHash1;
        page_Main.LoginHash2 = LoginHash2;
        page_Main.LoginHash3 = LoginHash3;
        page_Main.LoginHash4 = LoginHash4;
        page_Main.LoginHash5 = LoginHash5;
        // End:0x1D0
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
            page_Main.SetPage(5, true);
        }        
    }
    else
    {
        // End:0x3FA
        if(int(Sucess) == 50)
        {
            page_Main.rMM.My_szName = CharName;
            page_Main.rMM.kUserName = CharName;
            Log("Retry Login!!");
            // End:0x373
            if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild())
            {
                Log(("page_Main.TcpLogin.sfReqLoginInHouseTest(" $ page_Main.AuthLogin_AccountID) $ ")");
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.AuthLogin_AccountID, "battery", page_Main.AuthLogin_GUID);                
            }
            else
            {
                Log(("page_Main.TcpLogin.sfReqLoginInHouseTest(" $ page_Main.szAccountName) $ ")");
                page_Main.TcpLogin.sfReqLoginInHouseTest(page_Main.szAccountName, page_Main.szLoginPassword, page_Main.AuthLogin_GUID);
            }            
        }
        else
        {
            // End:0x443
            if(int(Sucess) == 1)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 5);
                BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                
            }
            else
            {
                // End:0x48D
                if(int(Sucess) == 2)
                {
                    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 2);
                    BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                    
                }
                else
                {
                    // End:0x4D7
                    if(int(Sucess) == 3)
                    {
                        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 3);
                        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;                        
                    }
                    else
                    {
                        // End:0x521
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
    Log("[BTPageRoomLobby::rfAckProcessPreLoginUser] Result=" $ string(Result));
    // End:0x89
    if(Result > 1)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        BTWindowErrorDefineHK(Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
        return true;
    }
    // End:0xF6
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

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::Exit_OnOK]");
    Controller.ConsoleCommand("exit");
    return true;
    //return;    
}

function RemoveInUserList(int UID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x53 [Loop If]
    if(i < UserListDB.Length)
    {
        // End:0x49
        if(UserListDB[i].DataPerColumn[6].IntValue == UID)
        {
            UserListDB.Remove(i, 1);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    J0x5D:

    // End:0x166 [Loop If]
    if(i < UserListDB.Length)
    {
        TeamNum = UserListDB[i].DataPerColumn[9].IntValue;
        // End:0xE3
        if(UserListDB[i].DataPerColumn[3].IntValue == 1)
        {
            GMListIndex = GMList.Length;
            GMList.Insert(GMListIndex, 1);
            GMList[GMListIndex] = UserListDB[i];            
        }
        else
        {
            TPTeamList[TeamNum].ACLList.AddRow(UserListDB[i]);
        }
        addACLRowIdx = TPTeamList[TeamNum].ACLList.ACLRowList.Length - 1;
        SetFriendlyUser(TPTeamList[TeamNum].ACLList.ACLRowList[addACLRowIdx]);
        i++;
        // [Loop Continue]
        goto J0x5D;
    }
    i = 0;
    J0x16D:

    // End:0x3BA [Loop If]
    if(i < GMList.Length)
    {
        // End:0x243
        if((TPTeamList[1].ACLList.ACLRowList.Length < 7) && GMNumAF >= 2)
        {
            GMList[i].DataPerColumn[9].IntValue = 1;
            TPTeamList[1].ACLList.AddRow(GMList[GMIndex++]);
            addACLRowIdx = TPTeamList[1].ACLList.ACLRowList.Length - 1;
            SetFriendlyUser(TPTeamList[1].ACLList.ACLRowList[addACLRowIdx]);
            GMNumRSA++;
            // [Explicit Continue]
            goto J0x3B0;
        }
        // End:0x2FB
        if(TPTeamList[0].ACLList.ACLRowList.Length < 8)
        {
            GMList[i].DataPerColumn[9].IntValue = 0;
            TPTeamList[0].ACLList.AddRow(GMList[GMIndex++]);
            addACLRowIdx = TPTeamList[0].ACLList.ACLRowList.Length - 1;
            SetFriendlyUser(TPTeamList[0].ACLList.ACLRowList[addACLRowIdx]);
            GMNumAF++;
            // [Explicit Continue]
            goto J0x3B0;
        }
        // End:0x3B0
        if(TPTeamList[1].ACLList.ACLRowList.Length < 8)
        {
            GMList[i].DataPerColumn[9].IntValue = 1;
            TPTeamList[1].ACLList.AddRow(GMList[GMIndex++]);
            addACLRowIdx = TPTeamList[1].ACLList.ACLRowList.Length - 1;
            SetFriendlyUser(TPTeamList[1].ACLList.ACLRowList[addACLRowIdx]);
            GMNumRSA++;
        }
        J0x3B0:

        i++;
        // [Loop Continue]
        goto J0x16D;
    }
    // End:0x3DA
    if(GMList.Length > 0)
    {
        MM.isGMRoom = true;        
    }
    else
    {
        MM.isGMRoom = false;
    }
    //return;    
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
    J0x5B:

    // End:0x7F3 [Loop If]
    if(lp1 < UID.Length)
    {
        bisGM = false;
        UserInfo = new Class'Engine.wMatchUserInfo';
        MM.UserInfos[lp1] = UserInfo;
        MM.UserInfos[lp1].UID = UID[lp1];
        MM.UserInfos[lp1].UserName = UserName[lp1];
        MM.UserInfos[lp1].Grade = Grade[lp1];
        MM.UserInfos[lp1].IsHost = int(IsHost[lp1]) == 0;
        MM.UserInfos[lp1].UserIP = UserIP[lp1];
        MM.UserInfos[lp1].TeamNum = TeamNum[lp1];
        // End:0x1CD
        if((ClanName[lp1] == "") || ClanName[lp1] == "none")
        {
            RecvClanName = "";            
        }
        else
        {
            RecvClanName = ClanName[lp1];
        }
        MM.UserInfos[lp1].ClanName = RecvClanName;
        MM.UserInfos[lp1].ClanMark = CM_Pattern[lp1];
        MM.UserInfos[lp1].ClanBG = CM_BG[lp1];
        MM.UserInfos[lp1].ClanBL = CM_BL[lp1];
        MM.UserInfos[lp1].IsLookingFor = int(IsLookingFor[lp1]);
        MM.UserInfos[lp1].ClanLevel = ClanLevel[lp1];
        MM.UserInfos[lp1].LevelMarkID = LevelMarkID[lp1];
        MM.UserInfos[lp1].TitleMarkID = TitleMarkID[lp1];
        MM.UserInfos[lp1].Reserved1 = Reserved1[lp1];
        MM.UserInfos[lp1].Reserved2 = Reserved2[lp1];
        MM.UserInfos[lp1].Reserved3 = Reserved3[lp1];
        GameMgr.cmm.AddClanMark(RecvClanName, CM_Pattern[lp1], CM_BG[lp1], CM_BL[lp1], true, int(IsLookingFor[lp1]) > 0);
        GameMgr.cmm.SetClanLevel(RecvClanName, ClanLevel[lp1]);
        lp2 = 0;
        J0x41B:

        // End:0x458 [Loop If]
        if(lp2 < GMUID.Length)
        {
            // End:0x44E
            if(UID[lp1] == GMUID[lp2])
            {
                bisGM = true;
            }
            lp2++;
            // [Loop Continue]
            goto J0x41B;
        }
        // End:0x64E
        if(UID[lp1] == MM.kUID)
        {
            MM.My_iTeam = TeamNum[lp1];
            MM.kTeamID = TeamNum[lp1];
            ChangeButtonStart();
            // End:0x584
            if(bisGM)
            {
                SaveUserData(MakeTeamMemberData(UID[lp1], CM_Pattern[lp1], CM_BG[lp1], CM_BL[lp1], Grade[lp1], UserName[lp1], RecvClanName, int(Statue[lp1]), int(IsHost[lp1]), 0, UserIP[lp1], IsLookingFor[lp1], ClanLevel[lp1], LevelMarkID[lp1], TitleMarkID[lp1], TeamNum[lp1], Reserved2[lp1], Reserved3[lp1], true, true));                
            }
            else
            {
                SaveUserData(MakeTeamMemberData(UID[lp1], CM_Pattern[lp1], CM_BG[lp1], CM_BL[lp1], Grade[lp1], UserName[lp1], RecvClanName, int(Statue[lp1]), int(IsHost[lp1]), 0, UserIP[lp1], IsLookingFor[lp1], ClanLevel[lp1], LevelMarkID[lp1], TitleMarkID[lp1], TeamNum[lp1], Reserved2[lp1], Reserved3[lp1], true));
            }
            // [Explicit Continue]
            goto J0x7E9;
        }
        // End:0x722
        if(bisGM)
        {
            SaveUserData(MakeTeamMemberData(UID[lp1], CM_Pattern[lp1], CM_BG[lp1], CM_BL[lp1], Grade[lp1], UserName[lp1], RecvClanName, int(Statue[lp1]), int(IsHost[lp1]), 0, UserIP[lp1], IsLookingFor[lp1], ClanLevel[lp1], LevelMarkID[lp1], TitleMarkID[lp1], TeamNum[lp1], Reserved2[lp1], Reserved3[lp1], false, true));
            // [Explicit Continue]
            goto J0x7E9;
        }
        SaveUserData(MakeTeamMemberData(UID[lp1], CM_Pattern[lp1], CM_BG[lp1], CM_BL[lp1], Grade[lp1], UserName[lp1], RecvClanName, int(Statue[lp1]), int(IsHost[lp1]), 0, UserIP[lp1], IsLookingFor[lp1], ClanLevel[lp1], LevelMarkID[lp1], TitleMarkID[lp1], TeamNum[lp1], Reserved2[lp1], Reserved3[lp1], false));
        J0x7E9:

        lp1++;
        // [Loop Continue]
        goto J0x5B;
    }
    RefreshUserList();
    SendPingAndSendHostPoint();
    bAllReady = TPTeamList[0].ACLList.IsAllReady() && TPTeamList[1].ACLList.IsAllReady();
    // End:0x860
    if((IsUserAllReady()) && IsUserCountFull())
    {
        PlayerOwner().ResetKeySleepTime();
    }
    return true;
    //return;    
}

function bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckSendFriendInvite] Result=" $ string(Result));
    // End:0x8B
    if(Result == 0)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(202, BTWindowInviteFriendHK(Controller.TopPage()).FriendName), 5, true);        
    }
    else
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
    }
    return true;
    //return;    
}

function bool WindowRequestFriend_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestFriendHK window;
    local string friName;
    local int friID;

    Log("[BTPageLobby::WindowRequestFriend_OnOK]");
    window = BTWindowRequestFriendHK(Controller.TopPage());
    window.GetTopFriendInfo(friName, friID);
    window.DelData();
    page_Main.TcpChannel.sfReqConfirmFriendInvite(friID, friName, 0);
    // End:0xB8
    if(window.IsExistFrinedList() == true)
    {
        window.UpdateData();        
    }
    else
    {
        Controller.TopPage().FadeOut(false, true);
    }
    return true;
    //return;    
}

function bool WindowRequestFriend_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestFriendHK window;
    local string friName;
    local int friID;

    Log("[BTPageLobby::WindowRequestFriend_OnCancel]");
    window = BTWindowRequestFriendHK(Controller.TopPage());
    window.GetTopFriendInfo(friName, friID);
    window.DelData();
    page_Main.TcpChannel.sfReqConfirmFriendInvite(friID, friName, 1);
    // End:0xBC
    if(window.IsExistFrinedList() == true)
    {
        window.UpdateData();        
    }
    else
    {
        Controller.TopPage().FadeOut(false, true);
    }
    return true;
    //return;    
}

function bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfReqRecvFriendInvite] ReqUserID=" $ string(ReqUserID));
    // End:0x10C
    if(IsGameReadyOrPlaying())
    {
        // End:0xB2
        if(MM.InGamePlaying || MM.bPendingStarted)
        {
            page_Main.TcpChannel.sfReqConfirmFriendInvite(ReqUserID, ReqCharname, 3);
            RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(185, ReqCharname);            
        }
        else
        {
            page_Main.TcpChannel.sfReqConfirmFriendInvite(ReqUserID, ReqCharname, 4);
            RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(105, ReqCharname);
        }
        page_Main.AddChatLog(RecvMsg, 5, true);        
    }
    else
    {
        // End:0x1D7
        if(BTWindowRequestFriendHK(Controller.TopPage()) == none)
        {
            Controller.OpenMenu("GUIWarfareControls.BTWindowRequestFriendHK");
            BTWindowRequestFriendHK(Controller.TopPage()).SetData(ReqCharname, ReqUserID, InviteMsg);
            BTWindowRequestFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowRequestFriend_OnOK;
            BTWindowRequestFriendHK(Controller.TopPage()).__OnCancel__Delegate = WindowRequestFriend_OnCancel;            
        }
        else
        {
            BTWindowRequestFriendHK(Controller.TopPage()).AddData(ReqCharname, ReqUserID, InviteMsg);
        }
    }
    return true;
    //return;    
}

function bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfAckConfirmFriendInvite] Result=" $ string(Result));
    // End:0x8E
    if(Result == 0)
    {
        RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(18);
        page_Main.AddChatLog(RecvMsg, 5, true);
        // End:0x8B
        if((IsGameReadyOrPlaying()) == false)
        {
            RefreshPage();
        }        
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

    Log("[BTPageRoomLobby::rfReqCompleteFriendInvite]");
    // End:0x85
    if(int(IsPermit) == 0)
    {
        RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(22, CharnameToBeInvited);
        page_Main.AddChatLog(RecvMsg, 5, true);
        // End:0x82
        if((IsGameReadyOrPlaying()) == false)
        {
            RefreshPage();
        }        
    }
    else
    {
        // End:0xB0
        if(int(IsPermit) == 3)
        {
            RecvMsg = Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.GetFormatString(381);            
        }
        else
        {
            // End:0xDB
            if(int(IsPermit) == 4)
            {
                RecvMsg = Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.GetFormatString(415);                
            }
            else
            {
                RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(23, CharnameToBeInvited);
            }
        }
        page_Main.AddChatLog(RecvMsg, 5, true);
        // End:0x11A
        if((IsGameReadyOrPlaying()) == false)
        {
        }
    }
    return false;
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
    // End:0xB6
    if(MM.kClanMatch_InChannel)
    {
        // End:0xB3
        if(CheckEnterRoom_InClanChannel(acl.GetClanName(acl.selectIndex)))
        {
            cm.ChangeStateByIndex(2, 0);
        }        
    }
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
    // End:0x1A7
    if(acl.GetClanName(acl.selectIndex) != "")
    {
        cm.ChangeStateByIndex(1, 0);
        // End:0x1A4
        if(MM.kClanName == "")
        {
            cm.ChangeStateByIndex(6, 0);
        }        
    }
    else
    {
        // End:0x1FC
        if((MM.kClanName != "") && (MM.kInClanGrade == 1) || MM.kInClanGrade == 2)
        {
            cm.ChangeStateByIndex(5, 0);
        }
    }
    cm.ChangeStateByIndex(3, 0);
    // End:0x23B
    if(!MM.IsBlockUser(TargetUser))
    {
        cm.ChangeStateByIndex(7, 0);
    }
    //return;    
}

function OnPopupChannel(int ContextMenuIndex, BTACLMessengerChannelHK acl)
{
    // End:0x2F
    if((IsGameReadyOrPlaying()) && ContextMenuIndex != 3)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return;
    }
    switch(ContextMenuIndex)
    {
        // End:0x72
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x3E2
            break;
        // End:0xAE
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x3E2
            break;
        // End:0x133
        case 2:
            // End:0x130
            if((CheckInviteUser(1, 0, acl.GetUserName(acl.selectIndex), acl.GetClanName(acl.selectIndex))) == true)
            {
                page_Main.TcpChannel.sfReqInviteGameRoom(acl.GetUserName(acl.selectIndex));
            }
            // End:0x3E2
            break;
        // End:0x18C
        case 3:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x3E2
            break;
        // End:0x249
        case 4:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteFriendHK");
            BTWindowInviteFriendHK(Controller.TopPage()).SetData(acl.GetUserName(acl.selectIndex), acl.GetUserID(acl.selectIndex));
            BTWindowInviteFriendHK(Controller.TopPage()).__OnOK__Delegate = WindowInviteFriend_OnOK;
            // End:0x3E2
            break;
        // End:0x2E7
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x3E2
            break;
        // End:0x3A2
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x3E2
            break;
        // End:0x3DF
        case 7:
            page_Main.TcpChannel.sfReqAddBlockUserList(acl.GetUserName(acl.selectIndex));
            // End:0x3E2
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
    cm.SetLogOnState(acl.GetLogOnState(acl.selectIndex));
    // End:0x184
    if(acl.GetLogOnState(acl.selectIndex) > 0)
    {
        cm.ChangeStateByIndex(0, 0);
        // End:0xF2
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
            // End:0xF2
            if(MM.kClanName == "")
            {
                cm.ChangeStateByIndex(6, 0);
            }
        }
        cm.ChangeStateByIndex(2, 0);
        // End:0x13B
        if(acl.GetCurPosInt(acl.selectIndex) >= 1)
        {
            cm.ChangeStateByIndex(3, 0);
        }
        // End:0x184
        if(rfFriendPosTime.CheckCondition())
        {
            page_Main.TcpChannel.sfReqFriendPosition(acl.GetUserName(acl.selectIndex), 3);
        }
    }
    // End:0x1FA
    if(MM.IsClanMember() && (MM.kInClanGrade == 1) || MM.kInClanGrade == 2)
    {
        // End:0x1FA
        if(acl.GetClanName(acl.selectIndex) == "")
        {
            cm.ChangeStateByIndex(5, 0);
        }
    }
    cm.ChangeStateByIndex(7, 0);
    //return;    
}

function OnPopupFriend(int ContextMenuIndex, BTACLMessengerFriendHK acl)
{
    // End:0x2F
    if((IsGameReadyOrPlaying()) && ContextMenuIndex != 2)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return;
    }
    switch(ContextMenuIndex)
    {
        // End:0x72
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x4BD
            break;
        // End:0xAE
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x4BD
            break;
        // End:0x107
        case 2:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x4BD
            break;
        // End:0x24C
        case 3:
            // End:0x249
            if(page_Main.CheckMoveToChannel(page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))))
            {
                page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            }
            // End:0x4BD
            break;
        // End:0x2EC
        case 4:
            // End:0x2E9
            if((CheckInviteUser(acl.GetCurPos(acl.selectIndex), acl.GetCurState(acl.selectIndex), acl.GetUserName(acl.selectIndex))) == true)
            {
                page_Main.TcpChannel.sfReqInviteGameRoom(acl.GetUserName(acl.selectIndex));
            }
            // End:0x4BD
            break;
        // End:0x38A
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x4BD
            break;
        // End:0x445
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x4BD
            break;
        // End:0x4BA
        case 7:
            DelFriendsList.Length = 1;
            DelFriendsList[0] = acl.GetUserName(acl.selectIndex);
            Class'GUIWarfareControls.BTWindowDefineSelectHK'.static.ShowInfo(Controller, 23, DelFriendsList[0]);
            BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowDefineSelectHK_23_OnOK;
            // End:0x4BD
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
    cm.SetLogOnState(acl.GetLogOnState(acl.selectIndex));
    // End:0x138
    if(acl.GetLogOnState(acl.selectIndex) > 0)
    {
        cm.ChangeStateByIndex(0, 0);
        cm.ChangeStateByIndex(1, 0);
        cm.ChangeStateByIndex(2, 0);
        // End:0xEF
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
    //return;    
}

function OnPopupClan(int ContextMenuIndex, BTACLMessengerClanHK acl)
{
    // End:0x2F
    if((IsGameReadyOrPlaying()) && ContextMenuIndex != 2)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return;
    }
    switch(ContextMenuIndex)
    {
        // End:0x72
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x276
            break;
        // End:0x9F
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(MM.kClanName);
            // End:0x276
            break;
        // End:0xF8
        case 2:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x276
            break;
        // End:0x1C5
        case 3:
            page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            // End:0x276
            break;
        // End:0x273
        case 4:
            // End:0x270
            if((CheckInviteUser(acl.GetCurPosInt(acl.selectIndex), acl.GetCurState(acl.selectIndex), acl.GetUserName(acl.selectIndex), MatchMaker.kClanName)) == true)
            {
                page_Main.TcpChannel.sfReqInviteGameRoom(acl.GetUserName(acl.selectIndex));
            }
            // End:0x276
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
    if(i < 7)
    {
        cm.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    // End:0x17A
    if(acl.GetCurPos(acl.selectIndex) != 0)
    {
        cm.ChangeStateByIndex(0, 0);
        // End:0xC9
        if(acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(1, 0);
            // End:0xC6
            if(MM.kClanName == "")
            {
                cm.ChangeStateByIndex(6, 0);
            }            
        }
        else
        {
            // End:0x11E
            if((MM.kClanName != "") && (MM.kInClanGrade == 1) || MM.kInClanGrade == 2)
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
    //return;    
}

function OnPopupPCBang(int ContextMenuIndex, BTACLMessengerPCBangHK acl)
{
    // End:0x2F
    if((IsGameReadyOrPlaying()) && ContextMenuIndex != 2)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return;
    }
    switch(ContextMenuIndex)
    {
        // End:0x72
        case 0:
            page_Main.TcpChannel.sfReqDBCharInfo(acl.GetUserName(acl.selectIndex));
            // End:0x3B0
            break;
        // End:0xAE
        case 1:
            page_Main.TcpChannel.sfReqClanInfo(acl.GetClanName(acl.selectIndex));
            // End:0x3B0
            break;
        // End:0x107
        case 2:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
            TPChat.InputBox.FocusFirst(none);
            // End:0x3B0
            break;
        // End:0x24C
        case 3:
            // End:0x249
            if(page_Main.CheckMoveToChannel(page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))))
            {
                page_Main.StartAutoMove(page_Main.SCIList[page_Main.FindServerChannelInfoIndexByServerIP(acl.GetServerIP(acl.selectIndex), acl.GetServerPort(acl.selectIndex), acl.GetChannelNum(acl.selectIndex))].ServerID, acl.GetChannelNum(acl.selectIndex), acl.GetRoomNumber(acl.selectIndex), "");
            }
            // End:0x3B0
            break;
        // End:0x254
        case 4:
            // End:0x3B0
            break;
        // End:0x2F2
        case 5:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanInvite(acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowInviteClan_OnOK;
            // End:0x3B0
            break;
        // End:0x3AD
        case 6:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x3B0
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

function TPTeamList_OnPopup(int ContextMenuIndex, BTACLTeamMemberListHK acl)
{
    Log("[BTPageRoomLobby::TPTeamList_OnPopup] ContextMenuIndex=" $ string(ContextMenuIndex));
    // End:0x73
    if((IsGameReadyOrPlaying()) && ContextMenuIndex != 4)
    {
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 27);
        return;
    }
    switch(ContextMenuIndex)
    {
        // End:0x113
        case 0:
            Log(("page_Main.TcpChannel.sfReqGetUserHostPriorityPoint(" $ string(acl.GetUserID(acl.selectIndex))) $ ")");
            page_Main.TcpChannel.sfReqGetUserHostPriorityPoint(acl.GetUserID(acl.selectIndex));
            // End:0x510
            break;
        // End:0x1E7
        case 1:
            Log(((((("page_Main.TcpChannel.sfReqBanUser(" $ string(MM.kRoomID)) $ ", ") $ string(MM.kUID)) $ ", ") $ string(acl.GetUserID(acl.selectIndex))) $ ")");
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
        // End:0x2BA
        case 4:
            TPChat.SetEditText(("/w " $ acl.GetUserName(acl.selectIndex)) $ " ");
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
        // End:0x4D0
        case 7:
            Controller.OpenMenu("GUIWarfareControls.BTWindowInviteClanHK");
            BTWindowInviteClanHK(Controller.TopPage()).SetClanJoin(acl.GetClanName(acl.selectIndex), acl.GetUserName(acl.selectIndex));
            BTWindowInviteClanHK(Controller.TopPage()).__OnOK__Delegate = BTWindowJoinClan_OK;
            // End:0x510
            break;
        // End:0x50D
        case 8:
            page_Main.TcpChannel.sfReqAddBlockUserList(acl.GetUserName(acl.selectIndex));
            // End:0x510
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function TPTeamList_OnPopupCheck(BTACLTeamMemberListHK acl, BTCMTeamMemberListHK cm)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x33 [Loop If]
    if(i < 9)
    {
        cm.ChangeStateByIndex(i, 1);
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    cm.ChangeStateByIndex(2, 0);
    // End:0x7D
    if(acl.GetClanName(acl.selectIndex) != "")
    {
        cm.ChangeStateByIndex(3, 0);
    }
    // End:0x242
    if(acl.ACLRowList[acl.selectIndex].DataPerColumn[6].IntValue != MM.kUID)
    {
        // End:0xF4
        if(MM.bIsOwner)
        {
            cm.ChangeStateByIndex(0, 0);
            cm.ChangeStateByIndex(1, 0);
        }
        cm.ChangeStateByIndex(4, 0);
        // End:0x14C
        if(TPMessenger.FindFriendFromUserName(acl.GetUserName(acl.selectIndex)) < 0)
        {
            cm.ChangeStateByIndex(5, 0);
        }
        // End:0x1B0
        if(((MM.kClanName != "") && MM.kInClanGrade == 1) && acl.GetClanName(acl.selectIndex) == "")
        {
            cm.ChangeStateByIndex(6, 0);
        }
        // End:0x1FE
        if((MM.kClanName == "") && acl.GetClanName(acl.selectIndex) != "")
        {
            cm.ChangeStateByIndex(7, 0);
        }
        // End:0x242
        if(!MM.IsBlockUser(acl.GetUserName(acl.selectIndex)))
        {
            cm.ChangeStateByIndex(8, 0);
        }
    }
    //return;    
}

function bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, string ErrMsg)
{
    Log((((("[BTPageRoomLobby::rfAckBanUser] Result=" $ string(Result)) $ ", GameNum=") $ string(GameNum)) $ ", BanUID=") $ string(BanUID));
    // End:0x87
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0x10F
    if(BanUID == MM.kUID)
    {
        page_Main.pwm.CreateAndPush(7, "GUIWarfareControls.BTWindowDefineInfoHK", true, 0);
        BTWindowDefineInfoHK(page_Main.pwm.Last(7)).SetContentText_Instance(172);
    }
    return true;
    //return;    
}

function bool rfReqNotifyChangeRoomState(byte RoomState)
{
    Log("[BTPageRoomLobby::rfReqNotifyChangeRoomState] RoomState:" $ string(RoomState));
    CurrentRoomState = int(RoomState);
    // End:0x65
    if(CurrentRoomState == 0)
    {
        bReadyToGame = false;
    }
    ChangeButtonStart();
    return true;
    //return;    
}

function bool rfAckForceDisconnectUDPFromHost(int Result)
{
    Log("[BTPageRoomLobby::rfAckForceDisconnectUDPFromHost] Result:" $ string(Result));
    return true;
    //return;    
}

function bool rfReqRecvForceDisconnectUDPFromHost(int Result)
{
    Log("[BTPageRoomLobby::rfReqRecvForceDisconnectUDPFromHost] Result:" $ string(Result));
    // End:0x72
    if(MM.bIsOwner == false)
    {
        MM.ForceDisconnectUDPConnectionClientSide();        
    }
    else
    {
        Log("BTPageRoomLobby::rfReqRecvForceDisconnectUDPFromHost() host side. error!!");
    }
    return true;
    //return;    
}

function bool BTWindowChangeHost_OnOK(GUIComponent Sender)
{
    Log(((((("page_Main.TcpChannel.sfReqChangeRoomOwner(" $ string(MM.kRoomID)) $ ", ") $ string(MM.kUID)) $ ", ") $ string(NewOwnerID)) $ ")");
    page_Main.TcpChannel.sfReqChangeRoomOwner(MM.kRoomID, MM.kUID, NewOwnerID);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool BTWindowChangeHost_OnCancel(GUIComponent Sender)
{
    Log("[BTPageRoomLobby::BTWindowChangeHost_OnCancel]");
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint)
{
    local wMatchUserInfo UserInfo;
    local string UserName;

    Log((((("[BTPageRoomLobby::rfAckGetUserHostPriorityPoint] Result:" $ string(Result)) $ "/UserID:") $ string(UserID)) $ "/OwnerScore:") $ string(HostPriorityPoint));
    // End:0x80
    if(0 != Result)
    {
        return false;
    }
    // End:0x14F
    if(HostPriorityPoint < MinWaringHostPoint)
    {
        Log(((((((("page_Main.TcpChannel.sfReqChangeRoomOwner(" $ string(MM.kRoomID)) $ ", ") $ string(MM.kUID)) $ ", ") $ string(UserID)) $ ")") $ "/HostPoint:") $ string(HostPriorityPoint));
        page_Main.TcpChannel.sfReqChangeRoomOwner(MM.kRoomID, MM.kUID, UserID);        
    }
    else
    {
        UserInfo = MM.GetUserInfoByUID(UserID);
        UserName = UserInfo.UserName;
        Class'GUIWarfareControls.BTWindowDefineSelectHK'.static.ShowInfo(Controller, 21, UserName);
        NewOwnerID = UserID;
        BTWindowDefineSelectHK(Controller.TopPage()).__OnOK__Delegate = BTWindowChangeHost_OnOK;
        BTWindowDefineSelectHK(Controller.TopPage()).__OnCancel__Delegate = BTWindowChangeHost_OnCancel;
    }
    return true;
    //return;    
}

function bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    MM.CheckHolePunchingResult(Result, Phrase, InterventionUserID, Intervention, FailedUserIDs);
    return true;
    //return;    
}

function bool rfAckNotifyHostBlocking(int Result, byte Blocking)
{
    Log((("BTPageRoomLobby::rfAckNotifyHostBlocking() Result=" $ string(Result)) $ " Blocking=") $ string(Blocking));
    // End:0x77
    if(Result == 0)
    {
        MM.SetHostBlocking(bool(Blocking));
    }
    return true;
    //return;    
}

function bool rfAckGetIsHostBlocking(int Result, byte Blocking)
{
    Log((("BTPageRoomLobby::rfAckGetIsHostBlocking() Result=" $ string(Result)) $ " Blocking=") $ string(Blocking));
    MM.SetHostBlocking(bool(Blocking));
    switch(MyAction)
    {
        // End:0xBD
        case 1:
            // End:0x8D
            if(Result == 0)
            {
                StartNetworkChecking(0, true);                
            }
            else
            {
                CloseNetworkCheckingWindow();
                bReadyToGame = false;
                ChangeButtonStart();
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
            // End:0x115
            break;
        // End:0xFFFF
        default:
            Log("BTPageRoomLobby::rfAckGetIsHostBlocking() MyAction is Invalid. MyAction=" $ string(MyAction));
            break;
    }
    MyAction = 0;
    return true;
    //return;    
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckDupCheckClanName]");
    // End:0x97
    if(Result == 0)
    {
        BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = true;
        BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck.DisableMe();
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 50);        
    }
    else
    {
        // End:0x103
        if(Result == 127)
        {
            BTWindowCreateClanHK(Controller.TopPage()).bCheckDupName = false;
            BTWindowCreateClanHK(Controller.TopPage()).ButtonOverlapCheck.EnableMe();
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
    Log("[BTPageRoomLobby::rfAckCreateClan]");
    // End:0x248
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
        GameMgr.AddInstanceItemByParameter(17019, ItemIdx, 0, int(13), 1, 100000, 0, 0, StackCount);
        GameMgr.UpdateItemList(GameMgr);
        page_Main.TcpChannel.sfReqClanUserList(page_Main.SaveClanName);
        Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 53);
        BTWindowDefineInfoHK(Controller.TopPage()).__OnOK__Delegate = MoveToClanPage_OnOK;
        page_Main.TcpChannel.sfReqNotifyMyCharInfoToRoomUser();        
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
    Controller.CloseMenu(false);
    // End:0x8C
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

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageRoomLobby::rfAckDBCharInfo]");
    // End:0x212
    if(Controller.TopPage() == self)
    {
        // End:0x9F
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
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetData(CharName, ClanName, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo);
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetClanInfo(ClanName, CM_Pattern, CM_BG, CM_BL, ClanLevel);
        BTWindowUserDetailInfoHK(Controller.TopPage()).SetSelfIntro(ClanPersonIntro);
        // End:0x1C8
        if((ClanName == "none") || ClanName == "")
        {
            BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.DisableMe();            
        }
        else
        {
            BTWindowUserDetailInfoHK(Controller.TopPage()).ButtonOK.EnableMe();
            BTWindowUserDetailInfoHK(Controller.TopPage()).__OnOK__Delegate = BTWindowUserDetailInfoHK_OnClanInfo;
        }
    }
    return true;
    //return;    
}

function bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    BTWindowUserPersonalInfo(Controller.TopPage()).UpdateCharDetailInfo(MaxSerial, MaxScore, MaxKill, MaxAssist, Serial3, Serial5, Serial7, Serial10, Serial15, AR, SMG, SR, SW, Melee, Grenade, FlashBang, Foot, AT4, MG, Fire, RPG7, TimeBomb, IcendiaryBomb, ClusterBomb, ByChopper, Artillery, KillChopper, FirstKill, LastKill, AllKill, Dominate, InstallBomb, DefuseBomb);
    return true;
    //return;    
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    Log("[BTPageRoomLobby::rfAckClanCharPersonelIntro]");
    // End:0x57
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    return true;
    //return;    
}

function bool rfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    return true;
    //return;    
}

function bool BTWindowUserDetailInfoHK_OnClanInfo(GUIComponent Sender)
{
    local string ClanName;

    ClanName = BTWindowUserDetailInfoHK(Controller.TopPage()).ClanName;
    Controller.CloseMenu(true);
    TcpChannel.sfReqClanInfo(ClanName);
    return true;
    //return;    
}

function bool BTWindowUserPersonalInfo_OnClanInfo(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    TcpChannel.sfReqClanInfo(MM.kClanName);
    return true;
    //return;    
}

function UpdateRecv_ClanInfo(BTNetMainMenu MainMenu)
{
    local export editinline BTWindowRequestClanHK BTWindow;

    Log("[BTPageRoomLobby::UpdateRecv_ClanInfo]");
    // End:0x8B
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

function bool rfAckInviteClan(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckInviteClan]");
    // End:0x4C
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 41);
    return true;
    //return;    
}

function bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    Log("[BTPageRoomLobby::rfAckJoinClan]");
    // End:0xB6
    if(Result != 0)
    {
        // End:0x99
        if(Result == 537)
        {
            // End:0x7B
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
        return true;
    }
    // End:0x1AF
    if(MM.InGamePlaying)
    {
        // End:0x189
        if((SpecificCharName != "") && SpecificCharName != RealRecvCharName)
        {
            // End:0x122
            if(int(RealRecvCharClanGrade) == 1)
            {
                page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(133, SpecificCharName, RealRecvCharName), 5, true);                
            }
            else
            {
                // End:0x160
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
        // End:0x256
        if((SpecificCharName != "") && SpecificCharName != RealRecvCharName)
        {
            // End:0x1FC
            if(int(RealRecvCharClanGrade) == 1)
            {
                Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 133, SpecificCharName, RealRecvCharName);                
            }
            else
            {
                // End:0x22D
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

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfReqRecvClanInvite]");
    // End:0x97
    if(IsGameReadyOrPlaying())
    {
        page_Main.TcpChannel.sfAckRecvClanInvite(InviterUserDBID, InviterCharname, InviteMsg, ClanName, 3);
        RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(106, InviterCharname);
        page_Main.AddChatLog(RecvMsg, 5, true);        
    }
    else
    {
        bClanInviteState = true;
        return false;
    }
    return true;
    //return;    
}

function bool BTWindowDefineSelectHK_23_OnOK(GUIComponent Sender)
{
    page_Main.TcpChannel.sfReqDeleteFriend(DelFriendsList);
    Controller.CloseMenu(false);
    return true;
    //return;    
}

function bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    local string Message;

    Log("[BTPageRoomLobby::rfAckInviteClanResult]");
    // End:0x6A
    if(int(Permit) == 0)
    {
        Message = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(43, CharName);
        // End:0x67
        if((IsGameReadyOrPlaying()) == false)
        {
            RefreshPage();
        }        
    }
    else
    {
        // End:0x96
        if(int(Permit) == 1)
        {
            Message = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(138, CharName);            
        }
        else
        {
            // End:0xC3
            if(int(Permit) == 2)
            {
                Message = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(44, CharName);                
            }
            else
            {
                // End:0xED
                if(int(Permit) == 3)
                {
                    Message = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(145, CharName);
                }
            }
        }
    }
    page_Main.AddChatLog(Message, 5, true);
    return true;
    //return;    
}

function bool IsGameReadyOrPlaying()
{
    return (MM.InGamePlaying || bReadyToGame) || MM.bPendingStarted;
    //return;    
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckRecvClanInviteResult]");
    // End:0x56
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqNotifyMyCharInfoToRoomUser();
    // End:0x80
    if((IsGameReadyOrPlaying()) == false)
    {
        RefreshPage();
    }
    return true;
    //return;    
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    local export editinline BTWindowFindClanHK BTWindow;

    Log("[BTPageRoomLobby::rfAckSearchClan]");
    // End:0x4C
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    BTWindow = BTWindowFindClanHK(Controller.TopPage());
    // End:0xE0
    if(BTWindow != none)
    {
        BTWindow.SetPageLimit(1, TotalPage);
        BTWindow.SetData(TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    }
    return true;
    //return;    
}

function bool rfAckNotifyNewClanMember(string ClanName, string CharName)
{
    local string Message;

    Log("[BTPageRoomLobby::rfAckNotifyNewClanMember]");
    Message = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(54, ClanName, CharName);
    page_Main.AddChatLog(Message, 5, true);
    // End:0x79
    if((IsGameReadyOrPlaying()) == false)
    {
        RefreshPage();
    }
    return true;
    //return;    
}

function bool rfAckNotifyClanSecession(string ClanName, string CharName)
{
    local MessageItem msgItem;
    local string Message;

    Log("[BTPageRoomLobby::rfAckNotifyClanSecession]");
    Message = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(59, CharName, ClanName);
    page_Main.AddChatLog(Message, 5, true);
    // End:0xAB
    if(MM.InGamePlaying)
    {
        msgItem = GetConsole().ConstructMessageItem(Message, 6);
        GetConsole().AddMessageItem(msgItem);
    }
    return true;
    //return;    
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
        RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(107, CharName);
        page_Main.AddChatLog(RecvMsg, 5, true);        
    }
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
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnOK(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageRoomLobby::BTWindowRequestApprovalClanHK_OnOK]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 0);
    Controller.CloseMenu(true);
    // End:0xB9
    if((IsGameReadyOrPlaying()) == false)
    {
        RefreshPage();
    }
    return true;
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnCancel(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageRoomLobby::BTWindowRequestApprovalClanHK_OnCancel]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 2);
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function bool BTWindowRequestApprovalClanHK_OnSuspend(GUIComponent Sender)
{
    local export editinline BTWindowRequestApprovalClanHK BTWindow;

    Log("[BTPageRoomLobby::BTWindowRequestApprovalClanHK_OnSuspend]");
    BTWindow = BTWindowRequestApprovalClanHK(Controller.TopPage());
    page_Main.TcpChannel.sfAckRecvJoinClan(BTWindow.ReqJoinUserIdx, BTWindow.CharName, BTWindow.InviteMsg, 1);
    Controller.CloseMenu(true);
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 136);
    return true;
    //return;    
}

function bool rfAckJoinClanResult(string CharName, byte Permit, string PermitCharName)
{
    local string Message;

    Log("[BTPageRoomLobby::rfAckJoinClanResult]");
    // End:0x68
    if(int(Permit) == 0)
    {
        Message = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(43, CharName);
        // End:0x65
        if((IsGameReadyOrPlaying()) == false)
        {
            RefreshPage();
        }        
    }
    else
    {
        // End:0x94
        if(int(Permit) == 1)
        {
            Message = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(137, CharName);            
        }
        else
        {
            // End:0xC1
            if(int(Permit) == 2)
            {
                Message = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(44, CharName);                
            }
            else
            {
                // End:0xEB
                if(int(Permit) == 3)
                {
                    Message = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(145, PermitCharName);
                }
            }
        }
    }
    page_Main.AddChatLog(Message, 5, true);
    return true;
    //return;    
}

function bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    Log("[BTPageRoomLobby::rfAckRecvJoinClanResult]");
    // End:0x54
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    page_Main.TcpChannel.sfReqNotifyMyCharInfoToRoomUser();
    // End:0x7E
    if((IsGameReadyOrPlaying()) == false)
    {
        RefreshPage();
    }
    return true;
    //return;    
}

function bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    local int i;

    Log("[BTPageRoomLobby::rfReqNotifyLevelUp]");
    // End:0x17D
    if(LevelUpUserID == MM.kUID)
    {
        page_Main.LevelUpInfo.bLevelUp = true;
        page_Main.LevelUpInfo.bCompleteLevelUp = false;
        page_Main.LevelUpInfo.Level = Level;
        page_Main.LevelUpInfo.Exp = Exp;
        page_Main.LevelUpInfo.ItemID.Length = ItemID.Length;
        i = 0;
        J0xC1:

        // End:0x10E [Loop If]
        if(i < page_Main.LevelUpInfo.ItemID.Length)
        {
            page_Main.LevelUpInfo.ItemID[i] = ItemID[i];
            i++;
            // [Loop Continue]
            goto J0xC1;
        }
        page_Main.LevelUpInfo.PartID.Length = PartID.Length;
        i = 0;
        J0x130:

        // End:0x17D [Loop If]
        if(i < page_Main.LevelUpInfo.PartID.Length)
        {
            page_Main.LevelUpInfo.PartID[i] = PartID[i];
            i++;
            // [Loop Continue]
            goto J0x130;
        }
    }
    return true;
    //return;    
}

function bool rfAckAcquirePromotionItems(int UID, int Result, string ErrMsg, array<BtrDouble> ItemUniqueID, array<int> ItemIDs, array<int> PartIDs)
{
    local int i;
    local bool bRecvPoint, bRecvItem;

    Log("[BTPageRoomLobby::rfAckAcquirePromotionItems]");
    // End:0x8B
    if(Result != 0)
    {
        // End:0x70
        if((UID != MM.kUID) && page_Main.LevelUpInfo.bCompleteLevelUp == false)
        {
        }
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xA5
    if(UID != MM.kUID)
    {
        return true;
    }
    page_Main.LevelUpInfo.bCompleteLevelUp = true;
    i = 0;
    J0xC2:

    // End:0x11B [Loop If]
    if(i < ItemUniqueID.Length)
    {
        // End:0x109
        if(ItemIDs[i] == 0)
        {
            MM.kPoint += PartIDs[i];
            bRecvPoint = true;
            // [Explicit Continue]
            goto J0x111;
        }
        bRecvItem = true;
        J0x111:

        i++;
        // [Loop Continue]
        goto J0xC2;
    }
    // End:0x13C
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
    //return;    
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfAckChatWispher]");
    // End:0x69
    if(Result == 252)
    {
        RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(76, ToCharName);
        page_Main.AddChatLog(RecvMsg, 5, true);        
    }
    else
    {
        // End:0xAB
        if(Result == 182)
        {
            RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(77, ToCharName);
            page_Main.AddChatLog(RecvMsg, 5, true);            
        }
        else
        {
            // End:0xCF
            if(Result != 0)
            {
                Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, array<int> UID, array<string> CharName, array<int> UserLevel, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<byte> IsLookForClan, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int i;

    Log("[BTPageRoomLobby::rfAckChannelUserList]");
    TotalChannelUserCount = TotalCount;
    // End:0x3CA
    if(Result == 0)
    {
        i = 0;
        J0x48:

        // End:0x277 [Loop If]
        if(i < UID.Length)
        {
            GameMgr.cmm.AddClanMark(ClanName[i], ClanPattern[i], ClanBG[i], ClanBL[i], true, int(IsLookForClan[i]) > 0);
            GameMgr.cmm.SetClanLevel(ClanName[i], ClanLevel[i]);
            // End:0x1C1
            if(TPMessenger.ACLMsg[0].ACLRowList.Length > (i + StartIndex))
            {
                TPMessenger.ReplaceChannelUser(i + StartIndex, ClanPattern[i], ClanBG[i], ClanBL[i], ClanName[i], UserLevel[i], CharName[i], UID[i], 0, 0, 0, IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
                // [Explicit Continue]
                goto J0x26D;
            }
            TPMessenger.AddChannelUser(ClanPattern[i], ClanBG[i], ClanBL[i], ClanName[i], UserLevel[i], CharName[i], UID[i], 0, 0, 0, IsLookForClan[i], ClanLevel[i], LevelMarkID[i], TitleMarkID[i], Reserved1[i], Reserved2[i], Reserved3[i]);
            J0x26D:

            i++;
            // [Loop Continue]
            goto J0x48;
        }
        // End:0x2DB
        if(TPMessenger.ACLMsg[0].ACLRowList.Length > TotalCount)
        {
            TPMessenger.ACLMsg[0].RemoveRowArray(TotalCount, TPMessenger.ACLMsg[0].ACLRowList.Length - TotalCount);
        }
        // End:0x3C7
        if(Controller.ViewportOwner.Actor.Level.GetIsServiceBuild() == false)
        {
            TPChat.AddChatHistory(2, (((((("TotalCount=" $ string(TotalCount)) $ " ACL.Top=") $ string(TPMessenger.ACLMsg[0].MultiColumnList.Top)) $ " ACL.ACLRowList.Length=") $ string(TPMessenger.ACLMsg[0].ACLRowList.Length)) $ " UID.Length=") $ string(UID.Length), Class'GUIWarfareControls.BTUIColorPoolHK'.static.ChatSystem());
        }        
    }
    else
    {
        Log("[BTPageRoomLobby::rfAckChannelUserList] Error Result=" $ string(Result));
    }
    return true;
    //return;    
}

function bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    Log("[BTPageRoomLobby::rfAckDeleteFriend]");
    // End:0x4E
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
    local string RecvMsg;

    Log("[BTPageRoomLobby::rfReqRecvDeleteFriend]");
    // End:0x52
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    RecvMsg = Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(75, FromCharName);
    page_Main.AddChatLog(RecvMsg, 5, true);
    page_Main.TcpChannel.sfReqFriendList();
    return true;
    //return;    
}

function bool rfReqNotifyDisconnectHostInLoading(int Result, string ErrMsg, int HostID)
{
    Log("[BTPageRoomLobby::rfReqNotifyDisconnectHostInLoading]");
    Log((((("[BTPageRoomLobby::rfReqNotifyDisconnectHostInLoading] MM.bPendingStarted=" $ string(MM.bPendingStarted)) $ " MM.InGamePlaying=") $ string(MM.InGamePlaying)) $ " MM.bSendedLoadingFailed=") $ string(MM.bSendedLoadingFailed));
    // End:0x17C
    if(MM.bSendedLoadingFailed == false)
    {
        // End:0x14D
        if(MM.bPendingStarted == true)
        {
            page_Main.TcpChannel.sfReqRemoveCheckTeamBalanceList();
            FailedNetworkChecking(GetErrMsg(5080), 5080);            
        }
        else
        {
            // End:0x17C
            if(MM.InGamePlaying == true)
            {
                MM.ForceDisconnectGameWithErrMessage(GetErrMsg(5072));
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckNotifyMyCharInfoToRoomUser(int Result, string ErrMsg, int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost, string UserIP, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor)
{
    local int i, Index;
    local string RecvClanName;

    Log("[BTPageRoomLobby::rfAckNotifyMyCharInfoToRoomUser] UserName=" $ UserName);
    // End:0x6D
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    i = 0;
    J0x74:

    // End:0x413 [Loop If]
    if(i < MM.UserInfos.Length)
    {
        // End:0x409
        if(MM.UserInfos[i].UID == UID)
        {
            MM.UserInfos[i].UID = UID;
            MM.UserInfos[i].UserName = UserName;
            MM.UserInfos[i].Grade = Grade;
            MM.UserInfos[i].IsHost = int(IsHost) == 0;
            MM.UserInfos[i].UserIP = UserIP;
            MM.UserInfos[i].TeamNum = TeamNum;
            // End:0x1B5
            if((ClanName == "") || ClanName == "none")
            {
                RecvClanName = "";                
            }
            else
            {
                RecvClanName = ClanName;
            }
            Log((((((("RecvClanName=" $ RecvClanName) $ ", ClanMark=") $ string(CM_Pattern)) $ ", ClanBG=") $ string(CM_BG)) $ ", CM_BL=") $ string(CM_BL));
            MM.UserInfos[i].ClanName = RecvClanName;
            MM.UserInfos[i].ClanMark = CM_Pattern;
            MM.UserInfos[i].ClanBG = CM_BG;
            MM.UserInfos[i].ClanBL = CM_BL;
            // End:0x34D
            if(UID == MM.kUID)
            {
                MM.My_iTeam = TeamNum;
                MM.kTeamID = TeamNum;
                ChangeButtonStart();
                TPTeamList[TeamNum].ACLList.ChangeTeamMember(UID, CM_Pattern, CM_BG, CM_BL, Grade, UserName, RecvClanName, int(Statue), int(IsHost), 3, UserIP, IsLookFor, 0, true);                
            }
            else
            {
                TPTeamList[TeamNum].ACLList.ChangeTeamMember(UID, CM_Pattern, CM_BG, CM_BL, Grade, UserName, RecvClanName, int(Statue), int(IsHost), 3, UserIP, IsLookFor, 0);
                Index = TPTeamList[TeamNum].ACLList.FindTeamMemberIndex(UID);
                // End:0x406
                if(Index >= 0)
                {
                    SetFriendlyUser(TPTeamList[TeamNum].ACLList.ACLRowList[Index]);
                }
            }
            // [Explicit Break]
            goto J0x413;
        }
        i++;
        // [Loop Continue]
        goto J0x74;
    }
    J0x413:

    SendPingAndSendHostPoint();
    return true;
    //return;    
}

function bool rfAckRegisterMyUdpInfo(int Result, string ErrMsg)
{
    // End:0x0E
    if(Result == 0)
    {        
    }
    else
    {
        // End:0x3A
        if(Result == 422)
        {
            MM.ForceDisconnectGameWithErrMessage(GetErrMsg(5083));            
        }
        else
        {
            MM.ForceDisconnectGameWithErrMessage(GetErrMsg(5084));
        }
    }
    return true;
    //return;    
}

function bool rfAckStartHolePunching(int Result, string ErrMsg, int GameType, int ReqStartUserID)
{
    // End:0x5A
    if(Result != 0)
    {
        Log(("[BTPageRoomLobby::rfAckStartHolePunching] Result is " $ string(Result)) $ " error!!");
        return true;
    }
    // End:0x8B
    if(MM.bIsOwner == true)
    {
        MM.StartHolePunchingHost(GameType, ReqStartUserID);        
    }
    else
    {
        MM.StartHolePunchingClient(GameType, ReqStartUserID);
    }
    return true;
    //return;    
}

function bool rfReqRecvForceFailedClientLoading(int ErrCode)
{
    // End:0x78
    if(MM.bIsOwner == true)
    {
        Log("[BTPageRoomLobby::rfReqRecvForceFailedClientLoading] this is Host!! error!! ErrCode=" $ string(ErrCode));
        return true;
    }
    // End:0xC1
    if((MM.bPendingStarted == true) || MM.InGamePlaying == true)
    {
        MM.ForceDisconnectGameWithErrMessage(GetErrMsg(ErrCode));        
    }
    else
    {
        Log((((("[BTPageRoomLobby::rfReqRecvForceFailedClientLoading] bPendingStarted=" $ string(MM.bPendingStarted)) $ " InGamePlaying=") $ string(MM.InGamePlaying)) $ " error!! ErrCode=") $ string(ErrCode));
    }
    return true;
    //return;    
}

function int FindTeamNumInArray(array<int> UserID, array<int> TeamNum, int FindUserID)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x42 [Loop If]
    if(i < UserID.Length)
    {
        // End:0x38
        if(UserID[i] == FindUserID)
        {
            return TeamNum[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function bool rfAckAutoChangedTeamUserList(array<int> UserID, array<int> TeamNum)
{
    local int i, j, PrevTeam;
    local wMatchUserInfo mui;
    local BTAutoColumnListDataHK Data;
    local bool IsGM;

    Log(("[BTPageRoomLobby::rfAckAutoChangedTeamUserList]" $ "UserID.Length=") $ string(UserID.Length));
    IsGM = false;
    i = 0;
    J0x5E:

    // End:0x33A [Loop If]
    if(i < MM.UserInfos.Length)
    {
        mui = MM.UserInfos[i];
        j = 0;
        J0x98:

        // End:0x13F [Loop If]
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
            j++;
            // [Loop Continue]
            goto J0x98;
        }
        // End:0x14B
        if(IsGM)
        {
            // [Explicit Continue]
            goto J0x330;
        }
        mui.TeamNum = FindTeamNumInArray(UserID, TeamNum, mui.UID);
        // End:0x25B
        if(mui.UID == MM.kUID)
        {
            MM.My_iTeam = mui.TeamNum;
            MM.kTeamID = mui.TeamNum;
            ChangeButtonStart();
            // End:0x20E
            if((float(MM.My_iTeam) % float(2)) == float(0))
            {
                currentBGM = "bgm_af_theme";                
            }
            else
            {
                currentBGM = "bgm_rsa_theme";
            }
            page_Main.LastMainPageBGM = currentBGM;
            PlayerOwner().Player.Console.SetOneBGM(currentBGM);
        }
        PrevTeam = 0;
        Data = TPTeamList[PrevTeam].ACLList.FindTeamMember(mui.UID);
        // End:0x2D8
        if(Data == none)
        {
            PrevTeam = 1;
            Data = TPTeamList[PrevTeam].ACLList.FindTeamMember(mui.UID);
        }
        TPTeamList[mui.TeamNum].ACLList.AddRow(Data);
        TPTeamList[PrevTeam].ACLList.RemoveTeamMemberByUID(mui.UID);
        J0x330:

        i++;
        // [Loop Continue]
        goto J0x5E;
    }
    return true;
    //return;    
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    PlayerOwner().Level.Game.rfAckGetBotID(Result, RequestedAFCount, RequestedRSACount, AFBotID, RSABotID);
    return true;
    //return;    
}

function bool ButtonTemp_OnClick(GUIComponent Sender)
{
    page_Main.TcpChannel.sfReqCheckEquipedWeaponDurability();
    return true;
    //return;    
}

function bool rfAckCheckEquipedWeaponDurability(int Result, array<BtrDouble> ItemUniqueID, array<int> ItemSlotNum)
{
    local int i, Priority;
    local wItemBoxHK ItemInfo;
    local wItemBoxInstanceHK instanceInfo;

    Log("[BTPageRoomLobby::rfAckCheckEquipedWeaponDurability]");
    PlayerOwner().dblog("== rfAckCheckEquipedWeaponDurability =====================");
    Priority = 0;
    i = 0;
    J0x8F:

    // End:0x1B3 [Loop If]
    if(i < ItemSlotNum.Length)
    {
        instanceInfo = GameMgr.FindInstanceItem(ItemUniqueID[i]);
        ItemInfo = GameMgr.FindUIItem(instanceInfo.ItemID);
        PlayerOwner().dblog((ItemInfo.ItemName $ " ItemSlotNum=") $ string(ItemSlotNum[i]));
        // End:0x196
        if(ItemSlotNum[i] == 0)
        {
            instanceInfo = GameMgr.FindInstanceItem(ItemUniqueID[i]);
            // End:0x18B
            if((instanceInfo.ItemID == 2000) || instanceInfo.ItemID == 1010)
            {
                Priority = 3;
                // [Explicit Break]
                goto J0x1B3;
            }
            Priority = 2;
            // [Explicit Continue]
            goto J0x1A9;
        }
        // End:0x1A9
        if(Priority < 2)
        {
            Priority = 1;
        }
        J0x1A9:

        i++;
        // [Loop Continue]
        goto J0x8F;
    }
    J0x1B3:

    // End:0x1C2
    if(Priority == 3)
    {        
    }
    else
    {
        // End:0x1D1
        if(Priority == 2)
        {            
        }
        else
        {
            // End:0x1DF
            if(Priority == 1)
            {                
            }
        }
    }
    PlayerOwner().dblog("==========================================================");
    PlayerOwner().dblog("Priority=" $ string(Priority));
    PlayerOwner().dblog("==========================================================");
    return true;
    //return;    
}

function bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    Log((("[BTPageRoomLobby::rfAckChangedRoomTitle_FromGM] RoomNumber=" $ string(RoomNumber)) $ " NewRoomTitle=") $ NewRoomTitle);
    // End:0x87
    if(Result != 0)
    {
        Class'GUIWarfareControls.BTWindowErrorDefineHK'.static.ShowError(Controller, Result);
        return true;
    }
    // End:0xD1
    if(MM.kRoomID == RoomNumber)
    {
        MM.szRoomName = NewRoomTitle;
        MM.UpdateGameRoomInfo(MM);
        UpdateRoomInfoByMatchMaker();
    }
    return true;
    //return;    
}

function bool rfAckRoomUserPingInfo(array<int> UnqueID, array<int> Ping, int HostScore)
{
    local int i;

    Log((((("[BTPageRoomLobby::sfAckRoomUserPingInfo] " $ string(UnqueID.Length)) $ ",") $ string(Ping.Length)) $ ",") $ string(HostScore));
    i = 0;
    J0x5B:

    // End:0xDB [Loop If]
    if(i < UnqueID.Length)
    {
        // End:0xD1
        if(TPTeamList[0].ACLList.ChangePingInfo(UnqueID[i], Ping[i]) == false)
        {
            TPTeamList[1].ACLList.ChangePingInfo(UnqueID[i], Ping[i]);
        }
        ++i;
        // [Loop Continue]
        goto J0x5B;
    }
    // End:0x18C
    if(bShowHostWarning && HostScore >= MinWaringHostPoint)
    {
        i = 0;
        J0xFC:

        // End:0x18C [Loop If]
        if(i < MM.UserInfos.Length)
        {
            // End:0x182
            if(MM.UserInfos[i].IsHost)
            {
                page_Main.AddChatLog((strLowHostScoreWarning[0] $ MM.UserInfos[i].UserName) $ strLowHostScoreWarning[1], 5, true);
                bShowHostWarning = false;
                // [Explicit Break]
                goto J0x18C;
            }
            ++i;
            // [Loop Continue]
            goto J0xFC;
        }
    }
    J0x18C:

    return true;
    //return;    
}

function OnReceivedPing(wMatchMaker MM, string fromAddr, int msec)
{
    local int nIdx, i;

    nIdx = MM.ReceivedPing(fromAddr, msec);
    // End:0x1C8
    if(nIdx >= 0)
    {
        // End:0xD9
        if(IsGameReadyOrPlaying())
        {
            ReceivedPingID.Length = 0;
            ReceivedPingValue.Length = 0;
            i = 0;
            J0x4A:

            // End:0xBF [Loop If]
            if(i < MM.UserInfos.Length)
            {
                ReceivedPingID[i] = MM.UserInfos[i].UID;
                ReceivedPingValue[i] = MM.UserInfos[i].iReceivedPing;
                ++i;
                // [Loop Continue]
                goto J0x4A;
            }
            ReceivedPingValue[nIdx] = msec;
            sfReqRoomUserPingInfo();            
        }
        else
        {
            // End:0x157
            if(TPTeamList[0].ACLList.ChangePingInfo(MM.UserInfos[nIdx].UID, msec) == false)
            {
                TPTeamList[1].ACLList.ChangePingInfo(MM.UserInfos[nIdx].UID, msec);
            }
            // End:0x18C
            if(MM.UserInfos[nIdx].IsHost)
            {
                MM.kServerPing = msec;
            }
            ReceivedPingID[ReceivedPingID.Length] = MM.UserInfos[nIdx].UID;
            ReceivedPingValue[ReceivedPingValue.Length] = msec;
        }
    }
    //return;    
}

function sfReqRoomUserPingInfo()
{
    local int HostScore;

    HostScore = MM.CalculateHostPoint(false);
    // End:0xB8
    if((!IsGameReadyOrPlaying() && bShowHostWarning) && HostScore >= MinWaringHostPoint)
    {
        // End:0x76
        if(MM.bShowMessageHostUnsuitableness)
        {
            Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(Controller, 78, MM.kUserName);            
        }
        else
        {
            page_Main.AddChatLog(MM.kUserName $ MessageHostChangeEnable[0], 5, true);
        }
        MM.bShowMessageHostUnsuitableness = false;
        bShowHostWarning = false;
    }
    // End:0x14F
    if(ReceivedPingID.Length > 0)
    {
        Log((((("[BTPageRoomLobby::sfReqRoomUserPingInfo] " $ string(ReceivedPingID.Length)) $ ",") $ string(ReceivedPingValue.Length)) $ ",") $ string(HostScore));
        page_Main.TcpChannel.sfReqRoomUserPingInfo(ReceivedPingID, ReceivedPingValue, HostScore);
        ReceivedPingID.Length = 0;
        ReceivedPingValue.Length = 0;
    }
    //return;    
}

function SendPingToAll()
{
    local int i;

    i = 0;
    J0x07:

    // End:0xAA [Loop If]
    if(i < MM.UserInfos.Length)
    {
        // End:0x6B
        if(MM.UserInfos[i].UID == MM.kUID)
        {
            page_Main.rMM.SendPingToChannelServer();
            // [Explicit Continue]
            goto J0xA0;
        }
        page_Main.rMM.SendPingToOtherUser(MM.UserInfos[i].UserIP);
        J0xA0:

        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function UserPingRefresh()
{
    // End:0x21
    if(MM.bIsOwner)
    {
        sfReqRoomUserPingInfo();
        SendPingToAll();        
    }
    else
    {
        KillTimer('UserPingRefresh');
    }
    //return;    
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    Log("[BTPageRoomLobby::rfAckNotifyAdjustClanMemberGrade]");
    // End:0x95
    if(MM.kUserName == CharName)
    {
        MM.kInClanGrade = int(CharGrade);
        MM.UpdateCharInfo(MM);
        MM.UpdateClanInfo(MM);
    }
    // End:0xDB
    if(int(CharGrade) != 5)
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(55, CharName, strClanGrade[int(CharGrade)]), 5, true);        
    }
    else
    {
        page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(58, CharName), 5, true);
    }
    // End:0x115
    if((IsGameReadyOrPlaying()) == false)
    {
        RefreshPage();
    }
    return true;
    //return;    
}

function bool rfReqInGameRoomUserInfoChanged()
{
    Log("[BTPageRoomLobby::rfReqInGameRoomUserInfoChanged]");
    // End:0xB2
    if(MM.InGamePlaying == false)
    {
        Log(("page_Main.TcpChannel.sfReqRoomUserList(" $ string(MM.kRoomID)) $ ")");
        page_Main.TcpChannel.sfReqRoomUserList(MM.kRoomID);
    }
    return true;
    //return;    
}

function bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel)
{
    local int i;

    Log((("[BTPageRoomLobby::rfReqInGameRoomUserClanLevelChanged] UID = " $ string(UserID)) $ ", ClanLevel=") $ string(ClanLevel));
    // End:0x129
    if(MM.InGamePlaying == false)
    {
        i = 0;
        J0x7F:

        // End:0x115 [Loop If]
        if(i < MM.UserInfos.Length)
        {
            // End:0x10B
            if(MM.UserInfos[i].UID == UserID)
            {
                Log("SetClanLevel");
                GameMgr.cmm.SetClanLevel(MM.UserInfos[i].ClanName, ClanLevel);
                return true;
            }
            i++;
            // [Loop Continue]
            goto J0x7F;
        }
        Log("Can not Find UID");
    }
    return true;
    //return;    
}

function bool rfAckNotifyUpdateCharInfo_LevelMark(string CharName, int LevelMarkID)
{
    local int i;

    Log((("[BTPageRoomLobby::rfAckNotifyUpdateCharInfo_LevelMark] CharName = " $ CharName) $ ", LevelMarkID=") $ string(LevelMarkID));
    i = 0;
    J0x6F:

    // End:0xB6 [Loop If]
    if(i < 2)
    {
        // End:0xAC
        if(TPTeamList[i].ACLList.ChangeLevelMarkID(CharName, LevelMarkID) == true)
        {
            // [Explicit Break]
            goto J0xB6;
        }
        ++i;
        // [Loop Continue]
        goto J0x6F;
    }
    J0xB6:

    return true;
    //return;    
}

function bool rfAckFriendPosition(int Result, string TargetCharName, byte ServerType, string fServername, string fServerShortName, string fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, string ChannelNickName, int GameRoomNum)
{
    local export editinline BTCMMessengerOnOffline CCM;
    local export editinline BTACLMessengerCommon acl;

    // End:0x17B
    if(Result == 0)
    {
        CCM = BTCMMessengerOnOffline(TPMessenger.ACLMsg[TPMessenger.TabControl.GetCurrentTabIndex()].ContextMenu);
        acl = BTACLMessengerCommon(TPMessenger.ACLMsg[TPMessenger.TabControl.GetCurrentTabIndex()]);
        TPMessenger.SetUserServerInfo(fServername, fServerShortName, fServerIP, fServerPort, CurPos, CurState, ChannelNum, ChannelNickName, GameRoomNum);
        // End:0xC1
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
        // End:0x17B
        if(CCM.IsActiveInviteState() == true)
        {
            // End:0x17B
            if(MatchMaker.kClanMatch_InChannel == true)
            {
                // End:0x17B
                if(false == (CheckEnterRoom_InClanChannel(acl.GetClanName(acl.selectIndex))))
                {
                    CCM.ChangeInviteState(false);
                }
            }
        }
    }
    return true;
    //return;    
}

function bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount)
{
    return true;
    //return;    
}

function bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return true;
    //return;    
}

function bool rfAckGetRankingInfoListEnd()
{
    return true;
    //return;    
}

function bool rfNotifyNewNickName(int Community_Type, string Old_NickName, string New_NickName)
{
    // End:0x2B
    if(bool(Community_Type & (1 << 1)))
    {
        TPMessenger.ReplaceUserNickName(1, Old_NickName, New_NickName);
    }
    // End:0x57
    if(bool(Community_Type & (1 << 2)))
    {
        TPMessenger.ReplaceUserNickName(2, Old_NickName, New_NickName);
    }
    // End:0x83
    if(bool(Community_Type & (1 << 3)))
    {
        TPMessenger.ReplaceUserNickName(3, Old_NickName, New_NickName);
    }
    // End:0xAF
    if(bool(Community_Type & (1 << 5)))
    {
        TPMessenger.ReplaceUserNickName(4, Old_NickName, New_NickName);
    }
    // End:0x10D
    if(bool(Community_Type & (1 << 4)))
    {
        // End:0x10D
        if(!TPTeamList[0].ACLList.ReplaceUserNickName(Old_NickName, New_NickName))
        {
            TPTeamList[1].ACLList.ReplaceUserNickName(Old_NickName, New_NickName);
        }
    }
    MM.ReplaceBlockNickName(Old_NickName, New_NickName);
    MM.ReplaceUserName(Old_NickName, New_NickName);
    return true;
    //return;    
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
    //return;    
}

function bool rfNotifyClanLevelup(string ClanName, int Levelup)
{
    Log("[BTPageRoomLobby::rfNotifyClanLevelup]");
    TPMessenger.ReplaceClanLevel(byte(TPMessenger.TabControl.CurrentTabIndex), ClanName, Levelup);
    TPTeamList[0].ACLList.ReplaceClanLevel(ClanName, Levelup);
    TPTeamList[1].ACLList.ReplaceClanLevel(ClanName, Levelup);
    MM.kClanLevel = Levelup;
    MM.UpdateClanInfo(MM);
    page_Main.AddChatLog(Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.GetFormatString(224, ClanName, string(Levelup)), 5, true);
    return true;
    //return;    
}

function SaveUserData(BTAutoColumnListDataHK Item)
{
    local int idx;

    idx = UserListDB.Length;
    UserListDB.Insert(idx, 1);
    UserListDB[idx] = Item;
    //return;    
}

function BTAutoColumnListDataHK MakeTeamMemberData(int UID, int ClanMark, int ClanBG, int ClanBL, int Level, string NickName, string ClanName, int Status, int Host, int Ping, string UserIP, byte LookingFor, int ClanLevel, int LevelMarkID, int TitleMarkID, int TeamNum, int Reserved2, int Reserved3, optional bool bMe, optional bool bisGM)
{
    local BTAutoColumnListDataHK Data;
    local int i;

    Data = new Class'GUIWarfareControls.BTAutoColumnListDataHK';
    Data.Init(10);
    i = 0;
    J0x27:

    // End:0x85 [Loop If]
    if(i < 3)
    {
        Data.DataPerColumn[2].Text[i].FontDrawType = 3;
        Data.DataPerColumn[3].Text[i].FontDrawType = 3;
        i++;
        // [Loop Continue]
        goto J0x27;
    }
    i = 0;
    J0x8C:

    // End:0x10E [Loop If]
    if(i < 9)
    {
        // End:0xD4
        if(bMe)
        {
            Data.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.myName();
            // [Explicit Continue]
            goto J0x104;
        }
        Data.DataPerColumn[i].Text[0].DrawColor = Class'GUIWarfareControls.BTUIColorPoolHK'.static.DefaultWhite();
        J0x104:

        i++;
        // [Loop Continue]
        goto J0x8C;
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
    Data.DataPerColumn[4].tempValue = int(LookingFor);
    Data.DataPerColumn[5].tempValue = ClanLevel;
    Data.DataPerColumn[9].Image = Class'Engine.BTCustomDrawHK'.static.MakeImage(16, 16, 0, GameMgr.GetClanLevelTexture(ClanLevel));
    Data.DataPerColumn[9].IntValue = TeamNum;
    // End:0x439
    if(NickName == Controller.ViewportOwner.Actor.Level.GetMatchMaker().kUserName)
    {
        Data.DataPerColumn[3].tempValue = 1;        
    }
    else
    {
        Data.DataPerColumn[3].tempValue = 0;
    }
    // End:0x475
    if(bisGM)
    {
        Data.DataPerColumn[2].IntValue = 1;        
    }
    else
    {
        Data.DataPerColumn[2].IntValue = 0;
    }
    return Data;
    //return;    
}

function bool CheckEnterRoom_InClanChannel(string szClanName)
{
    local int lp1;
    local string szInRoomClanName[2];

    // End:0x0E
    if(szClanName == "")
    {
        return false;
    }
    lp1 = 0;
    J0x15:

    // End:0x82 [Loop If]
    if(lp1 < 2)
    {
        // End:0x4D
        if(TPTeamList[lp1].GetUserCount() == 0)
        {
            szInRoomClanName[lp1] = "";
            // [Explicit Continue]
            goto J0x78;
        }
        szInRoomClanName[lp1] = TPTeamList[lp1].ACLList.GetClanName(0);
        J0x78:

        ++lp1;
        // [Loop Continue]
        goto J0x15;
    }
    // End:0xA2
    if((szInRoomClanName[0] == "") || szInRoomClanName[1] == "")
    {
        return true;
    }
    // End:0xC8
    if((szInRoomClanName[0] == szClanName) || szInRoomClanName[1] == szClanName)
    {
        return true;
    }
    return false;
    //return;    
}

function bool rfAckUseItemDuringGame(int ErrorCode, string CharName, int ItemID, BtrDouble ItemUniqueID, int RemainCount)
{
    return false;
    //return;    
}

function bool rfAckShopItemListStart(int Count)
{
    return false;
    //return;    
}

function bool rfAckShopItemList(array<int> ItemID)
{
    return false;
    //return;    
}

function bool rfAckShopItemListEnd()
{
    return false;
    //return;    
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
    TimeAutoStart=-1.0000000
    RefreshCycleTime[0]=10.0000000
    RefreshCycleTime[1]=10.0000000
    fbLabelTeam=(X1=10.0000000,Y1=87.0000000,X2=761.0000000,Y2=498.0000000)
    fbLabelTeamTopLine=(X1=10.0000000,Y1=100.0000000,X2=747.0000000,Y2=115.0000000)
    fbButtonTeam[0]=(X1=12.0000000,Y1=137.0000000,X2=374.0000000,Y2=184.0000000)
    fbButtonTeam[1]=(X1=383.0000000,Y1=137.0000000,X2=745.0000000,Y2=184.0000000)
    fbTPTeamList[0]=(X1=12.0000000,Y1=207.0000000,X2=374.0000000,Y2=495.0000000)
    fbTPTeamList[1]=(X1=383.0000000,Y1=207.0000000,X2=745.0000000,Y2=495.0000000)
    fbTPChat=(X1=10.0000000,Y1=518.0000000,X2=460.0000000,Y2=736.0000000)
    fbTPMessenger=(X1=500.0000000,Y1=518.0000000,X2=746.0000000,Y2=733.0000000)
    fbTPMyInfo=(X1=772.0000000,Y1=525.0000000,X2=1014.0000000,Y2=735.0000000)
    fbTPRoomInfo=(X1=771.0000000,Y1=87.0000000,X2=1014.0000000,Y2=424.0000000)
    strButtonStart[0]="Start Game"
    strButtonStart[1]="Ready"
    strButtonStart[2]="Cancel"
    fbButtonStart=(X1=771.0000000,Y1=434.0000000,X2=1014.0000000,Y2=498.0000000)
    fbButtonTemp=(X1=771.0000000,Y1=499.0000000,X2=1014.0000000,Y2=520.0000000)
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
    SendPingIntervalTime=10.0000000
    fbBGDeco=(X1=0.0000000,Y1=0.0000000,X2=1024.0000000,Y2=768.0000000)
    CloseLastMenu=false
    OnOpen=BTPageRoomLobby.InternalOnOpen
    OnReOpen=BTPageRoomLobby.InternalOnReOpen
    OnClose=BTPageRoomLobby.InternalOnClose
    OnPreDraw=BTPageRoomLobby.InternalOnPreDraw
    OnKeyEvent=BTPageRoomLobby.internalKeyEvent
}