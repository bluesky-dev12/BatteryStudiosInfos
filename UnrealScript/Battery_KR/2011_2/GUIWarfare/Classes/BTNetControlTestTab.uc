class BTNetControlTestTab extends BTNetGUIPage
    editinlinenew
    instanced;

var() automated BTNetControlTestTitleBar TitleBar;
var() automated GUITabControl TabControl;
var() automated BTNetControlTestFooter Footer;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    TitleBar.DockedTabs = TabControl;
    TitleBar.DockAlign = 4;
    TabControl.AddTab("Details", "GUI2K4.UT2K4Tab_DetailSettings");
    TabControl.AddTab("Audio", "GUI2K4.UT2K4Tab_AudioSettings");
    TabControl.MyFooter = Footer;
    //return;    
}

function InternalOnOpen()
{
    OnOpen();
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    OnClose(bCanceled);
    //return;    
}

event Opened(GUIComponent Sender)
{
    super.Opened(Sender);
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local Interactions.EInputKey iKey;
    local Interactions.EInputAction iState;

    iKey = key;
    iState = State;
    // End:0x3A
    if(int(iKey) == int(27))
    {
        page_Main.SetPage(1, true);
        return true;
    }
    return false;
    //return;    
}

function TabControl_OnChange(GUIComponent Sender)
{
    //return;    
}

defaultproperties
{
    // Reference: BTNetControlTestTitleBar'GUIWarfare_Decompressed.BTNetControlTestTab.mTitleBar'
    begin object name="mTitleBar" class=GUIWarfare_Decompressed.BTNetControlTestTitleBar
    end object
    TitleBar=mTitleBar
    // Reference: GUITabControl'GUIWarfare_Decompressed.BTNetControlTestTab.mTabControl'
    begin object name="mTabControl" class=XInterface.GUITabControl
        bDockPanels=true
        TabHeight=0.0400000
        BackgroundStyleName="TabBackground"
        WinTop=0.1000000
        WinLeft=0.0100000
        WinWidth=0.9800000
        WinHeight=0.0400000
        RenderWeight=0.4900000
        bAcceptsInput=true
        OnActivate=mTabControl.InternalOnActivate
        OnChange=BTNetControlTestTab.TabControl_OnChange
    end object
    TabControl=mTabControl
    // Reference: BTNetControlTestFooter'GUIWarfare_Decompressed.BTNetControlTestTab.mFooter'
    begin object name="mFooter" class=GUIWarfare_Decompressed.BTNetControlTestFooter
    end object
    Footer=mFooter
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=BTNetControlTestTab.InternalOnOpen
    OnClose=BTNetControlTestTab.InternalOnClose
    OnKeyEvent=BTNetControlTestTab.InternalOnKeyEvent
}