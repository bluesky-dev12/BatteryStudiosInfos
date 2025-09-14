class BTTcpLoginHandler extends BTTcpLink_Login;

var export editinline BTNetMainMenu MainMenu;

function OnConnect(int ErrCode)
{
    __NFUN_270__("[BTTcpLoginHandler::OnConnect] ErrCode=" $ string(ErrCode));
    Log("[BTTcpLoginHandler::OnConnect] ErrCode=" $ string(ErrCode));
    super.OnConnect(ErrCode);
    MainMenu.TcpLogin_OnConnect(ErrCode);
    // End:0x208
    if(MainMenu.page_curr != none)
    {
        // End:0x114
        if(MainMenu.page_curr == MainMenu.page_RoomLobby)
        {
            __NFUN_270__("CurrPage is a RoomLobby");
            Log("CurrPage is a RoomLobby");
            MainMenu.page_RoomLobby.TcpLogin_OnConnect(ErrCode);            
        }
        else
        {
            // End:0x184
            if(MainMenu.page_curr == MainMenu.page_Lobby2)
            {
                __NFUN_270__("CurrPage is a Lobby");
                Log("CurrPage is a Lobby");
                MainMenu.page_Lobby2.TcpLogin_OnConnect(ErrCode);                
            }
            else
            {
                // End:0x205
                if(MainMenu.page_curr == MainMenu.page_ServerSelection)
                {
                    __NFUN_270__("CurrPage is a ServerSelection");
                    Log("CurrPage is a ServerSelection");
                    MainMenu.page_ServerSelection.TcpLogin_OnConnect(ErrCode);
                }
            }
        }        
    }
    else
    {
        __NFUN_270__("CurrPage is none");
        Log("CurrPage is none");
    }
    MainMenu.TcpLogin.sfReqErrorReportServerAddr();
    //return;    
}

function OnClose(int ErrCode)
{
    __NFUN_270__("[BTTcpLoginHandler::OnClose] ErrCode=" $ string(ErrCode));
    Log("[BTTcpLoginHandler::OnClose] ErrCode=" $ string(ErrCode));
    super.OnClose(ErrCode);
    MainMenu.TcpLogin_OnClose(ErrCode);
    //return;    
}

function OnError(int ErrCode)
{
    __NFUN_270__("[BTTcpLoginHandler::OnError] ErrCode=" $ string(ErrCode));
    Log("[BTTcpLoginHandler::OnError] ErrCode=" $ string(ErrCode));
    super.OnError(ErrCode);
    MainMenu.TcpLogin_OnError(ErrCode);
    //return;    
}

function bool rfAckHash(int Result, string Error)
{
    Log((("[BTTcpLoginHandler::rfAckHash] Result=" $ string(Result)) $ " Error=") $ Error);
    MainMenu.TcpLogin_rfAckHash(Result, Error);
    return true;
    //return;    
}

function bool rfAckLogin(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg)
{
    Log("[BTTcpLoginHandler::rfAckLogin]");
    // End:0x42
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckLogin(Sucess, CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, NeedChar, ErrMsg);
    //return;    
}

function bool rfAckServerList(array<string> CServername, array<string> CServerShortName, array<string> ServerIP, array<int> serverPort, array<string> ChannelName, array<string> ChannelNickName, array<int> ChannelNum, array<int> chMaxUser, array<int> chCurUser, array<string> ServerGroupName, array<int> ServerGroupID, array<int> ServerDispOrder, array<int> DataPort, array<byte> OptionCount_byte, array<byte> OptionKey_byte, array<byte> OptionValue_byte, array<byte> OptionCount_int, array<byte> OptionKey_int, array<int> OptionValue_int, array<byte> OptionCount_float, array<byte> OptionKey_float, array<float> OptionValue_float, array<byte> IsClanChannel, array<byte> IsUseDedicateHost)
{
    Log("[BTTcpLoginHandler::rfAckServerList] Count=" $ string(CServername.Length));
    // End:0x58
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckServerList(CServername, CServerShortName, ServerIP, serverPort, ChannelName, ChannelNickName, ChannelNum, chMaxUser, chCurUser, ServerGroupName, ServerGroupID, ServerDispOrder, DataPort, OptionCount_byte, OptionKey_byte, OptionValue_byte, OptionCount_int, OptionKey_int, OptionValue_int, OptionCount_float, OptionKey_float, OptionValue_float, IsClanChannel, IsUseDedicateHost);
    //return;    
}

function bool rfAckCreateChar(int Success, string ErrMsg)
{
    Log("[BTTcpLoginHandler::rfAckCreateChar]");
    // End:0x47
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckCreateChar(Success, ErrMsg);
    //return;    
}

function bool rfAckLoginInHouseTest(byte Sucess, string CharName, int TimeStamp, int LoginHash1, int LoginHash2, int LoginHash3, int LoginHash4, int LoginHash5, byte NeedChar, string ErrMsg, string BDay, byte Sex, BtrDouble ServerTime)
{
    Log("[BTTcpLoginHandler::rfAckLoginInHouseTest]");
    // End:0x4D
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckLoginInHouseTest(Sucess, CharName, TimeStamp, LoginHash1, LoginHash2, LoginHash3, LoginHash4, LoginHash5, NeedChar, ErrMsg, BDay, Sex, ServerTime);
    //return;    
}

function bool rfAckProcessPreLoginUser(int Result, string ErrMsg)
{
    Log(((("[BTTcpLoginHandler::rfAckProcessPreLoginUser] " $ "Result=") $ string(Result)) $ " ErrMsg=") $ ErrMsg);
    // End:0x78
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckProcessPreLoginUser(Result, ErrMsg);
    //return;    
}

function bool rfReqFriendsList()
{
    Log("[BTTcpLoginHandler::rfReqFriendsList]");
    // End:0x48
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfReqFriendsList();
    //return;    
}

function bool rfAckFriendsList(byte ListType, array<string> UserName, array<byte> IsLogOn, array<int> CMarkPattern, array<int> CMarkBG, array<int> CMarkBL, array<string> ClanName, array<int> Level)
{
    Log("[BTTcpLoginHandler::rfAckFriendsList]");
    // End:0x48
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckFriendsList(ListType, UserName, IsLogOn, CMarkPattern, CMarkBG, CMarkBL, ClanName, Level);
    //return;    
}

function bool rfAckClanMemberListFromClient(int Result, string ErrMsg, array<int> Level, array<string> CharName, array<byte> ClanGrade, array<string> ServerName, array<string> ServerShortName, array<string> ServerIP, array<int> serverPort, array<byte> CurPos, array<int> ChannelNum, array<string> ChannelNickName, array<int> GameRoomNum)
{
    Log("[BTTcpLoginHandler::rfAckClanMemberListFromClient]");
    // End:0x55
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckClanMemberListFromClient(Result, ErrMsg, Level, CharName, ClanGrade, ServerName, ServerShortName, ServerIP, serverPort, CurPos, ChannelNum, ChannelNickName, GameRoomNum);
    //return;    
}

function bool rfAckLoginWithWZAuth(int Result, byte wzp_AccountType, byte wzp_IsBlock, byte wzp_AuthKeySuccess, byte ChannelType)
{
    Log("[BTTcpLoginHandler::rfAckLoginWithWZAuth]");
    // End:0x4C
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckLoginWithWZAuth(Result, wzp_AccountType, wzp_IsBlock, wzp_AuthKeySuccess, ChannelType);
    //return;    
}

function bool rfAckLoginWithThailand(int Result)
{
    Log("[BTTcpLoginHandler::rfAckLoginWithThailand]");
    // End:0x4E
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckLoginWithThailand(Result);
    //return;    
}

function bool Exit_OnOK(GUIComponent Sender)
{
    Log("[BTTcpLoginHandler::Exit_OnOK]");
    return MainMenu.page_curr.TcpLogin.sfReqLogOut(4);
    return true;
    //return;    
}

function bool rfAckMaxUserExceed()
{
    Log("[BTTcpLoginHandler::rfAckMaxUserExceed]");
    MainMenu.HaltNetwork();
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(MainMenu.Controller, 99);
    BTWindowDefineInfoHK(MainMenu.Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    return true;
    //return;    
}

function bool rfReqForceLogoutByOwner()
{
    Log("[BTTcpLoginHandler::rfReqForceLogoutByOwner]");
    MainMenu.HaltNetwork();
    Class'GUIWarfareControls.BTWindowDefineInfoHK'.static.ShowInfo(MainMenu.Controller, 84);
    BTWindowDefineInfoHK(MainMenu.Controller.TopPage()).__OnOK__Delegate = Exit_OnOK;
    return true;
    //return;    
}

function bool rfAckClanMemberListFromClientStart(int Result, int TotalCount)
{
    Log("[BTTcpLoginHandler::rfAckClanMemberListFromClientStart]");
    // End:0x5A
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckClanMemberListFromClientStart(Result, TotalCount);
    //return;    
}

function bool rfAckClanMemberListFromClientEnd()
{
    Log("[BTTcpLoginHandler::rfAckClanMemberListFromClientEnd]");
    // End:0x58
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckClanMemberListFromClientEnd();
    //return;    
}

function bool rfAckFriendsListStart(int Result, int TotalCount)
{
    Log("[BTTcpLoginHandler::rfAckFriendsListStart]");
    // End:0x4D
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckFriendsListStart(Result, TotalCount);
    //return;    
}

function bool rfAckFriendsListEnd()
{
    Log("[BTTcpLoginHandler::rfAckFriendsListEnd]");
    // End:0x4B
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckFriendsListEnd();
    //return;    
}

function bool rfAckCharInfo(int Result, string CharName, int Level, int Exp, string ClanName)
{
    Log("[BTTcpLoginHandler::rfAckCharInfo]");
    // End:0x45
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckCharInfo(Result, CharName, Level, Exp, ClanName);
    //return;    
}

function bool rfAckClientChallenge(string Key1, BtrDouble Key2)
{
    Log("[BTTcpLoginHandler::rfAckClientChallenge]");
    // End:0x4C
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckClientChallenge(Key1, Key2);
    //return;    
}

function bool rfAckClientChecksum(int Result)
{
    Log("[BTTcpLoginHandler::rfAckClientChecksum]");
    // End:0x4B
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckClientChecksum(Result);
    //return;    
}

function bool rfAckErrorReportServerAddr(string Addr, int Port)
{
    Log((("[BTTcpLoginHandler::rfAckErrorReportServerAddr] Addr=" $ Addr) $ ", Port=") $ string(Port));
    MainMenu.rMM.ERServerIP = Addr;
    MainMenu.rMM.ERServerPort = Port;
    return true;
    //return;    
}

function bool rfAckEventNotify(int Type)
{
    Log("[BTTcpLoginHandler::rfAckEventNotify]");
    // End:0x48
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckEventNotify(Type);
    //return;    
}

function bool rfAckPCBangUserListStart(int Result, int TotalCount)
{
    Log("[BTTcpLoginHandler::rfAckPCBangUserListStart]");
    // End:0x50
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckPCBangUserListStart(Result, TotalCount);
    //return;    
}

function bool rfAckPCBangUserList(array<string> FriendName, array<byte> IsLogOn, array<string> ClanName, array<int> CM_Pattern, array<int> CM_BG, array<int> CM_BL, array<int> Level, array<int> ClanGrade, array<int> ClanWin, array<int> ClanLose)
{
    Log("[BTTcpLoginHandler::rfAckPCBangUserList]");
    // End:0x4B
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckPCBangUserList(FriendName, IsLogOn, ClanName, CM_Pattern, CM_BG, CM_BL, Level, ClanGrade, ClanWin, ClanLose);
    //return;    
}

function bool rfAckPCBangUserListEnd()
{
    Log("[BTTcpLoginHandler::rfAckPCBangUserListEnd]");
    // End:0x4E
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckPCBangUserListEnd();
    //return;    
}

function bool rfAckLogOut(byte Result, byte Reason)
{
    Log("[BTTcpLoginHandler::rfAckLogOut]");
    // End:0x43
    if(MainMenu.page_curr.TcpLogin == none)
    {
        return false;
    }
    return MainMenu.page_curr.TcpLogin.rfAckLogOut(Result, Reason);
    //return;    
}
