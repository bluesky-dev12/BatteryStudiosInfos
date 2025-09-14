/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4ServerBrowser.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:18
 *	Functions:38
 *
 *******************************************************************************/
class UT2k4ServerBrowser extends UT2k4MainPage
    dependson(UT2k4MainPage)
    dependson(UT2K4Browser_Page)
    dependson(UT2k4Browser_Footer)
    dependson(ButtonFooter)
    dependson(UT2k4Browser_ServerListPageBase)
    dependson(UT2k4Browser_PlayersListBox)
    dependson(BrowserFilters)
    config(User)
    editinlinenew
    instanced;

struct eServerCacheInfo
{
    var string GameType;
    var int SubnetIndex;
    var ServerResponseLine SRL;
};

var() globalconfig bool bStandardServersOnly;
var() config string CurrentGameType;
var config bool bPlayerVerified;
var string InternetSettingsPage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moComboBox co_GameType;
var private MasterServerClient MSC;
var BrowserFilters FilterMaster;
var PlayInfo FilterInfo;
var export editinline UT2k4Browser_Footer f_Browser;
var transient bool Verified;
var int ThreadCount;
var array<GameRecord> Records;
var export editinline UT2K4Browser_Page tp_Active;
var localized string InternetOptionsText;
var bool bHideNetworkMessage;
var string OfficialSubnets[2];
var() globalconfig array<eServerCacheInfo> ServerCache;
var delegate<OnAddFavorite> __OnAddFavorite__Delegate;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    f_Browser = UT2k4Browser_Footer(t_Footer);
    f_Browser.p_Anchor = self;
    f_Browser.ch_Standard.__OnChange__Delegate = StandardOptionChanged;
    f_Browser.ch_Standard.SetComponentValue(string(bStandardServersOnly), true);
    // End:0x97
    if(FilterMaster == none)
    {
        FilterMaster = new (self) class'BrowserFilters';
        FilterMaster.InitCustomFilters();
    }
    // End:0xb1
    if(FilterInfo == none)
    {
        FilterInfo = new (none) class'PlayInfo';
    }
    Background = MyController.DefaultPens[0];
    InitializeGameTypeCombo();
    co_GameType.MyComboBox.Edit.bCaptureMouse = true;
    CreateTabs();
}

function MasterServerClient Uplink()
{
    // End:0x2b
    if(MSC == none && PlayerOwner() != none)
    {
        MSC = PlayerOwner().Spawn(class'MasterServerClient');
    }
    return MSC;
}

event Opened(GUIComponent Sender)
{
    super(GUIMultiComponent).Opened(Sender);
    bHideNetworkMessage = false;
    // End:0x37
    if(tp_Active != none)
    {
        UT2k4Browser_Footer(t_Footer).UpdateActiveButtons(tp_Active);
    }
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    // End:0x2b
    if(MSC != none)
    {
        MSC.CancelPings();
    }
    SaveConfig();
}

function bool ComboOnPreDraw(Canvas Canvas)
{
    co_GameType.WinTop = co_GameType.RelativeTop(t_Header.ActualTop() + t_Header.ActualHeight() + float(Controller.ResY) / 480.0);
    co_GameType.WinLeft = co_GameType.RelativeLeft(c_Tabs.ActualLeft() + c_Tabs.ActualWidth() - co_GameType.ActualWidth() + float(3));
    return false;
}

function InitializeGameTypeCombo(optional bool ClearFirst)
{
    local int i, j;
    local export editinline UT2k4Browser_ServersList ListObj;
    local array<MapRecord> Maps;

    co_GameType.MyComboBox.MaxVisibleItems = 10;
    PopulateGameTypes();
    // End:0x4a
    if(ClearFirst)
    {
        co_GameType.MyComboBox.List.Clear();
    }
    j = -1;
    i = 0;
    J0x5c:
    // End:0xda [While If]
    if(i < Records.Length)
    {
        class'CacheManager'.static.GetMapList(Maps, Records[i].MapPrefix);
        ListObj = new (none) class'UT2k4Browser_ServersList';
        co_GameType.AddItem(Records[i].GameName, ListObj, Records[i].ClassName);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5c;
    }
    j = co_GameType.FindIndex(CurrentGameType, true, true);
    // End:0x11f
    if(j != -1)
    {
        co_GameType.SetIndex(j);
        SetFilterInfo();
    }
}

function BrowserOpened()
{
    // End:0x11
    if(!bPlayerVerified)
    {
        CheckPlayerOptions();
    }
}

function MOTDVerified(bool bMSVerified)
{
    EnableMSTabs();
    Verified = bMSVerified;
}

function CheckPlayerOptions()
{
    local PlayerController PC;
    local string CurrentName;

    PC = PlayerOwner();
    // End:0x3d
    if(PC.PlayerReplicationInfo != none)
    {
        CurrentName = PC.PlayerReplicationInfo.PlayerName;
    }
    // End:0x58
    else
    {
        CurrentName = PC.GetUrlOption("Name");
    }
    // End:0xed
    if(CurrentName ~= "Player" || class'Player'.default.ConfiguredInternetSpeed == 9636)
    {
        // End:0xea
        if(Controller.OpenMenu(Controller.QuestionMenuClass))
        {
            GUIQuestionPage(Controller.ActivePage).SetupQuestion(InternetOptionsText, 50);
            GUIQuestionPage(Controller.ActivePage).__NewOnButtonClick__Delegate = InternetOptionsConfirm;
        }
    }
    // End:0xf8
    else
    {
        bPlayerVerified = true;
        SaveConfig();
    }
}

function bool InternetOptionsConfirm(byte ButtonMask)
{
    local export editinline GUIQuestionPage pg;

    // End:0x12
    if(bool(ButtonMask & 32))
    {
        return true;
    }
    // End:0x2f
    if(bool(ButtonMask & 2))
    {
        bPlayerVerified = true;
        SaveConfig();
        return true;
    }
    pg = GUIQuestionPage(Controller.ActivePage);
    // End:0x55
    if(pg == none)
    {
        return true;
    }
    // End:0x9b
    if(bool(ButtonMask & 16))
    {
        // End:0x99
        if(Controller.ReplaceMenu(InternetSettingsPage))
        {
            Controller.ActivePage.__OnClose__Delegate = InternetOptionsClosed;
        }
        return true;
    }
    return false;
}

function InternetOptionsClosed(bool bCancelled)
{
    bPlayerVerified = true;
    SaveConfig();
}

function CreateTabs()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x7e [While If]
    if(i < PanelCaption.Length && i < PanelClass.Length && i < PanelHint.Length)
    {
        // End:0x74
        if(PanelClass[i] != "")
        {
            AddTab(PanelCaption[i], PanelClass[i], PanelHint[i]);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    DisableMSTabs();
    RefreshFooter(UT2K4Browser_Page(c_Tabs.ActiveTab.MyPanel), "false");
}

function EnableMSTabs()
{
    local export editinline UT2k4Browser_ServerListPageBuddy BuddyPanel;
    local int i;

    i = c_Tabs.TabIndex(PanelCaption[4]);
    // End:0x6e
    if(i != -1)
    {
        EnableComponent(c_Tabs.TabStack[i]);
        BuddyPanel = UT2k4Browser_ServerListPageBuddy(c_Tabs.TabStack[i].MyPanel);
    }
    i = c_Tabs.TabIndex(PanelCaption[5]);
    // End:0xb4
    if(i != -1)
    {
        EnableComponent(c_Tabs.TabStack[i]);
    }
    // End:0xc1
    if(BuddyPanel == none)
    {
        return;
    }
    i = 0;
    J0xc8:
    // End:0x17e [While If]
    if(i < c_Tabs.TabStack.Length)
    {
        // End:0x174
        if(UT2k4Browser_ServerListPageBase(c_Tabs.TabStack[i].MyPanel) != none)
        {
            // End:0x174
            if(UT2k4Browser_ServerListPageBase(c_Tabs.TabStack[i].MyPanel).lb_Players != none)
            {
                UT2k4Browser_ServerListPageBase(c_Tabs.TabStack[i].MyPanel).lb_Players.tp_Buddy = BuddyPanel;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xc8;
    }
}

function DisableMSTabs()
{
    local int i;

    Verified = false;
    i = c_Tabs.TabIndex(PanelCaption[4]);
    // End:0x4e
    if(i != -1)
    {
        DisableComponent(c_Tabs.TabStack[i]);
    }
    i = c_Tabs.TabIndex(PanelCaption[5]);
    // End:0x94
    if(i != -1)
    {
        DisableComponent(c_Tabs.TabStack[i]);
    }
    i = 0;
    J0x9b:
    // End:0x14d [While If]
    if(i < c_Tabs.TabStack.Length)
    {
        // End:0x143
        if(UT2k4Browser_ServerListPageBase(c_Tabs.TabStack[i].MyPanel) != none)
        {
            // End:0x143
            if(UT2k4Browser_ServerListPageBase(c_Tabs.TabStack[i].MyPanel).lb_Players != none)
            {
                UT2k4Browser_ServerListPageBase(c_Tabs.TabStack[i].MyPanel).lb_Players.tp_Buddy = none;
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x9b;
    }
}

function UT2K4Browser_Page AddTab(string TabCaption, string PanelClassName, string TabHint)
{
    local export editinline UT2K4Browser_Page Tab;

    // End:0x99
    if(TabCaption != "" && PanelClassName != "" && TabHint != "")
    {
        Tab = UT2K4Browser_Page(c_Tabs.AddTab(TabCaption, PanelClassName,, TabHint));
        // End:0x99
        if(Tab != none)
        {
            Tab.__RefreshFooter__Delegate = RefreshFooter;
            Tab.__OnOpenConnection__Delegate = ConnectionOpened;
            Tab.__OnCloseConnection__Delegate = ConnectionClosed;
        }
    }
    return Tab;
}

delegate OnAddFavorite(ServerResponseLine Server);
event bool NotifyLevelChange()
{
    // End:0x26
    if(MSC != none)
    {
        MSC.Stop();
        MSC.Destroy();
    }
    MSC = none;
    LevelChanged();
    return false;
}

function InternalOnChange(GUIComponent Sender)
{
    local bool bShowGameType;

    // End:0x62
    if(GUITabButton(Sender) != none)
    {
        bShowGameType = tp_Active != none && tp_Active.ShouldDisplayGameType();
        // End:0x62
        if(co_GameType.bVisible != bShowGameType)
        {
            co_GameType.SetVisibility(bShowGameType);
        }
    }
}

function StandardOptionChanged(GUIComponent Sender)
{
    SetStandardServersOption(moCheckBox(Sender).IsChecked());
}

function SetStandardServersOption(bool bOnlyStandard)
{
    // End:0x27
    if(bOnlyStandard != bStandardServersOnly)
    {
        bStandardServersOnly = bOnlyStandard;
        SaveConfig();
        Refresh();
    }
}

function RefreshFooter(optional UT2K4Browser_Page NewActive, optional string bPerButtonSizes)
{
    // End:0x3f
    if(NewActive != none)
    {
        tp_Active = NewActive;
        // End:0x3f
        if(UT2k4Browser_Footer(t_Footer) != none)
        {
            UT2k4Browser_Footer(t_Footer).UpdateActiveButtons(tp_Active);
        }
    }
    // End:0x5e
    if(t_Footer != none)
    {
        t_Footer.SetupButtons(bPerButtonSizes);
    }
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;

    // End:0x9b
    if(Sender == co_GameType)
    {
        // End:0x9b
        if(CurrentGameType == "")
        {
            CurrentGameType = S;
            SaveConfig();
            i = co_GameType.FindExtra(CurrentGameType);
            // End:0x95
            if(i != -1)
            {
                Log("#### - Load INI setting Index to: " @ string(i));
                co_GameType.SetIndex(i);
            }
            SetFilterInfo();
        }
    }
}

function PopulateGameTypes()
{
    local array<GameRecord> Games;
    local int i, j;

    // End:0x19
    if(Records.Length > 0)
    {
        Records.Remove(0, Records.Length);
    }
    class'CacheManager'.static.GetGameTypeList(Games);
    i = 0;
    J0x31:
    // End:0x111 [While If]
    if(i < Games.Length)
    {
        j = 0;
        J0x48:
        // End:0xe4 [While If]
        if(j < Records.Length)
        {
            // End:0xda
            if(Games[i].GameName <= Records[j].GameName || Games[i].GameTypeGroup <= Records[j].GameTypeGroup)
            {
                // End:0xd7
                if(Games[i].GameTypeGroup <= Records[j].GameTypeGroup)
                {
                    // This is an implied JumpToken;
                    goto J0xda;
                }
                // End:0xda
                else
                {
                    // This is an implied JumpToken;
                    goto J0xe4;
                }
            }
            ++ j;
            // This is an implied JumpToken; Continue!
            goto J0x48;
        }
        J0xe4:
        Records.Insert(j, 1);
        Records[j] = Games[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x31;
    }
}

function string GetDesc(string Desc)
{
    local int i;

    i = InStr(Desc, "|");
    // End:0x30
    if(i >= 0)
    {
        Desc = Mid(Desc, i + 1);
    }
    i = InStr(Desc, "|");
    // End:0x5d
    if(i >= 0)
    {
        Desc = Left(Desc, i);
    }
    return Desc;
}

function SetFilterInfo(optional string NewGameType)
{
    local class<GameInfo> GI;
    local class<AccessControl> ac;
    local class<Mutator> mut;

    return;
    assert(FilterInfo != none);
    FilterInfo.Clear();
    // End:0x30
    if(NewGameType == "")
    {
        NewGameType = CurrentGameType;
    }
    GI = class<GameInfo>(DynamicLoadObject(NewGameType, class'Class'));
    // End:0x114
    if(GI != none)
    {
        GI.static.FillPlayInfo(FilterInfo);
        FilterInfo.PopClass();
        ac = class<AccessControl>(DynamicLoadObject(GI.default.AccessControlClass, class'Class'));
        // End:0xc5
        if(ac != none)
        {
            ac.static.FillPlayInfo(FilterInfo);
            FilterInfo.PopClass();
        }
        mut = class<Mutator>(DynamicLoadObject(GI.default.MutatorClass, class'Class'));
        // End:0x114
        if(mut != none)
        {
            mut.static.FillPlayInfo(FilterInfo);
            FilterInfo.PopClass();
        }
    }
}

function JoinClicked()
{
    // End:0x1a
    if(tp_Active != none)
    {
        tp_Active.JoinClicked();
    }
}

function SpectateClicked()
{
    // End:0x1a
    if(tp_Active != none)
    {
        tp_Active.SpectateClicked();
    }
}

function RefreshClicked()
{
    // End:0x1a
    if(tp_Active != none)
    {
        tp_Active.RefreshClicked();
    }
}

function FilterClicked()
{
    // End:0x1a
    if(tp_Active != none)
    {
        tp_Active.FilterClicked();
    }
}

function Refresh()
{
    local int i;
    local string Dummy;

    // End:0x0d
    if(c_Tabs == none)
    {
        return;
    }
    i = 0;
    J0x14:
    // End:0xe6 [While If]
    if(i < c_Tabs.TabStack.Length)
    {
        // End:0xdc
        if(c_Tabs.TabStack[i].MenuState != 4 && UT2K4Browser_Page(c_Tabs.TabStack[i].MyPanel) != none && UT2K4Browser_Page(c_Tabs.TabStack[i].MyPanel).IsFilterAvailable(Dummy))
        {
            c_Tabs.TabStack[i].MyPanel.Refresh();
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

static function int CalculateMaxConnections()
{
    local int i;

    // End:0x70
    if(class'GUIController'.default.MaxSimultaneousPings < 1)
    {
        i = class'Player'.default.ConfiguredInternetSpeed;
        // End:0x3a
        if(i <= 2600)
        {
            return 10;
        }
        // End:0x4c
        if(i <= 5000)
        {
            return 15;
        }
        // End:0x5e
        if(i <= 10000)
        {
            return 20;
        }
        // End:0x70
        if(i <= 20000)
        {
            return 35;
        }
    }
    return Min(class'GUIController'.default.MaxSimultaneousPings, 35);
}

function int GetMaxConnections(optional bool bCurrentlyAvailable)
{
    local int Max;

    Max = CalculateMaxConnections();
    // End:0x22
    if(bCurrentlyAvailable)
    {
        return Max - ThreadCount;
    }
    return Max;
}

function ConnectionOpened(optional int Num)
{
    // End:0x12
    if(Num <= 0)
    {
        Num = 1;
    }
    ThreadCount += Num;
}

function ConnectionClosed(optional int Num)
{
    // End:0x12
    if(Num <= 0)
    {
        Num = 1;
    }
    ThreadCount -= Num;
    // End:0x30
    if(ThreadCount < 0)
    {
        ThreadCount = 0;
    }
}

function ClearServerCache()
{
    local int i;

    i = 0;
    J0x07:
    // End:0x4a [While If]
    if(i < ServerCache.Length)
    {
        // End:0x40
        if(ServerCache[i].GameType ~= CurrentGameType)
        {
            ServerCache.Remove(i, 1);
        }
        // End:0x47
        else
        {
            ++ i;
        }
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function string FixString(string S)
{
    local string t;
    local int i;

    // End:0x20
    if(Len(S) > 200)
    {
        t = Left(S, 200);
    }
    // End:0x2b
    else
    {
        t = S;
    }
    S = "";
    i = 0;
    J0x3a:
    // End:0xae [While If]
    if(i < Len(t))
    {
        // End:0x74
        if(Asc(Mid(t, i, 1)) == 34)
        {
            S = S $ "`";
        }
        // End:0xa4
        else
        {
            // End:0xa4
            if(Asc(Mid(t, i, 1)) >= 32)
            {
                S = S $ Mid(t, i, 1);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x3a;
    }
    return S;
}

function AddToServerCache(ServerResponseLine Entry)
{
    ServerCache.Insert(0, 1);
    ServerCache[0].GameType = CurrentGameType;
    ServerCache[0].SRL.IP = Entry.IP;
    ServerCache[0].SRL.ServerName = FixString(Entry.ServerName);
    ServerCache[0].SRL.QueryPort = Entry.QueryPort;
    ServerCache[0].SRL.GameType = FixString(Entry.GameType);
    ServerCache[0].SRL.Flags = Entry.Flags;
}

function GetFromServerCache(UT2k4Browser_ServersList List)
{
    local int i;
    local ServerResponseLine SRL;

    i = 0;
    J0x07:
    // End:0x99 [While If]
    if(i < ServerCache.Length)
    {
        // End:0x8f
        if(ServerCache[i].GameType ~= CurrentGameType)
        {
            SRL = ServerCache[i].SRL;
            SRL.IP = ServerCache[i].SRL.IP;
            SRL.MapName = "Unknown";
            List.MyOnReceivedServer(SRL);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

defaultproperties
{
    bStandardServersOnly=true
    CurrentGameType="Onslaught.ONSOnslaughtGame"
    InternetSettingsPage="GUI2K4.UT2K4InternetSettingsPage"
    begin object name=GameTypeCombo class=moComboBox
        bReadOnly=true
        CaptionWidth=0.10
        Caption="?? ??"
        OnCreateComponent=InternalOnCreateComponent
        IniOption="@INTERNAL"
        Hint="??? ?? ??? ?????"
        WinTop=0.050160
        WinLeft=0.6388780
        WinWidth=0.358680
        WinHeight=0.0350
        RenderWeight=1.0
        TabOrder=0
        OnPreDraw=ComboOnPreDraw
        OnLoadINI=InternalOnLoadINI
    object end
    // Reference: moComboBox'UT2k4ServerBrowser.GameTypeCombo'
    co_GameType=GameTypeCombo
    InternetOptionsText="??? ??? ???? ???? ?????. ?????? ??? ???? ?? ??? ???? ??? ???? ???? ??? ??? ??? ?? ?????. ?? ? ???? ???????"
    OfficialSubnets[0]="69.25.22."
    OfficialSubnets[1]="64.74.139."
    begin object name=ServerBrowserHeader class=GUIHeader
        bUseTextHeight=true
        Caption="?? ????"
    object end
    // Reference: GUIHeader'UT2k4ServerBrowser.ServerBrowserHeader'
    t_Header=ServerBrowserHeader
    begin object name=FooterPanel class=UT2k4Browser_Footer
        WinTop=0.9179430
        TabOrder=4
        OnPreDraw=InternalOnPreDraw
    object end
    // Reference: UT2k4Browser_Footer'UT2k4ServerBrowser.FooterPanel'
    t_Footer=FooterPanel
    PanelClass=// Object reference not set to an instance of an object.
    
    PanelCaption=// Object reference not set to an instance of an object.
    
    PanelHint=// Object reference not set to an instance of an object.
    
    bCheckResolution=true
    OnOpen=BrowserOpened
    bDrawFocusedLast=true
}