class ServerQueryClient extends MasterServerLink
    transient
    native
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum EQueryInterfaceCommand
{
    QI_Ping,                        // 0
    QI_Rules,                       // 1
    QI_Players,                     // 2
    QI_RulesAndPlayers,             // 3
    QI_SmallPing                    // 4
};

enum EPingCause
{
    PC_Unknown,                     // 0
    PC_Clicked,                     // 1
    PC_AutoPing,                    // 2
    PC_LANBroadcast                 // 3
};

var bool bLANQuery;
//var delegate<OnReceivedPingInfo> __OnReceivedPingInfo__Delegate;
//var delegate<OnPingTimeout> __OnPingTimeout__Delegate;

delegate OnReceivedPingInfo(int ListID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    //return;    
}

delegate OnPingTimeout(int ListID, ServerQueryClient.EPingCause PingCause)
{
    //return;    
}

// Export UServerQueryClient::execPingServer(FFrame&, void* const)
native function PingServer(int ListID, ServerQueryClient.EPingCause PingCause, string IP, int Port, ServerQueryClient.EQueryInterfaceCommand Command, ServerResponseLine CurrentState)
{
    //native.ListID;
    //native.PingCause;
    //native.IP;
    //native.Port;
    //native.Command;
    //native.CurrentState;        
}

// Export UServerQueryClient::execCancelPings(FFrame&, void* const)
native function CancelPings();

// Export UServerQueryClient::execNetworkError(FFrame&, void* const)
native function bool NetworkError();

function BroadcastPingRequest()
{
    local ServerResponseLine Temp;

    // End:0x41
    if(Class'IpDrv_Decompressed.MasterServerUplink'.default.LANServerPort >= 0)
    {
        PingServer(-1, 3, "BROADCAST", Class'IpDrv_Decompressed.MasterServerUplink'.default.LANServerPort, 0, Temp);
    }
    //return;    
}
