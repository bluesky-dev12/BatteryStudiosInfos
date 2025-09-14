/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path IpDrv\Classes\UdpLink.uc
 * Package Imports:
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:8
 *
 *******************************************************************************/
class UdpLink extends InternetLink
    dependson(InternetLink)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    transient;

var() const int BroadcastAddr;
var const string RecvBuf;

// Export UUdpLink::execBindPort(FFrame&, void* const)
native function int BindPort(optional int Port, optional bool bUseNextAvailable);
// Export UUdpLink::execSendText(FFrame&, void* const)
native function bool SendText(IpAddr Addr, coerce string str);
// Export UUdpLink::execSendBinary(FFrame&, void* const)
native function bool SendBinary(IpAddr Addr, int Count, byte B[255]);
// Export UUdpLink::execReadText(FFrame&, void* const)
native function int ReadText(out IpAddr Addr, out string str);
// Export UUdpLink::execReadBinary(FFrame&, void* const)
native function int ReadBinary(out IpAddr Addr, int Count, out byte B[255]);
event ReceivedText(IpAddr Addr, string Text);
event ReceivedLine(IpAddr Addr, string Line);
event ReceivedBinary(IpAddr Addr, int Count, byte B[255]);

defaultproperties
{
    BroadcastAddr=-1
    bAlwaysTick=true
}