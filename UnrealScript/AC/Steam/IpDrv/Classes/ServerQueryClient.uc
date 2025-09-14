/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path IpDrv\Classes\ServerQueryClient.uc
 * Package Imports:
 *	IpDrv
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:3
 *	Functions:6
 *
 *******************************************************************************/
class ServerQueryClient extends MasterServerLink
    dependson(MasterServerLink)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    transient;

enum EQueryInterfaceCommand
{
    QI_Ping,
    QI_Rules,
    QI_Players,
    QI_RulesAndPlayers,
    QI_SmallPing
};

enum EPingCause
{
    PC_Unknown,
    PC_Clicked,
    PC_AutoPing,
    PC_LANBroadcast
};

var bool bLANQuery;
var delegate<OnReceivedPingInfo> __OnReceivedPingInfo__Delegate;
var delegate<OnPingTimeout> __OnPingTimeout__Delegate;

delegate OnReceivedPingInfo(int ListID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S);
delegate OnPingTimeout(int ListID, ServerQueryClient.EPingCause PingCause);
// Export UServerQueryClient::execPingServer(FFrame&, void* const)
native function PingServer(int ListID, ServerQueryClient.EPingCause PingCause, string IP, int Port, ServerQueryClient.EQueryInterfaceCommand Command, ServerResponseLine CurrentState);
// Export UServerQueryClient::execCancelPings(FFrame&, void* const)
native function CancelPings();
// Export UServerQueryClient::execNetworkError(FFrame&, void* const)
native function bool NetworkError();
function BroadcastPingRequest()
{
    local ServerResponseLine temp;

    // End:0x41
    if(class'MasterServerUplink'.default.LANServerPort >= 0)
    {
        PingServer(-1, 3, "BROADCAST", class'MasterServerUplink'.default.LANServerPort, 0, temp);
    }
}
