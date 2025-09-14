class TcpLink extends InternetLink
    transient
    native
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum ELinkState
{
    STATE_Initialized,              // 0
    STATE_Ready,                    // 1
    STATE_Listening,                // 2
    STATE_Connecting,               // 3
    STATE_Connected,                // 4
    STATE_ListenClosePending,       // 5
    STATE_ConnectClosePending,      // 6
    STATE_ListenClosing,            // 7
    STATE_ConnectClosing            // 8
};

var TcpLink.ELinkState LinkState;
var IpAddr RemoteAddr;
var Class<TcpLink> AcceptClass;
var const array<byte> SendFIFO;
var const string RecvBuf;

// Export UTcpLink::execBindPort(FFrame&, void* const)
native function int BindPort(optional int Port, optional bool bUseNextAvailable)
{
    //native.Port;
    //native.bUseNextAvailable;        
}

// Export UTcpLink::execListen(FFrame&, void* const)
native function bool Listen();

// Export UTcpLink::execOpen(FFrame&, void* const)
native function bool Open(IpAddr Addr)
{
    //native.Addr;        
}

// Export UTcpLink::execClose(FFrame&, void* const)
native function bool Close();

// Export UTcpLink::execIsConnected(FFrame&, void* const)
native function bool IsConnected();

// Export UTcpLink::execSendText(FFrame&, void* const)
native function int SendText(coerce string str)
{
    //native.str;        
}

// Export UTcpLink::execSendBinary(FFrame&, void* const)
native function int SendBinary(int Count, byte B[255])
{
    //native.Count;
    //native.B;        
}

// Export UTcpLink::execReadText(FFrame&, void* const)
native function int ReadText(out string str)
{
    //native.str;        
}

// Export UTcpLink::execReadBinary(FFrame&, void* const)
native function int ReadBinary(int Count, out byte B[255])
{
    //native.Count;
    //native.B;        
}

event Accepted()
{
    //return;    
}

event Opened()
{
    //return;    
}

event Closed()
{
    //return;    
}

event ReceivedText(string Text)
{
    //return;    
}

event ReceivedLine(string Line)
{
    //return;    
}

event ReceivedBinary(int Count, byte B[255])
{
    //return;    
}

defaultproperties
{
    bAlwaysTick=true
}