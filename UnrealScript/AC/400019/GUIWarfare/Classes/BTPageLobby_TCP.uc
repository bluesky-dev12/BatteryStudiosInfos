class BTPageLobby_TCP extends BTTcpLink_Channel;

var export editinline BTPageLobby Owner;

function bool rfAckCreateGameRoom(int Result, string ErrMsg, int UserID, string RoomOwnerIP, GameRoomInfo NetRoomInfo)
{
    return Owner.rfAckCreateGameRoom(Result, ErrMsg, UserID, RoomOwnerIP, NetRoomInfo);
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckEnterChannel(id, UID, UserID, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckLeaveChannel(int Result, string UserID, int UID)
{
    return Owner.rfAckLeaveChannel(Result, UserID, UID);
    //return;    
}

function bool rfAckEnterRoom(int GameNum, int OwnerID, int UID, string UserID, int TeamNum, int Grade, string UserIP, string ClanName, int Clan_Mark_Pattern, int Clan_Mark_BG, int Clan_Mark_BL, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckEnterRoom(GameNum, OwnerID, UID, UserID, TeamNum, Grade, UserIP, ClanName, Clan_Mark_Pattern, Clan_Mark_BG, Clan_Mark_BL, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckRoomListStart(int Result, int TotalCount, int Count, int StartIndex)
{
    return Owner.rfAckRoomListStart(Result, TotalCount, Count, StartIndex);
    //return;    
}

function bool rfAckRoomList(array<int> GameNum, array<string> Title, array<string> MapName, array<int> MapNum, array<byte> UserCount, array<byte> MaxCount, array<string> ModeName, array<int> ModeNum, array<byte> WeaponLimit, array<byte> IsTeamBalance, array<byte> Status, array<string> RoomOwnerIP, array<int> GameMinute, array<string> RoomOwnerName, array<byte> IsSpecial, array<byte> IsPassword, array<byte> BotDifficult, array<byte> BotModeUserTeamNum)
{
    return Owner.rfAckRoomList(GameNum, Title, MapName, MapNum, UserCount, MaxCount, ModeName, ModeNum, WeaponLimit, IsTeamBalance, Status, RoomOwnerIP, GameMinute, RoomOwnerName, IsSpecial, IsPassword, BotDifficult, BotModeUserTeamNum);
    //return;    
}

function bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, array<int> UID, array<string> UserID, array<int> UserLevels, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, int Result, string ErrMsg, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckChannelUserList(TotalCount, Count, StartIndex, UID, UserID, UserLevels, ClanName, ClanPattern, ClanBG, ClanBL, ClanGrade, ClanWin, ClanLose, IsLookForClan, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckGameRoomDestroy(int GameRoomNum)
{
    return Owner.rfAckGameRoomDestroy(GameRoomNum);
    //return;    
}

function bool rfReqExteriorRoomInfo(int SP, int RoomNumber, byte IsPW, string RoomName, string MapName, string ModeName, int MapNum, int ModeNum, byte IsTeamBalance, int MaxUserCount, int RoomUserCount, byte RoomState, byte BotDifficult, byte WeaponLimit, byte BotModeUserTeamNum)
{
    return Owner.rfReqExteriorRoomInfo(SP, RoomNumber, IsPW, RoomName, MapName, ModeName, MapNum, ModeNum, IsTeamBalance, MaxUserCount, RoomUserCount, RoomState, BotDifficult, WeaponLimit, BotModeUserTeamNum);
    //return;    
}

function bool rfReqExteriorRoomUserCount(int RoomNumber, int RoomUserCount)
{
    return Owner.rfReqExteriorRoomUserCount(RoomNumber, RoomUserCount);
    //return;    
}

function bool rfReqExteriorRoomState(int RoomNumber, byte RoomState)
{
    return Owner.rfReqExteriorRoomState(RoomNumber, RoomState);
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

function bool rfAckGameRoomInfo(int Result, string ErrMsg, GameRoomInfo RoomInfo)
{
    return Owner.rfAckGameRoomInfo(Result, ErrMsg, RoomInfo);
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

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    return Owner.rfAckNotifyAdjustClanMemberGrade(ClanName, CharName, CharGrade);
    //return;    
}

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    return Owner.rfAckChatWispher(Result, ErrMsg, ToCharName);
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

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string ClanName, string CharName, byte CharGrade)
{
    return Owner.rfAckAdjustClanMemberGrade(Result, ErrMsg, ClanName, CharName, CharGrade);
    //return;    
}

function bool rfAckClanMatch_Join(int Result, string ErrMsg)
{
    return Owner.rfAckClanMatch_Join(Result, ErrMsg);
    //return;    
}

function bool rfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    return Owner.rfAckClanMatch_GetReady(Result, ErrMsg, RoomIndex);
    //return;    
}

function bool rfAckQuestGetAvailableEventList(int Result, string ErrMsg, array<int> QuestID)
{
    return Owner.rfAckQuestGetAvailableEventList(Result, ErrMsg, QuestID);
    //return;    
}

function bool rfReqExteriorRoomOwnerInfo(int RoomNum, string OwnerName, string OwnerIP)
{
    return Owner.rfReqExteriorRoomOwnerInfo(RoomNum, OwnerName, OwnerIP);
    //return;    
}

function bool rfAckClanMatch_StartPublicWaitRoomList(int Result, string ErrMsg, int Count)
{
    return Owner.rfAckClanMatch_StartPublicWaitRoomList(Result, ErrMsg, Count);
    //return;    
}

function bool rfAckClanMatch_PublicWaitRoomList(array<int> WaitRoomIdx, array<string> LeaderName, array<string> RoomName, array<int> MapNum, array<int> CurUserCount, array<int> MaxUserCount, array<byte> Status)
{
    return Owner.rfAckClanMatch_PublicWaitRoomList(WaitRoomIdx, LeaderName, RoomName, MapNum, CurUserCount, MaxUserCount, Status);
    //return;    
}

function bool rfAckClanMatch_EndPublicWaitRoomList()
{
    return Owner.rfAckClanMatch_EndPublicWaitRoomList();
    //return;    
}

function bool rfAckChangedRoomTitle_FromGM(int Result, int RoomNumber, string NewRoomTitle)
{
    return Owner.rfAckChangedRoomTitle_FromGM(Result, RoomNumber, NewRoomTitle);
    //return;    
}

function bool rfAckNotifyStartTutorial(int Result, int UserID)
{
    return Owner.rfAckNotifyStartTutorial(Result, UserID);
    //return;    
}

function bool rfAckNotifyEndTutorial(int UserID, string CharName, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckNotifyEndTutorial(UserID, CharName, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckClanMatch_PublicWaitRoomChanged(int WaitRoomIdx, string RoomName, int MapNum, int CurUserCount, int MaxUserCount, byte Status, byte IsPublic)
{
    return Owner.rfAckClanMatch_PublicWaitRoomChanged(WaitRoomIdx, RoomName, MapNum, CurUserCount, MaxUserCount, Status, IsPublic);
    //return;    
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    return Owner.rfAckLogOut(Result, Reason);
    //return;    
}

function bool rfAckMoveToLobby(byte MessageType)
{
    Log("[BTPageLobby_TCP::rfAckMoveToLobby()]  MessageType = " $ string(MessageType));
    return Owner.rfAckMoveToLobby(MessageType);
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
    Log("[BTPageLobby_TCP::rfNotifyNewNickName()]  Community_Type = " $ string(Community_Type));
    return Owner.rfNotifyNewNickName(Community_Type, Old_NickName, New_NickName);
    //return;    
}

function bool rfNotifyNewClanName(string New_NickName)
{
    Log("[BTPageLobby_TCP::rfNotifyNewClanName()]  New_NickName = " $ New_NickName);
    return Owner.rfNotifyNewClanName(New_NickName);
    //return;    
}

function bool rfNotifyClanLevelup(string ClanName, int Levelup)
{
    Log((("[BTPageLobby_TCP::rfNotifyClanLevelup()]  ClanName = " $ ClanName) $ " Levelup = ") $ string(Levelup));
    return Owner.rfNotifyClanLevelup(ClanName, Levelup);
    //return;    
}
