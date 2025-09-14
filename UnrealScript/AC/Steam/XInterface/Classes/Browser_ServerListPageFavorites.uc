/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_ServerListPageFavorites.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:6
 *	Functions:12
 *
 *******************************************************************************/
class Browser_ServerListPageFavorites extends Browser_ServerListPageBase
    dependson(Browser_OpenIP)
    config(User)
    editinlinenew
    instanced;

struct FavoritesServerInfo
{
    var() config int ServerID;
    var() config string IP;
    var() config int Port;
    var() config int QueryPort;
    var() config string ServerName;
};

var() config array<FavoritesServerInfo> Favorites;
var localized string RemoveFavoriteCaption;
var localized string AddIPCaption;
var localized string RePingCaption;
var ServerQueryClient SQC;
var export editinline GUIButton MyAddIPButton;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;
    local ServerResponseLine Server;

    super.InitComponent(MyController, myOwner);
    Browser.__OnAddFavorite__Delegate = MyAddFavorite;
    // End:0x87
    if(SQC == none)
    {
        SQC = PlayerOwner().Level.Spawn(class'ServerQueryClient');
        SQC.__OnReceivedPingInfo__Delegate = MyServersList.MyReceivedPingInfo;
        SQC.__OnPingTimeout__Delegate = MyServersList.MyPingTimeout;
    }
    MyServersList.Clear();
    i = 0;
    J0x9d:
    // End:0xdb [While If]
    if(i < default.Favorites.Length)
    {
        FavoriteToServer(i, Server);
        MyServersList.MyOnReceivedServer(Server);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x9d;
    }
    GUIButton(GUIPanel(Controls[1]).Controls[1]).Caption = RePingCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[4]).__OnClick__Delegate = RemoveFavoriteClick;
    GUIButton(GUIPanel(Controls[1]).Controls[4]).Caption = RemoveFavoriteCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).__OnClick__Delegate = AddIPClick;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).Caption = AddIPCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[6]).bVisible = false;
    StatusBar.WinWidth = 0.80;
    MyServersList.InitColumnPerc[0] = 0.0;
    MyServersList.InitColumnPerc[1] = 0.470;
    MyServersList.InitColumnPerc[2] = 0.250;
    MyServersList.InitColumnPerc[3] = 0.130;
    MyServersList.InitColumnPerc[4] = 0.150;
}

function bool AddIPClick(GUIComponent Sender)
{
    // End:0x4c
    if(Controller.OpenMenu("xinterface.Browser_OpenIP"))
    {
        Browser_OpenIP(Controller.TopPage()).MyFavoritesPage = self;
    }
    return true;
}

function RefreshList()
{
    MyServersList.InvalidatePings();
    MyServersList.AutoPingServers();
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x4b
    if(bShow)
    {
        Log(MyButton.Caption $ ": Resuming pings");
        MyServersList.AutoPingServers();
    }
    // End:0x80
    else
    {
        Log(MyButton.Caption $ ": Cancelling pings");
        MyServersList.StopPings();
    }
}

function CancelPings()
{
    SQC.CancelPings();
}

function OnCloseBrowser()
{
    // End:0x33
    if(SQC != none)
    {
        SaveFavorites();
        SQC.CancelPings();
        SQC.Destroy();
        SQC = none;
    }
}

function PingServer(int ListID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    // End:0x47
    if(PingCause == 1)
    {
        SQC.PingServer(ListID, PingCause, S.IP, S.QueryPort, 3, S);
    }
    // End:0x7b
    else
    {
        SQC.PingServer(ListID, PingCause, S.IP, S.QueryPort, 0, S);
    }
}

function bool RemoveFavoriteClick(GUIComponent Sender)
{
    local int i;

    i = MyServersList.RemoveCurrentServer();
    // End:0x32
    if(i >= 0)
    {
        default.Favorites.Remove(i, 1);
        SaveFavorites();
    }
    return true;
}

function SaveFavorites()
{
    local int i;

    default.Favorites.Length = MyServersList.Servers.Length;
    i = 0;
    J0x1d:
    // End:0x112 [While If]
    if(i < MyServersList.Servers.Length)
    {
        default.Favorites[i].ServerID = MyServersList.Servers[i].ServerID;
        default.Favorites[i].IP = MyServersList.Servers[i].IP;
        default.Favorites[i].Port = MyServersList.Servers[i].Port;
        default.Favorites[i].QueryPort = MyServersList.Servers[i].QueryPort;
        default.Favorites[i].ServerName = MyServersList.Servers[i].ServerName;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1d;
    }
    StaticSaveConfig();
}

function FavoriteToServer(int i, out ServerResponseLine Server)
{
    Server.ServerID = default.Favorites[i].ServerID;
    Server.IP = default.Favorites[i].IP;
    Server.Port = default.Favorites[i].Port;
    Server.QueryPort = default.Favorites[i].QueryPort;
    Server.ServerName = default.Favorites[i].ServerName;
}

function MyAddFavorite(ServerResponseLine Server)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x63 [While If]
    if(i < default.Favorites.Length)
    {
        // End:0x59
        if(default.Favorites[i].IP == Server.IP && default.Favorites[i].Port == Server.Port)
        {
            return;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    MyServersList.MyOnReceivedServer(Server);
    SaveFavorites();
}

static function StaticAddFavorite(string IPString, int nPort, int QueryPort)
{
    local int numFavorites;

    Log("StaticAddFavorite:" @ IPString @ string(nPort) @ string(QueryPort));
    numFavorites = default.Favorites.Length;
    default.Favorites.Length = numFavorites + 1;
    default.Favorites[numFavorites].IP = IPString;
    default.Favorites[numFavorites].Port = nPort;
    default.Favorites[numFavorites].QueryPort = QueryPort;
    default.Favorites[numFavorites].ServerName = "Unknown";
    StaticSaveConfig();
}

defaultproperties
{
    RemoveFavoriteCaption="Remove from Favorites."
    AddIPCaption="Add an IP address."
    RePingCaption="Re-pinging list."
}