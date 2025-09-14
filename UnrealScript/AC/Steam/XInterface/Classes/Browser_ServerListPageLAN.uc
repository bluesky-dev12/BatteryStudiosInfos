/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_ServerListPageLAN.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:6
 *
 *******************************************************************************/
class Browser_ServerListPageLAN extends Browser_ServerListPageBase
    editinlinenew
    instanced;

var LANQueryClient LQC;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    GUIButton(GUIPanel(Controls[1]).Controls[6]).bVisible = false;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).bVisible = false;
    StatusBar.WinWidth = 1.0;
    // End:0xd0
    if(LQC == none)
    {
        LQC = PlayerOwner().Level.Spawn(class'LANQueryClient');
        LQC.__OnReceivedPingInfo__Delegate = MyReceivedPingInfo;
        LQC.__OnPingTimeout__Delegate = MyServersList.MyPingTimeout;
    }
    MyServersList.InitColumnPerc[0] = 0.0;
    MyServersList.InitColumnPerc[1] = 0.470;
    MyServersList.InitColumnPerc[2] = 0.250;
    MyServersList.InitColumnPerc[3] = 0.130;
    MyServersList.InitColumnPerc[4] = 0.150;
    RefreshList();
}

function OnCloseBrowser()
{
    // End:0x1e
    if(LQC != none)
    {
        LQC.Destroy();
        LQC = none;
    }
}

function MyReceivedPingInfo(int ServerID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    local int i;

    // End:0xa0
    if(ServerID < 0)
    {
        i = 0;
        J0x12:
        // End:0x89 [While If]
        if(i < MyServersList.Servers.Length)
        {
            // End:0x7f
            if(MyServersList.Servers[i].IP == S.IP && MyServersList.Servers[i].Port == S.Port)
            {
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
        MyServersList.MyOnReceivedServer(S);
    }
    // End:0xbe
    else
    {
        MyServersList.MyReceivedPingInfo(ServerID, PingCause, S);
    }
}

function PingServer(int ListID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    LQC.PingServer(ListID, PingCause, S.IP, S.QueryPort, 3, S);
}

function CancelPings()
{
    LQC.CancelPings();
}

function RefreshList()
{
    MyServersList.Clear();
    CancelPings();
    LQC.BroadcastPingRequest();
}

defaultproperties
{
    ConnectLAN=true
}