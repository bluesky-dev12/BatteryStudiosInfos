class Browser_ServerListPageMS extends Browser_ServerListPageBase
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

function AddQueryTerm(string key, string GameType, MasterServerClient.EQueryType QueryType)
{
    local QueryData QD;
    local int i;

    QD.key = key;
    QD.Value = GameType;
    QD.QueryType = QueryType;
    i = MSC.Query.Length;
    MSC.Query.Length = i + 1;
    MSC.Query[i] = QD;
    //return;    
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
    // End:0x8C
    if(Browser.bOnlyShowNonPassword)
    {
        AddQueryTerm("password", "false", 0);
    }
    // End:0xB4
    if(Browser.bDontShowFull)
    {
        AddQueryTerm("freespace", "0", 4);
    }
    // End:0xE1
    if(Browser.bDontShowEmpty)
    {
        AddQueryTerm("currentplayers", "0", 4);
    }
    // End:0x112
    if(int(Browser.StatsServerView) == int(1))
    {
        AddQueryTerm("stats", "true", 0);        
    }
    else
    {
        // End:0x141
        if(int(Browser.StatsServerView) == int(2))
        {
            AddQueryTerm("stats", "false", 0);
        }
    }
    dotPos = InStr(Browser.DesiredMutator, ".");
    // End:0x17C
    if(dotPos < 0)
    {
        TmpString = Browser.DesiredMutator;        
    }
    else
    {
        TmpString = Mid(Browser.DesiredMutator, dotPos + 1);
    }
    // End:0x1C9
    if(int(Browser.ViewMutatorMode) == int(1))
    {
        AddQueryTerm("mutator", "", 0);        
    }
    else
    {
        // End:0x209
        if((int(Browser.ViewMutatorMode) == int(2)) && TmpString != "")
        {
            AddQueryTerm("mutator", TmpString, 0);            
        }
        else
        {
            // End:0x246
            if((int(Browser.ViewMutatorMode) == int(3)) && TmpString != "")
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
    else
    {
        TmpString = Mid(Browser.DesiredMutator2, dotPos + 1);
    }
    // End:0x335
    if(int(Browser.ViewMutatorMode) != int(0))
    {
        // End:0x2F8
        if((int(Browser.ViewMutator2Mode) == int(2)) && TmpString != "")
        {
            AddQueryTerm("mutator", TmpString, 0);            
        }
        else
        {
            // End:0x335
            if((int(Browser.ViewMutator2Mode) == int(3)) && TmpString != "")
            {
                AddQueryTerm("mutator", TmpString, 1);
            }
        }
    }
    // End:0x35D
    if(Browser.bDontShowWithBots)
    {
        AddQueryTerm("nobots", "true", 0);
    }
    // End:0x393
    if(int(Browser.WeaponStayServerView) == int(1))
    {
        AddQueryTerm("weaponstay", "true", 0);        
    }
    else
    {
        // End:0x3C7
        if(int(Browser.WeaponStayServerView) == int(2))
        {
            AddQueryTerm("weaponstay", "false", 0);
        }
    }
    // End:0x3FB
    if(int(Browser.TranslocServerView) == int(1))
    {
        AddQueryTerm("transloc", "true", 0);        
    }
    else
    {
        // End:0x42D
        if(int(Browser.TranslocServerView) == int(2))
        {
            AddQueryTerm("transloc", "false", 0);
        }
    }
    // End:0x4D3
    if(((Browser.MinGamespeed != 0) || Browser.MaxGamespeed != 200) && Browser.MaxGamespeed >= Browser.MinGamespeed)
    {
        AddQueryTerm("gamespeed", string(float(Browser.MinGamespeed) / 100.0000000), 5);
        AddQueryTerm("gamespeed", string(float(Browser.MaxGamespeed) / 100.0000000), 3);
    }
    // End:0x515
    if(Browser.CustomQuery != "")
    {
        TmpString = Left(Browser.CustomQuery, 32);
        AddQueryTerm("custom", TmpString, 0);
    }
    MSC.StartQuery(0);
    StatusBar.SetCaption(StartQueryString);
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x8C
    if(bShow)
    {
        // End:0x56
        if(!bStarted)
        {
            Log(MyButton.Caption $ ": Initial refresh");
            RefreshList();
            bStarted = true;            
        }
        else
        {
            Log(MyButton.Caption $ ": Resuming pings");
            MyServersList.AutoPingServers();
        }        
    }
    else
    {
        Log(MyButton.Caption $ ": Cancelling pings");
        MyServersList.StopPings();
    }
    //return;    
}

function OnCloseBrowser()
{
    // End:0x2D
    if(MSC != none)
    {
        MSC.CancelPings();
        MSC.Destroy();
        MSC = none;
    }
    //return;    
}

function PingServer(int ListID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    // End:0x47
    if(int(PingCause) == int(1))
    {
        MSC.PingServer(ListID, PingCause, S.IP, S.QueryPort, 3, S);        
    }
    else
    {
        MSC.PingServer(ListID, PingCause, S.IP, S.QueryPort, 0, S);
    }
    //return;    
}

function CancelPings()
{
    MSC.CancelPings();
    //return;    
}

function UpdateStatusPingCount()
{
    // End:0x6D
    if(MyServersList.NumReceivedPings < MyServersList.Servers.Length)
    {
        StatusBar.SetCaption(((((PingRecvString @ "(") $ string(MyServersList.NumReceivedPings)) $ "/") $ string(MyServersList.Servers.Length)) $ ")");        
    }
    else
    {
        StatusBar.SetCaption((((RefreshFinHead @ string(MyServersList.Servers.Length)) @ RefreshFinMid) @ string(MyServersList.NumPlayers)) @ RefreshFinTail);
    }
    //return;    
}

function MyReceivedPingInfo(int ServerID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    MyServersList.MyReceivedPingInfo(ServerID, PingCause, S);
    // End:0x34
    if(int(PingCause) == int(2))
    {
        UpdateStatusPingCount();
    }
    //return;    
}

function MyPingTimeout(int ListID, ServerQueryClient.EPingCause PingCause)
{
    MyServersList.MyPingTimeout(ListID, PingCause);
    // End:0x2F
    if(int(PingCause) == int(2))
    {
        UpdateStatusPingCount();
    }
    //return;    
}

function MyQueryFinished(MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    MyServersList.MyQueryFinished(ResponseInfo, Info);
    switch(ResponseInfo)
    {
        // End:0x55
        case 3:
            StatusBar.SetCaption((QueryFinHead $ string(MSC.ResultCount)) $ QueryFinTail);
            // End:0xC8
            break;
        // End:0x71
        case 0:
            StatusBar.SetCaption(AuthFailString);
            // End:0xC8
            break;
        // End:0x8D
        case 1:
            StatusBar.SetCaption(ConnFailString);
            // End:0xC8
            break;
        // End:0xA9
        case 2:
            StatusBar.SetCaption(ConnTimeoutString);
            // End:0xC8
            break;
        // End:0xC5
        case 4:
            StatusBar.SetCaption(MustUpgradeString);
            // End:0xC8
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function bool MyRePing(GUIComponent Sender)
{
    MyServersList.RePingServers();
    return true;
    //return;    
}

function bool MyRefreshClick(GUIComponent Sender)
{
    RefreshClick(Sender);
    return true;
    //return;    
}

function InitComponent(GUIController C, GUIComponent o)
{
    super.InitComponent(C, o);
    // End:0x92
    if(MSC == none)
    {
        MSC = PlayerOwner().Level.Spawn(Class'IpDrv.MasterServerClient');
        MSC.__OnReceivedServer__Delegate = MyServersList.MyOnReceivedServer;
        MSC.__OnQueryFinished__Delegate = MyQueryFinished;
        MSC.__OnReceivedPingInfo__Delegate = MyReceivedPingInfo;
        MSC.__OnPingTimeout__Delegate = MyPingTimeout;
    }
    StatusBar.WinWidth = 0.8000000;
    GUIButton(GUIPanel(Controls[1]).Controls[6]).bVisible = false;
    GUIButton(GUIPanel(Controls[1]).Controls[1]).Caption = RePingServersCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[1]).__OnClick__Delegate = MyRePing;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).Caption = RefreshCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).__OnClick__Delegate = MyRefreshClick;
    //return;    
}

defaultproperties
{
    QueryFinHead="Query finished.  Receiving "
    QueryFinTail=" servers."
    PingRecvString="Pinging servers…"
    MustUpgradeString="Update available. News page will be updated."
    RefreshFinHead="Ping completed."
    RefreshFinMid=" servers, "
    RefreshFinTail=" players"
    RePingServersCaption="Re-ping list"
    RefreshCaption="Update list"
}