/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_ServerListPageBase.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:9
 *
 *******************************************************************************/
class Browser_ServerListPageBase extends Browser_Page
    dependson(Browser_RulesList)
    dependson(Browser_PlayersList)
    editinlinenew
    instanced;

var export editinline Browser_ServersList MyServersList;
var bool ConnectLAN;
var export editinline GUITitleBar StatusBar;
var bool bInitialized;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x1a2
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
    // End:0x2ab
    if(!bInitialized)
    {
        GUIButton(GUIPanel(Controls[1]).Controls[0]).__OnClick__Delegate = BackClick;
        GUIButton(GUIPanel(Controls[1]).Controls[1]).__OnClick__Delegate = RefreshClick;
        GUIButton(GUIPanel(Controls[1]).Controls[2]).__OnClick__Delegate = JoinClick;
        GUIButton(GUIPanel(Controls[1]).Controls[3]).__OnClick__Delegate = SpectateClick;
        GUIButton(GUIPanel(Controls[1]).Controls[4]).__OnClick__Delegate = AddFavoriteClick;
    }
    bInitialized = true;
}

function RefreshList();
function PingServer(int i, IpDrv.ServerQueryClient.EPingCause PingCause, ServerResponseLine S);
function CancelPings();
function bool BackClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

function bool RefreshClick(GUIComponent Sender)
{
    RefreshList();
    return true;
}

function bool JoinClick(GUIComponent Sender)
{
    MyServersList.Connect(false);
    return true;
}

function bool SpectateClick(GUIComponent Sender)
{
    MyServersList.Connect(true);
    return true;
}

function bool AddFavoriteClick(GUIComponent Sender)
{
    MyServersList.AddFavorite(Browser);
    return true;
}

defaultproperties
{
    Controls=// Object reference not set to an instance of an object.
    
}