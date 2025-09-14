class UT2K4QuickPlay extends LargeWindow
    config(User)
    editinlinenew
    instanced;

var() automated GUIImage i_Border;
var() automated GUILabel l_Status;
var() automated GUILabel l_ServerCount;
var() automated moComboBox co_Game;
var() automated moComboBox co_Difficulty;
var() automated GUIButton b_QuickConnect;
var() automated GUIButton b_lClose;
var MasterServerClient MSC;
var localized array<localized string> DifficultyOptions;
var bool bPendingSearch;
var int ThreadCount;
var array<int> PingQueue;
var int QuickConnectSeconds;
var config int MaxWaitSeconds;
var array<ServerResponseLine> Servers;
var localized string PlayText;
var localized string SearchingText;
var localized string ReadyText;
var localized string ConnectText;
var localized string CancelText;
var localized string ConnectHint;
var localized string CancelHint;
var localized string BeginningSearchText;
var localized string AuthFailedText;
var localized string ServerCountText;
var localized string SearchCancelledText;
var localized string ConnectionFailedText;
var localized string TimedOutText;
var localized string NoServersReceivedText;
var localized string NoValidText;
//var delegate<OnOpenConnection> __OnOpenConnection__Delegate;
//var delegate<OnCloseConnection> __OnCloseConnection__Delegate;

delegate OnOpenConnection()
{
    //return;    
}

delegate OnCloseConnection()
{
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent MyComponent)
{
    local int i;

    super(FloatingWindow).InitComponent(MyController, MyComponent);
    i = 0;
    J0x17:

    // End:0x4B [Loop If]
    if(i < DifficultyOptions.Length)
    {
        co_Difficulty.AddItem(DifficultyOptions[i]);
        i++;
        // [Loop Continue]
        goto J0x17;
    }
    StatusTimer(none);
    ChangeQuickPlayStatus(false);
    //return;    
}

event Opened(GUIComponent Sender)
{
    local int i;
    local array<GameRecord> Records;

    super(PopupPageBase).Opened(Sender);
    Class'Engine.CacheManager'.static.GetGameTypeList(Records);
    i = 0;
    J0x23:

    // End:0x6D [Loop If]
    if(i < Records.Length)
    {
        co_Game.AddItem(Records[i].GameName,, Records[i].ClassName);
        i++;
        // [Loop Continue]
        goto J0x23;
    }
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    CloseMSConnection();
    //return;    
}

event free()
{
    super(GUIPage).free();
    CloseMSConnection();
    //return;    
}

function bool NotifyLevelChange()
{
    CloseMSConnection();
    return super(GUIPage).NotifyLevelChange();
    //return;    
}

function CloseMSConnection()
{
    KillTimer();
    // End:0x2C
    if(MSC != none)
    {
        MSC.CancelPings();
        MSC.Stop();
    }
    MSC = none;
    //return;    
}

function AddQueryTerm(coerce string key, coerce string Value, MasterServerClient.EQueryType QueryType)
{
    local QueryData QD;
    local int i;

    i = 0;
    J0x07:

    // End:0x8A [Loop If]
    if(i < MSC.Query.Length)
    {
        QD = MSC.Query[i];
        // End:0x80
        if(((QD.key ~= key) && QD.Value ~= Value) && int(QD.QueryType) == int(QueryType))
        {
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    QD.key = key;
    QD.Value = Value;
    QD.QueryType = QueryType;
    MSC.Query[i] = QD;
    //return;    
}

function HandleObject(Object obj, optional Object OptionalObj_1, optional Object OptionalObj_2)
{
    MSC = MasterServerClient(obj);
    //return;    
}

event Timer()
{
    // End:0x46
    if((PlayerOwner() != none) && (PlayerOwner().Level.TimeSeconds - float(QuickConnectSeconds)) > float(MaxWaitSeconds))
    {
        SetStatusCaption(NoValidText);
        CancelQuickPlay();
    }
    UpdateQueue();
    //return;    
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x6E
    if(Sender == b_QuickConnect)
    {
        // End:0x2C
        if(QuickConnectPending())
        {
            CancelQuickPlay();
            SetStatusCaption(SearchCancelledText);            
        }
        else
        {
            SetStatusCaption(BeginningSearchText @ co_Game.GetText());
            CreateQuickPlayQuery(co_Game.GetExtra(), co_Difficulty.GetIndex());
        }
        return true;
    }
    // End:0x8F
    if(Sender == b_lClose)
    {
        Controller.CloseMenu(false);
        return true;
    }
    return false;
    //return;    
}

function CreateQuickPlayQuery(string GameType, int Index)
{
    local int pos;

    ResetQueryClient(MSC);
    ChangeQuickPlayStatus(true);
    pos = InStr(GameType, ".");
    // End:0x46
    if(pos != -1)
    {
        GameType = Mid(GameType, pos + 1);
    }
    AddQueryTerm("gametype", GameType, 0);
    AddQueryTerm("category", string(Index), 0);
    AddQueryTerm("standard", "true", 0);
    AddQueryTerm("password", "false", 0);
    AddQueryTerm("currentplayers", "0", 4);
    AddQueryTerm("freespace", "0", 4);
    QuickConnectSeconds = int(PlayerOwner().Level.TimeSeconds);
    MSC.StartQuery(0);
    //return;    
}

function QueryComplete(MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    switch(ResponseInfo)
    {
        // End:0x18
        case 3:
            SetTimer(0.1000000, true);
            // End:0x66
            break;
        // End:0x31
        case 0:
            SetStatusCaption(AuthFailedText);
            CancelQuickPlay();
            // End:0x66
            break;
        // End:0x4A
        case 1:
            SetStatusCaption(ConnectionFailedText);
            CancelQuickPlay();
            // End:0x66
            break;
        // End:0x63
        case 2:
            SetStatusCaption(TimedOutText);
            CancelQuickPlay();
            // End:0x66
            break;
        // End:0xFFFF
        default:
            break;
    }
    //return;    
}

function CancelQuickPlay()
{
    MSC.CancelPings();
    ChangeQuickPlayStatus(false);
    //return;    
}

function ChangeQuickPlayStatus(bool bIsSearching)
{
    bPendingSearch = bIsSearching;
    // End:0x4C
    if(QuickConnectPending())
    {
        SetStatusCaption(SearchingText);
        b_QuickConnect.Caption = CancelText;
        b_QuickConnect.SetHint(CancelHint);        
    }
    else
    {
        KillTimer();
        l_Status.SetTimer(2.5000000, false);
        b_QuickConnect.Caption = ConnectText;
        b_QuickConnect.SetHint(ConnectHint);
    }
    //return;    
}

function ResetQueryClient(ServerQueryClient Client)
{
    // End:0x0D
    if(Client == none)
    {
        return;
    }
    ThreadCount = 0;
    // End:0x2D
    if(PingQueue.Length > 0)
    {
        PingQueue.Remove(0, PingQueue.Length);
    }
    // End:0x46
    if(Servers.Length > 0)
    {
        Servers.Remove(0, Servers.Length);
    }
    UpdateServerCount();
    Client.__OnReceivedPingInfo__Delegate = ReceivedPingInfo;
    Client.__OnPingTimeout__Delegate = ReceivedPingTimeout;
    // End:0x86
    if(MasterServerClient(Client) == none)
    {
        return;
    }
    MasterServerClient(Client).__OnReceivedServer__Delegate = ReceivedNewServer;
    MasterServerClient(Client).__OnQueryFinished__Delegate = QueryComplete;
    MasterServerClient(Client).Query.Length = 0;
    //return;    
}

function ReceivedNewServer(ServerResponseLine NewServer)
{
    local int i;

    i = Servers.Length;
    Servers[i] = NewServer;
    // End:0x49
    if(Servers[i].Ping == 0)
    {
        Servers[i].Ping = 9999;
    }
    AddServerToPingQueue(i);
    //return;    
}

function AddServerToPingQueue(int ServerIndex)
{
    local int i;

    i = PingQueue.Length;
    PingQueue[i] = ServerIndex;
    UpdateServerCount();
    // End:0x47
    if(ThreadCount < Class'GUI2K4_Decompressed.UT2k4ServerBrowser'.static.CalculateMaxConnections())
    {
        PingServer(i);
    }
    //return;    
}

function UpdateQueue()
{
    local int MaxCount;

    MaxCount = Class'GUI2K4_Decompressed.UT2k4ServerBrowser'.static.CalculateMaxConnections();
    J0x15:

    // End:0x3C [Loop If]
    if((ThreadCount < MaxCount) && PingQueue.Length > 0)
    {
        PingServer(0);
        // [Loop Continue]
        goto J0x15;
    }
    UpdateServerCount();
    // End:0x61
    if((PingQueue.Length == 0) && ThreadCount <= 0)
    {
        PingingComplete();
    }
    //return;    
}

function PingServer(int QueueIndex)
{
    local int i;

    // End:0x1F
    if((QueueIndex < 0) || QueueIndex >= PingQueue.Length)
    {
        return;
    }
    i = PingQueue[QueueIndex];
    PingQueue.Remove(QueueIndex, 1);
    ThreadCount++;
    MSC.PingServer(i, 2, Servers[i].IP, Servers[i].QueryPort, 0, Servers[i]);
    OnOpenConnection();
    //return;    
}

function ReceivedPingInfo(int ServerIndex, ServerQueryClient.EPingCause PingCause, ServerResponseLine ServerInfo)
{
    // End:0x1F
    if((ServerIndex < 0) || ServerIndex >= Servers.Length)
    {
        return;
    }
    OnCloseConnection();
    ThreadCount--;
    Servers[ServerIndex] = ServerInfo;
    UpdateServerCount();
    //return;    
}

function ReceivedPingTimeout(int ServerIndex, ServerQueryClient.EPingCause PingCause)
{
    // End:0x1F
    if((ServerIndex < 0) || ServerIndex >= Servers.Length)
    {
        return;
    }
    OnCloseConnection();
    ThreadCount--;
    UpdateServerCount();
    //return;    
}

function PingingComplete()
{
    local int i, Best;
    local string URL;
    local PlayerController PC;

    // End:0x20
    if(Servers.Length == 0)
    {
        SetStatusCaption(NoServersReceivedText);
        ChangeQuickPlayStatus(false);
        return;
    }
    Best = -1;
    i = 0;
    J0x32:

    // End:0x10E [Loop If]
    if(i < Servers.Length)
    {
        // End:0x79
        if(Best == -1)
        {
            // End:0x76
            if(Servers[i].Ping < 9999)
            {
                Best = i;
            }
            // [Explicit Continue]
            goto J0x104;
        }
        // End:0x104
        if(Servers[i].Ping <= Servers[Best].Ping)
        {
            // End:0xD1
            if(Servers[i].Ping < Servers[Best].Ping)
            {
                Best = i;
                // [Explicit Continue]
                goto J0x104;
            }
            // End:0x104
            if(Servers[i].CurrentPlayers > Servers[Best].CurrentPlayers)
            {
                Best = i;
                // [Explicit Continue]
            }
        }
        J0x104:

        i++;
        // [Loop Continue]
        goto J0x32;
    }
    // End:0x131
    if(Best == -1)
    {
        SetStatusCaption(NoValidText);
        ChangeQuickPlayStatus(false);
        return;
    }
    PC = PlayerOwner();
    URL = (((PC.GetURLProtocol() $ "://") $ Servers[Best].IP) $ ":") $ string(Servers[Best].Port);
    Log("Performing ClientTravel URL:" $ URL);
    KillTimer();
    CloseMSConnection();
    Controller.CloseAll(false, true);
    PC.ClientTravel(URL, 2, false);
    //return;    
}

function bool QuickConnectPending()
{
    return bPendingSearch;
    //return;    
}

function StatusTimer(GUIComponent Sender)
{
    SetStatusCaption(ReadyText);
    //return;    
}

function SetStatusCaption(string StatusMessage)
{
    l_Status.Caption = StatusMessage;
    //return;    
}

function UpdateServerCount()
{
    local string S;

    S = Repl(ServerCountText, "%NumReceived%", string(Servers.Length - PingQueue.Length));
    S = Repl(S, "%TotalServers%", string(Servers.Length));
    l_ServerCount.Caption = S;
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4QuickPlay.IBorder'
    begin object name="IBorder" class=XInterface.GUIImage
        ImageStyle=1
        WinTop=0.3002830
        WinLeft=0.0602580
        WinWidth=0.8788150
        WinHeight=0.4606990
        RenderWeight=0.0010000
        bBoundToParent=true
        bScaleToParent=true
    end object
    i_Border=IBorder
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4QuickPlay.ConnectionStatus'
    begin object name="ConnectionStatus" class=XInterface.GUILabel
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.3234380
        WinLeft=0.0735940
        WinWidth=0.8494150
        WinHeight=0.4116780
        RenderWeight=0.1000000
        bBoundToParent=true
        bScaleToParent=true
        OnTimer=UT2K4QuickPlay.StatusTimer
    end object
    l_Status=ConnectionStatus
    // Reference: GUILabel'GUI2K4_Decompressed.UT2K4QuickPlay.ServerCount'
    begin object name="ServerCount" class=XInterface.GUILabel
        TextAlign=1
        FontScale=0
        StyleName="TextLabel"
        WinTop=0.6049240
        WinLeft=0.1204690
        WinWidth=0.7619160
        WinHeight=0.1304280
        RenderWeight=0.1000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    l_ServerCount=ServerCount
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4QuickPlay.GameType'
    begin object name="GameType" class=XInterface.moComboBox
        bReadOnly=true
        CaptionWidth=0.3000000
        Caption="?? ??"
        OnCreateComponent=GameType.InternalOnCreateComponent
        Hint="??? ? ?? ?? ??"
        WinTop=0.2042190
        WinLeft=0.0597510
        WinWidth=0.4884170
        WinHeight=0.0877200
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
    end object
    co_Game=GameType
    // Reference: moComboBox'GUI2K4_Decompressed.UT2K4QuickPlay.DifficultyLevel'
    begin object name="DifficultyLevel" class=XInterface.moComboBox
        bReadOnly=true
        CaptionWidth=0.3000000
        Caption="???"
        OnCreateComponent=DifficultyLevel.InternalOnCreateComponent
        Hint="??? ??? ??? ??. UT2004 ????? ‘???’ ???? ??? ?????."
        WinTop=0.2005640
        WinLeft=0.5716640
        WinWidth=0.3671670
        WinHeight=0.0877200
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
    end object
    co_Difficulty=DifficultyLevel
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4QuickPlay.QuickPlaySearch'
    begin object name="QuickPlaySearch" class=XInterface.GUIButton
        WinTop=0.7675510
        WinLeft=0.3079920
        WinWidth=0.1203470
        WinHeight=0.1091370
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        bStandardized=true
        OnClick=UT2K4QuickPlay.InternalOnClick
        OnKeyEvent=QuickPlaySearch.InternalOnKeyEvent
    end object
    b_QuickConnect=QuickPlaySearch
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4QuickPlay.QuickPlayClose'
    begin object name="QuickPlayClose" class=XInterface.GUIButton
        Caption="??"
        Hint="? ?? ????"
        WinTop=0.7675510
        WinLeft=0.6008830
        WinWidth=0.1256900
        WinHeight=0.1091370
        TabOrder=4
        bBoundToParent=true
        bScaleToParent=true
        bStandardized=true
        OnClick=UT2K4QuickPlay.InternalOnClick
        OnKeyEvent=QuickPlayClose.InternalOnKeyEvent
    end object
    b_lClose=QuickPlayClose
    DifficultyOptions[0]="???"
    DifficultyOptions[1]="??"
    DifficultyOptions[2]="???"
    MaxWaitSeconds=20
    SearchingText="?? ?..."
    ReadyText="??"
    ConnectText="??"
    CancelText="??"
    ConnectHint="????? ???? ???? \"??\"? ????? ?? ?? ?? ??? ???? ???."
    CancelHint="’? ??’ ??? ?????"
    BeginningSearchText="??? ?????...?? ?? ??? ?? ??? ??? ???? ????:"
    AuthFailedText="?? ??!  ??? ?? ??? ??? ????..."
    ServerCountText="??/?? -  %NumReceived%/%TotalServers%"
    SearchCancelledText="??? ???????!"
    ConnectionFailedText="?? ?? - ??? ??? ??? ? ????. ???? ?? ??? ???? ?? ??? ???!"
    TimedOutText="??? ?? ??? ??? ??? ?? ???????. ?? ??? ???."
    NoServersReceivedText="?????, ???? ?? ??? ?? ??? ?? ? ????!"
    NoValidText="??? ??? ???? ?? ?? ?? ??? ??????! ?? ????? ????..."
    WindowName="? ???"
    WinTop=0.2500000
    WinLeft=0.0000000
    WinWidth=1.0000000
    WinHeight=0.3700590
}