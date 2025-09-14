class BTPageClan_TCP extends BTTcpLink_Channel;

var export editinline BTPageClan Owner;

function bool rfReqRecvClanInvite(int InviterUserDBID, string InviterCharname, string ClanName, string InviteMsg)
{
    return Owner.rfReqRecvClanInvite(InviterUserDBID, InviterCharname, ClanName, InviteMsg);
    //return;    
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    return Owner.rfAckClanUserListStart(Result, TotalCount);
    //return;    
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<int> LevelMarkID, array<int> TitleMarkID, array<int> DudeId)
{
    return Owner.rfAckClanUserList(Result, ErrMsg, Level, CharName, ClanGrade, ClanWinCnt, ClanLoseCnt, LevelMarkID, TitleMarkID, DudeId);
    //return;    
}

function bool rfAckClanUserListEnd()
{
    return Owner.rfAckClanUserListEnd();
    //return;    
}

function bool rfAckClanNews(array<string> IssueDate, array<byte> IssueType, array<string> IssuedClanMember)
{
    return Owner.rfAckClanNews(IssueDate, IssueType, IssuedClanMember);
    //return;    
}

function bool rfAckClanClose(int Result, string ErrMsg, string ClanName)
{
    return Owner.rfAckClanClose(Result, ErrMsg, ClanName);
    //return;    
}

function bool rfAckClanSecession(int Result, string ErrMsg)
{
    return Owner.rfAckClanSecession(Result, ErrMsg);
    //return;    
}

function bool rfAckClanChangeInfo(int Result, string ErrMsg)
{
    return Owner.rfAckClanChangeInfo(Result, ErrMsg);
    //return;    
}

function bool rfAckClanPersonelIntro(int Result, string ErrMsg)
{
    return Owner.rfAckClanPersonelIntro(Result, ErrMsg);
    //return;    
}

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> ClanName, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    return Owner.rfAckSearchClan(Result, ErrMsg, TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, ClanName, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    //return;    
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    return Owner.rfAckClanCharPersonelIntro(Result, ErrMsg, PersonelIntro);
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

function bool rfAckChatWispher(int Result, string ErrMsg, string ToCharName)
{
    return Owner.rfAckChatWispher(Result, ErrMsg, ToCharName);
    //return;    
}

function bool rfAckClanMatchResultHistory(array<BtrDouble> MatchDate, array<byte> IsWin, array<string> EnemyClanname)
{
    return Owner.rfAckClanMatchResultHistory(MatchDate, IsWin, EnemyClanname);
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

function bool rfAckDBCharInfo(int Result, string ErrMsg, string CharName, string ClanName, int CM_Pattern, int CM_BG, int CM_BL, string ClanPersonIntro, int MainWeaponItemID, int MainWeaponPartID, int SubWeaponItemID, int SubWeaponPartID, int AFSpecialCostumeItemID, int RSASpecialCostumeItemID, CharInfo stCharInfo, int ClanLevel)
{
    return Owner.rfAckDBCharInfo(Result, ErrMsg, CharName, ClanName, CM_Pattern, CM_BG, CM_BL, ClanPersonIntro, MainWeaponItemID, MainWeaponPartID, SubWeaponItemID, SubWeaponPartID, AFSpecialCostumeItemID, RSASpecialCostumeItemID, stCharInfo, ClanLevel);
    //return;    
}
