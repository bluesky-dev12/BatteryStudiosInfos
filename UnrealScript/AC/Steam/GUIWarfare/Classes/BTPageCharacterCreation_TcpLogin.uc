/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfare\Classes\BTPageCharacterCreation_TcpLogin.uc
 * Package Imports:
 *	GUIWarfare
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class BTPageCharacterCreation_TcpLogin extends BTTcpLink_Login;

var export editinline BTPageCharacterCreation Owner;

function bool rfAckCreateChar(int Success, string ErrMsg)
{
    Owner.rfAckCreateChar(Success, ErrMsg);
    return true;
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    return Owner.rfAckLoginInHouseTest(Sucess, CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, NeedChar, ErrMsg, BDay, Sex, ServerTime);
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    return Owner.rfAckProcessPreLoginUser(Result, ErrMsg);
}
