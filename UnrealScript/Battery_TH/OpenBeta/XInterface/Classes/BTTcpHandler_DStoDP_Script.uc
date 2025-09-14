class BTTcpHandler_DStoDP_Script extends BTTcpHandler_DStoDP_Script_Interface;

event Created()
{
    super(Object).Created();
    //return;    
}

function OnConnect(int ErrCode)
{
    local array<byte> arIPAddrType, arPortType;
    local array<string> arIPAddr;
    local array<int> arPortNum;

    __NFUN_270__("[BTTcpHandle_DStoDP_Script::OnConnect] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandle_DStoDP_Script::OnConnect] ErrCode=" $ string(ErrCode));
    super(BTTcpLink_Process2Agent).OnConnect(ErrCode);
    // End:0xCB
    if(ErrCode == 0)
    {
        MM.kTcpDStoDP = self;
        sfReqLogin(MM.kPID, 0, arIPAddrType, arIPAddr, arPortType, arPortNum);        
    }
    else
    {
        MM.ConsoleCmd_DS("exit");
    }
    //return;    
}

function OnClose(int ErrCode)
{
    __NFUN_270__("[BTTcpHandle_DStoDP_Script::OnClose] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandle_DStoDP_Script::OnClose] ErrCode=" $ string(ErrCode));
    super(BTTcpLink_Process2Agent).OnClose(ErrCode);
    MM.ConsoleCmd_DS("exit");
    //return;    
}

function OnError(int ErrCode)
{
    __NFUN_270__("[BTTcpHandle_DStoDP_Script::OnError] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandle_DStoDP_Script::OnError] ErrCode=" $ string(ErrCode));
    super(BTTcpLink_Process2Agent).OnError(ErrCode);
    MM.ConsoleCmd_DS("exit");
    //return;    
}

function bool rfAckHash(int Result, string Error)
{
    Log((("[BTTcpHandle_DStoDP_Script::rfAckHash] Result=" $ string(Result)) $ " Error=") $ Error);
    return true;
    //return;    
}

function bool rfAckLogin(int Result)
{
    Log("[BTTcpHandle_DStoDP_Script::rfAckLogin] Result:" $ string(Result));
    // End:0x5C
    if(Result != 0)
    {
        MM.ConsoleCmd_DS("exit");
    }
    return true;
    //return;    
}

function bool rfReqQuitDedicateHost(int ServerID, int ChannelNum, int RoomNum)
{
    Log((((("[BTTcpHandle_DStoDP_Script::rfReqQuitDedicateHost] ServerID:" $ string(ServerID)) $ " ChannelNum:") $ string(ChannelNum)) $ " RoomNum:") $ string(RoomNum));
    __NFUN_270__((((("[BTTcpHandle_DStoDP_Script::rfReqQuitDedicateHost] ServerID:" $ string(ServerID)) $ " ChannelNum:") $ string(ChannelNum)) $ " RoomNum:") $ string(RoomNum));
    // End:0x201
    if(MM.kDediIsConnectedWithServer == true)
    {
        // End:0x1D3
        if(MM.bPendingStarted == true)
        {
            Log("BTTcpHandle_DStoDP_Script::rfReqQuitDedicateHost] bPendingStarted == true. force be failed loading");
            __NFUN_270__("LoadingInfo - bPendingStarted == true. force be failed loading");
            MM.FailedNetworkChecking();
        }
        MM.ConsoleCmd_DS("disconnect_ds_from_channel");        
    }
    else
    {
        sfAckQuitDedicateHost(0, MM.kPID, ServerID, ChannelNum, RoomNum);
    }
    return true;
    //return;    
}

function bool rfReqStartDedicateHost(int ServerID, string ChannelIPAddr, int ChannelPortNum, int ChannelNum, int RoomNum)
{
    Log((((((((("[BTTcpHandle_DStoDP_Script::rfReqStartDedicateHost] ServerID:" $ string(ServerID)) $ " ChannelIPAddr:") $ ChannelIPAddr) $ " ChannelPortNum:") $ string(ChannelPortNum)) $ " ChannelNum:") $ string(ChannelNum)) $ " RoomNum:") $ string(RoomNum));
    __NFUN_270__((((((((("[BTTcpHandle_DStoDP_Script::rfReqStartDedicateHost] ServerID:" $ string(ServerID)) $ " ChannelIPAddr:") $ ChannelIPAddr) $ " ChannelPortNum:") $ string(ChannelPortNum)) $ " ChannelNum:") $ string(ChannelNum)) $ " RoomNum:") $ string(RoomNum));
    MM.kDediServerID = ServerID;
    MM.kDediChannelNum = ChannelNum;
    MM.kDediRoomNum = RoomNum;
    MM.ConsoleCmd_DS((("connect_ds_to_channel IPAddr=" $ ChannelIPAddr) $ " PortNum=") $ string(ChannelPortNum));
    return true;
    //return;    
}

function bool rfReqTerminateDedicateHostProcess()
{
    Log("[BTTcpHandle_DStoDP_Script::rfReqTerminateDedicateHostProcess]");
    __NFUN_270__("[BTTcpHandle_DStoDP_Script::rfReqTerminateDedicateHostProcess]");
    MM.ConsoleCmd_DS("exit");
    return true;
    //return;    
}
