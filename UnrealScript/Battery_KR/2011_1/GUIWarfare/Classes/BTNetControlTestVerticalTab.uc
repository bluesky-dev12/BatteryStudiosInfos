class BTNetControlTestVerticalTab extends BTNetGUIPage
    editinlinenew
    instanced;

var() automated GUIButton TabButton1;
var() automated GUIButton TabButton2;
var() automated GUITabPanel TabPanel1;
var() automated GUITabPanel TabPanel2;
var() automated TabControlMocker TabControl;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    BindPanels();
    //return;    
}

function BindPanels()
{
    TabControl.BindTabButtonAndPanel(TabButton1, TabPanel1);
    TabControl.BindTabButtonAndPanel(TabButton2, TabPanel2);
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

defaultproperties
{
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetControlTestVerticalTab.mTabButton1'
    begin object name="mTabButton1" class=XInterface.GUIButton
        Caption="Details"
        WinWidth=0.1000000
        WinHeight=0.0300000
        bBoundToParent=true
        bScaleToParent=true
        OnKeyEvent=mTabButton1.InternalOnKeyEvent
    end object
    TabButton1=mTabButton1
    // Reference: GUIButton'GUIWarfare_Decompressed.BTNetControlTestVerticalTab.mTabButton2'
    begin object name="mTabButton2" class=XInterface.GUIButton
        Caption="Audio"
        WinTop=0.0300000
        WinWidth=0.1000000
        WinHeight=0.0300000
        bBoundToParent=true
        bScaleToParent=true
        OnKeyEvent=mTabButton2.InternalOnKeyEvent
    end object
    TabButton2=mTabButton2
    // Reference: UT2K4Tab_DetailSettings'GUIWarfare_Decompressed.BTNetControlTestVerticalTab.mTabPanel1'
    begin object name="mTabPanel1" class=GUI2K4.UT2K4Tab_DetailSettings
        WinTop=0.0000000
        WinLeft=0.1000000
        WinWidth=0.9000000
        WinHeight=1.0000000
        bVisible=false
        OnPreDraw=mTabPanel1.InternalOnPreDraw
    end object
    TabPanel1=mTabPanel1
    // Reference: UT2K4Tab_AudioSettings'GUIWarfare_Decompressed.BTNetControlTestVerticalTab.mTabPanel2'
    begin object name="mTabPanel2" class=GUI2K4.UT2K4Tab_AudioSettings
        WinTop=0.0000000
        WinLeft=0.1000000
        WinWidth=0.9000000
        WinHeight=1.0000000
        bVisible=false
    end object
    TabPanel2=mTabPanel2
    // Reference: TabControlMocker'GUIWarfare_Decompressed.BTNetControlTestVerticalTab.mTabControl'
    begin object name="mTabControl" class=GUIWarfareControls.TabControlMocker
        Buttons=/* Array type was not detected. */
        Panels=/* Array type was not detected. */
    end object
    TabControl=mTabControl
    bPersistent=true
    bAllowedAsLast=true
    OnOpen=BTNetControlTestVerticalTab.InternalOnOpen
    OnClose=BTNetControlTestVerticalTab.InternalOnClose
    OnKeyEvent=BTNetControlTestVerticalTab.InternalOnKeyEvent
}