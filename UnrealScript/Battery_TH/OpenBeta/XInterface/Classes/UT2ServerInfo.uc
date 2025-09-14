class UT2ServerInfo extends GUIPage
    config(User)
    editinlinenew
    instanced;

var(MidGame) config array<string> PanelClass;
var(MidGame) localized array<localized string> PanelCaption;
var(MidGame) localized array<localized string> PanelHint;
var(MidGame) /*0x00000000-0x00000008*/ editconst noexport editinline GUITabControl TabC;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    // End:0x33
    if((PlayerOwner() != none) && PlayerOwner().GameReplicationInfo != none)
    {
        SetTitle();
    }
    TabC = GUITabControl(Controls[4]);
    TabC.MyFooter = GUIFooter(Controls[2]);
    i = 0;
    J0x69:

    // End:0xD8 [Loop If]
    if(((i < PanelClass.Length) && i < PanelCaption.Length) && i < PanelHint.Length)
    {
        TabC.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i]);
        i++;
        // [Loop Continue]
        goto J0x69;
    }
    // End:0x123
    if(!bOldStyleMenus)
    {
        Controls[3].Style = Controller.GetStyle("SquareButton", Controls[3].FontScale);
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
    GUITitleBar(Controls[2]).SetCaption(NewHint);
    //return;    
}

function SetTitle()
{
    GUITitleBar(Controls[1]).SetCaption(PlayerOwner().GameReplicationInfo.ServerName);
    //return;    
}

function bool NotifyLevelChange()
{
    bPersistent = false;
    return true;
    //return;    
}

defaultproperties
{
    PanelClass[0]="XInterface.Tab_ServerMOTD"
    PanelClass[1]="XInterface.Tab_ServerInfo"
    PanelClass[2]="XInterface.Tab_ServerMapList"
    PanelCaption[0]="?? ???"
    PanelCaption[1]="??"
    PanelCaption[2]="?"
    PanelHint[0]="?? ???"
    PanelHint[1]="????"
    PanelHint[2]="? ????"
    bRequire640x480=false
    bAllowedAsLast=true
    // Reference: GUIImage'XInterface_Decompressed.UT2ServerInfo.ServerInfoBackground'
    begin object name="ServerInfoBackground" class=XInterface_Decompressed.GUIImage
        ImageStyle=1
        bBoundToParent=true
        bScaleToParent=true
        bNeverFocus=true
    end object
    Controls[0]=ServerInfoBackground
    // Reference: GUITitleBar'XInterface_Decompressed.UT2ServerInfo.ServerInfoHeader'
    begin object name="ServerInfoHeader" class=XInterface_Decompressed.GUITitleBar
        StyleName="Header"
        WinHeight=0.1000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    Controls[1]=ServerInfoHeader
    // Reference: GUIFooter'XInterface_Decompressed.UT2ServerInfo.ServerInfoFooter'
    begin object name="ServerInfoFooter" class=XInterface_Decompressed.GUIFooter
        WinTop=0.9250000
        WinHeight=0.0750000
    end object
    Controls[2]=ServerInfoFooter
    // Reference: GUIButton'XInterface_Decompressed.UT2ServerInfo.ServerBackButton'
    begin object name="ServerBackButton" class=XInterface_Decompressed.GUIButton
        Caption="????"
        Hint="? ?? ????"
        WinTop=0.9341670
        WinLeft=0.8487500
        WinWidth=0.1200000
        WinHeight=0.0550000
        bBoundToParent=true
        bScaleToParent=true
        OnClick=UT2ServerInfo.ButtonClicked
        OnKeyEvent=ServerBackButton.InternalOnKeyEvent
    end object
    Controls[3]=ServerBackButton
    // Reference: GUITabControl'XInterface_Decompressed.UT2ServerInfo.ServerInfoTabs'
    begin object name="ServerInfoTabs" class=XInterface_Decompressed.GUITabControl
        bFillSpace=true
        bDockPanels=true
        TabHeight=0.0450000
        WinTop=0.0833330
        WinLeft=0.0125000
        WinWidth=0.9749990
        WinHeight=0.0600000
        bBoundToParent=true
        bScaleToParent=true
        bAcceptsInput=true
        OnActivate=ServerInfoTabs.InternalOnActivate
    end object
    Controls[4]=ServerInfoTabs
    WinTop=0.1000000
    WinLeft=0.2000000
    WinWidth=0.6000000
    WinHeight=0.8000000
}