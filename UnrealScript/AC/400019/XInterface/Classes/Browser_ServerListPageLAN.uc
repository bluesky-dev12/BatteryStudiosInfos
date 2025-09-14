class Browser_ServerListPageLAN extends Browser_ServerListPageBase
    editinlinenew
    instanced;

var LANQueryClient LQC;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    GUIButton(GUIPanel(Controls[1]).Controls[6]).bVisible = false;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).bVisible = false;
    StatusBar.WinWidth = 1.0000000;
    // End:0xD0
    if(LQC == none)
    {
        LQC = PlayerOwner().Level.Spawn(Class'IpDrv.LANQueryClient');
        LQC.__OnReceivedPingInfo__Delegate = MyReceivedPingInfo;
        LQC.__OnPingTimeout__Delegate = MyServersList.MyPingTimeout;
    }
    MyServersList.InitColumnPerc[0] = 0.0000000;
    MyServersList.InitColumnPerc[1] = 0.4700000;
    MyServersList.InitColumnPerc[2] = 0.2500000;
    MyServersList.InitColumnPerc[3] = 0.1300000;
    MyServersList.InitColumnPerc[4] = 0.1500000;
    RefreshList();
    //return;    
}

function OnCloseBrowser()
{
    // End:0x1E
    if(LQC != none)
    {
        LQC.Destroy();
        LQC = none;
    }
    //return;    
}

function MyReceivedPingInfo(int ServerID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    local int i;

    // End:0xA0
    if(ServerID < 0)
    {
        i = 0;
        J0x12:

        // End:0x89 [Loop If]
        if(i < MyServersList.Servers.Length)
        {
            // End:0x7F
            if((MyServersList.Servers[i].IP == S.IP) && MyServersList.Servers[i].Port == S.Port)
            {
                return;
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }
        MyServersList.MyOnReceivedServer(S);        
    }
    else
    {
        MyServersList.MyReceivedPingInfo(ServerID, PingCause, S);
    }
    //return;    
}

function PingServer(int ListID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    LQC.PingServer(ListID, PingCause, S.IP, S.QueryPort, 3, S);
    //return;    
}

function CancelPings()
{
    LQC.CancelPings();
    //return;    
}

function RefreshList()
{
    MyServersList.Clear();
    CancelPings();
    LQC.BroadcastPingRequest();
    //return;    
}

defaultproperties
{
    ConnectLAN=true
}