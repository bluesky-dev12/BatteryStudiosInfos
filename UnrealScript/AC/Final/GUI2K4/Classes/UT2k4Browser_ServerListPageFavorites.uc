class UT2k4Browser_ServerListPageFavorites extends UT2k4Browser_ServerListPageBase
    config(User)
    editinlinenew
    instanced;

var() localized string AddFavoriteCaption;
var() localized string RemoveFavoriteCaption;
var() localized string RemoveFavoriteText;
var() localized string EditFavoriteText;
var() int EditIndex;
var array<ServerFavorite> Servers;
var array<string> ContextItems;
var protected ServerQueryClient SQC;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    GetQueryClient();
    lb_Server.__OnRightClick__Delegate = ListBoxRightClick;
    ContextItems = lb_Server.ContextItems;
    ContextItems[ContextItems.Length - 1] = EditFavoriteText;
    ContextItems[ContextItems.Length] = RemoveFavoriteText;
    i = 0;
    J0x6C:

    // End:0xC3 [Loop If]
    if(i < ContextItems.Length)
    {
        // End:0xB9
        if(ContextItems[i] == lb_Server.ContextItems[lb_Server.FILTERIDX])
        {
            ContextItems.Remove(i, 4);
            // [Explicit Break]
            goto J0xC3;
        }
        i++;
        // [Loop Continue]
        goto J0x6C;
    }
    J0xC3:

    //return;    
}

function InitPanel()
{
    super(GUITabPanel).InitPanel();
    InitServerList();
    Browser.__OnAddFavorite__Delegate = AddFavorite;
    //return;    
}

function OnDestroyPanel(optional bool bCancelled)
{
    super(GUITabPanel).OnDestroyPanel(bCancelled);
    ClearQueryClient();
    //return;    
}

function LevelChanged()
{
    super(GUIMultiComponent).LevelChanged();
    ClearQueryClient();
    //return;    
}

function free()
{
    super(GUITabPanel).free();
    ClearQueryClient();
    //return;    
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x1D
    if(bShow)
    {
        bInit = false;
    }
    //return;    
}

function InitServerList()
{
    super.InitServerList();
    // End:0x2A
    if(li_Server.Servers.Length > 0)
    {
        li_Server.Clear();
    }
    InitFavorites();
    //return;    
}

function InitFavorites()
{
    local int i;
    local ServerResponseLine Server;

    Class'XInterface.ExtendedConsole'.static.GetFavorites(Servers);
    i = 0;
    J0x1B:

    // End:0x70 [Loop If]
    if((i < Servers.Length) && i < 10000)
    {
        ConvertFavoriteToServer(Servers[i], Server);
        li_Server.MyOnReceivedServer(Server);
        i++;
        // [Loop Continue]
        goto J0x1B;
    }
    //return;    
}

function Refresh()
{
    super.Refresh();
    InitFavorites();
    RefreshList();
    //return;    
}

function RefreshList()
{
    GetQueryClient();
    ResetQueryClient(SQC);
    CancelPings();
    super.RefreshList();
    //return;    
}

function CancelPings()
{
    // End:0x1A
    if(SQC != none)
    {
        SQC.CancelPings();
    }
    //return;    
}

function PingServer(int ListID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    GetQueryClient();
    // End:0x4D
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

static function ConvertFavoriteToServer(ServerFavorite Fav, out ServerResponseLine Server)
{
    Server.ServerID = Fav.ServerID;
    Server.IP = Fav.IP;
    Server.Port = Fav.Port;
    Server.QueryPort = Fav.QueryPort;
    Server.ServerName = Fav.ServerName;
    //return;    
}

static function ConvertServerToFavorite(ServerResponseLine Server, out ServerFavorite Fav)
{
    Fav.ServerID = Server.ServerID;
    Fav.IP = Server.IP;
    Fav.Port = Server.Port;
    Fav.QueryPort = Server.QueryPort;
    Fav.ServerName = Server.ServerName;
    //return;    
}

function AddFavorite(ServerResponseLine Server)
{
    local ServerFavorite Fav;

    ConvertServerToFavorite(Server, Fav);
    // End:0x4D
    if(Class'XInterface.ExtendedConsole'.static.AddFavorite(Fav))
    {
        Servers[Servers.Length] = Fav;
        li_Server.MyOnReceivedServer(Server);
    }
    //return;    
}

function RemoveFavorite(ServerResponseLine Server)
{
    local int i;

    i = li_Server.FindIndex(Server.IP, string(Server.Port));
    i = li_Server.RemoveServerAt(i);
    // End:0x8E
    if((i >= 0) && Class'XInterface.ExtendedConsole'.static.RemoveFavorite(Server.IP, Server.Port, Server.QueryPort))
    {
        Servers.Remove(i, 1);
    }
    //return;    
}

function SaveFavorites()
{
    Class'XInterface.ExtendedConsole'.static.SaveFavorites();
    //return;    
}

function ReceivedPingInfo(int ServerID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    local ServerFavorite Fav;
    local int i;

    super(UT2K4Browser_Page).ReceivedPingInfo(ServerID, PingCause, S);
    i = 0;
    J0x1C:

    // End:0xBB [Loop If]
    if(i < Servers.Length)
    {
        // End:0xB1
        if((Servers[i].IP == S.IP) && Servers[i].Port == S.Port)
        {
            // End:0xB1
            if(!Servers[i].ServerName ~= S.ServerName)
            {
                ConvertServerToFavorite(S, Fav);
                Class'XInterface.ExtendedConsole'.static.AddFavorite(Fav);
            }
        }
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    li_Server.MyReceivedPingInfo(ServerID, PingCause, S);
    // End:0xEF
    if(int(PingCause) == int(2))
    {
        UpdateStatusPingCount();
    }
    //return;    
}

function ReceivedPingTimeout(int ListID, ServerQueryClient.EPingCause PingCause)
{
    li_Server.MyPingTimeout(ListID, PingCause);
    // End:0x2F
    if(int(PingCause) == int(2))
    {
        UpdateStatusPingCount();
    }
    //return;    
}

function ServerQueryClient GetQueryClient()
{
    local int i;

    // End:0x13C
    if(SQC == none)
    {
        SQC = PlayerOwner().Spawn(Class'IpDrv.ServerQueryClient');
        // End:0xDA
        if((SQC != none) && SQC.NetworkError())
        {
            J0x3F:

            Log((string(Name) @ "- Network error in query client - retrying  ") $ string(i));
            SQC.Destroy();
            SQC = PlayerOwner().Spawn(Class'IpDrv.ServerQueryClient');
            // End:0x3F
            if(!(!SQC.NetworkError() || ++i < 10))
                goto J0x3F;
            // End:0xDA
            if(i >= 10)
            {
                ShowNetworkError();
                return none;
            }
        }
        SQC.__OnReceivedPingInfo__Delegate = ReceivedPingInfo;
        SQC.__OnPingTimeout__Delegate = ReceivedPingTimeout;
        Log(((string(Name) @ "Spawned new ServerQueryClient '") $ string(SQC)) $ "'");
    }
    return SQC;
    //return;    
}

protected function ClearQueryClient()
{
    // End:0x6C
    if(SQC != none)
    {
        Log(((string(Name) @ "Destroying ServerQueryClient '") $ string(SQC.Name)) $ "'");
        SaveFavorites();
        CancelPings();
        SQC.Destroy();
        SQC = none;
    }
    //return;    
}

function bool ListBoxRightClick(GUIComponent Sender)
{
    return false;
    //return;    
}

function bool ContextMenuOpened(GUIContextMenu Sender)
{
    Sender.ContextItems.Remove(0, Sender.ContextItems.Length);
    // End:0x48
    if(li_Server.IsValid())
    {
        Sender.ContextItems = ContextItems;        
    }
    else
    {
        Sender.ContextItems[0] = lb_Server.ContextItems[lb_Server.ADDFAVIDX];
        Sender.ContextItems[1] = lb_Server.ContextItems[lb_Server.OPENIPIDX];
    }
    return true;
    //return;    
}

function ContextSelect(GUIContextMenu Menu, int Index)
{
    local int i;
    local ServerResponseLine S;

    // End:0x19
    if(NotifyContextSelect(Menu, Index))
    {
        return;
    }
    // End:0x8E
    if(Menu.ContextItems[Index] == lb_Server.ContextItems[lb_Server.ADDFAVIDX])
    {
        // End:0x8C
        if(Controller.OpenMenu(Controller.EditFavoriteMenu))
        {
            Controller.ActivePage.__OnClose__Delegate = AddPageClosed;
        }
        return;
    }
    // End:0xD2
    if((Menu.ContextItems[Index] == RemoveFavoriteText) && li_Server.GetCurrent(S))
    {
        RemoveFavorite(S);
        return;
    }
    // End:0x1AC
    if((Menu.ContextItems[Index] ~= EditFavoriteText) && li_Server.IsValid())
    {
        i = li_Server.CurrentListId();
        // End:0x1AA
        if(Controller.OpenMenu(Controller.EditFavoriteMenu, (li_Server.Servers[i].IP $ ":") $ string(li_Server.Servers[i].Port), li_Server.Servers[i].ServerName))
        {
            Controller.ActivePage.__OnClose__Delegate = EditPageClosed;
        }
        return;
    }
    lb_Server.InternalOnClick(Menu, Index);
    //return;    
}

function AddPageClosed(bool bCancelled)
{
    // End:0x33
    if(!bCancelled)
    {
        AddFavorite(EditFavoritePage(Controller.ActivePage).Server);
        Refresh();
    }
    //return;    
}

function EditPageClosed(bool bCancelled)
{
    // End:0x57
    if(!bCancelled)
    {
        RemoveFavorite(li_Server.Servers[li_Server.CurrentListId()]);
        AddFavorite(EditFavoritePage(Controller.ActivePage).Server);
        Refresh();
    }
    //return;    
}

function NetworkErrorClosed(bool bCancelled)
{
    // End:0x11
    if(!bCancelled)
    {
        GetQueryClient();
    }
    //return;    
}

defaultproperties
{
    AddFavoriteCaption="???? ??"
    RemoveFavoriteCaption="???? ??"
    RemoveFavoriteText="???? ??"
    EditFavoriteText="IP ?? ??"
    PanelCaption="?? ???? : ????"
    // Reference: GUIContextMenu'GUI2K4_Decompressed.UT2k4Browser_ServerListPageFavorites.FavoritesContextMenu'
    begin object name="FavoritesContextMenu" class=XInterface.GUIContextMenu
        OnOpen=UT2k4Browser_ServerListPageFavorites.ContextMenuOpened
        OnSelect=UT2k4Browser_ServerListPageFavorites.ContextSelect
    end object
    ContextMenu=FavoritesContextMenu
}