class UT2k4Browser_ServerListPageBase extends UT2K4Browser_Page
    config(User)
    editinlinenew
    instanced;

struct HeaderColumnPos
{
    var() array<float> ColumnSizes;
};

var() automated GUISplitter sp_Main;
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
    // End:0xAB
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
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    // End:0x30
    if(!bInit && Controller.bAutoRefreshBrowser)
    {
        Refresh();
    }
    //return;    
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
        else
        {
            li_Server.AutoPingServers();
        }        
    }
    else
    {
        // End:0x81
        if(!bInit)
        {
            li_Server.OutstandingPings.Remove(0, li_Server.OutstandingPings.Length);
        }
    }
    //return;    
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
    //return;    
}

function InitServerList()
{
    // End:0x1A
    if(li_Server == none)
    {
        li_Server = new (none) Class'GUI2K4_Decompressed.UT2k4Browser_ServersList';
    }
    lb_Server.InitBaseList(li_Server);
    li_Server.__OnChange__Delegate = ServerListChanged;
    lb_Server.SetAnchor(self);
    //return;    
}

function RefreshList()
{
    li_Server.RePingServers();
    //return;    
}

function JoinClicked()
{
    li_Server.Connect(false);
    //return;    
}

function SpectateClicked()
{
    li_Server.Connect(true);
    //return;    
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
    // End:0xAD
    if(li_Server.NumReceivedPings < li_Server.Servers.Length)
    {
        StatusText = Repl(PingingText, "%NumRec%", string(li_Server.NumReceivedPings));
        StatusText = Repl(StatusText, "%TotalNum%", string(li_Server.Servers.Length));        
    }
    else
    {
        StatusText = Repl(QueryCompleteString, "%NumServers%", string(li_Server.Servers.Length));
        StatusText = Repl(StatusText, "%NumPlayers%", string(li_Server.NumPlayers));
    }
    SetFooterCaption(StatusText);
    //return;    
}

function CancelPings()
{
    Browser.Uplink().CancelPings();
    SetFooterCaption(ReadyString);
    //return;    
}

function PingServer(int ListID, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    // End:0x51
    if(int(PingCause) == int(1))
    {
        Browser.Uplink().PingServer(ListID, PingCause, S.IP, S.QueryPort, 3, S);        
    }
    else
    {
        Browser.Uplink().PingServer(ListID, PingCause, S.IP, S.QueryPort, 0, S);
    }
    //return;    
}

function MousePressed(GUIComponent Sender, bool bRepeat)
{
    bAllowUpdates = false;
    // End:0x49
    if(GUIVertScrollBar(Sender.MenuOwner) != none)
    {
        GUIVertScrollBar(Sender.MenuOwner).GripPressed(Sender, bRepeat);
    }
    //return;    
}

function MouseReleased(GUIComponent Sender)
{
    bAllowUpdates = true;
    //return;    
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

    // End:0xF5 [Loop If]
    if(j < li_Server.Servers[i].PlayerInfo.Length)
    {
        li_Players.AddNewPlayer(li_Server.Servers[i].PlayerInfo[j]);
        j++;
        // [Loop Continue]
        goto J0x99;
    }
    li_Players.SortList();
    //return;    
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
    // End:0x8D
    if(i < 0)
    {
        return;
    }
    // End:0xB9
    if(Sender != none)
    {
        PingServer(i, 1, li_Server.Servers[i]);
    }
    j = 0;
    J0xC0:

    // End:0x11C [Loop If]
    if(j < li_Server.Servers[i].ServerInfo.Length)
    {
        li_Rules.AddNewRule(li_Server.Servers[i].ServerInfo[j]);
        j++;
        // [Loop Continue]
        goto J0xC0;
    }
    j = 0;
    J0x123:

    // End:0x17F [Loop If]
    if(j < li_Server.Servers[i].PlayerInfo.Length)
    {
        li_Players.AddNewPlayer(li_Server.Servers[i].PlayerInfo[j]);
        j++;
        // [Loop Continue]
        goto J0x123;
    }
    li_Players.SortList();
    li_Rules.SortList();
    //return;    
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x23
    if(UT2k4Browser_ServerListBox(NewComp) != none)
    {
        lb_Server = UT2k4Browser_ServerListBox(NewComp);        
    }
    else
    {
        // End:0x46
        if(UT2k4Browser_RulesListBox(NewComp) != none)
        {
            lb_Rules = UT2k4Browser_RulesListBox(NewComp);            
        }
        else
        {
            // End:0x69
            if(UT2k4Browser_PlayersListBox(NewComp) != none)
            {
                lb_Players = UT2k4Browser_PlayersListBox(NewComp);                
            }
            else
            {
                // End:0x18E
                if(GUISplitter(NewComp) != none)
                {
                    sp_Detail = GUISplitter(NewComp);
                    sp_Detail.DefaultPanels[0] = RulesListBoxClass;
                    sp_Detail.DefaultPanels[1] = PlayersListBoxClass;
                    sp_Detail.WinTop = 0.0000000;
                    sp_Detail.WinLeft = 0.0000000;
                    sp_Detail.WinWidth = 1.0000000;
                    sp_Detail.WinHeight = 1.0000000;
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
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    // End:0x26
    if(Sender == sp_Main)
    {
        sp_Main.SplitPosition = MainSplitterPosition;        
    }
    else
    {
        // End:0x49
        if(Sender == sp_Detail)
        {
            sp_Detail.SplitPosition = DetailSplitterPosition;
        }
    }
    //return;    
}

function InternalReleaseSplitter(GUIComponent Sender, float NewPos)
{
    // End:0x20
    if(Sender == sp_Main)
    {
        MainSplitterPosition = NewPos;
        SaveConfig();        
    }
    else
    {
        // End:0x3D
        if(Sender == sp_Detail)
        {
            DetailSplitterPosition = NewPos;
            SaveConfig();
        }
    }
    //return;    
}

function string InternalOnSaveINI(GUIComponent Sender)
{
    HeaderColumnSizes[0].ColumnSizes = lb_Server.HeaderColumnPerc;
    HeaderColumnSizes[1].ColumnSizes = lb_Rules.HeaderColumnPerc;
    HeaderColumnSizes[2].ColumnSizes = lb_Players.HeaderColumnPerc;
    SaveConfig();
    return "";
    //return;    
}

function bool IsRefreshAvailable(out string ButtonCaption)
{
    ButtonCaption = RefreshCaption;
    return true;
    //return;    
}

function bool IsSpectateAvailable(out string ButtonCaption)
{
    ButtonCaption = SpectateCaption;
    // End:0x2C
    if((li_Server != none) && li_Server.IsValid())
    {
        return true;
    }
    return false;
    //return;    
}

function bool IsJoinAvailable(out string ButtonCaption)
{
    ButtonCaption = JoinCaption;
    // End:0x2C
    if((li_Server != none) && li_Server.IsValid())
    {
        return true;
    }
    return false;
    //return;    
}

defaultproperties
{
    // Reference: GUISplitter'GUI2K4_Decompressed.UT2k4Browser_ServerListPageBase.HorzSplitter'
    begin object name="HorzSplitter" class=XInterface.GUISplitter
        DefaultPanels[0]="GUI2K4.UT2K4Browser_ServerListBox"
        DefaultPanels[1]="XInterface.GUISplitter"
        MaxPercentage=0.9000000
        OnReleaseSplitter=UT2k4Browser_ServerListPageBase.InternalReleaseSplitter
        OnCreateComponent=UT2k4Browser_ServerListPageBase.InternalOnCreateComponent
        IniOption="@Internal"
        RenderWeight=1.0000000
        OnLoadINI=UT2k4Browser_ServerListPageBase.InternalOnLoadINI
    end object
    sp_Main=HorzSplitter
    RulesListBoxClass="GUI2K4.UT2K4Browser_RulesListBox"
    PlayersListBoxClass="GUI2K4.UT2K4Browser_PlayersListBox"
    MainSplitterPosition=0.6656720
    DetailSplitterPosition=0.4609380
    HeaderColumnSizes[0]=(ColumnSizes=ColumnSizes[0]=0.0965620
    ColumnSizes[1]=0.4468750
    ColumnSizes[2]=0.2928120
    ColumnSizes[3]=0.1106250
    ColumnSizes[4]=0.1500000)
    HeaderColumnSizes[1]=(ColumnSizes=ColumnSizes[0]=0.5642870
    ColumnSizes[1]=0.5000000)
    HeaderColumnSizes[2]=(ColumnSizes=ColumnSizes[0]=0.3400000
    ColumnSizes[1]=0.2200000
    ColumnSizes[2]=0.2865910
    ColumnSizes[3]=0.2200000)
    bAllowUpdates=true
    PingingText="?? ?? ? ( %NumRec% / %TotalNum% )"
    PingCompleteText="?? ??! ?? %NumServers%?, ???? %NumPlayers%?"
    QueryCompleteString="?? ??! ??: %NumServers% ??"
    PanelCaption="?? ????"
    bFillHeight=false
    IniOption="@Internal"
    WinHeight=0.7929690
    OnSaveINI=UT2k4Browser_ServerListPageBase.InternalOnSaveINI
}