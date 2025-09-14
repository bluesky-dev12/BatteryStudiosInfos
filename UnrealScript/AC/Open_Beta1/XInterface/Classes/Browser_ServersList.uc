class Browser_ServersList extends GUIMultiColumnList
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
    // End:0xFA
    if(Controller.MaxSimultaneousPings == 0)
    {
        i = Class'Engine.Player'.default.ConfiguredInternetSpeed;
        // End:0xBB
        if(i <= 2600)
        {
            UseSimultaneousPings = 10;            
        }
        else
        {
            // End:0xD5
            if(i <= 5000)
            {
                UseSimultaneousPings = 15;                
            }
            else
            {
                // End:0xEF
                if(i <= 10000)
                {
                    UseSimultaneousPings = 20;                    
                }
                else
                {
                    UseSimultaneousPings = 35;
                }
            }
        }        
    }
    else
    {
        UseSimultaneousPings = Controller.MaxSimultaneousPings;
    }
    //return;    
}

function Clear()
{
    PingStart = 0;
    StopPings();
    Servers.Remove(0, Servers.Length);
    ItemCount = 0;
    super.Clear();
    //return;    
}

function CopyServerToClipboard()
{
    local string URL;

    // End:0x78
    if(Index >= 0)
    {
        URL = (((PlayerOwner().GetURLProtocol() $ "://") $ Servers[SortData[Index].SortItem].IP) $ ":") $ string(Servers[SortData[Index].SortItem].Port);
        PlayerOwner().CopyToClipboard(URL);
    }
    //return;    
}

function Connect(bool Spectator)
{
    local string URL;

    // End:0xD8
    if(Index >= 0)
    {
        URL = (((PlayerOwner().GetURLProtocol() $ "://") $ Servers[SortData[Index].SortItem].IP) $ ":") $ string(Servers[SortData[Index].SortItem].Port);
        // End:0x8E
        if(Spectator)
        {
            URL = URL $ "?SpectatorOnly=1";
        }
        // End:0xB3
        if(MyPage.ConnectLAN)
        {
            URL = URL $ "?LAN";
        }
        Controller.CloseAll(false);
        PlayerOwner().ClientTravel(URL, 0, false);
    }
    //return;    
}

function AddFavorite(ServerBrowser Browser)
{
    // End:0x34
    if(Index >= 0)
    {
        Browser.OnAddFavorite(Servers[SortData[Index].SortItem]);
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
    // End:0x7D
    if(int(State) == 1)
    {
        switch(key)
        {
            // End:0x3F
            case 13:
                Connect(false);
                return true;
                // End:0x7D
                break;
            // End:0x58
            case 116:
                MyPage.RefreshList();
                return true;
                // End:0x7D
                break;
            // End:0x7A
            case 67:
                // End:0x77
                if(Controller.CtrlPressed)
                {
                    CopyServerToClipboard();
                    return true;
                }
                // End:0x7D
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

    i = Servers.Length;
    Servers.Length = i + 1;
    Servers[i] = S;
    // End:0x58
    if(Servers[i].Ping == 0)
    {
        Servers[i].Ping = 9999;
    }
    ItemCount++;
    AddedItem();
    //return;    
}

function MyPingTimeout(int ListID, ServerQueryClient.EPingCause PingCause)
{
    local int i;

    // End:0x12
    if(ListID >= Servers.Length)
    {
        return;
    }
    // End:0x4D
    if(Servers[ListID].Ping == 9999)
    {
        Servers[ListID].Ping = 10000;
        UpdatedItem(ListID);
    }
    i = 0;
    J0x54:

    // End:0x92 [Loop If]
    if(i < OutstandingPings.Length)
    {
        // End:0x88
        if(OutstandingPings[i] == ListID)
        {
            OutstandingPings.Remove(i, 1);
            // [Explicit Break]
            goto J0x92;
        }
        i++;
        // [Loop Continue]
        goto J0x54;
    }
    J0x92:

    // End:0xB7
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

    // End:0x78 [Loop If]
    if((i < ListID) && i < Servers.Length)
    {
        // End:0x6E
        if(Servers[i].Ping == 9999)
        {
            // [Explicit Break]
            goto J0x78;
        }
        i++;
        // [Loop Continue]
        goto J0x30;
    }
    J0x78:

    // End:0x92
    if(i < ListID)
    {
        PingStart = ListID;
    }
    i = 0;
    J0x99:

    // End:0xD7 [Loop If]
    if(i < OutstandingPings.Length)
    {
        // End:0xCD
        if(OutstandingPings[i] == ListID)
        {
            OutstandingPings.Remove(i, 1);
            // [Explicit Break]
            goto J0xD7;
        }
        i++;
        // [Loop Continue]
        goto J0x99;
    }
    J0xD7:

    UpdatedItem(ListID);
    // End:0x110
    if((Index >= 0) && ListID == SortData[Index].SortItem)
    {
        MyOnChange(none);
    }
    // End:0x146
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

function MyQueryFinished(MasterServerClient.EResponseInfo ResponseInfo, int Info)
{
    // End:0x16
    if(int(ResponseInfo) == int(3))
    {
        RePingServers();
    }
    //return;    
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

    // End:0x5D [Loop If]
    if(i < Servers.Length)
    {
        Servers[i].Ping = 9999;
        UpdatedItem(i);
        i++;
        // [Loop Continue]
        goto J0x22;
    }
    //return;    
}

function AutoPingServers()
{
    local int i, j;

    i = PingStart;
    J0x0B:

    // End:0xE7 [Loop If]
    if((i < Servers.Length) && OutstandingPings.Length < UseSimultaneousPings)
    {
        // End:0xDD
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

            // End:0xDD
            if(j == OutstandingPings.Length)
            {
                MyPage.PingServer(i, 2, Servers[i]);
                j = OutstandingPings.Length;
                OutstandingPings.Length = j + 1;
                OutstandingPings[j] = i;
            }
        }
        i++;
        // [Loop Continue]
        goto J0x0B;
    }
    // End:0xFF
    if(OutstandingPings.Length == 0)
    {
        NumReceivedPings = Servers.Length;
    }
    //return;    
}

function StopPings()
{
    OutstandingPings.Remove(0, OutstandingPings.Length);
    MyPage.CancelPings();
    //return;    
}

event Timer()
{
    // End:0x12
    if(Index >= 0)
    {
        MyOnChange(self);
    }
    //return;    
}

function MyOnChange(GUIComponent Sender)
{
    MyRulesList.Clear();
    MyPlayersList.Clear();
    // End:0x10B
    if(Index >= 0)
    {
        // End:0x6B
        if(Sender != none)
        {
            MyPage.PingServer(SortData[Index].SortItem, 1, Servers[SortData[Index].SortItem]);
        }
        MyRulesList.ItemCount = Servers[SortData[Index].SortItem].ServerInfo.Length;
        MyRulesList.listitem = SortData[Index].SortItem;
        MyPlayersList.ItemCount = Servers[SortData[Index].SortItem].PlayerInfo.Length;
        MyPlayersList.listitem = SortData[Index].SortItem;
        SetTimer(5.0000000, false);        
    }
    else
    {
        MyRulesList.ItemCount = 0;
        MyPlayersList.ItemCount = 0;
    }
    //return;    
}

function int RemoveCurrentServer()
{
    local int OldItem;

    // End:0x60
    if(Index >= 0)
    {
        OldItem = SortData[Index].SortItem;
        Servers.Remove(OldItem, 1);
        ItemCount--;
        MyRulesList.ItemCount = 0;
        MyPlayersList.ItemCount = 0;
        RemovedCurrent();
        return OldItem;
    }
    return -1;
    //return;    
}

function MyOnDrawItem(Canvas Canvas, int i, float X, float Y, float W, float H, bool bSelected, bool bPending)
{
    local float CellLeft, CellWidth, DrawX, IconPosX, IconPosY;

    local string Ping;
    local int k, Flags, checkFlag;

    // End:0x3F
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

    // End:0x1A1 [Loop If]
    if((k < Icons.Length) && IconPosX < (CellLeft + CellWidth))
    {
        // End:0x189
        if((Flags & checkFlag) != 0)
        {
            DrawX = float(Min(14, int(float(int(CellLeft + CellWidth)) - IconPosX)));
            Canvas.DrawColor = Canvas.MakeColor(byte(255), byte(255), byte(255), byte(255));
            Canvas.SetPos(IconPosX, IconPosY);
            Canvas.DrawTile(Icons[k], DrawX, 14.0000000, 0.0000000, 0.0000000, DrawX + 1.0000000, 15.0000000);
            IconPosX += float(14);
        }
        checkFlag = checkFlag >> 1;
        k++;
        // [Loop Continue]
        goto J0x99;
    }
    GetCellLeftWidth(1, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, Servers[SortData[i].SortItem].ServerName, FontScale);
    GetCellLeftWidth(2, CellLeft, CellWidth);
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, Servers[SortData[i].SortItem].MapName, FontScale);
    GetCellLeftWidth(3, CellLeft, CellWidth);
    // End:0x331
    if((Servers[SortData[i].SortItem].CurrentPlayers > 0) || Servers[SortData[i].SortItem].MaxPlayers > 0)
    {
        Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, (string(Servers[SortData[i].SortItem].CurrentPlayers) $ "/") $ string(Servers[SortData[i].SortItem].MaxPlayers & 255), FontScale);
    }
    GetCellLeftWidth(4, CellLeft, CellWidth);
    // End:0x374
    if(Servers[SortData[i].SortItem].Ping == 9999)
    {
        Ping = "?";        
    }
    else
    {
        // End:0x3A7
        if(Servers[SortData[i].SortItem].Ping == 10000)
        {
            Ping = "N/A";            
        }
        else
        {
            Ping = string(Servers[SortData[i].SortItem].Ping);
        }
    }
    Style.DrawText(Canvas, MenuState, CellLeft, Y, CellWidth, H, 0, Ping, FontScale);
    //return;    
}

function string GetSortString(int i)
{
    local string S, t;

    switch(SortColumn)
    {
        // End:0x0B
        case 0:
        // End:0x2E
        case 1:
            S = Left(Caps(Servers[i].ServerName), 8);
            // End:0x162
            break;
        // End:0x52
        case 2:
            S = Left(Caps(Servers[i].MapName), 8);
            // End:0x162
            break;
        // End:0xE2
        case 3:
            S = string(Servers[i].CurrentPlayers);
            J0x6F:

            // End:0x90 [Loop If]
            if(Len(S) < 4)
            {
                S = "0" $ S;
                // [Loop Continue]
                goto J0x6F;
            }
            t = string(Servers[i].MaxPlayers & 255);
            J0xAC:

            // End:0xCD [Loop If]
            if(Len(t) < 4)
            {
                t = "0" $ t;
                // [Loop Continue]
                goto J0xAC;
            }
            S = S $ t;
            // End:0x162
            break;
        // End:0x123
        case 4:
            S = string(Servers[i].Ping);
            J0xFF:

            // End:0x120 [Loop If]
            if(Len(S) < 5)
            {
                S = "0" $ S;
                // [Loop Continue]
                goto J0xFF;
            }
            // End:0x162
            break;
        // End:0xFFFF
        default:
            S = string(Servers[i].Ping);
            J0x13E:

            // End:0x15F [Loop If]
            if(Len(S) < 5)
            {
                S = "0" $ S;
                // [Loop Continue]
                goto J0x13E;
            }
            // End:0x162
            break;
            break;
    }
    return S;
    //return;    
}

defaultproperties
{
    IconDescriptions[0]="???? ??"
    IconDescriptions[1]="???? ??"
    IconDescriptions[2]="?? ??"
    IconDescriptions[3]="????? ???"
    IconDescriptions[4]="??????"
    IconDescriptions[5]="?? ??"
    IconDescriptions[6]="UT ???"
    ColumnHeadings[0]=""
    ColumnHeadings[1]="?? ??"
    ColumnHeadings[2]="?"
    ColumnHeadings[3]="????"
    ColumnHeadings[4]="?"
    InitColumnPerc[0]=0.1000000
    InitColumnPerc[1]=0.3700000
    InitColumnPerc[2]=0.2500000
    InitColumnPerc[3]=0.1300000
    InitColumnPerc[4]=0.1500000
    SortColumn=4
}