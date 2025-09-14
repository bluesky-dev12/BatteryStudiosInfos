/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_ServerListPageMS.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:13
 *
 *******************************************************************************/
class Browser_ServerListPageMS extends Browser_ServerListPageBase
    dependson(Browser_ServerListPageBase)
    editinlinenew
    instanced;

var() string GameType;
var() MasterServerClient MSC;
var() bool bStarted;
var localized string QueryFinHead;
var localized string QueryFinTail;
var localized string PingRecvString;
var localized string MustUpgradeString;
var localized string RefreshFinHead;
var localized string RefreshFinMid;
var localized string RefreshFinTail;
var localized string RePingServersCaption;
var localized string RefreshCaption;

function AddQueryTerm(string key, string GameType, IpDrv.MasterServerClient.EQueryType QueryType)
{
    local QueryData QD;
    local int i;

    QD.key = key;
    QD.Value = GameType;
    QD.QueryType = QueryType;
    i = MSC.Query.Length;
    MSC.Query.Length = i + 1;
    MSC.Query[i] = QD;
}

function RefreshList()
{
    local int dotPos;
    local string TmpString;

    MyServersList.Clear();
    MSC.Query.Length = 0;
    AddQueryTerm("gametype", GameType, 0);
    // End:0x61
    if(Browser.bOnlyShowStandard)
    {
        AddQueryTerm("standard", "true", 0);
    }
    // End:0x8c
    if(Browser.bOnlyShowNonPassword)
    {
        AddQueryTerm("password", "false", 0);
    }
    // End:0xb4
    if(Browser.bDontShowFull)
    {
        AddQueryTerm("freespace", "0", 4);
    }
    // End:0xe1
    if(Browser.bDontShowEmpty)
    {
        AddQueryTerm("currentplayers", "0", 4);
    }
    // End:0x112
    if(Browser.StatsServerView == 1)
    {
        AddQueryTerm("stats", "true", 0);
    }
    // End:0x141
    else
    {
        // End:0x141
        if(Browser.StatsServerView == 2)
        {
            AddQueryTerm("stats", "false", 0);
        }
    }
    dotPos = InStr(Browser.DesiredMutator, ".");
    // End:0x17c
    if(dotPos < 0)
    {
        TmpString = Browser.DesiredMutator;
    }
    // End:0x19a
    else
    {
        TmpString = Mid(Browser.DesiredMutator, dotPos + 1);
    }
    // End:0x1c9
    if(Browser.ViewMutatorMode == 1)
    {
        AddQueryTerm("mutator", "", 0);
    }
    // End:0x246
    else
    {
        // End:0x209
        if(Browser.ViewMutatorMode == 2 && TmpString != "")
        {
            AddQueryTerm("mutator", TmpString, 0);
        }
        // End:0x246
        else
        {
            // End:0x246
            if(Browser.ViewMutatorMode == 3 && TmpString != "")
            {
                AddQueryTerm("mutator", TmpString, 1);
            }
        }
    }
    dotPos = InStr(Browser.DesiredMutator2, ".");
    // End:0x281
    if(dotPos < 0)
    {
        TmpString = Browser.DesiredMutator2;
    }
    // End:0x29f
    else
    {
        TmpString = Mid(Browser.DesiredMutator2, dotPos + 1);
    }
    // End:0x335
    if(Browser.ViewMutatorMode != 0)
    {
        // End:0x2f8
        if(Browser.ViewMutator2Mode == 2 && TmpString != "")
        {
            AddQueryTerm("mutator", TmpString, 0);
        }
        // End:0x335
        else
        {
            // End:0x335
            if(Browser.ViewMutator2Mode == 3 && TmpString != "")
            {
                AddQueryTerm("mutator", TmpString, 1);
            }
        }
    }
    // End:0x35d
    if(Browser.bDontShowWithBots)
    {
        AddQueryTerm("nobots", "true", 0);
    }
    // End:0x393
    if(Browser.WeaponStayServerView == 1)
    {
        AddQueryTerm("weaponstay", "true", 0);
    }
    // End:0x3c7
    else
    {
        // End:0x3c7
        if(Browser.WeaponStayServerView == 2)
        {
            AddQueryTerm("weaponstay", "false", 0);
        }
    }
    // End:0x3fb
    if(Browser.TranslocServerView == 1)
    {
        AddQueryTerm("transloc", "true", 0);
    }
    // End:0x42d
    else
    {
        // End:0x42d
        if(Browser.TranslocServerView == 2)
        {
            AddQueryTerm("transloc", "false", 0);
        }
    }
    // End:0x4d3
    if(Browser.MinGamespeed != 0 || Browser.MaxGamespeed != 200 && Browser.MaxGamespeed >= Browser.MinGamespeed)
    {
        AddQueryTerm("gamespeed", string(float(Browser.MinGamespeed) / 100.0), 5);
        AddQueryTerm("gamespeed", string(float(Browser.MaxGamespeed) / 100.0), 3);
    }
    // End:0x515
    if(Browser.CustomQuery != "")
    {
        TmpString = Left(Browser.CustomQuery, 32);
        AddQueryTerm("custom", TmpString, 0);
    }
    MSC.StartQuery(0);
    StatusBar.SetCaption(StartQueryString);
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x8c
    if(bShow)
    {
        // End:0x56
        if(!bStarted)
        {
            Log(MyButton.Caption $ ": Initial refresh");
            RefreshList();
            bStarted = true;
        }
        // End:0x89
        else
        {
            Log(MyButton.Caption $ ": Resuming pings");
            MyServersList.AutoPingServers();
        }
    }
    // End:0xc1
    else
    {
        Log(MyButton.Caption $ ": Cancelling pings");
        MyServersList.StopPings();
    }
}

function OnCloseBrowser()
{
    // End:0x2d
    if(MSC != none)
    {
        MSC.CancelPings();
        MSC.Destroy();
        MSC = none;
    }
}

function PingServer(int ListID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    // End:0x47
    if(PingCause == 1)
    {
        MSC.PingServer(ListID, PingCause, S.IP, S.QueryPort, 3, S);
    }
    // End:0x7b
    else
    {
        MSC.PingServer(ListID, PingCause, S.IP, S.QueryPort, 0, S);
    }
}

function CancelPings()
{
    MSC.CancelPings();
}

function UpdateStatusPingCount()
{
    // End:0x6d
    if(MyServersList.NumReceivedPings < MyServersList.Servers.Length)
    {
        StatusBar.SetCaption(PingRecvString @ "(" $ string(MyServersList.NumReceivedPings) $ "/" $ string(MyServersList.Servers.Length) $ ")");
    }
    // End:0xb4
    else
    {
        StatusBar.SetCaption(RefreshFinHead @ string(MyServersList.Servers.Length) @ RefreshFinMid @ string(MyServersList.NumPlayers) @ RefreshFinTail);
    }
}

function MyReceivedPingInfo(int ServerID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    MyServersList.MyReceivedPingInfo(ServerID, PingCause, S);
    // End:0x34
    if(PingCause == 2)
    {
        UpdateStatusPingCount();
    }
}

function MyPingTimeout(int ListID, IpDrv.ServerQueryClient.EPingCause PingCause)
{
    MyServersList.MyPingTimeout(ListID, PingCause);
    // End:0x2f
    if(PingCause == 2)
    {
        UpdateStatusPingCount();
    }
}

function MyQueryFinished(IpDrv.MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    MyServersList.MyQueryFinished(ResponseInfo, Info);
    switch(ResponseInfo)
    {
        // End:0x55
        case 3:
            StatusBar.SetCaption(QueryFinHead $ string(MSC.ResultCount) $ QueryFinTail);
            // End:0xc8
            break;
        // End:0x71
        case 0:
            StatusBar.SetCaption(AuthFailString);
            // End:0xc8
            break;
        // End:0x8d
        case 1:
            StatusBar.SetCaption(ConnFailString);
            // End:0xc8
            break;
        // End:0xa9
        case 2:
            StatusBar.SetCaption(ConnTimeoutString);
            // End:0xc8
            break;
        // End:0xc5
        case 4:
            StatusBar.SetCaption(MustUpgradeString);
            // End:0xc8
            break;
        // End:0xffff
        default:
}

function bool MyRePing(GUIComponent Sender)
{
    MyServersList.RePingServers();
    return true;
}

function bool MyRefreshClick(GUIComponent Sender)
{
    RefreshClick(Sender);
    return true;
}

function InitComponent(GUIController C, GUIComponent o)
{
    super.InitComponent(C, o);
    // End:0x92
    if(MSC == none)
    {
        MSC = PlayerOwner().Level.Spawn(class'MasterServerClient');
        MSC.__OnReceivedServer__Delegate = MyServersList.MyOnReceivedServer;
        MSC.__OnQueryFinished__Delegate = MyQueryFinished;
        MSC.__OnReceivedPingInfo__Delegate = MyReceivedPingInfo;
        MSC.__OnPingTimeout__Delegate = MyPingTimeout;
    }
    StatusBar.WinWidth = 0.80;
    GUIButton(GUIPanel(Controls[1]).Controls[6]).bVisible = false;
    GUIButton(GUIPanel(Controls[1]).Controls[1]).Caption = RePingServersCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[1]).__OnClick__Delegate = MyRePing;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).Caption = RefreshCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).__OnClick__Delegate = MyRefreshClick;
}

defaultproperties
{
    QueryFinHead="Query finished.  Receiving "
    QueryFinTail=" servers."
    PingRecvString="Pinging servers?"
    MustUpgradeString="Update available. News page will be updated."
    RefreshFinHead="Ping completed."
    RefreshFinMid=" servers, "
    RefreshFinTail=" players"
    RePingServersCaption="Re-ping list"
    RefreshCaption="Update list"
}