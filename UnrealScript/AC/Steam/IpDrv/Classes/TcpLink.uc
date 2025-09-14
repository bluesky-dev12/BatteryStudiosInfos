/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path IpDrv\Classes\TcpLink.uc
 * Package Imports:
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:5
 *	Functions:15
 *
 *******************************************************************************/
class TcpLink extends InternetLink
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    transient;

enum ELinkState
{
    STATE_Initialized,
    STATE_Ready,
    STATE_Listening,
    STATE_Connecting,
    STATE_Connected,
    STATE_ListenClosePending,
    STATE_ConnectClosePending,
    STATE_ListenClosing,
    STATE_ConnectClosing
};

var TcpLink.ELinkState LinkState;
var IpAddr RemoteAddr;
var class<TcpLink> AcceptClass;
var const array<byte> SendFIFO;
var const string RecvBuf;

// Export UTcpLink::execBindPort(FFrame&, void* const)
native function int BindPort(optional int Port, optional bool bUseNextAvailable);
// Export UTcpLink::execListen(FFrame&, void* const)
native function bool Listen();
// Export UTcpLink::execOpen(FFrame&, void* const)
native function bool Open(IpAddr Addr);
// Export UTcpLink::execClose(FFrame&, void* const)
native function bool Close();
// Export UTcpLink::execIsConnected(FFrame&, void* const)
native function bool IsConnected();
// Export UTcpLink::execSendText(FFrame&, void* const)
native function int SendText(coerce string str);
// Export UTcpLink::execSendBinary(FFrame&, void* const)
native function int SendBinary(int Count, byte B[255]);
// Export UTcpLink::execReadText(FFrame&, void* const)
native function int ReadText(out string str);
// Export UTcpLink::execReadBinary(FFrame&, void* const)
native function int ReadBinary(int Count, out byte B[255]);
event Accepted();
event Opened();
event Closed();
event ReceivedText(string Text);
event ReceivedLine(string Line);
event ReceivedBinary(int Count, byte B[255]);

defaultproperties
{
    bAlwaysTick=true
}