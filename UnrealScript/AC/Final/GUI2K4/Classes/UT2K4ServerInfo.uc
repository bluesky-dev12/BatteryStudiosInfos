class UT2K4ServerInfo extends UT2K4GUIPage
    editinlinenew
    instanced;

var() automated GUIImage i_Background;
var() automated GUITabControl c_Tabs;
var() automated GUITitleBar t_Header;
var() automated GUIFooter t_Footer;
var() automated GUIButton b_Close;
var array<string> PanelClass;
var localized array<localized string> PanelCaption;
var localized array<localized string> PanelHint;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPage).InitComponent(MyController, myOwner);
    // End:0x33
    if((PlayerOwner() != none) && PlayerOwner().GameReplicationInfo != none)
    {
        SetTitle();
    }
    c_Tabs.MyFooter = t_Footer;
    i = 0;
    J0x4E:

    // End:0xBD [Loop If]
    if(((i < PanelClass.Length) && i < PanelCaption.Length) && i < PanelHint.Length)
    {
        c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i]);
        i++;
        // [Loop Continue]
        goto J0x4E;
    }
    //return;    
}

function bool ButtonClicked(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

event ChangeHint(string NewHint)
{
    t_Footer.SetCaption(NewHint);
    //return;    
}

function SetTitle()
{
    t_Header.SetCaption(PlayerOwner().GameReplicationInfo.ServerName);
    //return;    
}

defaultproperties
{
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4ServerInfo.ServerInfoBackground'
    begin object name="ServerInfoBackground" class=XInterface.GUIImage
        ImageStyle=1
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    i_Background=ServerInfoBackground
    // Reference: GUITabControl'GUI2K4_Decompressed.UT2K4ServerInfo.ServerInfoTabs'
    begin object name="ServerInfoTabs" class=XInterface.GUITabControl
        bFillSpace=true
        bDockPanels=true
        TabHeight=0.0400000
        WinTop=0.1000000
        WinHeight=0.0600000
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=true
        OnActivate=ServerInfoTabs.InternalOnActivate
    end object
    c_Tabs=ServerInfoTabs
    // Reference: GUITitleBar'GUI2K4_Decompressed.UT2K4ServerInfo.ServerInfoHeader'
    begin object name="ServerInfoHeader" class=XInterface.GUITitleBar
        StyleName="Header"
        WinHeight=0.1000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    t_Header=ServerInfoHeader
    // Reference: GUIFooter'GUI2K4_Decompressed.UT2K4ServerInfo.ServerInfoFooter'
    begin object name="ServerInfoFooter" class=XInterface.GUIFooter
        WinTop=0.9250000
        WinHeight=0.0750000
    end object
    t_Footer=ServerInfoFooter
    // Reference: GUIButton'GUI2K4_Decompressed.UT2K4ServerInfo.ServerBackButton'
    begin object name="ServerBackButton" class=XInterface.GUIButton
        Caption="??"
        Hint="? ??? ????"
        WinTop=0.9341670
        WinLeft=0.8487500
        WinWidth=0.1200000
        WinHeight=0.0550000
        RenderWeight=0.5100000
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2K4ServerInfo.ButtonClicked
        OnKeyEvent=ServerBackButton.InternalOnKeyEvent
    end object
    b_Close=ServerBackButton
    PanelClass[0]="GUI2K4.UT2K4Tab_ServerMOTD"
    PanelClass[1]="GUI2K4.UT2K4Tab_ServerInfo"
    PanelClass[2]="GUI2K4.UT2K4Tab_ServerMapList"
    PanelCaption[0]="MOTD"
    PanelCaption[1]="??"
    PanelCaption[2]="?"
    PanelHint[0]="??? ???"
    PanelHint[1]="?? ??"
    PanelHint[2]="? ?? ??"
    bAllowedAsLast=true
    WinTop=0.1000000
    WinLeft=0.2000000
    WinWidth=0.6000000
    WinHeight=0.8000000
}