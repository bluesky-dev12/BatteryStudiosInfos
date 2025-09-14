/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4ServerInfo.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:4
 *
 *******************************************************************************/
class UT2K4ServerInfo extends UT2K4GUIPage
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Background;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITabControl c_Tabs;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITitleBar t_Header;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIFooter t_Footer;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Close;
var array<string> PanelClass;
var localized array<localized string> PanelCaption;
var localized array<localized string> PanelHint;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPage).InitComponent(MyController, myOwner);
    // End:0x33
    if(PlayerOwner() != none && PlayerOwner().GameReplicationInfo != none)
    {
        SetTitle();
    }
    c_Tabs.MyFooter = t_Footer;
    i = 0;
    J0x4e:
    // End:0xbd [While If]
    if(i < PanelClass.Length && i < PanelCaption.Length && i < PanelHint.Length)
    {
        c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x4e;
    }
}

function bool ButtonClicked(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
}

event ChangeHint(string NewHint)
{
    t_Footer.SetCaption(NewHint);
}

function SetTitle()
{
    t_Header.SetCaption(PlayerOwner().GameReplicationInfo.ServerName);
}

defaultproperties
{
    begin object name=ServerInfoBackground class=GUIImage
        ImageStyle=1
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    object end
    // Reference: GUIImage'UT2K4ServerInfo.ServerInfoBackground'
    i_Background=ServerInfoBackground
    begin object name=ServerInfoTabs class=GUITabControl
        bFillSpace=true
        bDockPanels=true
        TabHeight=0.040
        WinTop=0.10
        WinHeight=0.060
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=true
        OnActivate=InternalOnActivate
    object end
    // Reference: GUITabControl'UT2K4ServerInfo.ServerInfoTabs'
    c_Tabs=ServerInfoTabs
    begin object name=ServerInfoHeader class=GUITitleBar
        StyleName="Header"
        WinHeight=0.10
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUITitleBar'UT2K4ServerInfo.ServerInfoHeader'
    t_Header=ServerInfoHeader
    begin object name=ServerInfoFooter class=GUIFooter
        WinTop=0.9250
        WinHeight=0.0750
    object end
    // Reference: GUIFooter'UT2K4ServerInfo.ServerInfoFooter'
    t_Footer=ServerInfoFooter
    begin object name=ServerBackButton class=GUIButton
        Caption="??"
        Hint="? ??? ????"
        WinTop=0.9341670
        WinLeft=0.848750
        WinWidth=0.120
        WinHeight=0.0550
        RenderWeight=0.510
        bBoundToParent=true
        bScaleToParent=true
        OnClick=ButtonClicked
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4ServerInfo.ServerBackButton'
    b_Close=ServerBackButton
    PanelClass=// Object reference not set to an instance of an object.
    
    PanelCaption=// Object reference not set to an instance of an object.
    
    PanelHint=// Object reference not set to an instance of an object.
    
    bAllowedAsLast=true
    WinTop=0.10
    WinLeft=0.20
    WinWidth=0.60
    WinHeight=0.80
}