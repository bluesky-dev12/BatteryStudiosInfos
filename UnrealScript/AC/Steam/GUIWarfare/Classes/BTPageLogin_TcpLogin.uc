/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageLogin_TcpLogin.uc
 * Package Imports:
 *	GUIWarfare
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:8
 *
 *******************************************************************************/
class BTPageLogin_TcpLogin extends BTTcpLink_Login;

var export editinline BTPageLogin Owner;

function bool rfAckLogin(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg)
{
    return Owner.rfAckLogin(Sucess, CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, NeedChar, ErrMsg);
}

function bool rfAckCreateChar(int Success, string ErrMsg)
{
    return Owner.rfAckCreateChar(Success, ErrMsg);
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    return Owner.rfAckLoginInHouseTest(Sucess, CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, NeedChar, ErrMsg, BDay, Sex, ServerTime);
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    return Owner.rfAckProcessPreLoginUser(Result, ErrMsg);
}

function bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    return Owner.rfAckLoginWithWZAuth(Result, wzp_AccountType, wzp_IsBlock, wzp_AuthKeySuccess, ChannelType);
}

function bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    return Owner.rfAckLoginWithTencentAuth(Result, tc_AccountType, tc_IsBlock);
}

function bool rfAckLoginWithThailand(int Result)
{
    return Owner.rfAckLoginWithThailand(Result);
}

function bool rfAckLoginWithGlobal(int Result)
{
    return Owner.rfAckLoginWithGlobal(Result);
}
