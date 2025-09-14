/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path BatteryNet\Classes\BTTcpLink_Process2Agent.uc
 * Package Imports:
 *	BatteryNet
 *	Core
 *
 * Stats:
 *	Functions:36
 *
 *******************************************************************************/
class BTTcpLink_Process2Agent extends Object
    native;

// Export UBTTcpLink_Process2Agent::execInitNetwork(FFrame&, void* const)
native function bool InitNetwork();
// Export UBTTcpLink_Process2Agent::execConnect(FFrame&, void* const)
native function bool Connect(string sIpaddr, int nPort);
// Export UBTTcpLink_Process2Agent::execClose(FFrame&, void* const)
native function bool Close();
event OnConnect(int ErrCode)
{
    Log("Socket Connected!");
}

event OnClose(int ErrCode)
{
    Log("Socket Closed!");
}

event OnError(int ErrCode)
{
    Log("Socket Error!");
}

event bool rfReqHash(int HashField0, int HashField1, int HashField2, int HashField3)
{
    return false;
}

event bool rfAckHash(int Result, string ErrMsg)
{
    return false;
}

event bool rfReqLogin(int PID, int ServerID, array<byte> ServerIPAddrType, array<string> ServerIPAddr, array<byte> ServerPortType, array<int> ServerPortNum)
{
    return false;
}

event bool rfAckLogin(int Result)
{
    return false;
}

event bool rfReqQuitDedicateHost(int ServerID, int ChannelNum, int RoomNum)
{
    return false;
}

event bool rfAckQuitDedicateHost(int Result, int PID, int ServerID, int ChannelNum, int RoomNum)
{
    return false;
}

event bool rfReqStartDedicateHost(int ServerID, string ChannelIPAddr, int ChannelPortNum, int ChannelNum, int RoomNum)
{
    return false;
}

event bool rfAckStartDedicateHost(int Result, int ProcessID, int ServerID, int ChannelNum, int RoomNum)
{
    return false;
}

event bool rfReqTerminateDedicateHostProcess()
{
    return false;
}

event bool rfReqUpdateUserCount_ChannelServer(int ServerID, int ChannelCount, array<int> ChannelNum, array<int> ChannelMaxUserCount, array<int> ChannelCurUserCount, array<int> ChannelPlayingUserCount, array<int> ChannelRoomCount)
{
    return false;
}

event bool rfReqUpdateUserCount_LoginServer(int ServerID, int MaxUserCount, int CurUserCount)
{
    return false;
}

event bool rfReqUpdateUserCount_DudeServer(int ServerID, int MaxUserCount, int CurUserCount)
{
    return false;
}

event bool rfReqProcessExcuteCmd(int MajorType, int MinorType, string CmdValue)
{
    return false;
}

event bool rfAckProcessExcuteCmd(int Result, int MajorType, int MinorType, string CmdValue)
{
    return false;
}

event bool rfReqUpdateProcessState(int State)
{
    return false;
}

// Export UBTTcpLink_Process2Agent::execsfReqHash(FFrame&, void* const)
native function bool sfReqHash(int HashField0, int HashField1, int HashField2, int HashField3);
// Export UBTTcpLink_Process2Agent::execsfAckHash(FFrame&, void* const)
native function bool sfAckHash(int Result, string ErrMsg);
// Export UBTTcpLink_Process2Agent::execsfReqLogin(FFrame&, void* const)
native function bool sfReqLogin(int PID, int ServerID, array<byte> ServerIPAddrType, array<string> ServerIPAddr, array<byte> ServerPortType, array<int> ServerPortNum);
// Export UBTTcpLink_Process2Agent::execsfAckLogin(FFrame&, void* const)
native function bool sfAckLogin(int Result);
// Export UBTTcpLink_Process2Agent::execsfReqQuitDedicateHost(FFrame&, void* const)
native function bool sfReqQuitDedicateHost(int ServerID, int ChannelNum, int RoomNum);
// Export UBTTcpLink_Process2Agent::execsfAckQuitDedicateHost(FFrame&, void* const)
native function bool sfAckQuitDedicateHost(int Result, int PID, int ServerID, int ChannelNum, int RoomNum);
// Export UBTTcpLink_Process2Agent::execsfReqStartDedicateHost(FFrame&, void* const)
native function bool sfReqStartDedicateHost(int ServerID, string ChannelIPAddr, int ChannelPortNum, int ChannelNum, int RoomNum);
// Export UBTTcpLink_Process2Agent::execsfAckStartDedicateHost(FFrame&, void* const)
native function bool sfAckStartDedicateHost(int Result, int ProcessID, int ServerID, int ChannelNum, int RoomNum);
// Export UBTTcpLink_Process2Agent::execsfReqTerminateDedicateHostProcess(FFrame&, void* const)
native function bool sfReqTerminateDedicateHostProcess();
// Export UBTTcpLink_Process2Agent::execsfReqUpdateUserCount_ChannelServer(FFrame&, void* const)
native function bool sfReqUpdateUserCount_ChannelServer(int ServerID, int ChannelCount, array<int> ChannelNum, array<int> ChannelMaxUserCount, array<int> ChannelCurUserCount, array<int> ChannelPlayingUserCount, array<int> ChannelRoomCount);
// Export UBTTcpLink_Process2Agent::execsfReqUpdateUserCount_LoginServer(FFrame&, void* const)
native function bool sfReqUpdateUserCount_LoginServer(int ServerID, int MaxUserCount, int CurUserCount);
// Export UBTTcpLink_Process2Agent::execsfReqUpdateUserCount_DudeServer(FFrame&, void* const)
native function bool sfReqUpdateUserCount_DudeServer(int ServerID, int MaxUserCount, int CurUserCount);
// Export UBTTcpLink_Process2Agent::execsfReqProcessExcuteCmd(FFrame&, void* const)
native function bool sfReqProcessExcuteCmd(int MajorType, int MinorType, string CmdValue);
// Export UBTTcpLink_Process2Agent::execsfAckProcessExcuteCmd(FFrame&, void* const)
native function bool sfAckProcessExcuteCmd(int Result, int MajorType, int MinorType, string CmdValue);
// Export UBTTcpLink_Process2Agent::execsfReqUpdateProcessState(FFrame&, void* const)
native function bool sfReqUpdateProcessState(int State);
