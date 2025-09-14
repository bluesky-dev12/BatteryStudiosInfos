/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_ServerListPageLAN.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:16
 *
 *******************************************************************************/
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
    // End:0x2a
    if(!bInit && bVisible)
    {
        SetTimer(10.0, true);
    }
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x29
    if(bShow)
    {
        SetTimer(10.0, true);
        bInit = false;
    }
    // End:0x2c
    else
    {
        KillTimer();
    }
}

function Timer()
{
    super(GUIComponent).Timer();
    RefreshList();
}

function Refresh()
{
    super.Refresh();
    ResetQueryClient(GetClient());
    RefreshList();
}

function RefreshList()
{
    local string S;

    CancelPings();
    S = li_Server.Get();
    // End:0x52
    if(S == "" || !Divide(S, ":", StoredIP, StoredPort))
    {
        StoredIP = "";
        StoredPort = "";
    }
    li_Server.Clear();
    GetClient().BroadcastPingRequest();
}

function ReceivedPingInfo(int ServerID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    local int i;

    // End:0x104
    if(ServerID < 0)
    {
        i = 0;
        J0x12:
        // End:0x89 [While If]
        if(i < li_Server.Servers.Length)
        {
            // End:0x7f
            if(li_Server.Servers[i].IP == S.IP && li_Server.Servers[i].Port == S.Port)
            {
                return;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x12;
        }
        li_Server.MyOnReceivedServer(S);
        // End:0x101
        if(StoredIP == S.IP && StoredPort == string(S.Port))
        {
            li_Server.SetIndex(li_Server.FindIndex(StoredIP, StoredPort));
            StoredIP = "";
            StoredPort = "";
        }
    }
    // End:0x1a8
    else
    {
        li_Server.MyReceivedPingInfo(ServerID, PingCause, S);
        // End:0x1a8
        if(StoredIP == S.IP && StoredPort == string(S.Port))
        {
            li_Server.bNotify = false;
            li_Server.SetIndex(li_Server.FindIndex(StoredIP, StoredPort));
            li_Server.bNotify = true;
            StoredIP = "";
            StoredPort = "";
        }
    }
}

function CancelPings()
{
    // End:0x18
    if(HasClient())
    {
        LQC.CancelPings();
    }
}

function PingServer(int ListID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    GetClient().PingServer(ListID, PingCause, S.IP, S.QueryPort, 3, S);
}

function UpdateStatusPingCount();
function bool HasClient()
{
    return LQC != none;
}

function LANQueryClient GetClient()
{
    local int i;

    // End:0x11d
    if(LQC == none)
    {
        LQC = PlayerOwner().Level.Spawn(class'LANQueryClient');
        Log(string(Name) @ "Spawning new LAN query client '" $ string(LQC) $ "'");
        // End:0x11d
        if(LQC != none && LQC.NetworkError())
        {
            Log(string(Name) @ "- Network error in query client - retrying  " $ string(i));
            LQC.Destroy();
            LQC = PlayerOwner().Spawn(class'LANQueryClient');
            // End:0x82
            if(!LQC.NetworkError() || ++ i < 10)
            	goto J0x82;
            // End:0x11d
            if(i >= 10)
            {
                ShowNetworkError();
                return none;
            }
        }
    }
    return LQC;
}

function OnDestroyPanel(optional bool bCancelled)
{
    super(GUITabPanel).OnDestroyPanel(bCancelled);
    ClearQueryClient();
}

function LevelChanged()
{
    super(GUIMultiComponent).LevelChanged();
    ClearQueryClient();
}

function free()
{
    super(GUITabPanel).free();
    ClearQueryClient();
}

protected function ClearQueryClient()
{
    // End:0x65
    if(LQC != none)
    {
        Log(string(Name) @ "Destroying LAN query client '" $ string(LQC) $ "'");
        LQC.CancelPings();
        LQC.Destroy();
        LQC = none;
    }
}

function NetworkErrorClosed(bool bCancelled)
{
    // End:0x11
    if(!bCancelled)
    {
        GetClient();
    }
}

defaultproperties
{
    ConnectLAN=true
    PanelCaption="?? ???? : ?"
}