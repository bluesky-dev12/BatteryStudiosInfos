class wBtrInfoIni extends wBtrIni;

var float Udp_Default_ConnectionTimeOut;
var float Udp_Default_InitialConnectionTimeOut;
var float Udp_Loading_ConnectionTimeOut;
var float Udp_Loading_InitialConnectionTimeOut;
var int Tcp_TickCheck_Default_Host;
var int Tcp_TickCheck_Default_Client;
var int Tcp_TickCheck_Loading;
var int Tcp_TickCheck_UI;
var int Tcp_TickCheck_Reset;
var int LoadingTimeLimit_NATDiagTimeLimit;
var int LoadingTimeLimit_RegisterUDPAddrLimit;
var int LoadingTimeLimit_CheckDummyPacketLimit;
var int LoadingTimeLimit_LevelNegotiationLimit;
var int LoadingTimeLimit_PreCachingLimit;
var int LoadingTimeLimit_WaitingForSuccessStartGameLimit;
var int LoadingTimeLimit_WhenHostBlocking;
var int LoadingTimeLimit_WaitDummyPacketPhraseLimit;
var int LoadingTimeLimit_WaitClientOutSideAddrInHost;
var int LoadingTimeLimit_WaitAckStartHolePunching;
var int LoadingTimeLimit_WaitAckStartHolePunchingInClient;
var localized string LoadingStateMessage[7];
var localized string OtherLoadingStateMessage[7];

event RegistMap()
{
    local int i;

    AddFloatToMap("Udp_Default_ConnectionTimeOut", Udp_Default_ConnectionTimeOut);
    AddFloatToMap("Udp_Default_InitialConnectionTimeOut", Udp_Default_InitialConnectionTimeOut);
    AddFloatToMap("Udp_Loading_ConnectionTimeOut", Udp_Loading_ConnectionTimeOut);
    AddFloatToMap("Udp_Loading_InitialConnectionTimeOut", Udp_Loading_InitialConnectionTimeOut);
    AddIntToMap("Tcp_TickCheck_Default_Host", Tcp_TickCheck_Default_Host);
    AddIntToMap("Tcp_TickCheck_Default_Client", Tcp_TickCheck_Default_Client);
    AddIntToMap("Tcp_TickCheck_Loading", Tcp_TickCheck_Loading);
    AddIntToMap("Tcp_TickCheck_UI", Tcp_TickCheck_UI);
    AddIntToMap("Tcp_TickCheck_Reset", Tcp_TickCheck_Reset);
    AddIntToMap("LoadingTimeLimit_NATDiagTimeLimit", LoadingTimeLimit_NATDiagTimeLimit);
    AddIntToMap("LoadingTimeLimit_RegisterUDPAddrLimit", LoadingTimeLimit_RegisterUDPAddrLimit);
    AddIntToMap("LoadingTimeLimit_CheckDummyPacketLimit", LoadingTimeLimit_CheckDummyPacketLimit);
    AddIntToMap("LoadingTimeLimit_LevelNegotiationLimit", LoadingTimeLimit_LevelNegotiationLimit);
    AddIntToMap("LoadingTimeLimit_PreCachingLimit", LoadingTimeLimit_PreCachingLimit);
    AddIntToMap("LoadingTimeLimit_WaitingForSuccessStartGameLimit", LoadingTimeLimit_WaitingForSuccessStartGameLimit);
    AddIntToMap("LoadingTimeLimit_WhenHostBlocking", LoadingTimeLimit_WhenHostBlocking);
    AddIntToMap("LoadingTimeLimit_WaitDummyPacketPhraseLimit", LoadingTimeLimit_WaitDummyPacketPhraseLimit);
    AddIntToMap("LoadingTimeLimit_WaitClientOutSideAddrInHost", LoadingTimeLimit_WaitClientOutSideAddrInHost);
    AddIntToMap("LoadingTimeLimit_WaitAckStartHolePunching", LoadingTimeLimit_WaitAckStartHolePunching);
    AddIntToMap("LoadingTimeLimit_WaitAckStartHolePunchingInClient", LoadingTimeLimit_WaitAckStartHolePunchingInClient);
    i = 0;
    J0x3AF:

    // End:0x434 [Loop If]
    if(i < 7)
    {
        AddStringToMap(("LoadingStateMessage[" $ string(i)) $ "]", LoadingStateMessage[i]);
        AddStringToMap(("OtherLoadingStateMessage[" $ string(i)) $ "]", OtherLoadingStateMessage[i]);
        i++;
        // [Loop Continue]
        goto J0x3AF;
    }
    //return;    
}

defaultproperties
{
    Udp_Default_ConnectionTimeOut=90.0000000
    Udp_Default_InitialConnectionTimeOut=90.0000000
    Udp_Loading_ConnectionTimeOut=600.0000000
    Udp_Loading_InitialConnectionTimeOut=600.0000000
    Tcp_TickCheck_Default_Host=10
    Tcp_TickCheck_Default_Client=45
    Tcp_TickCheck_Loading=600
    Tcp_TickCheck_UI=30
    Tcp_TickCheck_Reset=90
    LoadingTimeLimit_NATDiagTimeLimit=15
    LoadingTimeLimit_RegisterUDPAddrLimit=10
    LoadingTimeLimit_CheckDummyPacketLimit=20
    LoadingTimeLimit_LevelNegotiationLimit=300
    LoadingTimeLimit_PreCachingLimit=600
    LoadingTimeLimit_WaitingForSuccessStartGameLimit=20
    LoadingTimeLimit_WhenHostBlocking=300
    LoadingTimeLimit_WaitDummyPacketPhraseLimit=3
    LoadingTimeLimit_WaitClientOutSideAddrInHost=10
    LoadingTimeLimit_WaitAckStartHolePunching=5
    LoadingTimeLimit_WaitAckStartHolePunchingInClient=20
    LoadingStateMessage[0]="Connection to battlefield failed."
    LoadingStateMessage[1]="Accessing battlefield info…"
    LoadingStateMessage[2]="Processing data…"
    LoadingStateMessage[3]="Updating battle info…"
    LoadingStateMessage[4]="Updating combatant info…"
    LoadingStateMessage[5]="Updating combatant info…"
    LoadingStateMessage[6]="Ready to enter battlefield."
    OtherLoadingStateMessage[0]="Connection to battlefield failed."
    OtherLoadingStateMessage[1]="Loading…"
    OtherLoadingStateMessage[2]="Loading…"
    OtherLoadingStateMessage[3]="Loading…"
    OtherLoadingStateMessage[4]="Loading…"
    OtherLoadingStateMessage[5]="Loading…"
    OtherLoadingStateMessage[6]="Ready!"
    m_IniSection="wBtrInfoIni"
}