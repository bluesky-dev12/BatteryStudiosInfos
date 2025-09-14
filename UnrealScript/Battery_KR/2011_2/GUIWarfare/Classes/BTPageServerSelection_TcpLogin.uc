class BTPageServerSelection_TcpLogin extends BTTcpLink_Login;

var export editinline BTPageServerSelection Owner;

function bool rfAckServerList(array<string> CServername, array<string> CServerShortName, array<string> serverIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel)
{
    return Owner.rfAckServerListFromLoginServer(CServername, CServerShortName, serverIP, serverPort, ChannelName, ChannelNickName, ChannelNum, chMaxUser, chCurUser, ServerGroupName, ServerGroupID, ServerDispOrder, DataPort, OptionCount_byte, OptionKey_byte, OptionValue_byte, OptionCount_int, OptionKey_int, OptionValue_int, OptionCount_float, OptionKey_float, OptionValue_float, IsClanChannel);
    //return;    
}

function bool rfAckFriendsList(byte ListType, array<string> UserName, array<string> CServername, array<string> ServerShortName, array<string> serverIP, array<int> serverPort, array<byte> CurPos, array<int> chNumber, array<string> ChannelNickName, array<int> rmNumber, array<int> CMarkPattern, array<int> CMarkBG, array<int> CMarkBL, array<string> Clanname, array<int> Level)
{
    return Owner.rfAckFriendsListFromLoginServer(ListType, UserName, CServername, ServerShortName, serverIP, serverPort, CurPos, chNumber, ChannelNickName, rmNumber, CMarkPattern, CMarkBG, CMarkBL, Clanname, Level);
    //return;    
}

function bool rfAckClanMemberListFromClient(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<string> ServerName, array<string> ServerShortName, array<string> serverIP, array<int> serverPort, array<byte> CurPos, array<int> ChannelNum, array<string> ChannelNickName, array<int> GameRoomNum)
{
    return Owner.rfAckClanMemberListFromClient(Result, ErrMsg, Level, CharName, ClanGrade, ServerName, ServerShortName, serverIP, serverPort, CurPos, ChannelNum, ChannelNickName, GameRoomNum);
    //return;    
}

function bool rfAckClanMemberListFromClientStart(int Result, int TotalCount)
{
    return Owner.rfAckClanMemberListFromClientStart(Result, TotalCount);
    //return;    
}

function bool rfAckClanMemberListFromClientEnd()
{
    return Owner.rfAckClanMemberListFromClientEnd();
    //return;    
}

function bool rfAckFriendsListStart(int Result, int TotalCount)
{
    return Owner.rfAckFriendsListStartFromLoginServer(Result, TotalCount);
    //return;    
}

function bool rfAckFriendsListEnd()
{
    return Owner.rfAckFriendsListEndFromLoginServer();
    //return;    
}

function bool rfAckCharInfo(int Result, string CharName, int Level, int Exp, string Clanname, byte ClanGrade, int CMarkPattern, int CMarkBG, int CMarkBL)
{
    return Owner.rfAckCharInfoFromLoginServer(Result, CharName, Level, Exp, Clanname, ClanGrade, CMarkPattern, CMarkBG, CMarkBL);
    //return;    
}

function bool rfAckPCBangUserListStart(int Result, int TotalCount)
{
    return Owner.rfAckPCBangUserListStartFromLoginServer(Result, TotalCount);
    //return;    
}

function bool rfAckPCBangUserList(array<string> FriendName, array<string> Clanname, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<string> fServername, array<string> fServerShortName, array<string> fServerIP, array<int> fServerPort, array<byte> CurPos, array<int> ChannelNum, array<string> ChannelNickName, array<int> GameRoomNum, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose)
{
    return Owner.rfAckPCBangUserListFromLoginServer(FriendName, Clanname, CM_Pattern, CM_BG, CM_BL, fServername, fServerShortName, fServerIP, fServerPort, CurPos, ChannelNum, ChannelNickName, GameRoomNum, Level, ClanGrade, ClanWin, ClanLose);
    //return;    
}

function bool rfAckPCBangUserListEnd()
{
    return Owner.rfAckPCBangUserListEndFromLoginServer();
    //return;    
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    return Owner.rfAckLoginInHouseTest(Sucess, CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, NeedChar, ErrMsg, BDay, Sex, ServerTime);
    //return;    
}

function bool rfAckClientChallenge(string Key1, BtrDouble Key2)
{
    return Owner.rfAckClientChallenge(Key1, Key2);
    //return;    
}

function bool rfAckClientChecksum(int Result)
{
    return Owner.rfAckClientChecksum(Result);
    //return;    
}
