class UT2MainPage extends UT2K3GUIPage
    editinlinenew
    instanced;

var() automated GUITabControl c_Tabs;
var() automated GUIHeader t_Header;
var() automated GUIFooter t_Footer;
var array<string> PanelClass;
var localized array<localized string> PanelCaption;
var localized array<localized string> PanelHint;

function InitComponent(GUIController MyC, GUIComponent MyO)
{
    super(GUIPage).InitComponent(MyC, MyO);
    c_Tabs.__OnChange__Delegate = InternalOnChange;
    t_Header.DockedTabs = c_Tabs;
    //return;    
}

function InternalOnChange(GUIComponent Sender)
{
    //return;    
}

defaultproperties
{
    // Reference: GUITabControl'XInterface_Decompressed.UT2MainPage.PageTabs'
    begin object name="PageTabs" class=XInterface_Decompressed.GUITabControl
        bDockPanels=true
        TabHeight=0.0400000
        WinTop=0.2500000
        WinHeight=48.0000000
        bAcceptsInput=true
        OnActivate=PageTabs.InternalOnActivate
        OnChange=UT2MainPage.InternalOnChange
    end object
    c_Tabs=PageTabs
}