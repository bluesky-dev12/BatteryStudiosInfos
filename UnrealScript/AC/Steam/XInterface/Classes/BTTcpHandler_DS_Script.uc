/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\BTTcpHandler_DS_Script.uc
 * Package Imports:
 *	XInterface
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:48
 *
 *******************************************************************************/
class BTTcpHandler_DS_Script extends BTTcpHandler_DS_Script_Interface
    native;

var int UID;
var array<int> GMList;

event Created()
{
    super(Object).Created();
}

event OnConnect(int ErrCode)
{
    UnresolvedNativeFunction_97("[BTTcpHandler_DS_Script::OnConnect] ErrCode=" $ string(ErrCode));
    // End:0xf4
    if(ErrCode == 0)
    {
        Log("[BTTcpHandler_DS_Script::OnConnect] console sendchat_ds");
        MM.kTcpChannel = self;
        MM.bHasChannelTCP = true;
        MM.kDediIsConnectedWithServer = true;
        MM.StartTickCheck();
        sfReqDedicateHost_Login(MM.kPID, MM.kDediChannelNum, MM.kDediRoomNum);
    }
    // End:0x199
    else
    {
        MM.kDediIsConnectedWithServer = false;
        MM.kTcpDStoDP.sfAckStartDedicateHost(ErrCode, MM.kPID, MM.kDediServerID, MM.kDediChannelNum, MM.kDediRoomNum);
        UnresolvedNativeFunction_97("OnConnect Failed!!! ErrCode=" $ string(ErrCode));
        MM.ConsoleCmd_DS("exit");
    }
}

event OnClose(int ErrCode)
{
    Log("[BTTcpHandler_DS_Script::OnClose] ErrCode=" $ string(ErrCode));
    UnresolvedNativeFunction_97("[BTTcpHandler_DS_Script::OnClose] ErrCode=" $ string(ErrCode));
    MM.SetHostBlocking(false);
    MM.PI_LeavelRoom();
    MM.kDediIsConnectedWithServer = false;
}

event OnError(int ErrCode)
{
    UnresolvedNativeFunction_97("[BTTcpHandler_DS_Script::OnError] ErrCode=" $ string(ErrCode));
    MM.SetHostBlocking(false);
    MM.PI_LeavelRoom();
    MM.kDediIsConnectedWithServer = false;
}

event bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local wMatchUserInfo UserInfo;
    local int NewIndex, GMListIdx;
    local string RecvClanName;

    UnresolvedNativeFunction_97("[BTTcpHandler_DS_Script::rfAckEnterRoom] Result=" $ string(Result));
    // End:0x4b
    if(Result != 0)
    {
        return true;
    }
    UserInfo = new class'wMatchUserInfo';
    NewIndex = MM.UserInfos.Length;
    MM.UserInfos[NewIndex] = UserInfo;
    MM.UserInfos[NewIndex].UID = UID;
    MM.UserInfos[NewIndex].UserName = UserID;
    MM.UserInfos[NewIndex].Grade = Grade;
    MM.UserInfos[NewIndex].IsHost = false;
    MM.UserInfos[NewIndex].UserIP = UserIP;
    MM.UserInfos[NewIndex].TeamNum = TeamNum;
    // End:0x181
    if(ClanName == "" || ClanName == "none")
    {
        RecvClanName = "";
    }
    // End:0x18c
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
    MM.SendPingToOtherUser(UserIP);
    // End:0x2a9
    if(Reserved1 == 2)
    {
        GMListIdx = GMList.Length;
        GMList.Insert(GMListIdx, 1);
        GMList[GMListIdx] = UID;
    }
    // End:0x2c9
    if(GMList.Length > 0)
    {
        MM.isGMRoom = true;
    }
    // End:0x2da
    else
    {
        MM.isGMRoom = false;
    }
    return true;
}

event bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, string ErrMsg)
{
    return false;
}

event bool rfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    local int lp1;

    // End:0x0d
    if(Result != 0)
    {
        return true;
    }
    lp1 = 0;
    J0x14:
    // End:0x76 [While If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x6c
        if(MM.UserInfos[lp1].UID == UID)
        {
            MM.UserInfos.Remove(lp1, 1);
        }
        // End:0x76
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x14;
        }
    }
    lp1 = 0;
    J0x7d:
    // End:0xbb [While If]
    if(lp1 < GMList.Length)
    {
        // End:0xb1
        if(GMList[lp1] == UID)
        {
            GMList.Remove(lp1, 1);
        }
        // End:0xbb
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x7d;
        }
    }
    // End:0xdb
    if(GMList.Length > 0)
    {
        MM.isGMRoom = true;
    }
    // End:0xec
    else
    {
        MM.isGMRoom = false;
    }
    return true;
}

event bool rfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    return false;
}

event bool rfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    return false;
}

event bool rfAckChangeRoomMaxNum(int GameNum, int Number, int TeamNumber, int Result, string ErrMsg)
{
    return false;
}

event bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, string ErrMsg)
{
    return false;
}

event bool rfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    return false;
}

event bool rfAckChatNormal(int id, string Sender, string Message, int Result)
{
    Log("[BTTcpHandler_DS_Script::rfAckChatNormal] ID=" $ string(id) @ "Sender=" $ Sender @ "Message=" $ Message @ "Result=" $ string(Result));
    // End:0x1d2
    if(UID == 0)
    {
        UID = id;
        MM.kUID = UID;
        MM.My_iUID = UID;
        MM.bServerConnected = true;
        MM.kUserName = "DS" $ string(UID);
        MM.My_szName = "DS" $ string(UID);
        MM.kGame_GameMode = 0;
        MM.szGameClass = "WGame.wDOMGameInfo";
        MM.kGame_GameRound = 1300;
        MM.kGame_WeaponLimit = 0;
        MM.kGame_GameTime = 10;
        MM.kGame_UserCount = 16;
        MM.kGame_MapNum = 1;
        MM.kGame_MapName = "dm-downtown";
        MM.kGame_RoomName = "DS Test Room (Owner=" $ string(UID) $ ")";
    }
    return true;
}

event bool rfAckDisconnectGame(int Result, int DisconnectUserID, string DisconnectUserName)
{
    Log("[BTTcpHandler_DS_Script::rfAckDisconnectGame( Result:" $ string(Result) $ " UserID:" $ string(DisconnectUserID) $ " UserName:" $ DisconnectUserName $ " InGamePlaying:" $ string(MM.InGamePlaying));
    // End:0x120
    if(DisconnectUserID == MM.kUID)
    {
        Log("[BTTcpHandler_DS_Script::rfAckDisconnectGame] DisconnectUserID:" $ string(DisconnectUserID) $ " UID:" $ string(MM.kUID));
        MM.EndMatch();
    }
    // End:0x176
    if(MM.InGamePlaying == true)
    {
        // End:0x176
        if(MM.kUID != DisconnectUserID)
        {
            MM.ForceDisconnectUDPConnectionHostSide(DisconnectUserID);
            MM.SetDisconnectedUser(true, DisconnectUserID);
        }
    }
    return true;
}

event bool rfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    Log("[BTTcpHandler_DS_Script::rfAckGameOver] Begin!!");
    // End:0x2fb
    if(MM.bIsLoading == true)
    {
        Log("[BTTcpHandler_DS_Script::rfAckGameOver] MM.bIsLoading:" $ string(MM.bIsLoading));
        // End:0x12e
        if(MM.playingLevelInfo == none)
        {
            Log("[BTTcpHandler_DS_Script::rfAckGameOver] MM.bIsLoading:" $ string(MM.bIsLoading) $ "MM.playingLevelInfo:" $ string(MM.playingLevelInfo) $ " is none");
            return false;
        }
        // End:0x1e8
        if(MM.playingLevelInfo.ControllerList == none)
        {
            Log("[BTTcpHandler_DS_Script::rfAckGameOver] MM.bIsLoading:" $ string(MM.bIsLoading) $ "MM.playingLevelInfo.ControllerList:" $ string(MM.playingLevelInfo.ControllerList) $ " is none");
            return false;
        }
        // End:0x2ca
        if(MM.playingLevelInfo.ControllerList.PlayerReplicationInfo == none)
        {
            Log("[BTTcpHandler_DS_Script::rfAckGameOver] MM.bIsLoading:" $ string(MM.bIsLoading) $ "MM.playingLevelInfo.ControllerList.PlayerReplicationInfo:" $ string(MM.playingLevelInfo.ControllerList.PlayerReplicationInfo) $ " is none");
            return false;
        }
        MM.ForceGameOver(MM.playingLevelInfo.ControllerList.PlayerReplicationInfo);
        return false;
    }
    // End:0x366
    if(MM.InGamePlaying == true)
    {
        // End:0x363
        if(Result == 0)
        {
            Log("[BTTcpHandler_DS_Script::rfAckGameOver] Result:" $ string(Result) $ " Success");
        }
    }
    // End:0x38a
    else
    {
        // End:0x38a
        if(MM.bPendingStarted == true)
        {
            MM.FailedNetworkChecking();
        }
    }
    Log("[BTTcpHandler_DS_Script::rfAckGameOver] End!!");
    return true;
}

event bool rfAckGameOverEnd(int Result, string ErrMsg)
{
    Log("[BTTcpHandler_DS_Script::rfAckGameOverEnd] Begin!! Result=" $ string(Result));
    // End:0x78
    if(MM.InGamePlaying)
    {
        MM.InGameOver = 1;
        MM.EndMatch();
    }
    Log("[BTTcpHandler_DS_Script::rfAckGameOverEnd] End!!");
    return true;
}

event bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    return false;
}

event bool rfAckUpdateScore(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> EXPBonuses, array<int> Points, array<int> PointBonuses, array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID)
{
    return false;
}

event bool rfAckChangeRoomSetting(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log("[BTTcpHandler_DS_Script::rfAckChangeRoomSetting] Begin!! Result=" $ string(Result));
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
    MM.PlayWithBots = RoomInfo.PlayWithBots != 0;
    MM.BotUserTeam = RoomInfo.UserTeamNum;
    MM.BotNum0 = RoomInfo.MaxAFUserAndBotNum;
    MM.BotNum1 = RoomInfo.MaxRSAUserAndBotNum;
    MM.BotDifficulty = RoomInfo.BotModeDifficulty;
    // End:0x21c
    if(RoomInfo.BombHold == 0)
    {
        MM.bMultiBomb = true;
    }
    // End:0x22d
    else
    {
        MM.bMultiBomb = false;
    }
    MM.kGame_RoomName = RoomInfo.RoomName;
    // End:0x288
    if(RoomInfo.RoomOwner == MM.kUserName)
    {
        MM.bIsOwner = true;
        MM.kGame_bOwner = true;
    }
    // End:0x2aa
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
    // End:0x3a0
    if(RoomInfo.IsHardCore != 0)
    {
        MM.kGame_bHardCore = true;
    }
    // End:0x3b1
    else
    {
        MM.kGame_bHardCore = false;
    }
    // End:0x3d7
    if(RoomInfo.IsTeamValance != 0)
    {
        MM.kGame_TeamBalance = true;
    }
    // End:0x3e8
    else
    {
        MM.kGame_TeamBalance = false;
    }
    // End:0x40e
    if(RoomInfo.ResponType == 1)
    {
        MM.bSDRespawn = true;
    }
    // End:0x41f
    else
    {
        MM.bSDRespawn = false;
    }
    Log("[BTTcpHandler_DS_Script::rfAckChangeRoomSetting] End!!");
    return true;
}

event bool rfAckGetBooty(int Result, string ErrMsg, array<int> PrizeWinUserID, array<int> BootyItemID, array<int> BootyPartsID)
{
    return false;
}

event bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel)
{
    return false;
}

event bool rfAckChangeUserState(int Result, string ErrMsg, array<int> UserIDs, array<byte> Positions, array<int> Numbers, array<byte> OldStates, array<byte> NewStates)
{
    return false;
}

event bool rfReqNotifyChangeRoomState(byte RoomState)
{
    return false;
}

event bool rfAckNotifyMyCharInfoToRoomUser(int Result, string ErrMsg, int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost, string UserIP, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor)
{
    return false;
}

event bool rfAckAutoChangedTeamUserList(array<int> UserID, array<int> TeamNum)
{
    return false;
}

event bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    return false;
}

event bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    return false;
}

event bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    return false;
}

event bool rfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    return false;
}

event bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    Log("[BTTcpHandler_DS_Script::rfAckStartGame] GameNumber=" $ string(GameNumber) @ "ClientsCount=" $ string(ClientsCount) @ "StartSeed=" $ string(StartSeed) @ "Result=" $ string(Result));
    // End:0xc3
    if(Result != 0)
    {
        Log("[BTTcpHandler_DS_Script::rfAckStartGame] End");
        return true;
    }
    MM.bIsOwner = true;
    MM.kGame_bOwner = true;
    // End:0x138
    if(MM.StartNetworkChecking(ClientsCount, false) == false)
    {
        UnresolvedNativeFunction_97("LoadingInfo - Failed Start NetworkChecking");
        sfReqFailedStartGame(1);
        return false;
    }
    Log("[BTTcpHandler_DS_Script::rfAckStartGame] End");
    UnresolvedNativeFunction_97("LoadingInfo - Start Game");
    return true;
}

event bool rfAckConnectGame(int UserID, int Result)
{
    return false;
}

event bool rfAckRegisterMyUdpInfo(int Result, string ErrMsg)
{
    Log("[BTTcpHandler_DS_Script::rfAckRegisterMyUdpInfo] Begin!");
    // End:0x48
    if(Result == 0)
    {
        return true;
    }
    Log("[BTTcpHandler_DS_Script::rfAckRegisterMyUdpInfo] End!");
    return true;
}

event bool rfAckRegisterOtherUdpInfo(int UID, string IP, int Port, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    Log("[BTTcpHandler_DS_Script::rfAckRegisterOtherUdpInfo] Begin!");
    // End:0xc7
    if(Intervention == 1)
    {
        // End:0xc7
        if(MM.IsCompletedLoading() == false)
        {
            Log("[BTTcpHandler_DS_Script::rfAckRegisterOtherUdpInfo] Host Loading. Can't process intervention user");
            return true;
        }
    }
    // End:0x169
    if(MM.HostInitNatChecker(UID, IP, Port, NatType, Intervention) == false)
    {
        // End:0x169
        if(GetLastErrCode() == 5087)
        {
            Log("[BTTcpHandler_DS_Script::rfAckRegisterOtherUdpInfo] Host Loading. Can't process all loading user");
        }
    }
    Log("[BTTcpHandler_DS_Script::rfAckRegisterOtherUdpInfo] End!");
    return true;
}

event bool rfAckStartHolePunching(int Result, string ErrMsg, int GameType, int ReqStartUserID)
{
    Log("[BTTcpHandler_DS_Script::rfAckStartHolePunching] Begin! Result=" $ string(Result));
    // End:0x92
    if(Result != 0)
    {
        Log("[BTTcpHandler_DS_Script::rfAckStartHolePunching] End!");
        return true;
    }
    MM.StartHolePunchingHost(GameType, ReqStartUserID);
    Log("[BTTcpHandler_DS_Script::rfAckStartHolePunching] End!");
    return true;
}

event bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    Log("[BTTcpHandler_DS_Script::rfAckGetHolePunchingResult] Begin!");
    MM.CheckHolePunchingResult(Result, Phrase, InterventionUserID, Intervention, FailedUserIDs);
    Log("[BTTcpHandler_DS_Script::rfAckGetHolePunchingResult] End!");
    return true;
}

event bool rfReqRelayServerOn(string RelayServerIP, int RelayServerPortNum)
{
    Log("[BTTcpHandler_DS_Script::rfReqRelayServerOn] Begin!");
    Log("[BTTcpHandler_DS_Script::rfReqRelayServerOn] RelayServerIP=" $ RelayServerIP $ ", " $ "RelayServerPortNum=" $ string(RelayServerPortNum));
    MM.LowRelayServerOn(RelayServerIP, RelayServerPortNum);
    Log("[BTTcpHandler_DS_Script::rfReqRelayServerOn] End!");
    return true;
}

event bool rfAckSuccessStartGame(int Result, string ErrMsg, byte IsHost, string HostIP, int HostPort, int LoadingStep)
{
    local bool bSuccessStartMatch;

    Log("[BTTcpHandler_DS_Script::rfAckSuccessStartGame] Begin! Result=" $ string(Result));
    // End:0xad
    if(Result != 0)
    {
        MM.kTcpChannel.sfReqFailedStartGame(LoadingStep);
        Log("[BTTcpHandler_DS_Script::rfAckSuccessStartGame] End!");
        return true;
    }
    MM.bForceGameOut = false;
    MM.BotTutorial = MM.kGame_GameMode == 8;
    MM.BeginnerMode = MM.kGame_GameMode == 11;
    Log("[BTTcpHandler_DS_Script::rfAckSuccessStartGame] MM.StartMatch(" $ string(MM.kRoomID) $ ", " $ string(MM.bIsOwner) $ ")");
    bSuccessStartMatch = MM.StartMatch(MM.kRoomID, MM.bIsOwner);
    MM.bPendingStarted = false;
    Log("bSuccessStartMatch=" $ string(bSuccessStartMatch));
    // End:0x215
    if(bSuccessStartMatch == true)
    {
        MM.InGameOver = 0;
        MM.InGamePlaying = true;
        MM.StartLoading();
    }
    Log("[BTTcpHandler_DS_Script::rfAckSuccessStartGame] End!");
    UnresolvedNativeFunction_97("LoadingInfo - Succeses Start game");
    return true;
}

event bool rfAckFailedStartGame(int Result, string ErrMsg, byte IsHost, int FailedUserID, int LoadingStep)
{
    Log("[BTTcpHandler_DS_Script::rfAckFailedStartGame] Result=" $ string(Result) $ ", " $ "FailedUserID=" $ string(FailedUserID) $ " IsHost=" $ string(IsHost) $ "LoadingStep=" $ string(LoadingStep));
    UnresolvedNativeFunction_97("LoadingInfo - Result=" $ string(Result) $ ", " $ "FailedUserID=" $ string(FailedUserID) $ " IsHost=" $ string(IsHost) $ "LoadingStep=" $ string(LoadingStep));
    // End:0x197
    if(MM.bPendingStarted == false)
    {
        Log("BTTcpHandler_DS_Script::rfAckFailedStartGame() MM.bPendingStarted == false.");
        UnresolvedNativeFunction_97("LoadingInfo - MM.bPendingStarted == false.");
        return true;
    }
    // End:0x1df
    if(Result == 127)
    {
        // End:0x1cd
        if(FailedUserID == MM.kUID)
        {
            MM.FailedNetworkChecking();
        }
        // End:0x1dc
        else
        {
            MM.FailedNetworkChecking();
        }
    }
    // End:0x2a8
    else
    {
        // End:0x2a8
        if(Result == 128)
        {
            // End:0x27e
            if(MM.bIsOwner == true)
            {
                // End:0x227
                if(MM.ConnectClientNum > 0)
                {
                    -- MM.ConnectClientNum;
                }
                // End:0x27b
                else
                {
                    Log("BTTcpHandler_DS_Script::rfAckFailedStartGame() MM.ConnectClientNum <= 0. error!!");
                }
            }
            // End:0x2a5
            else
            {
                // End:0x2a5
                if(FailedUserID == MM.kUID)
                {
                    MM.FailedNetworkChecking();
                }
            }
        }
        // End:0x2a8
        else
        {
        }
    }
    return true;
}

event bool rfAckEntryItemList(array<int> UserIDs, array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<BtrDouble> UniqueID, array<int> PaintID, int Result, string ErrMsg)
{
    local int lp1, lp2, idx;
    local EquippedItemInfo ItemInfo;

    Log("[BTTcpHandler_DS_Script::rfAckEntryItemList]");
    lp1 = 0;
    J0x37:
    // End:0xe8 [While If]
    if(lp1 < UserIDs.Length)
    {
        lp2 = 0;
        J0x4e:
        // End:0xde [While If]
        if(lp2 < MM.UserInfos.Length)
        {
            // End:0xd4
            if(MM.UserInfos[lp2].UID == UserIDs[lp1])
            {
                MM.UserInfos[lp2].EquippedItems.Remove(0, MM.UserInfos[lp2].EquippedItems.Length);
            }
            // End:0xde
            else
            {
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0x4e;
            }
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    lp1 = 0;
    J0xef:
    // End:0x359 [While If]
    if(lp1 < UserIDs.Length)
    {
        lp2 = 0;
        J0x106:
        // End:0x34f [While If]
        if(lp2 < MM.UserInfos.Length)
        {
            // End:0x345
            if(MM.UserInfos[lp2].UID == UserIDs[lp1])
            {
                idx = MM.UserInfos[lp2].EquippedItems.Length;
                MM.UserInfos[lp2].EquippedItems[idx] = ItemInfo;
                MM.UserInfos[lp2].EquippedItems[idx].ItemID = ItemIDs[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].SlotPosition = SlotPositions[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].AddPartID = AddPartsID[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].UniqueID = UniqueID[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].Painting_Item_ID = GameMgr.GetPaintingItemIDbyPaintingID(PaintID[lp1]);
                Log("[BTTcpHandler_DS_Script::rfAckEntryItemList] UserName=" $ MM.UserInfos[lp2].UserName $ " EquippedItemID=" $ string(MM.UserInfos[lp2].EquippedItems[idx].ItemID));
            }
            ++ lp2;
            // This is an implied JumpToken; Continue!
            goto J0x106;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0xef;
    }
    return true;
}

event bool rfAckEntrySkillList(array<int> UserIDs, array<int> SkillIDs, array<int> SlotPositions, int Result, string ErrMsg)
{
    local int lp1, lp2, idx;
    local EquippedSkillInfo SkillInfo;

    Log("[BTTcpHandler_DS_Script::rfAckEntrySkillList]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    // End:0x2dc
    if(Result == 0)
    {
        lp1 = 0;
        J0x6b:
        // End:0x11c [While If]
        if(lp1 < UserIDs.Length)
        {
            lp2 = 0;
            J0x82:
            // End:0x112 [While If]
            if(lp2 < MM.UserInfos.Length)
            {
                // End:0x108
                if(MM.UserInfos[lp2].UID == UserIDs[lp1])
                {
                    MM.UserInfos[lp2].EquippedSkills.Remove(0, MM.UserInfos[lp2].EquippedSkills.Length);
                }
                // End:0x112
                else
                {
                    ++ lp2;
                    // This is an implied JumpToken; Continue!
                    goto J0x82;
                }
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x6b;
        }
        lp1 = 0;
        J0x123:
        // End:0x2dc [While If]
        if(lp1 < UserIDs.Length)
        {
            lp2 = 0;
            J0x13a:
            // End:0x2d2 [While If]
            if(lp2 < MM.UserInfos.Length)
            {
                // End:0x2c8
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
                goto J0x13a;
            }
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x123;
        }
    }
    return true;
}

event bool rfAckEntryQSlotIDList(int UserNum, array<byte> QSlotDispOrder, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<int> TWItemID1, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID)
{
    local int lp1, lp2, lp3, idx;
    local EquippedQSlotInfo tmSlot;

    Log("[BTTcpHandler_DS_Script::rfAckEntryQSlotIDList]");
    lp1 = 0;
    J0x3a:
    // End:0x234 [While If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x22a
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            // End:0x15d
            if(MM.UserInfos[lp1].EquippedQSlots.Length == 0)
            {
                MM.UserInfos[lp1].EquippedQSlots[0] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[1] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[2] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[3] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[4] = tmSlot;
            }
            // End:0x227
            else
            {
                lp2 = 0;
                J0x164:
                // End:0x227 [While If]
                if(lp2 < 5)
                {
                    lp3 = 0;
                    J0x177:
                    // End:0x21d [While If]
                    if(lp3 < 4)
                    {
                        MM.UserInfos[lp1].EquippedQSlots[lp2].ItemID[lp3] = 0;
                        MM.UserInfos[lp1].EquippedQSlots[lp2].PartsID[lp3] = 0;
                        MM.UserInfos[lp1].EquippedQSlots[lp2].SkillID[lp3] = 0;
                        ++ lp3;
                        // This is an implied JumpToken; Continue!
                        goto J0x177;
                    }
                    ++ lp2;
                    // This is an implied JumpToken; Continue!
                    goto J0x164;
                }
            }
        }
        // End:0x234
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x3a;
        }
    }
    lp1 = 0;
    J0x23b:
    // End:0x5c3 [While If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x5b9
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            lp2 = 0;
            J0x282:
            // End:0x5b6 [While If]
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
                goto J0x282;
            }
        }
        // End:0x5c3
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x23b;
        }
    }
    return true;
}

event bool rfAckEntryQSlotUniqueIDList(int UserNum, array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<BtrDouble> PistolUniqueID, array<BtrDouble> TW1UniqueID, array<BtrDouble> TW2UniqueID)
{
    local int lp1, lp2, lp3, idx;
    local EquippedQSlotInfo tmSlot;

    Log("[BTTcpHandler_DS_Script::rfAckEntryQSlotUniqueIDList]");
    lp1 = 0;
    J0x40:
    // End:0x1df [While If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x1d5
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            // End:0x163
            if(MM.UserInfos[lp1].EquippedQSlots.Length == 0)
            {
                MM.UserInfos[lp1].EquippedQSlots[0] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[1] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[2] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[3] = tmSlot;
                MM.UserInfos[lp1].EquippedQSlots[4] = tmSlot;
            }
            // End:0x1d2
            else
            {
                lp2 = 0;
                J0x16a:
                // End:0x1d2 [While If]
                if(lp2 < 5)
                {
                    lp3 = 0;
                    J0x17d:
                    // End:0x1c8 [While If]
                    if(lp3 < 4)
                    {
                        MM.UserInfos[lp1].EquippedQSlots[lp2].ItemUniqueID[lp3] = EmptyBtrDouble();
                        ++ lp3;
                        // This is an implied JumpToken; Continue!
                        goto J0x17d;
                    }
                    ++ lp2;
                    // This is an implied JumpToken; Continue!
                    goto J0x16a;
                }
            }
        }
        // End:0x1df
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x40;
        }
    }
    lp1 = 0;
    J0x1e6:
    // End:0x344 [While If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x33a
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            lp2 = 0;
            J0x22d:
            // End:0x337 [While If]
            if(lp2 < QSlotDispOrder.Length)
            {
                idx = QSlotDispOrder[lp2] - 1;
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[0] = MWUniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[1] = PistolUniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[2] = TW1UniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[3] = TW2UniqueID[lp2];
                ++ lp2;
                // This is an implied JumpToken; Continue!
                goto J0x22d;
            }
        }
        // End:0x344
        else
        {
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x1e6;
        }
    }
    return true;
}

event bool rfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    Log("[BTTcpHandler_DS_Script::rfAckCreateGameRoom]");
    MM.szRoomName = NetRoomInfo.RoomName;
    MM.szMapName = NetRoomInfo.MapName;
    MM.szRoomPassword = NetRoomInfo.Password;
    MM.iMaxPlayers = NetRoomInfo.MaxUserCnt;
    MM.szGameClass = class'wGameSettings'.static.GetGameModeByIndex(NetRoomInfo.GameModeNum).ClassName;
    MM.eWeaponLimit = NetRoomInfo.WeaponLimit;
    MM.iGoalRound = NetRoomInfo.GameRound;
    MM.iTimeLimit = NetRoomInfo.GameMinute;
    MM.PlayWithBots = NetRoomInfo.PlayWithBots > 0;
    MM.BotUserTeam = NetRoomInfo.UserTeamNum;
    MM.BotDifficulty = NetRoomInfo.BotModeDifficulty;
    MM.BotNum0 = NetRoomInfo.MaxAFUserAndBotNum;
    MM.BotNum1 = NetRoomInfo.MaxRSAUserAndBotNum;
    MM.bMultiBomb = NetRoomInfo.BombHold == 0;
    MM.SD_ChangeAttackTeam = true;
    MM.SD_ChangeRound = 3;
    MM.kRoomID = NetRoomInfo.RoomNumber;
    MM.RI_Clear();
    MM.kGame_bOwner = true;
    MM.kGame_RoomName = NetRoomInfo.RoomName;
    MM.kGame_Password = NetRoomInfo.Password;
    MM.kGame_MapNum = NetRoomInfo.MapNum;
    MM.kGame_MapName = NetRoomInfo.MapName;
    MM.kGame_GameMode = NetRoomInfo.GameModeNum;
    MM.kGame_UserCount = NetRoomInfo.MaxUserCnt;
    MM.kGame_GameTime = NetRoomInfo.GameMinute;
    MM.kGame_GameRound = NetRoomInfo.GameRound;
    MM.kGame_WeaponLimit = NetRoomInfo.WeaponLimit;
    // End:0x325
    if(NetRoomInfo.IsHardCore != 0)
    {
        MM.kGame_bHardCore = true;
    }
    // End:0x336
    else
    {
        MM.kGame_bHardCore = false;
    }
    // End:0x35c
    if(NetRoomInfo.IsTeamValance != 0)
    {
        MM.kGame_TeamBalance = true;
    }
    // End:0x36d
    else
    {
        MM.kGame_TeamBalance = false;
    }
    // End:0x393
    if(NetRoomInfo.ResponType == 1)
    {
        MM.bSDRespawn = true;
    }
    // End:0x3a4
    else
    {
        MM.bSDRespawn = false;
    }
    Log("bSDRespawn = " @ string(MM.bSDRespawn) $ " " $ "NetRoomInfo.ResponType = " @ string(NetRoomInfo.ResponType));
    MM.__OnReqSuccessStartGame__Delegate = OnReqSuccessStartGame;
    return true;
}

event bool rfAckGameRoomDestroy(int GameRoomNum)
{
    MM.SetHostBlocking(false);
    MM.PI_LeavelRoom();
    return true;
}

function OnReqSuccessStartGame(int Step)
{
    Log("[BTTcpHandler_DS_Script::OnReqSuccessStartGame] step=" $ string(Step));
    sfReqSuccessStartGame(Step);
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    Log("[BTTcpHandler_DS_Script::rfAckGetBotID] Result=" $ string(Result));
    Log("RequestedAFCount=" $ string(RequestedAFCount) $ ", RequestedRSACount=" $ string(RequestedRSACount) $ ", AFBotID.Length=" $ string(AFBotID.Length) $ ", RSABotID.Length=" $ string(RSABotID.Length));
    MM.playingLevelInfo.Game.rfAckGetBotID(Result, RequestedAFCount, RequestedRSACount, AFBotID, RSABotID);
    return true;
}

function bool rfAckDedicateHost_Login(int Result, int UserID, int ChannelNum, int RoomNum)
{
    Log("[BTTcpHandler_DS_Script::rfAckDedicateHost_Login] Result=" $ string(Result) $ " ChannelNum=" $ string(ChannelNum) $ " RoomNum=" $ string(RoomNum));
    UnresolvedNativeFunction_97("[BTTcpHandler_DS_Script::rfAckDedicateHost_Login] Result=" $ string(Result) $ " ChannelNum=" $ string(ChannelNum) $ " RoomNum=" $ string(RoomNum));
    // End:0x150
    if(Result != 0)
    {
        MM.kTcpDStoDP.sfAckStartDedicateHost(Result, MM.kPID, MM.kDediServerID, ChannelNum, RoomNum);
        MM.ConsoleCmd_DS("exit");
        return true;
    }
    UID = UserID;
    MM.kUID = UID;
    MM.My_iUID = UID;
    MM.bServerConnected = true;
    MM.kUserName = "DS" $ string(UID);
    MM.My_szName = "DS" $ string(UID);
    MM.kGame_GameMode = 0;
    MM.szGameClass = "WGame.wDOMGameInfo";
    MM.kGame_GameRound = 1300;
    MM.kGame_WeaponLimit = 0;
    MM.kGame_GameTime = 10;
    MM.kGame_UserCount = 16;
    MM.kGame_MapNum = 1;
    MM.kGame_MapName = "dm-downtown";
    MM.kGame_RoomName = "DS Test Room (Owner=" $ string(UID) $ ")";
    MM.kTcpDStoDP.sfAckStartDedicateHost(0, MM.kPID, MM.kDediServerID, ChannelNum, RoomNum);
    return true;
}

function bool rfAckRoomUserList(array<int> UID, array<string> UserName, array<int> Grade, array<int> TeamNum, array<byte> Statue, array<byte> IsHost, array<string> UserIP, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<byte> IsLookingFor, array<int> GMUID, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    local int lp1, lp2, GMListIdx;
    local wMatchUserInfo UserInfo;
    local string RecvClanName;

    Log("[BTTcpHandler_DS_Script::rfAckRoomUserList]");
    GMList.Remove(0, GMList.Length);
    MM.isGMRoom = false;
    MM.UserInfos.Remove(0, MM.UserInfos.Length);
    lp1 = 0;
    J0x73:
    // End:0x386 [While If]
    if(lp1 < UID.Length)
    {
        UserInfo = new class'wMatchUserInfo';
        MM.UserInfos[lp1] = UserInfo;
        MM.UserInfos[lp1].UID = UID[lp1];
        MM.UserInfos[lp1].UserName = UserName[lp1];
        MM.UserInfos[lp1].Grade = Grade[lp1];
        MM.UserInfos[lp1].IsHost = IsHost[lp1] == 0;
        MM.UserInfos[lp1].UserIP = UserIP[lp1];
        MM.UserInfos[lp1].TeamNum = TeamNum[lp1];
        // End:0x1dd
        if(ClanName[lp1] == "" || ClanName[lp1] == "none")
        {
            RecvClanName = "";
        }
        // End:0x1ee
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
        lp2 = 0;
        J0x2e7:
        // End:0x34b [While If]
        if(lp2 < GMUID.Length)
        {
            // End:0x341
            if(UID[lp1] == GMUID[lp2])
            {
                GMListIdx = GMList.Length;
                GMList.Insert(GMListIdx, 1);
                GMList[GMListIdx] = UID[lp1];
            }
            ++ lp2;
            // This is an implied JumpToken; Continue!
            goto J0x2e7;
        }
        // End:0x36b
        if(GMList.Length > 0)
        {
            MM.isGMRoom = true;
        }
        // End:0x37c
        else
        {
            MM.isGMRoom = false;
        }
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x73;
    }
    return true;
}
