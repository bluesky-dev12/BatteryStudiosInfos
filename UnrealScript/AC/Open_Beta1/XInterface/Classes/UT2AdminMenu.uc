class UT2AdminMenu extends UT2K3GUIPage
    editinlinenew
    instanced;

var export editinline GUITabControl TabC;
var export editinline Tab_AdminPlayerList PlayerList;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    TabC = GUITabControl(Controls[5]);
    PlayerList = Tab_AdminPlayerList(TabC.AddTab("Players", "xinterface.Tab_AdminPlayerList",, "Player Mgt.", true));
    // End:0x8F
    if(PlayerList != none)
    {
        PlayerList.ReloadList();
    }
    //return;    
}

function HandleParameters(string Param1, string Param2)
{
    PlayerList.bAdvancedAdmin = bool(Param1);
    //return;    
}

function bool ButtonClicked(GUIComponent Sender)
{
    Controller.CloseMenu(true);
    return true;
    //return;    
}

defaultproperties
{
    bRequire640x480=false
    bAllowedAsLast=true
    // Reference: GUIImage'XInterface_Decompressed.UT2AdminMenu.AdminInfoBackground'
    begin object name="AdminInfoBackground" class=XInterface_Decompressed.GUIImage
        ImageStyle=1
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    Controls[0]=AdminInfoBackground
    // Reference: GUIImage'XInterface_Decompressed.UT2AdminMenu.AdminInfoBackground2'
    begin object name="AdminInfoBackground2" class=XInterface_Decompressed.GUIImage
        ImageStyle=1
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    Controls[1]=AdminInfoBackground2
    // Reference: GUITitleBar'XInterface_Decompressed.UT2AdminMenu.AdminInfoHeader'
    begin object name="AdminInfoHeader" class=XInterface_Decompressed.GUITitleBar
        Caption="Manage Ongoing Games"
        StyleName="Header"
        WinHeight=0.1000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    Controls[2]=AdminInfoHeader
    // Reference: GUITitleBar'XInterface_Decompressed.UT2AdminMenu.AdminInfoFooter'
    begin object name="AdminInfoFooter" class=XInterface_Decompressed.GUITitleBar
        bUseTextHeight=false
        StyleName="Footer"
        WinTop=0.9250000
        WinHeight=0.0750000
        bBoundToParent=true
        bScaleToParent=true
    end object
    Controls[3]=AdminInfoFooter
    // Reference: GUIButton'XInterface_Decompressed.UT2AdminMenu.AdminBackButton'
    begin object name="AdminBackButton" class=XInterface_Decompressed.GUIButton
        Caption="Quit"
        StyleName="SquareMenuButton"
        Hint="Close this menu."
        WinTop=0.9341670
        WinLeft=0.8687500
        WinWidth=0.1200000
        WinHeight=0.0550000
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2AdminMenu.ButtonClicked
        OnKeyEvent=AdminBackButton.InternalOnKeyEvent
    end object
    Controls[4]=AdminBackButton
    // Reference: GUITabControl'XInterface_Decompressed.UT2AdminMenu.AdminInfoTabs'
    begin object name="AdminInfoTabs" class=XInterface_Decompressed.GUITabControl
        bDockPanels=true
        TabHeight=0.0400000
        WinTop=0.1000000
        WinHeight=0.0600000
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=true
        OnActivate=AdminInfoTabs.InternalOnActivate
    end object
    Controls[5]=AdminInfoTabs
    WinTop=0.1000000
    WinLeft=0.0200000
    WinWidth=0.9600000
    WinHeight=0.8000000
}