class Browser_IRC extends Browser_Page
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
    // End:0x15A
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
    //return;    
}

function bool BackClick(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
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
    //return;    
}

function TabChange(GUIComponent Sender)
{
    local export editinline GUITabButton TabButton;

    TabButton = GUITabButton(Sender);
    // End:0x1D
    if(TabButton == none)
    {
        return;
    }
    // End:0x5D
    if(SystemPage == TabButton.MyPanel)
    {
        SystemPage.SetCurrentChannel(-1);
        LeaveButton.bVisible = false;        
    }
    else
    {
        SystemPage.SetCurrentChannelPage(IRC_Channel(TabButton.MyPanel));
        // End:0xC8
        if(IRC_Private(TabButton.MyPanel) != none)
        {
            LeaveButton.Caption = (LeavePrivateCaptionHead $ Caps(TabButton.Caption)) $ LeavePrivateCaptionTail;            
        }
        else
        {
            LeaveButton.Caption = LeaveChannelCaption;
        }
        LeaveButton.bVisible = true;
    }
    TabButton.bForceFlash = false;
    //return;    
}

function bool LeaveChannelClick(GUIComponent Sender)
{
    SystemPage.PartCurrentChannel();
    return true;
    //return;    
}

defaultproperties
{
    SystemLabel="???"
    LeaveChannelCaption="??? ??"
    LeavePrivateCaptionHead="??"
    ChooseNewNickText="??? ?? ??? ?????"
    // Reference: GUIPanel'XInterface_Decompressed.Browser_IRC.FooterPanel'
    begin object name="FooterPanel" class=XInterface_Decompressed.GUIPanel
        Controls[0]=GUIButton'XInterface_Decompressed.Browser_IRC.MyBackButton'
        Controls[1]=GUIButton'XInterface_Decompressed.Browser_IRC.MyLeaveButton'
        Controls[2]=GUIButton'XInterface_Decompressed.Browser_IRC.MyChangeNickButton'
        WinTop=0.9500000
        WinHeight=0.0500000
    end object
    Controls[0]=FooterPanel
    // Reference: GUITabControl'XInterface_Decompressed.Browser_IRC.ChannelTabControl'
    begin object name="ChannelTabControl" class=XInterface_Decompressed.GUITabControl
        bDockPanels=true
        TabHeight=0.0400000
        WinHeight=48.0000000
        bAcceptsInput=true
        OnActivate=ChannelTabControl.InternalOnActivate
    end object
    Controls[1]=ChannelTabControl
}