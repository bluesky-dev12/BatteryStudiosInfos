class InternetLink extends InternetInfo
    transient
    native
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum ELinkMode
{
    MODE_Text,                      // 0
    MODE_Line,                      // 1
    MODE_Binary                     // 2
};

enum ELineMode
{
    LMODE_auto,                     // 0
    LMODE_DOS,                      // 1
    LMODE_UNIX,                     // 2
    LMODE_MAC                       // 3
};

enum EReceiveMode
{
    RMODE_Manual,                   // 0
    RMODE_Event                     // 1
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
native function bool ParseURL(coerce string URL, out string Addr, out int Port, out string LevelName, out string EntryName)
{
    //native.URL;
    //native.Addr;
    //native.Port;
    //native.LevelName;
    //native.EntryName;        
}

// Export UInternetLink::execResolve(FFrame&, void* const)
native function Resolve(coerce string domain)
{
    //native.domain;        
}

// Export UInternetLink::execGetLastError(FFrame&, void* const)
native function int GetLastError();

// Export UInternetLink::execIpAddrToString(FFrame&, void* const)
native function string IpAddrToString(IpAddr Arg)
{
    //native.Arg;        
}

// Export UInternetLink::execStringToIpAddr(FFrame&, void* const)
native function bool StringToIpAddr(string str, out IpAddr Addr)
{
    //native.str;
    //native.Addr;        
}

// Export UInternetLink::execGameSpyValidate(FFrame&, void* const)
native function string GameSpyValidate(string ValidationString)
{
    //native.ValidationString;        
}

// Export UInternetLink::execGameSpyGameName(FFrame&, void* const)
native function string GameSpyGameName();

// Export UInternetLink::execGetLocalIP(FFrame&, void* const)
native function GetLocalIP(out IpAddr Arg)
{
    //native.Arg;        
}

event Resolved(IpAddr Addr)
{
    //return;    
}

event ResolveFailed()
{
    //return;    
}
