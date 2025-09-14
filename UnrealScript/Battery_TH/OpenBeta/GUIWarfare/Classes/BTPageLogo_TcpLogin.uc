class BTPageLogo_TcpLogin extends BTTcpLink_Login;

var export editinline BTPageLogo Owner;

function bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    return Owner.rfAckLoginWithWZAuth(Result, wzp_AccountType, wzp_IsBlock, wzp_AuthKeySuccess, ChannelType);
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

function bool rfAckEventNotify(int Type)
{
    return Owner.rfAckEventNotify(Type);
    //return;    
}

function bool rfAckLoginWithTencentAuth(int Result, byte tc_AccountType, byte tc_IsBlock)
{
    return Owner.rfAckLoginWithTencentAuth(Result, tc_AccountType, tc_IsBlock);
    //return;    
}

function bool rfAckLoginWithThailand(int Result)
{
    return Owner.rfAckLoginWithThailand(Result);
    //return;    
}
