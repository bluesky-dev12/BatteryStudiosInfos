/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2MainPage.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:2
 *
 *******************************************************************************/
class UT2MainPage extends UT2K3GUIPage
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITabControl c_Tabs;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIHeader t_Header;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIFooter t_Footer;
var array<string> PanelClass;
var localized array<localized string> PanelCaption;
var localized array<localized string> PanelHint;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    super(GUIPage).InitComponent(MyC, MyO);
    c_Tabs.__OnChange__Delegate = InternalOnChange;
    t_Header.DockedTabs = c_Tabs;
}

function InternalOnChange(GUIComponent Sender);

defaultproperties
{
    begin object name=PageTabs class=GUITabControl
        bDockPanels=true
        TabHeight=0.040
        WinTop=0.250
        WinHeight=48.0
        bAcceptsInput=true
        OnActivate=InternalOnActivate
        OnChange=InternalOnChange
    object end
    // Reference: GUITabControl'UT2MainPage.PageTabs'
    c_Tabs=PageTabs
}