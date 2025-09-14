class UT2k4ServerBrowser extends UT2k4MainPage
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
var() automated moComboBox co_GameType;
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
//var delegate<OnAddFavorite> __OnAddFavorite__Delegate;

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
        FilterMaster = new (self) Class'GUI2K4_Decompressed.BrowserFilters';
        FilterMaster.InitCustomFilters();
    }
    // End:0xB1
    if(FilterInfo == none)
    {
        FilterInfo = new (none) Class'Engine.PlayInfo';
    }
    Background = MyController.DefaultPens[0];
    InitializeGameTypeCombo();
    co_GameType.MyComboBox.Edit.bCaptureMouse = true;
    CreateTabs();
    //return;    
}

function MasterServerClient Uplink()
{
    // End:0x2B
    if((MSC == none) && PlayerOwner() != none)
    {
        MSC = PlayerOwner().Spawn(Class'IpDrv.MasterServerClient');
    }
    return MSC;
    //return;    
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
    //return;    
}

event Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    // End:0x2B
    if(MSC != none)
    {
        MSC.CancelPings();
    }
    SaveConfig();
    //return;    
}

function bool ComboOnPreDraw(Canvas Canvas)
{
    co_GameType.WinTop = co_GameType.RelativeTop((t_Header.ActualTop() + t_Header.ActualHeight()) + (float(Controller.ResY) / 480.0000000));
    co_GameType.WinLeft = co_GameType.RelativeLeft((c_Tabs.ActualLeft() + c_Tabs.ActualWidth()) - (co_GameType.ActualWidth() + float(3)));
    return false;
    //return;    
}

function InitializeGameTypeCombo(optional bool ClearFirst)
{
    local int i, j;
    local export editinline UT2k4Browser_ServersList ListObj;
    local array<MapRecord> Maps;

    co_GameType.MyComboBox.MaxVisibleItems = 10;
    PopulateGameTypes();
    // End:0x4A
    if(ClearFirst)
    {
        co_GameType.MyComboBox.List.Clear();
    }
    j = -1;
    i = 0;
    J0x5C:

    // End:0xDA [Loop If]
    if(i < Records.Length)
    {
        Class'Engine.CacheManager'.static.GetMapList(Maps, Records[i].MapPrefix);
        ListObj = new (none) Class'GUI2K4_Decompressed.UT2k4Browser_ServersList';
        co_GameType.AddItem(Records[i].GameName, ListObj, Records[i].ClassName);
        i++;
        // [Loop Continue]
        goto J0x5C;
    }
    j = co_GameType.FindIndex(CurrentGameType, true, true);
    // End:0x11F
    if(j != -1)
    {
        co_GameType.SetIndex(j);
        SetFilterInfo();
    }
    //return;    
}

function BrowserOpened()
{
    // End:0x11
    if(!bPlayerVerified)
    {
        CheckPlayerOptions();
    }
    //return;    
}

function MOTDVerified(bool bMSVerified)
{
    EnableMSTabs();
    Verified = bMSVerified;
    //return;    
}

function CheckPlayerOptions()
{
    local PlayerController PC;
    local string CurrentName;

    PC = PlayerOwner();
    // End:0x3D
    if(PC.PlayerReplicationInfo != none)
    {
        CurrentName = PC.PlayerReplicationInfo.PlayerName;        
    }
    else
    {
        CurrentName = PC.GetUrlOption("Name");
    }
    // End:0xED
    if((CurrentName ~= "Player") || Class'Engine.Player'.default.ConfiguredInternetSpeed == 9636)
    {
        // End:0xEA
        if(Controller.OpenMenu(Controller.QuestionMenuClass))
        {
            GUIQuestionPage(Controller.ActivePage).SetupQuestion(InternetOptionsText, 50);
            GUIQuestionPage(Controller.ActivePage).__NewOnButtonClick__Delegate = InternetOptionsConfirm;
        }        
    }
    else
    {
        bPlayerVerified = true;
        SaveConfig();
    }
    //return;    
}

function bool InternetOptionsConfirm(byte ButtonMask)
{
    local export editinline GUIQuestionPage pg;

    // End:0x12
    if(bool(int(ButtonMask) & 32))
    {
        return true;
    }
    // End:0x2F
    if(bool(int(ButtonMask) & 2))
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
    // End:0x9B
    if(bool(int(ButtonMask) & 16))
    {
        // End:0x99
        if(Controller.ReplaceMenu(InternetSettingsPage))
        {
            Controller.ActivePage.__OnClose__Delegate = InternetOptionsClosed;
        }
        return true;
    }
    return false;
    //return;    
}

function InternetOptionsClosed(bool bCancelled)
{
    bPlayerVerified = true;
    SaveConfig();
    //return;    
}

function CreateTabs()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x7E [Loop If]
    if(((i < PanelCaption.Length) && i < PanelClass.Length) && i < PanelHint.Length)
    {
        // End:0x74
        if(PanelClass[i] != "")
        {
            AddTab(PanelCaption[i], PanelClass[i], PanelHint[i]);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    DisableMSTabs();
    RefreshFooter(UT2K4Browser_Page(c_Tabs.ActiveTab.MyPanel), "false");
    //return;    
}

function EnableMSTabs()
{
    local export editinline UT2k4Browser_ServerListPageBuddy BuddyPanel;
    local int i;

    i = c_Tabs.TabIndex(PanelCaption[4]);
    // End:0x6E
    if(i != -1)
    {
        EnableComponent(c_Tabs.TabStack[i]);
        BuddyPanel = UT2k4Browser_ServerListPageBuddy(c_Tabs.TabStack[i].MyPanel);
    }
    i = c_Tabs.TabIndex(PanelCaption[5]);
    // End:0xB4
    if(i != -1)
    {
        EnableComponent(c_Tabs.TabStack[i]);
    }
    // End:0xC1
    if(BuddyPanel == none)
    {
        return;
    }
    i = 0;
    J0xC8:

    // End:0x17E [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0xC8;
    }
    //return;    
}

function DisableMSTabs()
{
    local int i;

    Verified = false;
    i = c_Tabs.TabIndex(PanelCaption[4]);
    // End:0x4E
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
    J0x9B:

    // End:0x14D [Loop If]
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
        i++;
        // [Loop Continue]
        goto J0x9B;
    }
    //return;    
}

function UT2K4Browser_Page AddTab(string TabCaption, string PanelClassName, string TabHint)
{
    local export editinline UT2K4Browser_Page Tab;

    // End:0x99
    if(((TabCaption != "") && PanelClassName != "") && TabHint != "")
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
    //return;    
}

delegate OnAddFavorite(ServerResponseLine Server)
{
    //return;    
}

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
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    local bool bShowGameType;

    // End:0x62
    if(GUITabButton(Sender) != none)
    {
        bShowGameType = (tp_Active != none) && tp_Active.ShouldDisplayGameType();
        // End:0x62
        if(co_GameType.bVisible != bShowGameType)
        {
            co_GameType.SetVisibility(bShowGameType);
        }
    }
    //return;    
}

function StandardOptionChanged(GUIComponent Sender)
{
    SetStandardServersOption(moCheckBox(Sender).IsChecked());
    //return;    
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
    //return;    
}

function RefreshFooter(optional UT2K4Browser_Page NewActive, optional string bPerButtonSizes)
{
    // End:0x3F
    if(NewActive != none)
    {
        tp_Active = NewActive;
        // End:0x3F
        if(UT2k4Browser_Footer(t_Footer) != none)
        {
            UT2k4Browser_Footer(t_Footer).UpdateActiveButtons(tp_Active);
        }
    }
    // End:0x5E
    if(t_Footer != none)
    {
        t_Footer.SetupButtons(bPerButtonSizes);
    }
    //return;    
}

function InternalOnLoadINI(GUIComponent Sender, string S)
{
    local int i;

    // End:0x9B
    if(Sender == co_GameType)
    {
        // End:0x9B
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
    //return;    
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
    Class'Engine.CacheManager'.static.GetGameTypeList(Games);
    i = 0;
    J0x31:

    // End:0x111 [Loop If]
    if(i < Games.Length)
    {
        j = 0;
        J0x48:

        // End:0xE4 [Loop If]
        if(j < Records.Length)
        {
            // End:0xDA
            if((Games[i].GameName <= Records[j].GameName) || int(Games[i].GameTypeGroup) <= int(Records[j].GameTypeGroup))
            {
                // End:0xD7
                if(int(Games[i].GameTypeGroup) <= int(Records[j].GameTypeGroup))
                {
                    // [Explicit Continue]
                    goto J0xDA;
                    // [Explicit Continue]
                    goto J0xDA;
                }
                // [Explicit Break]
                goto J0xE4;
            }
            J0xDA:

            j++;
            // [Loop Continue]
            goto J0x48;
        }
        J0xE4:

        Records.Insert(j, 1);
        Records[j] = Games[i];
        i++;
        // [Loop Continue]
        goto J0x31;
    }
    //return;    
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
    // End:0x5D
    if(i >= 0)
    {
        Desc = Left(Desc, i);
    }
    return Desc;
    //return;    
}

function SetFilterInfo(optional string NewGameType)
{
    local Class<GameInfo> GI;
    local Class<AccessControl> ac;
    local Class<Mutator> mut;

    return;
    assert(FilterInfo != none);
    FilterInfo.Clear();
    // End:0x30
    if(NewGameType == "")
    {
        NewGameType = CurrentGameType;
    }
    GI = Class<GameInfo>(DynamicLoadObject(NewGameType, Class'Core.Class'));
    // End:0x114
    if(GI != none)
    {
        GI.static.FillPlayInfo(FilterInfo);
        FilterInfo.PopClass();
        ac = Class<AccessControl>(DynamicLoadObject(GI.default.AccessControlClass, Class'Core.Class'));
        // End:0xC5
        if(ac != none)
        {
            ac.static.FillPlayInfo(FilterInfo);
            FilterInfo.PopClass();
        }
        mut = Class<Mutator>(DynamicLoadObject(GI.default.MutatorClass, Class'Core.Class'));
        // End:0x114
        if(mut != none)
        {
            mut.static.FillPlayInfo(FilterInfo);
            FilterInfo.PopClass();
        }
    }
    //return;    
}

function JoinClicked()
{
    // End:0x1A
    if(tp_Active != none)
    {
        tp_Active.JoinClicked();
    }
    //return;    
}

function SpectateClicked()
{
    // End:0x1A
    if(tp_Active != none)
    {
        tp_Active.SpectateClicked();
    }
    //return;    
}

function RefreshClicked()
{
    // End:0x1A
    if(tp_Active != none)
    {
        tp_Active.RefreshClicked();
    }
    //return;    
}

function FilterClicked()
{
    // End:0x1A
    if(tp_Active != none)
    {
        tp_Active.FilterClicked();
    }
    //return;    
}

function Refresh()
{
    local int i;
    local string Dummy;

    // End:0x0D
    if(c_Tabs == none)
    {
        return;
    }
    i = 0;
    J0x14:

    // End:0xE6 [Loop If]
    if(i < c_Tabs.TabStack.Length)
    {
        // End:0xDC
        if(((int(c_Tabs.TabStack[i].MenuState) != int(4)) && UT2K4Browser_Page(c_Tabs.TabStack[i].MyPanel) != none) && UT2K4Browser_Page(c_Tabs.TabStack[i].MyPanel).IsFilterAvailable(Dummy))
        {
            c_Tabs.TabStack[i].MyPanel.Refresh();
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

static function int CalculateMaxConnections()
{
    local int i;

    // End:0x70
    if(Class'XInterface.GUIController'.default.MaxSimultaneousPings < 1)
    {
        i = Class'Engine.Player'.default.ConfiguredInternetSpeed;
        // End:0x3A
        if(i <= 2600)
        {
            return 10;
        }
        // End:0x4C
        if(i <= 5000)
        {
            return 15;
        }
        // End:0x5E
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
    return Min(Class'XInterface.GUIController'.default.MaxSimultaneousPings, 35);
    //return;    
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
    //return;    
}

function ConnectionOpened(optional int Num)
{
    // End:0x12
    if(Num <= 0)
    {
        Num = 1;
    }
    ThreadCount += Num;
    //return;    
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
    //return;    
}

function ClearServerCache()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x4A [Loop If]
    if(i < ServerCache.Length)
    {
        // End:0x40
        if(ServerCache[i].GameType ~= CurrentGameType)
        {
            ServerCache.Remove(i, 1);            
        }
        else
        {
            i++;
        }
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
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
    else
    {
        t = S;
    }
    S = "";
    i = 0;
    J0x3A:

    // End:0xAE [Loop If]
    if(i < Len(t))
    {
        // End:0x74
        if(Asc(Mid(t, i, 1)) == 34)
        {
            S = S $ "`";
            // [Explicit Continue]
            goto J0xA4;
        }
        // End:0xA4
        if(Asc(Mid(t, i, 1)) >= 32)
        {
            S = S $ Mid(t, i, 1);
        }
        J0xA4:

        i++;
        // [Loop Continue]
        goto J0x3A;
    }
    return S;
    //return;    
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
    //return;    
}

function GetFromServerCache(UT2k4Browser_ServersList List)
{
    local int i;
    local ServerResponseLine SRL;

    i = 0;
    J0x07:

    // End:0x99 [Loop If]
    if(i < ServerCache.Length)
    {
        // End:0x8F
        if(ServerCache[i].GameType ~= CurrentGameType)
        {
            SRL = ServerCache[i].SRL;
            SRL.IP = ServerCache[i].SRL.IP;
            SRL.MapName = "Unknown";
            List.MyOnReceivedServer(SRL);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

defaultproperties
{
    bStandardServersOnly=true
    CurrentGameType="Onslaught.ONSOnslaughtGame"
    InternetSettingsPage="GUI2K4.UT2K4InternetSettingsPage"
    // Reference: moComboBox'GUI2K4_Decompressed.UT2k4ServerBrowser.GameTypeCombo'
    begin object name="GameTypeCombo" class=XInterface.moComboBox
        bReadOnly=true
        CaptionWidth=0.1000000
        Caption="?? ??"
        OnCreateComponent=GameTypeCombo.InternalOnCreateComponent
        IniOption="@INTERNAL"
        Hint="??? ?? ??? ?????"
        WinTop=0.0501600
        WinLeft=0.6388780
        WinWidth=0.3586800
        WinHeight=0.0350000
        RenderWeight=1.0000000
        TabOrder=0
        OnPreDraw=UT2k4ServerBrowser.ComboOnPreDraw
        OnLoadINI=UT2k4ServerBrowser.InternalOnLoadINI
    end object
    co_GameType=GameTypeCombo
    InternetOptionsText="??? ??? ???? ???? ?????. ?????? ??? ???? ?? ??? ???? ??? ???? ???? ??? ??? ??? ?? ?????. ?? ? ???? ???????"
    OfficialSubnets[0]="69.25.22."
    OfficialSubnets[1]="64.74.139."
    // Reference: GUIHeader'GUI2K4_Decompressed.UT2k4ServerBrowser.ServerBrowserHeader'
    begin object name="ServerBrowserHeader" class=XInterface.GUIHeader
        bUseTextHeight=true
        Caption="?? ????"
    end object
    t_Header=ServerBrowserHeader
    // Reference: UT2k4Browser_Footer'GUI2K4_Decompressed.UT2k4ServerBrowser.FooterPanel'
    begin object name="FooterPanel" class=GUI2K4_Decompressed.UT2k4Browser_Footer
        WinTop=0.9179430
        TabOrder=4
        OnPreDraw=FooterPanel.InternalOnPreDraw
    end object
    t_Footer=FooterPanel
    PanelClass[0]="GUI2K4.UT2K4Browser_MOTD"
    PanelClass[1]="GUI2K4.UT2K4Browser_IRC"
    PanelClass[2]="GUI2K4.UT2K4Browser_ServerListPageFavorites"
    PanelClass[3]="GUI2K4.UT2K4Browser_ServerListPageLAN"
    PanelClass[4]="GUI2K4.UT2K4Browser_ServerListPageBuddy"
    PanelClass[5]="GUI2K4.UT2K4Browser_ServerListPageInternet"
    PanelCaption[0]="??"
    PanelCaption[1]="??"
    PanelCaption[2]="????"
    PanelCaption[3]="?"
    PanelCaption[4]="??"
    PanelCaption[5]="???"
    PanelHint[0]="Epic?? ?? ??? ????"
    PanelHint[1]="IRC client? ?? ??"
    PanelHint[2]="????? ??? ???? ??????"
    PanelHint[3]="?? ???? ?? UT2004 / UT2003 ?? ??"
    PanelHint[4]="?? ??? ?? ???? ????? ??? ?? ??? ????"
    PanelHint[5]="? ??? ?? ???? ??? UT2004 / UT2003 ??? ?????"
    bCheckResolution=true
    OnOpen=UT2k4ServerBrowser.BrowserOpened
    bDrawFocusedLast=false
}