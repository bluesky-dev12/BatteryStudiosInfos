/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4QuickPlay.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:32
 *	Functions:28
 *
 *******************************************************************************/
class UT2K4QuickPlay extends LargeWindow
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Border;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_Status;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel l_ServerCount;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Game;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_Difficulty;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_QuickConnect;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_lClose;
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
var delegate<OnOpenConnection> __OnOpenConnection__Delegate;
var delegate<OnCloseConnection> __OnCloseConnection__Delegate;

delegate OnOpenConnection();
delegate OnCloseConnection();
function InitComponent(GUIController MyController, GUIComponent MyComponent)
{
    local int i;

    super(FloatingWindow).InitComponent(MyController, MyComponent);
    i = 0;
    J0x17:
    // End:0x4b [While If]
    if(i < DifficultyOptions.Length)
    {
        co_Difficulty.AddItem(DifficultyOptions[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
    StatusTimer(none);
    ChangeQuickPlayStatus(false);
}

event Opened(GUIComponent Sender)
{
    local int i;
    local array<GameRecord> Records;

    super(PopupPageBase).Opened(Sender);
    class'CacheManager'.static.GetGameTypeList(Records);
    i = 0;
    J0x23:
    // End:0x6d [While If]
    if(i < Records.Length)
    {
        co_Game.AddItem(Records[i].GameName,, Records[i].ClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x23;
    }
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    CloseMSConnection();
}

event free()
{
    super(GUIPage).free();
    CloseMSConnection();
}

function bool NotifyLevelChange()
{
    CloseMSConnection();
    return super(GUIPage).NotifyLevelChange();
}

function CloseMSConnection()
{
    KillTimer();
    // End:0x2c
    if(MSC != none)
    {
        MSC.CancelPings();
        MSC.Stop();
    }
    MSC = none;
}

function AddQueryTerm(coerce string key, coerce string Value, IpDrv.MasterServerClient.EQueryType QueryType)
{
    local QueryData QD;
    local int i;

    i = 0;
    J0x07:
    // End:0x8a [While If]
    if(i < MSC.Query.Length)
    {
        QD = MSC.Query[i];
        // End:0x80
        if(QD.key ~= key && QD.Value ~= Value && QD.QueryType == QueryType)
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    QD.key = key;
    QD.Value = Value;
    QD.QueryType = QueryType;
    MSC.Query[i] = QD;
}

function HandleObject(Object obj, optional Object OptionalObj_1, optional Object OptionalObj_2)
{
    MSC = MasterServerClient(obj);
}

event Timer()
{
    // End:0x46
    if(PlayerOwner() != none && PlayerOwner().Level.TimeSeconds - float(QuickConnectSeconds) > float(MaxWaitSeconds))
    {
        SetStatusCaption(NoValidText);
        CancelQuickPlay();
    }
    UpdateQueue();
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x6e
    if(Sender == b_QuickConnect)
    {
        // End:0x2c
        if(QuickConnectPending())
        {
            CancelQuickPlay();
            SetStatusCaption(SearchCancelledText);
        }
        // End:0x6c
        else
        {
            SetStatusCaption(BeginningSearchText @ co_Game.GetText());
            CreateQuickPlayQuery(co_Game.GetExtra(), co_Difficulty.GetIndex());
        }
        return true;
    }
    // End:0x8f
    if(Sender == b_lClose)
    {
        Controller.CloseMenu(false);
        return true;
    }
    return false;
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
}

function QueryComplete(IpDrv.MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    switch(ResponseInfo)
    {
        // End:0x18
        case 3:
            SetTimer(0.10, true);
            // End:0x66
            break;
        // End:0x31
        case 0:
            SetStatusCaption(AuthFailedText);
            CancelQuickPlay();
            // End:0x66
            break;
        // End:0x4a
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
        // End:0xffff
        default:
}

function CancelQuickPlay()
{
    MSC.CancelPings();
    ChangeQuickPlayStatus(false);
}

function ChangeQuickPlayStatus(bool bIsSearching)
{
    bPendingSearch = bIsSearching;
    // End:0x4c
    if(QuickConnectPending())
    {
        SetStatusCaption(SearchingText);
        b_QuickConnect.Caption = CancelText;
        b_QuickConnect.SetHint(CancelHint);
    }
    // End:0x89
    else
    {
        KillTimer();
        l_Status.SetTimer(2.50, false);
        b_QuickConnect.Caption = ConnectText;
        b_QuickConnect.SetHint(ConnectHint);
    }
}

function ResetQueryClient(ServerQueryClient Client)
{
    // End:0x0d
    if(Client == none)
    {
        return;
    }
    ThreadCount = 0;
    // End:0x2d
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
}

function AddServerToPingQueue(int ServerIndex)
{
    local int i;

    i = PingQueue.Length;
    PingQueue[i] = ServerIndex;
    UpdateServerCount();
    // End:0x47
    if(ThreadCount < class'UT2k4ServerBrowser'.static.CalculateMaxConnections())
    {
        PingServer(i);
    }
}

function UpdateQueue()
{
    local int MaxCount;

    MaxCount = class'UT2k4ServerBrowser'.static.CalculateMaxConnections();
    J0x15:
    // End:0x3c [While If]
    if(ThreadCount < MaxCount && PingQueue.Length > 0)
    {
        PingServer(0);
        // This is an implied JumpToken; Continue!
        goto J0x15;
    }
    UpdateServerCount();
    // End:0x61
    if(PingQueue.Length == 0 && ThreadCount <= 0)
    {
        PingingComplete();
    }
}

function PingServer(int QueueIndex)
{
    local int i;

    // End:0x1f
    if(QueueIndex < 0 || QueueIndex >= PingQueue.Length)
    {
        return;
    }
    i = PingQueue[QueueIndex];
    PingQueue.Remove(QueueIndex, 1);
    ++ ThreadCount;
    MSC.PingServer(i, 2, Servers[i].IP, Servers[i].QueryPort, 0, Servers[i]);
    OnOpenConnection();
}

function ReceivedPingInfo(int ServerIndex, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine ServerInfo)
{
    // End:0x1f
    if(ServerIndex < 0 || ServerIndex >= Servers.Length)
    {
        return;
    }
    OnCloseConnection();
    -- ThreadCount;
    Servers[ServerIndex] = ServerInfo;
    UpdateServerCount();
}

function ReceivedPingTimeout(int ServerIndex, IpDrv.ServerQueryClient.EPingCause PingCause)
{
    // End:0x1f
    if(ServerIndex < 0 || ServerIndex >= Servers.Length)
    {
        return;
    }
    OnCloseConnection();
    -- ThreadCount;
    UpdateServerCount();
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
    // End:0x10e [While If]
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
        }
        // End:0x104
        else
        {
            // End:0x104
            if(Servers[i].Ping <= Servers[Best].Ping)
            {
                // End:0xd1
                if(Servers[i].Ping < Servers[Best].Ping)
                {
                    Best = i;
                }
                // End:0x104
                else
                {
                    // End:0x104
                    if(Servers[i].CurrentPlayers > Servers[Best].CurrentPlayers)
                    {
                        Best = i;
                    }
                    // End:0x104
                    else
                    {
                    }
                }
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
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
    URL = PC.GetURLProtocol() $ "://" $ Servers[Best].IP $ ":" $ string(Servers[Best].Port);
    Log("Performing ClientTravel URL:" $ URL);
    KillTimer();
    CloseMSConnection();
    Controller.CloseAll(false, true);
    PC.ClientTravel(URL, 2, false);
}

function bool QuickConnectPending()
{
    return bPendingSearch;
}

function StatusTimer(GUIComponent Sender)
{
    SetStatusCaption(ReadyText);
}

function SetStatusCaption(string StatusMessage)
{
    l_Status.Caption = StatusMessage;
}

function UpdateServerCount()
{
    local string S;

    S = Repl(ServerCountText, "%NumReceived%", string(Servers.Length - PingQueue.Length));
    S = Repl(S, "%TotalServers%", string(Servers.Length));
    l_ServerCount.Caption = S;
}

defaultproperties
{
    begin object name=IBorder class=GUIImage
        ImageStyle=1
        WinTop=0.3002830
        WinLeft=0.0602580
        WinWidth=0.8788150
        WinHeight=0.4606990
        RenderWeight=0.0010
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIImage'UT2K4QuickPlay.IBorder'
    i_Border=IBorder
    begin object name=ConnectionStatus class=GUILabel
        TextAlign=1
        StyleName="TextLabel"
        WinTop=0.3234380
        WinLeft=0.0735940
        WinWidth=0.8494150
        WinHeight=0.4116780
        RenderWeight=0.10
        bBoundToParent=true
        bScaleToParent=true
        OnTimer=StatusTimer
    object end
    // Reference: GUILabel'UT2K4QuickPlay.ConnectionStatus'
    l_Status=ConnectionStatus
    begin object name=ServerCount class=GUILabel
        TextAlign=1
        FontScale=0
        StyleName="TextLabel"
        WinTop=0.6049240
        WinLeft=0.1204690
        WinWidth=0.7619160
        WinHeight=0.1304280
        RenderWeight=0.10
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUILabel'UT2K4QuickPlay.ServerCount'
    l_ServerCount=ServerCount
    begin object name=GameType class=moComboBox
        bReadOnly=true
        CaptionWidth=0.30
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ? ?? ?? ??"
        WinTop=0.2042190
        WinLeft=0.0597510
        WinWidth=0.4884170
        WinHeight=0.087720
        TabOrder=0
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: moComboBox'UT2K4QuickPlay.GameType'
    co_Game=GameType
    begin object name=DifficultyLevel class=moComboBox
        bReadOnly=true
        CaptionWidth=0.30
        Caption="???"
        OnCreateComponent=InternalOnCreateComponent
        Hint="??? ??? ??? ??. UT2004 ????? ????? ???? ??? ?????."
        WinTop=0.2005640
        WinLeft=0.5716640
        WinWidth=0.3671670
        WinHeight=0.087720
        TabOrder=1
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: moComboBox'UT2K4QuickPlay.DifficultyLevel'
    co_Difficulty=DifficultyLevel
    begin object name=QuickPlaySearch class=GUIButton
        WinTop=0.7675510
        WinLeft=0.3079920
        WinWidth=0.1203470
        WinHeight=0.1091370
        TabOrder=2
        bBoundToParent=true
        bScaleToParent=true
        bStandardized=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4QuickPlay.QuickPlaySearch'
    b_QuickConnect=QuickPlaySearch
    begin object name=QuickPlayClose class=GUIButton
        Caption="??"
        Hint="? ?? ????"
        WinTop=0.7675510
        WinLeft=0.6008830
        WinWidth=0.125690
        WinHeight=0.1091370
        TabOrder=4
        bBoundToParent=true
        bScaleToParent=true
        bStandardized=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4QuickPlay.QuickPlayClose'
    b_lClose=QuickPlayClose
    DifficultyOptions=// Object reference not set to an instance of an object.
    
    MaxWaitSeconds=20
    SearchingText="?? ?..."
    ReadyText="??"
    ConnectText="??"
    CancelText="??"
    ConnectHint="????? ???? ???? "??"? ????? ?? ?? ?? ??? ???? ???."
    CancelHint="?? ??? ??? ?????"
    BeginningSearchText="??? ?????...?? ?? ??? ?? ??? ??? ???? ????:"
    AuthFailedText="?? ??!  ??? ?? ??? ??? ????..."
    ServerCountText="??/?? -  %NumReceived%/%TotalServers%"
    SearchCancelledText="??? ???????!"
    ConnectionFailedText="?? ?? - ??? ??? ??? ? ????. ???? ?? ??? ???? ?? ??? ???!"
    TimedOutText="??? ?? ??? ??? ??? ?? ???????. ?? ??? ???."
    NoServersReceivedText="?????, ???? ?? ??? ?? ??? ?? ? ????!"
    NoValidText="??? ??? ???? ?? ?? ?? ??? ??????! ?? ????? ????..."
    WindowName="? ???"
    WinTop=0.250
    WinLeft=0.0
    WinWidth=1.0
    WinHeight=0.3700590
}