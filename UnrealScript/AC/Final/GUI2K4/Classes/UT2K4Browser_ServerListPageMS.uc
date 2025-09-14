class UT2K4Browser_ServerListPageMS extends UT2k4Browser_ServerListPageBase
    config(User)
    editinlinenew
    instanced;

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x37
    if(bShow && !bInit)
    {
        BindQueryClient(Browser.Uplink());
    }
    //return;    
}

function Refresh()
{
    // End:0x2B
    if(UT2k4ServerBrowser(PageOwner).Verified)
    {
        UT2k4ServerBrowser(PageOwner).ClearServerCache();
    }
    super.Refresh();
    ResetQueryClient(Browser.Uplink());
    //return;    
}

function ResetQueryClient(ServerQueryClient Client)
{
    super(UT2K4Browser_Page).ResetQueryClient(Client);
    // End:0x31
    if(MasterServerClient(Client) != none)
    {
        MasterServerClient(Client).Query.Length = 0;
    }
    //return;    
}

function BindQueryClient(ServerQueryClient Client)
{
    super(UT2K4Browser_Page).BindQueryClient(Client);
    // End:0x56
    if(MasterServerClient(Client) != none)
    {
        MasterServerClient(Client).__OnQueryFinished__Delegate = QueryComplete;
        MasterServerClient(Client).__OnReceivedServer__Delegate = li_Server.MyOnReceivedServer;
    }
    //return;    
}

function QueryComplete(MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    li_Server.MyQueryFinished(ResponseInfo, Info);
    switch(ResponseInfo)
    {
        // End:0x5D
        case 3:
            SetFooterCaption(Repl(QueryCompleteString, "%NumServers%", string(Browser.Uplink().ResultCount)));
            // End:0xFC
            break;
        // End:0x70
        case 0:
            SetFooterCaption(AuthFailString);
            // End:0xFC
            break;
        // End:0xAB
        case 1:
            UT2k4ServerBrowser(PageOwner).GetFromServerCache(li_Server);
            li_Server.FakeFinished();
            SetFooterCaption(ConnFailString);
            // End:0xFC
            break;
        // End:0xE6
        case 2:
            UT2k4ServerBrowser(PageOwner).GetFromServerCache(li_Server);
            li_Server.FakeFinished();
            SetFooterCaption(ConnTimeoutString);
            // End:0xFC
            break;
        // End:0xF9
        case 4:
            SetFooterCaption(MustUpgradeString);
            // End:0xFC
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function ReceivedPingInfo(int ServerID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    super(UT2K4Browser_Page).ReceivedPingInfo(ServerID, PingCause, S);
    li_Server.MyReceivedPingInfo(ServerID, PingCause, S);
    // End:0x49
    if(int(PingCause) == int(2))
    {
        UpdateStatusPingCount();
    }
    //return;    
}

function ReceivedPingTimeout(int ListID, ServerQueryClient.EPingCause PingCause)
{
    super(UT2K4Browser_Page).ReceivedPingTimeout(ListID, PingCause);
    li_Server.MyPingTimeout(ListID, PingCause);
    // End:0x3F
    if(int(PingCause) == int(2))
    {
        UpdateStatusPingCount();
    }
    //return;    
}

defaultproperties
{
    PanelCaption="?? ???? : ???"
}