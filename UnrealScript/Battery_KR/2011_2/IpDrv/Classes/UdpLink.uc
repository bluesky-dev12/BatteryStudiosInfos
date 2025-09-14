class UdpLink extends InternetLink
    transient
    native
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() const int BroadcastAddr;
var const string RecvBuf;

// Export UUdpLink::execBindPort(FFrame&, void* const)
native function int BindPort(optional int Port, optional bool bUseNextAvailable)
{
    //native.Port;
    //native.bUseNextAvailable;        
}

// Export UUdpLink::execSendText(FFrame&, void* const)
native function bool SendText(IpAddr Addr, coerce string str)
{
    //native.Addr;
    //native.str;        
}

// Export UUdpLink::execSendBinary(FFrame&, void* const)
native function bool SendBinary(IpAddr Addr, int Count, byte B[255])
{
    //native.Addr;
    //native.Count;
    //native.B;        
}

// Export UUdpLink::execReadText(FFrame&, void* const)
native function int ReadText(out IpAddr Addr, out string str)
{
    //native.Addr;
    //native.str;        
}

// Export UUdpLink::execReadBinary(FFrame&, void* const)
native function int ReadBinary(out IpAddr Addr, int Count, out byte B[255])
{
    //native.Addr;
    //native.Count;
    //native.B;        
}

event ReceivedText(IpAddr Addr, string Text)
{
    //return;    
}

event ReceivedLine(IpAddr Addr, string Line)
{
    //return;    
}

event ReceivedBinary(IpAddr Addr, int Count, byte B[255])
{
    //return;    
}

defaultproperties
{
    BroadcastAddr=-1
    bAlwaysTick=true
}