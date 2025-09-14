class Browser_ServerListPageBase extends Browser_Page
    editinlinenew
    instanced;

var export editinline Browser_ServersList MyServersList;
var bool ConnectLAN;
var export editinline GUITitleBar StatusBar;
var bool bInitialized;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x1A2
    if(!bInitialized)
    {
        MyServersList = Browser_ServersList(GUIMultiColumnListBox(GUIPanel(GUISplitter(Controls[0]).Controls[0]).Controls[0]).Controls[0]);
        MyServersList.MyPage = self;
        MyServersList.MyRulesList = Browser_RulesList(GUIMultiColumnListBox(GUIPanel(GUISplitter(GUISplitter(Controls[0]).Controls[1]).Controls[0]).Controls[0]).Controls[0]);
        MyServersList.MyPlayersList = Browser_PlayersList(GUIMultiColumnListBox(GUIPanel(GUISplitter(GUISplitter(Controls[0]).Controls[1]).Controls[1]).Controls[0]).Controls[0]);
        MyServersList.MyRulesList.MyPage = self;
        MyServersList.MyRulesList.MyServersList = MyServersList;
        MyServersList.MyPlayersList.MyPage = self;
        MyServersList.MyPlayersList.MyServersList = MyServersList;
        StatusBar = GUITitleBar(GUIPanel(Controls[1]).Controls[5]);
    }
    StatusBar.SetCaption(ReadyString);
    super(GUIPanel).InitComponent(MyController, myOwner);
    // End:0x2AB
    if(!bInitialized)
    {
        GUIButton(GUIPanel(Controls[1]).Controls[0]).__OnClick__Delegate = BackClick;
        GUIButton(GUIPanel(Controls[1]).Controls[1]).__OnClick__Delegate = RefreshClick;
        GUIButton(GUIPanel(Controls[1]).Controls[2]).__OnClick__Delegate = JoinClick;
        GUIButton(GUIPanel(Controls[1]).Controls[3]).__OnClick__Delegate = SpectateClick;
        GUIButton(GUIPanel(Controls[1]).Controls[4]).__OnClick__Delegate = AddFavoriteClick;
    }
    bInitialized = true;
    //return;    
}

function RefreshList()
{
    //return;    
}

function PingServer(int i, ServerQueryClient.EPingCause PingCause, ServerResponseLine S)
{
    //return;    
}

function CancelPings()
{
    //return;    
}

function bool BackClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

function bool RefreshClick(GUIComponent Sender)
{
    RefreshList();
    return true;
    //return;    
}

function bool JoinClick(GUIComponent Sender)
{
    MyServersList.Connect(false);
    return true;
    //return;    
}

function bool SpectateClick(GUIComponent Sender)
{
    MyServersList.Connect(true);
    return true;
    //return;    
}

function bool AddFavoriteClick(GUIComponent Sender)
{
    MyServersList.AddFavorite(Browser);
    return true;
    //return;    
}

defaultproperties
{
    // Reference: GUISplitter'XInterface_Decompressed.Browser_ServerListPageBase.MainSplitter'
    begin object name="MainSplitter" class=XInterface_Decompressed.GUISplitter
        Controls[0]=GUIPanel'XInterface_Decompressed.Browser_ServerListPageBase.ServersPanel'
        Controls[1]=GUISplitter'XInterface_Decompressed.Browser_ServerListPageBase.DetailsSplitter'
        WinHeight=0.9000000
    end object
    Controls[0]=MainSplitter
    // Reference: GUIPanel'XInterface_Decompressed.Browser_ServerListPageBase.FooterPanel'
    begin object name="FooterPanel" class=XInterface_Decompressed.GUIPanel
        Controls[0]=GUIButton'XInterface_Decompressed.Browser_ServerListPageBase.BackButton'
        Controls[1]=GUIButton'XInterface_Decompressed.Browser_ServerListPageBase.RefreshButton'
        Controls[2]=GUIButton'XInterface_Decompressed.Browser_ServerListPageBase.JoinButton'
        Controls[3]=GUIButton'XInterface_Decompressed.Browser_ServerListPageBase.SpectateButton'
        Controls[4]=GUIButton'XInterface_Decompressed.Browser_ServerListPageBase.AddFavoriteButton'
        Controls[5]=GUITitleBar'XInterface_Decompressed.Browser_ServerListPageBase.MyStatus'
        Controls[6]=GUIButton'XInterface_Decompressed.Browser_ServerListPageBase.UtilButtonA'
        Controls[7]=GUIButton'XInterface_Decompressed.Browser_ServerListPageBase.UtilButtonB'
        WinTop=0.9000000
        WinHeight=0.1000000
    end object
    Controls[1]=FooterPanel
}