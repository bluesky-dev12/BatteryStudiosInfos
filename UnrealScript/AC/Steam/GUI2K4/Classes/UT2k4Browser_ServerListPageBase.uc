/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_ServerListPageBase.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:19
 *	Functions:22
 *
 *******************************************************************************/
class UT2k4Browser_ServerListPageBase extends UT2K4Browser_Page
    dependson(UT2K4Browser_Page)
    dependson(UT2k4Browser_ServerListBox)
    dependson(UT2k4Browser_RulesListBox)
    dependson(UT2k4Browser_PlayersListBox)
    dependson(UT2k4Browser_RulesList)
    dependson(UT2k4Browser_PlayersList)
    config(User)
    editinlinenew
    instanced;

struct HeaderColumnPos
{
    var() array<float> ColumnSizes;
};

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISplitter sp_Main;
var export editinline GUISplitter sp_Detail;
var() config string RulesListBoxClass;
var() config string PlayersListBoxClass;
var() config float MainSplitterPosition;
var() config float DetailSplitterPosition;
var() config array<HeaderColumnPos> HeaderColumnSizes;
var FloatBox GameTypePos;
var export editinline UT2k4Browser_ServerListBox lb_Server;
var export editinline UT2k4Browser_RulesListBox lb_Rules;
var export editinline UT2k4Browser_PlayersListBox lb_Players;
var export editinline UT2k4Browser_ServersList li_Server;
var export editinline UT2k4Browser_RulesList li_Rules;
var export editinline UT2k4Browser_PlayersList li_Players;
var BrowserFilters FilterMaster;
var bool bAllowUpdates;
var bool ConnectLAN;
var localized string PingingText;
var localized string PingCompleteText;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    FilterMaster = UT2k4ServerBrowser(Controller.TopPage()).FilterMaster;
    li_Rules = UT2k4Browser_RulesList(lb_Rules.List);
    li_Players = UT2k4Browser_PlayersList(lb_Players.List);
    lb_Rules.SetAnchor(self);
    lb_Players.SetAnchor(self);
    // End:0xab
    if(HeaderColumnSizes.Length < 3)
    {
        ResetConfig("HeaderColumnSizes");
    }
    lb_Server.HeaderColumnPerc = HeaderColumnSizes[0].ColumnSizes;
    lb_Rules.HeaderColumnPerc = HeaderColumnSizes[1].ColumnSizes;
    lb_Players.HeaderColumnPerc = HeaderColumnSizes[2].ColumnSizes;
    lb_Server.TabOrder = 0;
    lb_Rules.TabOrder = 1;
    lb_Players.TabOrder = 2;
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    // End:0x30
    if(!bInit && Controller.bAutoRefreshBrowser)
    {
        Refresh();
    }
}

function ShowPanel(bool bShow)
{
    super.ShowPanel(bShow);
    // End:0x57
    if(bShow)
    {
        // End:0x45
        if(bInit)
        {
            sp_Main.SplitterUpdatePositions();
            sp_Detail.SplitterUpdatePositions();
            Refresh();
        }
        // End:0x54
        else
        {
            li_Server.AutoPingServers();
        }
    }
    // End:0x81
    else
    {
        // End:0x81
        if(!bInit)
        {
            li_Server.OutstandingPings.Remove(0, li_Server.OutstandingPings.Length);
        }
    }
}

function Refresh()
{
    super(GUITabPanel).Refresh();
    // End:0x17
    if(li_Server == none)
    {
        InitServerList();
    }
    li_Server.Clear();
}

function InitServerList()
{
    // End:0x1a
    if(li_Server == none)
    {
        li_Server = new (none) class'UT2k4Browser_ServersList';
    }
    lb_Server.InitBaseList(li_Server);
    li_Server.__OnChange__Delegate = ServerListChanged;
    lb_Server.SetAnchor(self);
}

function RefreshList()
{
    li_Server.RePingServers();
}

function JoinClicked()
{
    li_Server.Connect(false);
}

function SpectateClicked()
{
    li_Server.Connect(true);
}

function UpdateStatusPingCount()
{
    local string StatusText;

    CheckJoinButton(li_Server.IsValid());
    CheckSpectateButton(li_Server.IsValid());
    // End:0x37
    if(li_Server == none)
    {
        return;
    }
    // End:0xad
    if(li_Server.NumReceivedPings < li_Server.Servers.Length)
    {
        StatusText = Repl(PingingText, "%NumRec%", string(li_Server.NumReceivedPings));
        StatusText = Repl(StatusText, "%TotalNum%", string(li_Server.Servers.Length));
    }
    // End:0x104
    else
    {
        StatusText = Repl(QueryCompleteString, "%NumServers%", string(li_Server.Servers.Length));
        StatusText = Repl(StatusText, "%NumPlayers%", string(li_Server.NumPlayers));
    }
    SetFooterCaption(StatusText);
}

function CancelPings()
{
    Browser.Uplink().CancelPings();
    SetFooterCaption(ReadyString);
}

function PingServer(int ListID, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    // End:0x51
    if(PingCause == 1)
    {
        Browser.Uplink().PingServer(ListID, PingCause, S.IP, S.QueryPort, 3, S);
    }
    // End:0x8f
    else
    {
        Browser.Uplink().PingServer(ListID, PingCause, S.IP, S.QueryPort, 0, S);
    }
}

function MousePressed(GUIComponent Sender, bool bRepeat)
{
    bAllowUpdates = false;
    // End:0x49
    if(GUIVertScrollBar(Sender.MenuOwner) != none)
    {
        GUIVertScrollBar(Sender.MenuOwner).GripPressed(Sender, bRepeat);
    }
}

function MouseReleased(GUIComponent Sender)
{
    bAllowUpdates = true;
}

function RefreshCurrentServer()
{
    local int i, j;

    // End:0x16
    if(Controller.ContextMenu != none)
    {
        return;
    }
    CheckSpectateButton(li_Server.IsValid());
    CheckJoinButton(li_Server.IsValid());
    i = li_Server.CurrentListId();
    // End:0x62
    if(i < 0)
    {
        return;
    }
    PingServer(i, 1, li_Server.Servers[i]);
    li_Players.Clear();
    j = 0;
    J0x99:
    // End:0xf5 [While If]
    if(j < li_Server.Servers[i].PlayerInfo.Length)
    {
        li_Players.AddNewPlayer(li_Server.Servers[i].PlayerInfo[j]);
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x99;
    }
    li_Players.SortList();
}

function ServerListChanged(GUIComponent Sender)
{
    local int i, j;

    // End:0x23
    if(!bAllowUpdates || Controller.ContextMenu != none)
    {
        return;
    }
    li_Rules.Clear();
    li_Players.Clear();
    CheckSpectateButton(li_Server.IsValid());
    CheckJoinButton(li_Server.IsValid());
    i = li_Server.CurrentListId();
    // End:0x8d
    if(i < 0)
    {
        return;
    }
    // End:0xb9
    if(Sender != none)
    {
        PingServer(i, 1, li_Server.Servers[i]);
    }
    j = 0;
    J0xc0:
    // End:0x11c [While If]
    if(j < li_Server.Servers[i].ServerInfo.Length)
    {
        li_Rules.AddNewRule(li_Server.Servers[i].ServerInfo[j]);
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0xc0;
    }
    j = 0;
    J0x123:
    // End:0x17f [While If]
    if(j < li_Server.Servers[i].PlayerInfo.Length)
    {
        li_Players.AddNewPlayer(li_Server.Servers[i].PlayerInfo[j]);
        ++ j;
        // This is an implied JumpToken; Continue!
        goto J0x123;
    }
    li_Players.SortList();
    li_Rules.SortList();
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x23
    if(UT2k4Browser_ServerListBox(NewComp) != none)
    {
        lb_Server = UT2k4Browser_ServerListBox(NewComp);
    }
    // End:0x18e
    else
    {
        // End:0x46
        if(UT2k4Browser_RulesListBox(NewComp) != none)
        {
            lb_Rules = UT2k4Browser_RulesListBox(NewComp);
        }
        // End:0x18e
        else
        {
            // End:0x69
            if(UT2k4Browser_PlayersListBox(NewComp) != none)
            {
                lb_Players = UT2k4Browser_PlayersListBox(NewComp);
            }
            // End:0x18e
            else
            {
                // End:0x18e
                if(GUISplitter(NewComp) != none)
                {
                    sp_Detail = GUISplitter(NewComp);
                    sp_Detail.DefaultPanels[0] = RulesListBoxClass;
                    sp_Detail.DefaultPanels[1] = PlayersListBoxClass;
                    sp_Detail.WinTop = 0.0;
                    sp_Detail.WinLeft = 0.0;
                    sp_Detail.WinWidth = 1.0;
                    sp_Detail.WinHeight = 1.0;
                    sp_Detail.bNeverFocus = true;
                    sp_Detail.bAcceptsInput = true;
                    sp_Detail.SplitOrientation = 1;
                    sp_Detail.IniOption = "@Internal";
                    sp_Detail.__OnCreateComponent__Delegate = InternalOnCreateComponent;
                    sp_Detail.__OnLoadINI__Delegate = InternalOnLoadINI;
                    sp_Detail.__OnReleaseSplitter__Delegate = InternalReleaseSplitter;
                }
            }
        }
    }
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    // End:0x26
    if(Sender == sp_Main)
    {
        sp_Main.SplitPosition = MainSplitterPosition;
    }
    // End:0x49
    else
    {
        // End:0x49
        if(Sender == sp_Detail)
        {
            sp_Detail.SplitPosition = DetailSplitterPosition;
        }
    }
}

function InternalReleaseSplitter(GUIComponent Sender, float NewPos)
{
    // End:0x20
    if(Sender == sp_Main)
    {
        MainSplitterPosition = NewPos;
        SaveConfig();
    }
    // End:0x3d
    else
    {
        // End:0x3d
        if(Sender == sp_Detail)
        {
            DetailSplitterPosition = NewPos;
            SaveConfig();
        }
    }
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    HeaderColumnSizes[0].ColumnSizes = lb_Server.HeaderColumnPerc;
    HeaderColumnSizes[1].ColumnSizes = lb_Rules.HeaderColumnPerc;
    HeaderColumnSizes[2].ColumnSizes = lb_Players.HeaderColumnPerc;
    SaveConfig();
    return "";
}

function bool IsRefreshAvailable(out string ButtonCaption)
{
    ButtonCaption = RefreshCaption;
    return true;
}

function bool IsSpectateAvailable(out string ButtonCaption)
{
    ButtonCaption = SpectateCaption;
    // End:0x2c
    if(li_Server != none && li_Server.IsValid())
    {
        return true;
    }
    return false;
}

function bool IsJoinAvailable(out string ButtonCaption)
{
    ButtonCaption = JoinCaption;
    // End:0x2c
    if(li_Server != none && li_Server.IsValid())
    {
        return true;
    }
    return false;
}

defaultproperties
{
    begin object name=HorzSplitter class=GUISplitter
        DefaultPanels[0]="GUI2K4.UT2K4Browser_ServerListBox"
        DefaultPanels[1]="XInterface.GUISplitter"
        MaxPercentage=0.90
        OnReleaseSplitter=InternalReleaseSplitter
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@Internal"
        RenderWeight=1.0
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: GUISplitter'UT2k4Browser_ServerListPageBase.HorzSplitter'
    sp_Main=HorzSplitter
    RulesListBoxClass="GUI2K4.UT2K4Browser_RulesListBox"
    PlayersListBoxClass="GUI2K4.UT2K4Browser_PlayersListBox"
    MainSplitterPosition=0.6656720
    DetailSplitterPosition=0.4609380
    HeaderColumnSizes=// Object reference not set to an instance of an object.
    
    bAllowUpdates=true
    PingingText="?? ?? ? ( %NumRec% / %TotalNum% )"
    PingCompleteText="?? ??! ?? %NumServers%?, ???? %NumPlayers%?"
    QueryCompleteString="?? ??! ??: %NumServers% ??"
    PanelCaption="?? ????"
    bFillHeight=true
    IniOption="@Internal"
    WinHeight=0.7929690
    OnSaveINI=InternalOnSaveINI
}