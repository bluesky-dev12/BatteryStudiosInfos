class BTTcpHandler_DS_Script extends BTTcpHandler_DS_Script_Interface
    native;

var int UID;
var array<int> GMList;

event Created()
{
    super(Object).Created();
    //return;    
}

event OnConnect(int ErrCode)
{
    __NFUN_270__("[BTTcpHandler_DS_Script::OnConnect] ErrCode=" $ string(ErrCode));
    // End:0x105
    if(ErrCode == 0)
    {
        Log("[BTTcpHandler_DS_Script::OnConnect] console sendchat_ds");
        MM.kTcpChannel = self;
        MM.bHasChannelTCP = true;
        MM.kDediIsConnectedWithServer = true;
        MM.kDediIsQuited = false;
        MM.StartTickCheck();
        sfReqDedicateHost_Login(MM.kPID, MM.kDediChannelNum, MM.kDediRoomNum);        
    }
    else
    {
        MM.kDediIsConnectedWithServer = false;
        MM.kTcpDStoDP.sfAckStartDedicateHost(ErrCode, MM.kPID, MM.kDediServerID, MM.kDediChannelNum, MM.kDediRoomNum);
        __NFUN_270__("OnConnect Failed!!! ErrCode=" $ string(ErrCode));
        MM.ConsoleCmd_DS("exit");
    }
    //return;    
}

event OnClose(int ErrCode)
{
    Log("[BTTcpHandler_DS_Script::OnClose] ErrCode=" $ string(ErrCode));
    __NFUN_270__("[BTTcpHandler_DS_Script::OnClose] ErrCode=" $ string(ErrCode));
    MM.SetHostBlocking(false);
    MM.PI_LeavelRoom();
    MM.kDediIsConnectedWithServer = false;
    // End:0x15C
    if(MM.kDediIsQuited == false)
    {
        Log(("[BTTcpHandler_DS_Script::OnClose] ErrCode=" $ string(ErrCode)) $ " be not quited");
        __NFUN_270__(("[BTTcpHandler_DS_Script::OnClose] ErrCode=" $ string(ErrCode)) $ " be not quited");
        MM.ConsoleCmd_DS("exit");
    }
    //return;    
}

event OnError(int ErrCode)
{
    __NFUN_270__("[BTTcpHandler_DS_Script::OnError] ErrCode=" $ string(ErrCode));
    MM.SetHostBlocking(false);
    MM.PI_LeavelRoom();
    MM.kDediIsConnectedWithServer = false;
    // End:0x125
    if(MM.kDediIsQuited == false)
    {
        Log(("[BTTcpHandler_DS_Script::OnError] ErrCode=" $ string(ErrCode)) $ " be not quited");
        __NFUN_270__(("[BTTcpHandler_DS_Script::OnError] ErrCode=" $ string(ErrCode)) $ " be not quited");
        MM.ConsoleCmd_DS("exit");
    }
    //return;    
}

event bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    local wMatchUserInfo UserInfo;
    local int NewIndex, GMListIdx;
    local string RecvClanName;

    __NFUN_270__("[BTTcpHandler_DS_Script::rfAckEnterRoom] Result=" $ string(Result));
    // End:0x4B
    if(Result != 0)
    {
        return true;
    }
    UserInfo = new Class'Engine.wMatchUserInfo';
    NewIndex = MM.UserInfos.Length;
    MM.UserInfos[NewIndex] = UserInfo;
    MM.UserInfos[NewIndex].UID = UID;
    MM.UserInfos[NewIndex].UserName = UserID;
    MM.UserInfos[NewIndex].Grade = Grade;
    MM.UserInfos[NewIndex].IsHost = false;
    MM.UserInfos[NewIndex].UserIP = UserIP;
    MM.UserInfos[NewIndex].TeamNum = TeamNum;
    // End:0x181
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
    MM.SendPingToOtherUser(UserIP);
    // End:0x2A9
    if(Reserved1 == 2)
    {
        GMListIdx = GMList.Length;
        GMList.Insert(GMListIdx, 1);
        GMList[GMListIdx] = UID;
    }
    // End:0x2C9
    if(GMList.Length > 0)
    {
        MM.isGMRoom = true;        
    }
    else
    {
        MM.isGMRoom = false;
    }
    return true;
    //return;    
}

event bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    local int lp1;

    // End:0x0D
    if(Result != 0)
    {
        return true;
    }
    lp1 = 0;
    J0x14:

    // End:0x76 [Loop If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x6C
        if(MM.UserInfos[lp1].UID == UID)
        {
            MM.UserInfos.Remove(lp1, 1);
            // [Explicit Break]
            goto J0x76;
        }
        lp1++;
        // [Loop Continue]
        goto J0x14;
    }
    J0x76:

    lp1 = 0;
    J0x7D:

    // End:0xBB [Loop If]
    if(lp1 < GMList.Length)
    {
        // End:0xB1
        if(GMList[lp1] == UID)
        {
            GMList.Remove(lp1, 1);
            // [Explicit Break]
            goto J0xBB;
        }
        lp1++;
        // [Loop Continue]
        goto J0x7D;
    }
    J0xBB:

    // End:0xDB
    if(GMList.Length > 0)
    {
        MM.isGMRoom = true;        
    }
    else
    {
        MM.isGMRoom = false;
    }
    return true;
    //return;    
}

event bool rfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckChangeRoomMaxNum(int GameNum, int Number, int TeamNumber, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    // End:0x87
    if(Result == 0)
    {
        // End:0x87
        if(TeamNum == 4)
        {
            Log("[BTTcpHandler_DS_Script::rfAckChangeTeam] TeamNum => 4");
            // End:0x87
            if(MM.playingLevelInfo != none)
            {
                MM.playingLevelInfo.Game.CheckLives(none);
            }
        }
    }
    return true;
    //return;    
}

event bool rfAckChatNormal(int id, string Sender, string Message, int Result)
{
    Log((((((("[BTTcpHandler_DS_Script::rfAckChatNormal] ID=" $ string(id)) @ "Sender=") $ Sender) @ "Message=") $ Message) @ "Result=") $ string(Result));
    // End:0x1D2
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
        MM.kGame_RoomName = ("DS Test Room (Owner=" $ string(UID)) $ ")";
    }
    return true;
    //return;    
}

event bool rfAckDisconnectGame(int Result, int DisconnectUserID, string DisconnectUserName)
{
    Log((((((("[BTTcpHandler_DS_Script::rfAckDisconnectGame( Result:" $ string(Result)) $ " UserID:") $ string(DisconnectUserID)) $ " UserName:") $ DisconnectUserName) $ " InGamePlaying:") $ string(MM.InGamePlaying));
    // End:0x120
    if(DisconnectUserID == MM.kUID)
    {
        Log((("[BTTcpHandler_DS_Script::rfAckDisconnectGame] DisconnectUserID:" $ string(DisconnectUserID)) $ " UID:") $ string(MM.kUID));
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
    //return;    
}

event bool rfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    Log("[BTTcpHandler_DS_Script::rfAckGameOver] Begin!!");
    // End:0x2FB
    if(MM.bIsLoading == true)
    {
        Log("[BTTcpHandler_DS_Script::rfAckGameOver] MM.bIsLoading:" $ string(MM.bIsLoading));
        // End:0x12E
        if(MM.playingLevelInfo == none)
        {
            Log(((("[BTTcpHandler_DS_Script::rfAckGameOver] MM.bIsLoading:" $ string(MM.bIsLoading)) $ "MM.playingLevelInfo:") $ string(MM.playingLevelInfo)) $ " is none");
            return false;
        }
        // End:0x1E8
        if(MM.playingLevelInfo.ControllerList == none)
        {
            Log(((("[BTTcpHandler_DS_Script::rfAckGameOver] MM.bIsLoading:" $ string(MM.bIsLoading)) $ "MM.playingLevelInfo.ControllerList:") $ string(MM.playingLevelInfo.ControllerList)) $ " is none");
            return false;
        }
        // End:0x2CA
        if(MM.playingLevelInfo.ControllerList.PlayerReplicationInfo == none)
        {
            Log(((("[BTTcpHandler_DS_Script::rfAckGameOver] MM.bIsLoading:" $ string(MM.bIsLoading)) $ "MM.playingLevelInfo.ControllerList.PlayerReplicationInfo:") $ string(MM.playingLevelInfo.ControllerList.PlayerReplicationInfo)) $ " is none");
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
            Log(("[BTTcpHandler_DS_Script::rfAckGameOver] Result:" $ string(Result)) $ " Success");
        }        
    }
    else
    {
        // End:0x38A
        if(MM.bPendingStarted == true)
        {
            MM.FailedNetworkChecking();
        }
    }
    Log("[BTTcpHandler_DS_Script::rfAckGameOver] End!!");
    return true;
    //return;    
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
    //return;    
}

event bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    return false;
    //return;    
}

event bool rfAckUpdateScore(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> EXPBonuses, array<int> Points, array<int> PointBonuses, array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID)
{
    return false;
    //return;    
}

event bool rfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, array<int> ScoreRewardUserID, array<byte> ScoreRewardTYPE, array<int> ScoreRewardID, array<int> ScoreRewardCount)
{
    return false;
    //return;    
}

event bool rfAckChangeRoomSetting(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log("[BTTcpHandler_DS_Script::rfAckChangeRoomSetting] Begin!! Result=" $ string(Result));
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
    MM.PlayWithBots = int(RoomInfo.PlayWithBots) != 0;
    MM.BotUserTeam = int(RoomInfo.UserTeamNum);
    MM.BotNum0 = int(RoomInfo.MaxAFUserAndBotNum);
    MM.BotNum1 = int(RoomInfo.MaxRSAUserAndBotNum);
    MM.BotDifficulty = int(RoomInfo.BotModeDifficulty);
    MM.bMultiBomb = bool(RoomInfo.BombHold);
    MM.kGame_RoomName = RoomInfo.RoomName;
    // End:0x26D
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
    // End:0x385
    if(int(RoomInfo.IsHardCore) != 0)
    {
        MM.kGame_bHardCore = true;        
    }
    else
    {
        MM.kGame_bHardCore = false;
    }
    // End:0x3BC
    if(int(RoomInfo.IsTeamValance) != 0)
    {
        MM.kGame_TeamBalance = true;        
    }
    else
    {
        MM.kGame_TeamBalance = false;
    }
    // End:0x3F3
    if(int(RoomInfo.ResponType) == 1)
    {
        MM.bSDRespawn = true;        
    }
    else
    {
        MM.bSDRespawn = false;
    }
    Log("[BTTcpHandler_DS_Script::rfAckChangeRoomSetting] End!!");
    return true;
    //return;    
}

event bool rfAckGetBooty(int Result, string ErrMsg, array<int> PrizeWinUserID, array<int> BootyItemID, array<int> BootyPartsID)
{
    return false;
    //return;    
}

event bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel)
{
    return false;
    //return;    
}

event bool rfAckChangeUserState(int Result, string ErrMsg, array<int> UserIDs, array<byte> Positions, array<int> Numbers, array<byte> OldStates, array<byte> NewStates)
{
    return false;
    //return;    
}

event bool rfReqNotifyChangeRoomState(byte RoomState)
{
    return false;
    //return;    
}

event bool rfAckNotifyMyCharInfoToRoomUser(int Result, string ErrMsg, int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost, string UserIP, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor)
{
    return false;
    //return;    
}

event bool rfAckAutoChangedTeamUserList(array<int> UserID, array<int> TeamNum)
{
    return false;
    //return;    
}

event bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    return false;
    //return;    
}

event bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    return false;
    //return;    
}

event bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    return false;
    //return;    
}

event bool rfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    return false;
    //return;    
}

event bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    Log((((((("[BTTcpHandler_DS_Script::rfAckStartGame] GameNumber=" $ string(GameNumber)) @ "ClientsCount=") $ string(ClientsCount)) @ "StartSeed=") $ string(StartSeed)) @ "Result=") $ string(Result));
    // End:0xC3
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
        __NFUN_270__("LoadingInfo - Failed Start NetworkChecking");
        sfReqFailedStartGame(1);
        return false;
    }
    Log("[BTTcpHandler_DS_Script::rfAckStartGame] End");
    __NFUN_270__("LoadingInfo - Start Game");
    return true;
    //return;    
}

event bool rfAckConnectGame(int UserID, int Result)
{
    return false;
    //return;    
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
    //return;    
}

event bool rfAckRegisterOtherUdpInfo(int UID, string IP, int Port, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    Log("[BTTcpHandler_DS_Script::rfAckRegisterOtherUdpInfo] Begin!");
    // End:0xC7
    if(int(Intervention) == 1)
    {
        // End:0xC7
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
    //return;    
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
    //return;    
}

event bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    Log("[BTTcpHandler_DS_Script::rfAckGetHolePunchingResult] Begin!");
    MM.CheckHolePunchingResult(Result, Phrase, InterventionUserID, Intervention, FailedUserIDs);
    Log("[BTTcpHandler_DS_Script::rfAckGetHolePunchingResult] End!");
    return true;
    //return;    
}

event bool rfReqRelayServerOn(string RelayServerIP, int RelayServerPortNum)
{
    Log("[BTTcpHandler_DS_Script::rfReqRelayServerOn] Begin!");
    Log(((("[BTTcpHandler_DS_Script::rfReqRelayServerOn] RelayServerIP=" $ RelayServerIP) $ ", ") $ "RelayServerPortNum=") $ string(RelayServerPortNum));
    MM.LowRelayServerOn(RelayServerIP, RelayServerPortNum);
    Log("[BTTcpHandler_DS_Script::rfReqRelayServerOn] End!");
    return true;
    //return;    
}

event bool rfAckSuccessStartGame(int Result, string ErrMsg, byte IsHost, string HostIP, int HostPort, int LoadingStep)
{
    local bool bSuccessStartMatch;

    Log("[BTTcpHandler_DS_Script::rfAckSuccessStartGame] Begin! Result=" $ string(Result));
    // End:0xAD
    if(Result != 0)
    {
        MM.kTcpChannel.sfReqFailedStartGame(LoadingStep);
        Log("[BTTcpHandler_DS_Script::rfAckSuccessStartGame] End!");
        return true;
    }
    MM.bForceGameOut = false;
    MM.BotTutorial = MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_BotTutorial();
    MM.BeginnerMode = MM.kGame_GameMode == Class'Engine.wGameSettings'.static.GetModeIndex_BotTeamDeathBeginner();
    Log(((("[BTTcpHandler_DS_Script::rfAckSuccessStartGame] MM.StartMatch(" $ string(MM.kRoomID)) $ ", ") $ string(MM.bIsOwner)) $ ")");
    bSuccessStartMatch = MM.StartMatch(MM.kRoomID, MM.bIsOwner);
    MM.bPendingStarted = false;
    Log("bSuccessStartMatch=" $ string(bSuccessStartMatch));
    // End:0x22F
    if(bSuccessStartMatch == true)
    {
        MM.InGameOver = 0;
        MM.InGamePlaying = true;
        MM.StartLoading();
    }
    Log("[BTTcpHandler_DS_Script::rfAckSuccessStartGame] End!");
    __NFUN_270__("LoadingInfo - Succeses Start game");
    return true;
    //return;    
}

event bool rfAckFailedStartGame(int Result, string ErrMsg, byte IsHost, int FailedUserID, int LoadingStep)
{
    Log(((((((("[BTTcpHandler_DS_Script::rfAckFailedStartGame] Result=" $ string(Result)) $ ", ") $ "FailedUserID=") $ string(FailedUserID)) $ " IsHost=") $ string(IsHost)) $ "LoadingStep=") $ string(LoadingStep));
    __NFUN_270__(((((((("LoadingInfo - Result=" $ string(Result)) $ ", ") $ "FailedUserID=") $ string(FailedUserID)) $ " IsHost=") $ string(IsHost)) $ "LoadingStep=") $ string(LoadingStep));
    // End:0x197
    if(MM.bPendingStarted == false)
    {
        Log("BTTcpHandler_DS_Script::rfAckFailedStartGame() MM.bPendingStarted == false.");
        __NFUN_270__("LoadingInfo - MM.bPendingStarted == false.");
        return true;
    }
    // End:0x1DF
    if(Result == 127)
    {
        // End:0x1CD
        if(FailedUserID == MM.kUID)
        {
            MM.FailedNetworkChecking();            
        }
        else
        {
            MM.FailedNetworkChecking();
        }        
    }
    else
    {
        // End:0x2A8
        if(Result == 128)
        {
            // End:0x27E
            if(MM.bIsOwner == true)
            {
                // End:0x227
                if(MM.ConnectClientNum > 0)
                {
                    MM.ConnectClientNum--;                    
                }
                else
                {
                    Log("BTTcpHandler_DS_Script::rfAckFailedStartGame() MM.ConnectClientNum <= 0. error!!");
                }                
            }
            else
            {
                // End:0x2A5
                if(FailedUserID == MM.kUID)
                {
                    MM.FailedNetworkChecking();
                }
            }            
        }
    }
    return true;
    //return;    
}

event bool rfAckEntryItemList(array<int> UserIDs, array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<BtrDouble> UniqueID, array<int> PaintID, int Result, string ErrMsg)
{
    local int lp1, lp2, idx;
    local EquippedItemInfo EquippedItemInfo;
    local byte byModeItem;

    Log("[BTTcpHandler_DS_Script::rfAckEntryItemList]");
    idx = 0;
    lp1 = 0;
    J0x3E:

    // End:0xEF [Loop If]
    if(lp1 < UserIDs.Length)
    {
        lp2 = 0;
        J0x55:

        // End:0xE5 [Loop If]
        if(lp2 < MM.UserInfos.Length)
        {
            // End:0xDB
            if(MM.UserInfos[lp2].UID == UserIDs[lp1])
            {
                MM.UserInfos[lp2].EquippedItems.Remove(0, MM.UserInfos[lp2].EquippedItems.Length);
                // [Explicit Break]
                goto J0xE5;
            }
            lp2++;
            // [Loop Continue]
            goto J0x55;
        }
        J0xE5:

        lp1++;
        // [Loop Continue]
        goto J0x3E;
    }
    lp1 = 0;
    J0xF6:

    // End:0x3C3 [Loop If]
    if(lp1 < UserIDs.Length)
    {
        lp2 = 0;
        J0x10D:

        // End:0x3B9 [Loop If]
        if(lp2 < MM.UserInfos.Length)
        {
            // End:0x3AF
            if(MM.UserInfos[lp2].UID == UserIDs[lp1])
            {
                // End:0x188
                if(!GameMgr.IsUseItem_InGame(MM.kGame_GameMode, ItemIDs[lp1], byModeItem))
                {
                    // [Explicit Continue]
                    goto J0x3AF;
                }
                idx = MM.UserInfos[lp2].EquippedItems.Length;
                MM.UserInfos[lp2].EquippedItems[idx] = EquippedItemInfo;
                MM.UserInfos[lp2].EquippedItems[idx].ItemID = ItemIDs[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].SlotPosition = SlotPositions[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].AddPartID = AddPartsID[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].UniqueID = UniqueID[lp1];
                MM.UserInfos[lp2].EquippedItems[idx].Painting_Item_ID = GameMgr.GetPaintingItemIDbyPaintingID(PaintID[lp1]);
                MM.UserInfos[lp2].EquippedItems[idx].byModeItem = byModeItem;
                Log((("[BTTcpHandler_DS_Script::rfAckEntryItemList] UserName=" $ MM.UserInfos[lp2].UserName) $ " EquippedItemID=") $ string(MM.UserInfos[lp2].EquippedItems[idx].ItemID));
            }
            J0x3AF:

            lp2++;
            // [Loop Continue]
            goto J0x10D;
        }
        lp1++;
        // [Loop Continue]
        goto J0xF6;
    }
    return true;
    //return;    
}

event bool rfAckEntrySkillList(array<int> UserIDs, array<int> SkillIDs, array<int> SlotPositions, int Result, string ErrMsg)
{
    local int lp1, lp2, idx;
    local EquippedSkillInfo EquippedSkillInfo;
    local byte byModeItem;

    Log(((("[BTTcpHandler_DS_Script::rfAckEntrySkillList]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    // End:0x340
    if(Result == 0)
    {
        lp1 = 0;
        J0x6B:

        // End:0x11C [Loop If]
        if(lp1 < UserIDs.Length)
        {
            lp2 = 0;
            J0x82:

            // End:0x112 [Loop If]
            if(lp2 < MM.UserInfos.Length)
            {
                // End:0x108
                if(MM.UserInfos[lp2].UID == UserIDs[lp1])
                {
                    MM.UserInfos[lp2].EquippedSkills.Remove(0, MM.UserInfos[lp2].EquippedSkills.Length);
                    // [Explicit Break]
                    goto J0x112;
                }
                lp2++;
                // [Loop Continue]
                goto J0x82;
            }
            J0x112:

            lp1++;
            // [Loop Continue]
            goto J0x6B;
        }
        lp1 = 0;
        J0x123:

        // End:0x340 [Loop If]
        if(lp1 < UserIDs.Length)
        {
            lp2 = 0;
            J0x13A:

            // End:0x336 [Loop If]
            if(lp2 < MM.UserInfos.Length)
            {
                // End:0x32C
                if(MM.UserInfos[lp2].UID == UserIDs[lp1])
                {
                    // End:0x1B5
                    if(!GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, SkillIDs[lp1], byModeItem))
                    {
                        // [Explicit Continue]
                        goto J0x32C;
                    }
                    idx = MM.UserInfos[lp2].EquippedSkills.Length;
                    MM.UserInfos[lp2].EquippedSkills[idx] = EquippedSkillInfo;
                    MM.UserInfos[lp2].EquippedSkills[idx].SkillID = SkillIDs[lp1];
                    MM.UserInfos[lp2].EquippedSkills[idx].SlotPosition = SlotPositions[lp1];
                    MM.UserInfos[lp2].EquippedSkills[idx].byModeItem = byModeItem;
                    Log((("[BTPageRoomLobby::rfAckEntrySkillList] UserName=" $ MM.UserInfos[lp2].UserName) $ " EquippedSkillID=") $ string(MM.UserInfos[lp2].EquippedSkills[idx].SkillID));
                }
                J0x32C:

                lp2++;
                // [Loop Continue]
                goto J0x13A;
            }
            lp1++;
            // [Loop Continue]
            goto J0x123;
        }
    }
    return true;
    //return;    
}

event bool rfAckEntryQSlotIDList(int UserNum, array<byte> QSlotDispOrder, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<int> TWItemID1, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID, array<int> KWItemID)
{
    local int lp1, lp2, lp3, idx;
    local EquippedQSlotInfo tmSlot;
    local byte byModeItem;

    Log("[BTTcpHandler_DS_Script::rfAckEntryQSlotIDList]");
    lp1 = 0;
    J0x3A:

    // End:0x234 [Loop If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x22A
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            // End:0x15D
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
                J0x164:

                // End:0x227 [Loop If]
                if(lp2 < 5)
                {
                    lp3 = 0;
                    J0x177:

                    // End:0x21D [Loop If]
                    if(lp3 < 4)
                    {
                        MM.UserInfos[lp1].EquippedQSlots[lp2].ItemID[lp3] = 0;
                        MM.UserInfos[lp1].EquippedQSlots[lp2].PartsID[lp3] = 0;
                        MM.UserInfos[lp1].EquippedQSlots[lp2].SkillID[lp3] = 0;
                        lp3++;
                        // [Loop Continue]
                        goto J0x177;
                    }
                    lp2++;
                    // [Loop Continue]
                    goto J0x164;
                }
            }
            // [Explicit Break]
            goto J0x234;
        }
        lp1++;
        // [Loop Continue]
        goto J0x3A;
    }
    J0x234:

    lp1 = 0;
    J0x23B:

    // End:0x775 [Loop If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x76B
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            lp2 = 0;
            J0x282:

            // End:0x768 [Loop If]
            if(lp2 < QSlotDispOrder.Length)
            {
                idx = int(QSlotDispOrder[lp2]);
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[0] = MWItemID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[1] = PistolItemID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[2] = TWItemID1[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[3] = TWItemID2[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemID[4] = KWItemID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[0] = MWPartID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[1] = PistolPartID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[2] = 0;
                MM.UserInfos[lp1].EquippedQSlots[idx].PartsID[3] = 0;
                // End:0x4E5
                if(GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, Skill1ID[lp2], byModeItem))
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[0] = Skill1ID[lp2];                    
                }
                else
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[0] = 0;
                }
                // End:0x57A
                if(GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, Skill2ID[lp2], byModeItem))
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[1] = Skill2ID[lp2];                    
                }
                else
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[1] = 0;
                }
                // End:0x610
                if(GameMgr.IsUseSkill_InGame(MM.kGame_GameMode, Skill3ID[lp2], byModeItem))
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[2] = Skill3ID[lp2];                    
                }
                else
                {
                    MM.UserInfos[lp1].EquippedQSlots[idx].SkillID[2] = 0;
                }
                // End:0x6A7
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
                goto J0x282;
            }
            // [Explicit Break]
            goto J0x775;
        }
        lp1++;
        // [Loop Continue]
        goto J0x23B;
    }
    J0x775:

    return true;
    //return;    
}

event bool rfAckEntryQSlotUniqueIDList(int UserNum, array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<BtrDouble> PistolUniqueID, array<BtrDouble> TW1UniqueID, array<BtrDouble> TW2UniqueID, array<BtrDouble> KnifeUniqueID)
{
    local int lp1, lp2, lp3, idx;
    local EquippedQSlotInfo tmSlot;

    Log("[BTTcpHandler_DS_Script::rfAckEntryQSlotUniqueIDList]");
    lp1 = 0;
    J0x40:

    // End:0x1DF [Loop If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x1D5
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
            else
            {
                lp2 = 0;
                J0x16A:

                // End:0x1D2 [Loop If]
                if(lp2 < 5)
                {
                    lp3 = 0;
                    J0x17D:

                    // End:0x1C8 [Loop If]
                    if(lp3 < 4)
                    {
                        MM.UserInfos[lp1].EquippedQSlots[lp2].ItemUniqueID[lp3] = EmptyBtrDouble();
                        lp3++;
                        // [Loop Continue]
                        goto J0x17D;
                    }
                    lp2++;
                    // [Loop Continue]
                    goto J0x16A;
                }
            }
            // [Explicit Break]
            goto J0x1DF;
        }
        lp1++;
        // [Loop Continue]
        goto J0x40;
    }
    J0x1DF:

    lp1 = 0;
    J0x1E6:

    // End:0x378 [Loop If]
    if(lp1 < MM.UserInfos.Length)
    {
        // End:0x36E
        if(MM.UserInfos[lp1].UID == UserNum)
        {
            lp2 = 0;
            J0x22D:

            // End:0x36B [Loop If]
            if(lp2 < QSlotDispOrder.Length)
            {
                idx = int(QSlotDispOrder[lp2]);
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[0] = MWUniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[1] = PistolUniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[2] = TW1UniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[3] = TW2UniqueID[lp2];
                MM.UserInfos[lp1].EquippedQSlots[idx].ItemUniqueID[4] = KnifeUniqueID[lp2];
                lp2++;
                // [Loop Continue]
                goto J0x22D;
            }
            // [Explicit Break]
            goto J0x378;
        }
        lp1++;
        // [Loop Continue]
        goto J0x1E6;
    }
    J0x378:

    return true;
    //return;    
}

event bool rfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    Log("[BTTcpHandler_DS_Script::rfAckCreateGameRoom]");
    MM.szRoomName = NetRoomInfo.RoomName;
    MM.szMapName = NetRoomInfo.MapName;
    MM.szRoomPassword = NetRoomInfo.Password;
    MM.iMaxPlayers = int(NetRoomInfo.MaxUserCnt);
    MM.szGameClass = Class'Engine.wGameSettings'.static.GetGameModeByIndex(int(NetRoomInfo.GameModeNum)).ClassName;
    MM.eWeaponLimit = NetRoomInfo.WeaponLimit;
    MM.iGoalRound = NetRoomInfo.GameRound;
    MM.iTimeLimit = NetRoomInfo.GameMinute;
    MM.PlayWithBots = int(NetRoomInfo.PlayWithBots) > 0;
    MM.BotUserTeam = int(NetRoomInfo.UserTeamNum);
    MM.BotDifficulty = int(NetRoomInfo.BotModeDifficulty);
    MM.BotNum0 = int(NetRoomInfo.MaxAFUserAndBotNum);
    MM.BotNum1 = int(NetRoomInfo.MaxRSAUserAndBotNum);
    MM.bMultiBomb = bool(NetRoomInfo.BombHold);
    MM.SD_ChangeAttackTeam = true;
    MM.SD_ChangeRound = 3;
    MM.kRoomID = NetRoomInfo.RoomNumber;
    MM.RI_Clear();
    MM.kGame_bOwner = true;
    MM.kGame_RoomName = NetRoomInfo.RoomName;
    MM.kGame_Password = NetRoomInfo.Password;
    MM.kGame_MapNum = int(NetRoomInfo.MapNum);
    MM.kGame_MapName = NetRoomInfo.MapName;
    MM.kGame_GameMode = int(NetRoomInfo.GameModeNum);
    MM.kGame_UserCount = int(NetRoomInfo.MaxUserCnt);
    MM.kGame_GameTime = NetRoomInfo.GameMinute;
    MM.kGame_GameRound = NetRoomInfo.GameRound;
    MM.kGame_WeaponLimit = int(NetRoomInfo.WeaponLimit);
    // End:0x322
    if(int(NetRoomInfo.IsHardCore) != 0)
    {
        MM.kGame_bHardCore = true;        
    }
    else
    {
        MM.kGame_bHardCore = false;
    }
    // End:0x359
    if(int(NetRoomInfo.IsTeamValance) != 0)
    {
        MM.kGame_TeamBalance = true;        
    }
    else
    {
        MM.kGame_TeamBalance = false;
    }
    // End:0x390
    if(int(NetRoomInfo.ResponType) == 1)
    {
        MM.bSDRespawn = true;        
    }
    else
    {
        MM.bSDRespawn = false;
    }
    Log(((("bSDRespawn = " @ string(MM.bSDRespawn)) $ " ") $ "NetRoomInfo.ResponType = ") @ string(NetRoomInfo.ResponType));
    MM.__OnReqSuccessStartGame__Delegate = OnReqSuccessStartGame;
    return true;
    //return;    
}

event bool rfAckGameRoomDestroy(int GameRoomNum)
{
    MM.SetHostBlocking(false);
    MM.PI_LeavelRoom();
    return true;
    //return;    
}

function OnReqSuccessStartGame(int Step)
{
    Log("[BTTcpHandler_DS_Script::OnReqSuccessStartGame] step=" $ string(Step));
    sfReqSuccessStartGame(Step);
    //return;    
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    Log("[BTTcpHandler_DS_Script::rfAckGetBotID] Result=" $ string(Result));
    Log((((((("RequestedAFCount=" $ string(RequestedAFCount)) $ ", RequestedRSACount=") $ string(RequestedRSACount)) $ ", AFBotID.Length=") $ string(AFBotID.Length)) $ ", RSABotID.Length=") $ string(RSABotID.Length));
    MM.playingLevelInfo.Game.rfAckGetBotID(Result, RequestedAFCount, RequestedRSACount, AFBotID, RSABotID);
    return true;
    //return;    
}

function bool rfAckDedicateHost_Login(int Result, int UserID, int ChannelNum, int RoomNum)
{
    Log((((("[BTTcpHandler_DS_Script::rfAckDedicateHost_Login] Result=" $ string(Result)) $ " ChannelNum=") $ string(ChannelNum)) $ " RoomNum=") $ string(RoomNum));
    __NFUN_270__((((("[BTTcpHandler_DS_Script::rfAckDedicateHost_Login] Result=" $ string(Result)) $ " ChannelNum=") $ string(ChannelNum)) $ " RoomNum=") $ string(RoomNum));
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
    MM.kGame_RoomName = ("DS Test Room (Owner=" $ string(UID)) $ ")";
    MM.kTcpDStoDP.sfAckStartDedicateHost(0, MM.kPID, MM.kDediServerID, ChannelNum, RoomNum);
    return true;
    //return;    
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

    // End:0x386 [Loop If]
    if(lp1 < UID.Length)
    {
        UserInfo = new Class'Engine.wMatchUserInfo';
        MM.UserInfos[lp1] = UserInfo;
        MM.UserInfos[lp1].UID = UID[lp1];
        MM.UserInfos[lp1].UserName = UserName[lp1];
        MM.UserInfos[lp1].Grade = Grade[lp1];
        MM.UserInfos[lp1].IsHost = int(IsHost[lp1]) == 0;
        MM.UserInfos[lp1].UserIP = UserIP[lp1];
        MM.UserInfos[lp1].TeamNum = TeamNum[lp1];
        // End:0x1DD
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
        lp2 = 0;
        J0x2E7:

        // End:0x34B [Loop If]
        if(lp2 < GMUID.Length)
        {
            // End:0x341
            if(UID[lp1] == GMUID[lp2])
            {
                GMListIdx = GMList.Length;
                GMList.Insert(GMListIdx, 1);
                GMList[GMListIdx] = UID[lp1];
            }
            lp2++;
            // [Loop Continue]
            goto J0x2E7;
        }
        // End:0x36B
        if(GMList.Length > 0)
        {
            MM.isGMRoom = true;
            // [Explicit Continue]
            goto J0x37C;
        }
        MM.isGMRoom = false;
        J0x37C:

        lp1++;
        // [Loop Continue]
        goto J0x73;
    }
    return true;
    //return;    
}

function bool rfAckUseItemDuringGame(int ErrorCode, string CharName, int ItemID, BtrDouble ItemUniqueID, int RemainCount)
{
    local Controller C;
    local wDefenceController dPC;

    Log((((((((("[BTTcpHandler_DS_Script::rfAckUseItemDuringGame] ErrorCode:" $ string(ErrorCode)) $ " / CharName :") $ CharName) $ " /ItemID:") $ string(ItemID)) $ "/ItemUniqueID:") $ __NFUN_918__(ItemUniqueID)) $ "/RemainCount:") $ string(RemainCount));
    // End:0xB9
    if(ErrorCode != 0)
    {
        return false;
    }
    // End:0x237
    if(MM.playingLevelInfo != none)
    {
        Log((string(self) $ "[rfAckUseItemDuringGame] ") $ string(MM.playingLevelInfo.NetMode));
        C = MM.playingLevelInfo.ControllerList;
        J0x127:

        // End:0x237 [Loop If]
        if(C != none)
        {
            dPC = wDefenceController(C);
            // End:0x150
            if(dPC == none)
            {                
            }
            else
            {
                Log((string(self) $ "[rfAckUseItemDuringGame] PlayerName:") $ dPC.PlayerReplicationInfo.PlayerName);
                // End:0x220
                if(((dPC != none) && dPC.PlayerReplicationInfo != none) && dPC.PlayerReplicationInfo.PlayerName == CharName)
                {
                    switch(ItemID)
                    {
                        // End:0x1FB
                        case 92005:
                            dPC.SetRepairNuclear();
                            // End:0x21D
                            break;
                        // End:0x217
                        case 92006:
                            dPC.bActiveNowRespawn = true;
                            // End:0x21D
                            break;
                        // End:0xFFFF
                        default:
                            // End:0x21D
                            break;
                            break;
                    }
                    // [Explicit Break]
                    goto J0x237;
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x127;
        }
    }
    J0x237:

    return true;
    //return;    
}
