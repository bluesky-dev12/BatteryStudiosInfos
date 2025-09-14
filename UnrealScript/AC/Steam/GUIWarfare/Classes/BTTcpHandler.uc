/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTTcpHandler.uc
 * Package Imports:
 *	GUIWarfare
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:510
 *
 *******************************************************************************/
class BTTcpHandler extends BTTcpLink_Channel
    dependson(BTTcpHandlerMed)
    dependson(BTPageServerSelection);

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
}

function bool Connect(string sIpaddr, int nPort)
{
    return RealOne.Connect(sIpaddr, nPort);
}

function bool Close()
{
    return RealOne.Close();
}

event Created()
{
    super(Object).Created();
    RealOne = new class'BTTcpHandlerMed';
    RealOne.Owner = self;
}

function OnConnect(int ErrCode)
{
    UnresolvedNativeFunction_97("[BTTcpHandler::OnConnect] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandler::OnConnect] ErrCode=" $ string(ErrCode));
    super.OnConnect(ErrCode);
    MainMenu.rMM.bHasChannelTCP = true;
    MainMenu.bConnectedChannelServer = true;
    // End:0xc6
    if(MainMenu.page_ServerSelection != none)
    {
        MainMenu.page_ServerSelection.TcpChannel_OnConnect(ErrCode);
    }
}

function OnClose(int ErrCode)
{
    UnresolvedNativeFunction_97("[BTTcpHandler::OnClose] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandler::OnClose] ErrCode=" $ string(ErrCode));
    super.OnClose(ErrCode);
    MainMenu.rMM.bHasChannelTCP = false;
    MainMenu.bConnectedChannelServer = false;
    // End:0xc2
    if(MainMenu.page_ServerSelection != none)
    {
        MainMenu.page_ServerSelection.TcpChannel_OnClose(ErrCode);
    }
}

function OnError(int ErrCode)
{
    UnresolvedNativeFunction_97("[BTTcpHandler::OnError] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandler::OnError] ErrCode=" $ string(ErrCode));
    super.OnError(ErrCode);
    MainMenu.rMM.bHasChannelTCP = false;
    MainMenu.bConnectedChannelServer = false;
    // End:0xc2
    if(MainMenu.page_ServerSelection != none)
    {
        MainMenu.page_ServerSelection.TcpChannel_OnError(ErrCode);
    }
}

function OnReqSuccessStartGame(int Step)
{
    Log("[BTTcpHandler::OnReqSuccessStartGame] step=" $ string(Step) $ " bTutorial=" $ string(bTutorial));
    // End:0x7d
    if(bTutorial)
    {
        rfAckSuccessStartGame(0, "", 1, "127.0.0.1", 7777, Step);
    }
    // End:0x88
    else
    {
        sfReqSuccessStartGame(Step);
    }
}

function BeginTutorial(string MapName)
{
    local wMatchUserInfo UserInfo;

    Log("[BTTcpHandler::BeginTutorial]");
    SetupTutorialRoomInfo(MapName);
    MM.UserInfos.Length = 0;
    UserInfo = new class'wMatchUserInfo';
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
    MM.UserInfos[0].IsLookingFor = MM.kClanIsRecruit;
    RealOne.sfReqMyEquipedItemList();
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
}

function OnPageRoomLobbyInited()
{
    local int iResultTutorial;

    Log("[BTTcpHandler::OnPageRoomLobbyInited] bTutorial=" $ string(bTutorial));
    // End:0x1fb
    if(bTutorial)
    {
        // End:0xdf
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
        // End:0x1fb
        else
        {
            MainMenu.InTutorial = false;
            rfAckLeaveRoom(TutorialRoomInfo.RoomNumber, MM.kUID, MM.kUserName, 0, "");
            // End:0x16e
            if(MM.kFirstTutorial == true)
            {
                // End:0x153
                if(MM.bCompletedBotTutorial == true)
                {
                    iResultTutorial = 0;
                }
                // End:0x15a
                else
                {
                    iResultTutorial = 1;
                }
                MM.kFirstTutorial = false;
            }
            // End:0x196
            else
            {
                // End:0x18e
                if(MM.bCompletedBotTutorial == true)
                {
                    iResultTutorial = 2;
                }
                // End:0x196
                else
                {
                    iResultTutorial = 3;
                }
            }
            MM.bCompletedBotTutorial = false;
            Log("[BTTcpHandler::NotifyEndTutorial] Result = " $ string(iResultTutorial));
            RealOne.sfReqNotifyEndTutorial(iResultTutorial);
            bTutorial = false;
        }
    }
}

function endTutorial()
{
    Log("[BTTcpHandler::EndTutorial]");
    rfAckDisconnectGame(0, MM.kUID, MM.kUserName);
}

function bool rfAckMyEquipedItemList(array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<int> PaintID, array<BtrDouble> UniqueID, int Result)
{
    local int lp1, idx;
    local EquippedItemInfo ItemInfo;

    Log("[BTTcpHandler::rfAckMyEquipedItemList]");
    lp1 = 0;
    J0x31:
    // End:0x1e2 [While If]
    if(lp1 < ItemIDs.Length)
    {
        idx = MM.UserInfos[0].EquippedItems.Length;
        MM.UserInfos[0].EquippedItems[idx] = ItemInfo;
        MM.UserInfos[0].EquippedItems[idx].ItemID = ItemIDs[lp1];
        MM.UserInfos[0].EquippedItems[idx].SlotPosition = SlotPositions[lp1];
        MM.UserInfos[0].EquippedItems[idx].AddPartID = AddPartsID[lp1];
        MM.UserInfos[0].EquippedItems[idx].UniqueID = UniqueID[lp1];
        MM.UserInfos[0].EquippedItems[idx].Painting_Item_ID = GameMgr.GetPaintingItemIDbyPaintingID(PaintID[lp1]);
        Log("[BTTcpHandler::rfAckMyEquipedItemList] " $ string(MM.UserInfos[0].EquippedItems[idx].ItemID));
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
    RealOne.sfReqMyEquipedSkillList();
    return true;
}

function bool rfAckMyEquipedSkillList(array<int> SkillIDs, array<int> SlotPositions, int Result)
{
    local int lp1, idx;
    local EquippedSkillInfo SkillInfo;

    Log("[BTTcpHandler::rfAckMyEquipedSkillList]");
    // End:0xff
    if(Result == 0)
    {
        lp1 = 0;
        J0x3d:
        // End:0xfc [While If]
        if(lp1 < SkillIDs.Length)
        {
            idx = MM.UserInfos[0].EquippedSkills.Length;
            MM.UserInfos[0].EquippedSkills[idx] = SkillInfo;
            MM.UserInfos[0].EquippedSkills[idx].SkillID = SkillIDs[lp1];
            MM.UserInfos[0].EquippedSkills[idx].SlotPosition = SlotPositions[lp1];
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x3d;
        }
    }
    // End:0x10e
    else
    {
        // End:0x10e
        if(Result == 113)
        {
        }
        // End:0x10e
        else
        {
        }
    }
    RealOne.sfReqMyEquipedQSlotList();
    return true;
}

function bool rfAckMyEquipedQSlotList(array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<BtrDouble> PistolUniqueID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<BtrDouble> TW1UniqueID, array<int> TWItemID1, array<BtrDouble> TW2UniqueID, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID, int Result)
{
    local int lp1, idx;
    local EquippedQSlotInfo tmSlot;

    Log("[BTTcpHandler::rfAckEntryQSlotIDList]");
    lp1 = 0;
    J0x30:
    // End:0x35b [While If]
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
        ++ lp1;
        // This is an implied JumpToken; Continue!
        goto J0x30;
    }
    BeginTutorialCreateRoom();
    return true;
}

function bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3)
{
    return RealOne.sfReqHash(HashField0, HashField1, HashField2, HashField3);
}

function bool sfReqLogin(string id)
{
    return RealOne.sfReqLogin(id);
}

function bool sfReqForceLogoutByOwner()
{
    return RealOne.sfReqForceLogoutByOwner();
}

function bool sfReqStartNatDiag(string Server1Addr, int Server1Port, string Server2Addr, int Server2Port)
{
    return RealOne.sfReqStartNatDiag(Server1Addr, Server1Port, Server2Addr, Server2Port);
}

function bool sfReqLogin2(string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, string Guid, int UserType)
{
    return RealOne.sfReqLogin2(CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, Guid, UserType);
}

function bool sfReqCharInfo()
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x1c
    else
    {
        return RealOne.sfReqCharInfo();
    }
}

function bool sfReqFriendList()
{
    return RealOne.sfReqFriendList();
}

function bool sfReqChannelList(int bChannelType)
{
    return RealOne.sfReqChannelList(bChannelType);
}

function bool sfReqEnterChannel(int id)
{
    Log("[BTTcpHandler::sfReqEnterChannel] ID=" $ string(id));
    return RealOne.sfReqEnterChannel(id);
}

function bool sfReqLeaveChannel(int id)
{
    // End:0x5b
    if(bTutorial && !MainMenu.EnterBotMode && !MainMenu.CreateBotMode)
    {
        rfAckLeaveChannel(0, MM.kUserName, MM.kUID);
    }
    // End:0xad
    else
    {
        MainMenu.Controller.ViewportOwner.Actor.clog("sfReqLeaveChannel");
        return RealOne.sfReqLeaveChannel(id);
    }
}

function bool sfReqChannelUserList(int id, int StartIndex, int Count)
{
    return RealOne.sfReqChannelUserList(id, StartIndex, Count);
}

function bool sfReqRoomList(int id, int StartIndex, int Count)
{
    return RealOne.sfReqRoomList(id, StartIndex, Count);
}

function bool sfReqEnterRoom(int GameNum, string Password, byte RoomEnterType)
{
    // End:0x5d
    if(bTutorial)
    {
        rfAckEnterRoom(9999, MM.kUID, MM.kUID, MM.kUserName, 0, 0, "127.0.01", "", 0, 0, 0, 0, 0, "", 0, 0, 0, 0, 0, 0);
    }
    // End:0x7c
    else
    {
        return RealOne.sfReqEnterRoom(GameNum, Password, RoomEnterType);
    }
}

function bool sfReqRoomUserList(int GameNum)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x21
    else
    {
        return RealOne.sfReqRoomUserList(GameNum);
    }
}

function bool sfReqLeaveRoom(int Num)
{
    return RealOne.sfReqLeaveRoom(Num);
}

function bool sfReqCreateGameRoom(GameRoomInfo NetRoomInfo)
{
    return RealOne.sfReqCreateGameRoom(NetRoomInfo);
}

function bool sfReqGameRoomInfo(int GameNum, int UID)
{
    Log("[BTTcpHandler::sfReqGameRoomInfo] bTutorial=" $ string(bTutorial));
    // End:0x46
    if(bTutorial)
    {
    }
    // End:0x60
    else
    {
        return RealOne.sfReqGameRoomInfo(GameNum, UID);
    }
}

function bool sfReqSelectMap(int GameNum, int UID, string MapName)
{
    return RealOne.sfReqSelectMap(GameNum, UID, MapName);
}

function bool sfReqBanUser(int GameNum, int UID, int BanUID)
{
    return RealOne.sfReqBanUser(GameNum, UID, BanUID);
}

function bool sfReqChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum)
{
    return RealOne.sfReqChangeGameMode(GameNum, UID, GameMode, GameModeNum);
}

function bool sfReqChangeRoomOwner(int GameNum, int UID, int NewOwner)
{
    return RealOne.sfReqChangeRoomOwner(GameNum, UID, NewOwner);
}

function bool sfReqChangeTeam(int TeamNum)
{
    return RealOne.sfReqChangeTeam(TeamNum);
}

function bool sfReqIsHostAvailable(string MyIp, int CPUGrade, int RamGrade, int VGAGrade, int VGARam)
{
    return RealOne.sfReqIsHostAvailable(MyIp, CPUGrade, RamGrade, VGAGrade, VGARam);
}

function bool sfReqGameHostInfo(int GameNumber)
{
    return RealOne.sfReqGameHostInfo(GameNumber);
}

function bool sfReqStartGame(int GameNumber)
{
    return RealOne.sfReqStartGame(GameNumber);
}

function bool sfReqUpdateScore(int GameNumber, array<int> UserIDs, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> Points, array<int> Scores, array<int> TeamScores, array<int> RoundJoin, array<int> TimeJoin, int Playtime, byte GameEndType, array<string> UserNames)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x62
    else
    {
        return RealOne.sfReqUpdateScore(GameNumber, UserIDs, Kills, Assists, Deaths, EXPs, Points, Scores, TeamScores, RoundJoin, TimeJoin, Playtime, GameEndType, UserNames);
    }
}

function bool sfReqChangeRoomMaxNum(int GameNum, int UID, int Number, int TeamNum)
{
    return RealOne.sfReqChangeRoomMaxNum(GameNum, UID, Number, TeamNum);
}

function bool sfReqIsGameRoomPlaying(int GameRoomNum)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x21
    else
    {
        return RealOne.sfReqIsGameRoomPlaying(GameRoomNum);
    }
}

function bool sfReqGameOver(int UID, int GameRoomNumber)
{
    // End:0x2d
    if(bTutorial)
    {
        rfAckGameOver(MM.kUID, TutorialRoomInfo.RoomNumber, 0, "");
    }
    // End:0x47
    else
    {
        return RealOne.sfReqGameOver(UID, GameRoomNumber);
    }
}

function bool sfReqRelayServerOn(string RelayServerIP, int RelayServerPortNum)
{
    return RealOne.sfReqRelayServerOn(RelayServerIP, RelayServerPortNum);
}

function bool sfReqRelayServerOff()
{
    return RealOne.sfReqRelayServerOff();
}

function bool sfReqConnectGame()
{
    return RealOne.sfReqConnectGame();
}

function bool sfReqDisconnectGame()
{
    // End:0x2f
    if(bTutorial)
    {
        rfAckDisconnectGame(0, MM.kUID, MM.kUserName);
    }
    // End:0x3f
    else
    {
        return RealOne.sfReqDisconnectGame();
    }
}

function bool sfReqNotifyClientJoinTime(int JoinedClientID)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x21
    else
    {
        return RealOne.sfReqNotifyClientJoinTime(JoinedClientID);
    }
}

function bool sfReqRegisterMyUdpInfo(byte IsHost, string IP, int Port, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    // End:0x15
    if(bTutorial)
    {
        rfAckRegisterMyUdpInfo(0, "");
    }
    // End:0x43
    else
    {
        return RealOne.sfReqRegisterMyUdpInfo(IsHost, IP, Port, Intervention, HostInnerIP, HostInnerPort);
    }
}

function bool sfReqClientUdpInfoList(int GameNum)
{
    return RealOne.sfReqClientUdpInfoList(GameNum);
}

function bool sfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    return RealOne.sfReqNotifyLevelUp(LevelUpUserID, Level, Exp, ItemID, PartID);
}

function bool sfReqChangeRoomSetting(GameRoomInfo RoomInfo)
{
    return RealOne.sfReqChangeRoomSetting(RoomInfo);
}

function bool sfReqSetUserBootySeedValue(int UserID, int SeedValue)
{
    return RealOne.sfReqSetUserBootySeedValue(UserID, SeedValue);
}

function bool sfReqGetBooty(int RoomNumber)
{
    local array<int> emptyArray;

    // End:0x24
    if(bTutorial)
    {
        rfAckGetBooty(0, "", emptyArray, emptyArray, emptyArray);
    }
    // End:0x39
    else
    {
        return RealOne.sfReqGetBooty(RoomNumber);
    }
}

function bool sfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    return RealOne.sfReqExteriorRoomInfo(SP, RoomNumber, IsPW, RoomName, MapName, ModeName, MapNum, ModeNum, IsTeamBalance, MaxUserCount, RoomUserCount, RoomState, BotDifficult, WeaponLimit, BotModeUserTeamNum);
}

function bool sfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount)
{
    return RealOne.sfReqExteriorRoomUserCount(RoomNumber, RoomUserCount);
}

function bool sfReqExteriorRoomState(int RoomNumber, byte RoomState)
{
    return RealOne.sfReqExteriorRoomState(RoomNumber, RoomState);
}

function bool sfReqChangeUserState(byte NewState, byte CheckPlaying)
{
    // End:0x22
    if(bTutorial && !MainMenu.EnterBotMode)
    {
    }
    // End:0x3c
    else
    {
        return RealOne.sfReqChangeUserState(NewState, CheckPlaying);
    }
}

function bool sfReqEntryItemList(int UserID)
{
    return RealOne.sfReqEntryItemList(UserID);
}

function bool sfReqEntrySkillList(int UserID)
{
    return RealOne.sfReqEntrySkillList(UserID);
}

function bool sfReqItemList(int UID)
{
    return RealOne.sfReqItemList(UID);
}

function bool sfReqEquipItem(int ItemID, BtrDouble UniqueID, int SlotPosition)
{
    return RealOne.sfReqEquipItem(ItemID, UniqueID, SlotPosition);
}

function bool sfReqConfirmItemChanged()
{
    return RealOne.sfReqConfirmItemChanged();
}

function bool sfReqDummy(int DelayCheck)
{
    return RealOne.sfReqDummy(DelayCheck);
}

function bool sfReqChatNormal(string Message)
{
    return RealOne.sfReqChatNormal(Message);
}

function bool sfReqSendFriendInvite(int InviteUserID, string InviteName, string InviteMsg)
{
    return RealOne.sfReqSendFriendInvite(InviteUserID, InviteName, InviteMsg);
}

function bool sfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    return RealOne.sfReqRecvFriendInvite(ReqUserID, ReqCharname, InviteMsg);
}

function bool sfReqConfirmFriendInvite(int ReqUserID, string ReqedCharname, byte IsPermit)
{
    return RealOne.sfReqConfirmFriendInvite(ReqUserID, ReqedCharname, IsPermit);
}

function bool sfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    return RealOne.sfReqCompleteFriendInvite(CharnameToBeInvited, IsPermit);
}

function bool sfReqBlockUserList()
{
    return RealOne.sfReqBlockUserList();
}

function bool sfReqAddBlockUserList(string CharName)
{
    return RealOne.sfReqAddBlockUserList(CharName);
}

function bool sfReqRemoveBlockUserList(string CharName)
{
    return RealOne.sfReqRemoveBlockUserList(CharName);
}

function bool sfReqChatWispher(string CharName, string Message)
{
    return RealOne.sfReqChatWispher(CharName, Message);
}

function bool sfReqRecvChatWispher(string CharnameFrom, string Message)
{
    return RealOne.sfReqRecvChatWispher(CharnameFrom, Message);
}

function bool sfReqSendMemo(array<string> cnames, string Msg, int ItemUID)
{
    return RealOne.sfReqSendMemo(cnames, Msg, ItemUID);
}

function bool sfReqRecvMemo(string cnameFrom, byte MemoType)
{
    return RealOne.sfReqRecvMemo(cnameFrom, MemoType);
}

function bool sfReqMemoList(byte Type, byte MemoType)
{
    return RealOne.sfReqMemoList(Type, MemoType);
}

function bool sfReqReadMemo(int MemoIdx)
{
    return RealOne.sfReqReadMemo(MemoIdx);
}

function bool sfReqDelMemo(array<int> MemoIdx, byte Type)
{
    return RealOne.sfReqDelMemo(MemoIdx, Type);
}

function bool sfReqUserSkillList(int UserID)
{
    return RealOne.sfReqUserSkillList(UserID);
}

function bool sfReqEquipSkill(int SkillID, int SkillUniqueID, byte NewSlotPosition)
{
    return RealOne.sfReqEquipSkill(SkillID, SkillUniqueID, NewSlotPosition);
}

function bool sfReqConfirmSkillChanged()
{
    return RealOne.sfReqConfirmSkillChanged();
}

function bool sfReqNotifyChangedItemState()
{
    return RealOne.sfReqNotifyChangedItemState();
}

function bool sfReqNotifyChangedSkillState()
{
    return RealOne.sfReqNotifyChangedSkillState();
}

function bool sfReqNotifyExpiredSkillIDs()
{
    return RealOne.sfReqNotifyExpiredSkillIDs();
}

function bool sfReqNotifyExpiredItemIDs()
{
    return RealOne.sfReqNotifyExpiredItemIDs();
}

function bool sfReqGiveSkill()
{
    return RealOne.sfReqGiveSkill();
}

function bool sfReqForceGameOver()
{
    return RealOne.sfReqForceGameOver();
}

function bool sfReqShopItemList()
{
    return RealOne.sfReqShopItemList();
}

function bool sfReqBuyShopItem(int ItemID, BtrDouble ItemUniqueID, byte BuyOption1, byte BuyOption2)
{
    return RealOne.sfReqBuyShopItem(ItemID, ItemUniqueID, BuyOption1, BuyOption2);
}

function bool sfReqSellShopItem(BtrDouble ItemUniqueID, int Count)
{
    return RealOne.sfReqSellShopItem(ItemUniqueID, Count);
}

function bool sfReqModifyWeapon(BtrDouble UniqueID, int AddPartID, int PaintID)
{
    return RealOne.sfReqModifyWeapon(UniqueID, AddPartID, PaintID);
}

function bool sfReqUpdateWeaponDurability(int TotalPlayTime, array<int> OwnerID, array<int> Number, array<BtrDouble> UniqueItemID, array<int> UsingSec, array<int> UsingRoundInSD)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x3a
    else
    {
        return RealOne.sfReqUpdateWeaponDurability(TotalPlayTime, OwnerID, Number, UniqueItemID, UsingSec, UsingRoundInSD);
    }
}

function bool sfReqRepairCost(array<BtrDouble> UniqueItemID)
{
    return RealOne.sfReqRepairCost(UniqueItemID);
}

function bool sfReqRepairItem(array<BtrDouble> UniqueItemcID)
{
    return RealOne.sfReqRepairItem(UniqueItemcID);
}

function bool sfReqQSlotList()
{
    return RealOne.sfReqQSlotList();
}

function bool sfReqUpdateQSlot(int QSlotID, string QSlotName, BtrDouble MWItemID, BtrDouble PistolItemID, BtrDouble TWItemID1, BtrDouble TWItemID2, int Skill1, int Skill2, int Skill3, int Skill4)
{
    return RealOne.sfReqUpdateQSlot(QSlotID, QSlotName, MWItemID, PistolItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4);
}

function bool sfReqMyMoney()
{
    return RealOne.sfReqMyMoney();
}

function bool sfReqAuctionMyItemRegister(BtrDouble UniqueID, int ItemCount, int BeginPrice, int PeriodHour, int InstantlyBuyingPrice)
{
    return RealOne.sfReqAuctionMyItemRegister(UniqueID, ItemCount, BeginPrice, PeriodHour, InstantlyBuyingPrice);
}

function bool sfReqAuctionMyItemCancel(int UniqueID)
{
    return RealOne.sfReqAuctionMyItemCancel(UniqueID);
}

function bool sfReqAuctionItemList(byte Section, string Keyword, int ItemRank, byte ItemClassfy, byte IsAvailable, int PageNum, int Count, int SortOpt)
{
    return RealOne.sfReqAuctionItemList(Section, Keyword, ItemRank, ItemClassfy, IsAvailable, PageNum, Count, SortOpt);
}

function bool sfReqAuctionInstantlyBuying(int UniqueID)
{
    return RealOne.sfReqAuctionInstantlyBuying(UniqueID);
}

function bool sfReqAuctionBidding(int UniqueID, int BiddingPrice)
{
    return RealOne.sfReqAuctionBidding(UniqueID, BiddingPrice);
}

function bool sfReqEntryQSlotUniqueIDList(int UserNum)
{
    return RealOne.sfReqEntryQSlotUniqueIDList(UserNum);
}

function bool sfReqEntryQSlotIDList(int UserNum)
{
    return RealOne.sfReqEntryQSlotIDList(UserNum);
}

function bool sfReqServerTime()
{
    return RealOne.sfReqServerTime();
}

function bool sfReqAuctionItemListCount(byte Section, byte Classfy, int ItemType, int ItemGrade)
{
    return RealOne.sfReqAuctionItemListCount(Section, Classfy, ItemType, ItemGrade);
}

function bool sfReqGameOverEnd()
{
    Log("[END] sfReqGameOverEnd bTutorial=" $ string(bTutorial));
    // End:0x44
    if(bTutorial)
    {
        rfAckGameOverEnd(0, "");
    }
    // End:0x54
    else
    {
        return RealOne.sfReqGameOverEnd();
    }
}

function bool sfReqSellShopItemInfo(BtrDouble UniqueItemID, int Count)
{
    return RealOne.sfReqSellShopItemInfo(UniqueItemID, Count);
}

function bool sfReqDupCheckClanName(string ClanNam)
{
    return RealOne.sfReqDupCheckClanName(ClanNam);
}

function bool sfReqCreateClan(string ClanName, string ClanURL, string ClanIntro, string ClanKeyword, byte ClanRegion)
{
    return RealOne.sfReqCreateClan(ClanName, ClanURL, ClanIntro, ClanKeyword, ClanRegion);
}

function bool sfReqClanInfo(string ClanName)
{
    return RealOne.sfReqClanInfo(ClanName);
}

function bool sfReqInviteClan(string CharName, string InviteMsg)
{
    return RealOne.sfReqInviteClan(CharName, InviteMsg);
}

function bool sfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    return RealOne.sfReqRecvClanInvite(InviterUserDBID, InviterCharname, ClanName, InviteMsg);
}

function bool sfReqJoinClan(string ClanName, string ClanManagerName, string Message)
{
    return RealOne.sfReqJoinClan(ClanName, ClanManagerName, Message);
}

function bool sfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    return RealOne.sfReqRecvJoinClan(UserIdx, CharName, Message);
}

function bool sfReqSerachClan(byte SearchType, string Keyword, byte ClanStatus, byte ClanRegion, int ReqPage)
{
    return RealOne.sfReqSerachClan(SearchType, Keyword, ClanStatus, ClanRegion, ReqPage);
}

function bool sfReqClanUserList(string ClanName)
{
    return RealOne.sfReqClanUserList(ClanName);
}

function bool sfReqAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    return RealOne.sfReqAdjustClanMemberGrade(ClanName, CharName, CharGrade);
}

function bool sfReqClanNews(string ClanName)
{
    return RealOne.sfReqClanNews(ClanName);
}

function bool sfReqClanSecession(string ClanName)
{
    return RealOne.sfReqClanSecession(ClanName);
}

function bool sfReqClanClose(string ClanName)
{
    return RealOne.sfReqClanClose(ClanName);
}

function bool sfReqClanChangeInfo(string ClanName, byte IsRecruit, byte Region, string Keyword, string ClanIntro, string Notice)
{
    return RealOne.sfReqClanChangeInfo(ClanName, IsRecruit, Region, Keyword, ClanIntro, Notice);
}

function bool sfReqClanPersonelIntro(string ClanName, string CharName, string PersonelIntro)
{
    return RealOne.sfReqClanPersonelIntro(ClanName, CharName, PersonelIntro);
}

function bool sfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    return RealOne.sfReqClanCharPersonelIntro(ClanName, CharName);
}

function bool sfReqSuccessStartGame(int LoadingStep)
{
    return RealOne.sfReqSuccessStartGame(LoadingStep);
}

function bool sfReqFailedStartGame(int LoadingStep)
{
    return RealOne.sfReqFailedStartGame(LoadingStep);
}

function bool sfReqNotifyLoadingState(byte LoadingState)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x21
    else
    {
        return RealOne.sfReqNotifyLoadingState(LoadingState);
    }
}

function bool sfReqTestDouble(BtrDouble vDouble, array<BtrDouble> vDoubles)
{
    return RealOne.sfReqTestDouble(vDouble, vDoubles);
}

function bool sfReqChatClan(string Message)
{
    return RealOne.sfReqChatClan(Message);
}

function bool sfReqGetAttachedItemFromMemo(int UserID, int MemoIdx, int ItemID)
{
    return RealOne.sfReqGetAttachedItemFromMemo(UserID, MemoIdx, ItemID);
}

function bool sfReqSendGift(int ItemID, string RecvCharname, string RecvMessage, byte BuyOption1, byte BuyOption2)
{
    return RealOne.sfReqSendGift(ItemID, RecvCharname, RecvMessage, BuyOption1, BuyOption2);
}

function bool sfReqAuctionTradeHistory(int ItemID, int PartID)
{
    return RealOne.sfReqAuctionTradeHistory(ItemID, PartID);
}

function bool sfReqLogGetScore(KillDeathLog KillDeathLogParam, array<int> AssistUIDs, array<byte> AssistScores)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x2b
    else
    {
        return RealOne.sfReqLogGetScore(KillDeathLogParam, AssistUIDs, AssistScores);
    }
}

function bool sfReqLogEndEachRound(int StartCnt, int EndCnt, int RoundEndType, int RoundEndTime, byte VTeam, byte VTeamAD, int AFScore, int RSAScore, int Round)
{
    return RealOne.sfReqLogEndEachRound(StartCnt, EndCnt, RoundEndType, RoundEndTime, VTeam, VTeamAD, AFScore, RSAScore, Round);
}

function bool sfReqGetServerTime()
{
    return RealOne.sfReqGetServerTime();
}

function bool sfReqForceNatTypeSetting(int NatType)
{
    return RealOne.sfReqForceNatTypeSetting(NatType);
}

function bool sfReqDBCharInfo(string CharName)
{
    return RealOne.sfReqDBCharInfo(CharName);
}

function bool sfReqGamePlay_InstallBomb(int InstallerUID, byte InstallPos, float InstallerXCoord, float InstallerYCoord, float InstallerZCoord, int InstallerPos, int InstallerWeaponID, int InstallerWeaponPartID, int InstallerRange)
{
    return RealOne.sfReqGamePlay_InstallBomb(InstallerUID, InstallPos, InstallerXCoord, InstallerYCoord, InstallerZCoord, InstallerPos, InstallerWeaponID, InstallerWeaponPartID, InstallerRange);
}

function bool sfReqGamePlay_DefuseBomb(int DefuserUID, byte DefusePos, float DefuserXCoord, float DefuserYCoord, float DefuserZCoord, int DefuserPos, int DefuserWeaponID, int DefuserWeaponPartID, int DefuserRange)
{
    return RealOne.sfReqGamePlay_DefuseBomb(DefuserUID, DefusePos, DefuserXCoord, DefuserYCoord, DefuserZCoord, DefuserPos, DefuserWeaponID, DefuserWeaponPartID, DefuserRange);
}

function bool sfReqNotifyChangeRoomState(byte RoomState)
{
    return RealOne.sfReqNotifyChangeRoomState(RoomState);
}

function bool sfReqGamePlay_TakeAPoint(array<int> TakerUID, byte TakePos, array<float> TakerXCoord, array<float> TakerYCoord, array<float> TakerZCoord, array<int> TakerPos, array<int> TakerWeaponID, array<int> TakerWeaponPartID, array<int> TakerRange)
{
    return RealOne.sfReqGamePlay_TakeAPoint(TakerUID, TakePos, TakerXCoord, TakerYCoord, TakerZCoord, TakerPos, TakerWeaponID, TakerWeaponPartID, TakerRange);
}

function bool sfReqForceDisconnectUDPFromHost(int UserID)
{
    return RealOne.sfReqForceDisconnectUDPFromHost(UserID);
}

function bool sfReqRecvForceDisconnectUDPFromHost(int Result)
{
    return RealOne.sfReqRecvForceDisconnectUDPFromHost(Result);
}

function bool sfReqGamePlay_SetGameStartTime(array<int> UID)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x21
    else
    {
        return RealOne.sfReqGamePlay_SetGameStartTime(UID);
    }
}

function bool sfReqGamePlay_SetRoundStartTime(array<int> UID)
{
    return RealOne.sfReqGamePlay_SetRoundStartTime(UID);
}

function bool sfReqWriteServerLog(byte Destination, string LogMsg)
{
    return RealOne.sfReqWriteServerLog(Destination, LogMsg);
}

function bool sfReqUpdateMyHostPriorityPoint(int HostPriorityPoint)
{
    return RealOne.sfReqUpdateMyHostPriorityPoint(HostPriorityPoint);
}

function bool sfReqGetUserHostPriorityPoint(int UserID)
{
    return RealOne.sfReqGetUserHostPriorityPoint(UserID);
}

function bool sfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    return RealOne.sfReqNotifyRelayServerAddr(RelayIP, RelayPort);
}

function bool sfReqGamePlay_UpdateDomScore(int AFScore, int RSAScore)
{
    return RealOne.sfReqGamePlay_UpdateDomScore(AFScore, RSAScore);
}

function bool sfReqGamePlay_ChangeWeaponSet(int UID, int SetNumber)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x26
    else
    {
        return RealOne.sfReqGamePlay_ChangeWeaponSet(UID, SetNumber);
    }
}

function bool sfReqNotifyRecvDummyForHolePunching(int ClientUserID, byte Phrase)
{
    return RealOne.sfReqNotifyRecvDummyForHolePunching(ClientUserID, Phrase);
}

function bool sfReqGetHolePunchingResult()
{
    return RealOne.sfReqGetHolePunchingResult();
}

function bool sfReqNotifyHostBlocking(byte Blocking)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x21
    else
    {
        return RealOne.sfReqNotifyHostBlocking(Blocking);
    }
}

function bool sfReqGetIsHostBlocking()
{
    return RealOne.sfReqGetIsHostBlocking();
}

function bool sfReqIsAvailClanURL(string ClanURL)
{
    return RealOne.sfReqIsAvailClanURL(ClanURL);
}

function bool sfReqGamePlay_GetChopper(int GetChopperUID, array<int> GetChopperAssistUID, float KillXCoord, float KillYCoord, float KillZCoord, int KillPos, int KillWeaponID, int KillWeaponPartID, int KillRange, int KillDamage, int ChopperCallerID, string ChopperCallerName, float ChopperXCoord, float ChopperYCoord, float ChopperZCoord)
{
    return RealOne.sfReqGamePlay_GetChopper(GetChopperUID, GetChopperAssistUID, KillXCoord, KillYCoord, KillZCoord, KillPos, KillWeaponID, KillWeaponPartID, KillRange, KillDamage, ChopperCallerID, ChopperCallerName, ChopperXCoord, ChopperYCoord, ChopperZCoord);
}

function bool sfReqCheckEquipedWeaponDurability()
{
    return RealOne.sfReqCheckEquipedWeaponDurability();
}

function bool sfReqGameGuardAuthData(int AuthDataIndex, int AuthDataVal1, int AuthDataVal2, int AuthDataVal3)
{
    return RealOne.sfReqGameGuardAuthData(AuthDataIndex, AuthDataVal1, AuthDataVal2, AuthDataVal3);
}

function bool sfReqDeleteFriend(array<string> DeleteCharName)
{
    return RealOne.sfReqDeleteFriend(DeleteCharName);
}

function bool sfReqRecvDeleteFriend(int Result, string FromCharName)
{
    return RealOne.sfReqRecvDeleteFriend(Result, FromCharName);
}

function bool sfReqChannelUserListInGameRoom(int ChannelNum, int StartIndex, int Count)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x2b
    else
    {
        return RealOne.sfReqChannelUserListInGameRoom(ChannelNum, StartIndex, Count);
    }
}

function bool sfReqSpecificGameRoomInfo(int RoomNum)
{
    return RealOne.sfReqSpecificGameRoomInfo(RoomNum);
}

function bool sfReqSpecificChannelUserInfo(int UserID)
{
    return RealOne.sfReqSpecificChannelUserInfo(UserID);
}

function bool sfReqNotice_GM(byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    return RealOne.sfReqNotice_GM(NoticeType, ServerID, ChannelNum, GameRoomNum, Msg);
}

function bool sfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    return RealOne.sfReqRecvNotice_FromGM(Result, ErrMsg, NoticeMsg, IsFromDB);
}

function bool sfReqForceDisconnectUser_GM(string CharName)
{
    return RealOne.sfReqForceDisconnectUser_GM(CharName);
}

function bool sfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    return RealOne.sfReqRecvForceDisconnected_FromGM(Result, ErrMsg);
}

function bool sfReqNotifyDisconnectHostInLoading(int Result, string ErrMsg, int HostID)
{
    return RealOne.sfReqNotifyDisconnectHostInLoading(Result, ErrMsg, HostID);
}

function bool sfReqChatWispherMyCommunity(string SourceCharName, string SenderName, string Msg)
{
    return RealOne.sfReqChatWispherMyCommunity(SourceCharName, SenderName, Msg);
}

function bool sfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    return RealOne.sfReqNotifyDurabilityZeroItem(Result, ErrMsg, UserID, ItemUniqueIDs, ItemIDs, ItemPartIDs, ItemSlotPos);
}

function bool sfReqNotifyMyCharInfoToRoomUser()
{
    return RealOne.sfReqNotifyMyCharInfoToRoomUser();
}

function bool sfReqStartHolePunching(int GameType, int ReqStartUserID)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x26
    else
    {
        return RealOne.sfReqStartHolePunching(GameType, ReqStartUserID);
    }
}

function bool sfReqForceFailedClientLoading(int FailedUserID, int ErrCode)
{
    return RealOne.sfReqForceFailedClientLoading(FailedUserID, ErrCode);
}

function bool sfReqRecvForceFailedClientLoading(int ErrCode)
{
    return RealOne.sfReqRecvForceFailedClientLoading(ErrCode);
}

function bool sfReqItemListInItemBox(BtrDouble ItemUniqueID, int BoxItemID)
{
    return RealOne.sfReqItemListInItemBox(ItemUniqueID, BoxItemID);
}

function bool sfReqGetItemFromItemBox(BtrDouble ItemUniqueID, int ItemID, int ItemIDChoose, int PartIDChoose)
{
    return RealOne.sfReqGetItemFromItemBox(ItemUniqueID, ItemID, ItemIDChoose, PartIDChoose);
}

function bool sfReqClanMatch_GetReady()
{
    return RealOne.sfReqClanMatch_GetReady();
}

function bool sfReqClanMatch_StartCombat(array<int> MapNumArray, int VersusMode)
{
    return RealOne.sfReqClanMatch_StartCombat(MapNumArray, VersusMode);
}

function bool sfReqClanMatch_InviteCrew(string Invitee)
{
    return RealOne.sfReqClanMatch_InviteCrew(Invitee);
}

function bool sfReqClanMatch_RecvInviteCrew(string Inviter, string ServerIP, int Port, int WaittingID, string Msg, int MapNum, int InviteUserChannelNum, string LeaderName, string RoomName)
{
    return RealOne.sfReqClanMatch_RecvInviteCrew(Inviter, ServerIP, Port, WaittingID, Msg, MapNum, InviteUserChannelNum, LeaderName, RoomName);
}

function bool sfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    return RealOne.sfReqClanMatch_InviteCrewResult(Invitee, Result);
}

function bool sfReqClanMatch_Join(int WaittingID)
{
    return RealOne.sfReqClanMatch_Join(WaittingID);
}

function bool sfReqClanMatch_MemberList()
{
    return RealOne.sfReqClanMatch_MemberList();
}

function bool sfReqClanMatch_Leave(int WaittingID)
{
    return RealOne.sfReqClanMatch_Leave(WaittingID);
}

function bool sfReqClanMatch_Chat(string Msg)
{
    return RealOne.sfReqClanMatch_Chat(Msg);
}

function bool sfReqClanMatch_WaittingTeamList(int StartIndex, int ReturnCount)
{
    return RealOne.sfReqClanMatch_WaittingTeamList(StartIndex, ReturnCount);
}

function bool sfReqClanMatch_ChangeLeader(int WaitRoomIdx, int NewLeaderID, string NewLeaderName)
{
    return RealOne.sfReqClanMatch_ChangeLeader(WaitRoomIdx, NewLeaderID, NewLeaderName);
}

function bool sfReqClanMatch_StopSearching()
{
    return RealOne.sfReqClanMatch_StopSearching();
}

function bool sfReqInviteGameRoom(string GuestCharName)
{
    return RealOne.sfReqInviteGameRoom(GuestCharName);
}

function bool sfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    return RealOne.sfReqRecvInviteGameRoom(InviteUserServerName, InviteUserServerID, InviteUserChannelNumber, RoomUniqueID, RoomNumber, RoomName, RoomState, MapName, OwnerName, GameMode, WeaponLimit, IsTeamBalance, Password, InviteCharName);
}

function bool sfReqLimitedListInChannel()
{
    return RealOne.sfReqLimitedListInChannel();
}

function bool sfReqClanMatch_StartSearching(int RequestCount)
{
    return RealOne.sfReqClanMatch_StartSearching(RequestCount);
}

function bool sfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber)
{
    return RealOne.sfReqClanMatch_FoundMatch(ChannelID, RoomNumber);
}

function bool sfReqPermanentRoomInfo(int RoomNum)
{
    return RealOne.sfReqPermanentRoomInfo(RoomNum);
}

function bool sfReqQuestList()
{
    return RealOne.sfReqQuestList();
}

function bool sfReqQuestUpdate(int UniqueID, int GameRoomNum, array<int> QuestID, array<int> CountPrograss)
{
    // End:0x30
    if(bTutorial)
    {
        return RealOne.sfReqQuestUpdate(UniqueID, GameRoomNum, QuestID, CountPrograss);
    }
    // End:0x54
    else
    {
        return RealOne.sfReqQuestUpdate(UniqueID, GameRoomNum, QuestID, CountPrograss);
    }
}

function bool sfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    return RealOne.sfReqQuestNewAvailable(AchivedQuestID, NewQuestID, IsDailyQuest, ExpiredQuest);
}

function bool sfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    return RealOne.sfReqDailyQuestNewAvailable(ExpiredQuestID, NewQuestID);
}

function bool sfReqPCBangUserList()
{
    return RealOne.sfReqPCBangUserList();
}

function bool sfReqRegisterMainPCBang()
{
    return RealOne.sfReqRegisterMainPCBang();
}

function bool sfReqRegisteredPCBangInfo()
{
    return RealOne.sfReqRegisteredPCBangInfo();
}

function bool sfReqWebzenCash()
{
    return RealOne.sfReqWebzenCash();
}

function bool sfReqWebzenShopScriptVersion()
{
    return RealOne.sfReqWebzenShopScriptVersion();
}

function bool sfReqBuyItemByWebzenCash(int PackageProductSeq, int ProductDisplaySeq, int PriceSeq, array<int> ItemIDs, BtrDouble ItemUniqueID, byte BuyOption1, byte BuyOption2)
{
    return RealOne.sfReqBuyItemByWebzenCash(PackageProductSeq, ProductDisplaySeq, PriceSeq, ItemIDs, ItemUniqueID, BuyOption1, BuyOption2);
}

function bool sfReqGiftItemByWebzenCash(string ReceiverCharName, string Message, int PackageProductSeq, int PriceSeq, int ProductDisplaySeq)
{
    return RealOne.sfReqGiftItemByWebzenCash(ReceiverCharName, Message, PackageProductSeq, PriceSeq, ProductDisplaySeq);
}

function bool sfReqWebzenBillingStorageList(int Page, int CountForPage, byte Type)
{
    return RealOne.sfReqWebzenBillingStorageList(Page, CountForPage, Type);
}

function bool sfReqWebzenBillingUseStorageItem(int StorageSeq, int StorageItemSeq, byte StorageItemType)
{
    return RealOne.sfReqWebzenBillingUseStorageItem(StorageSeq, StorageItemSeq, StorageItemType);
}

function bool sfReqParamCheckSum(string key, string Value)
{
    return RealOne.sfReqParamCheckSum(key, Value);
}

function bool sfReqClanMatch_ChangeRoomSetting(int WaitRoomIndex, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    return RealOne.sfReqClanMatch_ChangeRoomSetting(WaitRoomIndex, MapNumArray, VersusMode, IsPublic);
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
        // End:0x38 [While If]
        if(lp1 < AFCount)
        {
            AF[lp1] = 0;
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x10;
        }
        lp1 = 0;
        J0x3f:
        // End:0x67 [While If]
        if(lp1 < RSACount)
        {
            rsa[lp1] = 0;
            ++ lp1;
            // This is an implied JumpToken; Continue!
            goto J0x3f;
        }
        rfAckGetBotID(0, AFCount, RSACount, AF, rsa);
    }
    // End:0x9f
    else
    {
        return RealOne.sfReqGetBotID(AFCount, RSACount);
    }
}

function bool sfReqReturnBotID(array<int> BotID)
{
    // End:0x0c
    if(bTutorial)
    {
    }
    // End:0x21
    else
    {
        return RealOne.sfReqReturnBotID(BotID);
    }
}

function bool sfReqClanMatch_GetClanWaittingRoomInfo()
{
    return RealOne.sfReqClanMatch_GetClanWaittingRoomInfo();
}

function bool sfReqIsPaidWebzenPCBang(byte IsPaid)
{
    return RealOne.sfReqIsPaidWebzenPCBang(IsPaid);
}

function bool sfReqCharBlockInfo()
{
    return RealOne.sfReqCharBlockInfo();
}

function bool sfReqQuestGetAvailableEventList()
{
    return RealOne.sfReqQuestGetAvailableEventList();
}

function bool sfReqChangeRoomTitle_GM(int RoomNumber, string NewRoomTitle)
{
    return RealOne.sfReqChangeRoomTitle_GM(RoomNumber, NewRoomTitle);
}

function bool sfReqRandomBox_Use(BtrDouble ItemIdx)
{
    return RealOne.sfReqRandomBox_Use(ItemIdx);
}

function bool sfReqSendSystemMsg(byte RecvType, string SendCharName, string RecvCharname, SystemMsgParam MsgInfo)
{
    return RealOne.sfReqSendSystemMsg(RecvType, SendCharName, RecvCharname, MsgInfo);
}

function bool sfReqPaidItem_EraseRecord(BtrDouble ItemIdx, int Command)
{
    return RealOne.sfReqPaidItem_EraseRecord(ItemIdx, Command);
}

function bool sfReqPaidItem_BroadCast(BtrDouble ItemIdx, int Command, string Message)
{
    return RealOne.sfReqPaidItem_BroadCast(ItemIdx, Command, Message);
}

function bool sfReqPaidItem_ClanMarkDupCheck(byte IsPaid, int Pattern, int BG, int BL)
{
    return RealOne.sfReqPaidItem_ClanMarkDupCheck(IsPaid, Pattern, BG, BL);
}

function bool sfReqPaidItem_ChangeClanMark(BtrDouble ItemIdx, byte IsPaid, int Pattern, int BG, int BL)
{
    return RealOne.sfReqPaidItem_ChangeClanMark(ItemIdx, IsPaid, Pattern, BG, BL);
}

function bool sfReqRemoveCheckTeamBalanceList()
{
    return RealOne.sfReqRemoveCheckTeamBalanceList();
}

function bool sfReqClanMatch_SetWaitRoomPublic(byte Set)
{
    return RealOne.sfReqClanMatch_SetWaitRoomPublic(Set);
}

function bool sfReqExteriorRoomOwnerInfo(int RoomNum, string OwnerName, string OwnerIP)
{
    return RealOne.sfReqExteriorRoomOwnerInfo(RoomNum, OwnerName, OwnerIP);
}

function bool sfReqSetLookForClan(byte IsLookingFor)
{
    return RealOne.sfReqSetLookForClan(IsLookingFor);
}

function bool sfReqGetMyMailBoxState()
{
    return RealOne.sfReqGetMyMailBoxState();
}

function bool sfReqMyEquipedItemList()
{
    return RealOne.sfReqMyEquipedItemList();
}

function bool sfReqMyEquipedSkillList()
{
    return RealOne.sfReqMyEquipedSkillList();
}

function bool sfReqMyEquipedQSlotList()
{
    return RealOne.sfReqMyEquipedQSlotList();
}

function bool sfAckStartNatDiag(int NatType)
{
    return RealOne.sfAckStartNatDiag(NatType);
}

function bool sfAckRecvClanInvite(int InviterUserDBID, string InviterCharname, string InviterMsg, string ClanName, byte Permit)
{
    return RealOne.sfAckRecvClanInvite(InviterUserDBID, InviterCharname, InviterMsg, ClanName, Permit);
}

function bool sfAckRecvJoinClan(int UserIdx, string CharName, string ReqMsg, byte Permit)
{
    return RealOne.sfAckRecvJoinClan(UserIdx, CharName, ReqMsg, Permit);
}

function bool sfAckRecvInviteGameRoom(string RoomUniqueID, int RoomNumber, byte Answer, string InviteCharName)
{
    return RealOne.sfAckRecvInviteGameRoom(RoomUniqueID, RoomNumber, Answer, InviteCharName);
}

function bool sfAckClanMatch_RecvInviteCrew(int Result, string Inviter)
{
    return RealOne.sfAckClanMatch_RecvInviteCrew(Result, Inviter);
}

function bool rfAckLogin(int Result, string ErrMsg, int UserID, string CharName, string ClanName, CharInfo btCharInfo)
{
    return MainMenu.page_curr.TcpChannel.rfAckLogin(Result, ErrMsg, UserID, CharName, ClanName, btCharInfo);
}

function bool rfAckItemListStart(int Count, int Result, string ErrMsg)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x62 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckItemListStart(Count, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckItemList(array<BtrDouble> UniqueID, array<int> ItemID, array<int> ItemType, array<int> Durability, array<BtrDouble> UntilTime, array<int> SlotPosition, array<int> AddPartsID, array<int> DamageDegree, array<byte> ItemState, array<int> StackCount, array<int> PaintID, array<int> TradeCount)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x8f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckItemList(UniqueID, ItemID, ItemType, Durability, UntilTime, SlotPosition, AddPartsID, DamageDegree, ItemState, StackCount, PaintID, TradeCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckItemListEnd()
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x53 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckItemListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckAuctionMyItemRegister(int Result, string ErrMsg, int BeginPrice, int BuyPrice, int GuarantyPoint, int PointRemain)
{
    Log("[rfAckAuctionMyItemRegister] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " BeginPrice=" $ string(BeginPrice) $ " BuyPrice=" $ string(BuyPrice) $ " GuarantyPoint=" $ string(GuarantyPoint) $ " PointRemain=" $ string(PointRemain));
    i = MainMenu.Pages.Length;
    J0xbf:
    // End:0x11b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAuctionMyItemRegister(Result, ErrMsg, BeginPrice, BuyPrice, GuarantyPoint, PointRemain))
    {
        // This is an implied JumpToken; Continue!
        goto J0xbf;
    }
    return true;
}

function bool rfAckAuctionItemListCount(int Result, string ErrMsg, byte Section, byte Classfy, int ItemType, int ItemGrade, int Count)
{
    Log("[rfAckAuctionItemListCount]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " Section=" $ string(Section) $ " Classfy=" $ string(Classfy) $ " Count=" $ string(Count));
    i = MainMenu.Pages.Length;
    J0x9c:
    // End:0xfd [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAuctionItemListCount(Result, ErrMsg, Section, Classfy, ItemType, ItemGrade, Count))
    {
        // This is an implied JumpToken; Continue!
        goto J0x9c;
    }
    return true;
}

function bool rfAckAuctionItemListStart(int Result, string ErrMsg, byte Section, int PageNum, int Count)
{
    Log("[rfAckAuctionItemListStart]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " Section=" $ string(Section) $ " PageNum=" $ string(PageNum) $ " Count=" $ string(Count));
    i = MainMenu.Pages.Length;
    J0x9c:
    // End:0xf3 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAuctionItemListStart(Result, ErrMsg, Section, PageNum, Count))
    {
        // This is an implied JumpToken; Continue!
        goto J0x9c;
    }
    return true;
}

function bool rfAckAuctionItemList(byte Section, array<int> UniqueIDs, array<int> ItemIDs, array<int> AddPartsIDs, array<BtrDouble> UntilTimes, array<int> BiddingPrices, array<int> InstantlyByuingPrices, array<int> ItemDamageds, array<string> HighestBidderNames, array<string> SellerNames, array<int> ItemCount)
{
    Log("[rfAckAuctionItemList]");
    i = MainMenu.Pages.Length;
    J0x2f:
    // End:0xa4 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAuctionItemList(Section, UniqueIDs, ItemIDs, AddPartsIDs, UntilTimes, BiddingPrices, InstantlyByuingPrices, ItemDamageds, HighestBidderNames, SellerNames, ItemCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x2f;
    }
    return true;
}

function bool rfAckAuctionItemListEnd(byte Section)
{
    Log("[rfAckAuctionItemListEnd] Section=" $ string(Section));
    i = MainMenu.Pages.Length;
    J0x44:
    // End:0x87 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAuctionItemListEnd(Section))
    {
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    return true;
}

function bool rfAckAuctionMyItemCancel(int Result, string ErrMsg)
{
    Log("[rfAckAuctionMyItemCancel] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x57:
    // End:0x9f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAuctionMyItemCancel(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x57;
    }
    return true;
}

function bool rfAckAuctionInstantlyBuying(int Result, string ErrMsg, int PointRemain)
{
    Log("[rfAckAuctionInstantlyBuying] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " PointRemain");
    i = MainMenu.Pages.Length;
    J0x6a:
    // End:0xb7 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAuctionInstantlyBuying(Result, ErrMsg, PointRemain))
    {
        // This is an implied JumpToken; Continue!
        goto J0x6a;
    }
    return true;
}

function bool rfAckChannelList(array<int> id, array<string> Title, array<int> CurUser, array<int> MaxUser)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x67 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChannelList(id, Title, CurUser, MaxUser))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTTcpHandler::rfAckEnterChannel]" $ " ID=" $ string(id) $ " UID=" $ string(UID) $ " UserID=" $ UserID $ " Level=" $ string(Level) $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    // End:0x106
    if(UserID == MainMenu.rMM.kUserName)
    {
        MainMenu.rMM.My_iUID = UID;
        MainMenu.iUID = UID;
        MainMenu.rMM.kUID = UID;
    }
    i = MainMenu.Pages.Length;
    J0x11b:
    // End:0x1bd [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckEnterChannel(id, UID, UserID, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // This is an implied JumpToken; Continue!
        goto J0x11b;
    }
    Log("rfAckEnterChannel end");
    return true;
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    Log("[BTTcpHandler::rfAckLeaveChannel] " $ " Result=" $ string(Result) $ " UserID=" $ UserID $ " UID=" $ string(UID));
    i = MainMenu.Pages.Length;
    J0x75:
    // End:0xc2 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckLeaveChannel(Result, UserID, UID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x75;
    }
    return true;
}

function bool rfAckLogin2(int Result, string ErrMsg, int UserID, string CharName, BtrDouble CurServerTime, int CharDBID, byte IsGM)
{
    Log("[BTTcpHandler::rfAckLogin2] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " UserID=" $ string(UserID) $ " Charname=" $ CharName $ " CharDBID=" $ string(CharDBID) $ " IsGM=" $ string(IsGM));
    i = MainMenu.Pages.Length;
    J0xac:
    // End:0x10d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckLogin2(Result, ErrMsg, UserID, CharName, CurServerTime, CharDBID, IsGM))
    {
        // This is an implied JumpToken; Continue!
        goto J0xac;
    }
    return true;
}

function bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, array<int> UID, array<string> UserID, array<int> UserLevels, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, int Result, string ErrMsg, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0xc1 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChannelUserList(TotalCount, Count, StartIndex, UID, UserID, UserLevels, ClanName, ClanPattern, ClanBG, ClanBL, ClanGrade, ClanWin, ClanLose, IsLookForClan, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x67 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRoomListStart(Result, TotalCount, Count, StartIndex))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckRoomList(array<int> GameNum, array<string> Title, array<string> MapName, array<int> MapNum, array<byte> UserCount, array<byte> MaxCount, array<string> ModeName, array<int> ModeNum, array<byte> WeaponLimit, array<byte> IsTeamBalance, array<byte> Status, array<string> RoomOwnerIP, array<int> GameMinute, array<string> RoomOwnerName, array<byte> IsSpecial, array<byte> IsPassword, array<byte> BotDifficult, array<byte> BotModeUserTeamNum)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0xad [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRoomList(GameNum, Title, MapName, MapNum, UserCount, MaxCount, ModeName, ModeNum, WeaponLimit, IsTeamBalance, Status, RoomOwnerIP, GameMinute, RoomOwnerName, IsSpecial, IsPassword, BotDifficult, BotModeUserTeamNum))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckRoomListEnd()
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x53 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRoomListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckChatNormal(int id, string Sender, string Message, int Result)
{
    Log("[BTTcpHandler::rfAckChatNormal] ID=" $ string(id) $ " Sender=" $ Sender $ " Message=" $ Message);
    i = MainMenu.Pages.Length;
    J0x6c:
    // End:0xbe [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChatNormal(id, Sender, Message, Result))
    {
        // This is an implied JumpToken; Continue!
        goto J0x6c;
    }
    return true;
}

function bool rfAckChatClan(string CharName, string Message, int Result)
{
    Log("[BTTcpHandler::rfAckChatClan] Sender=" $ CharName $ " Message=" $ Message);
    i = MainMenu.Pages.Length;
    J0x59:
    // End:0xa6 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChatClan(CharName, Message, Result))
    {
        // This is an implied JumpToken; Continue!
        goto J0x59;
    }
    return true;
}

function bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTTcpHandler::rfAckEnterRoom] GameNum=" $ string(GameNum) $ " UID=" $ string(UID) $ " UserID=" $ UserID $ " TeamNum=" $ string(TeamNum) $ " Grade=" $ string(Grade) $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xc0:
    // End:0x162 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckEnterRoom(GameNum, OwnerID, UID, UserID, TeamNum, Grade, UserIP, ClanName, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // This is an implied JumpToken; Continue!
        goto J0xc0;
    }
    return true;
}

function bool rfAckRoomUserList(array<int> UID, array<string> UserName, array<int> Grade, array<int> TeamNum, array<byte> Statue, array<byte> IsHost, array<string> UserIP, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<byte> IsLookingFor, array<int> GMUID, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0xb2 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRoomUserList(UID, UserName, Grade, TeamNum, Statue, IsHost, UserIP, ClanName, CM_Pattern, CM_BG, CM_BL, IsLookingFor, GMUID, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckLeaveRoom]" $ " Num=" $ string(Num) $ " UID=" $ string(UID) $ " UserID=" $ UserID $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x96:
    // End:0xed [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckLeaveRoom(Num, UID, UserID, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x96;
    }
    return true;
}

function bool rfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    Log("[BTTcpHandler::rfAckCreateGameRoom]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " UID=" $ string(UserID) $ " RooomOwnerIP=" $ RoomOwnerIP);
    i = MainMenu.Pages.Length;
    J0x8f:
    // End:0xe6 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckCreateGameRoom(Result, ErrMsg, UserID, RoomOwnerIP, NetRoomInfo))
    {
        // This is an implied JumpToken; Continue!
        goto J0x8f;
    }
    return true;
}

function bool rfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckChangeTeam]" $ "GameNumber=" $ string(GameNumber) $ " UserID=" $ UserID $ " UID=" $ string(UID) $ " TeamNum=" $ string(TeamNum) $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xb3:
    // End:0x10f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChangeTeam(GameNumber, UserID, UID, TeamNum, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0xb3;
    }
    return true;
}

function bool rfAckGameHostInfo(int GameNumber, string UserID, string IP, int Port, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckGameHostInfo] " $ " GameNumber=" $ string(GameNumber) $ " UserID=" $ UserID $ " IP=" $ IP $ " Port=" $ string(Port) $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xb1:
    // End:0x10d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGameHostInfo(GameNumber, UserID, IP, Port, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0xb1;
    }
    return true;
}

function bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckStartGame]" $ " GameNumber=" $ string(GameNumber) $ " ClientsCount=" $ string(ClientsCount) $ " StartSeed=" $ string(StartSeed) $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xab:
    // End:0x102 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckStartGame(GameNumber, ClientsCount, StartSeed, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0xab;
    }
    return true;
}

function bool rfAckGameRoomDestroy(int GameRoomNum)
{
    Log("[BTTCpHandler::rfAckGameRoomDestroy]" $ " GameRoomNum=" $ string(GameRoomNum));
    i = MainMenu.Pages.Length;
    J0x57:
    // End:0x9a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGameRoomDestroy(GameRoomNum))
    {
        // This is an implied JumpToken; Continue!
        goto J0x57;
    }
    return true;
}

function bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying)
{
    Log("[BTTcpHandler::rfAckIsGameRoomPlaying] " $ " GameRoomNum=" $ string(GameRoomNum) $ " IsPlaying=" $ string(IsPlaying));
    i = MainMenu.Pages.Length;
    J0x72:
    // End:0xba [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckIsGameRoomPlaying(GameRoomNum, IsPlaying))
    {
        // This is an implied JumpToken; Continue!
        goto J0x72;
    }
    return true;
}

function bool rfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    Log("Recv - " $ string(self) $ "::rfAckSelectMap - Gamenum:" $ string(GameNum) $ " UID=" $ string(UID) $ "MapName=" $ MapName $ "Result=" $ string(Result) $ "ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x98:
    // End:0xef [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckSelectMap(GameNum, UID, MapName, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x98;
    }
    return true;
}

function bool rfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    Log("Recv - " $ string(self) $ "::rfAckChangeGameMode - GameNum:" $ string(GameNum) $ " UID=" $ string(UID) $ "GameMode=" $ GameMode $ "GameModeNum=" $ string(GameModeNum) $ "Result=" $ string(Result) $ "ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xb7:
    // End:0x113 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChangeGameMode(GameNum, UID, GameMode, GameModeNum, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0xb7;
    }
    return true;
}

function bool rfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    Log("Recv - " $ string(self) $ "::rfAckGameOver - Result:" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x5e:
    // End:0xb0 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGameOver(UID, GameRoomNumber, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x5e;
    }
    return true;
}

function bool rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log("Recv - " $ string(self) $ "::rfAckGameRoomInfo - Result:" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x62:
    // End:0xaf [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGameRoomInfo(Result, ErrMsg, RoomInfo))
    {
        // This is an implied JumpToken; Continue!
        goto J0x62;
    }
    return true;
}

function bool rfReqRelayServerOn(string RelayServerIP, int RelayServerPortNum)
{
    Log("[BTTcpHandler::rfReqRelayServerOn] RelayServerIP=" $ RelayServerIP $ ", " $ "RelayServerPortNum=" $ string(RelayServerPortNum));
    MainMenu.rMM.LowRelayServerOn(RelayServerIP, RelayServerPortNum);
    return true;
}

function bool rfReqRelayServerOff()
{
    Log("[BTTcpHandler::rfReqRelayServerOff]");
    i = MainMenu.Pages.Length;
    J0x3c:
    // End:0x7a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRelayServerOff())
    {
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return true;
}

function bool rfAckDisconnectGame(int Result, int DisconnectUserID, string DisconnectUserName)
{
    Log("[BTTcpHandler::rfAckDisconnectGame] " $ "Result=" $ string(Result) $ " DisconnectUserID=" $ string(DisconnectUserID) $ " DisconnectUserName=" $ DisconnectUserName);
    i = MainMenu.Pages.Length;
    J0x8f:
    // End:0xdc [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckDisconnectGame(Result, DisconnectUserID, DisconnectUserName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x8f;
    }
    return true;
}

function bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckChangeRoomOwner]" $ " GameNum=" $ string(GameNum) $ " OldOwner=" $ string(OldOwner) $ " NewOwner=" $ string(NewOwner) $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0xa9:
    // End:0x100 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChangeRoomOwner(GameNum, OldOwner, NewOwner, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0xa9;
    }
    return true;
}

function bool rfAckChangeHost(byte ClientNum)
{
    Log("[BTTcpHandler::rfAckChangeHost]");
    i = MainMenu.Pages.Length;
    J0x38:
    // End:0x7b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChangeHost(ClientNum))
    {
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return true;
}

function bool rfAckChangeNewGuest(string HostIP)
{
    Log("[BTTcpHandler::rfAckChangeNewGuest]" $ " HostIP=" $ HostIP);
    i = MainMenu.Pages.Length;
    J0x4f:
    // End:0x92 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChangeNewGuest(HostIP))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4f;
    }
    return true;
}

function bool rfAckConnectGame(int UserID, int Result)
{
    Log("[BTTcpHandler::rfAckConnectGame]" $ " UserID=" $ string(UserID) $ " Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x63:
    // End:0xab [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckConnectGame(UserID, Result))
    {
        // This is an implied JumpToken; Continue!
        goto J0x63;
    }
    return true;
}

function bool rfAckUpdateScore(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> EXPBonuses, array<int> Points, array<int> PointBonuses, array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID)
{
    Log("[BTTcpHandler::rfAckUpdateScore] UserIDs.Length=" $ string(UserIDs.Length));
    i = MainMenu.Pages.Length;
    J0x53:
    // End:0xd7 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckUpdateScore(UserIDs, NickNames, TeamIDs, Scores, Kills, Assists, Deaths, EXPs, EXPBonuses, Points, PointBonuses, TeamScores, BonusOwnerID, BonusID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x53;
    }
    return true;
}

function bool rfAckChangeRoomSetting(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    Log("[BTTcpHandler::rfAckChangeRoomSetting] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x50:
    // End:0x9d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChangeRoomSetting(Result, ErrMsg, RoomInfo))
    {
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
    return true;
}

function bool rfAckEquipItem(int ChangedNewItemID, BtrDouble ChangedNewUniqueID, int ChangedNewSlotPosition, int ChangedOldItemID, BtrDouble ChangedOldUniqueID, int ChangedOldSlotPosition, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckEquipItem] " $ string(Result) $ " " $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x4d:
    // End:0xb3 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckEquipItem(ChangedNewItemID, ChangedNewUniqueID, ChangedNewSlotPosition, ChangedOldItemID, ChangedOldUniqueID, ChangedOldSlotPosition, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    return true;
}

function bool rfAckConfirmItemChanged(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckConfirmItemChanged] " $ string(Result) $ " " $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x56:
    // End:0x9e [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckConfirmItemChanged(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x56;
    }
    return true;
}

function bool rfAckCharInfo(int Result, string ErrMsg, int UserID, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, CharInfo stCharInfo, byte InClanRank, int ClanLevel)
{
    Log("[BTTcpHandler::rfAckCharInfo] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " Clanname=" $ ClanName);
    i = MainMenu.Pages.Length;
    J0x6f:
    // End:0xe4 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckCharInfo(Result, ErrMsg, UserID, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, stCharInfo, InClanRank, ClanLevel))
    {
        // This is an implied JumpToken; Continue!
        goto J0x6f;
    }
    return true;
}

function bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    Log("[BTTcpHandler::rfReqExteriorRoomInfo] " $ " SP=" $ string(SP) $ " RoomNumber=" $ string(RoomNumber) $ " IsPW=" $ string(IsPW) $ " RoomName=" $ RoomName $ " MapName=" $ MapName $ " ModeName=" $ ModeName $ " WpnLimit=" $ string(IsTeamBalance) $ " Max=" $ string(MaxUserCount) $ " UserCount=" $ string(RoomUserCount) $ " RoomState=" $ string(RoomState) $ ", BotDifficult=" $ string(BotDifficult) $ ", WeaponLimit=" $ string(WeaponLimit) $ ", BotModeUserTeamNum=" $ string(BotModeUserTeamNum));
    i = MainMenu.Pages.Length;
    J0x16c:
    // End:0x1f5 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqExteriorRoomInfo(SP, RoomNumber, IsPW, RoomName, MapName, ModeName, MapNum, ModeNum, IsTeamBalance, MaxUserCount, RoomUserCount, RoomState, BotDifficult, WeaponLimit, BotModeUserTeamNum))
    {
        // This is an implied JumpToken; Continue!
        goto J0x16c;
    }
    return true;
}

function bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount)
{
    Log("[BTTcpHandler::rfReqExteriorRoomUserCount] " $ " RoomNumber=" $ string(RoomNumber) $ " RoomUserCount=" $ string(RoomUserCount));
    i = MainMenu.Pages.Length;
    J0x79:
    // End:0xc1 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqExteriorRoomUserCount(RoomNumber, RoomUserCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x79;
    }
    return true;
}

function bool rfReqExteriorRoomState(int RoomNumber, byte RoomState)
{
    Log("[BTTcpHandler::rfReqExteriorRoomState] " $ " RoomNumber=" $ string(RoomNumber) $ " RoomState=" $ string(RoomState));
    i = MainMenu.Pages.Length;
    J0x71:
    // End:0xb9 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqExteriorRoomState(RoomNumber, RoomState))
    {
        // This is an implied JumpToken; Continue!
        goto J0x71;
    }
    return true;
}

function bool rfAckChangeUserState(int Result, string ErrMsg, array<int> UserIDs, array<byte> Positions, array<int> Numbers, array<byte> OldStates, array<byte> NewStates)
{
    Log("[BTTcpHandler::rfAckChangeUserState]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x65:
    // End:0xc6 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChangeUserState(Result, ErrMsg, UserIDs, Positions, Numbers, OldStates, NewStates))
    {
        // This is an implied JumpToken; Continue!
        goto J0x65;
    }
    return true;
}

function bool rfReqStartNatDiag(string Server1Addr, int Server1Port, string Server2Addr, int Server2Port)
{
    Log("[BTTcpHandler::rfReqStartNatDiag]" $ " Server1Addr=" $ Server1Addr $ " Server1Port=" $ string(Server1Port) $ " Server2Addr=" $ Server2Addr $ " Server2Port=" $ string(Server2Port));
    MainMenu.rMM.NatServerAddrStoreToEngine(Server1Addr, Server1Port, Server2Addr, Server2Port);
    MainMenu.rfReqStartNatDiag(Server1Addr, Server1Port, Server2Addr, Server2Port);
    return true;
}

function bool rfReqForceNatTypeSetting(int NatType)
{
    Log("[BTTcpHanldler::rfReqForceNatTypeSetting] NatType:" $ string(NatType));
    return MainMenu.rfReqForceNatTypeSetting(NatType);
}

function bool rfAckRegisterOtherUdpInfo(int UID, string IP, int Port, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    Log("[BTTcpHandler::rfAckRegisterOtherUdpInfo]" $ " UID=" $ string(UID) $ " IP=" $ IP $ " Port=" $ string(Port) $ " Nat=" $ string(NatType) $ " Intervention=" $ string(Intervention) $ "HostInnerIP=" $ HostInnerIP $ "HostInnerPort=" $ string(HostInnerPort));
    i = MainMenu.Pages.Length;
    J0xd5:
    // End:0x136 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRegisterOtherUdpInfo(UID, IP, Port, NatType, Intervention, HostInnerIP, HostInnerPort))
    {
        // This is an implied JumpToken; Continue!
        goto J0xd5;
    }
    return true;
}

function bool rfAckEntryItemList(array<int> UserIDs, array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<BtrDouble> UniqueID, array<int> PaintID, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckEntryItemList]");
    // End:0xaf
    if(Result == 0)
    {
        i = MainMenu.Pages.Length;
        J0x46:
        // End:0xac [While If]
        if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckEntryItemList(UserIDs, ItemIDs, SlotPositions, AddPartsID, UniqueID, PaintID, Result, ErrMsg))
        {
            // This is an implied JumpToken; Continue!
            goto J0x46;
        }
    }
    // End:0xe4
    else
    {
        Log("[BTTcpHandler::rfAckEntryItemList] ErrMsg=" $ ErrMsg);
    }
    return true;
}

function bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckForceGameOver] UserID=" $ string(UserID) $ " GameRoomNumber=" $ string(GameRoomNumber) $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    // End:0xee
    if(Result == 0)
    {
        i = MainMenu.Pages.Length;
        J0x9c:
        // End:0xee [While If]
        if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckForceGameOver(UserID, GameRoomNumber, Result, ErrMsg))
        {
            // This is an implied JumpToken; Continue!
            goto J0x9c;
        }
    }
    return true;
}

function bool rfAckGetBooty(int Result, string ErrMsg, array<int> PrizeWinUserID, array<int> BootyItemID, array<int> BootyPartsID)
{
    Log("[BTTcpHandler::rfAckGetBooty] " $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " PrizeWinUserID.Length=" $ string(PrizeWinUserID.Length) $ " BootyItemID.Length=" $ string(BootyItemID.Length) $ " BootyPartsID.Length=" $ string(BootyPartsID.Length));
    i = MainMenu.Pages.Length;
    J0xc9:
    // End:0x120 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetBooty(Result, ErrMsg, PrizeWinUserID, BootyItemID, BootyPartsID))
    {
        // This is an implied JumpToken; Continue!
        goto J0xc9;
    }
    return true;
}

function bool rfAckGetBootyChoose(int Result, string ErrMsg, byte GiveType, BtrDouble ItemUniqueNumber, int ItemID, int PartID, byte ItemType, BtrDouble UntilTime, int StackCount, int PaintID)
{
    Log("[BTTcpHandler::rfAckGetBootyChoose]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x64:
    // End:0xd4 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetBootyChoose(Result, ErrMsg, GiveType, ItemUniqueNumber, ItemID, PartID, ItemType, UntilTime, StackCount, PaintID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x64;
    }
    return true;
}

function bool rfAckUserSkillListStart(int Count, int Result, string ErrMsg)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x62 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckUserSkillListStart(Count, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckUserSkillList(array<int> UniqueSkillID, array<int> SkillID, array<BtrDouble> UntilTime, array<byte> SlotPosition)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x67 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckUserSkillList(UniqueSkillID, SkillID, UntilTime, SlotPosition))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckUserSkillListEnd()
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x53 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckUserSkillListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckEntrySkillList(array<int> UserIDs, array<int> SkillIDs, array<int> SlotPositions, int Result, string ErrMsg)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x6c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckEntrySkillList(UserIDs, SkillIDs, SlotPositions, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfAckEquipSkill(int ChangedNewSkillID, int ChangedNewSkillUniqueID, byte ChangedNewSlotPosition, int ChangedOldSkillID, int ChangedOldSkillUniqueID, byte ChangedOldSlotPosition, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckEquipSkill]" $ string(Result) $ " " $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x4d:
    // End:0xb3 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckEquipSkill(ChangedNewSkillID, ChangedNewSkillUniqueID, ChangedNewSlotPosition, ChangedOldSkillID, ChangedOldSkillUniqueID, ChangedOldSlotPosition, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    return true;
}

function bool rfReqConfirmSkillChanged()
{
    Log("[BTTcpHandler::rfReqConfirmSkillChanged]");
    i = MainMenu.Pages.Length;
    J0x41:
    // End:0x7f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqConfirmSkillChanged())
    {
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
    return true;
}

function bool rfAckShopItemListStart(int Count)
{
    Log("[BTTcpHandler::rfAckShopItemListStart]" $ " Count=" $ string(Count));
    i = MainMenu.Pages.Length;
    J0x53:
    // End:0x96 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckShopItemListStart(Count))
    {
        // This is an implied JumpToken; Continue!
        goto J0x53;
    }
    return true;
}

function bool rfAckShopItemList(array<int> ItemID)
{
    Log("[BTTcpHandler::rfAckShopItemList]");
    i = MainMenu.Pages.Length;
    J0x3a:
    // End:0x7d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckShopItemList(ItemID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    return true;
}

function bool rfAckShopItemListEnd()
{
    Log("[BTTcpHandler::rfAckShopItemListEnd]");
    i = MainMenu.Pages.Length;
    J0x3d:
    // End:0x7b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckShopItemListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
    return true;
}

function bool rfAckBuyShopItem(int ItemCount, array<int> Result, array<int> BoughtItemTypeID, array<BtrDouble> BoughtItemUniqueID, array<int> BoughtPartID, array<BtrDouble> BoughtUntilTIme, array<int> BoughtStackCnt, int PointRemain, int CashRemain)
{
    Log("[BTTcpHandler::rfAckBuyShopItem]" $ " ItemCount=" $ string(ItemCount) $ " PointRemain=" $ string(PointRemain) $ " CashRemain=" $ string(CashRemain));
    i = MainMenu.Pages.Length;
    J0x84:
    // End:0xef [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckBuyShopItem(ItemCount, Result, BoughtItemTypeID, BoughtItemUniqueID, BoughtPartID, BoughtUntilTIme, BoughtStackCnt, PointRemain, CashRemain))
    {
        // This is an implied JumpToken; Continue!
        goto J0x84;
    }
    return true;
}

function bool rfAckSellShopItem(int Result, string ErrMsg, int PointRemain, int CashRemain, int Count)
{
    Log("[BTTcpHandler::rfAckSellShopItem]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " PointRemain=" $ string(PointRemain) $ " CashRemain=" $ string(CashRemain) $ " Count=" $ string(Count));
    i = MainMenu.Pages.Length;
    J0xa9:
    // End:0x100 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckSellShopItem(Result, ErrMsg, PointRemain, CashRemain, Count))
    {
        // This is an implied JumpToken; Continue!
        goto J0xa9;
    }
    return true;
}

function bool rfAckModifyWeapon(int Result, string ErrMsg, BtrDouble UniqueID, int AddPartID, int PaintID, int Point, int Cash)
{
    Log("[BTTcpHandler::rfAckModifyWeapon]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " UniqueID=" $ UnresolvedNativeFunction_99(UniqueID) $ " AddPartID=" $ string(AddPartID) $ " PaintID=" $ string(PaintID) $ " Point=" $ string(Point) $ " Cash=" $ string(Cash));
    i = MainMenu.Pages.Length;
    J0xcf:
    // End:0x130 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckModifyWeapon(Result, ErrMsg, UniqueID, AddPartID, PaintID, Point, Cash))
    {
        // This is an implied JumpToken; Continue!
        goto J0xcf;
    }
    return true;
}

function bool rfAckQSlotList(int Result, string ErrMsg, array<int> QSlotID, array<string> QSlotName, array<byte> QSlotDispOrder, array<BtrDouble> MWItemID, array<BtrDouble> PistolItemID, array<BtrDouble> TWItemID1, array<BtrDouble> TWItemID2, array<int> Skill1, array<int> Skill2, array<int> Skill3, array<int> Skill4)
{
    Log("[BTTcpHandler::rfAckQSlotList]");
    i = MainMenu.Pages.Length;
    J0x37:
    // End:0xb6 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckQSlotList(Result, ErrMsg, QSlotID, QSlotName, QSlotDispOrder, MWItemID, PistolItemID, TWItemID1, TWItemID2, Skill1, Skill2, Skill3, Skill4))
    {
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    return true;
}

function bool rfAckUpdateQSlot(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckUpdateQSlot]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x61:
    // End:0xa9 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckUpdateQSlot(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x61;
    }
    return true;
}

function bool rfAckEntryQSlotIDList(int UserNum, array<byte> QSlotDispOrder, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<int> TWItemID1, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID)
{
    Log("[BTTcpHandler::rfAckEntryQSlotIDList]");
    i = MainMenu.Pages.Length;
    J0x3e:
    // End:0xc2 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckEntryQSlotIDList(UserNum, QSlotDispOrder, MWItemID, MWPartID, MWPaintID, PistolItemID, PistolPartID, PistolPaintID, TWItemID1, TWItemID2, Skill1ID, Skill2ID, Skill3ID, Skill4ID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3e;
    }
    return true;
}

function bool rfAckEntryQSlotUniqueIDList(int UserNum, array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<BtrDouble> PistolUniqueID, array<BtrDouble> TW1UniqueID, array<BtrDouble> TW2UniqueID)
{
    Log("[BTTcpHandler::rfAckEntryQSlotUniqueIDList]");
    i = MainMenu.Pages.Length;
    J0x44:
    // End:0xa0 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckEntryQSlotUniqueIDList(UserNum, QSlotDispOrder, MWUniqueID, PistolUniqueID, TW1UniqueID, TW2UniqueID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    return true;
}

event bool rfAckUpdateWeaponDurability(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> Durability, array<byte> IsDestroy, array<BtrDouble> FailedWeaponUniqueID)
{
    Log("[BTTcpHandler::rfAckUpdateWeaponDurability]");
    i = MainMenu.Pages.Length;
    J0x44:
    // End:0xa0 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckUpdateWeaponDurability(Result, ErrMsg, UniqueItemID, Durability, IsDestroy, FailedWeaponUniqueID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    return true;
}

function bool rfAckRepairCost(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> RepairCost)
{
    Log("[BTTcpHandler::rfAckRepairCost]");
    i = MainMenu.Pages.Length;
    J0x38:
    // End:0x8a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRepairCost(Result, ErrMsg, UniqueItemID, RepairCost))
    {
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return true;
}

function bool rfAckRepairItem(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, int RepairCost, array<int> DamageDegree)
{
    Log("[BTTcpHandler::rfAckRepairItem]");
    i = MainMenu.Pages.Length;
    J0x38:
    // End:0x8f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRepairItem(Result, ErrMsg, UniqueItemID, RepairCost, DamageDegree))
    {
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return true;
}

function bool rfAckGameOverEnd(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckGameOverEnd]" $ " Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x61:
    // End:0xa9 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGameOverEnd(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x61;
    }
    return true;
}

function bool rfAckServerTime(int Time)
{
    Log("[BTTcpHandler::rfAckServerTime] " $ string(Time));
    i = MainMenu.Pages.Length;
    J0x42:
    // End:0x85 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckServerTime(Time))
    {
        // This is an implied JumpToken; Continue!
        goto J0x42;
    }
    // End:0xd9
    if(i == 0)
    {
        Log("[BTTcpHandler::rfAckServerTime] time set");
        MainMenu.Controller.SetTime(Time);
    }
    return true;
}

function bool rfReqRecvChatWispher(string CharnameFrom, string Message)
{
    Log("[BTTcpHandler::rfReqRecvChatWispher] " $ " CharnameFrom=" $ CharnameFrom $ " Message=" $ Message);
    i = MainMenu.Pages.Length;
    J0x6b:
    // End:0xb3 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvChatWispher(CharnameFrom, Message))
    {
        // This is an implied JumpToken; Continue!
        goto J0x6b;
    }
    return true;
}

function bool rfAckSellShopItemInfo(int Result, string ErrMsg, BtrDouble UniqueItemID, int SellPoint, int CurPoint, int AfterPoint)
{
    Log("[BTTcpHandler::rfAckSellShopItemInfo] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " UniqueItemID=" $ UnresolvedNativeFunction_99(UniqueItemID) $ " SellPoint=" $ string(SellPoint) $ " CurPoint=" $ string(CurPoint) $ " AfterPoint" $ string(AfterPoint));
    i = MainMenu.Pages.Length;
    J0xc5:
    // End:0x121 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckSellShopItemInfo(Result, ErrMsg, UniqueItemID, SellPoint, CurPoint, AfterPoint))
    {
        // This is an implied JumpToken; Continue!
        goto J0xc5;
    }
    return true;
}

function bool ForceLogout_OnOK(GUIComponent Sender)
{
    MainMenu.PlayerOwner().ConsoleCommand("exit");
    return true;
}

function bool rfReqForceLogoutByOwner()
{
    Log("[BTTcphandler::rfReqForceLogoutByOwner]");
    MainMenu.HaltNetwork();
    class'BTWindowDefineInfoHK'.static.ShowInfo(MainMenu.Controller, 84);
    BTWindowDefineInfoHK(MainMenu.Controller.TopPage()).__OnOK__Delegate = ForceLogout_OnOK;
    return true;
}

function bool rfAckHash(int Result, string Error)
{
    Log("[BTTcpHandler::rfAckHash] Result=" $ string(Result) $ " Error=" $ Error);
    i = MainMenu.Pages.Length;
    J0x55:
    // End:0x9d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckHash(Result, Error))
    {
        // This is an implied JumpToken; Continue!
        goto J0x55;
    }
    return true;
}

function bool rfAckSuccessStartGame(int Result, string ErrMsg, byte IsHost, string HostIP, int HostPort, int LoadingStep)
{
    Log("[BTTcpHandler::rfAckSuccessStartGame] HostIP=" $ HostIP $ "HostPort=" $ string(HostPort) $ "Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x8a:
    // End:0xe6 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckSuccessStartGame(Result, ErrMsg, IsHost, HostIP, HostPort, LoadingStep))
    {
        // This is an implied JumpToken; Continue!
        goto J0x8a;
    }
    return true;
}

function bool rfAckFailedStartGame(int Result, string ErrMsg, byte IsHost, int FailedUserID, int LoadingStep)
{
    Log("[BTTcpHandler::rfAckFailedStartGame] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " FailedUserID=" $ string(FailedUserID));
    i = MainMenu.Pages.Length;
    J0x7c:
    // End:0xd3 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckFailedStartGame(Result, ErrMsg, IsHost, FailedUserID, LoadingStep))
    {
        // This is an implied JumpToken; Continue!
        goto J0x7c;
    }
    return true;
}

function bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState)
{
    Log("[BTTcpHandler::rfAckNotifyLoadingState] Result=" $ string(Result) $ " UserID=" $ string(UserID) $ " LoadingState=" $ string(LoadingState));
    i = MainMenu.Pages.Length;
    J0x81:
    // End:0xce [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyLoadingState(Result, UserID, LoadingState))
    {
        // This is an implied JumpToken; Continue!
        goto J0x81;
    }
    return true;
}

function bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckSendFriendInvite] Result=" $ string(Result) $ " Error=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x61:
    // End:0xa9 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckSendFriendInvite(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x61;
    }
    return true;
}

function bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    Log("[BTTcpHandler::rfReqRecvFriendInvite] ReqUserID=" $ string(ReqUserID) $ " ReqCharname=" $ ReqCharname $ " InviteMsg=" $ InviteMsg);
    i = MainMenu.Pages.Length;
    J0x80:
    // End:0xcd [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvFriendInvite(ReqUserID, ReqCharname, InviteMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x80;
    }
    return true;
}

function bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckConfirmFriendInvite] Result=" $ string(Result) $ " Error=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x64:
    // End:0xac [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckConfirmFriendInvite(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x64;
    }
    return true;
}

function bool rfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    Log("[BTTcpHandler::rfReqCompleteFriendInvite] CharnameToBeInvited=" $ CharnameToBeInvited $ " IsPermit=" $ string(IsPermit));
    i = MainMenu.Pages.Length;
    J0x75:
    // End:0xbd [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqCompleteFriendInvite(CharnameToBeInvited, IsPermit))
    {
        // This is an implied JumpToken; Continue!
        goto J0x75;
    }
    return true;
}

function bool rfAckFriendListStart(int Result, int TotalCount)
{
    Log("[BTTcpHandler::rfAckFriendListStart]");
    i = MainMenu.Pages.Length;
    J0x3d:
    // End:0x85 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckFriendListStart(Result, TotalCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
    return true;
}

function bool rfAckFriendList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> LevelMarkID, array<int> ClanLevel, array<int> Level, array<byte> IsLookForClan)
{
    Log("[BTTcpHandler::rfAckFriendList]");
    i = MainMenu.Pages.Length;
    J0x38:
    // End:0xa8 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckFriendList(FriendName, IsLogOn, ClanName, CM_Pattern, CM_BG, CM_BL, LevelMarkID, ClanLevel, Level, IsLookForClan))
    {
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return true;
}

function bool rfAckFriendListEnd()
{
    Log("[BTTcpHandler::rfAckFriendListEnd]");
    i = MainMenu.Pages.Length;
    J0x3b:
    // End:0x79 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckFriendListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return true;
}

function bool rfAckStartMemoList(int Result, string ErrMsg, byte Type, int TotalCount)
{
    Log("[BTTcpHandler::rfAckStartMemoList]");
    i = MainMenu.Pages.Length;
    J0x3b:
    // End:0x8d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckStartMemoList(Result, ErrMsg, Type, TotalCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return true;
}

function bool rfAckMemoList(array<int> MemoIdx, array<string> cnameFrom, array<string> dateRecv, array<string> Text, array<byte> Status, array<int> UntilExpire, array<BtrDouble> ItemUID, array<int> ItemID, array<byte> MsgType, array<int> ItemPartID)
{
    Log("[BTTcpHandler::rfAckMemoList]");
    i = MainMenu.Pages.Length;
    J0x36:
    // End:0xa6 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckMemoList(MemoIdx, cnameFrom, dateRecv, Text, Status, UntilExpire, ItemUID, ItemID, MsgType, ItemPartID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return true;
}

function bool rfAckTestDouble(BtrDouble vDouble, array<BtrDouble> vDoubles)
{
    local BtrDouble A;
    local array<BtrDouble> aaa;
    local string strDouble;

    i = 0;
    A = vDouble;
    strDouble = UnresolvedNativeFunction_99(A);
    // End:0x3b
    if(UnresolvedNativeFunction_99(A, vDouble))
    {
        A = vDouble;
    }
    strDouble = UnresolvedNativeFunction_99(A);
    // End:0x68
    if(UnresolvedNativeFunction_99(A, vDouble))
    {
        A = UnresolvedNativeFunction_99(A, 1);
    }
    strDouble = UnresolvedNativeFunction_99(A);
    // End:0x96
    if(UnresolvedNativeFunction_99(A, vDouble))
    {
        A = UnresolvedNativeFunction_99(A, 2);
    }
    strDouble = UnresolvedNativeFunction_99(A);
    // End:0xc3
    if(UnresolvedNativeFunction_99(A, vDouble))
    {
        A = UnresolvedNativeFunction_99(A, 1);
    }
    strDouble = UnresolvedNativeFunction_99(A);
    A = UnresolvedNativeFunction_99(A, 1);
    strDouble = UnresolvedNativeFunction_99(A);
    A = UnresolvedNativeFunction_99(A, 1);
    strDouble = UnresolvedNativeFunction_99(A);
    A = UnresolvedNativeFunction_99(A, 2);
    strDouble = UnresolvedNativeFunction_99(A);
    A = UnresolvedNativeFunction_99(A, 2);
    strDouble = UnresolvedNativeFunction_99(A);
    aaa.Insert(0, vDoubles.Length);
    i = 0;
    J0x15b:
    // End:0x3e8 [While If]
    if(i < aaa.Length)
    {
        aaa[i] = vDoubles[i];
        strDouble = UnresolvedNativeFunction_99(aaa[i]);
        // End:0x2a2
        if(UnresolvedNativeFunction_99(aaa[i], vDoubles[i]))
        {
            aaa[i] = UnresolvedNativeFunction_99(aaa[i], 1);
            strDouble = UnresolvedNativeFunction_99(aaa[i]);
            aaa[i] = UnresolvedNativeFunction_99(aaa[i], 1);
            strDouble = UnresolvedNativeFunction_99(aaa[i]);
            aaa[i] = UnresolvedNativeFunction_99(aaa[i], 2);
            strDouble = UnresolvedNativeFunction_99(aaa[i]);
            aaa[i] = UnresolvedNativeFunction_99(aaa[i], 2);
            strDouble = UnresolvedNativeFunction_99(aaa[i]);
            aaa[i] = UnresolvedNativeFunction_99(aaa[i], 1);
            strDouble = UnresolvedNativeFunction_99(aaa[i]);
        }
        // End:0x360
        else
        {
            aaa[i] = UnresolvedNativeFunction_99(aaa[i], 1);
            strDouble = UnresolvedNativeFunction_99(aaa[i]);
            aaa[i] = UnresolvedNativeFunction_99(aaa[i], 1);
            strDouble = UnresolvedNativeFunction_99(aaa[i]);
            aaa[i] = UnresolvedNativeFunction_99(aaa[i], 2);
            strDouble = UnresolvedNativeFunction_99(aaa[i]);
            aaa[i] = UnresolvedNativeFunction_99(aaa[i], 2);
            strDouble = UnresolvedNativeFunction_99(aaa[i]);
        }
        // End:0x3ab
        if(UnresolvedNativeFunction_99(aaa[i], vDoubles[i]))
        {
            aaa[i] = UnresolvedNativeFunction_99(aaa[i], 1);
            strDouble = UnresolvedNativeFunction_99(aaa[i]);
        }
        // End:0x3de
        if(UnresolvedNativeFunction_99(aaa[i], vDoubles[i]))
        {
            aaa[i] = aaa[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x15b;
    }
    sfReqTestDouble(A, aaa);
    return true;
}

function bool rfAckEndMemoList()
{
    Log("[BTTcpHandler::rfAckEndMemoList]");
    i = MainMenu.Pages.Length;
    J0x39:
    // End:0x77 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckEndMemoList())
    {
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
    return true;
}

function bool rfAckReadMemo(string cnameFrom, string Text, string dateRecv, BtrDouble ItemUID)
{
    Log("[BTTcpHandler::rfAckReadMemo]");
    i = MainMenu.Pages.Length;
    J0x36:
    // End:0x88 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckReadMemo(cnameFrom, Text, dateRecv, ItemUID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return true;
}

function bool rfAckRecvMemo(string cnameFrom, byte MemoType)
{
    Log("[BTTcpHandler::rfReqRecvMemo]");
    i = MainMenu.Pages.Length;
    J0x36:
    // End:0x7e [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvMemo(cnameFrom, MemoType))
    {
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return true;
}

function bool rfAckSendGift(int Result, string ErrMsg, int PointRemain, int CashRemain)
{
    Log("[BTTcpHandler::rfAckSendGift]");
    i = MainMenu.Pages.Length;
    J0x36:
    // End:0x88 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckSendGift(Result, ErrMsg, PointRemain, CashRemain))
    {
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return true;
}

function bool rfAckAuctionTradeHistory(int Result, string ErrMsg, int ItemID, int PartID, array<string> SellerCharNm, array<int> DamageDegree, array<int> Price)
{
    Log("[BTTcpHandler::rfAckAuctionTradeHistory]");
    i = MainMenu.Pages.Length;
    J0x41:
    // End:0xa2 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAuctionTradeHistory(Result, ErrMsg, ItemID, PartID, SellerCharNm, DamageDegree, Price))
    {
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
    return true;
}

function bool rfAckAuctionBidding(int Result, string ErrMsg, int PointRemain)
{
    Log("[BTTcpHandler::rfAckAuctionBidding]");
    i = MainMenu.Pages.Length;
    J0x3c:
    // End:0x89 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAuctionBidding(Result, ErrMsg, PointRemain))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return true;
}

function bool rfAckSendMemo(array<string> CnamesToFail, array<int> ResultArray)
{
    Log("[BTTcpHandler::rfAckSendMemo]");
    i = MainMenu.Pages.Length;
    J0x36:
    // End:0x7e [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckSendMemo(CnamesToFail, ResultArray))
    {
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return true;
}

event bool rfAckDelMemo(int Result, string ErrMsg, array<int> FailedMemoID)
{
    Log("[BTTcpHandler::rfAckDelMemo]");
    i = MainMenu.Pages.Length;
    J0x35:
    // End:0x82 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckDelMemo(Result, ErrMsg, FailedMemoID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    return true;
}

event bool rfAckDeleteMailAll(int Result, byte MailType, int Count)
{
    Log("[BTTcpHandler::rfAckDelMemo]");
    i = MainMenu.Pages.Length;
    J0x35:
    // End:0x82 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckDeleteMailAll(Result, MailType, Count))
    {
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    return true;
}

function bool rfAckGetAttachedItemFromMemo(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID)
{
    Log("[BTTcpHandler::rfAckGetAttachedItemFromMemo]");
    i = MainMenu.Pages.Length;
    J0x45:
    // End:0x97 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetAttachedItemFromMemo(Result, ErrMsg, ItemIdx, ItemID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    return true;
}

function bool rfAckNotifyExpiredItemIDs(int UserID, array<BtrDouble> ExpiredItemUniqueIDs, array<int> ExpiredItemIDs, array<int> ExpiredItemPartIDs, array<byte> ExpiredItemSlotPos, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckNotifyExpiredItemIDs]");
    i = MainMenu.Pages.Length;
    J0x42:
    // End:0xa3 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyExpiredItemIDs(UserID, ExpiredItemUniqueIDs, ExpiredItemIDs, ExpiredItemPartIDs, ExpiredItemSlotPos, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x42;
    }
    return true;
}

function bool rfAckNotifyExpiredSkillIDs(int UserID, array<BtrDouble> ExpiredSkillUniqueIDs, array<int> ExpiredSkillIDs, int Result, string ErrMsg, array<byte> ExpiredSkillSlotPositions)
{
    Log("[BTTcpHandler::rfAckNotifyExpiredSkillIDs]");
    i = MainMenu.Pages.Length;
    J0x43:
    // End:0x9f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyExpiredSkillIDs(UserID, ExpiredSkillUniqueIDs, ExpiredSkillIDs, Result, ErrMsg, ExpiredSkillSlotPositions))
    {
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    return true;
}

function bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckBanUser]");
    i = MainMenu.Pages.Length;
    J0x35:
    // End:0x8c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckBanUser(GameNum, UID, BanUID, Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    return true;
}

function bool rfAckMyMoney(int Result, string ErrMsg, int Point, int Cash)
{
    Log("[BTTcpHandler::rfAckMyMoney]");
    i = MainMenu.Pages.Length;
    J0x35:
    // End:0x87 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckMyMoney(Result, ErrMsg, Point, Cash))
    {
        // This is an implied JumpToken; Continue!
        goto J0x35;
    }
    return true;
}

function bool rfAckGetServerTime(BtrDouble ServerTime, string ClientIP)
{
    Log("[BTTcpHandler::rfAckGetServerTime]");
    i = MainMenu.Pages.Length;
    J0x3b:
    // End:0x83 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetServerTime(ServerTime, ClientIP))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return true;
}

function bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTTcpHandler::rfAckCreateClan]");
    i = MainMenu.Pages.Length;
    J0x38:
    // End:0x8a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckCreateClan(Result, ErrMsg, ItemIdx, StackCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return true;
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckDupCheckClanName]");
    i = MainMenu.Pages.Length;
    J0x3e:
    // End:0x86 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckDupCheckClanName(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3e;
    }
    return true;
}

function bool rfAckClanInfo(ClanInfo stClanInfo)
{
    Log("[BTTcpHandler::rfAckClanInfo]");
    i = MainMenu.Pages.Length;
    J0x36:
    // End:0x79 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanInfo(stClanInfo))
    {
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return true;
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    Log("[BTTcpHandler::rfAckClanUserListStart]");
    i = MainMenu.Pages.Length;
    J0x3f:
    // End:0x87 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanUserListStart(Result, TotalCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3f;
    }
    return true;
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    Log("[BTTcpHandler::rfAckClanUserList]");
    i = MainMenu.Pages.Length;
    J0x3a:
    // End:0xaa [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanUserList(Result, ErrMsg, Level, CharName, ClanGrade, ClanWinCnt, ClanLoseCnt, LevelMarkID, TitleMarkID, DudeId))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    return true;
}

function bool rfAckClanUserListEnd()
{
    Log("[BTTcpHandler::rfAckClanUserListEnd]");
    i = MainMenu.Pages.Length;
    J0x3d:
    // End:0x7b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanUserListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x3d;
    }
    return true;
}

function bool rfAckClanNews(array<string> IssueDate, array<byte> IssueType, array<string> IssuedClanMember)
{
    Log("[BTTcpHandler::rfAckClanNews]");
    i = MainMenu.Pages.Length;
    J0x36:
    // End:0x83 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanNews(IssueDate, IssueType, IssuedClanMember))
    {
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return true;
}

function bool rfAckClanClose(int Result, string ErrMsg, string ClanName)
{
    Log("[BTTcpHandler::rfAckClanClose]");
    i = MainMenu.Pages.Length;
    J0x37:
    // End:0x84 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanClose(Result, ErrMsg, ClanName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    return true;
}

function bool rfAckClanSecession(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanSecession]");
    i = MainMenu.Pages.Length;
    J0x3b:
    // End:0x83 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanSecession(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return true;
}

function bool rfAckClanChangeInfo(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanChangeInfo]");
    i = MainMenu.Pages.Length;
    J0x3c:
    // End:0x84 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanChangeInfo(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return true;
}

function bool rfAckClanPersonelIntro(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanPersonelIntro]");
    i = MainMenu.Pages.Length;
    J0x3f:
    // End:0x87 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanPersonelIntro(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3f;
    }
    return true;
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    Log("[BTTcpHandler::rfAckSearchClan]");
    i = MainMenu.Pages.Length;
    J0x38:
    // End:0xcb [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckSearchClan(Result, ErrMsg, TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel))
    {
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return true;
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    Log("[BTTcpHandler::rfAckDBCharInfo]");
    i = MainMenu.Pages.Length;
    J0x38:
    // End:0xc6 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckDBCharInfo(Result, ErrMsg, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, ClanPersonIntro, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo, ClanLevel))
    {
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return true;
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    Log("[BTTcpHandler::rfAckClanCharPersonelIntro]");
    i = MainMenu.Pages.Length;
    J0x43:
    // End:0x90 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanCharPersonelIntro(Result, ErrMsg, PersonelIntro))
    {
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    return true;
}

function bool rfReqNotifyChangeRoomState(byte RoomState)
{
    Log("[BTTcpHandler::rfReqNotifyChangeRoomState]");
    i = MainMenu.Pages.Length;
    J0x43:
    // End:0x86 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqNotifyChangeRoomState(RoomState))
    {
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    return true;
}

function bool rfAckForceDisconnectUDPFromHost(int Result)
{
    Log("[BTTcpHandler::rfAckForceDisconnectUDPFromHost]");
    i = MainMenu.Pages.Length;
    J0x48:
    // End:0x8b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckForceDisconnectUDPFromHost(Result))
    {
        // This is an implied JumpToken; Continue!
        goto J0x48;
    }
    return true;
}

function bool rfReqRecvForceDisconnectUDPFromHost(int Result)
{
    Log("[BTTcpHandler::rfReqRecvForceDisconnectUDPFromHost]");
    i = MainMenu.Pages.Length;
    J0x4c:
    // End:0x8f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvForceDisconnectUDPFromHost(Result))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    return true;
}

function bool rfReqNotifyRelayServerAddr(string RelayIP, int RelayPort)
{
    Log("[BTTcpHandler::rfReqNotifyRelayServerAddr]");
    i = MainMenu.Pages.Length;
    J0x43:
    // End:0x8b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqNotifyRelayServerAddr(RelayIP, RelayPort))
    {
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    return true;
}

function bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint)
{
    Log("[BTTcpHandler::rfAckGetUserHostPriorityPoint]");
    i = MainMenu.Pages.Length;
    J0x46:
    // End:0x93 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetUserHostPriorityPoint(Result, UserID, HostPriorityPoint))
    {
        // This is an implied JumpToken; Continue!
        goto J0x46;
    }
    return true;
}

function bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    Log("[BTTcpHandler::rfAckGetHolePunchingResult] Result=" $ string(Result) $ " Phrase=" $ string(Phrase) $ " Intervention=" $ string(Intervention) $ " InterventionUserID=" $ string(InterventionUserID) $ " FailedUserIDs.length=" $ string(FailedUserIDs.Length));
    i = MainMenu.Pages.Length;
    J0xc9:
    // End:0x120 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetHolePunchingResult(Result, Phrase, InterventionUserID, Intervention, FailedUserIDs))
    {
        // This is an implied JumpToken; Continue!
        goto J0xc9;
    }
    return true;
}

function bool rfAckNotifyHostBlocking(int Result, byte Blocking)
{
    Log("[BTTcpHandler::rfAckNotifyHostBlocking] Result=" $ string(Result) $ " Blocking=" $ string(Blocking));
    i = MainMenu.Pages.Length;
    J0x68:
    // End:0xb0 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyHostBlocking(Result, Blocking))
    {
        // This is an implied JumpToken; Continue!
        goto J0x68;
    }
    return true;
}

function bool rfAckGetIsHostBlocking(int Result, byte Blocking)
{
    Log("[BTTcpHandler::rfAckGetIsHostBlocking] Result=" $ string(Result) $ " Blocking=" $ string(Blocking));
    i = MainMenu.Pages.Length;
    J0x67:
    // End:0xaf [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetIsHostBlocking(Result, Blocking))
    {
        // This is an implied JumpToken; Continue!
        goto J0x67;
    }
    return true;
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    Log("[BTTcpHandler::rfReqRecvClanInvite] InviterCharname=" $ InviterCharname);
    i = MainMenu.Pages.Length;
    J0x54:
    // End:0xa6 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvClanInvite(InviterUserDBID, InviterCharname, ClanName, InviteMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x54;
    }
    return true;
}

function bool rfAckInviteClan(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckInviteClan] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x49:
    // End:0x91 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckInviteClan(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    return true;
}

function bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    Log("[BTTcpHandler::rfAckInviteClanResult] Charname=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x4f:
    // End:0x9c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckInviteClanResult(CharName, Permit, ClanNm))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4f;
    }
    return true;
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckRecvClanInviteResult] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x53:
    // End:0x9b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRecvClanInviteResult(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x53;
    }
    return true;
}

function bool rfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    Log("[BTTcpHandler::rfReqRecvJoinClan] Charname=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x4b:
    // End:0x98 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvJoinClan(UserIdx, CharName, Message))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4b;
    }
    return true;
}

function bool rfAckNotifyNewClanMember(string ClanName, string CharName)
{
    Log("[BTTcpHandler::rfAckNotifyNewClanMember] Clanname=" $ ClanName $ " Charname=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x67:
    // End:0xaf [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyNewClanMember(ClanName, CharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x67;
    }
    return true;
}

function bool rfAckNotifyClanSecession(string ClanName, string CharName)
{
    Log("[BTTcpHandler::rfAckNotifyClanSecession] Clanname=" $ ClanName $ " Charname=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x67:
    // End:0xaf [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyClanSecession(ClanName, CharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x67;
    }
    return true;
}

function bool rfAckJoinClanResult(string ClanName, byte Permit, string PermitCharName)
{
    Log("[BTTcpHandler::rfAckJoinClanResult] Clanname=" $ ClanName $ " Permit=" $ string(Permit) $ "PermitCharName=" $ PermitCharName);
    i = MainMenu.Pages.Length;
    J0x7c:
    // End:0xc9 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckJoinClanResult(ClanName, Permit, PermitCharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x7c;
    }
    return true;
}

function bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckRecvJoinClanResult] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x51:
    // End:0x99 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRecvJoinClanResult(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x51;
    }
    return true;
}

function bool rfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    Log("[BTTcpHandler::rfReqClanCharPersonelIntro] CharName=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x54:
    // End:0x9c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqClanCharPersonelIntro(ClanName, CharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x54;
    }
    return true;
}

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    Log("[BTTcpHandler::rfAckAdjustClanMemberGrade] CharName=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x54:
    // End:0xab [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAdjustClanMemberGrade(Result, ErrMsg, ClanName, CharName, CharGrade))
    {
        // This is an implied JumpToken; Continue!
        goto J0x54;
    }
    return true;
}

function bool rfAckBlockUserListStart(int Result, int TotalCount)
{
    Log("[BTTcpHandler::rfAckBlockUserListStart] Result=" $ string(Result) $ " TotalCount=" $ string(TotalCount));
    i = MainMenu.Pages.Length;
    J0x6a:
    // End:0xb2 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckBlockUserListStart(Result, TotalCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x6a;
    }
    return true;
}

function bool rfAckAddBlockUserList(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckAddBlockUserList] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4f:
    // End:0x97 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAddBlockUserList(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4f;
    }
    return true;
}

function bool rfAckBlockUserListEnd()
{
    Log("[BTTcpHandler::rfAckBlockUserListEnd]");
    i = MainMenu.Pages.Length;
    J0x3e:
    // End:0x7c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckBlockUserListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x3e;
    }
    return true;
}

function bool rfAckRemoveBlockUserList(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckRemoveBlockUserList] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x52:
    // End:0x9a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRemoveBlockUserList(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x52;
    }
    return true;
}

function bool rfAckBlockUserList(array<string> CharName)
{
    Log("[BTTcpHandler::rfAckBlockUserList] Charname.Length=" $ string(CharName.Length));
    i = MainMenu.Pages.Length;
    J0x56:
    // End:0x99 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckBlockUserList(CharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x56;
    }
    return true;
}

function bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    Log("[BTTcpHandler::rfReqNotifyLevelUp] LevelUpUserID=" $ string(LevelUpUserID) $ ", Level=" $ string(Level) $ ", ItemID.Length=" $ string(ItemID.Length));
    i = MainMenu.Pages.Length;
    J0x86:
    // End:0xdd [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqNotifyLevelUp(LevelUpUserID, Level, Exp, ItemID, PartID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x86;
    }
    return true;
}

function bool rfAckAcquirePromotionItems(int UID, int Result, string ErrMsg, array<BtrDouble> ItemUniqueID, array<int> ItemIDs, array<int> PartIDs)
{
    Log("[BTTcpHandler::rfAckAcquirePromotionItems] UID=" $ string(UID) $ ", Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x67:
    // End:0xc3 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAcquirePromotionItems(UID, Result, ErrMsg, ItemUniqueID, ItemIDs, PartIDs))
    {
        // This is an implied JumpToken; Continue!
        goto J0x67;
    }
    return true;
}

function bool rfReqNotifyDurabilityZeroItem(int Result, string ErrMsg, int UserID, array<BtrDouble> ItemUniqueIDs, array<int> ItemIDs, array<int> ItemPartIDs, array<byte> ItemSlotPos)
{
    Log("[BTTcpHandler::rfReqNotifyDurabilityZeroItem] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x57:
    // End:0xb8 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqNotifyDurabilityZeroItem(Result, ErrMsg, UserID, ItemUniqueIDs, ItemIDs, ItemPartIDs, ItemSlotPos))
    {
        // This is an implied JumpToken; Continue!
        goto J0x57;
    }
    return true;
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    Log("[BTTcpHandler::rfAckNotifyAdjustClanMemberGrade] ClanName=" $ ClanName $ ", CharName=" $ CharName @ string(CharGrade));
    i = MainMenu.Pages.Length;
    J0x79:
    // End:0xc6 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyAdjustClanMemberGrade(ClanName, CharName, CharGrade))
    {
        // This is an implied JumpToken; Continue!
        goto J0x79;
    }
    return true;
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    Log("[BTTcpHandler::rfAckChatWispher] Result=" $ string(Result) $ ", ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x5e:
    // End:0xab [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChatWispher(Result, ErrMsg, ToCharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x5e;
    }
    return true;
}

function bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    Log("[BTTcpHandler::rfAckDeleteFriend] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4b:
    // End:0x93 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckDeleteFriend(Result, FailedCharname))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4b;
    }
    return true;
}

function bool rfReqRecvDeleteFriend(int Result, string FromCharName)
{
    Log("[BTTcpHandler::rfReqRecvDeleteFriend] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4f:
    // End:0x97 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvDeleteFriend(Result, FromCharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4f;
    }
    return true;
}

function bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, array<int> UID, array<string> CharName, array<int> UserLevel, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<byte> IsLookForClan, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    Log("[BTTcpHandler::rfAckChannelUserListInGameRoom] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x58:
    // End:0xf0 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChannelUserListInGameRoom(Result, TotalCount, Count, StartIndex, UID, CharName, UserLevel, ClanName, ClanPattern, ClanBG, ClanBL, IsLookForClan, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // This is an implied JumpToken; Continue!
        goto J0x58;
    }
    return true;
}

function bool rfAckExceedMaxUser()
{
    Log("[BTTcpHandler::rfAckExceedMaxUser]");
    i = MainMenu.Pages.Length;
    J0x3b:
    // End:0x79 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckExceedMaxUser())
    {
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return true;
}

function bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    Log("[BTTcpHandler::rfAckJoinClan]");
    i = MainMenu.Pages.Length;
    J0x36:
    // End:0x8d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckJoinClan(Result, ErrMsg, SpecificCharName, RealRecvCharName, RealRecvCharClanGrade))
    {
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return true;
}

function bool rfReqRecvNotice_FromGM(int Result, string ErrMsg, array<string> NoticeMsg, byte IsFromDB)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x67 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvNotice_FromGM(Result, ErrMsg, NoticeMsg, IsFromDB))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfReqRecvForceDisconnected_FromGM(int Result, string ErrMsg)
{
    i = MainMenu.Pages.Length;
    J0x15:
    // End:0x5d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvForceDisconnected_FromGM(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    return true;
}

function bool rfReqNotifyDisconnectHostInLoading(int Result, string ErrMsg, int HostID)
{
    Log("[BTTcpHandler::rfReqNotifyDisconnectHostInLoading] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " HostID=" $ string(HostID));
    i = MainMenu.Pages.Length;
    J0x84:
    // End:0xd1 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqNotifyDisconnectHostInLoading(Result, ErrMsg, HostID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x84;
    }
    return true;
}

function bool rfAckNotifyMyCharInfoToRoomUser(int Result, string ErrMsg, int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost, string UserIP, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor)
{
    Log("[BTTcpHandler::rfAckNotifyMyCharInfoToRoomUser] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x6c:
    // End:0xf0 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyMyCharInfoToRoomUser(Result, ErrMsg, UID, UserName, Grade, TeamNum, Statue, IsHost, UserIP, ClanName, CM_Pattern, CM_BG, CM_BL, IsLookFor))
    {
        // This is an implied JumpToken; Continue!
        goto J0x6c;
    }
    return true;
}

event bool rfAckRegisterMyUdpInfo(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckRegisterMyUdpInfo] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg);
    i = MainMenu.Pages.Length;
    J0x63:
    // End:0xab [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRegisterMyUdpInfo(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x63;
    }
    return true;
}

function bool rfAckStartHolePunching(int Result, string ErrMsg, int GameType, int ReqStartUserID)
{
    Log("[BTTcpHandler::rfAckStartHolePunching] Result=" $ string(Result) $ " ErrMsg=" $ ErrMsg $ " GameType=" $ string(GameType) $ " ReqStartUserID=" $ string(ReqStartUserID));
    i = MainMenu.Pages.Length;
    J0x97:
    // End:0xe9 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckStartHolePunching(Result, ErrMsg, GameType, ReqStartUserID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x97;
    }
    return true;
}

function bool rfReqRecvForceFailedClientLoading(int ErrCode)
{
    Log("[BTTcpHandler::rfReqRecvForceFailedClientLoading]" $ "ErrCode=" $ string(ErrCode));
    i = MainMenu.Pages.Length;
    J0x5f:
    // End:0xa2 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvForceFailedClientLoading(ErrCode))
    {
        // This is an implied JumpToken; Continue!
        goto J0x5f;
    }
    return true;
}

function bool rfAckItemListInItemBox(int Result, string ErrMsg, BtrDouble ItemUniqueID, int BoxItemID, array<int> ItemID, array<int> PartID)
{
    Log("[BTTcpHandler::rfAckItemListInItemBox] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x50:
    // End:0xac [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckItemListInItemBox(Result, ErrMsg, ItemUniqueID, BoxItemID, ItemID, PartID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
    return true;
}

function bool rfAckGetItemFromItemBox(int Result, string ErrMsg, int ItemIDChoose, int PartIDChoose, BtrDouble BoxItemIdx, int BxoItemCount, byte bHave, BtrDouble ItemIdx, BtrDouble UntilTime, int StackCount)
{
    Log("[BTTcpHandler::rfAckGetItemFromItemBox] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x51:
    // End:0xc1 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetItemFromItemBox(Result, ErrMsg, ItemIDChoose, PartIDChoose, BoxItemIdx, BxoItemCount, bHave, ItemIdx, UntilTime, StackCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x51;
    }
    return true;
}

function bool rfAckAutoChangedTeamUserList(array<int> UserID, array<int> TeamNum)
{
    Log("[BTTcpHandler::rfAckAutoChangedTeamUserList]" $ "UserID.Length=" $ string(UserID.Length));
    i = MainMenu.Pages.Length;
    J0x61:
    // End:0xa9 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckAutoChangedTeamUserList(UserID, TeamNum))
    {
        // This is an implied JumpToken; Continue!
        goto J0x61;
    }
    return true;
}

function bool rfAckInviteGameRoom(int Result, byte Answer, string GuestCharName)
{
    Log("[BTTcpHandler::rfAckInviteGameRoom] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4d:
    // End:0x9a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckInviteGameRoom(Result, Answer, GuestCharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    return true;
}

function bool rfReqRecvInviteGameRoom(string InviteUserServerName, int InviteUserServerID, int InviteUserChannelNumber, string RoomUniqueID, int RoomNumber, string RoomName, byte RoomState, string MapName, string OwnerName, byte GameMode, byte WeaponLimit, byte IsTeamBalance, string Password, string InviteCharName)
{
    Log("[BTTcpHandler::rfReqRecvInviteGameRoom]" $ "InviteUserServerName=" $ InviteUserServerName);
    i = MainMenu.Pages.Length;
    J0x60:
    // End:0xe4 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqRecvInviteGameRoom(InviteUserServerName, InviteUserServerID, InviteUserChannelNumber, RoomUniqueID, RoomNumber, RoomName, RoomState, MapName, OwnerName, GameMode, WeaponLimit, IsTeamBalance, Password, InviteCharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x60;
    }
    return true;
}

function bool rfAckRecvInviteGameRoomResult(int Result)
{
    Log("[BTTcpHandler::rfAckRecvInviteGameRoomResult] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x57:
    // End:0x9a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRecvInviteGameRoomResult(Result))
    {
        // This is an implied JumpToken; Continue!
        goto J0x57;
    }
    return true;
}

function bool rfAckLimitedListInChannel(int Result, array<int> LimitedMapID, array<int> LimitedModeID)
{
    Log("[BTTcpHandler::rfAckLimitedListInChannel] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x53:
    // End:0xa0 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckLimitedListInChannel(Result, LimitedMapID, LimitedModeID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x53;
    }
    return true;
}

function bool rfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    Log("[BTTcpHandler::rfAckClanMatch_GetReady] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x51:
    // End:0x9e [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_GetReady(Result, ErrMsg, RoomIndex))
    {
        // This is an implied JumpToken; Continue!
        goto J0x51;
    }
    return true;
}

function bool rfAckClanMatch_StartCombat(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanMatch_StartCombat] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x54:
    // End:0x9c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_StartCombat(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x54;
    }
    return true;
}

function bool rfAckClanMatch_NotifiyStartCombat(array<int> MapNumArray, int VersusMode)
{
    Log("[BTTcpHandler::rfAckClanMatch_NotifiyStartCombat]");
    i = MainMenu.Pages.Length;
    J0x4a:
    // End:0x92 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_NotifiyStartCombat(MapNumArray, VersusMode))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4a;
    }
    return true;
}

function bool rfAckClanMatch_Join(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanMatch_Join] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4d:
    // End:0x95 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_Join(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    return true;
}

function bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, string CharName, int ClanGrade, int ClanWin, int ClanLose, string ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTTcpHandler::rfAckClanMatch_JoinNotify]" $ " Charname=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x57:
    // End:0xe5 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_JoinNotify(IsLeader, ClanMarkPA, ClanMarkBG, ClanMarkBL, Level, CharName, ClanGrade, ClanWin, ClanLose, CharName, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // This is an implied JumpToken; Continue!
        goto J0x57;
    }
    return true;
}

function bool rfAckClanMatch_LeaveNotify(string CharName)
{
    Log("[BTTcpHandler::rfAckClanMatch_LeaveNotify]" $ " Charname=" $ CharName);
    i = MainMenu.Pages.Length;
    J0x58:
    // End:0x9b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_LeaveNotify(CharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x58;
    }
    return true;
}

function bool rfAckClanMatch_MemberList(array<byte> IsLeader, array<int> ClanMarkPA, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Level, array<string> CharName, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<string> ClanName, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    Log("[BTTcpHandler::rfAckClanMatch_MemberList] IsLeader.Length=" $ string(IsLeader.Length));
    i = MainMenu.Pages.Length;
    J0x5d:
    // End:0xeb [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_MemberList(IsLeader, ClanMarkPA, ClanMarkBG, ClanMarkBL, Level, CharName, ClanGrade, ClanWin, ClanLose, ClanName, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // This is an implied JumpToken; Continue!
        goto J0x5d;
    }
    return true;
}

function bool rfAckClanMatch_Leave(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanMatch_Leave] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4e:
    // End:0x96 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_Leave(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4e;
    }
    return true;
}

function bool rfAckClanMatch_Chat(int Result, string ErrMsg, string CharName, string Msg)
{
    Log("[BTTcpHandler::rfAckClanMatch_Chat] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x4d:
    // End:0x9f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_Chat(Result, ErrMsg, CharName, Msg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    return true;
}

function bool rfAckClanMatch_WaittingTeamList(int TtotlCount, array<int> Grade, array<int> Map, array<int> Versus)
{
    Log("[BTTcpHandler::rfAckClanMatch_WaittingTeamList] TotalCount=" $ string(TtotlCount));
    i = MainMenu.Pages.Length;
    J0x5d:
    // End:0xaf [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_WaittingTeamList(TtotlCount, Grade, Map, Versus))
    {
        // This is an implied JumpToken; Continue!
        goto J0x5d;
    }
    return true;
}

function bool rfAckClanMatch_ChangeLeader(int Result, string ErrMsg, int NewLeader, string NewLeaderName)
{
    Log("[BTTcpHandler::rfAckClanMatch_ChangeLeader] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x55:
    // End:0xa7 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_ChangeLeader(Result, ErrMsg, NewLeader, NewLeaderName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x55;
    }
    return true;
}

function bool rfAckClanMatch_StartSearching(int Result, string ErrMsg, int ShouldWaitMore)
{
    Log("[BTTcpHandler::rfAckClanMatch_StartSearching] Result=" $ string(Result));
    i = MainMenu.Pages.Length;
    J0x57:
    // End:0xa4 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_StartSearching(Result, ErrMsg, ShouldWaitMore))
    {
        // This is an implied JumpToken; Continue!
        goto J0x57;
    }
    return true;
}

function bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore)
{
    Log("[BTTcpHandler::rfAckClanMatch_NotifyStartSearching] ShouldWaitMore=" $ string(ShouldWaitMore));
    i = MainMenu.Pages.Length;
    J0x65:
    // End:0xa8 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_NotifyStartSearching(ShouldWaitMore))
    {
        // This is an implied JumpToken; Continue!
        goto J0x65;
    }
    return true;
}

function bool rfAckClanMatch_FoundMatch()
{
    Log("[BTTcpHandler::rfAckClanMatch_FoundMatch]");
    return true;
}

function bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber)
{
    Log("[BTTcpHandler::rfReqClanMatch_FoundMatch]");
    i = MainMenu.Pages.Length;
    J0x42:
    // End:0x8a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqClanMatch_FoundMatch(ChannelID, RoomNumber))
    {
        // This is an implied JumpToken; Continue!
        goto J0x42;
    }
    return true;
}

function bool rfAckClanMatch_StopSearching()
{
    Log("[BTTcpHandler::rfAckClanMatch_StopSearching]");
    i = MainMenu.Pages.Length;
    J0x45:
    // End:0x83 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_StopSearching())
    {
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    return true;
}

function bool rfAckClanMatch_SetWaitRoomPublic(int Result, string ErrMsg, byte Set)
{
    Log("[BTTcpHandler::rfAckClanMatch_SetWaitRoomPublic]");
    i = MainMenu.Pages.Length;
    J0x49:
    // End:0x96 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_SetWaitRoomPublic(Result, ErrMsg, Set))
    {
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    return true;
}

function bool rfAckQuestListStart(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckQuestListStart]");
    i = MainMenu.Pages.Length;
    J0x3c:
    // End:0x84 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckQuestListStart(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return true;
}

function bool rfAckQuestList(array<int> QuestID, array<int> CountPrograss, array<byte> IsDailyQuest)
{
    Log("[BTTcpHandler::rfAckQuestList]");
    i = MainMenu.Pages.Length;
    J0x37:
    // End:0x84 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckQuestList(QuestID, CountPrograss, IsDailyQuest))
    {
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    return true;
}

function bool rfAckQuestListEnd()
{
    Log("[BTTcpHandler::rfAckQuestListEnd]");
    i = MainMenu.Pages.Length;
    J0x3a:
    // End:0x78 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckQuestListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    return true;
}

function bool rfAckQuestUpdate(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckQuestUpdate]");
    i = MainMenu.Pages.Length;
    J0x39:
    // End:0x81 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckQuestUpdate(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
    return true;
}

function bool rfReqQuestNewAvailable(array<int> AchivedQuestID, array<int> NewQuestID, array<byte> IsDailyQuest, array<int> ExpiredQuest)
{
    Log("[BTTcpHandler::rfReqQuestNewAvailable]");
    i = MainMenu.Pages.Length;
    J0x3f:
    // End:0x91 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqQuestNewAvailable(AchivedQuestID, NewQuestID, IsDailyQuest, ExpiredQuest))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3f;
    }
    return true;
}

function bool rfReqDailyQuestNewAvailable(array<int> ExpiredQuestID, array<int> NewQuestID)
{
    Log("[BTTcpHandler::rfReqDailyQuestNewAvailable]");
    i = MainMenu.Pages.Length;
    J0x44:
    // End:0x8c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqDailyQuestNewAvailable(ExpiredQuestID, NewQuestID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    return true;
}

function bool rfAckClanMatch_InviteCrew(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckClanMatch_InviteCrew]");
    i = MainMenu.Pages.Length;
    J0x42:
    // End:0x8a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_InviteCrew(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x42;
    }
    return true;
}

function bool rfReqClanMatch_RecvInviteCrew(string Inviter, string ServerIP, int Port, int WaittingID, string Msg, int MapNum, int InviteUserChannelNum, string LeaderName, string RoomName)
{
    Log("[BTTcpHandler::rfReqClanMatch_RecvInviteCrew]");
    i = MainMenu.Pages.Length;
    J0x46:
    // End:0xb1 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqClanMatch_RecvInviteCrew(Inviter, ServerIP, Port, WaittingID, Msg, MapNum, InviteUserChannelNum, LeaderName, RoomName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x46;
    }
    return true;
}

function bool rfReqClanMatch_InviteCrewResult(string Invitee, int Result)
{
    Log("[BTTcpHandler::rfReqClanMatch_InviteCrewResult]");
    i = MainMenu.Pages.Length;
    J0x48:
    // End:0x90 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqClanMatch_InviteCrewResult(Invitee, Result))
    {
        // This is an implied JumpToken; Continue!
        goto J0x48;
    }
    return true;
}

function bool rfAckCheckEquipedWeaponDurability(int Result, array<BtrDouble> ItemUniqueID, array<int> ItemSlotNum)
{
    Log("[BTTcpHandler::rfAckCheckEquipedWeaponDurability]");
    i = MainMenu.Pages.Length;
    J0x4a:
    // End:0x97 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckCheckEquipedWeaponDurability(Result, ItemUniqueID, ItemSlotNum))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4a;
    }
    return true;
}

function bool rfAckWebzenCash(int Result, string ErrMsg, BtrDouble PCoinCash, BtrDouble CCoinCash)
{
    Log("[BTTcpHandler::rfAckWebzenCash]");
    i = MainMenu.Pages.Length;
    J0x38:
    // End:0x8a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckWebzenCash(Result, ErrMsg, PCoinCash, CCoinCash))
    {
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return true;
}

function bool rfAckWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log("[BTTcpHandler::rfAckWebzenShopScriptVersion]");
    i = MainMenu.Pages.Length;
    J0x45:
    // End:0x92 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckWebzenShopScriptVersion(Year, YearId, SalesZoneCode))
    {
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    return true;
}

function bool rfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    Log("[BTTcpHandler::rfAckRegisteredPCBangInfo]");
    i = MainMenu.Pages.Length;
    J0x42:
    // End:0x99 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRegisteredPCBangInfo(Result, ErrMsg, IsRegisteredPCBang, IsMainPCBang, PCBangName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x42;
    }
    return true;
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    Log("[BTTcpHandler::rfAckGetBotID]");
    i = MainMenu.Pages.Length;
    J0x36:
    // End:0x8d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetBotID(Result, RequestedAFCount, RequestedRSACount, AFBotID, RSABotID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x36;
    }
    return true;
}

function bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, string WaitRoomName)
{
    Log("[BTTcpHandler::rfAckClanMatch_GetClanWaittingRoomInfo]");
    i = MainMenu.Pages.Length;
    J0x4f:
    // End:0xab [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_GetClanWaittingRoomInfo(WaitRoomIndex, Result, ErrMsg, MapNumArray, VersusMode, WaitRoomName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4f;
    }
    return true;
}

function bool rfAckBuyItemByWebzenCash(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckBuyItemByWebzenCash]");
    i = MainMenu.Pages.Length;
    J0x41:
    // End:0x89 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckBuyItemByWebzenCash(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
    return true;
}

function bool rfAckGiftItemByWebzenCash(int Result, string ErrMsg, int LeftProductCount)
{
    Log("[BTTcpHandler::rfAckGiftItemByWebzenCash]");
    i = MainMenu.Pages.Length;
    J0x42:
    // End:0x8f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGiftItemByWebzenCash(Result, ErrMsg, LeftProductCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x42;
    }
    return true;
}

function bool rfAckPCBangUserListStart(int Result, int TotalCount)
{
    Log("[BTTcpHandler::rfAckPCBangUserListStart]");
    i = MainMenu.Pages.Length;
    J0x41:
    // End:0x89 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPCBangUserListStart(Result, TotalCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
    return true;
}

function bool rfAckPCBangUserList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<byte> IsCombat, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    Log("[BTTcpHandler::rfAckPCBangUserList]");
    i = MainMenu.Pages.Length;
    J0x3c:
    // End:0xcf [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPCBangUserList(FriendName, ClanName, CM_Pattern, CM_BG, CM_BL, Level, ClanGrade, ClanWin, ClanLose, IsLookForClan, IsCombat, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return true;
}

function bool rfAckPCBangUserListEnd()
{
    Log("[BTTcpHandler::rfAckPCBangUserListEnd]");
    i = MainMenu.Pages.Length;
    J0x3f:
    // End:0x7d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPCBangUserListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x3f;
    }
    return true;
}

function bool rfReqIsPaidWebzenPCBang(byte IsPaid)
{
    Log("[BTTcpHandler::rfReqIsPaidWebzenPCBang]");
    i = MainMenu.Pages.Length;
    J0x40:
    // End:0x83 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqIsPaidWebzenPCBang(IsPaid))
    {
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    return true;
}

function bool rfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckRegisterMainPCBang]");
    i = MainMenu.Pages.Length;
    J0x40:
    // End:0x88 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRegisterMainPCBang(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    return true;
}

function bool rfAckRandomBox_Use(int Result, string ErrMsg, BtrDouble RandomBoxItemIdx, int RandomBxoItemCount, array<int> ItemIDChoose, array<int> PartIDChoose, array<int> PeriodOnChoosenItem, array<int> StackCountOnChoosenItem, array<byte> bHave, array<BtrDouble> ItemIdx, array<BtrDouble> UntilTime, array<int> StackCount)
{
    Log("[BTTcpHandler::rfAckRandomBox_Use]");
    i = MainMenu.Pages.Length;
    J0x3b:
    // End:0xb5 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRandomBox_Use(Result, ErrMsg, RandomBoxItemIdx, RandomBxoItemCount, ItemIDChoose, PartIDChoose, PeriodOnChoosenItem, StackCountOnChoosenItem, bHave, ItemIdx, UntilTime, StackCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return true;
}

function bool rfAckWebzenBillingStorageListStart(int Result, string ErrMsg, int TotalCount, int TotalPage, int CurPage)
{
    Log("[BTTcpHandler::rfAckWebzenBillingStorageListStart]");
    i = MainMenu.Pages.Length;
    J0x4b:
    // End:0xa2 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckWebzenBillingStorageListStart(Result, ErrMsg, TotalCount, TotalPage, CurPage))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4b;
    }
    return true;
}

function bool rfAckWebzenBillingStorageList(array<int> Seq, array<int> ItemSeq, array<int> GroupCode, array<int> ShareFlag, array<int> ProductSeq, array<string> CashName, array<BtrDouble> CashPoint, array<string> SendAccountID, array<string> SendMessage, array<byte> ItemType, array<byte> RelationType, array<int> ProductType, array<int> PriceSeq)
{
    Log("[BTTcpHandler::rfAckWebzenBillingStorageList]");
    i = MainMenu.Pages.Length;
    J0x46:
    // End:0xc5 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckWebzenBillingStorageList(Seq, ItemSeq, GroupCode, ShareFlag, ProductSeq, CashName, CashPoint, SendAccountID, SendMessage, ItemType, RelationType, ProductType, PriceSeq))
    {
        // This is an implied JumpToken; Continue!
        goto J0x46;
    }
    return true;
}

function bool rfAckWebzenBillingStorageListEnd()
{
    Log("[BTTcpHandler::rfAckWebzenBillingStorageListEnd]");
    i = MainMenu.Pages.Length;
    J0x49:
    // End:0x87 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckWebzenBillingStorageListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    return true;
}

function bool rfAckPaidItem_EraseRecord(int Result, string ErrMsg, BtrDouble ItemIdx, int Command, int RemainCount)
{
    Log("[BTTcpHandler::rfAckPaidItem_EraseRecord]");
    i = MainMenu.Pages.Length;
    J0x42:
    // End:0x99 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPaidItem_EraseRecord(Result, ErrMsg, ItemIdx, Command, RemainCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x42;
    }
    return true;
}

function bool rfAckPaidItem_BroadCast(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTTcpHandler::rfAckPaidItem_BroadCast]");
    i = MainMenu.Pages.Length;
    J0x40:
    // End:0x92 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPaidItem_BroadCast(Result, ErrMsg, ItemIdx, StackCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    return true;
}

function bool rfAckPaidItem_RelayBroadcast(string CharName, string Msg)
{
    Log("[BTTcpHandler::rfAckPaidItem_RelayBroadcast]");
    i = MainMenu.Pages.Length;
    J0x45:
    // End:0x8d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPaidItem_RelayBroadcast(CharName, Msg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    return true;
}

function bool rfAckWebzenBillingUseStorageItem(int Result, string ErrMsg, BtrDouble ItemIdx, int ItemID, BtrDouble ItemExtra)
{
    Log("[BTTcpHandler::rfAckWebzenBillingUseStorageItem]");
    i = MainMenu.Pages.Length;
    J0x49:
    // End:0xa0 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckWebzenBillingUseStorageItem(Result, ErrMsg, ItemIdx, ItemID, ItemExtra))
    {
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    return true;
}

function bool rfAckPaidItem_ClanMarkDupCheck(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckPaidItem_ClanMarkDupCheck]");
    i = MainMenu.Pages.Length;
    J0x47:
    // End:0x8f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPaidItem_ClanMarkDupCheck(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x47;
    }
    return true;
}

function bool rfAckPaidItem_ChangeClanMark(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    Log("[BTTcpHandler::rfAckPaidItem_ChangeClanMark]");
    i = MainMenu.Pages.Length;
    J0x45:
    // End:0x97 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPaidItem_ChangeClanMark(Result, ErrMsg, ItemIdx, StackCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    return true;
}

function bool rfAckPaidItem_NotifyChangeClanMark(string ClanName, int Pattern, int BG, int BL)
{
    Log("[BTTcpHandler::rfAckPaidItem_NotifyChangeClanMark]");
    i = MainMenu.Pages.Length;
    J0x4b:
    // End:0x9d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPaidItem_NotifyChangeClanMark(ClanName, Pattern, BG, BL))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4b;
    }
    return true;
}

function bool rfAckQuestGetAvailableEventList(int Result, string ErrMsg, array<int> QuestID)
{
    Log("[BTTcpHandler::rfAckQuestGetAvailableEventList]");
    i = MainMenu.Pages.Length;
    J0x48:
    // End:0x95 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckQuestGetAvailableEventList(Result, ErrMsg, QuestID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x48;
    }
    return true;
}

function bool rfAckCharBlockInfo(int Result, BtrDouble ChatBlockStartTime, BtrDouble ChatBlockEndTime, array<BtrDouble> BlockedItemIdx)
{
    Log("[BTTcpHandler::rfAckCharBlockInfo]");
    i = MainMenu.Pages.Length;
    J0x3b:
    // End:0x8d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckCharBlockInfo(Result, ChatBlockStartTime, ChatBlockEndTime, BlockedItemIdx))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return true;
}

function bool rfReqExteriorRoomOwnerInfo(int RoomNum, string OwnerName, string OwnerIP)
{
    Log("[BTTcpHandler::rfAckCharBlockInfo]");
    i = MainMenu.Pages.Length;
    J0x3b:
    // End:0x88 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqExteriorRoomOwnerInfo(RoomNum, OwnerName, OwnerIP))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return true;
}

function bool rfAckChangeRoomTitle_GM(int Result, int RoomNumber, string NewRoomTitle)
{
    Log("[BTTcpHandler::rfAckChangeRoomTitle_GM]");
    i = MainMenu.Pages.Length;
    J0x40:
    // End:0x8d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChangeRoomTitle_GM(Result, RoomNumber, NewRoomTitle))
    {
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    return true;
}

function bool rfAckNotice_GM(int Result, string ErrMsg, byte NoticeType, int ServerID, int ChannelNum, int GameRoomNum, string Msg)
{
    Log("[BTTcpHandler::rfAckNotice_GM]");
    i = MainMenu.Pages.Length;
    J0x37:
    // End:0x98 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotice_GM(Result, ErrMsg, NoticeType, ServerID, ChannelNum, GameRoomNum, Msg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x37;
    }
    return true;
}

function bool rfAckForceDisconnectUser_GM(int Result, string ErrMsg, string CharName)
{
    Log("[BTTcpHandler::rfAckForceDisconnectUser_GM]");
    i = MainMenu.Pages.Length;
    J0x44:
    // End:0x91 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckForceDisconnectUser_GM(Result, ErrMsg, CharName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    return true;
}

function bool rfAckGMEnterRoom(int Result, int RoomNumber, int UserID)
{
    Log("[BTTcpHandler::rfAckGMEnterRoom]");
    i = MainMenu.Pages.Length;
    J0x39:
    // End:0x86 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGMEnterRoom(Result, RoomNumber, UserID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
    return true;
}

function bool rfAckGMLeaveRoom(int Result, int RoomNumber, int UserID)
{
    Log("[BTTcpHandler::rfAckGMLeaveRoom]");
    i = MainMenu.Pages.Length;
    J0x39:
    // End:0x86 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGMLeaveRoom(Result, RoomNumber, UserID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x39;
    }
    return true;
}

function bool rfAckRecvSystemMsg(byte CommunityType, SystemMsgParam MsgInfo)
{
    Log("[BTTcpHandler::rfAckRecvSystemMsg]");
    i = MainMenu.Pages.Length;
    J0x3b:
    // End:0x83 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRecvSystemMsg(CommunityType, MsgInfo))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3b;
    }
    return true;
}

function bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    Log("[BTTcpHandler::rfAckChange?dRoomTitle_FromGM]");
    i = MainMenu.Pages.Length;
    J0x46:
    // End:0x93 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckChangedRoomTitle_FromGM(Result, RoomNumber, NewRoomTitle))
    {
        // This is an implied JumpToken; Continue!
        goto J0x46;
    }
    return true;
}

function bool rfAckSetLookForClan(int Result, string ErrMsg, byte IsLookingFor)
{
    Log("[BTTcpHandler::rfAckSetLookForClan]");
    i = MainMenu.Pages.Length;
    J0x3c:
    // End:0x89 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckSetLookForClan(Result, ErrMsg, IsLookingFor))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return true;
}

function bool rfAckRoomUserPingInfo(array<int> UnqueID, array<int> Ping, int HostPriorityPoint)
{
    Log("[BTTcpHandler::sfAckRoomUserPingInfo]");
    i = MainMenu.Pages.Length;
    J0x3e:
    // End:0x8b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckRoomUserPingInfo(UnqueID, Ping, HostPriorityPoint))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3e;
    }
    return true;
}

function bool rfAckGetMyMailBoxState(int Result, byte IsFull, int NewMailCount)
{
    Log("[BTTcpHandler::rfAckGetMyMailBoxState]");
    i = MainMenu.Pages.Length;
    J0x3f:
    // End:0x8c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetMyMailBoxState(Result, IsFull, NewMailCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3f;
    }
    return true;
}

function bool rfAckNotifyStartTutorial(int Result, int UserID)
{
    Log("[BTTcpHandler::rfAckNotifyStartTutorial]");
    i = MainMenu.Pages.Length;
    J0x41:
    // End:0x89 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyStartTutorial(Result, UserID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x41;
    }
    return true;
}

function bool rfAckNotifyEndTutorial(int UserID, string CharName, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    Log("[BTTcpHandler::rfAckNotifyEndTutorial]");
    i = MainMenu.Pages.Length;
    J0x3f:
    // End:0xd7 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyEndTutorial(UserID, CharName, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3f;
    }
    return true;
}

function bool rfAckPaidItem_ChangeCharname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewCharname)
{
    Log("[BTTcpHandler::rfAckPaidItem_ChangeCharname]");
    i = MainMenu.Pages.Length;
    J0x45:
    // End:0x9c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPaidItem_ChangeCharname(Result, ErrMsg, ItemIdx, RemainCount, NewCharname))
    {
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    return true;
}

function bool rfAckPaidItem_ChangeClanname(int Result, string ErrMsg, BtrDouble ItemIdx, int RemainCount, string NewClanname)
{
    Log("[BTTcpHandler::rfAckPaidItem_ChangeClanname]");
    i = MainMenu.Pages.Length;
    J0x45:
    // End:0x9c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPaidItem_ChangeClanname(Result, ErrMsg, ItemIdx, RemainCount, NewClanname))
    {
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    return true;
}

function bool rfAckPaidItem_NotifyChangeClanname(string NewClanname)
{
    Log("[BTTcpHandler::rfAckPaidItem_ChangeClanname]");
    i = MainMenu.Pages.Length;
    J0x45:
    // End:0x88 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPaidItem_NotifyChangeClanname(NewClanname))
    {
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    return true;
}

function bool rfAckClanMatch_StartPublicWaitRoomList(int Result, string ErrMsg, int Count)
{
    Log("[BTTcpHandler::rfAckClanMatch_StartPublicWaitRoomList]");
    i = MainMenu.Pages.Length;
    J0x4f:
    // End:0x9c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_StartPublicWaitRoomList(Result, ErrMsg, Count))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4f;
    }
    return true;
}

function bool rfAckClanMatch_PublicWaitRoomList(array<int> WaitRoomIdx, array<string> LeaderName, array<string> RoomName, array<int> MapNum, array<int> CurUserCount, array<int> MaxUserCount, array<byte> Status)
{
    Log("[BTTcpHandler::rfAckClanMatch_PublicWaitRoomList]");
    i = MainMenu.Pages.Length;
    J0x4a:
    // End:0xab [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_PublicWaitRoomList(WaitRoomIdx, LeaderName, RoomName, MapNum, CurUserCount, MaxUserCount, Status))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4a;
    }
    return true;
}

function bool rfAckClanMatch_EndPublicWaitRoomList()
{
    Log("[BTTcpHandler::rfAckClanMatch_EndPublicWaitRoomList]");
    i = MainMenu.Pages.Length;
    J0x4d:
    // End:0x8b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_EndPublicWaitRoomList())
    {
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    return true;
}

function bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, string RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic)
{
    Log("[BTTcpHandler::rfAckClanMatch_PublicWaitRoomChanged]");
    i = MainMenu.Pages.Length;
    J0x4d:
    // End:0xae [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_PublicWaitRoomChanged(WaitRoomIdx, RoomName, MapNum, CurUserCount, MaxUserCount, Status, IsPublic))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4d;
    }
    return true;
}

function bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    Log("[BTTcpHandler::rfAckClanMatch_ChangeRoomSetting]");
    i = MainMenu.Pages.Length;
    J0x49:
    // End:0xa5 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatch_ChangeRoomSetting(WaitRoomIndex, Result, ErrMsg, MapNumArray, VersusMode, IsPublic))
    {
        // This is an implied JumpToken; Continue!
        goto J0x49;
    }
    return true;
}

function bool rfAckServerType(byte Type)
{
    Log("[BTTcpHandler::rfAckServerType]");
    i = MainMenu.Pages.Length;
    J0x38:
    // End:0x7b [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckServerType(Type))
    {
        // This is an implied JumpToken; Continue!
        goto J0x38;
    }
    return true;
}

function bool rfReqInGameRoomUserInfoChanged()
{
    Log("[BTTcpHandler::rfReqInGameRoomUserInfoChanged]");
    i = MainMenu.Pages.Length;
    J0x47:
    // End:0x85 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqInGameRoomUserInfoChanged())
    {
        // This is an implied JumpToken; Continue!
        goto J0x47;
    }
    return true;
}

function bool rfAckClanMatchResultHistory(array<BtrDouble> MatchDate, array<byte> IsWin, array<string> EnemyClanname)
{
    Log("[BTTcpHandler::rfAckClanMatchResultHistory]");
    i = MainMenu.Pages.Length;
    J0x44:
    // End:0x91 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckClanMatchResultHistory(MatchDate, IsWin, EnemyClanname))
    {
        // This is an implied JumpToken; Continue!
        goto J0x44;
    }
    return true;
}

function bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel)
{
    Log("[BTTcpHandler::rfReqInGameRoomUserClanLevelChanged]");
    i = MainMenu.Pages.Length;
    J0x4c:
    // End:0x94 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqInGameRoomUserClanLevelChanged(UserID, ClanLevel))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    return true;
}

function bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    Log("[BTTcpHandler::rfAckCharDetailInfo]");
    i = MainMenu.Pages.Length;
    J0x3c:
    // End:0x11f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckCharDetailInfo(MaxSerial, MaxScore, MaxKill, MaxAssist, Serial3, Serial5, Serial7, Serial10, Serial15, AR, SMG, SR, SW, Melee, Grenade, FlashBang, Foot, AT4, MG, Fire, RPG7, TimeBomb, IcendiaryBomb, ClusterBomb, ByChopper, Artillery, KillChopper, FirstKill, LastKill, AllKill, Dominate, InstallBomb, DefuseBomb))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return true;
}

function bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount)
{
    Log("[BTTcpHandler::rfAckGetRankingInfoListStart]");
    i = MainMenu.Pages.Length;
    J0x45:
    // End:0x97 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetRankingInfoListStart(Result, RankingType, CommunityType, TotalCount))
    {
        // This is an implied JumpToken; Continue!
        goto J0x45;
    }
    return true;
}

function bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    Log("[BTTcpHandler::rfAckGetRankingInfoList]");
    i = MainMenu.Pages.Length;
    J0x40:
    // End:0xd3 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetRankingInfoList(Result, RankingType, CommunityType, CharName, CharLevel, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, Ranking_Accum, Ranking_Accum_Prev, Ranking_Accum_Exp, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3))
    {
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    return true;
}

function bool rfAckGetRankingInfoListEnd()
{
    Log("[BTTcpHandler::rfAckGetRankingInfoListEnd]");
    i = MainMenu.Pages.Length;
    J0x43:
    // End:0x81 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckGetRankingInfoListEnd())
    {
        // This is an implied JumpToken; Continue!
        goto J0x43;
    }
    return true;
}

function bool rfAckNotifyUpdateCharInfo_LevelMark(string CharName, int LevelMarkID)
{
    Log("[BTTcpHandler::rfAckNotifyUpdateCharInfo_LevelMark]");
    i = MainMenu.Pages.Length;
    J0x4c:
    // End:0x94 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckNotifyUpdateCharInfo_LevelMark(CharName, LevelMarkID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4c;
    }
    return true;
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    Log("[BTTcpHandler::rfAckLogOut]");
    i = MainMenu.Pages.Length;
    J0x34:
    // End:0x7c [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckLogOut(Result, Reason))
    {
        // This is an implied JumpToken; Continue!
        goto J0x34;
    }
    return true;
}

function bool rfAckFriendPosition(int Result, string TargetCharName, byte ServerType, string fServername, string fServerShortName, string fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, string ChannelNickName, int GameRoomNum)
{
    Log("[BTTcpHandler::rfAckFriendPosition]");
    i = MainMenu.Pages.Length;
    J0x3c:
    // End:0xb6 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckFriendPosition(Result, TargetCharName, ServerType, fServername, fServerShortName, fServerIP, fServerPort, CurPos, CurState, ChannelNum, ChannelNickName, GameRoomNum))
    {
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return true;
}

function bool rfUpdateWebzenShopScriptVersion(int Year, int YearId, int SalesZoneCode)
{
    Log("[BTTcpHandlerMed::rfUpdateWebzenShopScriptVersion] Year=" $ string(Year) $ " YearId=" $ string(YearId) $ " SalesZoneCode=" $ string(SalesZoneCode));
    i = MainMenu.Pages.Length;
    J0x8b:
    // End:0xd8 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfUpdateWebzenShopScriptVersion(Year, YearId, SalesZoneCode))
    {
        // This is an implied JumpToken; Continue!
        goto J0x8b;
    }
    return true;
}

function bool rfAckPopUpMessage(int MessageType)
{
    Log("[BTTcpHandler::rfAckPopUpMessage(] MessageType=" $ string(MessageType));
    i = MainMenu.Pages.Length;
    J0x51:
    // End:0x94 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckPopUpMessage(MessageType))
    {
        // This is an implied JumpToken; Continue!
        goto J0x51;
    }
    return false;
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTTcpHandler::rfAckMoveToLobby(] MessageType=" $ string(MessageType));
    i = MainMenu.Pages.Length;
    J0x50:
    // End:0x93 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckMoveToLobby(MessageType))
    {
        // This is an implied JumpToken; Continue!
        goto J0x50;
    }
    return true;
}

function bool rfAckTencent_StartTenProtect(int CharDBID)
{
    Log("[BTTcpHandler::rfAckTencent_StartTenProtect()] CharDBID=" $ string(CharDBID));
    i = MainMenu.Pages.Length;
    J0x5a:
    // End:0x9d [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckTencent_StartTenProtect(CharDBID))
    {
        // This is an implied JumpToken; Continue!
        goto J0x5a;
    }
    return false;
}

function bool rfNotifyNewNickName(int Community_Type, string Old_NickName, string New_NickName)
{
    Log("[BTTcpHandler::rfNotifyNewNickName()] Community_Type=" $ string(Community_Type));
    i = MainMenu.Pages.Length;
    J0x57:
    // End:0xa4 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfNotifyNewNickName(Community_Type, Old_NickName, New_NickName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x57;
    }
    return false;
}

function bool rfNotifyNewClanName(string New_NickName)
{
    Log("[BTTcpHandler::rfNotifyNewNickName()] New_NickName=" $ New_NickName);
    i = MainMenu.Pages.Length;
    J0x53:
    // End:0x96 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfNotifyNewClanName(New_NickName))
    {
        // This is an implied JumpToken; Continue!
        goto J0x53;
    }
    return false;
}

function bool rfNotifyClanLevelup(string ClanName, int Levelup)
{
    Log("[BTTcpHandler::rfNotifyClanLevelup()] ClanName=" $ ClanName $ " Level=" $ string(Levelup));
    i = MainMenu.Pages.Length;
    J0x63:
    // End:0xab [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfNotifyClanLevelup(ClanName, Levelup))
    {
        // This is an implied JumpToken; Continue!
        goto J0x63;
    }
    return false;
}

function bool rfAckShopItemData()
{
    Log("[BTTcpHandler::rfAckShopItemData()]");
    i = MainMenu.Pages.Length;
    J0x3c:
    // End:0x7a [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckShopItemData())
    {
        // This is an implied JumpToken; Continue!
        goto J0x3c;
    }
    return false;
}

function bool rfReqNotifyShopItemData(array<int> ProductNo, array<string> ProductRowGuid, array<string> ServiceCode, array<string> ProductName, array<string> ProductCode, array<string> ProductType, array<byte> SaleType, array<string> ItemSaleType, array<byte> ISIncludeBonus, array<int> ProductCost, array<int> ProductHour, array<int> ProductQuantity, array<int> TotalQuantity, array<int> ReOrderTerms, array<int> ReorderCount, array<int> PurchaseAvailableQuantity, array<int> AvailableMinLevel, array<int> AvailableMaxLevel, array<byte> AvailableGender, array<int> InventoryKeepDays, array<int> SaleMasterFlag, array<int> SaleStatus, array<string> Description, array<string> Property0, array<string> Property1, array<string> Property2, array<string> Property3, array<string> Property4, array<int> IsGift)
{
    Log("[BTTcpHandler::rfReqNotifyShopItemData]");
    i = MainMenu.Pages.Length;
    J0x40:
    // End:0x10f [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqNotifyShopItemData(ProductNo, ProductRowGuid, ServiceCode, ProductName, ProductCode, ProductType, SaleType, ItemSaleType, ISIncludeBonus, ProductCost, ProductHour, ProductQuantity, TotalQuantity, ReOrderTerms, ReorderCount, PurchaseAvailableQuantity, AvailableMinLevel, AvailableMaxLevel, AvailableGender, InventoryKeepDays, SaleMasterFlag, SaleStatus, Description, Property0, Property1, Property2, Property3, Property4, IsGift))
    {
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    return true;
}

function bool rfAckCouponUse(int Result, string ErrMsg)
{
    Log("[BTTcpHandler::rfAckCouponUse(" $ string(Result) $ ")]");
    i = MainMenu.Pages.Length;
    J0x46:
    // End:0x8e [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfAckCouponUse(Result, ErrMsg))
    {
        // This is an implied JumpToken; Continue!
        goto J0x46;
    }
    return true;
}

function bool rfReqNotifyShopItemDataEnd(int Ver)
{
    Log("[BTTcpHandler::rfReqNotifyShopItemDataEnd(" $ string(Ver) $ ")]");
    i = MainMenu.Pages.Length;
    J0x52:
    // End:0x95 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfReqNotifyShopItemDataEnd(Ver))
    {
        // This is an implied JumpToken; Continue!
        goto J0x52;
    }
    return true;
}

function bool rfNotifyCouponUseError(int Time)
{
    Log("[BTTcpHandler::rfNotifyCouponUseError(" $ string(Time) $ ")]");
    i = MainMenu.Pages.Length;
    J0x4e:
    // End:0x91 [While If]
    if(i > 0 && !MainMenu.Pages[-- i].TcpChannel.rfNotifyCouponUseError(Time))
    {
        // This is an implied JumpToken; Continue!
        goto J0x4e;
    }
    return true;
}

function bool rfReqAhnHsObject(array<byte> Data, int DataSize)
{
    local array<byte> ResultData;
    local int resultSize;

    Log("[BTTcpHandler::rfReqAhnHsObject] DataSize- " $ string(DataSize) $ " " $ string(Data.Length));
    MM.MakeHSResponseData(Data, ResultData);
    // End:0xa7
    if(ResultData.Length == 0)
    {
        Log("[BTTcpHandler::rfReqAhnHsObject] resultData.length == 0");
    }
    Log("[BTTcpHandler::sfAckAhnHsObject]");
    RealOne.sfAckAhnHsObject(ResultData, ResultData.Length);
    return true;
}

function bool rfReqAhnNotifyDisconnct(int Code)
{
    UnresolvedNativeFunction_97("[BTTcpHandler::rfReqAhnNotifyDisconnct] Code- " $ string(Code));
    RealOne.sfReqLogOut(4);
    return true;
}

defaultproperties
{
    DisconnectedFromServerMsg="Disconnected from the server."
    DisconnectedFromServerQuit="Quit"
}