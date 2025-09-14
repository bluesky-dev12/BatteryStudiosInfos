class UT2k4Browser_ServerListPageLAN extends UT2k4Browser_ServerListPageBase
    config(User)
    editinlinenew
    instanced;

var() private LANQueryClient LQC;
var() string StoredIP;
var() string StoredPort;

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    // End:0x2A
    if(!bInit && bVisible)
    {
        SetTimer(10.0000000, true);
    }
    //return;    
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x29
    if(bShow)
    {
        SetTimer(10.0000000, true);
        bInit = false;        
    }
    else
    {
        KillTimer();
    }
    //return;    
}

function Timer()
{
    super(GUIComponent).Timer();
    RefreshList();
    //return;    
}

function Refresh()
{
    super.Refresh();
    ResetQueryClient(GetClient());
    RefreshList();
    //return;    
}

function RefreshList()
{
    local string S;

    CancelPings();
    S = li_Server.Get();
    // End:0x52
    if((S == "") || !Divide(S, ":", StoredIP, StoredPort))
    {
        StoredIP = "";
        StoredPort = "";
    }
    li_Server.Clear();
    GetClient().BroadcastPingRequest();
    //return;    
}

function ReceivedPingInfo(int ServerID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    local int i;

    // End:0x104
    if(ServerID < 0)
    {
        i = 0;
        J0x12:

        // End:0x89 [Loop If]
        if(i < li_Server.Servers.Length)
        {
            // End:0x7F
            if((li_Server.Servers[i].IP == S.IP) && li_Server.Servers[i].Port == S.Port)
            {
                return;
            }
            i++;
            // [Loop Continue]
            goto J0x12;
        }
        li_Server.MyOnReceivedServer(S);
        // End:0x101
        if((StoredIP == S.IP) && StoredPort == string(S.Port))
        {
            li_Server.SetIndex(li_Server.FindIndex(StoredIP, StoredPort));
            StoredIP = "";
            StoredPort = "";
        }        
    }
    else
    {
        li_Server.MyReceivedPingInfo(ServerID, PingCause, S);
        // End:0x1A8
        if((StoredIP == S.IP) && StoredPort == string(S.Port))
        {
            li_Server.bNotify = false;
            li_Server.SetIndex(li_Server.FindIndex(StoredIP, StoredPort));
            li_Server.bNotify = true;
            StoredIP = "";
            StoredPort = "";
        }
    }
    //return;    
}

function CancelPings()
{
    // End:0x18
    if(HasClient())
    {
        LQC.CancelPings();
    }
    //return;    
}

function PingServer(int ListID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    GetClient().PingServer(ListID, PingCause, S.IP, S.QueryPort, 3, S);
    //return;    
}

function UpdateStatusPingCount()
{
    //return;    
}

function bool HasClient()
{
    return LQC != none;
    //return;    
}

function LANQueryClient GetClient()
{
    local int i;

    // End:0x11D
    if(LQC == none)
    {
        LQC = PlayerOwner().Level.Spawn(Class'IpDrv.LANQueryClient');
        Log(((string(Name) @ "Spawning new LAN query client '") $ string(LQC)) $ "'");
        // End:0x11D
        if((LQC != none) && LQC.NetworkError())
        {
            J0x82:

            Log((string(Name) @ "- Network error in query client - retrying  ") $ string(i));
            LQC.Destroy();
            LQC = PlayerOwner().Spawn(Class'IpDrv.LANQueryClient');
            // End:0x82
            if(!(!LQC.NetworkError() || ++i < 10))
                goto J0x82;
            // End:0x11D
            if(i >= 10)
            {
                ShowNetworkError();
                return none;
            }
        }
    }
    return LQC;
    //return;    
}

function OnDestroyPanel(optional bool bCancelled)
{
    super(GUITabPanel).OnDestroyPanel(bCancelled);
    ClearQueryClient();
    //return;    
}

function LevelChanged()
{
    super(GUIMultiComponent).LevelChanged();
    ClearQueryClient();
    //return;    
}

function free()
{
    super(GUITabPanel).free();
    ClearQueryClient();
    //return;    
}

protected function ClearQueryClient()
{
    // End:0x65
    if(LQC != none)
    {
        Log(((string(Name) @ "Destroying LAN query client '") $ string(LQC)) $ "'");
        LQC.CancelPings();
        LQC.Destroy();
        LQC = none;
    }
    //return;    
}

function NetworkErrorClosed(bool bCancelled)
{
    // End:0x11
    if(!bCancelled)
    {
        GetClient();
    }
    //return;    
}

defaultproperties
{
    ConnectLAN=true
    PanelCaption="?? ???? : ?"
}