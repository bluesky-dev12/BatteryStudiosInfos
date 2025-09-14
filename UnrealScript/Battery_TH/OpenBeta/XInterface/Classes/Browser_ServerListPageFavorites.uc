class Browser_ServerListPageFavorites extends Browser_ServerListPageBase
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
        SQC = PlayerOwner().Level.Spawn(Class'IpDrv.ServerQueryClient');
        SQC.__OnReceivedPingInfo__Delegate = MyServersList.MyReceivedPingInfo;
        SQC.__OnPingTimeout__Delegate = MyServersList.MyPingTimeout;
    }
    MyServersList.Clear();
    i = 0;
    J0x9D:

    // End:0xDB [Loop If]
    if(i < default.Favorites.Length)
    {
        FavoriteToServer(i, Server);
        MyServersList.MyOnReceivedServer(Server);
        i++;
        // [Loop Continue]
        goto J0x9D;
    }
    GUIButton(GUIPanel(Controls[1]).Controls[1]).Caption = RePingCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[4]).__OnClick__Delegate = RemoveFavoriteClick;
    GUIButton(GUIPanel(Controls[1]).Controls[4]).Caption = RemoveFavoriteCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).__OnClick__Delegate = AddIPClick;
    GUIButton(GUIPanel(Controls[1]).Controls[7]).Caption = AddIPCaption;
    GUIButton(GUIPanel(Controls[1]).Controls[6]).bVisible = false;
    StatusBar.WinWidth = 0.8000000;
    MyServersList.InitColumnPerc[0] = 0.0000000;
    MyServersList.InitColumnPerc[1] = 0.4700000;
    MyServersList.InitColumnPerc[2] = 0.2500000;
    MyServersList.InitColumnPerc[3] = 0.1300000;
    MyServersList.InitColumnPerc[4] = 0.1500000;
    //return;    
}

function bool AddIPClick(GUIComponent Sender)
{
    // End:0x4C
    if(Controller.OpenMenu("xinterface.Browser_OpenIP"))
    {
        Browser_OpenIP(Controller.TopPage()).MyFavoritesPage = self;
    }
    return true;
    //return;    
}

function RefreshList()
{
    MyServersList.InvalidatePings();
    MyServersList.AutoPingServers();
    //return;    
}

function ShowPanel(bool bShow)
{
    super(GUITabPanel).ShowPanel(bShow);
    // End:0x4B
    if(bShow)
    {
        Log(MyButton.Caption $ ": Resuming pings");
        MyServersList.AutoPingServers();        
    }
    else
    {
        Log(MyButton.Caption $ ": Cancelling pings");
        MyServersList.StopPings();
    }
    //return;    
}

function CancelPings()
{
    SQC.CancelPings();
    //return;    
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
    //return;    
}

function PingServer(int ListID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    // End:0x47
    if(int(PingCause) == int(1))
    {
        SQC.PingServer(ListID, PingCause, S.IP, S.QueryPort, 3, S);        
    }
    else
    {
        SQC.PingServer(ListID, PingCause, S.IP, S.QueryPort, 0, S);
    }
    //return;    
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
    //return;    
}

function SaveFavorites()
{
    local int i;

    default.Favorites.Length = MyServersList.Servers.Length;
    i = 0;
    J0x1D:

    // End:0x112 [Loop If]
    if(i < MyServersList.Servers.Length)
    {
        default.Favorites[i].ServerID = MyServersList.Servers[i].ServerID;
        default.Favorites[i].IP = MyServersList.Servers[i].IP;
        default.Favorites[i].Port = MyServersList.Servers[i].Port;
        default.Favorites[i].QueryPort = MyServersList.Servers[i].QueryPort;
        default.Favorites[i].ServerName = MyServersList.Servers[i].ServerName;
        i++;
        // [Loop Continue]
        goto J0x1D;
    }
    StaticSaveConfig();
    //return;    
}

function FavoriteToServer(int i, out ServerResponseLine Server)
{
    Server.ServerID = default.Favorites[i].ServerID;
    Server.IP = default.Favorites[i].IP;
    Server.Port = default.Favorites[i].Port;
    Server.QueryPort = default.Favorites[i].QueryPort;
    Server.ServerName = default.Favorites[i].ServerName;
    //return;    
}

function MyAddFavorite(ServerResponseLine Server)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x63 [Loop If]
    if(i < default.Favorites.Length)
    {
        // End:0x59
        if((default.Favorites[i].IP == Server.IP) && default.Favorites[i].Port == Server.Port)
        {
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    MyServersList.MyOnReceivedServer(Server);
    SaveFavorites();
    //return;    
}

static function StaticAddFavorite(string IPString, int nPort, int QueryPort)
{
    local int numFavorites;

    Log((("StaticAddFavorite:" @ IPString) @ string(nPort)) @ string(QueryPort));
    numFavorites = default.Favorites.Length;
    default.Favorites.Length = numFavorites + 1;
    default.Favorites[numFavorites].IP = IPString;
    default.Favorites[numFavorites].Port = nPort;
    default.Favorites[numFavorites].QueryPort = QueryPort;
    default.Favorites[numFavorites].ServerName = "Unknown";
    StaticSaveConfig();
    //return;    
}

defaultproperties
{
    RemoveFavoriteCaption="????? ?????"
    AddIPCaption="IP? ?????"
    RePingCaption="???? ?????"
}