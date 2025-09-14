/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\BTTcpHandler_DStoDP_Script.uc
 * Package Imports:
 *	XInterface
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Functions:9
 *
 *******************************************************************************/
class BTTcpHandler_DStoDP_Script extends BTTcpHandler_DStoDP_Script_Interface;

event Created()
{
    super(Object).Created();
}

function OnConnect(int ErrCode)
{
    local array<byte> arIPAddrType, arPortType;
    local array<string> arIPAddr;
    local array<int> arPortNum;

    UnresolvedNativeFunction_97("[BTTcpHandle_DStoDP_Script::OnConnect] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandle_DStoDP_Script::OnConnect] ErrCode=" $ string(ErrCode));
    super(BTTcpLink_Process2Agent).OnConnect(ErrCode);
    // End:0xcb
    if(ErrCode == 0)
    {
        MM.kTcpDStoDP = self;
        sfReqLogin(MM.kPID, 0, arIPAddrType, arIPAddr, arPortType, arPortNum);
    }
    // End:0xe0
    else
    {
        MM.ConsoleCmd_DS("exit");
    }
}

function OnClose(int ErrCode)
{
    UnresolvedNativeFunction_97("[BTTcpHandle_DStoDP_Script::OnClose] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandle_DStoDP_Script::OnClose] ErrCode=" $ string(ErrCode));
    super(BTTcpLink_Process2Agent).OnClose(ErrCode);
    MM.ConsoleCmd_DS("exit");
}

function OnError(int ErrCode)
{
    UnresolvedNativeFunction_97("[BTTcpHandle_DStoDP_Script::OnError] ErrCode=" $ string(ErrCode));
    Log("[BTTcpHandle_DStoDP_Script::OnError] ErrCode=" $ string(ErrCode));
    super(BTTcpLink_Process2Agent).OnError(ErrCode);
    MM.ConsoleCmd_DS("exit");
}

function bool rfAckHash(int Result, string Error)
{
    Log("[BTTcpHandle_DStoDP_Script::rfAckHash] Result=" $ string(Result) $ " Error=" $ Error);
    return true;
}

function bool rfAckLogin(int Result)
{
    Log("[BTTcpHandle_DStoDP_Script::rfAckLogin] Result:" $ string(Result));
    // End:0x5c
    if(Result != 0)
    {
        MM.ConsoleCmd_DS("exit");
    }
    return true;
}

function bool rfReqQuitDedicateHost(int ServerID, int ChannelNum, int RoomNum)
{
    Log("[BTTcpHandle_DStoDP_Script::rfReqQuitDedicateHost] ServerID:" $ string(ServerID) $ " ChannelNum:" $ string(ChannelNum) $ " RoomNum:" $ string(RoomNum));
    UnresolvedNativeFunction_97("[BTTcpHandle_DStoDP_Script::rfReqQuitDedicateHost] ServerID:" $ string(ServerID) $ " ChannelNum:" $ string(ChannelNum) $ " RoomNum:" $ string(RoomNum));
    // End:0x1fa
    if(MM.kDediIsConnectedWithServer == true)
    {
        // End:0x1d3
        if(MM.bPendingStarted == true)
        {
            Log("BTTcpHandle_DStoDP_Script::rfReqQuitDedicateHost] bPendingStarted == true. force be failed loading");
            UnresolvedNativeFunction_97("LoadingInfo - bPendingStarted == true. force be failed loading");
            MM.FailedNetworkChecking();
        }
        sfAckQuitDedicateHost(0, MM.kPID, ServerID, ChannelNum, RoomNum);
    }
    // End:0x21e
    else
    {
        sfAckQuitDedicateHost(0, MM.kPID, ServerID, ChannelNum, RoomNum);
    }
    return true;
}

function bool rfReqStartDedicateHost(int ServerID, string ChannelIPAddr, int ChannelPortNum, int ChannelNum, int RoomNum)
{
    Log("[BTTcpHandle_DStoDP_Script::rfReqStartDedicateHost] ServerID:" $ string(ServerID) $ " ChannelIPAddr:" $ ChannelIPAddr $ " ChannelPortNum:" $ string(ChannelPortNum) $ " ChannelNum:" $ string(ChannelNum) $ " RoomNum:" $ string(RoomNum));
    UnresolvedNativeFunction_97("[BTTcpHandle_DStoDP_Script::rfReqStartDedicateHost] ServerID:" $ string(ServerID) $ " ChannelIPAddr:" $ ChannelIPAddr $ " ChannelPortNum:" $ string(ChannelPortNum) $ " ChannelNum:" $ string(ChannelNum) $ " RoomNum:" $ string(RoomNum));
    MM.kDediServerID = ServerID;
    MM.kDediChannelNum = ChannelNum;
    MM.kDediRoomNum = RoomNum;
    MM.ConsoleCmd_DS("connect_ds_to_channel IPAddr=" $ ChannelIPAddr $ " PortNum=" $ string(ChannelPortNum));
    return true;
}

function bool rfReqTerminateDedicateHostProcess()
{
    Log("[BTTcpHandle_DStoDP_Script::rfReqTerminateDedicateHostProcess]");
    UnresolvedNativeFunction_97("[BTTcpHandle_DStoDP_Script::rfReqTerminateDedicateHostProcess]");
    MM.ConsoleCmd_DS("exit");
    return true;
}
