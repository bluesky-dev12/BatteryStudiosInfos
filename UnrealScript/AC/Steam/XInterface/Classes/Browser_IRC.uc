/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_IRC.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:11
 *	Functions:5
 *
 *******************************************************************************/
class Browser_IRC extends Browser_Page
    dependson(IRC_NewNick)
    editinlinenew
    instanced;

var export editinline IRC_System SystemPage;
var export editinline GUITabControl ChannelTabs;
var localized string SystemLabel;
var bool bIrcIsInitialised;
var export editinline GUIButton LeaveButton;
var export editinline GUIButton BackButton;
var export editinline GUIButton ChangeNickButton;
var localized string LeaveChannelCaption;
var localized string LeavePrivateCaptionHead;
var localized string LeavePrivateCaptionTail;
var localized string ChooseNewNickText;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPanel).InitComponent(MyController, myOwner);
    // End:0x15a
    if(!bIrcIsInitialised)
    {
        ChannelTabs = GUITabControl(Controls[1]);
        SystemPage = IRC_System(ChannelTabs.AddTab(SystemLabel, "xinterface.IRC_System",,, true));
        SystemPage.IRCPage = self;
        ChannelTabs.__OnChange__Delegate = TabChange;
        SystemPage.SetCurrentChannel(-1);
        BackButton = GUIButton(GUIPanel(Controls[0]).Controls[0]);
        BackButton.__OnClick__Delegate = BackClick;
        LeaveButton = GUIButton(GUIPanel(Controls[0]).Controls[1]);
        LeaveButton.bVisible = false;
        LeaveButton.__OnClick__Delegate = LeaveChannelClick;
        ChangeNickButton = GUIButton(GUIPanel(Controls[0]).Controls[2]);
        ChangeNickButton.__OnClick__Delegate = ChangeNickClick;
        bIrcIsInitialised = true;
    }
}

function bool BackClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

function bool ChangeNickClick(GUIComponent Sender)
{
    local export editinline IRC_NewNick NewNickDialog;

    // End:0x87
    if(SystemPage.Controller.OpenMenu("xinterface.IRC_NewNick"))
    {
        NewNickDialog = IRC_NewNick(SystemPage.Controller.TopPage());
        NewNickDialog.NewNickPrompt.Caption = ChooseNewNickText;
        NewNickDialog.SystemPage = SystemPage;
    }
    return true;
}

function TabChange(GUIComponent Sender)
{
    local export editinline GUITabButton TabButton;

    TabButton = GUITabButton(Sender);
    // End:0x1d
    if(TabButton == none)
    {
        return;
    }
    // End:0x5d
    if(SystemPage == TabButton.MyPanel)
    {
        SystemPage.SetCurrentChannel(-1);
        LeaveButton.bVisible = false;
    }
    // End:0xed
    else
    {
        SystemPage.SetCurrentChannelPage(IRC_Channel(TabButton.MyPanel));
        // End:0xc8
        if(IRC_Private(TabButton.MyPanel) != none)
        {
            LeaveButton.Caption = LeavePrivateCaptionHead $ Caps(TabButton.Caption) $ LeavePrivateCaptionTail;
        }
        // End:0xdc
        else
        {
            LeaveButton.Caption = LeaveChannelCaption;
        }
        LeaveButton.bVisible = true;
    }
    TabButton.bForceFlash = false;
}

function bool LeaveChannelClick(GUIComponent Sender)
{
    SystemPage.PartCurrentChannel();
    return true;
}

defaultproperties
{
    SystemLabel="System"
    LeaveChannelCaption="Leave Channel"
    LeavePrivateCaptionHead="Quit"
    ChooseNewNickText="Select a new screen name."
    Controls=// Object reference not set to an instance of an object.
    
}