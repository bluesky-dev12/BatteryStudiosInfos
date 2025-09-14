class BTTcpHandler extends BTTcpLink_Channel;

var export editinline BTNetMainMenu MainMenu;
var int i;
var BTTcpHandlerMed RealOne;
var localized string DisconnectedFromServerMsg;
var localized string DisconnectedFromServerQuit;
var wMatchMaker MM;
var wGameManager GameMgr;
var bool bTutorial;
var bool bTutorialEnteringRoom;
var GameRoomInfo TutorialRoomInfo;

function bool InitNetwork()
{
    return RealOne.InitNetwork();
    //return;    
}

function bool Connect(string sIpaddr, int nPort)
{
    return RealOne.Connect(sIpaddr, nPort);
    //return;    
}

function bool Close()
{
    return RealOne.Close();
    //return;    
}

event Created()
{
    super(Object).Created();
    RealOne = new Class'GUIWarfare_Decompressed.BTTcpHandlerMed';
    RealOne.Owner = self;
    //return;    
}

function OnConnect(int ErrCode)
{
    __NFUN_270__("[BTTcpHandler::OnConnect] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandler::OnConnect] ErrCode=" $ string(ErrCode));
    super.OnConnect(ErrCode);
    MainMenu.rMM.bHasChannelTCP = true;
    MainMenu.bConnectedChannelServer = true;
    // End:0xC6
    if(MainMenu.page_ServerSelection != none)
    {
        MainMenu.page_ServerSelection.TcpChannel_OnConnect(ErrCode);
    }
    //return;    
}

function OnClose(int ErrCode)
{
    __NFUN_270__("[BTTcpHandler::OnClose] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandler::OnClose] ErrCode=" $ string(ErrCode));
    super.OnClose(ErrCode);
    MainMenu.rMM.bHasChannelTCP = false;
    MainMenu.bConnectedChannelServer = false;
    // End:0xC2
    if(MainMenu.page_ServerSelection != none)
    {
        MainMenu.page_ServerSelection.TcpChannel_OnClose(ErrCode);
    }
    //return;    
}

function OnError(int ErrCode)
{
    __NFUN_270__("[BTTcpHandler::OnError] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandler::OnError] ErrCode=" $ string(ErrCode));
    super.OnError(ErrCode);
    MainMenu.rMM.bHasChannelTCP = false;
    MainMenu.bConnectedChannelServer = false;
    // End:0xC2
    if(MainMenu.page_ServerSelection != none)
    {
        MainMenu.page_ServerSelection.TcpChannel_OnError(ErrCode);
    }
    //return;    
}

function OnReqSuccessStartGame(int Step)
{
    Log((("[BTTcpHandler::OnReqSuccessStartGame] step=" $ string(Step)) $ " bTutorial=") $ string(bTutorial));
    // End:0x7D
    if(bTutorial)
    {
        rfAckSuccessStartGame(0, "", 1, "127.0.0.1", 7777, Step);        
    }
    else
    {
        sfReqSuccessStartGame(Step);
    }
    //return;    
}

function BeginTutorial(string MapName)
{
    local wMatchUserInfo UserInfo;

    Log("[BTTcpHandler::BeginTutorial]");
    SetupTutorialRoomInfo(MapName);
    MM.UserInfos.Length = 0;
    UserInfo = new Class'Engine.wMatchUserInfo';
    MM.UserInfos[0] = UserInfo;
    MM.UserInfos[0].UID = MM.kUID;
    MM.UserInfos[0].UserName = MM.kUserName;
    MM.UserInfos[0].Grade = MM.kLevel;
    MM.UserInfos[0].IsHost = true;
    MM.UserInfos[0].UserIP = "";
    MM.UserInfos[0].TeamNum = 0;
    MM.UserInfos[0].ClanName = MM.kClanName;
    MM.UserInfos[0].ClanMark = MM.kClanPattern;
    MM.UserInfos[0].ClanBG = MM.kClanBG;
    MM.UserInfos[0].ClanBL = MM.kClanBL;
    MM.UserInfos[0].IsLookingFor = int(MM.kClanIsRecruit);
    RealOne.sfReqMyEquipedItemList();
    //return;    
}

function SetupTutorialRoomInfo(string MapName)
{
    Log("[BTTcpHandler::SetupTutorialRoomInfo]");
    TutorialRoomInfo.RoomName = "T u t O R i a L";
    TutorialRoomInfo.MaxUserCnt = 1;
    TutorialRoomInfo.GameClass = "WGame.wTeamGame";
    TutorialRoomInfo.WeaponLimit = 0;
    TutorialRoomInfo.GameRound = 9999;
    TutorialRoomInfo.GameMinute = 60;
    TutorialRoomInfo.RoomNumber = 9999;
    TutorialRoomInfo.PlayWithBots = 1;
    TutorialRoomInfo.UserTeamNum = 0;
    TutorialRoomInfo.BotModeDifficulty = 100;
    TutorialRoomInfo.MaxAFUserAndBotNum = 1;
    TutorialRoomInfo.RoomOwner = MM.kUserName;
    TutorialRoomInfo.Password = "";
    TutorialRoomInfo.MapNum = 1;
    TutorialRoomInfo.MapName = MapName;
    TutorialRoomInfo.GameModeNum = 8;
    TutorialRoomInfo.MaxUserCnt = 1;
    TutorialRoomInfo.WeaponLimit = 0;
    TutorialRoomInfo.IsHardCore = 0;
    TutorialRoomInfo.IsTeamValance = 0;
    //return;    
}

function BeginTutorialCreateRoom()
{
    Log("[BTTcpHandler::BeginTutorialCreateRoom]");
    bTutorial = true;
    bTutorialEnteringRoom = true;
    RealOne.sfReqChangeUserState(7, 0);
    RealOne.sfReqNotifyStartTutorial();
    MainMenu.InTutorial = true;
    rfAckCreateGameRoom(0, "", MM.kUID, "127.0.0.1", TutorialRoomInfo);
    //return;    
}

function OnPageRoomLobbyInited()
{
    local int iResultTutorial;

    Log("[BTTcpHandler::OnPageRoomLobbyInited] bTutorial=" $ string(bTutorial));
    // End:0x236
    if(bTutorial)
    {
        // End:0xDF
        if(bTutorialEnteringRoom)
        {
            MM.BotTutorial = true;
            rfAckGameRoomInfo(0, "", TutorialRoomInfo);
            rfAckStartGame(TutorialRoomInfo.RoomNumber, 0, 0, 0, "");
            MM.ForceSetLoadingStep(2);
            MM.ForceSetLoadingStep(3);
            MM.ForceSetLoadingStep(4);
            rfAckSuccessStartGame(0, "", 1, "127.0.0.1", 7777, 5);
            bTutorialEnteringRoom = false;            
        }
        else
        {
            MainMenu.InTutorial = false;
            rfAckLeaveRoom(TutorialRoomInfo.RoomNumber, MM.kUID, MM.kUserName, 0, "");
            // End:0x16E
            if(MM.kFirstTutorial == true)
            {
                // End:0x153
                if(MM.bCompletedBotTutorial == true)
                {
                    iResultTutorial = 0;                    
                }
                else
                {
                    iResultTutorial = 1;
                }
                MM.kFirstTutorial = false;                
            }
            else
            {
                // End:0x18E
                if(MM.bCompletedBotTutorial == true)
                {
                    iResultTutorial = 2;                    
                }
                else
                {
                    iResultTutorial = 3;
                }
            }
            MM.bCompletedBotTutorial = false;
            Log((("[BTTcpHandler::NotifyEndTutorial] Result = " $ string(iResultTutorial)) $ " Grade = ") $ string(MM.TutorialGrade));
            // End:0x21A
            if(iResultTutorial == 0)
            {
                MM.bAutoMoveNoviceChannel = true;
            }
            RealOne.sfReqNotifyEndTutorial(iResultTutorial);
            bTutorial = false;
        }
    }
    //return;    
}

function endTutorial()
{
    Log("[BTTcpHandler::EndTutorial]");
    rfAckDisconnectGame(0, MM.kUID, MM.kUserName);
    //return;    
}

function bool rfAckMyEquipedItemList(array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<int> PaintID, array<BtrDouble> UniqueID, int Result)
{
    local int lp1, idx;
    local EquippedItemInfo EquippedItemInfo;
    local wItemBoxHK ItemInfo;

    Log("[BTTcpHandler::rfAckMyEquipedItemList]");
    lp1 = 0;
    J0x31:

    // End:0x242 [Loop If]
    if(lp1 < ItemIDs.Length)
    {
        ItemInfo = GameMgr.FindUIItem(ItemIDs[lp1]);
        // End:0xA1
        if(!(int(ItemInfo.byModeItem) == 0) || int(ItemInfo.byModeItem) == MM.kGame_GameMode)
        {
            // [Explicit Continue]
            goto J0x238;
        }
        idx = MM.UserInfos[0].EquippedItems.Length;
        MM.UserInfos[0].EquippedItems[idx] = EquippedItemInfo;
        MM.UserInfos[0].EquippedItems[idx].ItemID = ItemIDs[lp1];
        MM.UserInfos[0].EquippedItems[idx].SlotPosition = SlotPositions[lp1];
        MM.UserInfos[0].EquippedItems[idx].AddPartID = AddPartsID[lp1];
        MM.UserInfos[0].EquippedItems[idx].UniqueID = UniqueID[lp1];
        MM.UserInfos[0].EquippedItems[idx].Painting_Item_ID = GameMgr.GetPaintingItemIDbyPaintingID(PaintID[lp1]);
        Log("[BTTcpHandler::rfAckMyEquipedItemList] " $ string(MM.UserInfos[0].EquippedItems[idx].ItemID));
        J0x238:

        lp1++;
        // [Loop Continue]
        goto J0x31;
    }
    RealOne.sfReqMyEquipedSkillList();
    return true;
    //return;    
}

function bool rfAckMyEquipedSkillList(array<int> SkillIDs, array<int> SlotPositions, int Result)
{
    local int lp1, idx;
    local EquippedSkillInfo SkillInfo;
    local wItemBoxHK ItemInfo;

    Log("[BTTcpHandler::rfAckMyEquipedSkillList]");
    // End:0x15F
    if(Result == 0)
    {
        lp1 = 0;
        J0x3D:

        // End:0x15C [Loop If]
        if(lp1 < SkillIDs.Length)
        {
            ItemInfo = GameMgr.FindUIItem(SkillIDs[lp1]);
            // End:0xAD
            if(!(int(ItemInfo.byModeItem) == 0) || int(ItemInfo.byModeItem) == MM.kGame_GameMode)
            {
                // [Explicit Continue]
                goto J0x152;
            }
            idx = MM.UserInfos[0].EquippedSkills.Length;
            MM.UserInfos[0].EquippedSkills[idx] = SkillInfo;
            MM.UserInfos[0].EquippedSkills[idx].SkillID = SkillIDs[lp1];
            MM.UserInfos[0].EquippedSkills[idx].SlotPosition = SlotPositions[lp1];
            J0x152:

            lp1++;
            // [Loop Continue]
            goto J0x3D;
        }        
    }
    else
    {
        // End:0x16E
        if(Result == 113)
        {            
        }
    }
    RealOne.sfReqMyEquipedQSlotList();
    return true;
    //return;    
}

function bool rfAckMyEquipedQSlotList(array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<BtrDouble> PistolUniqueID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<BtrDouble> TW1UniqueID, array<int> TWItemID1, array<BtrDouble> TW2UniqueID, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID, int Result)
{
    local int lp1, idx;
    local EquippedQSlotInfo tmSlot;

    Log("[BTTcpHandler::rfAckEntryQSlotIDList]");
    lp1 = 0;
    J0x30:

    // End:0x35B [Loop If]
    if(lp1 < QSlotDispOrder.Length)
    {
        idx = MM.UserInfos[0].EquippedQSlots.Length;
        MM.UserInfos[0].EquippedQSlots[idx] = tmSlot;
        MM.UserInfos[0].EquippedQSlots[idx].ItemID[0] = MWItemID[lp1];
        MM.UserInfos[0].EquippedQSlots[idx].ItemID[1] = PistolItemID[lp1];
        MM.UserInfos[0].EquippedQSlots[idx].ItemID[2] = TWItemID1[lp1];
        MM.UserInfos[0].EquippedQSlots[idx].ItemID[3] = TWItemID2[lp1];
        MM.UserInfos[0].EquippedQSlots[idx].PartsID[0] = MWPartID[lp1];
        MM.UserInfos[0].EquippedQSlots[idx].PartsID[1] = PistolPartID[lp1];
        MM.UserInfos[0].EquippedQSlots[idx].PartsID[2] = 0;
        MM.UserInfos[0].EquippedQSlots[idx].PartsID[3] = 0;
        MM.UserInfos[0].EquippedQSlots[idx].SkillID[0] = Skill1ID[lp1];
        MM.UserInfos[0].EquippedQSlots[idx].SkillID[1] = Skill2ID[lp1];
        MM.UserInfos[0].EquippedQSlots[idx].SkillID[2] = Skill3ID[lp1];
        MM.UserInfos[0].EquippedQSlots[idx].SkillID[3] = Skill4ID[lp1];
        MM.UserInfos[0].EquippedQSlots[idx].Painting_Item_ID[0] = GameMgr.GetPaintingItemIDbyPaintingID(MWPaintID[lp1]);
        MM.UserInfos[0].EquippedQSlots[idx].Painting_Item_ID[1] = GameMgr.GetPaintingItemIDbyPaintingID(PistolPaintID[lp1]);
        lp1++;
        // [Loop Continue]
        goto J0x30;
    }
    BeginTutorialCreateRoom();
    return true;
    //return;    
}

function bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3)
{
    return RealOne.sfReqHash(HashField0, HashField1, HashField2, HashField3);
    //return;    
}

function bool sfReqLogin(string id)
{
    return RealOne.sfReqLogin(id);
    //return;    
}

function bool sfReqForceLogoutByOwner()
{
    return RealOne.sfReqForceLogoutByOwner();
    //return;    
}

function bool sfReqStartNatDiag(string Server1Addr, int Server1Port, string Server2Addr, int Server2Port)
{
    return RealOne.sfReqStartNatDiag(Server1Addr, Server1Port, Server2Addr, Server2Port);
    //return;    
}

function bool sfReqLogin2(string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, string Guid, int UserType)
{
    return RealOne.sfReqLogin2(CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, Guid, UserType);
    //return;    
}

function bool sfReqCharInfo()
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqCharInfo();
    }
    //return;    
}

function bool sfReqFriendList()
{
    return RealOne.sfReqFriendList();
    //return;    
}

function bool sfReqChannelList(int bChannelType)
{
    return RealOne.sfReqChannelList(bChannelType);
    //return;    
}

function bool sfReqEnterChannel(int id)
{
    Log("[BTTcpHandler::sfReqEnterChannel] ID=" $ string(id));
    return RealOne.sfReqEnterChannel(id);
    //return;    
}

function bool sfReqLeaveChannel(int id)
{
    // End:0x5B
    if((bTutorial && !MainMenu.EnterBotMode) && !MainMenu.CreateBotMode)
    {
        rfAckLeaveChannel(0, MM.kUserName, MM.kUID);        
    }
    else
    {
        MainMenu.Controller.ViewportOwner.Actor.clog("sfReqLeaveChannel");
        return RealOne.sfReqLeaveChannel(id);
    }
    //return;    
}

function bool sfReqChannelUserList(int id, int StartIndex, int Count)
{
    return RealOne.sfReqChannelUserList(id, StartIndex, Count);
    //return;    
}

function bool sfReqRoomList(int id, int StartIndex, int Count)
{
    return RealOne.sfReqRoomList(id, StartIndex, Count);
    //return;    
}

function bool sfReqEnterRoom(int GameNum, string Password, byte RoomEnterType)
{
    // End:0x5D
    if(bTutorial)
    {
        rfAckEnterRoom(9999, MM.kUID, MM.kUID, MM.kUserName, 0, 0, "127.0.01", "", 0, 0, 0, 0, 0, "", 0, 0, 0, 0, 0, 0);        
    }
    else
    {
        return RealOne.sfReqEnterRoom(GameNum, Password, RoomEnterType);
    }
    //return;    
}

function bool sfReqRoomUserList(int GameNum)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqRoomUserList(GameNum);
    }
    //return;    
}

function bool sfReqLeaveRoom(int Num)
{
    return RealOne.sfReqLeaveRoom(Num);
    //return;    
}

function bool sfReqCreateGameRoom(GameRoomInfo NetRoomInfo)
{
    return RealOne.sfReqCreateGameRoom(NetRoomInfo);
    //return;    
}

function bool sfReqGameRoomInfo(int GameNum, int UID)
{
    Log("[BTTcpHandler::sfReqGameRoomInfo] bTutorial=" $ string(bTutorial));
    // End:0x46
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqGameRoomInfo(GameNum, UID);
    }
    //return;    
}

function bool sfReqSelectMap(int GameNum, int UID, string MapName)
{
    return RealOne.sfReqSelectMap(GameNum, UID, MapName);
    //return;    
}

function bool sfReqBanUser(int GameNum, int UID, int BanUID)
{
    return RealOne.sfReqBanUser(GameNum, UID, BanUID);
    //return;    
}

function bool sfReqChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum)
{
    return RealOne.sfReqChangeGameMode(GameNum, UID, GameMode, GameModeNum);
    //return;    
}

function bool sfReqChangeRoomOwner(int GameNum, int UID, int NewOwner)
{
    return RealOne.sfReqChangeRoomOwner(GameNum, UID, NewOwner);
    //return;    
}

function bool sfReqChangeTeam(int TeamNum)
{
    return RealOne.sfReqChangeTeam(TeamNum);
    //return;    
}

function bool sfReqIsHostAvailable(string MyIp, int CPUGrade, int RamGrade, int VGAGrade, int VGARam)
{
    return RealOne.sfReqIsHostAvailable(MyIp, CPUGrade, RamGrade, VGAGrade, VGARam);
    //return;    
}

function bool sfReqGameHostInfo(int GameNumber)
{
    return RealOne.sfReqGameHostInfo(GameNumber);
    //return;    
}

function bool sfReqStartGame(int GameNumber)
{
    return RealOne.sfReqStartGame(GameNumber);
    //return;    
}

function bool sfReqUpdateScore(int GameNumber, array<int> UserIDs, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> Points, array<int> Scores, array<int> TeamScores, array<int> RoundJoin, array<int> TimeJoin, int Playtime, byte GameEndType, array<string> UserNames, byte IsAIClear)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqUpdateScore(GameNumber, UserIDs, Kills, Assists, Deaths, EXPs, Points, Scores, TeamScores, RoundJoin, TimeJoin, Playtime, GameEndType, UserNames, IsAIClear);
    }
    //return;    
}

function bool sfReqChangeRoomMaxNum(int GameNum, int UID, int Number, int TeamNum)
{
    return RealOne.sfReqChangeRoomMaxNum(GameNum, UID, Number, TeamNum);
    //return;    
}

function bool sfReqIsGameRoomPlaying(int GameRoomNum)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqIsGameRoomPlaying(GameRoomNum);
    }
    //return;    
}

function bool sfReqGameOver(int UID, int GameRoomNumber)
{
    // End:0x2D
    if(bTutorial)
    {
        rfAckGameOver(MM.kUID, TutorialRoomInfo.RoomNumber, 0, "");        
    }
    else
    {
        return RealOne.sfReqGameOver(UID, GameRoomNumber);
    }
    //return;    
}

function bool sfReqRelayServerOn(string RelayServerIP, int RelayServerPortNum)
{
    return RealOne.sfReqRelayServerOn(RelayServerIP, RelayServerPortNum);
    //return;    
}

function bool sfReqRelayServerOff()
{
    return RealOne.sfReqRelayServerOff();
    //return;    
}

function bool sfReqConnectGame()
{
    return RealOne.sfReqConnectGame();
    //return;    
}

function bool sfReqDisconnectGame()
{
    // End:0x2F
    if(bTutorial)
    {
        rfAckDisconnectGame(0, MM.kUID, MM.kUserName);        
    }
    else
    {
        return RealOne.sfReqDisconnectGame();
    }
    //return;    
}

function bool sfReqNotifyClientJoinTime(int JoinedClientID)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqNotifyClientJoinTime(JoinedClientID);
    }
    //return;    
}

function bool sfReqRegisterMyUdpInfo(byte IsHost, string IP, int Port, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    // End:0x15
    if(bTutorial)
    {
        rfAckRegisterMyUdpInfo(0, "");        
    }
    else
    {
        return RealOne.sfReqRegisterMyUdpInfo(IsHost, IP, Port, Intervention, HostInnerIP, HostInnerPort);
    }
    //return;    
}

function bool sfReqClientUdpInfoList(int GameNum)
{
    return RealOne.sfReqClientUdpInfoList(GameNum);
    //return;    
}

function bool sfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    return RealOne.sfReqNotifyLevelUp(LevelUpUserID, Level, Exp, ItemID, PartID);
    //return;    
}

function bool sfReqChangeRoomSetting(GameRoomInfo RoomInfo)
{
    return RealOne.sfReqChangeRoomSetting(RoomInfo);
    //return;    
}

function bool sfReqSetUserBootySeedValue(int UserID, int SeedValue)
{
    return RealOne.sfReqSetUserBootySeedValue(UserID, SeedValue);
    //return;    
}

function bool sfReqGetBooty(int RoomNumber)
{
    local array<int> emptyArray;

    // End:0x24
    if(bTutorial)
    {
        rfAckGetBooty(0, "", emptyArray, emptyArray, emptyArray);        
    }
    else
    {
        return RealOne.sfReqGetBooty(RoomNumber);
    }
    //return;    
}

function bool sfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    return RealOne.sfReqExteriorRoomInfo(SP, RoomNumber, IsPW, RoomName, MapName, ModeName, MapNum, ModeNum, IsTeamBalance, MaxUserCount, RoomUserCount, RoomState, BotDifficult, WeaponLimit, BotModeUserTeamNum);
    //return;    
}

function bool sfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount)
{
    return RealOne.sfReqExteriorRoomUserCount(RoomNumber, RoomUserCount);
    //return;    
}

function bool sfReqExteriorRoomState(int RoomNumber, byte RoomState)
{
    return RealOne.sfReqExteriorRoomState(RoomNumber, RoomState);
    //return;    
}

function bool sfReqChangeUserState(byte NewState, byte CheckPlaying)
{
    // End:0x22
    if(bTutorial && !MainMenu.EnterBotMode)
    {        
    }
    else
    {
        return RealOne.sfReqChangeUserState(NewState, CheckPlaying);
    }
    //return;    
}

function bool sfReqEntryItemList(int UserID)
{
    return RealOne.sfReqEntryItemList(UserID);
    //return;    
}

function bool sfReqEntrySkillList(int UserID)
{
    return RealOne.sfReqEntrySkillList(UserID);
    //return;    
}

function bool sfReqItemList(int UID)
{
    return RealOne.sfReqItemList(UID);
    //return;    
}

function bool sfReqEquipItem(int ItemID, BtrDouble UniqueID, int SlotPosition)
{
    return RealOne.sfReqEquipItem(ItemID, UniqueID, SlotPosition);
    //return;    
}

function bool sfReqConfirmItemChanged()
{
    return RealOne.sfReqConfirmItemChanged();
    //return;    
}

function bool sfReqDummy(int DelayCheck)
{
    return RealOne.sfReqDummy(DelayCheck);
    //return;    
}

function bool sfReqChatNormal(string Message)
{
    return RealOne.sfReqChatNormal(Message);
    //return;    
}

function bool sfReqSendFriendInvite(int InviteUserID, string InviteName, string InviteMsg)
{
    return RealOne.sfReqSendFriendInvite(InviteUserID, InviteName, InviteMsg);
    //return;    
}

function bool sfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    return RealOne.sfReqRecvFriendInvite(ReqUserID, ReqCharname, InviteMsg);
    //return;    
}

function bool sfReqConfirmFriendInvite(int ReqUserID, string ReqedCharname, byte IsPermit)
{
    return RealOne.sfReqConfirmFriendInvite(ReqUserID, ReqedCharname, IsPermit);
    //return;    
}

function bool sfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    return RealOne.sfReqCompleteFriendInvite(CharnameToBeInvited, IsPermit);
    //return;    
}

function bool sfReqBlockUserList()
{
    return RealOne.sfReqBlockUserList();
    //return;    
}

function bool sfReqAddBlockUserList(string CharName)
{
    return RealOne.sfReqAddBlockUserList(CharName);
    //return;    
}

function bool sfReqRemoveBlockUserList(string CharName)
{
    return RealOne.sfReqRemoveBlockUserList(CharName);
    //return;    
}

function bool sfReqChatWispher(string CharName, string Message)
{
    return RealOne.sfReqChatWispher(CharName, Message);
    //return;    
}

function bool sfReqRecvChatWispher(string CharnameFrom, string Message)
{
    return RealOne.sfReqRecvChatWispher(CharnameFrom, Message);
    //return;    
}

function bool sfReqSendMemo(array<string> cnames, string Msg, int ItemUID)
{
    return RealOne.sfReqSendMemo(cnames, Msg, ItemUID);
    //return;    
}

function bool sfReqRecvMemo(string cnameFrom, byte MemoType)
{
    return RealOne.sfReqRecvMemo(cnameFrom, MemoType);
    //return;    
}

function bool sfReqMemoList(byte Type, byte MemoType)
{
    return RealOne.sfReqMemoList(Type, MemoType);
    //return;    
}

function bool sfReqReadMemo(int MemoIdx)
{
    return RealOne.sfReqReadMemo(MemoIdx);
    //return;    
}

function bool sfReqDelMemo(array<int> MemoIdx, byte Type)
{
    return RealOne.sfReqDelMemo(MemoIdx, Type);
    //return;    
}

function bool sfReqUserSkillList(int UserID)
{
    return RealOne.sfReqUserSkillList(UserID);
    //return;    
}

function bool sfReqEquipSkill(int SkillID, int SkillUniqueID, byte NewSlotPosition)
{
    return RealOne.sfReqEquipSkill(SkillID, SkillUniqueID, NewSlotPosition);
    //return;    
}

function bool sfReqConfirmSkillChanged()
{
    return RealOne.sfReqConfirmSkillChanged();
    //return;    
}

function bool sfReqNotifyChangedItemState()
{
    return RealOne.sfReqNotifyChangedItemState();
    //return;    
}

function bool sfReqNotifyChangedSkillState()
{
    return RealOne.sfReqNotifyChangedSkillState();
    //return;    
}

function bool sfReqNotifyExpiredSkillIDs()
{
    return RealOne.sfReqNotifyExpiredSkillIDs();
    //return;    
}

function bool sfReqNotifyExpiredItemIDs()
{
    return RealOne.sfReqNotifyExpiredItemIDs();
    //return;    
}

function bool sfReqGiveSkill()
{
    return RealOne.sfReqGiveSkill();
    //return;    
}

function bool sfReqForceGameOver()
{
    return RealOne.sfReqForceGameOver();
    //return;    
}

function bool sfReqShopItemList()
{
    return RealOne.sfReqShopItemList();
    //return;    
}

function bool sfReqBuyShopItem(int ItemID, BtrDouble ItemUniqueID, byte BuyOption1, byte BuyOption2)
{
    return RealOne.sfReqBuyShopItem(ItemID, ItemUniqueID, BuyOption1, BuyOption2);
    //return;    
}

function bool sfReqSellShopItem(BtrDouble ItemUniqueID, int Count)
{
    return RealOne.sfReqSellShopItem(ItemUniqueID, Count);
    //return;    
}

function bool sfReqModifyWeapon(BtrDouble UniqueID, int AddPartID, int PaintID)
{
    return RealOne.sfReqModifyWeapon(UniqueID, AddPartID, PaintID);
    //return;    
}

function bool sfReqUpdateWeaponDurability(int TotalPlayTime, array<int> OwnerID, array<int> Number, array<BtrDouble> UniqueItemID, array<int> UsingSec, array<int> UsingRoundInSD)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqUpdateWeaponDurability(TotalPlayTime, OwnerID, Number, UniqueItemID, UsingSec, UsingRoundInSD);
    }
    //return;    
}

function bool sfReqRepairCost(array<BtrDouble> UniqueItemID)
{
    return RealOne.sfReqRepairCost(UniqueItemID);
    //return;    
}

function bool sfReqRepairItem(array<BtrDouble> UniqueItemcID)
{
    return RealOne.sfReqRepairItem(UniqueItemcID);
    //return;    
}

function bool sfReqQSlotList()
{
    return RealOne.sfReqQSlotList();
    //return;    
}

function bool sfReqUpdateQSlot(int QSlotID, string QSlotName, BtrDouble MWItemID, BtrDouble PistolItemID, BtrDouble TWItemID1, BtrDouble TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4)
{
    return RealOne.sfReqUpdateQSlot(QSlotID, QSlotName, MWItemID, PistolItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4);
    //return;    
}

function bool sfReqMyMoney()
{
    return RealOne.sfReqMyMoney();
    //return;    
}

function bool sfReqAuctionMyItemRegister(BtrDouble UniqueID, int ItemCount, int BeginPrice, int PeriodHour, int InstantlyBuyingPrice)
{
    return RealOne.sfReqAuctionMyItemRegister(UniqueID, ItemCount, BeginPrice, PeriodHour, InstantlyBuyingPrice);
    //return;    
}

function bool sfReqAuctionMyItemCancel(int UniqueID)
{
    return RealOne.sfReqAuctionMyItemCancel(UniqueID);
    //return;    
}

function bool sfReqAuctionItemList(byte Section, string Keyword, int ItemRank, byte ItemClassfy, byte IsAvailable, int PageNum, int Count, int SortOpt)
{
    return RealOne.sfReqAuctionItemList(Section, Keyword, ItemRank, ItemClassfy, IsAvailable, PageNum, Count, SortOpt);
    //return;    
}

function bool sfReqAuctionInstantlyBuying(int UniqueID)
{
    return RealOne.sfReqAuctionInstantlyBuying(UniqueID);
    //return;    
}

function bool sfReqAuctionBidding(int UniqueID, int BiddingPrice)
{
    return RealOne.sfReqAuctionBidding(UniqueID, BiddingPrice);
    //return;    
}

function bool sfReqEntryQSlotUniqueIDList(int UserNum)
{
    return RealOne.sfReqEntryQSlotUniqueIDList(UserNum);
    //return;    
}

function bool sfReqEntryQSlotIDList(int UserNum)
{
    return RealOne.sfReqEntryQSlotIDList(UserNum);
    //return;    
}

function bool sfReqServerTime()
{
    return RealOne.sfReqServerTime();
    //return;    
}

function bool sfReqAuctionItemListCount(byte Section, byte Classfy, int ItemType, int ItemGrade)
{
    return RealOne.sfReqAuctionItemListCount(Section, Classfy, ItemType, ItemGrade);
    //return;    
}

function bool sfReqGameOverEnd()
{
    Log("[END] sfReqGameOverEnd bTutorial=" $ string(bTutorial));
    // End:0x44
    if(bTutorial)
    {
        rfAckGameOverEnd(0, "");        
    }
    else
    {
        return RealOne.sfReqGameOverEnd();
    }
    //return;    
}

function bool sfReqSellShopItemInfo(BtrDouble UniqueItemID, int Count)
{
    return RealOne.sfReqSellShopItemInfo(UniqueItemID, Count);
    //return;    
}

function bool sfReqDupCheckClanName(string ClanNam)
{
    return RealOne.sfReqDupCheckClanName(ClanNam);
    //return;    
}

function bool sfReqCreateClan(string ClanName, string ClanURL, string ClanIntro, string ClanKeyword, byte ClanRegion)
{
    return RealOne.sfReqCreateClan(ClanName, ClanURL, ClanIntro, ClanKeyword, ClanRegion);
    //return;    
}

function bool sfReqClanInfo(string ClanName)
{
    return RealOne.sfReqClanInfo(ClanName);
    //return;    
}

function bool sfReqInviteClan(string CharName, string InviteMsg)
{
    return RealOne.sfReqInviteClan(CharName, InviteMsg);
    //return;    
}

function bool sfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    return RealOne.sfReqRecvClanInvite(InviterUserDBID, InviterCharname, ClanName, InviteMsg);
    //return;    
}

function bool sfReqJoinClan(string ClanName, string ClanManagerName, string Message)
{
    return RealOne.sfReqJoinClan(ClanName, ClanManagerName, Message);
    //return;    
}

function bool sfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    return RealOne.sfReqRecvJoinClan(UserIdx, CharName, Message);
    //return;    
}

function bool sfReqSerachClan(byte SearchType, string Keyword, byte ClanStatus, byte ClanRegion, int ReqPage)
{
    return RealOne.sfReqSerachClan(SearchType, Keyword, ClanStatus, ClanRegion, ReqPage);
    //return;    
}

function bool sfReqClanUserList(string ClanName)
{
    return RealOne.sfReqClanUserList(ClanName);
    //return;    
}

function bool sfReqAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    return RealOne.sfReqAdjustClanMemberGrade(ClanName, CharName, CharGrade);
    //return;    
}

function bool sfReqClanNews(string ClanName)
{
    return RealOne.sfReqClanNews(ClanName);
    //return;    
}

function bool sfReqClanSecession(string ClanName)
{
    return RealOne.sfReqClanSecession(ClanName);
    //return;    
}

function bool sfReqClanClose(string ClanName)
{
    return RealOne.sfReqClanClose(ClanName);
    //return;    
}

function bool sfReqClanChangeInfo(string ClanName, byte IsRecruit, byte Region, string Keyword, string ClanIntro, string Notice)
{
    return RealOne.sfReqClanChangeInfo(ClanName, IsRecruit, Region, Keyword, ClanIntro, Notice);
    //return;    
}

function bool sfReqClanPersonelIntro(string ClanName, string CharName, string PersonelIntro)
{
    return RealOne.sfReqClanPersonelIntro(ClanName, CharName, PersonelIntro);
    //return;    
}

function bool sfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    return RealOne.sfReqClanCharPersonelIntro(ClanName, CharName);
    //return;    
}

function bool sfReqSuccessStartGame(int LoadingStep)
{
    return RealOne.sfReqSuccessStartGame(LoadingStep);
    //return;    
}

function bool sfReqFailedStartGame(int LoadingStep)
{
    return RealOne.sfReqFailedStartGame(LoadingStep);
    //return;    
}

function bool sfReqNotifyLoadingState(byte LoadingState)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqNotifyLoadingState(LoadingState);
    }
    //return;    
}

function bool sfReqTestDouble(BtrDouble vDouble, array<BtrDouble> vDoubles)
{
    return RealOne.sfReqTestDouble(vDouble, vDoubles);
    //return;    
}

function bool sfReqChatClan(string Message)
{
    return RealOne.sfReqChatClan(Message);
    //return;    
}

function bool sfReqGetAttachedItemFromMemo(int UserID, int MemoIdx, int ItemID)
{
    return RealOne.sfReqGetAttachedItemFromMemo(UserID, MemoIdx, ItemID);
    //return;    
}

function bool sfReqSendGift(int ItemID, string RecvCharname, string RecvMessage, byte BuyOption1, byte BuyOption2)
{
    return RealOne.sfReqSendGift(ItemID, RecvCharname, RecvMessage, BuyOption1, BuyOption2);
    //return;    
}

function bool sfReqAuctionTradeHistory(int ItemID, int PartID)
{
    return RealOne.sfReqAuctionTradeHistory(ItemID, PartID);
    //return;    
}

function bool sfReqLogGetScore(KillDeathLog KillDeathLogParam, array<int> AssistUIDs, array<byte> AssistScores)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqLogGetScore(KillDeathLogParam, AssistUIDs, AssistScores);
    }
    //return;    
}

function bool sfReqLogEndEachRound(int StartCnt, int EndCnt, int RoundEndType, int RoundEndTime, byte VTeam, byte VTeamAD, int AFScore, int RSAScore, int Round)
{
    return RealOne.sfReqLogEndEachRound(StartCnt, EndCnt, RoundEndType, RoundEndTime, VTeam, VTeamAD, AFScore, RSAScore, Round);
    //return;    
}

function bool sfReqGetServerTime()
{
    return RealOne.sfReqGetServerTime();
    //return;    
}

function bool sfReqForceNatTypeSetting(int NatType)
{
    return RealOne.sfReqForceNatTypeSetting(NatType);
    //return;    
}

function bool sfReqDBCharInfo(string CharName)
{
    return RealOne.sfReqDBCharInfo(CharName);
    //return;    
}

function bool sfReqGamePlay_InstallBomb(int InstallerUID, byte InstallPos, float InstallerXCoord, float InstallerYCoord, float InstallerZCoord, int InstallerPos, int InstallerWeaponID, int InstallerWeaponPartID, int InstallerRange)
{
    return RealOne.sfReqGamePlay_InstallBomb(InstallerUID, InstallPos, InstallerXCoord, InstallerYCoord, InstallerZCoord, InstallerPos, InstallerWeaponID, InstallerWeaponPartID, InstallerRange);
    //return;    
}

function bool sfReqGamePlay_DefuseBomb(int DefuserUID, byte DefusePos, float DefuserXCoord, float DefuserYCoord, float DefuserZCoord, int DefuserPos, int DefuserWeaponID, int DefuserWeaponPartID, int DefuserRange)
{
    return RealOne.sfReqGamePlay_DefuseBomb(DefuserUID, DefusePos, DefuserXCoord, DefuserYCoord, DefuserZCoord, DefuserPos, DefuserWeaponID, DefuserWeaponPartID, DefuserRange);
    //return;    
}

function bool sfReqNotifyChangeRoomState(byte RoomState)
{
    return RealOne.sfReqNotifyChangeRoomState(RoomState);
    //return;    
}

function bool sfReqGamePlay_TakeAPoint(array<int> TakerUID, byte TakePos, array<float> TakerXCoord, array<float> TakerYCoord, array<float> TakerZCoord, array<int> TakerPos, array<int> TakerWeaponID, array<int> TakerWeaponPartID, array<int> TakerRange)
{
    return RealOne.sfReqGamePlay_TakeAPoint(TakerUID, TakePos, TakerXCoord, TakerYCoord, TakerZCoord, TakerPos, TakerWeaponID, TakerWeaponPartID, TakerRange);
    //return;    
}

function bool sfReqForceDisconnectUDPFromHost(int UserID)
{
    return RealOne.sfReqForceDisconnectUDPFromHost(UserID);
    //return;    
}

function bool sfReqRecvForceDisconnectUDPFromHost(int Result)
{
    return RealOne.sfReqRecvForceDisconnectUDPFromHost(Result);
    //return;    
}

function bool sfReqGamePlay_SetGameStartTime(array<int> UID)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqGamePlay_SetGameStartTime(UID);
    }
    //return;    
}

function bool sfReqGamePlay_SetRoundStartTime(array<int> UID)
{
    return RealOne.sfReqGamePlay_SetRoundStartTime(UID);
    //return;    
}

function bool sfReqWriteServerLog(byte Destination, string LogMsg)
{
    return RealOne.sfReqWriteServerLog(Destination, LogMsg);
    //return;    
}

function bool sfReqUpdateMyHostPriorityPoint(int HostPriorityPoint)
{
    return RealOne.sfReqUpdateMyHostPriorityPoint(HostPriorityPoint);
    //return;    
}

function bool sfReqGetUserHostPriorityPoint(int UserID)
{
    return RealOne.sfReqGetUserHostPriorityPoint(UserID);
    //return;    
}

function bool sfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    return RealOne.sfReqNotifyRelayServerAddr(RelayIP, RelayPort);
    //return;    
}

function bool sfReqGamePlay_UpdateDomScore(int AFScore, int RSAScore)
{
    return RealOne.sfReqGamePlay_UpdateDomScore(AFScore, RSAScore);
    //return;    
}

function bool sfReqGamePlay_ChangeWeaponSet(int UID, int SetNumber)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqGamePlay_ChangeWeaponSet(UID, SetNumber);
    }
    //return;    
}

function bool sfReqNotifyRecvDummyForHolePunching(int ClientUserID, byte Phrase)
{
    return RealOne.sfReqNotifyRecvDummyForHolePunching(ClientUserID, Phrase);
    //return;    
}

function bool sfReqGetHolePunchingResult()
{
    return RealOne.sfReqGetHolePunchingResult();
    //return;    
}

function bool sfReqNotifyHostBlocking(byte Blocking)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqNotifyHostBlocking(Blocking);
    }
    //return;    
}

function bool sfReqGetIsHostBlocking()
{
    return RealOne.sfReqGetIsHostBlocking();
    //return;    
}

function bool sfReqIsAvailClanURL(string ClanURL)
{
    return RealOne.sfReqIsAvailClanURL(ClanURL);
    //return;    
}

function bool sfReqGamePlay_GetChopper(int GetChopperUID, array<int> GetChopperAssistUID, float KillXCoord, float KillYCoord, float KillZCoord, int KillPos, int KillWeaponID, int KillWeaponPartID, int KillRange, int KillDamage, int ChopperCallerID, string ChopperCallerName, float ChopperXCoord, float ChopperYCoord, float ChopperZCoord)
{
    return RealOne.sfReqGamePlay_GetChopper(GetChopperUID, GetChopperAssistUID, KillXCoord, KillYCoord, KillZCoord, KillPos, KillWeaponID, KillWeaponPartID, KillRange, KillDamage, ChopperCallerID, ChopperCallerName, ChopperXCoord, ChopperYCoord, ChopperZCoord);
    //return;    
}

function bool sfReqCheckEquipedWeaponDurability()
{
    return RealOne.sfReqCheckEquipedWeaponDurability();
    //return;    
}

function bool sfReqGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3)
{
    return RealOne.sfReqGameGuardAuthData(AuthDataIndex, AuthDataVal1, AuthDataVal2, AuthDataVal3);
    //return;    
}

function bool sfReqDeleteFriend(array<string> DeleteCharName)
{
    return RealOne.sfReqDeleteFriend(DeleteCharName);
    //return;    
}

function bool sfReqRecvDeleteFriend(int Result, string FromCharName)
{
    return RealOne.sfReqRecvDeleteFriend(Result, FromCharName);
    //return;    
}

function bool sfReqChannelUserListInGameRoom(int ChannelNum, int StartIndex, int Count)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqChannelUserListInGameRoom(ChannelNum, StartIndex, Count);
    }
    //return;    
}

function bool sfReqSpecificGameRoomInfo(int RoomNum)
{
    return RealOne.sfReqSpecificGameRoomInfo(RoomNum);
    //return;    
}

function bool sfReqSpecificChannelUserInfo(int UserID)
{
    return RealOne.sfReqSpecificChannelUserInfo(UserID);
    //return;    
}

function bool sfReqNotice_GM(byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    return RealOne.sfReqNotice_GM(NoticeType, ServerID, ChannelNum, GameRoomNum, Msg);
    //return;    
}

function bool sfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    return RealOne.sfReqRecvNotice_FromGM(Result, ErrMsg, NoticeMsg, IsFromDB);
    //return;    
}

function bool sfReqForceDisconnectUser_GM(string CharName)
{
    return RealOne.sfReqForceDisconnectUser_GM(CharName);
    //return;    
}

function bool sfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    return RealOne.sfReqRecvForceDisconnected_FromGM(Result, ErrMsg);
    //return;    
}

function bool sfReqNotifyDisconnectHostInLoading(int Result, string ErrMsg, int HostID)
{
    return RealOne.sfReqNotifyDisconnectHostInLoading(Result, ErrMsg, HostID);
    //return;    
}

function bool sfReqChatWispherMyCommunity(string SourceCharName, string SenderName, string Msg)
{
    return RealOne.sfReqChatWispherMyCommunity(SourceCharName, SenderName, Msg);
    //return;    
}

function bool sfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    return RealOne.sfReqNotifyDurabilityZeroItem(Result, ErrMsg, UserID, ItemUniqueIDs, ItemIDs, ItemPartIDs, ItemSlotPos);
    //return;    
}

function bool sfReqNotifyMyCharInfoToRoomUser()
{
    return RealOne.sfReqNotifyMyCharInfoToRoomUser();
    //return;    
}

function bool sfReqStartHolePunching(int GameType, int ReqStartUserID)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqStartHolePunching(GameType, ReqStartUserID);
    }
    //return;    
}

function bool sfReqForceFailedClientLoading(int FailedUserID, int ErrCode)
{
    return RealOne.sfReqForceFailedClientLoading(FailedUserID, ErrCode);
    //return;    
}

function bool sfReqRecvForceFailedClientLoading(int ErrCode)
{
    return RealOne.sfReqRecvForceFailedClientLoading(ErrCode);
    //return;    
}

function bool sfReqItemListInItemBox(BtrDouble ItemUniqueID, int BoxItemID, byte FromContent)
{
    return RealOne.sfReqItemListInItemBox(ItemUniqueID, BoxItemID, FromContent);
    //return;    
}

function bool sfReqGetItemFromItemBox(BtrDouble ItemUniqueID, int ItemID, int ItemIDChoose, int PartIDChoose)
{
    return RealOne.sfReqGetItemFromItemBox(ItemUniqueID, ItemID, ItemIDChoose, PartIDChoose);
    //return;    
}

function bool sfReqClanMatch_GetReady()
{
    return RealOne.sfReqClanMatch_GetReady();
    //return;    
}

function bool sfReqClanMatch_StartCombat(array<int> MapNumArray, int VersusMode)
{
    return RealOne.sfReqClanMatch_StartCombat(MapNumArray, VersusMode);
    //return;    
}

function bool sfReqClanMatch_InviteCrew(string Invitee)
{
    return RealOne.sfReqClanMatch_InviteCrew(Invitee);
    //return;    
}

function bool sfReqClanMatch_RecvInviteCrew(string Inviter, string ServerIP, int Port, int WaittingID, string Msg, int MapNum, int InviteUserChannelNum, string LeaderName, string RoomName)
{
    return RealOne.sfReqClanMatch_RecvInviteCrew(Inviter, ServerIP, Port, WaittingID, Msg, MapNum, InviteUserChannelNum, LeaderName, RoomName);
    //return;    
}

function bool sfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    return RealOne.sfReqClanMatch_InviteCrewResult(Invitee, Result);
    //return;    
}

function bool sfReqClanMatch_Join(int WaittingID)
{
    return RealOne.sfReqClanMatch_Join(WaittingID);
    //return;    
}

function bool sfReqClanMatch_MemberList()
{
    return RealOne.sfReqClanMatch_MemberList();
    //return;    
}

function bool sfReqClanMatch_Leave(int WaittingID)
{
    return RealOne.sfReqClanMatch_Leave(WaittingID);
    //return;    
}

function bool sfReqClanMatch_Chat(string Msg)
{
    return RealOne.sfReqClanMatch_Chat(Msg);
    //return;    
}

function bool sfReqClanMatch_WaittingTeamList(int StartIndex, int ReturnCount)
{
    return RealOne.sfReqClanMatch_WaittingTeamList(StartIndex, ReturnCount);
    //return;    
}

function bool sfReqClanMatch_ChangeLeader(int WaitRoomIdx, int NewLeaderID, string NewLeaderName)
{
    return RealOne.sfReqClanMatch_ChangeLeader(WaitRoomIdx, NewLeaderID, NewLeaderName);
    //return;    
}

function bool sfReqClanMatch_StopSearching()
{
    return RealOne.sfReqClanMatch_StopSearching();
    //return;    
}

function bool sfReqInviteGameRoom(string GuestCharName)
{
    return RealOne.sfReqInviteGameRoom(GuestCharName);
    //return;    
}

function bool sfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    return RealOne.sfReqRecvInviteGameRoom(InviteUserServerName, InviteUserServerID, InviteUserChannelNumber, RoomUniqueID, RoomNumber, RoomName, RoomState, MapName, OwnerName, GameMode, WeaponLimit, IsTeamBalance, Password, InviteCharName);
    //return;    
}

function bool sfReqLimitedListInChannel()
{
    return RealOne.sfReqLimitedListInChannel();
    //return;    
}

function bool sfReqClanMatch_StartSearching(int RequestCount)
{
    return RealOne.sfReqClanMatch_StartSearching(RequestCount);
    //return;    
}

function bool sfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber)
{
    return RealOne.sfReqClanMatch_FoundMatch(ChannelID, RoomNumber);
    //return;    
}

function bool sfReqPermanentRoomInfo(int RoomNum)
{
    return RealOne.sfReqPermanentRoomInfo(RoomNum);
    //return;    
}

function bool sfReqQuestList()
{
    return RealOne.sfReqQuestList();
    //return;    
}

function bool sfReqQuestUpdate(int UniqueID, int GameRoomNum, array<int> QuestID, array<int> CountPrograss)
{
    // End:0x30
    if(bTutorial)
    {
        return RealOne.sfReqQuestUpdate(UniqueID, GameRoomNum, QuestID, CountPrograss);        
    }
    else
    {
        return RealOne.sfReqQuestUpdate(UniqueID, GameRoomNum, QuestID, CountPrograss);
    }
    //return;    
}

function bool sfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    return RealOne.sfReqQuestNewAvailable(AchivedQuestID, NewQuestID, IsDailyQuest, ExpiredQuest);
    //return;    
}

function bool sfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    return RealOne.sfReqDailyQuestNewAvailable(ExpiredQuestID, NewQuestID);
    //return;    
}

function bool sfReqPCBangUserList()
{
    return RealOne.sfReqPCBangUserList();
    //return;    
}

function bool sfReqRegisterMainPCBang()
{
    return RealOne.sfReqRegisterMainPCBang();
    //return;    
}

function bool sfReqRegisteredPCBangInfo()
{
    return RealOne.sfReqRegisteredPCBangInfo();
    //return;    
}

function bool sfReqWebzenCash()
{
    return RealOne.sfReqWebzenCash();
    //return;    
}

function bool sfReqWebzenShopScriptVersion()
{
    return RealOne.sfReqWebzenShopScriptVersion();
    //return;    
}

function bool sfReqBuyItemByWebzenCash(int PackageProductSeq, int ProductDisplaySeq, int PriceSeq, array<int> ItemIDs, BtrDouble ItemUniqueID, byte BuyOption1, byte BuyOption2)
{
    return RealOne.sfReqBuyItemByWebzenCash(PackageProductSeq, ProductDisplaySeq, PriceSeq, ItemIDs, ItemUniqueID, BuyOption1, BuyOption2);
    //return;    
}

function bool sfReqGiftItemByWebzenCash(string ReceiverCharName, string Message, int PackageProductSeq, int PriceSeq, int ProductDisplaySeq)
{
    return RealOne.sfReqGiftItemByWebzenCash(ReceiverCharName, Message, PackageProductSeq, PriceSeq, ProductDisplaySeq);
    //return;    
}

function bool sfReqWebzenBillingStorageList(int Page, int CountForPage, byte Type)
{
    return RealOne.sfReqWebzenBillingStorageList(Page, CountForPage, Type);
    //return;    
}

function bool sfReqWebzenBillingUseStorageItem(int StorageSeq, int StorageItemSeq, byte StorageItemType)
{
    return RealOne.sfReqWebzenBillingUseStorageItem(StorageSeq, StorageItemSeq, StorageItemType);
    //return;    
}

function bool sfReqParamCheckSum(string key, string Value)
{
    return RealOne.sfReqParamCheckSum(key, Value);
    //return;    
}

function bool sfReqClanMatch_ChangeRoomSetting(int WaitRoomIndex, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    return RealOne.sfReqClanMatch_ChangeRoomSetting(WaitRoomIndex, MapNumArray, VersusMode, IsPublic);
    //return;    
}

function bool sfReqGetBotID(byte AFCount, byte RSACount)
{
    local int lp1;
    local array<int> AF, rsa;

    // End:0x85
    if(bTutorial)
    {
        lp1 = 0;
        J0x10:

        // End:0x38 [Loop If]
        if(lp1 < int(AFCount))
        {
            AF[lp1] = 0;
            lp1++;
            // [Loop Continue]
            goto J0x10;
        }
        lp1 = 0;
        J0x3F:

        // End:0x67 [Loop If]
        if(lp1 < int(RSACount))
        {
            rsa[lp1] = 0;
            lp1++;
            // [Loop Continue]
            goto J0x3F;
        }
        rfAckGetBotID(0, AFCount, RSACount, AF, rsa);        
    }
    else
    {
        return RealOne.sfReqGetBotID(AFCount, RSACount);
    }
    //return;    
}

function bool sfReqReturnBotID(array<int> BotID)
{
    // End:0x0C
    if(bTutorial)
    {        
    }
    else
    {
        return RealOne.sfReqReturnBotID(BotID);
    }
    //return;    
}

function bool sfReqClanMatch_GetClanWaittingRoomInfo()
{
    return RealOne.sfReqClanMatch_GetClanWaittingRoomInfo();
    //return;    
}

function bool sfReqIsPaidWebzenPCBang(byte IsPaid)
{
    return RealOne.sfReqIsPaidWebzenPCBang(IsPaid);
    //return;    
}

function bool sfReqCharBlockInfo()
{
    return RealOne.sfReqCharBlockInfo();
    //return;    
}

function bool sfReqQuestGetAvailableEventList()
{
    return RealOne.sfReqQuestGetAvailableEventList();
    //return;    
}

function bool sfReqChangeRoomTitle_GM(int RoomNumber, string NewRoomTitle)
{
    return RealOne.sfReqChangeRoomTitle_GM(RoomNumber, NewRoomTitle);
    //return;    
}

function bool sfReqRandomBox_Use(BtrDouble ItemIdx, BtrDouble ItemIdx_Key)
{
    return RealOne.sfReqRandomBox_Use(ItemIdx, ItemIdx_Key);
    //return;    
}

function bool sfReqSendSystemMsg(byte RecvType, string SendCharName, string RecvCharname, SystemMsgParam MsgInfo)
{
    return RealOne.sfReqSendSystemMsg(RecvType, SendCharName, RecvCharname, MsgInfo);
    //return;    
}

function bool sfReqPaidItem_EraseRecord(BtrDouble ItemIdx, int Command)
{
    return RealOne.sfReqPaidItem_EraseRecord(ItemIdx, Command);
    //return;    
}

function bool sfReqPaidItem_BroadCast(BtrDouble ItemIdx, int Command, string Message)
{
    return RealOne.sfReqPaidItem_BroadCast(ItemIdx, Command, Message);
    //return;    
}

function bool sfReqPaidItem_ClanMarkDupCheck(byte IsPaid, int Pattern, int BG, int BL)
{
    return RealOne.sfReqPaidItem_ClanMarkDupCheck(IsPaid, Pattern, BG, BL);
    //return;    
}

function bool sfReqPaidItem_ChangeClanMark(BtrDouble ItemIdx, byte IsPaid, int Pattern, int BG, int BL)
{
    return RealOne.sfReqPaidItem_ChangeClanMark(ItemIdx, IsPaid, Pattern, BG, BL);
    //return;    
}

function bool sfReqRemoveCheckTeamBalanceList()
{
    return RealOne.sfReqRemoveCheckTeamBalanceList();
    //return;    
}

function bool sfReqClanMatch_SetWaitRoomPublic(byte Set)
{
    return RealOne.sfReqClanMatch_SetWaitRoomPublic(Set);
    //return;    
}

function bool sfReqExteriorRoomOwnerInfo(int RoomNum, string OwnerName, string OwnerIP)
{
    return RealOne.sfReqExteriorRoomOwnerInfo(RoomNum, OwnerName, OwnerIP);
    //return;    
}

function bool sfReqSetLookForClan(byte IsLookingFor)
{
    return RealOne.sfReqSetLookForClan(IsLookingFor);
    //return;    
}

function bool sfReqGetMyMailBoxState()
{
    return RealOne.sfReqGetMyMailBoxState();
    //return;    
}

function bool sfReqMyEquipedItemList()
{
    return RealOne.sfReqMyEquipedItemList();
    //return;    
}

function bool sfReqMyEquipedSkillList()
{
    return RealOne.sfReqMyEquipedSkillList();
    //return;    
}

function bool sfReqMyEquipedQSlotList()
{
    return RealOne.sfReqMyEquipedQSlotList();
    //return;    
}

function bool sfAckStartNatDiag(int NatType)
{
    return RealOne.sfAckStartNatDiag(NatType);
    //return;    
}

function bool sfAckRecvClanInvite(int InviterUserDBID, string InviterCharname, string InviterMsg, string ClanName, byte Permit)
{
    return RealOne.sfAckRecvClanInvite(InviterUserDBID, InviterCharname, InviterMsg, ClanName, Permit);
    //return;    
}

function bool sfAckRecvJoinClan(int UserIdx, string CharName, string ReqMsg, byte Permit)
{
    return RealOne.sfAckRecvJoinClan(UserIdx, CharName, ReqMsg, Permit);
    //return;    
}

function bool sfAckRecvInviteGameRoom(string RoomUniqueID, int RoomNumber, byte Answer, string InviteCharName)
{
    return RealOne.sfAckRecvInviteGameRoom(RoomUniqueID, RoomNumber, Answer, InviteCharName);
    //return;    
}

function bool sfAckClanMatch_RecvInviteCrew(int Result, string Inviter)
{
    return RealOne.sfAckClanMatch_RecvInviteCrew(Result, Inviter);
    //return;    
}

function bool rfAckLogin(int Result, string ErrMsg, int UserID, string CharName, string ClanName, CharInfo btCharInfo)
{
    return MainMenu.page_curr.TcpChannel.rfAckLogin(Result, ErrMsg, UserID, CharName, ClanName, btCharInfo);
    //return;    
}

function bool rfAckItemListStart(int Count, int Result, string ErrMsg)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x62 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckItemListStart(Count, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckItemList(array<BtrDouble> UniqueID, array<int> ItemID, array<int> ItemType, array<int> Durability, array<BtrDouble> UntilTime, array<int> SlotPosition, array<int> AddPartsID, array<int> DamageDegree, array<byte> ItemState, array<int> StackCount, array<int> PaintID, array<int> TradeCount)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x8F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckItemList(UniqueID, ItemID, ItemType, Durability, UntilTime, SlotPosition, AddPartsID, DamageDegree, ItemState, StackCount, PaintID, TradeCount))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckItemListEnd()
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x53 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckItemListEnd())
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckAuctionMyItemRegister(int Result, string ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain)
{
    Log((((((((((("[rfAckAuctionMyItemRegister] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " BeginPrice=") $ string(BeginPrice)) $ " BuyPrice=") $ string(BuyPrice)) $ " GuarantyPoint=") $ string(GuarantyPoint)) $ " PointRemain=") $ string(PointRemain));
    i = MainMenu.Pages.Length;
    J0xBF:

    // End:0x11B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAuctionMyItemRegister(Result, ErrMsg, BeginPrice, BuyPrice, GuarantyPoint, PointRemain))
    {
        // [Loop Continue]
        goto J0xBF;
    }
    return true;
    //return;    
}

function bool rfAckAuctionItemListCount(int Result, string ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count)
{
    Log(((((((((("[rfAckAuctionItemListCount]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " Section=") $ string(Section)) $ " Classfy=") $ string(Classfy)) $ " Count=") $ string(Count));
    i = MainMenu.Pages.Length;
    J0x9C:

    // End:0xFD [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAuctionItemListCount(Result, ErrMsg, Section, Classfy, ItemType, ItemGrade, Count))
    {
        // [Loop Continue]
        goto J0x9C;
    }
    return true;
    //return;    
}

function bool rfAckAuctionItemListStart(int Result, string ErrMsg, byte Section, int PageNum, int Count)
{
    Log(((((((((("[rfAckAuctionItemListStart]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " Section=") $ string(Section)) $ " PageNum=") $ string(PageNum)) $ " Count=") $ string(Count));
    i = MainMenu.Pages.Length;
    J0x9C:

    // End:0xF3 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAuctionItemListStart(Result, ErrMsg, Section, PageNum, Count))
    {
        // [Loop Continue]
        goto J0x9C;
    }
    return true;
    //return;    
}

function bool rfAckAuctionItemList(byte Section, array<int> UniqueIDs, array<int> ItemIDs, array<int> AddPartsIDs, array<BtrDouble> UntilTimes, array<int> BiddingPrices, array<int> InstantlyByuingPrices, array<int> ItemDamageds, array<string> HighestBidderNames, array<string> SellerNames, array<int> ItemCount)
{
    Log("[rfAckAuctionItemList]");
    i = MainMenu.Pages.Length;
    J0x2F:

    // End:0xA4 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAuctionItemList(Section, UniqueIDs, ItemIDs, AddPartsIDs, UntilTimes, BiddingPrices, InstantlyByuingPrices, ItemDamageds, HighestBidderNames, SellerNames, ItemCount))
    {
        // [Loop Continue]
        goto J0x2F;
    }
    return true;
    //return;    
}

function bool rfAckAuctionItemListEnd(byte Section)
{
    Log("[rfAckAuctionItemListEnd] Section=" $ string(Section));
    i = MainMenu.Pages.Length;
    J0x44:

    // End:0x87 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAuctionItemListEnd(Section))
    {
        // [Loop Continue]
        goto J0x44;
    }
    return true;
    //return;    
}

function bool rfAckAuctionMyItemCancel(int Result, string ErrMsg)
{
    Log((("[rfAckAuctionMyItemCancel] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x57:

    // End:0x9F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAuctionMyItemCancel(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x57;
    }
    return true;
    //return;    
}

function bool rfAckAuctionInstantlyBuying(int Result, string ErrMsg, int PointRemain)
{
    Log(((("[rfAckAuctionInstantlyBuying] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " PointRemain");
    i = MainMenu.Pages.Length;
    J0x6A:

    // End:0xB7 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAuctionInstantlyBuying(Result, ErrMsg, PointRemain))
    {
        // [Loop Continue]
        goto J0x6A;
    }
    return true;
    //return;    
}

function bool rfAckChannelList(array<int> id, array<string> Title, array<int> CurUser, array<int> MaxUser)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x67 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChannelList(id, Title, CurUser, MaxUser))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log(((((((((((("[BTTcpHandler::rfAckEnterChannel]" $ " ID=") $ string(id)) $ " UID=") $ string(UID)) $ " UserID=") $ UserID) $ " Level=") $ string(Level)) $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    // End:0x106
    if(UserID == MainMenu.rMM.kUserName)
    {
        MainMenu.rMM.My_iUID = UID;
        MainMenu.iUid = UID;
        MainMenu.rMM.kUID = UID;
    }
    i = MainMenu.Pages.Length;
    J0x11B:

    // End:0x1BD [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckEnterChannel(id, UID, UserID, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // [Loop Continue]
        goto J0x11B;
    }
    Log("rfAckEnterChannel end");
    return true;
    //return;    
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    Log(((((("[BTTcpHandler::rfAckLeaveChannel] " $ " Result=") $ string(Result)) $ " UserID=") $ UserID) $ " UID=") $ string(UID));
    i = MainMenu.Pages.Length;
    J0x75:

    // End:0xC2 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckLeaveChannel(Result, UserID, UID))
    {
        // [Loop Continue]
        goto J0x75;
    }
    return true;
    //return;    
}

function bool rfAckLogin2(int Result, string ErrMsg, int UserID, string CharName, BtrDouble CurServerTime, int CharDBID, byte IsGM)
{
    Log((((((((((("[BTTcpHandler::rfAckLogin2] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " UserID=") $ string(UserID)) $ " Charname=") $ CharName) $ " CharDBID=") $ string(CharDBID)) $ " IsGM=") $ string(IsGM));
    i = MainMenu.Pages.Length;
    J0xAC:

    // End:0x10D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckLogin2(Result, ErrMsg, UserID, CharName, CurServerTime, CharDBID, IsGM))
    {
        // [Loop Continue]
        goto J0xAC;
    }
    return true;
    //return;    
}

function bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, array<int> UID, array<string> UserID, array<int> UserLevels, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, int Result, string ErrMsg, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0xC1 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChannelUserList(TotalCount, Count, StartIndex, UID, UserID, UserLevels, ClanName, ClanPattern, ClanBG, ClanBL, ClanGrade, ClanWin, ClanLose, IsLookForClan, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x67 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRoomListStart(Result, TotalCount, Count, StartIndex))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckRoomList(array<int> GameNum, array<string> Title, array<string> MapName, array<int> MapNum, array<byte> UserCount, array<byte> MaxCount, array<string> ModeName, array<int> ModeNum, array<byte> WeaponLimit, array<byte> IsTeamBalance, array<byte> Status, array<string> RoomOwnerIP, array<int> GameMinute, array<string> RoomOwnerName, array<byte> IsSpecial, array<byte> IsPassword, array<byte> BotDifficult, array<byte> BotModeUserTeamNum)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0xAD [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRoomList(GameNum, Title, MapName, MapNum, UserCount, MaxCount, ModeName, ModeNum, WeaponLimit, IsTeamBalance, Status, RoomOwnerIP, GameMinute, RoomOwnerName, IsSpecial, IsPassword, BotDifficult, BotModeUserTeamNum))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckRoomListEnd()
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x53 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRoomListEnd())
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckChatNormal(int id, string Sender, string Message, int Result)
{
    Log((((("[BTTcpHandler::rfAckChatNormal] ID=" $ string(id)) $ " Sender=") $ Sender) $ " Message=") $ Message);
    i = MainMenu.Pages.Length;
    J0x6C:

    // End:0xBE [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChatNormal(id, Sender, Message, Result))
    {
        // [Loop Continue]
        goto J0x6C;
    }
    return true;
    //return;    
}

function bool rfAckChatClan(string CharName, string Message, int Result)
{
    Log((("[BTTcpHandler::rfAckChatClan] Sender=" $ CharName) $ " Message=") $ Message);
    i = MainMenu.Pages.Length;
    J0x59:

    // End:0xA6 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChatClan(CharName, Message, Result))
    {
        // [Loop Continue]
        goto J0x59;
    }
    return true;
    //return;    
}

function bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log((((((((((((("[BTTcpHandler::rfAckEnterRoom] GameNum=" $ string(GameNum)) $ " UID=") $ string(UID)) $ " UserID=") $ UserID) $ " TeamNum=") $ string(TeamNum)) $ " Grade=") $ string(Grade)) $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xC0:

    // End:0x162 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckEnterRoom(GameNum, OwnerID, UID, UserID, TeamNum, Grade, UserIP, ClanName, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // [Loop Continue]
        goto J0xC0;
    }
    return true;
    //return;    
}

function bool rfAckRoomUserList(array<int> UID, array<string> UserName, array<int> Grade, array<int> TeamNum, array<byte> Statue, array<byte> IsHost, array<string> UserIP, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<byte> IsLookingFor, array<int> GMUID, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0xB2 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRoomUserList(UID, UserName, Grade, TeamNum, Statue, IsHost, UserIP, ClanName, CM_Pattern, CM_BG, CM_BL, IsLookingFor, GMUID, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    Log(((((((((("[BTTcpHandler::rfAckLeaveRoom]" $ " Num=") $ string(Num)) $ " UID=") $ string(UID)) $ " UserID=") $ UserID) $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x96:

    // End:0xED [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckLeaveRoom(Num, UID, UserID, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x96;
    }
    return true;
    //return;    
}

function bool rfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    Log(((((((("[BTTcpHandler::rfAckCreateGameRoom]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " UID=") $ string(UserID)) $ " RooomOwnerIP=") $ RoomOwnerIP);
    i = MainMenu.Pages.Length;
    J0x8F:

    // End:0xE6 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckCreateGameRoom(Result, ErrMsg, UserID, RoomOwnerIP, NetRoomInfo))
    {
        // [Loop Continue]
        goto J0x8F;
    }
    return true;
    //return;    
}

function bool rfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    Log(((((((((((("[BTTcpHandler::rfAckChangeTeam]" $ "GameNumber=") $ string(GameNumber)) $ " UserID=") $ UserID) $ " UID=") $ string(UID)) $ " TeamNum=") $ string(TeamNum)) $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xB3:

    // End:0x10F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChangeTeam(GameNumber, UserID, UID, TeamNum, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0xB3;
    }
    return true;
    //return;    
}

function bool rfAckGameHostInfo(int GameNumber, string UserID, string IP, int Port, int Result, string ErrMsg)
{
    Log(((((((((((("[BTTcpHandler::rfAckGameHostInfo] " $ " GameNumber=") $ string(GameNumber)) $ " UserID=") $ UserID) $ " IP=") $ IP) $ " Port=") $ string(Port)) $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xB1:

    // End:0x10D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGameHostInfo(GameNumber, UserID, IP, Port, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0xB1;
    }
    return true;
    //return;    
}

function bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    Log(((((((((("[BTTcpHandler::rfAckStartGame]" $ " GameNumber=") $ string(GameNumber)) $ " ClientsCount=") $ string(ClientsCount)) $ " StartSeed=") $ string(StartSeed)) $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xAB:

    // End:0x102 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckStartGame(GameNumber, ClientsCount, StartSeed, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0xAB;
    }
    return true;
    //return;    
}

function bool rfAckGameRoomDestroy(int GameRoomNum)
{
    Log(("[BTTCpHandler::rfAckGameRoomDestroy]" $ " GameRoomNum=") $ string(GameRoomNum));
    i = MainMenu.Pages.Length;
    J0x57:

    // End:0x9A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGameRoomDestroy(GameRoomNum))
    {
        // [Loop Continue]
        goto J0x57;
    }
    return true;
    //return;    
}

function bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying)
{
    Log(((("[BTTcpHandler::rfAckIsGameRoomPlaying] " $ " GameRoomNum=") $ string(GameRoomNum)) $ " IsPlaying=") $ string(IsPlaying));
    i = MainMenu.Pages.Length;
    J0x72:

    // End:0xBA [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckIsGameRoomPlaying(GameRoomNum, IsPlaying))
    {
        // [Loop Continue]
        goto J0x72;
    }
    return true;
    //return;    
}

function bool rfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    Log((((((((((("Recv - " $ string(self)) $ "::rfAckSelectMap - Gamenum:") $ string(GameNum)) $ " UID=") $ string(UID)) $ "MapName=") $ MapName) $ "Result=") $ string(Result)) $ "ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x98:

    // End:0xEF [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSelectMap(GameNum, UID, MapName, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x98;
    }
    return true;
    //return;    
}

function bool rfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    Log((((((((((((("Recv - " $ string(self)) $ "::rfAckChangeGameMode - GameNum:") $ string(GameNum)) $ " UID=") $ string(UID)) $ "GameMode=") $ GameMode) $ "GameModeNum=") $ string(GameModeNum)) $ "Result=") $ string(Result)) $ "ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xB7:

    // End:0x113 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChangeGameMode(GameNum, UID, GameMode, GameModeNum, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0xB7;
    }
    return true;
    //return;    
}

function bool rfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    Log((((("Recv - " $ string(self)) $ "::rfAckGameOver - Result:") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x5E:

    // End:0xB0 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGameOver(UID, GameRoomNumber, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x5E;
    }
    return true;
    //return;    
}

function bool rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log((((("Recv - " $ string(self)) $ "::rfAckGameRoomInfo - Result:") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x62:

    // End:0xAF [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGameRoomInfo(Result, ErrMsg, RoomInfo))
    {
        // [Loop Continue]
        goto J0x62;
    }
    return true;
    //return;    
}

function bool rfReqRelayServerOn(string RelayServerIP, int RelayServerPortNum)
{
    Log(((("[BTTcpHandler::rfReqRelayServerOn] RelayServerIP=" $ RelayServerIP) $ ", ") $ "RelayServerPortNum=") $ string(RelayServerPortNum));
    MainMenu.rMM.LowRelayServerOn(RelayServerIP, RelayServerPortNum);
    return true;
    //return;    
}

function bool rfReqRelayServerOff()
{
    Log("[BTTcpHandler::rfReqRelayServerOff]");
    i = MainMenu.Pages.Length;
    J0x3C:

    // End:0x7A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRelayServerOff())
    {
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool rfAckDisconnectGame(int Result, int DisconnectUserID, string DisconnectUserName)
{
    Log(((((("[BTTcpHandler::rfAckDisconnectGame] " $ "Result=") $ string(Result)) $ " DisconnectUserID=") $ string(DisconnectUserID)) $ " DisconnectUserName=") $ DisconnectUserName);
    i = MainMenu.Pages.Length;
    J0x8F:

    // End:0xDC [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckDisconnectGame(Result, DisconnectUserID, DisconnectUserName))
    {
        // [Loop Continue]
        goto J0x8F;
    }
    return true;
    //return;    
}

function bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, string ErrMsg)
{
    Log(((((((((("[BTTcpHandler::rfAckChangeRoomOwner]" $ " GameNum=") $ string(GameNum)) $ " OldOwner=") $ string(OldOwner)) $ " NewOwner=") $ string(NewOwner)) $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xA9:

    // End:0x100 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChangeRoomOwner(GameNum, OldOwner, NewOwner, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0xA9;
    }
    return true;
    //return;    
}

function bool rfAckChangeHost(byte ClientNum)
{
    Log("[BTTcpHandler::rfAckChangeHost]");
    i = MainMenu.Pages.Length;
    J0x38:

    // End:0x7B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChangeHost(ClientNum))
    {
        // [Loop Continue]
        goto J0x38;
    }
    return true;
    //return;    
}

function bool rfAckChangeNewGuest(string HostIP)
{
    Log(("[BTTcpHandler::rfAckChangeNewGuest]" $ " HostIP=") $ HostIP);
    i = MainMenu.Pages.Length;
    J0x4F:

    // End:0x92 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChangeNewGuest(HostIP))
    {
        // [Loop Continue]
        goto J0x4F;
    }
    return true;
    //return;    
}

function bool rfAckConnectGame(int UserID, int Result)
{
    Log(((("[BTTcpHandler::rfAckConnectGame]" $ " UserID=") $ string(UserID)) $ " Result=") $ string(Result));
    i = MainMenu.Pages.Length;
    J0x63:

    // End:0xAB [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckConnectGame(UserID, Result))
    {
        // [Loop Continue]
        goto J0x63;
    }
    return true;
    //return;    
}

function bool rfAckUpdateScore(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> EXPBonuses, array<int> Points, array<int> PointBonuses, array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID)
{
    Log("[BTTcpHandler::rfAckUpdateScore] UserIDs.Length=" $ string(UserIDs.Length));
    i = MainMenu.Pages.Length;
    J0x53:

    // End:0xD7 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckUpdateScore(UserIDs, NickNames, TeamIDs, Scores, Kills, Assists, Deaths, EXPs, EXPBonuses, Points, PointBonuses, TeamScores, BonusOwnerID, BonusID))
    {
        // [Loop Continue]
        goto J0x53;
    }
    return true;
    //return;    
}

function bool rfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, array<int> ScoreRewardUserID, array<byte> ScoreRewardTYPE, array<int> ScoreRewardID, array<int> ScoreRewardCount)
{
    Log("[BTTcpHandler::rfAckAIRewardResult] UserIDs.Length=" $ string(ScoreRewardUserID.Length));
    i = MainMenu.Pages.Length;
    J0x56:

    // End:0xB7 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAIRewardResult(ClearRewardTYPE, ClearRewardID, ClearRewardCount, ScoreRewardUserID, ScoreRewardTYPE, ScoreRewardID, ScoreRewardCount))
    {
        // [Loop Continue]
        goto J0x56;
    }
    return true;
    //return;    
}

function bool rfAckChangeRoomSetting(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log("[BTTcpHandler::rfAckChangeRoomSetting] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x50:

    // End:0x9D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChangeRoomSetting(Result, ErrMsg, RoomInfo))
    {
        // [Loop Continue]
        goto J0x50;
    }
    return true;
    //return;    
}

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    Log((("[BTTcpHandler::rfAckEquipItem] " $ string(Result)) $ " ") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x4D:

    // End:0xB3 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckEquipItem(ChangedNewItemID, ChangedNewUniqueID, ChangedNewSlotPosition, ChangedOldItemID, ChangedOldUniqueID, ChangedOldSlotPosition, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x4D;
    }
    return true;
    //return;    
}

function bool rfAckConfirmItemChanged(int Result, string ErrMsg)
{
    Log((("[BTTcpHandler::rfAckConfirmItemChanged] " $ string(Result)) $ " ") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x56:

    // End:0x9E [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckConfirmItemChanged(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x56;
    }
    return true;
    //return;    
}

function bool rfAckCharInfo(int Result, string ErrMsg, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, byte InClanRank, int ClanLevel)
{
    Log((((("[BTTcpHandler::rfAckCharInfo] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " Clanname=") $ ClanName);
    i = MainMenu.Pages.Length;
    J0x6F:

    // End:0xE4 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckCharInfo(Result, ErrMsg, UserID, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, stCharInfo, InClanRank, ClanLevel))
    {
        // [Loop Continue]
        goto J0x6F;
    }
    return true;
    //return;    
}

function bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    Log(((((((((((((((((((((((((("[BTTcpHandler::rfReqExteriorRoomInfo] " $ " SP=") $ string(SP)) $ " RoomNumber=") $ string(RoomNumber)) $ " IsPW=") $ string(IsPW)) $ " RoomName=") $ RoomName) $ " MapName=") $ MapName) $ " ModeName=") $ ModeName) $ " WpnLimit=") $ string(IsTeamBalance)) $ " Max=") $ string(MaxUserCount)) $ " UserCount=") $ string(RoomUserCount)) $ " RoomState=") $ string(RoomState)) $ ", BotDifficult=") $ string(BotDifficult)) $ ", WeaponLimit=") $ string(WeaponLimit)) $ ", BotModeUserTeamNum=") $ string(BotModeUserTeamNum));
    i = MainMenu.Pages.Length;
    J0x16C:

    // End:0x1F5 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqExteriorRoomInfo(SP, RoomNumber, IsPW, RoomName, MapName, ModeName, MapNum, ModeNum, IsTeamBalance, MaxUserCount, RoomUserCount, RoomState, BotDifficult, WeaponLimit, BotModeUserTeamNum))
    {
        // [Loop Continue]
        goto J0x16C;
    }
    return true;
    //return;    
}

function bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount)
{
    Log(((("[BTTcpHandler::rfReqExteriorRoomUserCount] " $ " RoomNumber=") $ string(RoomNumber)) $ " RoomUserCount=") $ string(RoomUserCount));
    i = MainMenu.Pages.Length;
    J0x79:

    // End:0xC1 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqExteriorRoomUserCount(RoomNumber, RoomUserCount))
    {
        // [Loop Continue]
        goto J0x79;
    }
    return true;
    //return;    
}

function bool rfReqExteriorRoomState(int RoomNumber, byte RoomState)
{
    Log(((("[BTTcpHandler::rfReqExteriorRoomState] " $ " RoomNumber=") $ string(RoomNumber)) $ " RoomState=") $ string(RoomState));
    i = MainMenu.Pages.Length;
    J0x71:

    // End:0xB9 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqExteriorRoomState(RoomNumber, RoomState))
    {
        // [Loop Continue]
        goto J0x71;
    }
    return true;
    //return;    
}

function bool rfAckChangeUserState(int Result, string ErrMsg, array<int> UserIDs, array<byte> Positions, array<int> Numbers, array<byte> OldStates, array<byte> NewStates)
{
    Log(((("[BTTcpHandler::rfAckChangeUserState]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x65:

    // End:0xC6 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChangeUserState(Result, ErrMsg, UserIDs, Positions, Numbers, OldStates, NewStates))
    {
        // [Loop Continue]
        goto J0x65;
    }
    return true;
    //return;    
}

function bool rfReqStartNatDiag(string Server1Addr, int Server1Port, string Server2Addr, int Server2Port)
{
    Log(((((((("[BTTcpHandler::rfReqStartNatDiag]" $ " Server1Addr=") $ Server1Addr) $ " Server1Port=") $ string(Server1Port)) $ " Server2Addr=") $ Server2Addr) $ " Server2Port=") $ string(Server2Port));
    MainMenu.rMM.NatServerAddrStoreToEngine(Server1Addr, Server1Port, Server2Addr, Server2Port);
    MainMenu.rfReqStartNatDiag(Server1Addr, Server1Port, Server2Addr, Server2Port);
    return true;
    //return;    
}

function bool rfReqForceNatTypeSetting(int NatType)
{
    Log("[BTTcpHanldler::rfReqForceNatTypeSetting] NatType:" $ string(NatType));
    return MainMenu.rfReqForceNatTypeSetting(NatType);
    //return;    
}

function bool rfAckRegisterOtherUdpInfo(int UID, string IP, int Port, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    Log(((((((((((((("[BTTcpHandler::rfAckRegisterOtherUdpInfo]" $ " UID=") $ string(UID)) $ " IP=") $ IP) $ " Port=") $ string(Port)) $ " Nat=") $ string(NatType)) $ " Intervention=") $ string(Intervention)) $ "HostInnerIP=") $ HostInnerIP) $ "HostInnerPort=") $ string(HostInnerPort));
    i = MainMenu.Pages.Length;
    J0xD5:

    // End:0x136 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRegisterOtherUdpInfo(UID, IP, Port, NatType, Intervention, HostInnerIP, HostInnerPort))
    {
        // [Loop Continue]
        goto J0xD5;
    }
    return true;
    //return;    
}

function bool rfAckEntryItemList(array<int> UserIDs, array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<BtrDouble> UniqueID, array<int> PaintID, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckEntryItemList]");
    // End:0xAF
    if(Result == 0)
    {
        i = MainMenu.Pages.Length;
        J0x46:

        // End:0xAC [Loop If]
        if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckEntryItemList(UserIDs, ItemIDs, SlotPositions, AddPartsID, UniqueID, PaintID, Result, ErrMsg))
        {
            // [Loop Continue]
            goto J0x46;
        }        
    }
    else
    {
        Log("[BTTcpHandler::rfAckEntryItemList] ErrMsg=" $ ErrMsg);
    }
    return true;
    //return;    
}

function bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, string ErrMsg)
{
    Log((((((("[BTTcpHandler::rfAckForceGameOver] UserID=" $ string(UserID)) $ " GameRoomNumber=") $ string(GameRoomNumber)) $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    // End:0xEE
    if(Result == 0)
    {
        i = MainMenu.Pages.Length;
        J0x9C:

        // End:0xEE [Loop If]
        if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckForceGameOver(UserID, GameRoomNumber, Result, ErrMsg))
        {
            // [Loop Continue]
            goto J0x9C;
        }
    }
    return true;
    //return;    
}

function bool rfAckGetBooty(int Result, string ErrMsg, array<int> PrizeWinUserID, array<int> BootyItemID, array<int> BootyPartsID)
{
    Log(((((((((("[BTTcpHandler::rfAckGetBooty] " $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " PrizeWinUserID.Length=") $ string(PrizeWinUserID.Length)) $ " BootyItemID.Length=") $ string(BootyItemID.Length)) $ " BootyPartsID.Length=") $ string(BootyPartsID.Length));
    i = MainMenu.Pages.Length;
    J0xC9:

    // End:0x120 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetBooty(Result, ErrMsg, PrizeWinUserID, BootyItemID, BootyPartsID))
    {
        // [Loop Continue]
        goto J0xC9;
    }
    return true;
    //return;    
}

function bool rfAckGetBootyChoose(int Result, string ErrMsg, byte GiveType, BtrDouble ItemUniqueNumber, int ItemID, int PartID, byte ItemType, BtrDouble UntilTime, int StackCount, int PaintID)
{
    Log(((("[BTTcpHandler::rfAckGetBootyChoose]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x64:

    // End:0xD4 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetBootyChoose(Result, ErrMsg, GiveType, ItemUniqueNumber, ItemID, PartID, ItemType, UntilTime, StackCount, PaintID))
    {
        // [Loop Continue]
        goto J0x64;
    }
    return true;
    //return;    
}

function bool rfAckUserSkillListStart(int Count, int Result, string ErrMsg)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x62 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckUserSkillListStart(Count, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckUserSkillList(array<int> UniqueSkillID, array<int> SkillID, array<BtrDouble> UntilTime, array<byte> SlotPosition)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x67 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckUserSkillList(UniqueSkillID, SkillID, UntilTime, SlotPosition))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckUserSkillListEnd()
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x53 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckUserSkillListEnd())
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckEntrySkillList(array<int> UserIDs, array<int> SkillIDs, array<int> SlotPositions, int Result, string ErrMsg)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x6C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckEntrySkillList(UserIDs, SkillIDs, SlotPositions, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    Log((("[BTTcpHandler::rfAckEquipSkill]" $ string(Result)) $ " ") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x4D:

    // End:0xB3 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckEquipSkill(ChangedNewSkillID, ChangedNewSkillUniqueID, ChangedNewSlotPosition, ChangedOldSkillID, ChangedOldSkillUniqueID, ChangedOldSlotPosition, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x4D;
    }
    return true;
    //return;    
}

function bool rfReqConfirmSkillChanged()
{
    Log("[BTTcpHandler::rfReqConfirmSkillChanged]");
    i = MainMenu.Pages.Length;
    J0x41:

    // End:0x7F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqConfirmSkillChanged())
    {
        // [Loop Continue]
        goto J0x41;
    }
    return true;
    //return;    
}

function bool rfAckShopItemListStart(int Count)
{
    Log(("[BTTcpHandler::rfAckShopItemListStart]" $ " Count=") $ string(Count));
    i = MainMenu.Pages.Length;
    J0x53:

    // End:0x96 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckShopItemListStart(Count))
    {
        // [Loop Continue]
        goto J0x53;
    }
    return true;
    //return;    
}

function bool rfAckShopItemList(array<int> ItemID)
{
    Log("[BTTcpHandler::rfAckShopItemList]");
    i = MainMenu.Pages.Length;
    J0x3A:

    // End:0x7D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckShopItemList(ItemID))
    {
        // [Loop Continue]
        goto J0x3A;
    }
    return true;
    //return;    
}

function bool rfAckShopItemListEnd()
{
    Log("[BTTcpHandler::rfAckShopItemListEnd]");
    i = MainMenu.Pages.Length;
    J0x3D:

    // End:0x7B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckShopItemListEnd())
    {
        // [Loop Continue]
        goto J0x3D;
    }
    return true;
    //return;    
}

function bool rfAckBuyShopItem(int ItemCount, array<int> Result, array<int> BoughtItemTypeID, array<BtrDouble> BoughtItemUniqueID, array<int> BoughtPartID, array<BtrDouble> BoughtUntilTIme, array<int> BoughtStackCnt, int PointRemain, int CashRemain)
{
    Log(((((("[BTTcpHandler::rfAckBuyShopItem]" $ " ItemCount=") $ string(ItemCount)) $ " PointRemain=") $ string(PointRemain)) $ " CashRemain=") $ string(CashRemain));
    i = MainMenu.Pages.Length;
    J0x84:

    // End:0xEF [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckBuyShopItem(ItemCount, Result, BoughtItemTypeID, BoughtItemUniqueID, BoughtPartID, BoughtUntilTIme, BoughtStackCnt, PointRemain, CashRemain))
    {
        // [Loop Continue]
        goto J0x84;
    }
    return true;
    //return;    
}

function bool rfAckSellShopItem(int Result, string ErrMsg, int PointRemain, int CashRemain, int Count)
{
    Log(((((((((("[BTTcpHandler::rfAckSellShopItem]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " PointRemain=") $ string(PointRemain)) $ " CashRemain=") $ string(CashRemain)) $ " Count=") $ string(Count));
    i = MainMenu.Pages.Length;
    J0xA9:

    // End:0x100 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSellShopItem(Result, ErrMsg, PointRemain, CashRemain, Count))
    {
        // [Loop Continue]
        goto J0xA9;
    }
    return true;
    //return;    
}

function bool rfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    Log(((((((((((((("[BTTcpHandler::rfAckModifyWeapon]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " UniqueID=") $ __NFUN_918__(UniqueID)) $ " AddPartID=") $ string(AddPartID)) $ " PaintID=") $ string(PaintID)) $ " Point=") $ string(Point)) $ " Cash=") $ string(Cash));
    i = MainMenu.Pages.Length;
    J0xCF:

    // End:0x130 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckModifyWeapon(Result, ErrMsg, UniqueID, AddPartID, PaintID, Point, Cash))
    {
        // [Loop Continue]
        goto J0xCF;
    }
    return true;
    //return;    
}

function bool rfAckGP20CashModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point)
{
    Log(((((((((((("[BTTcpHandler::rfAckGP20CashModifyWeapon]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " UniqueID=") $ __NFUN_918__(UniqueID)) $ " AddPartID=") $ string(AddPartID)) $ " PaintID=") $ string(PaintID)) $ " Point=") $ string(Point));
    i = MainMenu.Pages.Length;
    J0xC4:

    // End:0x120 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGP20CashModifyWeapon(Result, ErrMsg, UniqueID, AddPartID, PaintID, Point))
    {
        // [Loop Continue]
        goto J0xC4;
    }
    return true;
    //return;    
}

function bool rfAckQSlotList(int Result, string ErrMsg, array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4)
{
    Log("[BTTcpHandler::rfAckQSlotList]");
    i = MainMenu.Pages.Length;
    J0x37:

    // End:0xB6 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckQSlotList(Result, ErrMsg, QSlotID, QSlotName, QSlotDispOrder, MWItemID, PistolItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4))
    {
        // [Loop Continue]
        goto J0x37;
    }
    return true;
    //return;    
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    Log(((("[BTTcpHandler::rfAckUpdateQSlot]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x61:

    // End:0xA9 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckUpdateQSlot(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x61;
    }
    return true;
    //return;    
}

function bool rfAckEntryQSlotIDList(int UserNum, array<byte> QSlotDispOrder, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<int> TWItemID1, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID)
{
    Log("[BTTcpHandler::rfAckEntryQSlotIDList]");
    i = MainMenu.Pages.Length;
    J0x3E:

    // End:0xC2 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckEntryQSlotIDList(UserNum, QSlotDispOrder, MWItemID, MWPartID, MWPaintID, PistolItemID, PistolPartID, PistolPaintID, TWItemID1, TWItemID2, Skill1ID, Skill2ID, Skill3ID, Skill4ID))
    {
        // [Loop Continue]
        goto J0x3E;
    }
    return true;
    //return;    
}

function bool rfAckEntryQSlotUniqueIDList(int UserNum, array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<BtrDouble> PistolUniqueID, array<BtrDouble> TW1UniqueID, array<BtrDouble> TW2UniqueID)
{
    Log("[BTTcpHandler::rfAckEntryQSlotUniqueIDList]");
    i = MainMenu.Pages.Length;
    J0x44:

    // End:0xA0 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckEntryQSlotUniqueIDList(UserNum, QSlotDispOrder, MWUniqueID, PistolUniqueID, TW1UniqueID, TW2UniqueID))
    {
        // [Loop Continue]
        goto J0x44;
    }
    return true;
    //return;    
}

event bool rfAckUpdateWeaponDurability(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> Durability, array<byte> IsDestroy, array<BtrDouble> FailedWeaponUniqueID)
{
    Log("[BTTcpHandler::rfAckUpdateWeaponDurability]");
    i = MainMenu.Pages.Length;
    J0x44:

    // End:0xA0 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckUpdateWeaponDurability(Result, ErrMsg, UniqueItemID, Durability, IsDestroy, FailedWeaponUniqueID))
    {
        // [Loop Continue]
        goto J0x44;
    }
    return true;
    //return;    
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    Log("[BTTcpHandler::rfAckRepairCost]");
    i = MainMenu.Pages.Length;
    J0x38:

    // End:0x8A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRepairCost(Result, ErrMsg, UniqueItemID, RepairCost))
    {
        // [Loop Continue]
        goto J0x38;
    }
    return true;
    //return;    
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    Log("[BTTcpHandler::rfAckRepairItem]");
    i = MainMenu.Pages.Length;
    J0x38:

    // End:0x8F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRepairItem(Result, ErrMsg, UniqueItemID, RepairCost, DamageDegree))
    {
        // [Loop Continue]
        goto J0x38;
    }
    return true;
    //return;    
}

function bool rfAckGameOverEnd(int Result, string ErrMsg)
{
    Log(((("[BTTcpHandler::rfAckGameOverEnd]" $ " Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x61:

    // End:0xA9 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGameOverEnd(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x61;
    }
    return true;
    //return;    
}

function bool rfAckServerTime(int Time)
{
    Log("[BTTcpHandler::rfAckServerTime] " $ string(Time));
    i = MainMenu.Pages.Length;
    J0x42:

    // End:0x85 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckServerTime(Time))
    {
        // [Loop Continue]
        goto J0x42;
    }
    // End:0xD9
    if(i == 0)
    {
        Log("[BTTcpHandler::rfAckServerTime] time set");
        MainMenu.Controller.SetTime(Time);
    }
    return true;
    //return;    
}

function bool rfReqRecvChatWispher(string CharnameFrom, string Message)
{
    Log(((("[BTTcpHandler::rfReqRecvChatWispher] " $ " CharnameFrom=") $ CharnameFrom) $ " Message=") $ Message);
    i = MainMenu.Pages.Length;
    J0x6B:

    // End:0xB3 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvChatWispher(CharnameFrom, Message))
    {
        // [Loop Continue]
        goto J0x6B;
    }
    return true;
    //return;    
}

function bool rfAckSellShopItemInfo(int Result, string ErrMsg, BtrDouble UniqueItemID, int SellPoint, int CurPoint, int AfterPoint)
{
    Log((((((((((("[BTTcpHandler::rfAckSellShopItemInfo] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " UniqueItemID=") $ __NFUN_918__(UniqueItemID)) $ " SellPoint=") $ string(SellPoint)) $ " CurPoint=") $ string(CurPoint)) $ " AfterPoint") $ string(AfterPoint));
    i = MainMenu.Pages.Length;
    J0xC5:

    // End:0x121 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSellShopItemInfo(Result, ErrMsg, UniqueItemID, SellPoint, CurPoint, AfterPoint))
    {
        // [Loop Continue]
        goto J0xC5;
    }
    return true;
    //return;    
}

function bool ForceLogout_OnOK(GUIComponent Sender)
{
    MainMenu.PlayerOwner().ConsoleCommand("exit");
    return true;
    //return;    
}

function bool rfReqForceLogoutByOwner()
{
    Log("[BTTcphandler::rfReqForceLogoutByOwner]");
    MainMenu.HaltNetwork();
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(MainMenu.Controller, 84);
    BTWindowDefineInfoHK(MainMenu.Controller.TopPage()).__OnOK__Delegate = ForceLogout_OnOK;
    return true;
    //return;    
}

function bool rfAckHash(int Result, string Error)
{
    Log((("[BTTcpHandler::rfAckHash] Result=" $ string(Result)) $ " Error=") $ Error);
    i = MainMenu.Pages.Length;
    J0x55:

    // End:0x9D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckHash(Result, Error))
    {
        // [Loop Continue]
        goto J0x55;
    }
    return true;
    //return;    
}

function bool rfAckSuccessStartGame(int Result, string ErrMsg, byte IsHost, string HostIP, int HostPort, int LoadingStep)
{
    Log((((((("[BTTcpHandler::rfAckSuccessStartGame] HostIP=" $ HostIP) $ "HostPort=") $ string(HostPort)) $ "Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x8A:

    // End:0xE6 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSuccessStartGame(Result, ErrMsg, IsHost, HostIP, HostPort, LoadingStep))
    {
        // [Loop Continue]
        goto J0x8A;
    }
    return true;
    //return;    
}

function bool rfAckFailedStartGame(int Result, string ErrMsg, byte IsHost, int FailedUserID, int LoadingStep)
{
    Log((((("[BTTcpHandler::rfAckFailedStartGame] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " FailedUserID=") $ string(FailedUserID));
    i = MainMenu.Pages.Length;
    J0x7C:

    // End:0xD3 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckFailedStartGame(Result, ErrMsg, IsHost, FailedUserID, LoadingStep))
    {
        // [Loop Continue]
        goto J0x7C;
    }
    return true;
    //return;    
}

function bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState)
{
    Log((((("[BTTcpHandler::rfAckNotifyLoadingState] Result=" $ string(Result)) $ " UserID=") $ string(UserID)) $ " LoadingState=") $ string(LoadingState));
    i = MainMenu.Pages.Length;
    J0x81:

    // End:0xCE [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyLoadingState(Result, UserID, LoadingState))
    {
        // [Loop Continue]
        goto J0x81;
    }
    return true;
    //return;    
}

function bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    Log((("[BTTcpHandler::rfAckSendFriendInvite] Result=" $ string(Result)) $ " Error=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x61:

    // End:0xA9 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSendFriendInvite(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x61;
    }
    return true;
    //return;    
}

function bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    Log((((("[BTTcpHandler::rfReqRecvFriendInvite] ReqUserID=" $ string(ReqUserID)) $ " ReqCharname=") $ ReqCharname) $ " InviteMsg=") $ InviteMsg);
    i = MainMenu.Pages.Length;
    J0x80:

    // End:0xCD [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvFriendInvite(ReqUserID, ReqCharname, InviteMsg))
    {
        // [Loop Continue]
        goto J0x80;
    }
    return true;
    //return;    
}

function bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    Log((("[BTTcpHandler::rfAckConfirmFriendInvite] Result=" $ string(Result)) $ " Error=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x64:

    // End:0xAC [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckConfirmFriendInvite(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x64;
    }
    return true;
    //return;    
}

function bool rfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    Log((("[BTTcpHandler::rfReqCompleteFriendInvite] CharnameToBeInvited=" $ CharnameToBeInvited) $ " IsPermit=") $ string(IsPermit));
    i = MainMenu.Pages.Length;
    J0x75:

    // End:0xBD [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqCompleteFriendInvite(CharnameToBeInvited, IsPermit))
    {
        // [Loop Continue]
        goto J0x75;
    }
    return true;
    //return;    
}

function bool rfAckFriendListStart(int Result, int TotalCount)
{
    Log("[BTTcpHandler::rfAckFriendListStart]");
    i = MainMenu.Pages.Length;
    J0x3D:

    // End:0x85 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckFriendListStart(Result, TotalCount))
    {
        // [Loop Continue]
        goto J0x3D;
    }
    return true;
    //return;    
}

function bool rfAckFriendList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> LevelMarkID, array<int> ClanLevel, array<int> Level, array<byte> IsLookForClan)
{
    Log("[BTTcpHandler::rfAckFriendList]");
    i = MainMenu.Pages.Length;
    J0x38:

    // End:0xA8 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckFriendList(FriendName, IsLogOn, ClanName, CM_Pattern, CM_BG, CM_BL, LevelMarkID, ClanLevel, Level, IsLookForClan))
    {
        // [Loop Continue]
        goto J0x38;
    }
    return true;
    //return;    
}

function bool rfAckFriendListEnd()
{
    Log("[BTTcpHandler::rfAckFriendListEnd]");
    i = MainMenu.Pages.Length;
    J0x3B:

    // End:0x79 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckFriendListEnd())
    {
        // [Loop Continue]
        goto J0x3B;
    }
    return true;
    //return;    
}

function bool rfAckStartMemoList(int Result, string ErrMsg, byte Type, int TotalCount)
{
    Log("[BTTcpHandler::rfAckStartMemoList]");
    i = MainMenu.Pages.Length;
    J0x3B:

    // End:0x8D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckStartMemoList(Result, ErrMsg, Type, TotalCount))
    {
        // [Loop Continue]
        goto J0x3B;
    }
    return true;
    //return;    
}

function bool rfAckMemoList(array<int> MemoIdx, array<string> cnameFrom, array<string> dateRecv, array<string> Text, array<byte> Status, array<int> UntilExpire, array<BtrDouble> ItemUID, array<int> ItemID, array<byte> MsgType, array<int> ItemPartID)
{
    Log("[BTTcpHandler::rfAckMemoList]");
    i = MainMenu.Pages.Length;
    J0x36:

    // End:0xA6 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckMemoList(MemoIdx, cnameFrom, dateRecv, Text, Status, UntilExpire, ItemUID, ItemID, MsgType, ItemPartID))
    {
        // [Loop Continue]
        goto J0x36;
    }
    return true;
    //return;    
}

function bool rfAckTestDouble(BtrDouble vDouble, array<BtrDouble> vDoubles)
{
    local BtrDouble A;
    local array<BtrDouble> aaa;
    local string strDouble;

    i = 0;
    A = vDouble;
    strDouble = __NFUN_918__(A);
    // End:0x3B
    if(__NFUN_913__(A, vDouble))
    {
        A = vDouble;
    }
    strDouble = __NFUN_918__(A);
    // End:0x68
    if(__NFUN_912__(A, vDouble))
    {
        A = __NFUN_907__(A, 1);
    }
    strDouble = __NFUN_918__(A);
    // End:0x96
    if(__NFUN_912__(A, vDouble))
    {
        A = __NFUN_907__(A, 2);
    }
    strDouble = __NFUN_918__(A);
    // End:0xC3
    if(__NFUN_913__(A, vDouble))
    {
        A = __NFUN_910__(A, 1);
    }
    strDouble = __NFUN_918__(A);
    A = __NFUN_907__(A, 1);
    strDouble = __NFUN_918__(A);
    A = __NFUN_910__(A, 1);
    strDouble = __NFUN_918__(A);
    A = __NFUN_901__(A, 2);
    strDouble = __NFUN_918__(A);
    A = __NFUN_904__(A, 2);
    strDouble = __NFUN_918__(A);
    aaa.Insert(0, vDoubles.Length);
    i = 0;
    J0x15B:

    // End:0x3E8 [Loop If]
    if(i < aaa.Length)
    {
        aaa[i] = vDoubles[i];
        strDouble = __NFUN_918__(aaa[i]);
        // End:0x2A2
        if(__NFUN_912__(aaa[i], vDoubles[i]))
        {
            aaa[i] = __NFUN_907__(aaa[i], 1);
            strDouble = __NFUN_918__(aaa[i]);
            aaa[i] = __NFUN_910__(aaa[i], 1);
            strDouble = __NFUN_918__(aaa[i]);
            aaa[i] = __NFUN_901__(aaa[i], 2);
            strDouble = __NFUN_918__(aaa[i]);
            aaa[i] = __NFUN_904__(aaa[i], 2);
            strDouble = __NFUN_918__(aaa[i]);
            aaa[i] = __NFUN_907__(aaa[i], 1);
            strDouble = __NFUN_918__(aaa[i]);            
        }
        else
        {
            aaa[i] = __NFUN_907__(aaa[i], 1);
            strDouble = __NFUN_918__(aaa[i]);
            aaa[i] = __NFUN_910__(aaa[i], 1);
            strDouble = __NFUN_918__(aaa[i]);
            aaa[i] = __NFUN_901__(aaa[i], 2);
            strDouble = __NFUN_918__(aaa[i]);
            aaa[i] = __NFUN_904__(aaa[i], 2);
            strDouble = __NFUN_918__(aaa[i]);
        }
        // End:0x3AB
        if(__NFUN_913__(aaa[i], vDoubles[i]))
        {
            aaa[i] = __NFUN_910__(aaa[i], 1);
            strDouble = __NFUN_918__(aaa[i]);
        }
        // End:0x3DE
        if(__NFUN_913__(aaa[i], vDoubles[i]))
        {
            aaa[i] = aaa[i];
        }
        i++;
        // [Loop Continue]
        goto J0x15B;
    }
    sfReqTestDouble(A, aaa);
    return true;
    //return;    
}

function bool rfAckEndMemoList()
{
    Log("[BTTcpHandler::rfAckEndMemoList]");
    i = MainMenu.Pages.Length;
    J0x39:

    // End:0x77 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckEndMemoList())
    {
        // [Loop Continue]
        goto J0x39;
    }
    return true;
    //return;    
}

function bool rfAckReadMemo(string cnameFrom, string Text, string dateRecv, BtrDouble ItemUID)
{
    Log("[BTTcpHandler::rfAckReadMemo]");
    i = MainMenu.Pages.Length;
    J0x36:

    // End:0x88 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckReadMemo(cnameFrom, Text, dateRecv, ItemUID))
    {
        // [Loop Continue]
        goto J0x36;
    }
    return true;
    //return;    
}

function bool rfAckRecvMemo(string cnameFrom, byte MemoType)
{
    Log("[BTTcpHandler::rfReqRecvMemo]");
    i = MainMenu.Pages.Length;
    J0x36:

    // End:0x7E [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvMemo(cnameFrom, MemoType))
    {
        // [Loop Continue]
        goto J0x36;
    }
    return true;
    //return;    
}

function bool rfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    Log("[BTTcpHandler::rfAckSendGift]");
    i = MainMenu.Pages.Length;
    J0x36:

    // End:0x88 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSendGift(Result, ErrMsg, PointRemain, CashRemain))
    {
        // [Loop Continue]
        goto J0x36;
    }
    return true;
    //return;    
}

function bool rfAckAuctionTradeHistory(int Result, string ErrMsg, int ItemID, int PartID, array<string> SellerCharNm, array<int> DamageDegree, array<int> Price)
{
    Log("[BTTcpHandler::rfAckAuctionTradeHistory]");
    i = MainMenu.Pages.Length;
    J0x41:

    // End:0xA2 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAuctionTradeHistory(Result, ErrMsg, ItemID, PartID, SellerCharNm, DamageDegree, Price))
    {
        // [Loop Continue]
        goto J0x41;
    }
    return true;
    //return;    
}

function bool rfAckAuctionBidding(int Result, string ErrMsg, int PointRemain)
{
    Log("[BTTcpHandler::rfAckAuctionBidding]");
    i = MainMenu.Pages.Length;
    J0x3C:

    // End:0x89 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAuctionBidding(Result, ErrMsg, PointRemain))
    {
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool rfAckSendMemo(array<string> CnamesToFail, array<int> ResultArray)
{
    Log("[BTTcpHandler::rfAckSendMemo]");
    i = MainMenu.Pages.Length;
    J0x36:

    // End:0x7E [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSendMemo(CnamesToFail, ResultArray))
    {
        // [Loop Continue]
        goto J0x36;
    }
    return true;
    //return;    
}

event bool rfAckDelMemo(int Result, string ErrMsg, array<int> FailedMemoID)
{
    Log("[BTTcpHandler::rfAckDelMemo]");
    i = MainMenu.Pages.Length;
    J0x35:

    // End:0x82 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckDelMemo(Result, ErrMsg, FailedMemoID))
    {
        // [Loop Continue]
        goto J0x35;
    }
    return true;
    //return;    
}

event bool rfAckDeleteMailAll(int Result, byte MailType, int Count)
{
    Log("[BTTcpHandler::rfAckDelMemo]");
    i = MainMenu.Pages.Length;
    J0x35:

    // End:0x82 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckDeleteMailAll(Result, MailType, Count))
    {
        // [Loop Continue]
        goto J0x35;
    }
    return true;
    //return;    
}

function bool rfAckGetAttachedItemFromMemo(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID)
{
    Log("[BTTcpHandler::rfAckGetAttachedItemFromMemo]");
    i = MainMenu.Pages.Length;
    J0x45:

    // End:0x97 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetAttachedItemFromMemo(Result, ErrMsg, ItemIdx, ItemID))
    {
        // [Loop Continue]
        goto J0x45;
    }
    return true;
    //return;    
}

function bool rfAckNotifyExpiredItemIDs(int UserID, array<BtrDouble> ExpiredItemUniqueIDs, array<int> ExpiredItemIDs, array<int> ExpiredItemPartIDs, array<byte> ExpiredItemSlotPos, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckNotifyExpiredItemIDs]");
    i = MainMenu.Pages.Length;
    J0x42:

    // End:0xA3 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyExpiredItemIDs(UserID, ExpiredItemUniqueIDs, ExpiredItemIDs, ExpiredItemPartIDs, ExpiredItemSlotPos, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x42;
    }
    return true;
    //return;    
}

function bool rfAckNotifyExpiredSkillIDs(int UserID, array<BtrDouble> ExpiredSkillUniqueIDs, array<int> ExpiredSkillIDs, int Result, string ErrMsg, array<byte> ExpiredSkillSlotPositions)
{
    Log("[BTTcpHandler::rfAckNotifyExpiredSkillIDs]");
    i = MainMenu.Pages.Length;
    J0x43:

    // End:0x9F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyExpiredSkillIDs(UserID, ExpiredSkillUniqueIDs, ExpiredSkillIDs, Result, ErrMsg, ExpiredSkillSlotPositions))
    {
        // [Loop Continue]
        goto J0x43;
    }
    return true;
    //return;    
}

function bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckBanUser]");
    i = MainMenu.Pages.Length;
    J0x35:

    // End:0x8C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckBanUser(GameNum, UID, BanUID, Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x35;
    }
    return true;
    //return;    
}

function bool rfAckMyMoney(int Result, string ErrMsg, int Point, int Cash)
{
    Log("[BTTcpHandler::rfAckMyMoney]");
    i = MainMenu.Pages.Length;
    J0x35:

    // End:0x87 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckMyMoney(Result, ErrMsg, Point, Cash))
    {
        // [Loop Continue]
        goto J0x35;
    }
    return true;
    //return;    
}

function bool rfAckGetServerTime(BtrDouble ServerTime, string ClientIP)
{
    Log("[BTTcpHandler::rfAckGetServerTime]");
    i = MainMenu.Pages.Length;
    J0x3B:

    // End:0x83 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetServerTime(ServerTime, ClientIP))
    {
        // [Loop Continue]
        goto J0x3B;
    }
    return true;
    //return;    
}

function bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTTcpHandler::rfAckCreateClan]");
    i = MainMenu.Pages.Length;
    J0x38:

    // End:0x8A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckCreateClan(Result, ErrMsg, ItemIdx, StackCount))
    {
        // [Loop Continue]
        goto J0x38;
    }
    return true;
    //return;    
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckDupCheckClanName]");
    i = MainMenu.Pages.Length;
    J0x3E:

    // End:0x86 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckDupCheckClanName(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x3E;
    }
    return true;
    //return;    
}

function bool rfAckClanInfo(ClanInfo stClanInfo)
{
    Log("[BTTcpHandler::rfAckClanInfo]");
    i = MainMenu.Pages.Length;
    J0x36:

    // End:0x79 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanInfo(stClanInfo))
    {
        // [Loop Continue]
        goto J0x36;
    }
    return true;
    //return;    
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    Log("[BTTcpHandler::rfAckClanUserListStart]");
    i = MainMenu.Pages.Length;
    J0x3F:

    // End:0x87 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanUserListStart(Result, TotalCount))
    {
        // [Loop Continue]
        goto J0x3F;
    }
    return true;
    //return;    
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    Log("[BTTcpHandler::rfAckClanUserList]");
    i = MainMenu.Pages.Length;
    J0x3A:

    // End:0xAA [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanUserList(Result, ErrMsg, Level, CharName, ClanGrade, ClanWinCnt, ClanLoseCnt, LevelMarkID, TitleMarkID, DudeId))
    {
        // [Loop Continue]
        goto J0x3A;
    }
    return true;
    //return;    
}

function bool rfAckClanUserListEnd()
{
    Log("[BTTcpHandler::rfAckClanUserListEnd]");
    i = MainMenu.Pages.Length;
    J0x3D:

    // End:0x7B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanUserListEnd())
    {
        // [Loop Continue]
        goto J0x3D;
    }
    return true;
    //return;    
}

function bool rfAckClanNews(array<string> IssueDate, array<byte> IssueType, array<string> IssuedClanMember)
{
    Log("[BTTcpHandler::rfAckClanNews]");
    i = MainMenu.Pages.Length;
    J0x36:

    // End:0x83 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanNews(IssueDate, IssueType, IssuedClanMember))
    {
        // [Loop Continue]
        goto J0x36;
    }
    return true;
    //return;    
}

function bool rfAckClanClose(int Result, string ErrMsg, string ClanName)
{
    Log("[BTTcpHandler::rfAckClanClose]");
    i = MainMenu.Pages.Length;
    J0x37:

    // End:0x84 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanClose(Result, ErrMsg, ClanName))
    {
        // [Loop Continue]
        goto J0x37;
    }
    return true;
    //return;    
}

function bool rfAckClanSecession(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanSecession]");
    i = MainMenu.Pages.Length;
    J0x3B:

    // End:0x83 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanSecession(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x3B;
    }
    return true;
    //return;    
}

function bool rfAckClanChangeInfo(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanChangeInfo]");
    i = MainMenu.Pages.Length;
    J0x3C:

    // End:0x84 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanChangeInfo(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool rfAckClanPersonelIntro(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanPersonelIntro]");
    i = MainMenu.Pages.Length;
    J0x3F:

    // End:0x87 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanPersonelIntro(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x3F;
    }
    return true;
    //return;    
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    Log("[BTTcpHandler::rfAckSearchClan]");
    i = MainMenu.Pages.Length;
    J0x38:

    // End:0xCB [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSearchClan(Result, ErrMsg, TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel))
    {
        // [Loop Continue]
        goto J0x38;
    }
    return true;
    //return;    
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    Log("[BTTcpHandler::rfAckDBCharInfo]");
    i = MainMenu.Pages.Length;
    J0x38:

    // End:0xC6 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckDBCharInfo(Result, ErrMsg, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, ClanPersonIntro, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo, ClanLevel))
    {
        // [Loop Continue]
        goto J0x38;
    }
    return true;
    //return;    
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    Log("[BTTcpHandler::rfAckClanCharPersonelIntro]");
    i = MainMenu.Pages.Length;
    J0x43:

    // End:0x90 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanCharPersonelIntro(Result, ErrMsg, PersonelIntro))
    {
        // [Loop Continue]
        goto J0x43;
    }
    return true;
    //return;    
}

function bool rfReqNotifyChangeRoomState(byte RoomState)
{
    Log("[BTTcpHandler::rfReqNotifyChangeRoomState]");
    i = MainMenu.Pages.Length;
    J0x43:

    // End:0x86 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqNotifyChangeRoomState(RoomState))
    {
        // [Loop Continue]
        goto J0x43;
    }
    return true;
    //return;    
}

function bool rfAckForceDisconnectUDPFromHost(int Result)
{
    Log("[BTTcpHandler::rfAckForceDisconnectUDPFromHost]");
    i = MainMenu.Pages.Length;
    J0x48:

    // End:0x8B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckForceDisconnectUDPFromHost(Result))
    {
        // [Loop Continue]
        goto J0x48;
    }
    return true;
    //return;    
}

function bool rfReqRecvForceDisconnectUDPFromHost(int Result)
{
    Log("[BTTcpHandler::rfReqRecvForceDisconnectUDPFromHost]");
    i = MainMenu.Pages.Length;
    J0x4C:

    // End:0x8F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvForceDisconnectUDPFromHost(Result))
    {
        // [Loop Continue]
        goto J0x4C;
    }
    return true;
    //return;    
}

function bool rfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    Log("[BTTcpHandler::rfReqNotifyRelayServerAddr]");
    i = MainMenu.Pages.Length;
    J0x43:

    // End:0x8B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqNotifyRelayServerAddr(RelayIP, RelayPort))
    {
        // [Loop Continue]
        goto J0x43;
    }
    return true;
    //return;    
}

function bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint)
{
    Log("[BTTcpHandler::rfAckGetUserHostPriorityPoint]");
    i = MainMenu.Pages.Length;
    J0x46:

    // End:0x93 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetUserHostPriorityPoint(Result, UserID, HostPriorityPoint))
    {
        // [Loop Continue]
        goto J0x46;
    }
    return true;
    //return;    
}

function bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    Log((((((((("[BTTcpHandler::rfAckGetHolePunchingResult] Result=" $ string(Result)) $ " Phrase=") $ string(Phrase)) $ " Intervention=") $ string(Intervention)) $ " InterventionUserID=") $ string(InterventionUserID)) $ " FailedUserIDs.length=") $ string(FailedUserIDs.Length));
    i = MainMenu.Pages.Length;
    J0xC9:

    // End:0x120 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetHolePunchingResult(Result, Phrase, InterventionUserID, Intervention, FailedUserIDs))
    {
        // [Loop Continue]
        goto J0xC9;
    }
    return true;
    //return;    
}

function bool rfAckNotifyHostBlocking(int Result, byte Blocking)
{
    Log((("[BTTcpHandler::rfAckNotifyHostBlocking] Result=" $ string(Result)) $ " Blocking=") $ string(Blocking));
    i = MainMenu.Pages.Length;
    J0x68:

    // End:0xB0 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyHostBlocking(Result, Blocking))
    {
        // [Loop Continue]
        goto J0x68;
    }
    return true;
    //return;    
}

function bool rfAckGetIsHostBlocking(int Result, byte Blocking)
{
    Log((("[BTTcpHandler::rfAckGetIsHostBlocking] Result=" $ string(Result)) $ " Blocking=") $ string(Blocking));
    i = MainMenu.Pages.Length;
    J0x67:

    // End:0xAF [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetIsHostBlocking(Result, Blocking))
    {
        // [Loop Continue]
        goto J0x67;
    }
    return true;
    //return;    
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    Log("[BTTcpHandler::rfReqRecvClanInvite] InviterCharname=" $ InviterCharname);
    i = MainMenu.Pages.Length;
    J0x54:

    // End:0xA6 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvClanInvite(InviterUserDBID, InviterCharname, ClanName, InviteMsg))
    {
        // [Loop Continue]
        goto J0x54;
    }
    return true;
    //return;    
}

function bool rfAckInviteClan(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckInviteClan] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x49:

    // End:0x91 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckInviteClan(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x49;
    }
    return true;
    //return;    
}

function bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    Log("[BTTcpHandler::rfAckInviteClanResult] Charname=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x4F:

    // End:0x9C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckInviteClanResult(CharName, Permit, ClanNm))
    {
        // [Loop Continue]
        goto J0x4F;
    }
    return true;
    //return;    
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckRecvClanInviteResult] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x53:

    // End:0x9B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRecvClanInviteResult(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x53;
    }
    return true;
    //return;    
}

function bool rfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    Log("[BTTcpHandler::rfReqRecvJoinClan] Charname=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x4B:

    // End:0x98 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvJoinClan(UserIdx, CharName, Message))
    {
        // [Loop Continue]
        goto J0x4B;
    }
    return true;
    //return;    
}

function bool rfAckNotifyNewClanMember(string ClanName, string CharName)
{
    Log((("[BTTcpHandler::rfAckNotifyNewClanMember] Clanname=" $ ClanName) $ " Charname=") $ CharName);
    i = MainMenu.Pages.Length;
    J0x67:

    // End:0xAF [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyNewClanMember(ClanName, CharName))
    {
        // [Loop Continue]
        goto J0x67;
    }
    return true;
    //return;    
}

function bool rfAckNotifyClanSecession(string ClanName, string CharName)
{
    Log((("[BTTcpHandler::rfAckNotifyClanSecession] Clanname=" $ ClanName) $ " Charname=") $ CharName);
    i = MainMenu.Pages.Length;
    J0x67:

    // End:0xAF [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyClanSecession(ClanName, CharName))
    {
        // [Loop Continue]
        goto J0x67;
    }
    return true;
    //return;    
}

function bool rfAckJoinClanResult(string ClanName, byte Permit, string PermitCharName)
{
    Log((((("[BTTcpHandler::rfAckJoinClanResult] Clanname=" $ ClanName) $ " Permit=") $ string(Permit)) $ "PermitCharName=") $ PermitCharName);
    i = MainMenu.Pages.Length;
    J0x7C:

    // End:0xC9 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckJoinClanResult(ClanName, Permit, PermitCharName))
    {
        // [Loop Continue]
        goto J0x7C;
    }
    return true;
    //return;    
}

function bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckRecvJoinClanResult] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x51:

    // End:0x99 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRecvJoinClanResult(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x51;
    }
    return true;
    //return;    
}

function bool rfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    Log("[BTTcpHandler::rfReqClanCharPersonelIntro] CharName=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x54:

    // End:0x9C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqClanCharPersonelIntro(ClanName, CharName))
    {
        // [Loop Continue]
        goto J0x54;
    }
    return true;
    //return;    
}

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    Log("[BTTcpHandler::rfAckAdjustClanMemberGrade] CharName=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x54:

    // End:0xAB [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAdjustClanMemberGrade(Result, ErrMsg, ClanName, CharName, CharGrade))
    {
        // [Loop Continue]
        goto J0x54;
    }
    return true;
    //return;    
}

function bool rfAckBlockUserListStart(int Result, int TotalCount)
{
    Log((("[BTTcpHandler::rfAckBlockUserListStart] Result=" $ string(Result)) $ " TotalCount=") $ string(TotalCount));
    i = MainMenu.Pages.Length;
    J0x6A:

    // End:0xB2 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckBlockUserListStart(Result, TotalCount))
    {
        // [Loop Continue]
        goto J0x6A;
    }
    return true;
    //return;    
}

function bool rfAckAddBlockUserList(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckAddBlockUserList] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4F:

    // End:0x97 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAddBlockUserList(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x4F;
    }
    return true;
    //return;    
}

function bool rfAckBlockUserListEnd()
{
    Log("[BTTcpHandler::rfAckBlockUserListEnd]");
    i = MainMenu.Pages.Length;
    J0x3E:

    // End:0x7C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckBlockUserListEnd())
    {
        // [Loop Continue]
        goto J0x3E;
    }
    return true;
    //return;    
}

function bool rfAckRemoveBlockUserList(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckRemoveBlockUserList] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x52:

    // End:0x9A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRemoveBlockUserList(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x52;
    }
    return true;
    //return;    
}

function bool rfAckBlockUserList(array<string> CharName)
{
    Log("[BTTcpHandler::rfAckBlockUserList] Charname.Length=" $ string(CharName.Length));
    i = MainMenu.Pages.Length;
    J0x56:

    // End:0x99 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckBlockUserList(CharName))
    {
        // [Loop Continue]
        goto J0x56;
    }
    return true;
    //return;    
}

function bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    Log((((("[BTTcpHandler::rfReqNotifyLevelUp] LevelUpUserID=" $ string(LevelUpUserID)) $ ", Level=") $ string(Level)) $ ", ItemID.Length=") $ string(ItemID.Length));
    i = MainMenu.Pages.Length;
    J0x86:

    // End:0xDD [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqNotifyLevelUp(LevelUpUserID, Level, Exp, ItemID, PartID))
    {
        // [Loop Continue]
        goto J0x86;
    }
    return true;
    //return;    
}

function bool rfAckAcquirePromotionItems(int UID, int Result, string ErrMsg, array<BtrDouble> ItemUniqueID, array<int> ItemIDs, array<int> PartIDs)
{
    Log((("[BTTcpHandler::rfAckAcquirePromotionItems] UID=" $ string(UID)) $ ", Result=") $ string(Result));
    i = MainMenu.Pages.Length;
    J0x67:

    // End:0xC3 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAcquirePromotionItems(UID, Result, ErrMsg, ItemUniqueID, ItemIDs, PartIDs))
    {
        // [Loop Continue]
        goto J0x67;
    }
    return true;
    //return;    
}

function bool rfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    Log("[BTTcpHandler::rfReqNotifyDurabilityZeroItem] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x57:

    // End:0xB8 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqNotifyDurabilityZeroItem(Result, ErrMsg, UserID, ItemUniqueIDs, ItemIDs, ItemPartIDs, ItemSlotPos))
    {
        // [Loop Continue]
        goto J0x57;
    }
    return true;
    //return;    
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    Log(((("[BTTcpHandler::rfAckNotifyAdjustClanMemberGrade] ClanName=" $ ClanName) $ ", CharName=") $ CharName) @ string(CharGrade));
    i = MainMenu.Pages.Length;
    J0x79:

    // End:0xC6 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyAdjustClanMemberGrade(ClanName, CharName, CharGrade))
    {
        // [Loop Continue]
        goto J0x79;
    }
    return true;
    //return;    
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    Log((("[BTTcpHandler::rfAckChatWispher] Result=" $ string(Result)) $ ", ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x5E:

    // End:0xAB [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChatWispher(Result, ErrMsg, ToCharName))
    {
        // [Loop Continue]
        goto J0x5E;
    }
    return true;
    //return;    
}

function bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    Log("[BTTcpHandler::rfAckDeleteFriend] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4B:

    // End:0x93 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckDeleteFriend(Result, FailedCharname))
    {
        // [Loop Continue]
        goto J0x4B;
    }
    return true;
    //return;    
}

function bool rfReqRecvDeleteFriend(int Result, string FromCharName)
{
    Log("[BTTcpHandler::rfReqRecvDeleteFriend] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4F:

    // End:0x97 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvDeleteFriend(Result, FromCharName))
    {
        // [Loop Continue]
        goto J0x4F;
    }
    return true;
    //return;    
}

function bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, array<int> UID, array<string> CharName, array<int> UserLevel, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<byte> IsLookForClan, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    Log("[BTTcpHandler::rfAckChannelUserListInGameRoom] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x58:

    // End:0xF0 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChannelUserListInGameRoom(Result, TotalCount, Count, StartIndex, UID, CharName, UserLevel, ClanName, ClanPattern, ClanBG, ClanBL, IsLookForClan, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // [Loop Continue]
        goto J0x58;
    }
    return true;
    //return;    
}

function bool rfAckExceedMaxUser()
{
    Log("[BTTcpHandler::rfAckExceedMaxUser]");
    i = MainMenu.Pages.Length;
    J0x3B:

    // End:0x79 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckExceedMaxUser())
    {
        // [Loop Continue]
        goto J0x3B;
    }
    return true;
    //return;    
}

function bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    Log("[BTTcpHandler::rfAckJoinClan]");
    i = MainMenu.Pages.Length;
    J0x36:

    // End:0x8D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckJoinClan(Result, ErrMsg, SpecificCharName, RealRecvCharName, RealRecvCharClanGrade))
    {
        // [Loop Continue]
        goto J0x36;
    }
    return true;
    //return;    
}

function bool rfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x67 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvNotice_FromGM(Result, ErrMsg, NoticeMsg, IsFromDB))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    i = MainMenu.Pages.Length;
    J0x15:

    // End:0x5D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvForceDisconnected_FromGM(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x15;
    }
    return true;
    //return;    
}

function bool rfReqNotifyDisconnectHostInLoading(int Result, string ErrMsg, int HostID)
{
    Log((((("[BTTcpHandler::rfReqNotifyDisconnectHostInLoading] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " HostID=") $ string(HostID));
    i = MainMenu.Pages.Length;
    J0x84:

    // End:0xD1 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqNotifyDisconnectHostInLoading(Result, ErrMsg, HostID))
    {
        // [Loop Continue]
        goto J0x84;
    }
    return true;
    //return;    
}

function bool rfAckNotifyMyCharInfoToRoomUser(int Result, string ErrMsg, int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost, string UserIP, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor)
{
    Log((("[BTTcpHandler::rfAckNotifyMyCharInfoToRoomUser] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x6C:

    // End:0xF0 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyMyCharInfoToRoomUser(Result, ErrMsg, UID, UserName, Grade, TeamNum, Statue, IsHost, UserIP, ClanName, CM_Pattern, CM_BG, CM_BL, IsLookFor))
    {
        // [Loop Continue]
        goto J0x6C;
    }
    return true;
    //return;    
}

event bool rfAckRegisterMyUdpInfo(int Result, string ErrMsg)
{
    Log((("[BTTcpHandler::rfAckRegisterMyUdpInfo] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x63:

    // End:0xAB [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRegisterMyUdpInfo(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x63;
    }
    return true;
    //return;    
}

function bool rfAckStartHolePunching(int Result, string ErrMsg, int GameType, int ReqStartUserID)
{
    Log((((((("[BTTcpHandler::rfAckStartHolePunching] Result=" $ string(Result)) $ " ErrMsg=") $ ErrMsg) $ " GameType=") $ string(GameType)) $ " ReqStartUserID=") $ string(ReqStartUserID));
    i = MainMenu.Pages.Length;
    J0x97:

    // End:0xE9 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckStartHolePunching(Result, ErrMsg, GameType, ReqStartUserID))
    {
        // [Loop Continue]
        goto J0x97;
    }
    return true;
    //return;    
}

function bool rfReqRecvForceFailedClientLoading(int ErrCode)
{
    Log(("[BTTcpHandler::rfReqRecvForceFailedClientLoading]" $ "ErrCode=") $ string(ErrCode));
    i = MainMenu.Pages.Length;
    J0x5F:

    // End:0xA2 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvForceFailedClientLoading(ErrCode))
    {
        // [Loop Continue]
        goto J0x5F;
    }
    return true;
    //return;    
}

function bool rfAckItemListInItemBox(int Result, string ErrMsg, BtrDouble ItemUniqueID, int BoxItemID, array<int> ItemID, array<int> PartID, byte FromContent)
{
    Log("[BTTcpHandler::rfAckItemListInItemBox] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x50:

    // End:0xB1 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckItemListInItemBox(Result, ErrMsg, ItemUniqueID, BoxItemID, ItemID, PartID, FromContent))
    {
        // [Loop Continue]
        goto J0x50;
    }
    return true;
    //return;    
}

function bool rfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    Log("[BTTcpHandler::rfAckGetItemFromItemBox] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x51:

    // End:0xC1 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetItemFromItemBox(Result, ErrMsg, ItemIDChoose, PartIDChoose, BoxItemIdx, BxoItemCount, bHave, ItemIdx, UntilTime, StackCount))
    {
        // [Loop Continue]
        goto J0x51;
    }
    return true;
    //return;    
}

function bool rfAckAutoChangedTeamUserList(array<int> UserID, array<int> TeamNum)
{
    Log(("[BTTcpHandler::rfAckAutoChangedTeamUserList]" $ "UserID.Length=") $ string(UserID.Length));
    i = MainMenu.Pages.Length;
    J0x61:

    // End:0xA9 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAutoChangedTeamUserList(UserID, TeamNum))
    {
        // [Loop Continue]
        goto J0x61;
    }
    return true;
    //return;    
}

function bool rfAckInviteGameRoom(int Result, byte Answer, string GuestCharName)
{
    Log("[BTTcpHandler::rfAckInviteGameRoom] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4D:

    // End:0x9A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckInviteGameRoom(Result, Answer, GuestCharName))
    {
        // [Loop Continue]
        goto J0x4D;
    }
    return true;
    //return;    
}

function bool rfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    Log(("[BTTcpHandler::rfReqRecvInviteGameRoom]" $ "InviteUserServerName=") $ InviteUserServerName);
    i = MainMenu.Pages.Length;
    J0x60:

    // End:0xE4 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqRecvInviteGameRoom(InviteUserServerName, InviteUserServerID, InviteUserChannelNumber, RoomUniqueID, RoomNumber, RoomName, RoomState, MapName, OwnerName, GameMode, WeaponLimit, IsTeamBalance, Password, InviteCharName))
    {
        // [Loop Continue]
        goto J0x60;
    }
    return true;
    //return;    
}

function bool rfAckRecvInviteGameRoomResult(int Result)
{
    Log("[BTTcpHandler::rfAckRecvInviteGameRoomResult] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x57:

    // End:0x9A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRecvInviteGameRoomResult(Result))
    {
        // [Loop Continue]
        goto J0x57;
    }
    return true;
    //return;    
}

function bool rfAckLimitedListInChannel(int Result, array<int> LimitedMapID, array<int> LimitedModeID)
{
    Log("[BTTcpHandler::rfAckLimitedListInChannel] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x53:

    // End:0xA0 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckLimitedListInChannel(Result, LimitedMapID, LimitedModeID))
    {
        // [Loop Continue]
        goto J0x53;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    Log("[BTTcpHandler::rfAckClanMatch_GetReady] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x51:

    // End:0x9E [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_GetReady(Result, ErrMsg, RoomIndex))
    {
        // [Loop Continue]
        goto J0x51;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_StartCombat(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanMatch_StartCombat] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x54:

    // End:0x9C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_StartCombat(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x54;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_NotifiyStartCombat(array<int> MapNumArray, int VersusMode)
{
    Log("[BTTcpHandler::rfAckClanMatch_NotifiyStartCombat]");
    i = MainMenu.Pages.Length;
    J0x4A:

    // End:0x92 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_NotifiyStartCombat(MapNumArray, VersusMode))
    {
        // [Loop Continue]
        goto J0x4A;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_Join(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanMatch_Join] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4D:

    // End:0x95 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_Join(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x4D;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, string CharName, int ClanGrade, int ClanWin, int ClanLose, string ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log(("[BTTcpHandler::rfAckClanMatch_JoinNotify]" $ " Charname=") $ CharName);
    i = MainMenu.Pages.Length;
    J0x57:

    // End:0xE5 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_JoinNotify(IsLeader, ClanMarkPA, ClanMarkBG, ClanMarkBL, Level, CharName, ClanGrade, ClanWin, ClanLose, CharName, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // [Loop Continue]
        goto J0x57;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_LeaveNotify(string CharName)
{
    Log(("[BTTcpHandler::rfAckClanMatch_LeaveNotify]" $ " Charname=") $ CharName);
    i = MainMenu.Pages.Length;
    J0x58:

    // End:0x9B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_LeaveNotify(CharName))
    {
        // [Loop Continue]
        goto J0x58;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_MemberList(array<byte> IsLeader, array<int> ClanMarkPA, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Level, array<string> CharName, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<string> ClanName, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    Log("[BTTcpHandler::rfAckClanMatch_MemberList] IsLeader.Length=" $ string(IsLeader.Length));
    i = MainMenu.Pages.Length;
    J0x5D:

    // End:0xEB [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_MemberList(IsLeader, ClanMarkPA, ClanMarkBG, ClanMarkBL, Level, CharName, ClanGrade, ClanWin, ClanLose, ClanName, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // [Loop Continue]
        goto J0x5D;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_Leave(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanMatch_Leave] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4E:

    // End:0x96 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_Leave(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x4E;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_Chat(int Result, string ErrMsg, string CharName, string Msg)
{
    Log("[BTTcpHandler::rfAckClanMatch_Chat] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4D:

    // End:0x9F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_Chat(Result, ErrMsg, CharName, Msg))
    {
        // [Loop Continue]
        goto J0x4D;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_WaittingTeamList(int TtotlCount, array<int> Grade, array<int> Map, array<int> Versus)
{
    Log("[BTTcpHandler::rfAckClanMatch_WaittingTeamList] TotalCount=" $ string(TtotlCount));
    i = MainMenu.Pages.Length;
    J0x5D:

    // End:0xAF [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_WaittingTeamList(TtotlCount, Grade, Map, Versus))
    {
        // [Loop Continue]
        goto J0x5D;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_ChangeLeader(int Result, string ErrMsg, int NewLeader, string NewLeaderName)
{
    Log("[BTTcpHandler::rfAckClanMatch_ChangeLeader] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x55:

    // End:0xA7 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_ChangeLeader(Result, ErrMsg, NewLeader, NewLeaderName))
    {
        // [Loop Continue]
        goto J0x55;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_StartSearching(int Result, string ErrMsg, int ShouldWaitMore)
{
    Log("[BTTcpHandler::rfAckClanMatch_StartSearching] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x57:

    // End:0xA4 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_StartSearching(Result, ErrMsg, ShouldWaitMore))
    {
        // [Loop Continue]
        goto J0x57;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore)
{
    Log("[BTTcpHandler::rfAckClanMatch_NotifyStartSearching] ShouldWaitMore=" $ string(ShouldWaitMore));
    i = MainMenu.Pages.Length;
    J0x65:

    // End:0xA8 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_NotifyStartSearching(ShouldWaitMore))
    {
        // [Loop Continue]
        goto J0x65;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_FoundMatch()
{
    Log("[BTTcpHandler::rfAckClanMatch_FoundMatch]");
    return true;
    //return;    
}

function bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber)
{
    Log("[BTTcpHandler::rfReqClanMatch_FoundMatch]");
    i = MainMenu.Pages.Length;
    J0x42:

    // End:0x8A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqClanMatch_FoundMatch(ChannelID, RoomNumber))
    {
        // [Loop Continue]
        goto J0x42;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_StopSearching()
{
    Log("[BTTcpHandler::rfAckClanMatch_StopSearching]");
    i = MainMenu.Pages.Length;
    J0x45:

    // End:0x83 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_StopSearching())
    {
        // [Loop Continue]
        goto J0x45;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_SetWaitRoomPublic(int Result, string ErrMsg, byte Set)
{
    Log("[BTTcpHandler::rfAckClanMatch_SetWaitRoomPublic]");
    i = MainMenu.Pages.Length;
    J0x49:

    // End:0x96 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_SetWaitRoomPublic(Result, ErrMsg, Set))
    {
        // [Loop Continue]
        goto J0x49;
    }
    return true;
    //return;    
}

function bool rfAckQuestListStart(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckQuestListStart]");
    i = MainMenu.Pages.Length;
    J0x3C:

    // End:0x84 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckQuestListStart(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool rfAckQuestList(array<int> QuestID, array<int> CountPrograss, array<byte> IsDailyQuest, array<byte> IsComplete)
{
    Log("[BTTcpHandler::rfAckQuestList]");
    i = MainMenu.Pages.Length;
    J0x37:

    // End:0x89 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckQuestList(QuestID, CountPrograss, IsDailyQuest, IsComplete))
    {
        // [Loop Continue]
        goto J0x37;
    }
    return true;
    //return;    
}

function bool rfAckAttendanceList(int Result, byte IsComplete, byte UpdatedNum, array<byte> StateList, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount, BtrDouble PaidItemIdx, int PaidItemStackCount)
{
    Log("BTTcpHandler::rfAckAttendanceList");
    i = MainMenu.Pages.Length;
    J0x3A:

    // End:0xA5 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckAttendanceList(Result, IsComplete, UpdatedNum, StateList, ItemIdx, RewardItemID, RewardItemCount, PaidItemIdx, PaidItemStackCount))
    {
        // [Loop Continue]
        goto J0x3A;
    }
    return true;
    //return;    
}

function bool rfAckPuzzleList(int Result, byte IsComplete, array<byte> UpdatedNum, array<byte> StateList, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount, BtrDouble PaidItemIdx, int PaidItemStackCount)
{
    Log("BTTcpHandler::rfAckPuzzleList");
    i = MainMenu.Pages.Length;
    J0x36:

    // End:0xA1 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPuzzleList(Result, IsComplete, UpdatedNum, StateList, ItemIdx, RewardItemID, RewardItemCount, PaidItemIdx, PaidItemStackCount))
    {
        // [Loop Continue]
        goto J0x36;
    }
    return true;
    //return;    
}

function bool rfAckDailyRewardListThisMonth(array<byte> Type, array<byte> Number, array<int> ItemID, array<int> ItemCount)
{
    Log("BTTcpHandler::rfAckDailyRewardListThisMonth");
    i = MainMenu.Pages.Length;
    J0x44:

    // End:0x96 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckDailyRewardListThisMonth(Type, Number, ItemID, ItemCount))
    {
        // [Loop Continue]
        goto J0x44;
    }
    return true;
    //return;    
}

function bool rfAckReceiveSpecialReward(int Result, int RewardedQuestID, byte RewardedQuestIsComplete, BtrDouble ItemIdx, int RewardItemID, int RewardItemCount)
{
    Log("BTTcpHandler::rfAckReceiveSpecialReward");
    i = MainMenu.Pages.Length;
    J0x40:

    // End:0x9C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckReceiveSpecialReward(Result, RewardedQuestID, RewardedQuestIsComplete, ItemIdx, RewardItemID, RewardItemCount))
    {
        // [Loop Continue]
        goto J0x40;
    }
    return true;
    //return;    
}

function bool rfAckSpecialQuestRank(array<string> CharList)
{
    Log("BTTcpHandler::rfAckSpecialQuestRank");
    i = MainMenu.Pages.Length;
    J0x3C:

    // End:0x7F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSpecialQuestRank(CharList))
    {
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool rfAckQuestListEnd()
{
    Log("[BTTcpHandler::rfAckQuestListEnd]");
    i = MainMenu.Pages.Length;
    J0x3A:

    // End:0x78 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckQuestListEnd())
    {
        // [Loop Continue]
        goto J0x3A;
    }
    return true;
    //return;    
}

function bool rfAckQuestUpdate(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckQuestUpdate]");
    i = MainMenu.Pages.Length;
    J0x39:

    // End:0x81 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckQuestUpdate(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x39;
    }
    return true;
    //return;    
}

function bool rfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    Log("[BTTcpHandler::rfReqQuestNewAvailable]");
    i = MainMenu.Pages.Length;
    J0x3F:

    // End:0x91 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqQuestNewAvailable(AchivedQuestID, NewQuestID, IsDailyQuest, ExpiredQuest))
    {
        // [Loop Continue]
        goto J0x3F;
    }
    return true;
    //return;    
}

function bool rfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    Log("[BTTcpHandler::rfReqDailyQuestNewAvailable]");
    i = MainMenu.Pages.Length;
    J0x44:

    // End:0x8C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqDailyQuestNewAvailable(ExpiredQuestID, NewQuestID))
    {
        // [Loop Continue]
        goto J0x44;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_InviteCrew(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanMatch_InviteCrew]");
    i = MainMenu.Pages.Length;
    J0x42:

    // End:0x8A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_InviteCrew(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x42;
    }
    return true;
    //return;    
}

function bool rfReqClanMatch_RecvInviteCrew(string Inviter, string ServerIP, int Port, int WaittingID, string Msg, int MapNum, int InviteUserChannelNum, string LeaderName, string RoomName)
{
    Log("[BTTcpHandler::rfReqClanMatch_RecvInviteCrew]");
    i = MainMenu.Pages.Length;
    J0x46:

    // End:0xB1 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqClanMatch_RecvInviteCrew(Inviter, ServerIP, Port, WaittingID, Msg, MapNum, InviteUserChannelNum, LeaderName, RoomName))
    {
        // [Loop Continue]
        goto J0x46;
    }
    return true;
    //return;    
}

function bool rfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    Log("[BTTcpHandler::rfReqClanMatch_InviteCrewResult]");
    i = MainMenu.Pages.Length;
    J0x48:

    // End:0x90 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqClanMatch_InviteCrewResult(Invitee, Result))
    {
        // [Loop Continue]
        goto J0x48;
    }
    return true;
    //return;    
}

function bool rfAckCheckEquipedWeaponDurability(int Result, array<BtrDouble> ItemUniqueID, array<int> ItemSlotNum)
{
    Log("[BTTcpHandler::rfAckCheckEquipedWeaponDurability]");
    i = MainMenu.Pages.Length;
    J0x4A:

    // End:0x97 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckCheckEquipedWeaponDurability(Result, ItemUniqueID, ItemSlotNum))
    {
        // [Loop Continue]
        goto J0x4A;
    }
    return true;
    //return;    
}

function bool rfAckWebzenCash(int Result, string ErrMsg, BtrDouble PCoinCash, BtrDouble CCoinCash)
{
    Log("[BTTcpHandler::rfAckWebzenCash]");
    i = MainMenu.Pages.Length;
    J0x38:

    // End:0x8A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckWebzenCash(Result, ErrMsg, PCoinCash, CCoinCash))
    {
        // [Loop Continue]
        goto J0x38;
    }
    return true;
    //return;    
}

function bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log("[BTTcpHandler::rfAckWebzenShopScriptVersion]");
    i = MainMenu.Pages.Length;
    J0x45:

    // End:0x92 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckWebzenShopScriptVersion(Year, YearId, SalesZoneCode))
    {
        // [Loop Continue]
        goto J0x45;
    }
    return true;
    //return;    
}

function bool rfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    Log("[BTTcpHandler::rfAckRegisteredPCBangInfo]");
    i = MainMenu.Pages.Length;
    J0x42:

    // End:0x99 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRegisteredPCBangInfo(Result, ErrMsg, IsRegisteredPCBang, IsMainPCBang, PCBangName))
    {
        // [Loop Continue]
        goto J0x42;
    }
    return true;
    //return;    
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    Log("[BTTcpHandler::rfAckGetBotID]");
    i = MainMenu.Pages.Length;
    J0x36:

    // End:0x8D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetBotID(Result, RequestedAFCount, RequestedRSACount, AFBotID, RSABotID))
    {
        // [Loop Continue]
        goto J0x36;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, string WaitRoomName)
{
    Log("[BTTcpHandler::rfAckClanMatch_GetClanWaittingRoomInfo]");
    i = MainMenu.Pages.Length;
    J0x4F:

    // End:0xAB [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_GetClanWaittingRoomInfo(WaitRoomIndex, Result, ErrMsg, MapNumArray, VersusMode, WaitRoomName))
    {
        // [Loop Continue]
        goto J0x4F;
    }
    return true;
    //return;    
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckBuyItemByWebzenCash]");
    i = MainMenu.Pages.Length;
    J0x41:

    // End:0x89 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckBuyItemByWebzenCash(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x41;
    }
    return true;
    //return;    
}

function bool rfAckGiftItemByWebzenCash(int Result, string ErrMsg, int LeftProductCount)
{
    Log("[BTTcpHandler::rfAckGiftItemByWebzenCash]");
    i = MainMenu.Pages.Length;
    J0x42:

    // End:0x8F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGiftItemByWebzenCash(Result, ErrMsg, LeftProductCount))
    {
        // [Loop Continue]
        goto J0x42;
    }
    return true;
    //return;    
}

function bool rfAckPCBangUserListStart(int Result, int TotalCount)
{
    Log("[BTTcpHandler::rfAckPCBangUserListStart]");
    i = MainMenu.Pages.Length;
    J0x41:

    // End:0x89 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPCBangUserListStart(Result, TotalCount))
    {
        // [Loop Continue]
        goto J0x41;
    }
    return true;
    //return;    
}

function bool rfAckPCBangUserList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<byte> IsCombat, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    Log("[BTTcpHandler::rfAckPCBangUserList]");
    i = MainMenu.Pages.Length;
    J0x3C:

    // End:0xCF [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPCBangUserList(FriendName, ClanName, CM_Pattern, CM_BG, CM_BL, Level, ClanGrade, ClanWin, ClanLose, IsLookForClan, IsCombat, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool rfAckPCBangUserListEnd()
{
    Log("[BTTcpHandler::rfAckPCBangUserListEnd]");
    i = MainMenu.Pages.Length;
    J0x3F:

    // End:0x7D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPCBangUserListEnd())
    {
        // [Loop Continue]
        goto J0x3F;
    }
    return true;
    //return;    
}

function bool rfReqIsPaidWebzenPCBang(byte IsPaid)
{
    Log("[BTTcpHandler::rfReqIsPaidWebzenPCBang]");
    i = MainMenu.Pages.Length;
    J0x40:

    // End:0x83 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqIsPaidWebzenPCBang(IsPaid))
    {
        // [Loop Continue]
        goto J0x40;
    }
    return true;
    //return;    
}

function bool rfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckRegisterMainPCBang]");
    i = MainMenu.Pages.Length;
    J0x40:

    // End:0x88 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRegisterMainPCBang(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x40;
    }
    return true;
    //return;    
}

function bool rfAckRandomBox_Use(int Result, string ErrMsg, BtrDouble RandomBoxItemIdx, int RandomBxoItemCount, BtrDouble KeyItemIdx, int KeyItemRemainCount, array<int> ItemIDChoose, array<int> PartIDChoose, array<int> PeriodOnChoosenItem, array<int> StackCountOnChoosenItem, array<byte> bHave, array<BtrDouble> ItemIdx, array<BtrDouble> UntilTime, array<int> StackCount)
{
    Log("[BTTcpHandler::rfAckRandomBox_Use]");
    i = MainMenu.Pages.Length;
    J0x3B:

    // End:0xBF [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRandomBox_Use(Result, ErrMsg, RandomBoxItemIdx, RandomBxoItemCount, KeyItemIdx, KeyItemRemainCount, ItemIDChoose, PartIDChoose, PeriodOnChoosenItem, StackCountOnChoosenItem, bHave, ItemIdx, UntilTime, StackCount))
    {
        // [Loop Continue]
        goto J0x3B;
    }
    return true;
    //return;    
}

function bool rfAckWebzenBillingStorageListStart(int Result, string ErrMsg, int TotalCount, int TotalPage, int CurPage)
{
    Log("[BTTcpHandler::rfAckWebzenBillingStorageListStart]");
    i = MainMenu.Pages.Length;
    J0x4B:

    // End:0xA2 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckWebzenBillingStorageListStart(Result, ErrMsg, TotalCount, TotalPage, CurPage))
    {
        // [Loop Continue]
        goto J0x4B;
    }
    return true;
    //return;    
}

function bool rfAckWebzenBillingStorageList(array<int> Seq, array<int> ItemSeq, array<int> GroupCode, array<int> ShareFlag, array<int> ProductSeq, array<string> CashName, array<BtrDouble> CashPoint, array<string> SendAccountID, array<string> SendMessage, array<byte> ItemType, array<byte> RelationType, array<int> ProductType, array<int> PriceSeq)
{
    Log("[BTTcpHandler::rfAckWebzenBillingStorageList]");
    i = MainMenu.Pages.Length;
    J0x46:

    // End:0xC5 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckWebzenBillingStorageList(Seq, ItemSeq, GroupCode, ShareFlag, ProductSeq, CashName, CashPoint, SendAccountID, SendMessage, ItemType, RelationType, ProductType, PriceSeq))
    {
        // [Loop Continue]
        goto J0x46;
    }
    return true;
    //return;    
}

function bool rfAckWebzenBillingStorageListEnd()
{
    Log("[BTTcpHandler::rfAckWebzenBillingStorageListEnd]");
    i = MainMenu.Pages.Length;
    J0x49:

    // End:0x87 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckWebzenBillingStorageListEnd())
    {
        // [Loop Continue]
        goto J0x49;
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_EraseRecord(int Result, string ErrMsg, BtrDouble ItemIdx, int Command, int RemainCount)
{
    Log("[BTTcpHandler::rfAckPaidItem_EraseRecord]");
    i = MainMenu.Pages.Length;
    J0x42:

    // End:0x99 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPaidItem_EraseRecord(Result, ErrMsg, ItemIdx, Command, RemainCount))
    {
        // [Loop Continue]
        goto J0x42;
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_BroadCast(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTTcpHandler::rfAckPaidItem_BroadCast]");
    i = MainMenu.Pages.Length;
    J0x40:

    // End:0x92 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPaidItem_BroadCast(Result, ErrMsg, ItemIdx, StackCount))
    {
        // [Loop Continue]
        goto J0x40;
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    Log("[BTTcpHandler::rfAckPaidItem_RelayBroadcast]");
    i = MainMenu.Pages.Length;
    J0x45:

    // End:0x8D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPaidItem_RelayBroadcast(CharName, Msg))
    {
        // [Loop Continue]
        goto J0x45;
    }
    return true;
    //return;    
}

function bool rfAckWebzenBillingUseStorageItem(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID, BtrDouble ItemExtra)
{
    Log("[BTTcpHandler::rfAckWebzenBillingUseStorageItem]");
    i = MainMenu.Pages.Length;
    J0x49:

    // End:0xA0 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckWebzenBillingUseStorageItem(Result, ErrMsg, ItemIdx, ItemID, ItemExtra))
    {
        // [Loop Continue]
        goto J0x49;
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_ClanMarkDupCheck(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckPaidItem_ClanMarkDupCheck]");
    i = MainMenu.Pages.Length;
    J0x47:

    // End:0x8F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPaidItem_ClanMarkDupCheck(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x47;
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_ChangeClanMark(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTTcpHandler::rfAckPaidItem_ChangeClanMark]");
    i = MainMenu.Pages.Length;
    J0x45:

    // End:0x97 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPaidItem_ChangeClanMark(Result, ErrMsg, ItemIdx, StackCount))
    {
        // [Loop Continue]
        goto J0x45;
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_NotifyChangeClanMark(string ClanName, int Pattern, int BG, int BL)
{
    Log("[BTTcpHandler::rfAckPaidItem_NotifyChangeClanMark]");
    i = MainMenu.Pages.Length;
    J0x4B:

    // End:0x9D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPaidItem_NotifyChangeClanMark(ClanName, Pattern, BG, BL))
    {
        // [Loop Continue]
        goto J0x4B;
    }
    return true;
    //return;    
}

function bool rfAckQuestGetAvailableEventList(int Result, string ErrMsg, array<int> QuestID)
{
    Log("[BTTcpHandler::rfAckQuestGetAvailableEventList]");
    i = MainMenu.Pages.Length;
    J0x48:

    // End:0x95 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckQuestGetAvailableEventList(Result, ErrMsg, QuestID))
    {
        // [Loop Continue]
        goto J0x48;
    }
    return true;
    //return;    
}

function bool rfAckCharBlockInfo(int Result, BtrDouble ChatBlockStartTime, BtrDouble ChatBlockEndTime, array<BtrDouble> BlockedItemIdx)
{
    Log("[BTTcpHandler::rfAckCharBlockInfo]");
    i = MainMenu.Pages.Length;
    J0x3B:

    // End:0x8D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckCharBlockInfo(Result, ChatBlockStartTime, ChatBlockEndTime, BlockedItemIdx))
    {
        // [Loop Continue]
        goto J0x3B;
    }
    return true;
    //return;    
}

function bool rfReqExteriorRoomOwnerInfo(int RoomNum, string OwnerName, string OwnerIP)
{
    Log("[BTTcpHandler::rfAckCharBlockInfo]");
    i = MainMenu.Pages.Length;
    J0x3B:

    // End:0x88 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqExteriorRoomOwnerInfo(RoomNum, OwnerName, OwnerIP))
    {
        // [Loop Continue]
        goto J0x3B;
    }
    return true;
    //return;    
}

function bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, string NewRoomTitle)
{
    Log("[BTTcpHandler::rfAckChangeRoomTitle_GM]");
    i = MainMenu.Pages.Length;
    J0x40:

    // End:0x8D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChangeRoomTitle_GM(Result, RoomNumber, NewRoomTitle))
    {
        // [Loop Continue]
        goto J0x40;
    }
    return true;
    //return;    
}

function bool rfAckNotice_GM(int Result, string ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    Log("[BTTcpHandler::rfAckNotice_GM]");
    i = MainMenu.Pages.Length;
    J0x37:

    // End:0x98 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotice_GM(Result, ErrMsg, NoticeType, ServerID, ChannelNum, GameRoomNum, Msg))
    {
        // [Loop Continue]
        goto J0x37;
    }
    return true;
    //return;    
}

function bool rfAckForceDisconnectUser_GM(int Result, string ErrMsg, string CharName)
{
    Log("[BTTcpHandler::rfAckForceDisconnectUser_GM]");
    i = MainMenu.Pages.Length;
    J0x44:

    // End:0x91 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckForceDisconnectUser_GM(Result, ErrMsg, CharName))
    {
        // [Loop Continue]
        goto J0x44;
    }
    return true;
    //return;    
}

function bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    Log("[BTTcpHandler::rfAckGMEnterRoom]");
    i = MainMenu.Pages.Length;
    J0x39:

    // End:0x86 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGMEnterRoom(Result, RoomNumber, UserID))
    {
        // [Loop Continue]
        goto J0x39;
    }
    return true;
    //return;    
}

function bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    Log("[BTTcpHandler::rfAckGMLeaveRoom]");
    i = MainMenu.Pages.Length;
    J0x39:

    // End:0x86 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGMLeaveRoom(Result, RoomNumber, UserID))
    {
        // [Loop Continue]
        goto J0x39;
    }
    return true;
    //return;    
}

function bool rfAckRecvSystemMsg(byte CommunityType, SystemMsgParam MsgInfo)
{
    Log("[BTTcpHandler::rfAckRecvSystemMsg]");
    i = MainMenu.Pages.Length;
    J0x3B:

    // End:0x83 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRecvSystemMsg(CommunityType, MsgInfo))
    {
        // [Loop Continue]
        goto J0x3B;
    }
    return true;
    //return;    
}

function bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    Log("[BTTcpHandler::rfAckChange»dRoomTitle_FromGM]");
    i = MainMenu.Pages.Length;
    J0x46:

    // End:0x93 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckChangedRoomTitle_FromGM(Result, RoomNumber, NewRoomTitle))
    {
        // [Loop Continue]
        goto J0x46;
    }
    return true;
    //return;    
}

function bool rfAckSetLookForClan(int Result, string ErrMsg, byte IsLookingFor)
{
    Log("[BTTcpHandler::rfAckSetLookForClan]");
    i = MainMenu.Pages.Length;
    J0x3C:

    // End:0x89 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSetLookForClan(Result, ErrMsg, IsLookingFor))
    {
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool rfAckRoomUserPingInfo(array<int> UnqueID, array<int> Ping, int HostPriorityPoint)
{
    Log("[BTTcpHandler::sfAckRoomUserPingInfo]");
    i = MainMenu.Pages.Length;
    J0x3E:

    // End:0x8B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckRoomUserPingInfo(UnqueID, Ping, HostPriorityPoint))
    {
        // [Loop Continue]
        goto J0x3E;
    }
    return true;
    //return;    
}

function bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount)
{
    Log("[BTTcpHandler::rfAckGetMyMailBoxState]");
    i = MainMenu.Pages.Length;
    J0x3F:

    // End:0x8C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetMyMailBoxState(Result, IsFull, NewMailCount))
    {
        // [Loop Continue]
        goto J0x3F;
    }
    return true;
    //return;    
}

function bool rfAckNotifyStartTutorial(int Result, int UserID)
{
    Log("[BTTcpHandler::rfAckNotifyStartTutorial]");
    i = MainMenu.Pages.Length;
    J0x41:

    // End:0x89 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyStartTutorial(Result, UserID))
    {
        // [Loop Continue]
        goto J0x41;
    }
    return true;
    //return;    
}

function bool rfAckNotifyEndTutorial(int UserID, string CharName, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTTcpHandler::rfAckNotifyEndTutorial]");
    i = MainMenu.Pages.Length;
    J0x3F:

    // End:0xD7 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyEndTutorial(UserID, CharName, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // [Loop Continue]
        goto J0x3F;
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_ChangeCharname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewCharname)
{
    Log("[BTTcpHandler::rfAckPaidItem_ChangeCharname]");
    i = MainMenu.Pages.Length;
    J0x45:

    // End:0x9C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPaidItem_ChangeCharname(Result, ErrMsg, ItemIdx, RemainCount, NewCharname))
    {
        // [Loop Continue]
        goto J0x45;
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_ChangeClanname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewClanname)
{
    Log("[BTTcpHandler::rfAckPaidItem_ChangeClanname]");
    i = MainMenu.Pages.Length;
    J0x45:

    // End:0x9C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPaidItem_ChangeClanname(Result, ErrMsg, ItemIdx, RemainCount, NewClanname))
    {
        // [Loop Continue]
        goto J0x45;
    }
    return true;
    //return;    
}

function bool rfAckPaidItem_NotifyChangeClanname(string NewClanname)
{
    Log("[BTTcpHandler::rfAckPaidItem_ChangeClanname]");
    i = MainMenu.Pages.Length;
    J0x45:

    // End:0x88 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPaidItem_NotifyChangeClanname(NewClanname))
    {
        // [Loop Continue]
        goto J0x45;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_StartPublicWaitRoomList(int Result, string ErrMsg, int Count)
{
    Log("[BTTcpHandler::rfAckClanMatch_StartPublicWaitRoomList]");
    i = MainMenu.Pages.Length;
    J0x4F:

    // End:0x9C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_StartPublicWaitRoomList(Result, ErrMsg, Count))
    {
        // [Loop Continue]
        goto J0x4F;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_PublicWaitRoomList(array<int> WaitRoomIdx, array<string> LeaderName, array<string> RoomName, array<int> MapNum, array<int> CurUserCount, array<int> MaxUserCount, array<byte> Status)
{
    Log("[BTTcpHandler::rfAckClanMatch_PublicWaitRoomList]");
    i = MainMenu.Pages.Length;
    J0x4A:

    // End:0xAB [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_PublicWaitRoomList(WaitRoomIdx, LeaderName, RoomName, MapNum, CurUserCount, MaxUserCount, Status))
    {
        // [Loop Continue]
        goto J0x4A;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_EndPublicWaitRoomList()
{
    Log("[BTTcpHandler::rfAckClanMatch_EndPublicWaitRoomList]");
    i = MainMenu.Pages.Length;
    J0x4D:

    // End:0x8B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_EndPublicWaitRoomList())
    {
        // [Loop Continue]
        goto J0x4D;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, string RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic)
{
    Log("[BTTcpHandler::rfAckClanMatch_PublicWaitRoomChanged]");
    i = MainMenu.Pages.Length;
    J0x4D:

    // End:0xAE [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_PublicWaitRoomChanged(WaitRoomIdx, RoomName, MapNum, CurUserCount, MaxUserCount, Status, IsPublic))
    {
        // [Loop Continue]
        goto J0x4D;
    }
    return true;
    //return;    
}

function bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    Log("[BTTcpHandler::rfAckClanMatch_ChangeRoomSetting]");
    i = MainMenu.Pages.Length;
    J0x49:

    // End:0xA5 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatch_ChangeRoomSetting(WaitRoomIndex, Result, ErrMsg, MapNumArray, VersusMode, IsPublic))
    {
        // [Loop Continue]
        goto J0x49;
    }
    return true;
    //return;    
}

function bool rfAckServerType(byte Type)
{
    Log("[BTTcpHandler::rfAckServerType]");
    i = MainMenu.Pages.Length;
    J0x38:

    // End:0x7B [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckServerType(Type))
    {
        // [Loop Continue]
        goto J0x38;
    }
    return true;
    //return;    
}

function bool rfReqInGameRoomUserInfoChanged()
{
    Log("[BTTcpHandler::rfReqInGameRoomUserInfoChanged]");
    i = MainMenu.Pages.Length;
    J0x47:

    // End:0x85 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqInGameRoomUserInfoChanged())
    {
        // [Loop Continue]
        goto J0x47;
    }
    return true;
    //return;    
}

function bool rfAckClanMatchResultHistory(array<BtrDouble> MatchDate, array<byte> IsWin, array<string> EnemyClanname)
{
    Log("[BTTcpHandler::rfAckClanMatchResultHistory]");
    i = MainMenu.Pages.Length;
    J0x44:

    // End:0x91 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckClanMatchResultHistory(MatchDate, IsWin, EnemyClanname))
    {
        // [Loop Continue]
        goto J0x44;
    }
    return true;
    //return;    
}

function bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel)
{
    Log("[BTTcpHandler::rfReqInGameRoomUserClanLevelChanged]");
    i = MainMenu.Pages.Length;
    J0x4C:

    // End:0x94 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqInGameRoomUserClanLevelChanged(UserID, ClanLevel))
    {
        // [Loop Continue]
        goto J0x4C;
    }
    return true;
    //return;    
}

function bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    Log("[BTTcpHandler::rfAckCharDetailInfo]");
    i = MainMenu.Pages.Length;
    J0x3C:

    // End:0x11F [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckCharDetailInfo(MaxSerial, MaxScore, MaxKill, MaxAssist, Serial3, Serial5, Serial7, Serial10, Serial15, AR, SMG, SR, SW, Melee, Grenade, FlashBang, Foot, AT4, MG, Fire, RPG7, TimeBomb, IcendiaryBomb, ClusterBomb, ByChopper, Artillery, KillChopper, FirstKill, LastKill, AllKill, Dominate, InstallBomb, DefuseBomb))
    {
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount)
{
    Log("[BTTcpHandler::rfAckGetRankingInfoListStart]");
    i = MainMenu.Pages.Length;
    J0x45:

    // End:0x97 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetRankingInfoListStart(Result, RankingType, CommunityType, TotalCount))
    {
        // [Loop Continue]
        goto J0x45;
    }
    return true;
    //return;    
}

function bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    Log("[BTTcpHandler::rfAckGetRankingInfoList]");
    i = MainMenu.Pages.Length;
    J0x40:

    // End:0xD3 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetRankingInfoList(Result, RankingType, CommunityType, CharName, CharLevel, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, Ranking_Accum, Ranking_Accum_Prev, Ranking_Accum_Exp, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // [Loop Continue]
        goto J0x40;
    }
    return true;
    //return;    
}

function bool rfAckGetRankingInfoListEnd()
{
    Log("[BTTcpHandler::rfAckGetRankingInfoListEnd]");
    i = MainMenu.Pages.Length;
    J0x43:

    // End:0x81 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckGetRankingInfoListEnd())
    {
        // [Loop Continue]
        goto J0x43;
    }
    return true;
    //return;    
}

function bool rfAckNotifyUpdateCharInfo_LevelMark(string CharName, int LevelMarkID)
{
    Log("[BTTcpHandler::rfAckNotifyUpdateCharInfo_LevelMark]");
    i = MainMenu.Pages.Length;
    J0x4C:

    // End:0x94 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckNotifyUpdateCharInfo_LevelMark(CharName, LevelMarkID))
    {
        // [Loop Continue]
        goto J0x4C;
    }
    return true;
    //return;    
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    Log("[BTTcpHandler::rfAckLogOut]");
    i = MainMenu.Pages.Length;
    J0x34:

    // End:0x7C [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckLogOut(Result, Reason))
    {
        // [Loop Continue]
        goto J0x34;
    }
    return true;
    //return;    
}

function bool rfAckFriendPosition(int Result, string TargetCharName, byte ServerType, string fServername, string fServerShortName, string fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, string ChannelNickName, int GameRoomNum)
{
    Log("[BTTcpHandler::rfAckFriendPosition]");
    i = MainMenu.Pages.Length;
    J0x3C:

    // End:0xB6 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckFriendPosition(Result, TargetCharName, ServerType, fServername, fServerShortName, fServerIP, fServerPort, CurPos, CurState, ChannelNum, ChannelNickName, GameRoomNum))
    {
        // [Loop Continue]
        goto J0x3C;
    }
    return true;
    //return;    
}

function bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log((((("[BTTcpHandlerMed::rfUpdateWebzenShopScriptVersion] Year=" $ string(Year)) $ " YearId=") $ string(YearId)) $ " SalesZoneCode=") $ string(SalesZoneCode));
    i = MainMenu.Pages.Length;
    J0x8B:

    // End:0xD8 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfUpdateWebzenShopScriptVersion(Year, YearId, SalesZoneCode))
    {
        // [Loop Continue]
        goto J0x8B;
    }
    return true;
    //return;    
}

function bool rfAckPopUpMessage(int MessageType)
{
    Log("[BTTcpHandler::rfAckPopUpMessage(] MessageType=" $ string(MessageType));
    i = MainMenu.Pages.Length;
    J0x51:

    // End:0x94 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckPopUpMessage(MessageType))
    {
        // [Loop Continue]
        goto J0x51;
    }
    return false;
    //return;    
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTTcpHandler::rfAckMoveToLobby(] MessageType=" $ string(MessageType));
    i = MainMenu.Pages.Length;
    J0x50:

    // End:0x93 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckMoveToLobby(MessageType))
    {
        // [Loop Continue]
        goto J0x50;
    }
    return true;
    //return;    
}

function bool rfAckTencent_StartTenProtect(int CharDBID)
{
    Log("[BTTcpHandler::rfAckTencent_StartTenProtect()] CharDBID=" $ string(CharDBID));
    i = MainMenu.Pages.Length;
    J0x5A:

    // End:0x9D [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckTencent_StartTenProtect(CharDBID))
    {
        // [Loop Continue]
        goto J0x5A;
    }
    return false;
    //return;    
}

function bool rfNotifyNewNickName(int Community_Type, string Old_NickName, string New_NickName)
{
    Log("[BTTcpHandler::rfNotifyNewNickName()] Community_Type=" $ string(Community_Type));
    i = MainMenu.Pages.Length;
    J0x57:

    // End:0xA4 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfNotifyNewNickName(Community_Type, Old_NickName, New_NickName))
    {
        // [Loop Continue]
        goto J0x57;
    }
    return false;
    //return;    
}

function bool rfNotifyNewClanName(string New_NickName)
{
    Log("[BTTcpHandler::rfNotifyNewNickName()] New_NickName=" $ New_NickName);
    i = MainMenu.Pages.Length;
    J0x53:

    // End:0x96 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfNotifyNewClanName(New_NickName))
    {
        // [Loop Continue]
        goto J0x53;
    }
    return false;
    //return;    
}

function bool rfNotifyClanLevelup(string ClanName, int Levelup)
{
    Log((("[BTTcpHandler::rfNotifyClanLevelup()] ClanName=" $ ClanName) $ " Level=") $ string(Levelup));
    i = MainMenu.Pages.Length;
    J0x63:

    // End:0xAB [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfNotifyClanLevelup(ClanName, Levelup))
    {
        // [Loop Continue]
        goto J0x63;
    }
    return false;
    //return;    
}

function bool rfAckShopItemData()
{
    Log("[BTTcpHandler::rfAckShopItemData()]");
    i = MainMenu.Pages.Length;
    J0x3C:

    // End:0x7A [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckShopItemData())
    {
        // [Loop Continue]
        goto J0x3C;
    }
    return false;
    //return;    
}

function bool rfReqNotifyShopItemData(array<int> ProductNo, array<string> ProductName, array<int> ProductCode, array<byte> SaleType, array<int> ProductCost, array<int> ProductHour, array<int> ProductQuantity, array<int> SaleMasterFlag, array<int> SaleStatus, array<int> IsGift, array<BtrDouble> SaleEndTime, array<int> Discountcost)
{
    Log("[BTTcpHandler::rfReqNotifyShopItemData]");
    i = MainMenu.Pages.Length;
    J0x40:

    // End:0xBA [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqNotifyShopItemData(ProductNo, ProductName, ProductCode, SaleType, ProductCost, ProductHour, ProductQuantity, SaleMasterFlag, SaleStatus, IsGift, SaleEndTime, Discountcost))
    {
        // [Loop Continue]
        goto J0x40;
    }
    return true;
    //return;    
}

function bool rfReqNotifyShopPackageItemData(int PackageProductNo, array<int> ProductCode, array<int> ProductQuantity, array<int> ProductHour, string Description)
{
    Log("[BTTcpHandler::rfReqNotifyShopPackageItemData]");
    i = MainMenu.Pages.Length;
    J0x47:

    // End:0x9E [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqNotifyShopPackageItemData(PackageProductNo, ProductCode, ProductQuantity, ProductHour, Description))
    {
        // [Loop Continue]
        goto J0x47;
    }
    return true;
    //return;    
}

function bool rfAckCouponUse(int Result, string ErrMsg)
{
    Log(("[BTTcpHandler::rfAckCouponUse(" $ string(Result)) $ ")]");
    i = MainMenu.Pages.Length;
    J0x46:

    // End:0x8E [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckCouponUse(Result, ErrMsg))
    {
        // [Loop Continue]
        goto J0x46;
    }
    return true;
    //return;    
}

function bool rfReqNotifyShopItemDataEnd(int Ver)
{
    Log(("[BTTcpHandler::rfReqNotifyShopItemDataEnd(" $ string(Ver)) $ ")]");
    i = MainMenu.Pages.Length;
    J0x52:

    // End:0x95 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfReqNotifyShopItemDataEnd(Ver))
    {
        // [Loop Continue]
        goto J0x52;
    }
    return true;
    //return;    
}

function bool rfNotifyCouponUseError(int Time)
{
    Log(("[BTTcpHandler::rfNotifyCouponUseError(" $ string(Time)) $ ")]");
    i = MainMenu.Pages.Length;
    J0x4E:

    // End:0x91 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfNotifyCouponUseError(Time))
    {
        // [Loop Continue]
        goto J0x4E;
    }
    return true;
    //return;    
}

function bool rfAckLuckShop_LotteryWinnerList(int CapsuleItemID, byte IsNotification, array<string> NickName, array<BtrDouble> Time, int GetItemID)
{
    Log(("[BTTcpHandler::rfAckLuckShop_LotteryWinnerList(" $ string(CapsuleItemID)) $ ")]");
    i = MainMenu.Pages.Length;
    J0x57:

    // End:0xAE [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckLuckShop_LotteryWinnerList(CapsuleItemID, IsNotification, NickName, Time, GetItemID))
    {
        // [Loop Continue]
        goto J0x57;
    }
    return true;
    //return;    
}

event bool rfAckLuckShop_StorageInfo(int ErrorCode, int BuyingCapsuleCount, int CapsuleRewardState)
{
    Log(((((("[BTTcpHandler::rfAckLuckShop_StorageInfo(" $ string(ErrorCode)) $ ", ") $ string(BuyingCapsuleCount)) $ ", ") $ string(CapsuleRewardState)) $ ")]");
    i = MainMenu.Pages.Length;
    J0x6F:

    // End:0xBC [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckLuckShop_StorageInfo(ErrorCode, BuyingCapsuleCount, CapsuleRewardState))
    {
        // [Loop Continue]
        goto J0x6F;
    }
    return true;
    //return;    
}

event bool rfAckLuckShop_RewardBuyingCount(int ErrorCode, int FinalCapsuleRewardState)
{
    Log(((("[BTTcpHandler::rfAckLuckShop_RewardBuyingCount(" $ string(ErrorCode)) $ ", ") $ string(FinalCapsuleRewardState)) $ ")]");
    i = MainMenu.Pages.Length;
    J0x66:

    // End:0xAE [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckLuckShop_RewardBuyingCount(ErrorCode, FinalCapsuleRewardState))
    {
        // [Loop Continue]
        goto J0x66;
    }
    return true;
    //return;    
}

event bool rfAckLuckShop_RewardCoupon(int ErrorCode, int Coupon_ItemTypeID, BtrDouble Coupon_ItemUniqueID, int Coupon_Count_AfterReduction)
{
    Log(((((("[BTTcpHandler::rfAckLuckShop_RewardCoupon(" $ string(ErrorCode)) $ ", ") $ string(Coupon_ItemTypeID)) $ ", ") $ string(Coupon_Count_AfterReduction)) $ ")]");
    i = MainMenu.Pages.Length;
    J0x70:

    // End:0xC2 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckLuckShop_RewardCoupon(ErrorCode, Coupon_ItemTypeID, Coupon_ItemUniqueID, Coupon_Count_AfterReduction))
    {
        // [Loop Continue]
        goto J0x70;
    }
    return true;
    //return;    
}

event bool rfChangeItemInstanceInfo(int ErrorCode, int ItemID, BtrDouble ItemUniqueID, byte ChangeCount, int RemainCount)
{
    Log(((((("[BTTcpHandler::rfChangeItemInstanceInfo(" $ string(ErrorCode)) $ ", ") $ string(ItemID)) $ ", ") $ string(RemainCount)) $ ")]");
    i = MainMenu.Pages.Length;
    J0x6E:

    // End:0xC5 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfChangeItemInstanceInfo(ErrorCode, ItemID, ItemUniqueID, ChangeCount, RemainCount))
    {
        // [Loop Continue]
        goto J0x6E;
    }
    return true;
    //return;    
}

function bool rfAckCommunityOptionList(int Opt_Wispher, int Opt_GameInvite, int Opt_FriendInvite, int Opt_ClanInvite)
{
    Log("[BTTcpHandler::rfAckCommunityOptionList]");
    i = MainMenu.Pages.Length;
    J0x41:

    // End:0x93 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckCommunityOptionList(Opt_Wispher, Opt_GameInvite, Opt_FriendInvite, Opt_ClanInvite))
    {
        // [Loop Continue]
        goto J0x41;
    }
    return true;
    //return;    
}

function bool rfAckSetCommunityOption(int Result, string ErrStr)
{
    Log("[BTTcpHandler::rfAckSetCommunityOption]");
    i = MainMenu.Pages.Length;
    J0x40:

    // End:0x88 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckSetCommunityOption(Result, ErrStr))
    {
        // [Loop Continue]
        goto J0x40;
    }
    return true;
    //return;    
}

function bool rfReqAhnHsObject(array<byte> Data, int DataSize)
{
    local array<byte> ResultData;

    Log((("[BTTcpHandler::rfReqAhnHsObject] DataSize- " $ string(DataSize)) $ " ") $ string(Data.Length));
    MM.MakeHSResponseData(Data, ResultData);
    // End:0x8E
    if(ResultData.Length == 0)
    {
        __NFUN_270__("FAIELD: HShield Data length 0");
    }
    Log("[BTTcpHandler::sfAckAhnHsObject]");
    RealOne.sfAckAhnHsObject(ResultData, ResultData.Length);
    return true;
    //return;    
}

function bool rfReqAhnNotifyDisconnct(int Code)
{
    __NFUN_270__("FAILED HShield Code- " $ string(Code));
    RealOne.sfReqLogOut(5);
    MainMenu.Controller.ConsoleCommand("exit");
    return true;
    //return;    
}

event bool rfAckUseItemDuringGame(int ErrorCode, string CharName, int ItemID, BtrDouble ItemUniqueID, int RemainCount)
{
    Log(((((((("[BTTcpHandler::rfAckUseItemDuringGame] ErrorCode:" $ string(ErrorCode)) $ " / CharName :") $ CharName) $ " /ItemID:") $ string(ItemID)) $ "/ItemUniqueID:") $ "/RemainCount:") $ string(RemainCount));
    i = MainMenu.Pages.Length;
    J0xAD:

    // End:0x104 [Loop If]
    if((i > 0) && !MainMenu.Pages[--i].TcpChannel.rfAckUseItemDuringGame(ErrorCode, CharName, ItemID, ItemUniqueID, RemainCount))
    {
        // [Loop Continue]
        goto J0xAD;
    }
    return true;
    //return;    
}

function bool rfAckCharDetailInfoWithClan(int ErrorCode, string CharName, int Exp, int Level, int LevelMarkID, int PreMonthlyRanking, int MonthlyRanking, int Win, int Lose, int Kill, int Death, int Assist, int KillCountByAimShooting, int HeadShot2, int TotPlayTime, int DisCon, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, int DispHeadItem, int DispFaceItem, int DispBackpack, int DispPouch, int DispCamouflage, string ClanName, int ClanLevel, int CM_Pattern, int CM_BG, int CM_BL, int ClanExp, byte ClanGrade, int ClanActivity, int MonthlyConnectingCount, int UserClanWin, int UserClanLose, int UserClanDraw, int ClanWin, int ClanLose, int ClanDraw, int PreClanTotalRankCur, int ClanTotalRankCur, int PreClanMonthlyRankCur, int ClanMonthlyRankCur, int PreClanMonthlyConnectingRank, int ClanMonthlyConnectingRank, string ClanIntro)
{
    // End:0x211
    if(ErrorCode == 0)
    {
        MainMenu.Controller.OpenMenu("GUIWarfareControls.BTWindowUserDetailInfoHK");
        BTWindowUserDetailInfoHK(MainMenu.Controller.TopPage()).SetModelData(MainWeaponItemID, MainWeaponPartID, DispHeadItem, DispFaceItem, DispBackpack, DispPouch, DispCamouflage, AFSpecialCostumeItemID, RSASpecialCostumeItemID);
        BTWindowUserDetailInfoHK(MainMenu.Controller.TopPage()).UserDetailInfoNew.SetUserData(CharName, Exp, Level, LevelMarkID, PreMonthlyRanking, MonthlyRanking, Win, Lose, Kill, Death, Assist, KillCountByAimShooting, HeadShot2, TotPlayTime, DisCon, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID);
        BTWindowUserDetailInfoHK(MainMenu.Controller.TopPage()).UserClanInfo.SetClanData(ClanName, ClanLevel, CM_Pattern, CM_BG, CM_BL, ClanExp, ClanGrade, ClanActivity, MonthlyConnectingCount, UserClanWin, UserClanLose, UserClanDraw, ClanWin, ClanLose, ClanDraw, PreClanTotalRankCur, ClanTotalRankCur, PreClanMonthlyRankCur, ClanMonthlyRankCur, PreClanMonthlyConnectingRank, ClanMonthlyConnectingRank, ClanIntro);
        BTWindowUserDetailInfoHK(MainMenu.Controller.TopPage()).TabControl.SetVisiblePanel(int(MainMenu.UserInfoWindowShowTab));
    }
    return true;
    //return;    
}

defaultproperties
{
    DisconnectedFromServerMsg="???????????????????????????"
    DisconnectedFromServerQuit="???"
}