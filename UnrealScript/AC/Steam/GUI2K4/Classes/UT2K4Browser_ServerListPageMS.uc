/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4Browser_ServerListPageMS.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:7
 *
 *******************************************************************************/
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
}

function Refresh()
{
    // End:0x2b
    if(UT2k4ServerBrowser(PageOwner).Verified)
    {
        UT2k4ServerBrowser(PageOwner).ClearServerCache();
    }
    super.Refresh();
    ResetQueryClient(Browser.Uplink());
}

function ResetQueryClient(ServerQueryClient Client)
{
    super(UT2K4Browser_Page).ResetQueryClient(Client);
    // End:0x31
    if(MasterServerClient(Client) != none)
    {
        MasterServerClient(Client).Query.Length = 0;
    }
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
}

function QueryComplete(IpDrv.MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    li_Server.MyQueryFinished(ResponseInfo, Info);
    switch(ResponseInfo)
    {
        // End:0x5d
        case 3:
            SetFooterCaption(Repl(QueryCompleteString, "%NumServers%", string(Browser.Uplink().ResultCount)));
            // End:0xfc
            break;
        // End:0x70
        case 0:
            SetFooterCaption(AuthFailString);
            // End:0xfc
            break;
        // End:0xab
        case 1:
            UT2k4ServerBrowser(PageOwner).GetFromServerCache(li_Server);
            li_Server.FakeFinished();
            SetFooterCaption(ConnFailString);
            // End:0xfc
            break;
        // End:0xe6
        case 2:
            UT2k4ServerBrowser(PageOwner).GetFromServerCache(li_Server);
            li_Server.FakeFinished();
            SetFooterCaption(ConnTimeoutString);
            // End:0xfc
            break;
        // End:0xf9
        case 4:
            SetFooterCaption(MustUpgradeString);
            // End:0xfc
            break;
        // End:0xffff
        default:
}

function ReceivedPingInfo(int ServerID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    super(UT2K4Browser_Page).ReceivedPingInfo(ServerID, PingCause, S);
    li_Server.MyReceivedPingInfo(ServerID, PingCause, S);
    // End:0x49
    if(PingCause == 2)
    {
        UpdateStatusPingCount();
    }
}

function ReceivedPingTimeout(int ListID, IpDrv.ServerQueryClient.EPingCause PingCause)
{
    super(UT2K4Browser_Page).ReceivedPingTimeout(ListID, PingCause);
    li_Server.MyPingTimeout(ListID, PingCause);
    // End:0x3f
    if(PingCause == 2)
    {
        UpdateStatusPingCount();
    }
}

defaultproperties
{
    PanelCaption="?? ???? : ???"
}