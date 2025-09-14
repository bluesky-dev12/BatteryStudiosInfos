/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_ServersList.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:12
 *	Functions:20
 *
 *******************************************************************************/
class Browser_ServersList extends GUIMultiColumnList
    dependson(GUIMultiColumnList)
    dependson(Browser_RulesList)
    dependson(Browser_PlayersList)
    dependson(Browser_ServerListPageBase)
    editinlinenew
    instanced;

var() array<ServerResponseLine> Servers;
var export editinline Browser_ServerListPageBase MyPage;
var export editinline Browser_RulesList MyRulesList;
var export editinline Browser_PlayersList MyPlayersList;
var export editinline GUIStyles SelStyle;
var array<int> OutstandingPings;
var int UseSimultaneousPings;
var int PingStart;
var int NumReceivedPings;
var int NumPlayers;
var() array<Material> Icons;
var() localized array<localized string> IconDescriptions;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    MyPlayersList.MyServersList = self;
    MyRulesList.MyServersList = self;
    __OnDrawItem__Delegate = MyOnDrawItem;
    __OnChange__Delegate = MyOnChange;
    __OnDblClick__Delegate = MyOnDblClick;
    super(GUIListBase).InitComponent(MyController, myOwner);
    SelStyle = Controller.GetStyle("SquareButton", FontScale);
    // End:0xfa
    if(Controller.MaxSimultaneousPings == 0)
    {
        i = class'Player'.default.ConfiguredInternetSpeed;
        // End:0xbb
        if(i <= 2600)
        {
            UseSimultaneousPings = 10;
        }
        // End:0xf7
        else
        {
            // End:0xd5
            if(i <= 5000)
            {
                UseSimultaneousPings = 15;
            }
            // End:0xf7
            else
            {
                // End:0xef
                if(i <= 10000)
                {
                    UseSimultaneousPings = 20;
                }
                // End:0xf7
                else
                {
                    UseSimultaneousPings = 35;
                }
            }
        }
    }
    // End:0x10e
    else
    {
        UseSimultaneousPings = Controller.MaxSimultaneousPings;
    }
}

function Clear()
{
    PingStart = 0;
    StopPings();
    Servers.Remove(0, Servers.Length);
    ItemCount = 0;
    super.Clear();
}

function CopyServerToClipboard()
{
    local string URL;

    // End:0x78
    if(Index >= 0)
    {
        URL = PlayerOwner().GetURLProtocol() $ "://" $ Servers[SortData[Index].SortItem].IP $ ":" $ string(Servers[SortData[Index].SortItem].Port);
        PlayerOwner().CopyToClipboard(URL);
    }
}

function Connect(bool Spectator)
{
    local string URL;

    // End:0xd8
    if(Index >= 0)
    {
        URL = PlayerOwner().GetURLProtocol() $ "://" $ Servers[SortData[Index].SortItem].IP $ ":" $ string(Servers[SortData[Index].SortItem].Port);
        // End:0x8e
        if(Spectator)
        {
            URL = URL $ "?SpectatorOnly=1";
        }
        // End:0xb3
        if(MyPage.ConnectLAN)
        {
            URL = URL $ "?LAN";
        }
        Controller.CloseAll(false);
        PlayerOwner().ClientTravel(URL, 0, false);
    }
}

function AddFavorite(ServerBrowser Browser)
{
    // End:0x34
    if(Index >= 0)
    {
        Browser.OnAddFavorite(Servers[SortData[Index].SortItem]);
    }
}

function bool MyOnDblClick(GUIComponent Sender)
{
    Connect(false);
    return true;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    // End:0x1a
    if(super(GUIListBase).InternalOnKeyEvent(key, State, Delta))
    {
        return true;
    }
    // End:0x7d
    if(State == 1)
    {
        switch(key)
        {
            // End:0x3f
            case 13:
                Connect(false);
                return true;
                // End:0x7d
                break;
            // End:0x58
            case 116:
                MyPage.RefreshList();
                return true;
                // End:0x7d
                break;
            // End:0x7a
            case 67:
                // End:0x77
                if(Controller.CtrlPressed)
                {
                    CopyServerToClipboard();
                    return true;
                }
                // End:0x7d
                break;
            // End:0xffff
            default:
            }
            return false;
}

function MyOnReceivedServer(ServerResponseLine S)
{
    local int i;

    i = Servers.Length;
    Servers.Length = i + 1;
    Servers[i] = S;
    // End:0x58
    if(Servers[i].Ping == 0)
    {
        Servers[i].Ping = 9999;
    }
    ++ ItemCount;
    AddedItem();
}

function MyPingTimeout(int ListID, IpDrv.ServerQueryClient.EPingCause PingCause)
{
    local int i;

    // End:0x12
    if(ListID >= Servers.Length)
    {
        return;
    }
    // End:0x4d
    if(Servers[ListID].Ping == 9999)
    {
        Servers[ListID].Ping = 10000;
        UpdatedItem(ListID);
    }
    i = 0;
    J0x54:
    // End:0x92 [While If]
    if(i < OutstandingPings.Length)
    {
        // End:0x88
        if(OutstandingPings[i] == ListID)
        {
            OutstandingPings.Remove(i, 1);
        }
        // End:0x92
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x54;
        }
    }
    // End:0xb7
    if(PingCause == 2)
    {
        ++ NumReceivedPings;
        NeedsSorting = true;
        AutoPingServers();
    }
}

function MyReceivedPingInfo(int ListID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    local int i;

    // End:0x14
    if(ListID < 0)
    {
        PingStart = 0;
        return;
    }
    Servers[ListID] = S;
    i = PingStart;
    J0x30:
    // End:0x78 [While If]
    if(i < ListID && i < Servers.Length)
    {
        // End:0x6e
        if(Servers[i].Ping == 9999)
        {
        }
        // End:0x78
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x30;
        }
    }
    // End:0x92
    if(i < ListID)
    {
        PingStart = ListID;
    }
    i = 0;
    J0x99:
    // End:0xd7 [While If]
    if(i < OutstandingPings.Length)
    {
        // End:0xcd
        if(OutstandingPings[i] == ListID)
        {
            OutstandingPings.Remove(i, 1);
        }
        // End:0xd7
        else
        {
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x99;
        }
    }
    UpdatedItem(ListID);
    // End:0x110
    if(Index >= 0 && ListID == SortData[Index].SortItem)
    {
        MyOnChange(none);
    }
    // End:0x146
    if(PingCause == 2)
    {
        ++ NumReceivedPings;
        NumPlayers += S.CurrentPlayers;
        NeedsSorting = true;
        AutoPingServers();
    }
}

function RePingServers()
{
    InvalidatePings();
    AutoPingServers();
}

function MyQueryFinished(IpDrv.MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    // End:0x16
    if(ResponseInfo == 3)
    {
        RePingServers();
    }
}

function InvalidatePings()
{
    local int i;

    StopPings();
    PingStart = 0;
    NumReceivedPings = 0;
    NumPlayers = 0;
    i = 0;
    J0x22:
    // End:0x5d [While If]
    if(i < Servers.Length)
    {
        Servers[i].Ping = 9999;
        UpdatedItem(i);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x22;
    }
}

function AutoPingServers()
{
    local int i, j;

    i = PingStart;
    J0x0b:
    // End:0xe7 [While If]
    if(i < Servers.Length && OutstandingPings.Length < UseSimultaneousPings)
    {
        // End:0xdd
        if(Servers[i].Ping == 9999)
        {
            j = 0;
            J0x4e:
            // End:0x80 [While If]
            if(j < OutstandingPings.Length)
            {
                // End:0x76
                if(OutstandingPings[j] == i)
                {
                }
                // End:0x80
                else
                {
                    ++ j;
                    // This is an implied JumpToken; Continue!
                    goto J0x4e;
                }
            }
            // End:0xdd
            if(j == OutstandingPings.Length)
            {
                MyPage.PingServer(i, 2, Servers[i]);
                j = OutstandingPings.Length;
                OutstandingPings.Length = j + 1;
                OutstandingPings[j] = i;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0b;
    }
    // End:0xff
    if(OutstandingPings.Length == 0)
    {
        NumReceivedPings = Servers.Length;
    }
}

function StopPings()
{
    OutstandingPings.Remove(0, OutstandingPings.Length);
    MyPage.CancelPings();
}

event Timer()
{
    // End:0x12
    if(Index >= 0)
    {
        MyOnChange(self);
    }
}

function MyOnChange(GUIComponent Sender)
{
    MyRulesList.Clear();
    MyPlayersList.Clear();
    // End:0x10b
    if(Index >= 0)
    {
        // End:0x6b
        if(Sender != none)
        {
            MyPage.PingServer(SortData[Index].SortItem, 1, Servers[SortData[Index].SortItem]);
        }
        MyRulesList.ItemCount = Servers[SortData[Index].SortItem].ServerInfo.Length;
        MyRulesList.listitem = SortData[Index].SortItem;
        MyPlayersList.ItemCount = Servers[SortData[Index].SortItem].PlayerInfo.Length;
        MyPlayersList.listitem = SortData[Index].SortItem;
        SetTimer(5.0, false);
    }
    // End:0x12b
    else
    {
        MyRulesList.ItemCount = 0;
        MyPlayersList.ItemCount = 0;
    }
}

function int RemoveCurrentServer()
{
    local int OldItem;

    // End:0x60
    if(Index >= 0)
    {
        OldItem = SortData[Index].SortItem;
        Servers.Remove(OldItem, 1);
        -- ItemCount;
        MyRulesList.ItemCount = 0;
        MyPlayersList.ItemCount = 0;
        RemovedCurrent();
        return OldItem;
    }
    return -1;
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth, DrawX, IconPosX, IconPosY;

    local string Ping;
    local int k, Flags, checkFlag;

    // End:0x3f
    if(bSelected)
    {
        SelStyle.Draw(Canvas, 3, X, Y - float(2), W, H + float(2));
    }
    Flags = Servers[SortData[i].SortItem].MaxPlayers;
    GetCellLeftWidth(0, CellLeft, CellWidth);
    IconPosX = CellLeft;
    IconPosY = Y;
    checkFlag = 1 << 30;
    k = 0;
    J0x99:
    // End:0x1a1 [While If]
    if(k < Icons.Length && IconPosX < CellLeft + CellWidth)
    {
        // End:0x189
        if(Flags & checkFlag != 0)
        {
            DrawX = float(Min(14, int(float(int(CellLeft + CellWidth)) - IconPosX)));
            Canvas.DrawColor = Canvas.MakeColor(byte(255), byte(255), byte(255), byte(255));
            Canvas.SetPos(IconPosX, IconPosY);
            Canvas.DrawTile(Icons[k], DrawX, 14.0, 0.0, 0.0, DrawX + 1.0, 15.0);
            IconPosX += float(14);
        }
        checkFlag = checkFlag >> 1;
        ++ k;
        // This is an implied JumpToken; Continue!
        goto J0x99;
    }
    GetCellLeftWidth(1, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, Servers[SortData[i].SortItem].ServerName, FontScale);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, Servers[SortData[i].SortItem].MapName, FontScale);
    GetCellLeftWidth(3, CellLeft, CellWidth);
    // End:0x331
    if(Servers[SortData[i].SortItem].CurrentPlayers > 0 || Servers[SortData[i].SortItem].MaxPlayers > 0)
    {
        Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, string(Servers[SortData[i].SortItem].CurrentPlayers) $ "/" $ string(Servers[SortData[i].SortItem].MaxPlayers & 255), FontScale);
    }
    GetCellLeftWidth(4, CellLeft, CellWidth);
    // End:0x374
    if(Servers[SortData[i].SortItem].Ping == 9999)
    {
        Ping = "?";
    }
    // End:0x3ca
    else
    {
        // End:0x3a7
        if(Servers[SortData[i].SortItem].Ping == 10000)
        {
            Ping = "N/A";
        }
        // End:0x3ca
        else
        {
            Ping = string(Servers[SortData[i].SortItem].Ping);
        }
    }
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, Ping, FontScale);
}

function string GetSortString(int i)
{
    local string S, t;

    switch(SortColumn)
    {
        // End:0x0b
        case 0:
        // End:0x2e
        case 1:
            S = Left(Caps(Servers[i].ServerName), 8);
            // End:0x162
            break;
        // End:0x52
        case 2:
            S = Left(Caps(Servers[i].MapName), 8);
            // End:0x162
            break;
        // End:0xe2
        case 3:
            S = string(Servers[i].CurrentPlayers);
            J0x6f:
            // End:0x90 [While If]
            if(Len(S) < 4)
            {
                S = "0" $ S;
                // This is an implied JumpToken; Continue!
                goto J0x6f;
            }
            t = string(Servers[i].MaxPlayers & 255);
            J0xac:
            // End:0xcd [While If]
            if(Len(t) < 4)
            {
                t = "0" $ t;
                // This is an implied JumpToken; Continue!
                goto J0xac;
            }
            S = S $ t;
            // End:0x162
            break;
        // End:0x123
        case 4:
            S = string(Servers[i].Ping);
            J0xff:
            // End:0x120 [While If]
            if(Len(S) < 5)
            {
                S = "0" $ S;
                // This is an implied JumpToken; Continue!
                goto J0xff;
            }
            // End:0x162
            break;
        // End:0xffff
        default:
            S = string(Servers[i].Ping);
            J0x13e:
            // End:0x15f [While If]
            if(Len(S) < 5)
            {
                S = "0" $ S;
                // This is an implied JumpToken; Continue!
                goto J0x13e;
            }
            // End:0x162 Break;
            break;
    }
    return S;
}

defaultproperties
{
    IconDescriptions=// Object reference not set to an instance of an object.
    
    ColumnHeadings=// Object reference not set to an instance of an object.
    
    InitColumnPerc=// Object reference not set to an instance of an object.
    
    SortColumn=4
}