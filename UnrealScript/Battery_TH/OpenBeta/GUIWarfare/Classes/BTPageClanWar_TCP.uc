class BTPageClanWar_TCP extends BTTcpLink_Channel;

var export editinline BTPageClanWar Owner;

function bool rfAckClanMatch_GetReady(int Result, string ErrMsg, int RoomIndex)
{
    return Owner.rfAckClanMatch_GetReady(Result, ErrMsg, RoomIndex);
    //return;    
}

function bool rfAckClanMatch_StartCombat(int Result, string ErrMsg)
{
    return Owner.rfAckClanMatch_StartCombat(Result, ErrMsg);
    //return;    
}

function bool rfAckClanMatch_NotifiyStartCombat(array<int> MapNumArray, int VersusMode)
{
    return Owner.rfAckClanMatch_NotifiyStartCombat(MapNumArray, VersusMode);
    //return;    
}

function bool rfAckClanMatch_Join(int Result, string ErrMsg)
{
    return Owner.rfAckClanMatch_Join(Result, ErrMsg);
    //return;    
}

function bool rfAckClanMatch_JoinNotify(byte IsLeader, int ClanMarkPA, int ClanMarkBG, int ClanMarkBL, int Level, string CharName, int ClanGrade, int ClanWin, int ClanLose, string ClanName, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckClanMatch_JoinNotify(IsLeader, ClanMarkPA, ClanMarkBG, ClanMarkBL, Level, CharName, ClanGrade, ClanWin, ClanLose, ClanName, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckClanMatch_LeaveNotify(string CharName)
{
    return Owner.rfAckClanMatch_LeaveNotify(CharName);
    //return;    
}

function bool rfAckClanMatch_MemberList(array<byte> IsLeader, array<int> ClanMarkPA, array<int> ClanMarkBG, array<int> ClanMarkBL, array<int> Level, array<string> CharName, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<string> ClanName, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckClanMatch_MemberList(IsLeader, ClanMarkPA, ClanMarkBG, ClanMarkBL, Level, CharName, ClanGrade, ClanWin, ClanLose, ClanName, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckClanMatch_Leave(int Result, string ErrMsg)
{
    return Owner.rfAckClanMatch_Leave(Result, ErrMsg);
    //return;    
}

function bool rfAckClanMatch_Chat(int Result, string ErrMsg, string CharName, string Msg)
{
    return Owner.rfAckClanMatch_Chat(Result, ErrMsg, CharName, Msg);
    //return;    
}

function bool rfAckClanMatch_WaittingTeamList(int TtotlCount, array<int> Grade, array<int> Map, array<int> Versus)
{
    return Owner.rfAckClanMatch_WaittingTeamList(TtotlCount, Grade, Map, Versus);
    //return;    
}

function bool rfAckClanMatch_ChangeLeader(int Result, string ErrMsg, int NewLeader, string NewLeaderName)
{
    return Owner.rfAckClanMatch_ChangeLeader(Result, ErrMsg, NewLeader, NewLeaderName);
    //return;    
}

function bool rfAckClanMatch_StartSearching(int Result, string ErrMsg, int ShouldWaitMore)
{
    return Owner.rfAckClanMatch_StartSearching(Result, ErrMsg, ShouldWaitMore);
    //return;    
}

function bool rfAckClanMatch_NotifyStartSearching(int ShouldWaitMore)
{
    return Owner.rfAckClanMatch_NotifyStartSearching(ShouldWaitMore);
    //return;    
}

function bool rfReqClanMatch_FoundMatch(int ChannelID, int RoomNumber)
{
    return Owner.rfReqClanMatch_FoundMatch(ChannelID, RoomNumber);
    //return;    
}

function bool rfAckClanMatch_StopSearching()
{
    return Owner.rfAckClanMatch_StopSearching();
    //return;    
}

function bool rfAckClanMatch_SetWaitRoomPublic(int Result, string ErrMsg, byte Set)
{
    return Owner.rfAckClanMatch_SetWaitRoomPublic(Result, ErrMsg, Set);
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

function bool rfAckFriendListStart(int Result, int TotalCount)
{
    return Owner.rfAckFriendListStart(Result, TotalCount);
    //return;    
}

function bool rfAckFriendList(array<string> FriendName, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<string> fServername, array<string> fServerShortName, array<string> fServerIP, array<int> fServerPort, array<byte> CurPos, array<int> ChannelNum, array<string> ChannelNickName, array<int> GameRoomNum, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckFriendList(FriendName, ClanName, CM_Pattern, CM_BG, CM_BL, fServername, fServerShortName, fServerIP, fServerPort, CurPos, ChannelNum, ChannelNickName, GameRoomNum, Level, ClanGrade, ClanWin, ClanLose, IsLookForClan, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckFriendListEnd()
{
    return Owner.rfAckFriendListEnd();
    //return;    
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    return Owner.rfAckClanUserListStart(Result, TotalCount);
    //return;    
}

function bool rfAckClanUserListEnd()
{
    return Owner.rfAckClanUserListEnd();
    //return;    
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<string> ServerName, array<string> ServerShortName, array<string> ServerIP, array<int> ServerPort, array<byte> CurPos, array<int> ChannelNum, array<string> ChannelNickName, array<int> GameRoomNum, array<byte> IsCombat, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<string> ClanSelfIntro, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckClanUserList(Result, ErrMsg, Level, CharName, ClanGrade, ServerName, ServerShortName, ServerIP, ServerPort, CurPos, ChannelNum, ChannelNickName, GameRoomNum, IsCombat, ClanWinCnt, ClanLoseCnt, ClanSelfIntro, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckChannelUserList(int TotalCount, int Count, int StartIndex, array<int> UID, array<string> UserID, array<int> UserLevels, array<string> ClanName, array<int> ClanPattern, array<int> ClanBG, array<int> ClanBL, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose, array<byte> IsLookForClan, int Result, string ErrMsg, array<int> ClanLevel, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckChannelUserList(TotalCount, Count, StartIndex, UID, UserID, UserLevels, ClanName, ClanPattern, ClanBG, ClanBL, ClanGrade, ClanWin, ClanLose, IsLookForClan, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckDupCheckClanName(int Result, string ErrMsg)
{
    return Owner.rfAckDupCheckClanName(Result, ErrMsg);
    //return;    
}

function bool rfAckCreateClan(int Result, string ErrMsg, BtrDouble ItemIdx, int StackCount)
{
    return Owner.rfAckCreateClan(Result, ErrMsg, ItemIdx, StackCount);
    //return;    
}

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    return Owner.rfAckDBCharInfo(Result, ErrMsg, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, ClanPersonIntro, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo, ClanLevel);
    //return;    
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    return Owner.rfAckClanCharPersonelIntro(Result, ErrMsg, PersonelIntro);
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

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    return Owner.rfAckSearchClan(Result, ErrMsg, TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
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

function bool rfAckNotifyAdjustClanMemberGrade(string ClanName, string CharName, byte CharGrade)
{
    return Owner.rfAckNotifyAdjustClanMemberGrade(ClanName, CharName, CharGrade);
    //return;    
}

function bool rfAckEnterChannel(int id, int UID, string UserID, int Level, string ClanName, int ClanMarkPattern, int ClanMarkBG, int ClanMarkBL, int ClanGrade, int ClanWin, int ClanLose, byte IsLookFor, int Result, string ErrMsg, int ClanLevel, int LevelMarkID, int TitleMarkID, int Reserved1, int Reserved2, int Reserved3)
{
    return Owner.rfAckEnterChannel(id, UID, UserID, Level, ClanName, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanGrade, ClanWin, ClanLose, IsLookFor, Result, ErrMsg, ClanLevel, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
    //return;    
}

function bool rfAckClanMatch_GetClanWaittingRoomInfo(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, string WaitRoomName)
{
    return Owner.rfAckClanMatch_GetClanWaittingRoomInfo(WaitRoomIndex, Result, ErrMsg, MapNumArray, VersusMode, WaitRoomName);
    //return;    
}

function bool rfAckClanMatch_ChangeRoomSetting(int WaitRoomIndex, int Result, string ErrMsg, array<int> MapNumArray, int VersusMode, byte IsPublic)
{
    return Owner.rfAckClanMatch_ChangeRoomSetting(WaitRoomIndex, Result, ErrMsg, MapNumArray, VersusMode, IsPublic);
    //return;    
}
