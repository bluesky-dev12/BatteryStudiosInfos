/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\ServerBrowser.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Enums:4
 *	Properties:36
 *	Functions:7
 *
 *******************************************************************************/
class ServerBrowser extends UT2K3GUIPage
    dependson(UT2K3GUIPage)
    dependson(GUITabControl)
    dependson(Browser_Page)
    dependson(Browser_ServerListPageMS)
    dependson(Browser_ServerListPageMSCustom)
    dependson(GUITitleBar)
    config(User)
    editinlinenew
    instanced;

enum EViewMutatorMode
{
    VMM_AnyMutators,
    VMM_NoMutators,
    VMM_ThisMutator,
    VMM_NotThisMutator
};

enum EStatsServerView
{
    SSV_Any,
    SSV_OnlyStatsEnabled,
    SSV_NoStatsEnabled
};

enum EWeaponStayServerView
{
    WSSV_Any,
    WSSV_OnlyWeaponStay,
    WSSV_NoWeaponStay
};

enum ETranslocServerView
{
    TSV_Any,
    TSV_OnlyTransloc,
    TSV_NoTransloc
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
var delegate<OnAddFavorite> __OnAddFavorite__Delegate;

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
}

function bool HaveBonusPack()
{
    local Object Test;

    Test = DynamicLoadObject("BonusPack.xMutantGame", class'Class');
    // End:0x35
    if(Test == none)
    {
        return false;
    }
    Test = DynamicLoadObject("SkaarjPack.Invasion", class'Class');
    // End:0x68
    if(Test == none)
    {
        return false;
    }
    return true;
}

function bool HaveCustomGameTypes()
{
    local string Entry, Desc;
    local int Index;

    Index = 0;
    PlayerOwner().GetNextIntDesc("GameInfo", Index, Entry, Desc);
    J0x2d:
    // End:0x9b [While If]
    if(Entry != "")
    {
        Desc = Entry $ "|" $ Desc;
        // End:0x6b
        if(!class'Browser_ServerListPageMSCustom'.static.IsStandardGameType(Desc))
        {
            return true;
        }
        ++ Index;
        PlayerOwner().GetNextIntDesc("GameInfo", Index, Entry, Desc);
        // This is an implied JumpToken; Continue!
        goto J0x2d;
    }
    return false;
}

function MOTDVerified(bool bMSVerified)
{
    local export editinline Browser_ServerListPageMS NewPage;

    // End:0x0b
    if(bCreatedQueryTabs)
    {
        return;
    }
    bCreatedQueryTabs = true;
    AddBrowserPage(BuddiesPage);
    AddBrowserPage(DMServerListPage);
    AddBrowserPage(TDMServerListPage);
    // End:0x5a
    if(!PlayerOwner().Level.IsDemoBuild())
    {
        AddBrowserPage(DomServerListPage);
    }
    AddBrowserPage(CTFServerListPage);
    AddBrowserPage(BRServerListPage);
    // End:0x13f
    if(HaveBonusPack())
    {
        NewPage = new (none) class'Browser_ServerListPageMS';
        NewPage.GameType = InvasionType;
        NewPage.PageCaption = InvasionTypeName;
        AddBrowserPage(NewPage);
        NewPage = new (none) class'Browser_ServerListPageMS';
        NewPage.GameType = LMSType;
        NewPage.PageCaption = LMSTypeName;
        AddBrowserPage(NewPage);
        NewPage = new (none) class'Browser_ServerListPageMS';
        NewPage.GameType = MutantType;
        NewPage.PageCaption = MutantTypeName;
        AddBrowserPage(NewPage);
    }
    // End:0x153
    if(HaveCustomGameTypes())
    {
        AddBrowserPage(CustomServerListPage);
    }
}

function AddBrowserPage(Browser_Page NewPage)
{
    local export editinline GUITabControl TabC;

    NewPage.Browser = self;
    TabC = GUITabControl(Controls[1]);
    TabC.AddTab(NewPage.PageCaption, "", NewPage);
}

delegate OnAddFavorite(ServerResponseLine Server);
function InternalOnClose(optional bool bCanceled)
{
    local int i;
    local export editinline GUITabControl TabC;

    TabC = GUITabControl(Controls[1]);
    i = 0;
    J0x19:
    // End:0x68 [While If]
    if(i < TabC.TabStack.Length)
    {
        Browser_Page(TabC.TabStack[i].MyPanel).OnCloseBrowser();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x19;
    }
    OnClose(bCanceled);
}

defaultproperties
{
    begin object name=MyMOTDPage class=Browser_MOTD
        QueryCompleteString="Query finished."
        RefreshCompleteString="Update finished."
        PageCaption="News"
    object end
    // Reference: Browser_MOTD'ServerBrowser.MyMOTDPage'
    MOTDPage=MyMOTDPage
    begin object name=MyDMServerListPage class=Browser_ServerListPageMS
        GameType="wDeathMatch"
        PageCaption="Deathmatch"
    object end
    // Reference: Browser_ServerListPageMS'ServerBrowser.MyDMServerListPage'
    DMServerListPage=MyDMServerListPage
    begin object name=MyTDMServerListPage class=Browser_ServerListPageMS
        GameType="wTeamGame"
        PageCaption="Team Deathmatch"
    object end
    // Reference: Browser_ServerListPageMS'ServerBrowser.MyTDMServerListPage'
    TDMServerListPage=MyTDMServerListPage
    begin object name=MyCTFServerListPage class=Browser_ServerListPageMS
        GameType="wCTFGame"
        QueryFinHead="Query finished.Receiving "
        QueryCompleteString="Query finished."
        RefreshCompleteString="Update finished."
        PageCaption="Capture the Flag"
    object end
    // Reference: Browser_ServerListPageMS'ServerBrowser.MyCTFServerListPage'
    CTFServerListPage=MyCTFServerListPage
    begin object name=MyBRServerListPage class=Browser_ServerListPageMS
        GameType="wBombingRun"
        QueryFinHead="Query finished.  Accepting "
        MustUpgradeString="Upgrade available. News page will be updated."
        RefreshCompleteString="Update finished."
        PageCaption="Bombing Run"
    object end
    // Reference: Browser_ServerListPageMS'ServerBrowser.MyBRServerListPage'
    BRServerListPage=MyBRServerListPage
    begin object name=MyDomServerListPage class=Browser_ServerListPageMS
        GameType="wDoubleDom"
        PageCaption="Double Domination"
    object end
    // Reference: Browser_ServerListPageMS'ServerBrowser.MyDomServerListPage'
    DomServerListPage=MyDomServerListPage
    begin object name=MyCustomServerListPage class=Browser_ServerListPageMSCustom
        PageCaption="Custom"
    object end
    // Reference: Browser_ServerListPageMSCustom'ServerBrowser.MyCustomServerListPage'
    CustomServerListPage=MyCustomServerListPage
    begin object name=MyFavoritesPage class=Browser_ServerListPageFavorites
        RemoveFavoriteCaption="Remove from favorites"
        AddIPCaption="Add IP Address"
        RePingCaption="Re-ping list"
        QueryCompleteString="Query finished."
        RefreshCompleteString="Update finished."
        PageCaption="Favorites"
    object end
    // Reference: Browser_ServerListPageFavorites'ServerBrowser.MyFavoritesPage'
    FavoritesPage=MyFavoritesPage
    begin object name=MyLANPage class=Browser_ServerListPageLAN
        QueryCompleteString="Query finished.  "
        RefreshCompleteString="Update finished."
        PageCaption="LAN"
    object end
    // Reference: Browser_ServerListPageLAN'ServerBrowser.MyLANPage'
    LANPage=MyLANPage
    begin object name=MyPrefsPage class=Browser_Prefs
        ViewStatsStrings[2]="No stats servers found"
        QueryCompleteString="Query finished."
        RefreshCompleteString="Update finished."
        PageCaption="Filter"
    object end
    // Reference: Browser_Prefs'ServerBrowser.MyPrefsPage'
    PrefsPage=MyPrefsPage
    begin object name=MyBuddiesPage class=Browser_ServerListPageBuddy
        GameType="wBombingRun"
        QueryFinHead="Query finished. Receiving "
        QueryCompleteString="Query finished."
        RefreshCompleteString="Update finished."
        PageCaption="Buddy"
    object end
    // Reference: Browser_ServerListPageBuddy'ServerBrowser.MyBuddiesPage'
    BuddiesPage=MyBuddiesPage
    begin object name=MyIRCPage class=Browser_IRC
        QueryCompleteString="Query finished!"
        RefreshCompleteString="Update finished."
        ReadyString="Ready."
        PageCaption="Chatting"
    object end
    // Reference: Browser_IRC'ServerBrowser.MyIRCPage'
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
    Controls=// Object reference not set to an instance of an object.
    
}