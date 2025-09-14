class BTTcpLink_Login extends Object
    native;

// Export UBTTcpLink_Login::execInitNetwork(FFrame&, void* const)
native function bool InitNetwork();

// Export UBTTcpLink_Login::execConnect(FFrame&, void* const)
native function bool Connect(string sIpaddr, int nPort)
{
    //native.sIpaddr;
    //native.nPort;        
}

// Export UBTTcpLink_Login::execConnectDomain(FFrame&, void* const)
native function bool ConnectDomain(string domain, int nPort)
{
    //native.domain;
    //native.nPort;        
}

// Export UBTTcpLink_Login::execClose(FFrame&, void* const)
native function bool Close();

event OnConnect(int ErrCode)
{
    Log("Socket Connected!");
    //return;    
}

event OnClose(int ErrCode)
{
    Log("Socket Closed!");
    //return;    
}

event OnError(int ErrCode)
{
    Log("Socket Error!");
    //return;    
}

event bool rfReqHash(int HashField0, int HashField1, int HashField2, int HashField3)
{
    return false;
    //return;    
}

event bool rfAckHash(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfAckExceedMaxUser()
{
    return false;
    //return;    
}

event bool rfReqLogin(string PortalID)
{
    return false;
    //return;    
}

event bool rfAckLogin(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqHeadItemTypeList()
{
    return false;
    //return;    
}

event bool rfAckHeadItemTypeList(array<int> HeadItemID)
{
    return false;
    //return;    
}

event bool rfReqHelmetItemTypeList()
{
    return false;
    //return;    
}

event bool rfAckHelmetItemTypeList(array<string> HelmetItemName, array<int> HelmetItemID)
{
    return false;
    //return;    
}

event bool rfReqAccesItemTypeList()
{
    return false;
    //return;    
}

event bool rfAckAccesItemTypeList(array<string> AccesoItemName, array<int> AccesoItemID)
{
    return false;
    //return;    
}

event bool rfReqCreateChar(string CharName, int HeadItemID, int HelmetItemID, int AccesoItemID, int BackpackItemID, int PouchItemID, int CamouflageItemID)
{
    return false;
    //return;    
}

event bool rfAckCreateChar(int Success, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqServerList()
{
    return false;
    //return;    
}

event bool rfAckServerList(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    return false;
    //return;    
}

event bool rfReqConnectChannelServer(string ServerIP, int serverPort)
{
    return false;
    //return;    
}

event bool rfAckConnectChannelServer(string SessionKey, int TimeStamp)
{
    return false;
    //return;    
}

event bool rfReqFriendsList()
{
    return false;
    //return;    
}

event bool rfAckFriendsListStart(int Result, int TotalCount)
{
    return false;
    //return;    
}

event bool rfAckFriendsList(byte ListType, array<string> UserName, array<byte> IsLogOn, array<int> CMarkPattern, array<int> CMarkBG, array<int> CMarkBL, array<string> ClanName, array<int> Level)
{
    return false;
    //return;    
}

event bool rfAckFriendsListEnd()
{
    return false;
    //return;    
}

event bool rfReqUserDetailInfo(int UserID, string UserName)
{
    return false;
    //return;    
}

event bool rfAckUserDetailInfo(int Result, string UserName, string ClanName, int Ranking, int MatchNum, int WinNum, int LoseNum, int CurrentEXP, int NextExp, int ForcedDisconnectedNum, int PrimaryWeaponID, int SubWeaponID, int Point)
{
    return false;
    //return;    
}

event bool rfReqAdvertisement()
{
    return false;
    //return;    
}

event bool rfAckAdvertisement(int Result, byte Type, string Address)
{
    return false;
    //return;    
}

event bool rfReqLoginInHouseTest(string UserName, string Password, string Guid)
{
    return false;
    //return;    
}

event bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    return false;
    //return;    
}

event bool rfReqProcessPreLoginUser(string CharName, byte Type)
{
    return false;
    //return;    
}

event bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqLoginWithWZAuth(string AccountID, string Guid, string AuthKey)
{
    return false;
    //return;    
}

event bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    return false;
    //return;    
}

event bool rfReqClanMemberListFromClient()
{
    return false;
    //return;    
}

event bool rfAckClanMemberListFromClientStart(int Result, int TotalCount)
{
    return false;
    //return;    
}

event bool rfAckClanMemberListFromClient(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<string> ServerName, array<string> ServerShortName, array<string> ServerIP, array<int> serverPort, array<byte> CurPos, array<int> ChannelNum, array<string> ChannelNickName, array<int> GameRoomNum)
{
    return false;
    //return;    
}

event bool rfAckClanMemberListFromClientEnd()
{
    return false;
    //return;    
}

event bool rfAckMaxUserExceed()
{
    return false;
    //return;    
}

event bool rfReqKeepAlive()
{
    return false;
    //return;    
}

event bool rfReqForceLogoutByOwner()
{
    return false;
    //return;    
}

event bool rfReqCharInfo(string CharName)
{
    return false;
    //return;    
}

event bool rfAckCharInfo(int Result, string CharName, int Level, int Exp, string ClanName)
{
    return false;
    //return;    
}

event bool rfReqRegisteredPCBangInfo()
{
    return false;
    //return;    
}

event bool rfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    return false;
    //return;    
}

event bool rfReqPCBangUserList()
{
    return false;
    //return;    
}

event bool rfAckPCBangUserListStart(int Result, int TotalCount)
{
    return false;
    //return;    
}

event bool rfAckPCBangUserList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose)
{
    return false;
    //return;    
}

event bool rfAckPCBangUserListEnd()
{
    return false;
    //return;    
}

event bool rfReqRegisterMainPCBang()
{
    return false;
    //return;    
}

event bool rfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    return false;
    //return;    
}

event bool rfReqGetCharBlockInfo()
{
    return false;
    //return;    
}

event bool rfAckGetCharBlockInfo(int Result, byte IsAccountBlock, byte IsChattingBlock, BtrDouble ChattingBlockEndTime, array<string> BlockedItemName)
{
    return false;
    //return;    
}

event bool rfReqServerTime()
{
    return false;
    //return;    
}

event bool rfAckServerTime(int Time)
{
    return false;
    //return;    
}

event bool rfReqClientChallenge()
{
    return false;
    //return;    
}

event bool rfAckClientChallenge(string Key1, BtrDouble Key2)
{
    return false;
    //return;    
}

event bool rfReqClientChecksum(string Key1, BtrDouble Key2)
{
    return false;
    //return;    
}

event bool rfAckClientChecksum(int Result)
{
    return false;
    //return;    
}

event bool rfReqErrorReportServerAddr()
{
    return false;
    //return;    
}

event bool rfAckErrorReportServerAddr(string Addr, int Port)
{
    return false;
    //return;    
}

event bool rfReqEventNotify()
{
    return false;
    //return;    
}

event bool rfAckEventNotify(int Type)
{
    return false;
    //return;    
}

event bool rfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec)
{
    return false;
    //return;    
}

event bool rfReqLoginWithTencentAuth(string AccountID, array<byte> Signature)
{
    return false;
    //return;    
}

event bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    return false;
    //return;    
}

event bool rfReqLogOut(byte Reason)
{
    return false;
    //return;    
}

event bool rfAckLogOut(byte Result, byte Reason)
{
    return false;
    //return;    
}

event bool rfReqLoginWithThailand(string USN, int BloodDisplayType, int PCBangType, string UnixTimeStamp, string HashValue, byte Sex)
{
    return false;
    //return;    
}

event bool rfAckLoginWithThailand(int Result)
{
    return false;
    //return;    
}

event bool rfReqLoginWithGlobal(string G_AccountID, string G_GUID, string G_AuthKey, int UserType)
{
    return false;
    //return;    
}

event bool rfAckLoginWithGlobal(int Result)
{
    return false;
    //return;    
}

event bool rfReqLoginWithIndonesia(string HashValue)
{
    return false;
    //return;    
}

event bool rfAckLoginWithIndonesia(int Result)
{
    return false;
    //return;    
}

// Export UBTTcpLink_Login::execsfReqHash(FFrame&, void* const)
native function bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3)
{
    //native.HashField0;
    //native.HashField1;
    //native.HashField2;
    //native.HashField3;        
}

// Export UBTTcpLink_Login::execsfAckHash(FFrame&, void* const)
native function bool sfAckHash(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Login::execsfAckExceedMaxUser(FFrame&, void* const)
native function bool sfAckExceedMaxUser();

// Export UBTTcpLink_Login::execsfReqLogin(FFrame&, void* const)
native function bool sfReqLogin(string PortalID)
{
    //native.PortalID;        
}

// Export UBTTcpLink_Login::execsfAckLogin(FFrame&, void* const)
native function bool sfAckLogin(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg)
{
    //native.Sucess;
    //native.CharName;
    //native.TimeStamp;
    //native.LoginHash1;
    //native.LoginHash2;
    //native.LoginHash3;
    //native.LoginHash4;
    //native.LoginHash5;
    //native.NeedChar;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Login::execsfReqHeadItemTypeList(FFrame&, void* const)
native function bool sfReqHeadItemTypeList();

// Export UBTTcpLink_Login::execsfAckHeadItemTypeList(FFrame&, void* const)
native function bool sfAckHeadItemTypeList(array<int> HeadItemID)
{
    //native.HeadItemID;        
}

// Export UBTTcpLink_Login::execsfReqHelmetItemTypeList(FFrame&, void* const)
native function bool sfReqHelmetItemTypeList();

// Export UBTTcpLink_Login::execsfAckHelmetItemTypeList(FFrame&, void* const)
native function bool sfAckHelmetItemTypeList(array<string> HelmetItemName, array<int> HelmetItemID)
{
    //native.HelmetItemName;
    //native.HelmetItemID;        
}

// Export UBTTcpLink_Login::execsfReqAccesItemTypeList(FFrame&, void* const)
native function bool sfReqAccesItemTypeList();

// Export UBTTcpLink_Login::execsfAckAccesItemTypeList(FFrame&, void* const)
native function bool sfAckAccesItemTypeList(array<string> AccesoItemName, array<int> AccesoItemID)
{
    //native.AccesoItemName;
    //native.AccesoItemID;        
}

// Export UBTTcpLink_Login::execsfReqCreateChar(FFrame&, void* const)
native function bool sfReqCreateChar(string CharName, int HeadItemID, int HelmetItemID, int AccesoItemID, int BackpackItemID, int PouchItemID, int CamouflageItemID)
{
    //native.CharName;
    //native.HeadItemID;
    //native.HelmetItemID;
    //native.AccesoItemID;
    //native.BackpackItemID;
    //native.PouchItemID;
    //native.CamouflageItemID;        
}

// Export UBTTcpLink_Login::execsfAckCreateChar(FFrame&, void* const)
native function bool sfAckCreateChar(int Success, string ErrMsg)
{
    //native.Success;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Login::execsfReqServerList(FFrame&, void* const)
native function bool sfReqServerList();

// Export UBTTcpLink_Login::execsfAckServerList(FFrame&, void* const)
native function bool sfAckServerList(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    //native.CServername;
    //native.CServerShortName;
    //native.ServerIP;
    //native.serverPort;
    //native.ChannelName;
    //native.ChannelNickName;
    //native.ChannelNum;
    //native.chMaxUser;
    //native.chCurUser;
    //native.ServerGroupName;
    //native.ServerGroupID;
    //native.ServerDispOrder;
    //native.DataPort;
    //native.OptionCount_byte;
    //native.OptionKey_byte;
    //native.OptionValue_byte;
    //native.OptionCount_int;
    //native.OptionKey_int;
    //native.OptionValue_int;
    //native.OptionCount_float;
    //native.OptionKey_float;
    //native.OptionValue_float;
    //native.IsClanChannel;
    //native.IsUseDedicateHost;        
}

// Export UBTTcpLink_Login::execsfReqConnectChannelServer(FFrame&, void* const)
native function bool sfReqConnectChannelServer(string ServerIP, int serverPort)
{
    //native.ServerIP;
    //native.serverPort;        
}

// Export UBTTcpLink_Login::execsfAckConnectChannelServer(FFrame&, void* const)
native function bool sfAckConnectChannelServer(string SessionKey, int TimeStamp)
{
    //native.SessionKey;
    //native.TimeStamp;        
}

// Export UBTTcpLink_Login::execsfReqFriendsList(FFrame&, void* const)
native function bool sfReqFriendsList();

// Export UBTTcpLink_Login::execsfAckFriendsListStart(FFrame&, void* const)
native function bool sfAckFriendsListStart(int Result, int TotalCount)
{
    //native.Result;
    //native.TotalCount;        
}

// Export UBTTcpLink_Login::execsfAckFriendsList(FFrame&, void* const)
native function bool sfAckFriendsList(byte ListType, array<string> UserName, array<byte> IsLogOn, array<int> CMarkPattern, array<int> CMarkBG, array<int> CMarkBL, array<string> ClanName, array<int> Level)
{
    //native.ListType;
    //native.UserName;
    //native.IsLogOn;
    //native.CMarkPattern;
    //native.CMarkBG;
    //native.CMarkBL;
    //native.ClanName;
    //native.Level;        
}

// Export UBTTcpLink_Login::execsfAckFriendsListEnd(FFrame&, void* const)
native function bool sfAckFriendsListEnd();

// Export UBTTcpLink_Login::execsfReqUserDetailInfo(FFrame&, void* const)
native function bool sfReqUserDetailInfo(int UserID, string UserName)
{
    //native.UserID;
    //native.UserName;        
}

// Export UBTTcpLink_Login::execsfAckUserDetailInfo(FFrame&, void* const)
native function bool sfAckUserDetailInfo(int Result, string UserName, string ClanName, int Ranking, int MatchNum, int WinNum, int LoseNum, int CurrentEXP, int NextExp, int ForcedDisconnectedNum, int PrimaryWeaponID, int SubWeaponID, int Point)
{
    //native.Result;
    //native.UserName;
    //native.ClanName;
    //native.Ranking;
    //native.MatchNum;
    //native.WinNum;
    //native.LoseNum;
    //native.CurrentEXP;
    //native.NextExp;
    //native.ForcedDisconnectedNum;
    //native.PrimaryWeaponID;
    //native.SubWeaponID;
    //native.Point;        
}

// Export UBTTcpLink_Login::execsfReqAdvertisement(FFrame&, void* const)
native function bool sfReqAdvertisement();

// Export UBTTcpLink_Login::execsfAckAdvertisement(FFrame&, void* const)
native function bool sfAckAdvertisement(int Result, byte Type, string Address)
{
    //native.Result;
    //native.Type;
    //native.Address;        
}

// Export UBTTcpLink_Login::execsfReqLoginInHouseTest(FFrame&, void* const)
native function bool sfReqLoginInHouseTest(string UserName, string Password, string Guid)
{
    //native.UserName;
    //native.Password;
    //native.Guid;        
}

// Export UBTTcpLink_Login::execsfAckLoginInHouseTest(FFrame&, void* const)
native function bool sfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    //native.Sucess;
    //native.CharName;
    //native.TimeStamp;
    //native.LoginHash1;
    //native.LoginHash2;
    //native.LoginHash3;
    //native.LoginHash4;
    //native.LoginHash5;
    //native.NeedChar;
    //native.ErrMsg;
    //native.BDay;
    //native.Sex;
    //native.ServerTime;        
}

// Export UBTTcpLink_Login::execsfReqProcessPreLoginUser(FFrame&, void* const)
native function bool sfReqProcessPreLoginUser(string CharName, byte Type)
{
    //native.CharName;
    //native.Type;        
}

// Export UBTTcpLink_Login::execsfAckProcessPreLoginUser(FFrame&, void* const)
native function bool sfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Login::execsfReqLoginWithWZAuth(FFrame&, void* const)
native function bool sfReqLoginWithWZAuth(string AccountID, string Guid, string AuthKey)
{
    //native.AccountID;
    //native.Guid;
    //native.AuthKey;        
}

// Export UBTTcpLink_Login::execsfAckLoginWithWZAuth(FFrame&, void* const)
native function bool sfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    //native.Result;
    //native.wzp_AccountType;
    //native.wzp_IsBlock;
    //native.wzp_AuthKeySuccess;
    //native.ChannelType;        
}

// Export UBTTcpLink_Login::execsfReqClanMemberListFromClient(FFrame&, void* const)
native function bool sfReqClanMemberListFromClient();

// Export UBTTcpLink_Login::execsfAckClanMemberListFromClientStart(FFrame&, void* const)
native function bool sfAckClanMemberListFromClientStart(int Result, int TotalCount)
{
    //native.Result;
    //native.TotalCount;        
}

// Export UBTTcpLink_Login::execsfAckClanMemberListFromClient(FFrame&, void* const)
native function bool sfAckClanMemberListFromClient(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<string> ServerName, array<string> ServerShortName, array<string> ServerIP, array<int> serverPort, array<byte> CurPos, array<int> ChannelNum, array<string> ChannelNickName, array<int> GameRoomNum)
{
    //native.Result;
    //native.ErrMsg;
    //native.Level;
    //native.CharName;
    //native.ClanGrade;
    //native.ServerName;
    //native.ServerShortName;
    //native.ServerIP;
    //native.serverPort;
    //native.CurPos;
    //native.ChannelNum;
    //native.ChannelNickName;
    //native.GameRoomNum;        
}

// Export UBTTcpLink_Login::execsfAckClanMemberListFromClientEnd(FFrame&, void* const)
native function bool sfAckClanMemberListFromClientEnd();

// Export UBTTcpLink_Login::execsfAckMaxUserExceed(FFrame&, void* const)
native function bool sfAckMaxUserExceed();

// Export UBTTcpLink_Login::execsfReqKeepAlive(FFrame&, void* const)
native function bool sfReqKeepAlive();

// Export UBTTcpLink_Login::execsfReqForceLogoutByOwner(FFrame&, void* const)
native function bool sfReqForceLogoutByOwner();

// Export UBTTcpLink_Login::execsfReqCharInfo(FFrame&, void* const)
native function bool sfReqCharInfo(string CharName)
{
    //native.CharName;        
}

// Export UBTTcpLink_Login::execsfAckCharInfo(FFrame&, void* const)
native function bool sfAckCharInfo(int Result, string CharName, int Level, int Exp, string ClanName)
{
    //native.Result;
    //native.CharName;
    //native.Level;
    //native.Exp;
    //native.ClanName;        
}

// Export UBTTcpLink_Login::execsfReqRegisteredPCBangInfo(FFrame&, void* const)
native function bool sfReqRegisteredPCBangInfo();

// Export UBTTcpLink_Login::execsfAckRegisteredPCBangInfo(FFrame&, void* const)
native function bool sfAckRegisteredPCBangInfo(int Result, string ErrMsg, byte IsRegisteredPCBang, byte IsMainPCBang, string PCBangName)
{
    //native.Result;
    //native.ErrMsg;
    //native.IsRegisteredPCBang;
    //native.IsMainPCBang;
    //native.PCBangName;        
}

// Export UBTTcpLink_Login::execsfReqPCBangUserList(FFrame&, void* const)
native function bool sfReqPCBangUserList();

// Export UBTTcpLink_Login::execsfAckPCBangUserListStart(FFrame&, void* const)
native function bool sfAckPCBangUserListStart(int Result, int TotalCount)
{
    //native.Result;
    //native.TotalCount;        
}

// Export UBTTcpLink_Login::execsfAckPCBangUserList(FFrame&, void* const)
native function bool sfAckPCBangUserList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose)
{
    //native.FriendName;
    //native.IsLogOn;
    //native.ClanName;
    //native.CM_Pattern;
    //native.CM_BG;
    //native.CM_BL;
    //native.Level;
    //native.ClanGrade;
    //native.ClanWin;
    //native.ClanLose;        
}

// Export UBTTcpLink_Login::execsfAckPCBangUserListEnd(FFrame&, void* const)
native function bool sfAckPCBangUserListEnd();

// Export UBTTcpLink_Login::execsfReqRegisterMainPCBang(FFrame&, void* const)
native function bool sfReqRegisterMainPCBang();

// Export UBTTcpLink_Login::execsfAckRegisterMainPCBang(FFrame&, void* const)
native function bool sfAckRegisterMainPCBang(int Result, string ErrMsg)
{
    //native.Result;
    //native.ErrMsg;        
}

// Export UBTTcpLink_Login::execsfReqGetCharBlockInfo(FFrame&, void* const)
native function bool sfReqGetCharBlockInfo();

// Export UBTTcpLink_Login::execsfAckGetCharBlockInfo(FFrame&, void* const)
native function bool sfAckGetCharBlockInfo(int Result, byte IsAccountBlock, byte IsChattingBlock, BtrDouble ChattingBlockEndTime, array<string> BlockedItemName)
{
    //native.Result;
    //native.IsAccountBlock;
    //native.IsChattingBlock;
    //native.ChattingBlockEndTime;
    //native.BlockedItemName;        
}

// Export UBTTcpLink_Login::execsfReqServerTime(FFrame&, void* const)
native function bool sfReqServerTime();

// Export UBTTcpLink_Login::execsfAckServerTime(FFrame&, void* const)
native function bool sfAckServerTime(int Time)
{
    //native.Time;        
}

// Export UBTTcpLink_Login::execsfReqClientChallenge(FFrame&, void* const)
native function bool sfReqClientChallenge();

// Export UBTTcpLink_Login::execsfAckClientChallenge(FFrame&, void* const)
native function bool sfAckClientChallenge(string Key1, BtrDouble Key2)
{
    //native.Key1;
    //native.Key2;        
}

// Export UBTTcpLink_Login::execsfReqClientChecksum(FFrame&, void* const)
native function bool sfReqClientChecksum(string Key1, BtrDouble Key2)
{
    //native.Key1;
    //native.Key2;        
}

// Export UBTTcpLink_Login::execsfAckClientChecksum(FFrame&, void* const)
native function bool sfAckClientChecksum(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Login::execsfReqErrorReportServerAddr(FFrame&, void* const)
native function bool sfReqErrorReportServerAddr();

// Export UBTTcpLink_Login::execsfAckErrorReportServerAddr(FFrame&, void* const)
native function bool sfAckErrorReportServerAddr(string Addr, int Port)
{
    //native.Addr;
    //native.Port;        
}

// Export UBTTcpLink_Login::execsfReqEventNotify(FFrame&, void* const)
native function bool sfReqEventNotify();

// Export UBTTcpLink_Login::execsfAckEventNotify(FFrame&, void* const)
native function bool sfAckEventNotify(int Type)
{
    //native.Type;        
}

// Export UBTTcpLink_Login::execsfAckTencent_AASInfo(FFrame&, void* const)
native function bool sfAckTencent_AASInfo(int UserID, byte IsAdult, byte IsQQAuth, int AccumTimeSec)
{
    //native.UserID;
    //native.IsAdult;
    //native.IsQQAuth;
    //native.AccumTimeSec;        
}

// Export UBTTcpLink_Login::execsfReqLoginWithTencentAuth(FFrame&, void* const)
native function bool sfReqLoginWithTencentAuth(string AccountID, array<byte> Signature)
{
    //native.AccountID;
    //native.Signature;        
}

// Export UBTTcpLink_Login::execsfAckLoginWithTencentAuth(FFrame&, void* const)
native function bool sfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    //native.Result;
    //native.tc_AccountType;
    //native.tc_IsBlock;        
}

// Export UBTTcpLink_Login::execsfReqLogOut(FFrame&, void* const)
native function bool sfReqLogOut(byte Reason)
{
    //native.Reason;        
}

// Export UBTTcpLink_Login::execsfAckLogOut(FFrame&, void* const)
native function bool sfAckLogOut(byte Result, byte Reason)
{
    //native.Result;
    //native.Reason;        
}

// Export UBTTcpLink_Login::execsfReqLoginWithThailand(FFrame&, void* const)
native function bool sfReqLoginWithThailand(string USN, int BloodDisplayType, int PCBangType, string UnixTimeStamp, string HashValue, byte Sex)
{
    //native.USN;
    //native.BloodDisplayType;
    //native.PCBangType;
    //native.UnixTimeStamp;
    //native.HashValue;
    //native.Sex;        
}

// Export UBTTcpLink_Login::execsfAckLoginWithThailand(FFrame&, void* const)
native function bool sfAckLoginWithThailand(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Login::execsfReqLoginWithGlobal(FFrame&, void* const)
native function bool sfReqLoginWithGlobal(string G_AccountID, string G_GUID, string G_AuthKey, int UserType)
{
    //native.G_AccountID;
    //native.G_GUID;
    //native.G_AuthKey;
    //native.UserType;        
}

// Export UBTTcpLink_Login::execsfAckLoginWithGlobal(FFrame&, void* const)
native function bool sfAckLoginWithGlobal(int Result)
{
    //native.Result;        
}

// Export UBTTcpLink_Login::execsfReqLoginWithIndonesia(FFrame&, void* const)
native function bool sfReqLoginWithIndonesia(string HashValue)
{
    //native.HashValue;        
}

// Export UBTTcpLink_Login::execsfAckLoginWithIndonesia(FFrame&, void* const)
native function bool sfAckLoginWithIndonesia(int Result)
{
    //native.Result;        
}
