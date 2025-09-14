class BTPageLogin_TcpLogin extends BTTcpLink_Login;

var export editinline BTPageLogin Owner;

function bool rfAckLogin(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg)
{
    return Owner.rfAckLogin(Sucess, CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, NeedChar, ErrMsg);
    //return;    
}

function bool rfAckCreateChar(byte Success, string ErrMsg)
{
    return Owner.rfAckCreateChar(Success, ErrMsg);
    //return;    
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    return Owner.rfAckLoginInHouseTest(Sucess, CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, NeedChar, ErrMsg, BDay, Sex, ServerTime);
    //return;    
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    return Owner.rfAckProcessPreLoginUser(Result, ErrMsg);
    //return;    
}
