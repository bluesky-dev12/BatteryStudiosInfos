class BTPageClan_TCP extends BTTcpLink_Channel;

var export editinline BTPageClan Owner;

function bool rfReqRecvClanInvite(string InviterCharname, string Clanname, string InviteMsg)
{
    return Owner.rfReqRecvClanInvite(InviterCharname, Clanname, InviteMsg);
    //return;    
}

function bool rfAckClanUserListStart(int Result, int TotalCount)
{
    return Owner.rfAckClanUserListStart(Result, TotalCount);
    //return;    
}

function bool rfAckClanUserList(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<string> ServerName, array<string> ServerShortName, array<string> serverIP, array<int> serverPort, array<byte> CurPos, array<int> ChannelNum, array<string> ChannelNickName, array<int> GameRoomNum, array<byte> IsCombat, array<int> ClanWinCnt, array<int> ClanLoseCnt, array<string> ClanSelfIntro, array<int> LevelMarkID, array<int> TitleMarkID, array<int> Reserved1, array<int> Reserved2, array<int> Reserved3)
{
    return Owner.rfAckClanUserList(Result, ErrMsg, Level, CharName, ClanGrade, ServerName, ServerShortName, serverIP, serverPort, CurPos, ChannelNum, ChannelNickName, GameRoomNum, IsCombat, ClanWinCnt, ClanLoseCnt, ClanSelfIntro, LevelMarkID, TitleMarkID, Reserved1, Reserved2, Reserved3);
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

function bool rfAckClanClose(int Result, string ErrMsg, string Clanname)
{
    return Owner.rfAckClanClose(Result, ErrMsg, Clanname);
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

function bool rfAckSearchClan(int Result, string ErrMsg, int TotalPage, array<int> ClanMarkPattern, array<int> ClanMarkBG, array<byte> ClanMarkBL, array<string> Clanname, array<string> ClanMaster, array<int> ClanMember, array<int> ClanMemberMax, array<int> ClanCreateDate, array<int> ClanWin, array<int> ClanLose, array<int> ClanDraw, array<int> ClanRank, array<byte> ClanRecruit, array<int> ClanLevel)
{
    return Owner.rfAckSearchClan(Result, ErrMsg, TotalPage, ClanMarkPattern, ClanMarkBG, ClanMarkBL, Clanname, ClanMaster, ClanMember, ClanMemberMax, ClanCreateDate, ClanWin, ClanLose, ClanDraw, ClanRank, ClanRecruit, ClanLevel);
    //return;    
}

function bool rfAckClanCharPersonelIntro(int Result, string ErrMsg, string PersonelIntro)
{
    return Owner.rfAckClanCharPersonelIntro(Result, ErrMsg, PersonelIntro);
    //return;    
}

function bool rfAckAdjustClanMemberGrade(int Result, string ErrMsg, string Clanname, string CharName, byte CharGrade)
{
    return Owner.rfAckAdjustClanMemberGrade(Result, ErrMsg, Clanname, CharName, CharGrade);
    //return;    
}

function bool rfAckNotifyAdjustClanMemberGrade(string Clanname, string CharName, byte CharGrade)
{
    return Owner.rfAckNotifyAdjustClanMemberGrade(Clanname, CharName, CharGrade);
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
