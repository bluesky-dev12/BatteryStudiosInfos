/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageServerSelection_TcpLogin.uc
 * Package Imports:
 *	GUIWarfare
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class BTPageServerSelection_TcpLogin extends BTTcpLink_Login;

var export editinline BTPageServerSelection Owner;

function bool rfAckServerList(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    return Owner.rfAckServerListFromLoginServer(CServername, CServerShortName, ServerIP, serverPort, ChannelName, ChannelNickName, ChannelNum, chMaxUser, chCurUser, ServerGroupName, ServerGroupID, ServerDispOrder, DataPort, OptionCount_byte, OptionKey_byte, OptionValue_byte, OptionCount_int, OptionKey_int, OptionValue_int, OptionCount_float, OptionKey_float, OptionValue_float, IsClanChannel, IsUseDedicateHost);
}

function bool rfAckCharInfo(int Result, string CharName, int Level, int Exp, string ClanName)
{
    return Owner.rfAckCharInfoFromLoginServer(Result, CharName, Level, Exp, ClanName);
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    return Owner.rfAckLoginInHouseTest(Sucess, CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, NeedChar, ErrMsg, BDay, Sex, ServerTime);
}

function bool rfAckClientChallenge(string Key1, BtrDouble Key2)
{
    return Owner.rfAckClientChallenge(Key1, Key2);
}

function bool rfAckClientChecksum(int Result)
{
    return Owner.rfAckClientChecksum(Result);
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    return Owner.rfAckLogOut(Result, Reason);
}
