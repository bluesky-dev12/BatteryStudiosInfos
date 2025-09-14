class BTPageRoomLobby_TCP extends BTTcpLink_Channel;

var export editinline BTPageRoomLobby Owner;

function bool rfAckConnectGame(int UserID, int Result)
{
    return Owner.rfAckConnectGame(UserID, Result);
    //return;    
}

function bool rfAckGameHostInfo(int GameNumber, string UserID, string IP, int Port, int Result, string ErrMsg)
{
    return Owner.rfAckGameHostInfo(GameNumber, UserID, IP, Port, Result, ErrMsg);
    //return;    
}

function bool rfAckIsGameRoomPlaying(int GameRoomNum, byte IsPlaying)
{
    return Owner.rfAckIsGameRoomPlaying(GameRoomNum, IsPlaying);
    //return;    
}

function bool rfAckStartGame(int GameNumber, int ClientsCount, int StartSeed, int Result, string ErrMsg)
{
    return Owner.rfAckStartGame(GameNumber, ClientsCount, StartSeed, Result, ErrMsg);
    //return;    
}

function bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckEnterRoom(GameNum, OwnerID, UID, UserID, TeamNum, Grade, UserIP, ClanName, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckLeaveRoom(int Num, int UID, string UserID, int Result, string ErrMsg)
{
    return Owner.rfAckLeaveRoom(Num, UID, UserID, Result, ErrMsg);
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckEnterChannel(id, UID, UserID, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckRoomUserList(array<int> UID, array<string> UserName, array<int> Grade, array<int> TeamNum, array<byte> Statue, array<byte> IsHost, array<string> UserIP, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<byte> IsLookingFor, array<int> GMUID, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckRoomUserList(UID, UserName, Grade, TeamNum, Statue, IsHost, UserIP, ClanName, CM_Pattern, CM_BG, CM_BL, IsLookingFor, GMUID, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckChangeTeam(int GameNumber, string UserID, int UID, int TeamNum, int Result, string ErrMsg)
{
    return Owner.rfAckChangeTeam(GameNumber, UserID, UID, TeamNum, Result, ErrMsg);
    //return;    
}

function bool rfAckSelectMap(int GameNum, int UID, string MapName, int Result, string ErrMsg)
{
    return Owner.rfAckSelectMap(GameNum, UID, MapName, Result, ErrMsg);
    //return;    
}

function bool rfAckChangeGameMode(int GameNum, int UID, string GameMode, byte GameModeNum, int Result, string ErrMsg)
{
    return Owner.rfAckChangeGameMode(GameNum, UID, GameMode, GameModeNum, Result, ErrMsg);
    //return;    
}

function bool rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    return Owner.rfAckGameRoomInfo(Result, ErrMsg, RoomInfo);
    //return;    
}

function bool rfAckGameOver(int UID, int GameRoomNumber, int Result, string ErrMsg)
{
    return Owner.rfAckGameOver(UID, GameRoomNumber, Result, ErrMsg);
    //return;    
}

function bool rfAckDisconnectGame(int Result, int DisconnectUserID, string DisconnectUserName)
{
    return Owner.rfAckDisconnectGame(Result, DisconnectUserID, DisconnectUserName);
    //return;    
}

function bool rfAckRegisterOtherUdpInfo(int UID, string IP, int Port, byte NatType, byte Intervention, string HostInnerIP, int HostInnerPort)
{
    return Owner.rfAckRegisterOtherUdpInfo(UID, IP, Port, NatType, Intervention, HostInnerIP, HostInnerPort);
    //return;    
}

function bool rfAckUpdateScore(array<int> UserIDs, array<string> NickNames, array<byte> TeamIDs, array<int> Scores, array<int> Kills, array<int> Assists, array<int> Deaths, array<int> EXPs, array<int> EXPBonuses, array<int> Points, array<int> PointBonuses, array<int> TeamScores, array<int> BonusOwnerID, array<int> BonusID)
{
    return Owner.rfAckUpdateScore(UserIDs, NickNames, TeamIDs, Scores, Kills, Assists, Deaths, EXPs, EXPBonuses, Points, PointBonuses, TeamScores, BonusOwnerID, BonusID);
    //return;    
}

function bool rfAckAIRewardResult(byte ClearRewardTYPE, int ClearRewardID, int ClearRewardCount, array<int> ScoreRewardUserID, array<byte> ScoreRewardTYPE, array<int> ScoreRewardID, array<int> ScoreRewardCount)
{
    return Owner.rfAckAIRewardResult(ClearRewardTYPE, ClearRewardID, ClearRewardCount, ScoreRewardUserID, ScoreRewardTYPE, ScoreRewardID, ScoreRewardCount);
    //return;    
}

function bool rfAckChangeRoomSetting(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    return Owner.rfAckChangeRoomSetting(Result, ErrMsg, RoomInfo);
    //return;    
}

function bool rfAckChangeUserState(int Result, string ErrMsg, array<int> UserIDs, array<byte> Positions, array<int> Numbers, array<byte> OldStates, array<byte> NewStates)
{
    return Owner.rfAckChangeUserState(Result, ErrMsg, UserIDs, Positions, Numbers, OldStates, NewStates);
    //return;    
}

function bool rfAckEntryItemList(array<int> UserIDs, array<int> ItemIDs, array<int> SlotPositions, array<int> AddPartsID, array<BtrDouble> UniqueID, array<int> PaintID, int Result, string ErrMsg)
{
    return Owner.rfAckEntryItemList(UserIDs, ItemIDs, SlotPositions, AddPartsID, UniqueID, PaintID, Result, ErrMsg);
    //return;    
}

function bool rfAckChangeRoomOwner(int GameNum, int OldOwner, int NewOwner, int Result, string ErrMsg)
{
    return Owner.rfAckChangeRoomOwner(GameNum, OldOwner, NewOwner, Result, ErrMsg);
    //return;    
}

function bool rfAckForceGameOver(int UserID, int GameRoomNumber, int Result, string ErrMsg)
{
    return Owner.rfAckForceGameOver(UserID, GameRoomNumber, Result, ErrMsg);
    //return;    
}

function bool rfAckGetBooty(int Result, string ErrMsg, array<int> PrizeWinUserID, array<int> BootyItemID, array<int> BootyPartsID)
{
    return Owner.rfAckGetBooty(Result, ErrMsg, PrizeWinUserID, BootyItemID, BootyPartsID);
    //return;    
}

function bool rfAckEntrySkillList(array<int> UserIDs, array<int> SkillIDs, array<int> SlotPositions, int Result, string ErrMsg)
{
    return Owner.rfAckEntrySkillList(UserIDs, SkillIDs, SlotPositions, Result, ErrMsg);
    //return;    
}

function bool rfAckGetBootyChoose(int Result, string ErrMsg, byte GiveType, BtrDouble ItemUniqueNumber, int ItemID, int PartID, byte ItemType, BtrDouble UntilTime, int StackCount, int PaintID)
{
    return Owner.rfAckGetBootyChoose(Result, ErrMsg, GiveType, ItemUniqueNumber, ItemID, PartID, ItemType, UntilTime, StackCount, PaintID);
    //return;    
}

function bool rfAckChangeHost(byte ClientNum)
{
    return Owner.rfAckChangeHost(ClientNum);
    //return;    
}

function bool rfAckChangeNewGuest(string HostIP)
{
    return Owner.rfAckChangeNewGuest(HostIP);
    //return;    
}

function bool rfAckEntryQSlotIDList(int UserNum, array<byte> QSlotDispOrder, array<int> MWItemID, array<int> MWPartID, array<int> MWPaintID, array<int> PistolItemID, array<int> PistolPartID, array<int> PistolPaintID, array<int> TWItemID1, array<int> TWItemID2, array<int> Skill1ID, array<int> Skill2ID, array<int> Skill3ID, array<int> Skill4ID)
{
    return Owner.rfAckEntryQSlotIDList(UserNum, QSlotDispOrder, MWItemID, MWPartID, MWPaintID, PistolItemID, PistolPartID, PistolPaintID, TWItemID1, TWItemID2, Skill1ID, Skill2ID, Skill3ID, Skill4ID);
    //return;    
}

function bool rfAckEntryQSlotUniqueIDList(int UserNum, array<byte> QSlotDispOrder, array<BtrDouble> MWUniqueID, array<BtrDouble> PistolUniqueID, array<BtrDouble> TW1UniqueID, array<BtrDouble> TW2UniqueID)
{
    return Owner.rfAckEntryQSlotUniqueIDList(UserNum, QSlotDispOrder, MWUniqueID, PistolUniqueID, TW1UniqueID, TW2UniqueID);
    //return;    
}

function bool rfAckUpdateWeaponDurability(int Result, string ErrMsg, array<BtrDouble> UniqueItemID, array<int> Durability, array<byte> IsDestroy, array<BtrDouble> FailedWeaponUniqueID)
{
    return Owner.rfAckUpdateWeaponDurability(Result, ErrMsg, UniqueItemID, Durability, IsDestroy, FailedWeaponUniqueID);
    //return;    
}

function bool rfAckGameOverEnd(int Result, string ErrMsg)
{
    return Owner.rfAckGameOverEnd(Result, ErrMsg);
    //return;    
}

function bool rfReqRelayServerOff()
{
    return Owner.rfReqRelayServerOff();
    //return;    
}

function bool rfAckSuccessStartGame(int Result, string ErrMsg, byte IsHost, string HostIP, int HostPort, int LoadingStep)
{
    return Owner.rfAckSuccessStartGame(Result, ErrMsg, IsHost, HostIP, HostPort, LoadingStep);
    //return;    
}

function bool rfAckFailedStartGame(int Result, string ErrMsg, byte IsHost, int FailedUserID, int LoadingStep)
{
    return Owner.rfAckFailedStartGame(Result, ErrMsg, IsHost, FailedUserID, LoadingStep);
    //return;    
}

function bool rfAckNotifyLoadingState(int Result, int UserID, byte LoadingState)
{
    return Owner.rfAckNotifyLoadingState(Result, UserID, LoadingState);
    //return;    
}

function bool rfAckSendFriendInvite(int Result, string ErrMsg)
{
    return Owner.rfAckSendFriendInvite(Result, ErrMsg);
    //return;    
}

function bool rfReqRecvFriendInvite(int ReqUserID, string ReqCharname, string InviteMsg)
{
    return Owner.rfReqRecvFriendInvite(ReqUserID, ReqCharname, InviteMsg);
    //return;    
}

function bool rfAckConfirmFriendInvite(int Result, string ErrMsg)
{
    return Owner.rfAckConfirmFriendInvite(Result, ErrMsg);
    //return;    
}

function bool rfReqCompleteFriendInvite(string CharnameToBeInvited, byte IsPermit)
{
    return Owner.rfReqCompleteFriendInvite(CharnameToBeInvited, IsPermit);
    //return;    
}

function bool rfAckBanUser(int GameNum, int UID, int BanUID, int Result, string ErrMsg)
{
    return Owner.rfAckBanUser(GameNum, UID, BanUID, Result, ErrMsg);
    //return;    
}

function bool rfReqNotifyChangeRoomState(byte RoomState)
{
    return Owner.rfReqNotifyChangeRoomState(RoomState);
    //return;    
}

function bool rfAckForceDisconnectUDPFromHost(int Result)
{
    return Owner.rfAckForceDisconnectUDPFromHost(Result);
    //return;    
}

function bool rfReqRecvForceDisconnectUDPFromHost(int Result)
{
    return Owner.rfReqRecvForceDisconnectUDPFromHost(Result);
    //return;    
}

function bool rfAckGetUserHostPriorityPoint(int Result, int UserID, int HostPriorityPoint)
{
    return Owner.rfAckGetUserHostPriorityPoint(Result, UserID, HostPriorityPoint);
    //return;    
}

function bool rfAckGetHolePunchingResult(int Result, byte Phrase, int InterventionUserID, byte Intervention, array<int> FailedUserIDs)
{
    return Owner.rfAckGetHolePunchingResult(Result, Phrase, InterventionUserID, Intervention, FailedUserIDs);
    //return;    
}

function bool rfAckNotifyHostBlocking(int Result, byte Blocking)
{
    return Owner.rfAckNotifyHostBlocking(Result, Blocking);
    //return;    
}

function bool rfAckGetIsHostBlocking(int Result, byte Blocking)
{
    return Owner.rfAckGetIsHostBlocking(Result, Blocking);
    //return;    
}

function bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    return Owner.rfAckCreateClan(Result, ErrMsg, ItemIdx, StackCount);
    //return;    
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    return Owner.rfAckDupCheckClanName(Result, ErrMsg);
    //return;    
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    return Owner.rfAckDBCharInfo(Result, ErrMsg, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, ClanPersonIntro, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo, ClanLevel);
    //return;    
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    return Owner.rfAckSearchClan(Result, ErrMsg, TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    //return;    
}

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    return Owner.rfReqRecvClanInvite(InviterUserDBID, InviterCharname, ClanName, InviteMsg);
    //return;    
}

function bool rfAckInviteClan(int Result, string ErrMsg)
{
    return Owner.rfAckInviteClan(Result, ErrMsg);
    //return;    
}

function bool rfAckJoinClan(int Result, string ErrMsg, string SpecificCharName, string RealRecvCharName, byte RealRecvCharClanGrade)
{
    return Owner.rfAckJoinClan(Result, ErrMsg, SpecificCharName, RealRecvCharName, RealRecvCharClanGrade);
    //return;    
}

function bool rfAckInviteClanResult(string CharName, byte Permit, string ClanNm)
{
    return Owner.rfAckInviteClanResult(CharName, Permit, ClanNm);
    //return;    
}

function bool rfAckRecvClanInviteResult(int Result, string ErrMsg)
{
    return Owner.rfAckRecvClanInviteResult(Result, ErrMsg);
    //return;    
}

function bool rfReqRecvJoinClan(int UserIdx, string CharName, string Message)
{
    return Owner.rfReqRecvJoinClan(UserIdx, CharName, Message);
    //return;    
}

function bool rfAckNotifyNewClanMember(string ClanName, string CharName)
{
    return Owner.rfAckNotifyNewClanMember(ClanName, CharName);
    //return;    
}

function bool rfAckNotifyClanSecession(string ClanName, string CharName)
{
    return Owner.rfAckNotifyClanSecession(ClanName, CharName);
    //return;    
}

function bool rfAckJoinClanResult(string ClanName, byte Permit, string PermitCharName)
{
    return Owner.rfAckJoinClanResult(ClanName, Permit, PermitCharName);
    //return;    
}

function bool rfAckRecvJoinClanResult(int Result, string ErrMsg)
{
    return Owner.rfAckRecvJoinClanResult(Result, ErrMsg);
    //return;    
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    return Owner.rfAckClanCharPersonelIntro(Result, ErrMsg, PersonelIntro);
    //return;    
}

function bool rfReqClanCharPersonelIntro(string ClanName, string CharName)
{
    return Owner.rfReqClanCharPersonelIntro(ClanName, CharName);
    //return;    
}

function bool rfReqNotifyLevelUp(int LevelUpUserID, int Level, int Exp, array<int> ItemID, array<int> PartID)
{
    return Owner.rfReqNotifyLevelUp(LevelUpUserID, Level, Exp, ItemID, PartID);
    //return;    
}

function bool rfAckAcquirePromotionItems(int UID, int Result, string ErrMsg, array<BtrDouble> ItemUniqueID, array<int> ItemIDs, array<int> PartIDs)
{
    return Owner.rfAckAcquirePromotionItems(UID, Result, ErrMsg, ItemUniqueID, ItemIDs, PartIDs);
    //return;    
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    return Owner.rfAckChatWispher(Result, ErrMsg, ToCharName);
    //return;    
}

function bool rfAckChannelUserListInGameRoom(int Result, int TotalCount, int Count, int StartIndex, array<int> UID, array<string> CharName, array<int> UserLevel, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<byte> IsLookForClan, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckChannelUserListInGameRoom(Result, TotalCount, Count, StartIndex, UID, CharName, UserLevel, ClanName, ClanPattern, ClanBG, ClanBL, IsLookForClan, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckDeleteFriend(int Result, array<string> FailedCharname)
{
    return Owner.rfAckDeleteFriend(Result, FailedCharname);
    //return;    
}

function bool rfReqRecvDeleteFriend(int Result, string FromCharName)
{
    return Owner.rfReqRecvDeleteFriend(Result, FromCharName);
    //return;    
}

function bool rfReqNotifyDisconnectHostInLoading(int Result, string ErrMsg, int HostID)
{
    return Owner.rfReqNotifyDisconnectHostInLoading(Result, ErrMsg, HostID);
    //return;    
}

function bool rfAckNotifyMyCharInfoToRoomUser(int Result, string ErrMsg, int UID, string UserName, int Grade, int TeamNum, byte Statue, byte IsHost, string UserIP, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, byte IsLookFor)
{
    return Owner.rfAckNotifyMyCharInfoToRoomUser(Result, ErrMsg, UID, UserName, Grade, TeamNum, Statue, IsHost, UserIP, ClanName, CM_Pattern, CM_BG, CM_BL, IsLookFor);
    //return;    
}

function bool rfAckRegisterMyUdpInfo(int Result, string ErrMsg)
{
    return Owner.rfAckRegisterMyUdpInfo(Result, ErrMsg);
    //return;    
}

function bool rfAckStartHolePunching(int Result, string ErrMsg, int GameType, int ReqStartUserID)
{
    return Owner.rfAckStartHolePunching(Result, ErrMsg, GameType, ReqStartUserID);
    //return;    
}

function bool rfReqRecvForceFailedClientLoading(int ErrCode)
{
    return Owner.rfReqRecvForceFailedClientLoading(ErrCode);
    //return;    
}

function bool rfAckAutoChangedTeamUserList(array<int> UserID, array<int> TeamNum)
{
    return Owner.rfAckAutoChangedTeamUserList(UserID, TeamNum);
    //return;    
}

function bool rfAckGetBotID(int Result, byte RequestedAFCount, byte RequestedRSACount, array<int> AFBotID, array<int> RSABotID)
{
    return Owner.rfAckGetBotID(Result, RequestedAFCount, RequestedRSACount, AFBotID, RSABotID);
    //return;    
}

function bool rfAckCheckEquipedWeaponDurability(int Result, array<BtrDouble> ItemUniqueID, array<int> ItemSlotNum)
{
    return Owner.rfAckCheckEquipedWeaponDurability(Result, ItemUniqueID, ItemSlotNum);
    //return;    
}

function bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    return Owner.rfAckChangedRoomTitle_FromGM(Result, RoomNumber, NewRoomTitle);
    //return;    
}

function bool rfAckRoomUserPingInfo(array<int> UnqueID, array<int> Ping, int HostPriorityPoint)
{
    return Owner.rfAckRoomUserPingInfo(UnqueID, Ping, HostPriorityPoint);
    //return;    
}

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    return Owner.rfAckNotifyAdjustClanMemberGrade(ClanName, CharName, CharGrade);
    //return;    
}

function bool rfReqInGameRoomUserInfoChanged()
{
    return Owner.rfReqInGameRoomUserInfoChanged();
    //return;    
}

function bool rfReqInGameRoomUserClanLevelChanged(int UserID, int ClanLevel)
{
    return Owner.rfReqInGameRoomUserClanLevelChanged(UserID, ClanLevel);
    //return;    
}

function bool rfAckNotifyUpdateCharInfo_LevelMark(string CharName, int LevelMarkID)
{
    return Owner.rfAckNotifyUpdateCharInfo_LevelMark(CharName, LevelMarkID);
    //return;    
}

function bool rfAckFriendPosition(int Result, string TargetCharName, byte ServerType, string fServername, string fServerShortName, string fServerIP, int fServerPort, byte CurPos, byte CurState, int ChannelNum, string ChannelNickName, int GameRoomNum)
{
    return Owner.rfAckFriendPosition(Result, TargetCharName, ServerType, fServername, fServerShortName, fServerIP, fServerPort, CurPos, CurState, ChannelNum, ChannelNickName, GameRoomNum);
    //return;    
}

function bool rfAckCharDetailInfo(int MaxSerial, int MaxScore, int MaxKill, int MaxAssist, int Serial3, int Serial5, int Serial7, int Serial10, int Serial15, int AR, int SMG, int SR, int SW, int Melee, int Grenade, int FlashBang, int Foot, int AT4, int MG, int Fire, int RPG7, int TimeBomb, int IcendiaryBomb, int ClusterBomb, int ByChopper, int Artillery, int KillChopper, int FirstKill, int LastKill, int AllKill, int Dominate, int InstallBomb, int DefuseBomb)
{
    return Owner.rfAckCharDetailInfo(MaxSerial, MaxScore, MaxKill, MaxAssist, Serial3, Serial5, Serial7, Serial10, Serial15, AR, SMG, SR, SW, Melee, Grenade, FlashBang, Foot, AT4, MG, Fire, RPG7, TimeBomb, IcendiaryBomb, ClusterBomb, ByChopper, Artillery, KillChopper, FirstKill, LastKill, AllKill, Dominate, InstallBomb, DefuseBomb);
    //return;    
}

function bool rfAckGetRankingInfoListStart(int Result, byte RankingType, byte CommunityType, int TotalCount)
{
    return Owner.rfAckGetRankingInfoListStart(Result, RankingType, CommunityType, TotalCount);
    //return;    
}

function bool rfAckGetRankingInfoList(int Result, byte RankingType, byte CommunityType, array<string> CharName, array<int> CharLevel, array<string> ClanName, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Ranking_Accum, array<int> Ranking_Accum_Prev, array<int> Ranking_Accum_Exp, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckGetRankingInfoList(Result, RankingType, CommunityType, CharName, CharLevel, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, Ranking_Accum, Ranking_Accum_Prev, Ranking_Accum_Exp, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckGetRankingInfoListEnd()
{
    return Owner.rfAckGetRankingInfoListEnd();
    //return;    
}

function bool rfNotifyNewNickName(int Community_Type, string Old_NickName, string New_NickName)
{
    Log("[BTPageRoomLobby_TCP::rfNotifyNewNickName()]  Community_Type = " $ string(Community_Type));
    return Owner.rfNotifyNewNickName(Community_Type, Old_NickName, New_NickName);
    //return;    
}

function bool rfNotifyNewClanName(string New_NickName)
{
    Log("[BTPageRoomLobby_TCP::rfNotifyNewClanName()]  New_NickName = " $ New_NickName);
    return Owner.rfNotifyNewClanName(New_NickName);
    //return;    
}

function bool rfNotifyClanLevelup(string ClanName, int Levelup)
{
    Log((("[BTPageRoomLobby_TCP::rfNotifyClanLevelup()]  ClanName = " $ ClanName) $ " Levelup = ") $ string(Levelup));
    return Owner.rfNotifyClanLevelup(ClanName, Levelup);
    //return;    
}

function bool rfAckUseItemDuringGame(int ErrorCode, string CharName, int ItemID, BtrDouble ItemUniqueID, int RemainCount)
{
    Log(((((((("[BTPageRoomLobby_TCP::rfAckUseItemDuringGame] ErrorCode:" $ string(ErrorCode)) $ " / CharName :") $ CharName) $ " /ItemID:") $ string(ItemID)) $ "/ItemUniqueID:") $ "/RemainCount:") $ string(RemainCount));
    return Owner.rfAckUseItemDuringGame(ErrorCode, CharName, ItemID, ItemUniqueID, RemainCount);
    //return;    
}

function bool rfAckShopItemListStart(int Count)
{
    return Owner.rfAckShopItemListStart(Count);
    //return;    
}

function bool rfAckShopItemList(array<int> ItemID)
{
    return Owner.rfAckShopItemList(ItemID);
    //return;    
}

function bool rfAckShopItemListEnd()
{
    return Owner.rfAckShopItemListEnd();
    //return;    
}
