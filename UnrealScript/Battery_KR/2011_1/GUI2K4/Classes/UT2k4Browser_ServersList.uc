class UT2k4Browser_ServersList extends ServerBrowserMCList
    editinlinenew
    instanced;

struct report
{
    var int ListID;
    var string Ping;
    var string receive;
};

var() array<ServerResponseLine> Servers;
var() array<int> OutstandingPings;
var() int UseSimultaneousPings;
var() int PingStart;
var() int NumReceivedPings;
var() int NumPlayers;
var() int RedialId;
var() bool bPresort;
var() bool bInitialized;
var() array<Material> Icons;
var() localized array<localized string> IconDescriptions;
var array<report> reports;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super(GUIListBase).InitComponent(InController, inOwner);
    //return;    
}

function AddPingReport(int id, string S)
{
    local int i;

    // End:0x0D
    if(!bDebugging)
    {
        return;
    }
    i = 0;
    J0x14:

    // End:0xD6 [Loop If]
    if(i < reports.Length)
    {
        // End:0xAF
        if(reports[i].ListID == id)
        {
            Log(((("Warning, overwriting existing ping report (" $ string(i)) $ ") for listid:") $ string(id)) @ S);
            reports[i].Ping = S;
            return;
        }
        // End:0xCC
        if(reports[i].ListID > id)
        {
            // [Explicit Break]
            goto J0xD6;
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    J0xD6:

    reports.Insert(i, 1);
    reports[i].ListID = id;
    reports[i].Ping = S;
    //return;    
}

function AddReceiveReport(int id, string S)
{
    local int i;

    // End:0x0D
    if(!bDebugging)
    {
        return;
    }
    i = 0;
    J0x14:

    // End:0x7D [Loop If]
    if(i < reports.Length)
    {
        // End:0x56
        if(reports[i].ListID == id)
        {
            reports[i].receive = S;
            return;
        }
        // End:0x73
        if(reports[i].ListID > id)
        {
            // [Explicit Break]
            goto J0x7D;
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    J0x7D:

    Log(("Warning, no matching ping report found for listid:" $ string(id)) @ S);
    reports.Insert(i, 1);
    reports[i].ListID = id;
    reports[i].receive = S;
    //return;    
}

function string getreportsortstring(int idx)
{
    local int i;
    local string S, Port;
    local array<string> Parts;

    Divide(reports[idx].Ping, ":", S, Port);
    Split(S, ".", Parts);
    i = 0;
    J0x35:

    // End:0x62 [Loop If]
    if(i < 4)
    {
        PadLeft(Parts[i], 4, "0");
        i++;
        // [Loop Continue]
        goto J0x35;
    }
    PadLeft(Port, 5, "0");
    return JoinArray(Parts, ".") $ Port;
    //return;    
}

function logall()
{
    local int i, id;
    local string idx, ListID, outping, inping;
    local export editinline GUIMultiColumnList Temp;

    // End:0x0D
    if(!bDebugging)
    {
        return;
    }
    idx = "Index";
    ListID = "ListID";
    outping = "Address Pinged";
    inping = "Received";
    PadRight(idx, 8);
    PadRight(ListID, 8);
    PadRight(outping, 22);
    Temp = new (none) Class'XInterface.GUIMultiColumnList';
    Temp.SortColumn = 0;
    Temp.__GetSortString__Delegate = getreportsortstring;
    i = 0;
    J0xB2:

    // End:0xDB [Loop If]
    if(i < reports.Length)
    {
        Temp.AddedItem();
        i++;
        // [Loop Continue]
        goto J0xB2;
    }
    Temp.Sort();
    Log(((idx $ ListID) $ outping) $ inping);
    i = 0;
    J0x10D:

    // End:0x1DD [Loop If]
    if(i < reports.Length)
    {
        id = Temp.SortData[i].SortItem;
        idx = string(id);
        ListID = string(reports[id].ListID);
        outping = reports[id].Ping;
        inping = reports[id].receive;
        PadRight(idx, 8);
        PadRight(ListID, 8);
        PadRight(outping, 22);
        Log(((idx $ ListID) $ outping) $ inping);
        i++;
        // [Loop Continue]
        goto J0x10D;
    }
    //return;    
}

event Timer()
{
    // End:0x32
    if(((IsValid()) && OutstandingPings.Length <= 5) && bVisible)
    {
        tp_MyPage.RefreshCurrentServer();
    }
    //return;    
}

function SetAnchor(UT2k4Browser_ServerListPageBase Anchor)
{
    super.SetAnchor(Anchor);
    // End:0x34
    if(Anchor != none)
    {
        UseSimultaneousPings = tp_MyPage.Browser.GetMaxConnections();
    }
    //return;    
}

function Clear()
{
    PingStart = 0;
    StopPings();
    Servers.Remove(0, Servers.Length);
    ItemCount = 0;
    super(GUIMultiColumnList).Clear();
    //return;    
}

function CopyServerToClipboard()
{
    local string URL;

    // End:0x62
    if(IsValid())
    {
        URL = (((PlayerOwner().GetURLProtocol() $ "://") $ Servers[CurrentListId()].IP) $ ":") $ string(Servers[CurrentListId()].Port);
        PlayerOwner().CopyToClipboard(URL);
    }
    //return;    
}

function Connect(bool Spectator)
{
    local string URL;

    // End:0xCD
    if(IsValid())
    {
        URL = (((PlayerOwner().GetURLProtocol() $ "://") $ Servers[CurrentListId()].IP) $ ":") $ string(Servers[SortData[Index].SortItem].Port);
        // End:0x82
        if(Spectator)
        {
            URL = URL $ "?SpectatorOnly=1";
        }
        // End:0xA7
        if(tp_MyPage.ConnectLAN)
        {
            URL = URL $ "?LAN";
        }
        Controller.CloseAll(false, true);
        PlayerOwner().ClientTravel(URL, 0, false);
    }
    //return;    
}

function AddFavorite(UT2k4ServerBrowser Browser)
{
    // End:0x28
    if(IsValid())
    {
        Browser.OnAddFavorite(Servers[CurrentListId()]);
    }
    //return;    
}

function bool MyOnDblClick(GUIComponent Sender)
{
    Connect(false);
    return true;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1A
    if(super(GUIListBase).InternalOnKeyEvent(key, State, Delta))
    {
        return true;
    }
    // End:0x78
    if(int(State) == 3)
    {
        switch(key)
        {
            // End:0x3D
            case 13:
                Connect(false);
                return true;
            // End:0x53
            case 116:
                tp_MyPage.RefreshList();
                return true;
            // End:0x75
            case 67:
                // End:0x72
                if(Controller.CtrlPressed)
                {
                    CopyServerToClipboard();
                    return true;
                }
                // End:0x78
                break;
            // End:0xFFFF
            default:
                break;
        }
    }
    else
    {
        return false;
        //return;        
    }
}

function MyOnReceivedServer(ServerResponseLine S)
{
    local int i;

    // End:0x3F
    if((bPresort && bool(S.Flags & 32)) && !bool(S.Flags & 8))
    {
        i = 0;        
    }
    else
    {
        i = Servers.Length;
    }
    Servers.Insert(i, 1);
    Servers[i] = S;
    // End:0x94
    if(Servers[i].Ping == 0)
    {
        Servers[i].Ping = 9999;
    }
    // End:0xAA
    if(!bPresort)
    {
        AddedItem(i);
    }
    //return;    
}

function MyPingTimeout(int ListID, ServerQueryClient.EPingCause PingCause)
{
    local int i;

    AddReceiveReport(ListID, "TIMEOUT");
    // End:0x3A
    if((ListID < 0) || ListID >= Servers.Length)
    {
        PingStart = 0;
        return;
    }
    i = 0;
    J0x41:

    // End:0x7F [Loop If]
    if(i < OutstandingPings.Length)
    {
        // End:0x75
        if(OutstandingPings[i] == ListID)
        {
            OutstandingPings.Remove(i, 1);
            // [Explicit Break]
            goto J0x7F;
        }
        i++;
        // [Loop Continue]
        goto J0x41;
    }
    J0x7F:

    // End:0xBA
    if(Servers[ListID].Ping == 9999)
    {
        Servers[ListID].Ping = 20000;
        UpdatedItem(ListID);
    }
    // End:0xDF
    if(int(PingCause) == int(2))
    {
        NumReceivedPings++;
        NeedsSorting = true;
        AutoPingServers();
    }
    //return;    
}

function MyReceivedPingInfo(int ListID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    local int i, Flags;
    local bool bFound;
    local int CachePingCeiling;
    local export editinline UT2k4ServerBrowser SB;

    // End:0x51
    if((ListID < 0) || ListID >= Servers.Length)
    {
        PingStart = 0;
        AddReceiveReport(ListID, (S.IP $ ":") $ string(S.Port));
        return;        
    }
    else
    {
        AddReceiveReport(ListID, (S.IP $ ":") $ string(S.Port));
    }
    // End:0xA6
    if(PlayerOwner().Player.ConfiguredInternetSpeed < 5000)
    {
        CachePingCeiling = 400;        
    }
    else
    {
        CachePingCeiling = 200;
    }
    SB = UT2k4ServerBrowser(PageOwner);
    // End:0x107
    if(((S.Ping < CachePingCeiling) && SB != none) && SB.Verified)
    {
        SB.AddToServerCache(S);
    }
    Flags = Servers[ListID].Flags;
    Servers[ListID] = S;
    Servers[ListID].Flags = Flags;
    i = PingStart;
    J0x14F:

    // End:0x197 [Loop If]
    if((i < ListID) && i < Servers.Length)
    {
        // End:0x18D
        if(Servers[i].Ping == 9999)
        {
            // [Explicit Break]
            goto J0x197;
        }
        i++;
        // [Loop Continue]
        goto J0x14F;
    }
    J0x197:

    // End:0x1B1
    if(i < ListID)
    {
        PingStart = ListID;
    }
    i = 0;
    J0x1B8:

    // End:0x1FE [Loop If]
    if(i < OutstandingPings.Length)
    {
        // End:0x1F4
        if(OutstandingPings[i] == ListID)
        {
            bFound = true;
            OutstandingPings.Remove(i, 1);
            // [Explicit Break]
            goto J0x1FE;
        }
        i++;
        // [Loop Continue]
        goto J0x1B8;
    }
    J0x1FE:

    UpdatedItem(ListID);
    // End:0x239
    if((IsValid()) && ListID == SortData[Index].SortItem)
    {
        OnChange(none);
    }
    // End:0x26F
    if(int(PingCause) == int(2))
    {
        NumReceivedPings++;
        NumPlayers += S.CurrentPlayers;
        NeedsSorting = true;
        AutoPingServers();
    }
    //return;    
}

function RePingServers()
{
    InvalidatePings();
    AutoPingServers();
    //return;    
}

function FakeFinished()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x27 [Loop If]
    if(i < Servers.Length)
    {
        AddedItem();
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    RePingServers();
    SetTimer(5.0000000, true);
    //return;    
}

function MyQueryFinished(MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    local int i;

    // End:0xC2
    if(int(ResponseInfo) == int(3))
    {
        // End:0xB3
        if(bPresort)
        {
            // End:0x8C
            if(ItemCount > 0)
            {
                Log((((string(Name) @ "RECEIVED QUERYFINISHED NOTICE WITH ITEMCOUNT > 0!!! ITEMCOUNT:") $ string(ItemCount)) @ "Info:") $ string(Info));
                return;
            }
            i = 0;
            J0x93:

            // End:0xB3 [Loop If]
            if(i < Servers.Length)
            {
                AddedItem();
                i++;
                // [Loop Continue]
                goto J0x93;
            }
        }
        RePingServers();
        SetTimer(5.0000000, true);
    }
    //return;    
}

function InvalidatePings()
{
    local int i;

    reports.Remove(0, reports.Length);
    StopPings();
    PingStart = 0;
    NumReceivedPings = 0;
    NumPlayers = 0;
    i = 0;
    J0x2F:

    // End:0x6A [Loop If]
    if(i < Servers.Length)
    {
        Servers[i].Ping = 9999;
        UpdatedItem(i);
        i++;
        // [Loop Continue]
        goto J0x2F;
    }
    //return;    
}

function AutoPingServers()
{
    local int i, j;

    i = PingStart;
    J0x0B:

    // End:0x100 [Loop If]
    if((i < Servers.Length) && OutstandingPings.Length < UseSimultaneousPings)
    {
        // End:0xF6
        if(Servers[i].Ping == 9999)
        {
            j = 0;
            J0x4E:

            // End:0x80 [Loop If]
            if(j < OutstandingPings.Length)
            {
                // End:0x76
                if(OutstandingPings[j] == i)
                {
                    // [Explicit Break]
                    goto J0x80;
                }
                j++;
                // [Loop Continue]
                goto J0x4E;
            }
            J0x80:

            // End:0xF6
            if(j == OutstandingPings.Length)
            {
                OutstandingPings[j] = i;
                AddPingReport(i, (Servers[i].IP $ ":") $ string(Servers[i].Port));
                tp_MyPage.PingServer(i, 2, Servers[i]);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0B;
    }
    // End:0x112
    if(OutstandingPings.Length == 0)
    {
        logall();
    }
    //return;    
}

function StopPings()
{
    OutstandingPings.Remove(0, OutstandingPings.Length);
    // End:0x27
    if(tp_MyPage != none)
    {
        tp_MyPage.CancelPings();
    }
    //return;    
}

function int RemoveServerAt(int pos)
{
    local int i;

    // End:0x16
    if(!IsValidIndex(pos))
    {
        return -1;
    }
    i = Servers.Length - 1;
    // End:0x4B
    if(pos < i)
    {
        Servers[pos] = Servers[i];
    }
    Servers.Remove(i, 1);
    // End:0x96
    if(i == Index)
    {
        tp_MyPage.li_Rules.Clear();
        tp_MyPage.li_Players.Clear();
    }
    RemovedItem(i);
    SetIndex(Index);
    NeedsSorting = true;
    return pos;
    //return;    
}

function int RemoveCurrentServer()
{
    local int OldItem;

    // End:0x3A
    if(IsValid())
    {
        OldItem = SortData[Index].SortItem;
        // End:0x3A
        if((RemoveServerAt(Index)) != -1)
        {
            return OldItem;
        }
    }
    return -1;
    //return;    
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth, DrawX, IconPosX, IconPosY;

    local string Ping;
    local int k, Flags, checkFlag;
    local export editinline GUIStyles DStyle;

    // End:0x49
    if(bSelected)
    {
        SelectedStyle.Draw(Canvas, MenuState, X, Y, W, H + float(1));
        DStyle = SelectedStyle;        
    }
    else
    {
        DStyle = Style;
    }
    Flags = Servers[SortData[i].SortItem].Flags;
    GetCellLeftWidth(0, CellLeft, CellWidth);
    IconPosX = CellLeft;
    IconPosY = Y;
    checkFlag = 1;
    k = 0;
    J0xAA:

    // End:0x1B2 [Loop If]
    if((k < Icons.Length) && IconPosX < (CellLeft + CellWidth))
    {
        // End:0x19A
        if((Flags & checkFlag) != 0)
        {
            DrawX = float(Min(14, int(float(int(CellLeft + CellWidth)) - IconPosX)));
            Canvas.DrawColor = Canvas.MakeColor(byte(255), byte(255), byte(255), byte(255));
            Canvas.SetPos(IconPosX, IconPosY);
            Canvas.DrawTile(Icons[k], DrawX, 14.0000000, 0.0000000, 0.0000000, DrawX + 1.0000000, 15.0000000);
            IconPosX += float(14);
        }
        checkFlag = checkFlag << 1;
        k++;
        // [Loop Continue]
        goto J0xAA;
    }
    GetCellLeftWidth(1, CellLeft, CellWidth);
    DStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, Servers[SortData[i].SortItem].ServerName, FontScale);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    DStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, Servers[SortData[i].SortItem].MapName, FontScale);
    GetCellLeftWidth(3, CellLeft, CellWidth);
    // End:0x342
    if((Servers[SortData[i].SortItem].CurrentPlayers > 0) || Servers[SortData[i].SortItem].MaxPlayers > 0)
    {
        DStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, (string(Servers[SortData[i].SortItem].CurrentPlayers) $ "/") $ string(Servers[SortData[i].SortItem].MaxPlayers & 255), FontScale);
    }
    GetCellLeftWidth(4, CellLeft, CellWidth);
    // End:0x385
    if(Servers[SortData[i].SortItem].Ping == 9999)
    {
        Ping = "?";        
    }
    else
    {
        // End:0x3B8
        if(Servers[SortData[i].SortItem].Ping > 9999)
        {
            Ping = "N/A";            
        }
        else
        {
            Ping = string(Servers[SortData[i].SortItem].Ping);
        }
    }
    DStyle.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, Ping, FontScale);
    //return;    
}

function string GetSortString(int i)
{
    local string S, t;

    switch(SortColumn)
    {
        // End:0x33
        case 0:
            S = (BuildFlagString(Servers[i].Flags)) $ string(i);
            // End:0x12E
            break;
        // End:0x56
        case 1:
            S = Left(Caps(Servers[i].ServerName), 8);
            // End:0x12E
            break;
        // End:0x7A
        case 2:
            S = Left(Caps(Servers[i].MapName), 8);
            // End:0x12E
            break;
        // End:0xEF
        case 3:
            S = string(Servers[i].CurrentPlayers);
            PadLeft(S, 4, "0");
            t = string(Servers[i].MaxPlayers & 255);
            PadLeft(t, 4, "0");
            S $= (t $ string(i));
            // End:0x12E
            break;
        // End:0xFFFF
        default:
            S = string(Servers[i].Ping);
            PadLeft(S, 5, "0");
            S $= string(i);
            // End:0x12E
            break;
            break;
    }
    return S;
    //return;    
}

function string Get(optional bool bGuarantee)
{
    local string S;

    // End:0x3D
    if(IsValid())
    {
        S = (Servers[CurrentListId()].IP $ ":") $ string(Servers[CurrentListId()].Port);        
    }
    else
    {
        // End:0x91
        if((Servers.Length > 0) && bGuarantee)
        {
            S = (Servers[SortData[0].SortItem].IP $ ":") $ string(Servers[SortData[0].SortItem].Port);
        }
    }
    return S;
    //return;    
}

function bool GetCurrent(out ServerResponseLine S)
{
    // End:0x0D
    if(!IsValid())
    {
        return false;
    }
    S = Servers[CurrentListId()];
    return true;
    //return;    
}

function int FindIndex(string IP, optional string Port)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x6D [Loop If]
    if(i < Servers.Length)
    {
        // End:0x63
        if((Servers[i].IP == IP) && (Port == "") || Servers[i].Port == int(Port))
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return -1;
    //return;    
}

function bool IsValid()
{
    return (Index >= 0) && Index < Servers.Length;
    //return;    
}

function bool IsValidIndex(int Test)
{
    return (Test >= 0) && Test < Servers.Length;
    //return;    
}

event Opened(GUIComponent Sender)
{
    super(GUIComponent).Opened(Sender);
    // End:0x2A
    if(bInitialized && tp_MyPage != none)
    {
        AutoPingServers();        
    }
    else
    {
        bInitialized = true;
    }
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIComponent).Closed(Sender, bCancelled);
    StopPings();
    //return;    
}

function string BuildFlagString(int Flags)
{
    local int Value;
    local string Result;

    Value = 9999;
    // End:0x24
    if(bool(Flags & 32))
    {
        Value = 1000;
    }
    // End:0x3B
    if(bool(Flags & 4))
    {
        Value -= 90;
    }
    // End:0x54
    if(!bool(Flags & 8))
    {
        Value -= 85;
    }
    // End:0x6B
    if(bool(Flags & 2))
    {
        Value -= 10;
    }
    Result = string(Value);
    PadLeft(Result, 4, "0");
    return Result;
    //return;    
}

defaultproperties
{
    IconDescriptions[0]="?? ???"
    IconDescriptions[1]="?? ??"
    IconDescriptions[2]="?? ??"
    IconDescriptions[3]="?? ??"
    IconDescriptions[4]="?????(Instagib)"
    IconDescriptions[5]="???? ??"
    IconDescriptions[6]="UT ???"
    ColumnHeadings=/* Array type was not detected. */
    InitColumnPerc=/* Array type was not detected. */
    SortColumn=4
    OnDrawItem=UT2k4Browser_ServersList.MyOnDrawItem
    OnDblClick=UT2k4Browser_ServersList.MyOnDblClick
}