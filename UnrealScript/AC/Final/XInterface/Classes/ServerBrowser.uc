class ServerBrowser extends UT2K3GUIPage
    config(User)
    editinlinenew
    instanced;

enum EViewMutatorMode
{
    VMM_AnyMutators,                // 0
    VMM_NoMutators,                 // 1
    VMM_ThisMutator,                // 2
    VMM_NotThisMutator              // 3
};

enum EStatsServerView
{
    SSV_Any,                        // 0
    SSV_OnlyStatsEnabled,           // 1
    SSV_NoStatsEnabled              // 2
};

enum EWeaponStayServerView
{
    WSSV_Any,                       // 0
    WSSV_OnlyWeaponStay,            // 1
    WSSV_NoWeaponStay               // 2
};

enum ETranslocServerView
{
    TSV_Any,                        // 0
    TSV_OnlyTransloc,               // 1
    TSV_NoTransloc                  // 2
};

var export editinline Browser_Page MOTDPage;
var export editinline Browser_Page DMServerListPage;
var export editinline Browser_Page TDMServerListPage;
var export editinline Browser_Page CTFServerListPage;
var export editinline Browser_Page BRServerListPage;
var export editinline Browser_Page DomServerListPage;
var export editinline Browser_Page CustomServerListPage;
var export editinline Browser_Page FavoritesPage;
var export editinline Browser_Page LANPage;
var export editinline Browser_Page PrefsPage;
var export editinline Browser_Page BuddiesPage;
var export editinline Browser_Page IRCPage;
var bool bCreatedQueryTabs;
var bool bCreatedStandardTabs;
var localized string MutantTypeName;
var localized string InvasionTypeName;
var localized string LMSTypeName;
var localized string MutantType;
var localized string InvasionType;
var localized string LMSType;
var() config bool bOnlyShowStandard;
var() config bool bOnlyShowNonPassword;
var() config bool bDontShowFull;
var() config bool bDontShowEmpty;
var() config bool bDontShowWithBots;
var() config string DesiredMutator;
var() config string DesiredMutator2;
var() config string CustomQuery;
var() config int MinGamespeed;
var() config int MaxGamespeed;
var() config ServerBrowser.EViewMutatorMode ViewMutatorMode;
var() config ServerBrowser.EViewMutatorMode ViewMutator2Mode;
var() config ServerBrowser.EStatsServerView StatsServerView;
var() config ServerBrowser.EWeaponStayServerView WeaponStayServerView;
var() config ServerBrowser.ETranslocServerView TranslocServerView;
//var delegate<OnAddFavorite> __OnAddFavorite__Delegate;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    GUITitleBar(Controls[0]).DockedTabs = GUITabControl(Controls[1]);
    __OnClose__Delegate = InternalOnClose;
    // End:0x87
    if(!bCreatedStandardTabs)
    {
        AddBrowserPage(MOTDPage);
        AddBrowserPage(PrefsPage);
        AddBrowserPage(IRCPage);
        AddBrowserPage(LANPage);
        AddBrowserPage(FavoritesPage);
        bCreatedStandardTabs = true;
    }
    //return;    
}

function bool HaveBonusPack()
{
    local Object test;

    test = DynamicLoadObject("BonusPack.xMutantGame", Class'Core.Class');
    // End:0x35
    if(test == none)
    {
        return false;
    }
    test = DynamicLoadObject("SkaarjPack.Invasion", Class'Core.Class');
    // End:0x68
    if(test == none)
    {
        return false;
    }
    return true;
    //return;    
}

function bool HaveCustomGameTypes()
{
    local string Entry, Desc;
    local int Index;

    Index = 0;
    PlayerOwner().GetNextIntDesc("GameInfo", Index, Entry, Desc);
    J0x2D:

    // End:0x9B [Loop If]
    if(Entry != "")
    {
        Desc = (Entry $ "|") $ Desc;
        // End:0x6B
        if(!Class'XInterface_Decompressed.Browser_ServerListPageMSCustom'.static.IsStandardGameType(Desc))
        {
            return true;
        }
        Index++;
        PlayerOwner().GetNextIntDesc("GameInfo", Index, Entry, Desc);
        // [Loop Continue]
        goto J0x2D;
    }
    return false;
    //return;    
}

function MOTDVerified(bool bMSVerified)
{
    local export editinline Browser_ServerListPageMS NewPage;

    // End:0x0B
    if(bCreatedQueryTabs)
    {
        return;
    }
    bCreatedQueryTabs = true;
    AddBrowserPage(BuddiesPage);
    AddBrowserPage(DMServerListPage);
    AddBrowserPage(TDMServerListPage);
    // End:0x5A
    if(!PlayerOwner().Level.IsDemoBuild())
    {
        AddBrowserPage(DomServerListPage);
    }
    AddBrowserPage(CTFServerListPage);
    AddBrowserPage(BRServerListPage);
    // End:0x13F
    if(HaveBonusPack())
    {
        NewPage = new (none) Class'XInterface_Decompressed.Browser_ServerListPageMS';
        NewPage.GameType = InvasionType;
        NewPage.PageCaption = InvasionTypeName;
        AddBrowserPage(NewPage);
        NewPage = new (none) Class'XInterface_Decompressed.Browser_ServerListPageMS';
        NewPage.GameType = LMSType;
        NewPage.PageCaption = LMSTypeName;
        AddBrowserPage(NewPage);
        NewPage = new (none) Class'XInterface_Decompressed.Browser_ServerListPageMS';
        NewPage.GameType = MutantType;
        NewPage.PageCaption = MutantTypeName;
        AddBrowserPage(NewPage);
    }
    // End:0x153
    if(HaveCustomGameTypes())
    {
        AddBrowserPage(CustomServerListPage);
    }
    //return;    
}

function AddBrowserPage(Browser_Page NewPage)
{
    local export editinline GUITabControl TabC;

    NewPage.Browser = self;
    TabC = GUITabControl(Controls[1]);
    TabC.AddTab(NewPage.PageCaption, "", NewPage);
    //return;    
}

delegate OnAddFavorite(ServerResponseLine Server)
{
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    local int i;
    local export editinline GUITabControl TabC;

    TabC = GUITabControl(Controls[1]);
    i = 0;
    J0x19:

    // End:0x68 [Loop If]
    if(i < TabC.TabStack.Length)
    {
        Browser_Page(TabC.TabStack[i].MyPanel).OnCloseBrowser();
        i++;
        // [Loop Continue]
        goto J0x19;
    }
    OnClose(bCanceled);
    //return;    
}

defaultproperties
{
    // Reference: Browser_MOTD'XInterface_Decompressed.ServerBrowser.MyMOTDPage'
    begin object name="MyMOTDPage" class=XInterface_Decompressed.Browser_MOTD
        QueryCompleteString="Query finished."
        RefreshCompleteString="Update finished."
        PageCaption="News"
    end object
    MOTDPage=MyMOTDPage
    // Reference: Browser_ServerListPageMS'XInterface_Decompressed.ServerBrowser.MyDMServerListPage'
    begin object name="MyDMServerListPage" class=XInterface_Decompressed.Browser_ServerListPageMS
        GameType="wDeathMatch"
        PageCaption="Deathmatch"
    end object
    DMServerListPage=MyDMServerListPage
    // Reference: Browser_ServerListPageMS'XInterface_Decompressed.ServerBrowser.MyTDMServerListPage'
    begin object name="MyTDMServerListPage" class=XInterface_Decompressed.Browser_ServerListPageMS
        GameType="wTeamGame"
        PageCaption="Team Deathmatch"
    end object
    TDMServerListPage=MyTDMServerListPage
    // Reference: Browser_ServerListPageMS'XInterface_Decompressed.ServerBrowser.MyCTFServerListPage'
    begin object name="MyCTFServerListPage" class=XInterface_Decompressed.Browser_ServerListPageMS
        GameType="wCTFGame"
        QueryFinHead="Query finished.Receiving "
        QueryCompleteString="Query finished."
        RefreshCompleteString="Update finished."
        PageCaption="Capture the Flag"
    end object
    CTFServerListPage=MyCTFServerListPage
    // Reference: Browser_ServerListPageMS'XInterface_Decompressed.ServerBrowser.MyBRServerListPage'
    begin object name="MyBRServerListPage" class=XInterface_Decompressed.Browser_ServerListPageMS
        GameType="wBombingRun"
        QueryFinHead="Query finished.  Accepting "
        MustUpgradeString="Upgrade available. News page will be updated."
        RefreshCompleteString="Update finished."
        PageCaption="Bombing Run"
    end object
    BRServerListPage=MyBRServerListPage
    // Reference: Browser_ServerListPageMS'XInterface_Decompressed.ServerBrowser.MyDomServerListPage'
    begin object name="MyDomServerListPage" class=XInterface_Decompressed.Browser_ServerListPageMS
        GameType="wDoubleDom"
        PageCaption="Double Domination"
    end object
    DomServerListPage=MyDomServerListPage
    // Reference: Browser_ServerListPageMSCustom'XInterface_Decompressed.ServerBrowser.MyCustomServerListPage'
    begin object name="MyCustomServerListPage" class=XInterface_Decompressed.Browser_ServerListPageMSCustom
        PageCaption="Custom"
    end object
    CustomServerListPage=MyCustomServerListPage
    // Reference: Browser_ServerListPageFavorites'XInterface_Decompressed.ServerBrowser.MyFavoritesPage'
    begin object name="MyFavoritesPage" class=XInterface_Decompressed.Browser_ServerListPageFavorites
        RemoveFavoriteCaption="Remove from favorites"
        AddIPCaption="Add IP Address"
        RePingCaption="Re-ping list"
        QueryCompleteString="Query finished."
        RefreshCompleteString="Update finished."
        PageCaption="Favorites"
    end object
    FavoritesPage=MyFavoritesPage
    // Reference: Browser_ServerListPageLAN'XInterface_Decompressed.ServerBrowser.MyLANPage'
    begin object name="MyLANPage" class=XInterface_Decompressed.Browser_ServerListPageLAN
        QueryCompleteString="Query finished.  "
        RefreshCompleteString="Update finished."
        PageCaption="LAN"
    end object
    LANPage=MyLANPage
    // Reference: Browser_Prefs'XInterface_Decompressed.ServerBrowser.MyPrefsPage'
    begin object name="MyPrefsPage" class=XInterface_Decompressed.Browser_Prefs
        ViewStatsStrings[2]="No stats servers found"
        QueryCompleteString="Query finished."
        RefreshCompleteString="Update finished."
        PageCaption="Filter"
    end object
    PrefsPage=MyPrefsPage
    // Reference: Browser_ServerListPageBuddy'XInterface_Decompressed.ServerBrowser.MyBuddiesPage'
    begin object name="MyBuddiesPage" class=XInterface_Decompressed.Browser_ServerListPageBuddy
        GameType="wBombingRun"
        QueryFinHead="Query finished. Receiving "
        QueryCompleteString="Query finished."
        RefreshCompleteString="Update finished."
        PageCaption="Buddy"
    end object
    BuddiesPage=MyBuddiesPage
    // Reference: Browser_IRC'XInterface_Decompressed.ServerBrowser.MyIRCPage'
    begin object name="MyIRCPage" class=XInterface_Decompressed.Browser_IRC
        QueryCompleteString="Query finished!"
        RefreshCompleteString="Update finished."
        ReadyString="Ready."
        PageCaption="Chatting"
    end object
    IRCPage=MyIRCPage
    MutantTypeName="Mutant"
    InvasionTypeName="Invasion"
    LMSTypeName="Last Man Standing"
    MutantType="xMutant"
    InvasionType="Invasion"
    LMSType="xLast Man Standing"
    MaxGamespeed=200
    bCheckResolution=true
    bPersistent=true
    // Reference: GUITitleBar'XInterface_Decompressed.ServerBrowser.ServerBrowserHeader'
    begin object name="ServerBrowserHeader" class=XInterface_Decompressed.GUITitleBar
        Caption="Server Browser"
        StyleName="Header"
        WinTop=0.0364060
        WinHeight=46.0000000
    end object
    Controls[0]=ServerBrowserHeader
    // Reference: GUITabControl'XInterface_Decompressed.ServerBrowser.ServerBrowserTabs'
    begin object name="ServerBrowserTabs" class=XInterface_Decompressed.GUITabControl
        bDockPanels=true
        TabHeight=0.0400000
        WinTop=0.2500000
        WinHeight=48.0000000
        bAcceptsInput=true
        OnActivate=ServerBrowserTabs.InternalOnActivate
    end object
    Controls[1]=ServerBrowserTabs
}