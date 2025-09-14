/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path IpDrv\Classes\InternetLink.uc
 * Package Imports:
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:3
 *	Structs:1
 *	Properties:9
 *	Functions:11
 *
 *******************************************************************************/
class InternetLink extends InternetInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    transient;

enum ELinkMode
{
    MODE_Text,
    MODE_Line,
    MODE_Binary
};

enum ELineMode
{
    LMODE_auto,
    LMODE_DOS,
    LMODE_UNIX,
    LMODE_MAC
};

enum EReceiveMode
{
    RMODE_Manual,
    RMODE_Event
};

struct IpAddr
{
    var int Addr;
    var int Port;
};

var InternetLink.ELinkMode LinkMode;
var InternetLink.ELineMode InLineMode;
var InternetLink.ELineMode OutLineMode;
var const transient pointer Socket;
var const int Port;
var const transient pointer RemoteSocket;
var private native const transient pointer PrivateResolveInfo;
var const int DataPending;
var InternetLink.EReceiveMode ReceiveMode;

// Export UInternetLink::execIsDataPending(FFrame&, void* const)
native function bool IsDataPending();
// Export UInternetLink::execParseURL(FFrame&, void* const)
native function bool ParseURL(coerce string URL, out string Addr, out int Port, out string LevelName, out string EntryName);
// Export UInternetLink::execResolve(FFrame&, void* const)
native function Resolve(coerce string Domain);
// Export UInternetLink::execGetLastError(FFrame&, void* const)
native function int GetLastError();
// Export UInternetLink::execIpAddrToString(FFrame&, void* const)
native function string IpAddrToString(IpAddr Arg);
// Export UInternetLink::execStringToIpAddr(FFrame&, void* const)
native function bool StringToIpAddr(string str, out IpAddr Addr);
// Export UInternetLink::execGameSpyValidate(FFrame&, void* const)
native function string GameSpyValidate(string ValidationString);
// Export UInternetLink::execGameSpyGameName(FFrame&, void* const)
native function string GameSpyGameName();
// Export UInternetLink::execGetLocalIP(FFrame&, void* const)
native function GetLocalIP(out IpAddr Arg);
event Resolved(IpAddr Addr);
event ResolveFailed();
