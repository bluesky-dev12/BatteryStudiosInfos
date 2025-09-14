class UT2SettingsPage extends UT2K3GUIPage
    editinlinenew
    instanced;

var localized string VideoTabLabel;
var localized string VideoTabHint;
var localized string DetailsTabLabel;
var localized string DetailsTabHint;
var localized string AudioTabLabel;
var localized string AudioTabHint;
var localized string PlayerTabLabel;
var localized string PlayerTabHint;
var localized string NetworkTabLabel;
var localized string NetworkTabHint;
var localized string ControlsTabLabel;
var localized string ControlsTabHint;
var localized string IForceTabLabel;
var localized string IForceTabHint;
var localized string WeaponsTabLabel;
var localized string WeaponsTabHint;
var localized string GameTabLabel;
var localized string GameTabHint;
var localized string HudTabLabel;
var localized string HudTabHint;
var localized string SpeechBinderTabLabel;
var localized string SpeechBinderTabHint;
var float SavedPitch;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local export editinline GUITabControl TabC;
    local Rotator PlayerRot;

    super(GUIPage).InitComponent(MyController, myOwner);
    PlayerRot = PlayerOwner().Rotation;
    SavedPitch = float(PlayerRot.Pitch);
    PlayerRot.Pitch = 0;
    PlayerOwner().SetRotation(PlayerRot);
    TabC = GUITabControl(Controls[1]);
    GUITitleBar(Controls[0]).DockedTabs = TabC;
    TabC.AddTab(VideoTabLabel, "xinterface.Tab_VideoSettings",, VideoTabHint, true);
    TabC.AddTab(DetailsTabLabel, "xinterface.Tab_DetailSettings",, DetailsTabHint);
    TabC.AddTab(AudioTabLabel, "xinterface.Tab_AudioSettings",, AudioTabHint);
    TabC.AddTab(ControlsTabLabel, "xinterface.Tab_ControlSettings",, ControlsTabHint);
    TabC.AddTab(IForceTabLabel, "xinterface.Tab_IForceSettings",, IForceTabHint);
    TabC.AddTab(HudTabLabel, "xinterface.Tab_HudSettings",, HudTabHint);
    TabC.AddTab(GameTabLabel, "xinterface.Tab_GameSettings",, GameTabHint);
    TabC.AddTab(SpeechBinderTabLabel, "xinterface.Tab_SpeechBinder",, SpeechBinderTabHint);
    //return;    
}

function TabChange(GUIComponent Sender)
{
    // End:0x12
    if(GUITabButton(Sender) == none)
    {
        return;
    }
    GUITitleBar(Controls[0]).SetCaption((GUITitleBar(default.Controls[0]).GetCaption() @ "|") @ GUITabButton(Sender).Caption);
    //return;    
}

event ChangeHint(string NewHint)
{
    GUITitleBar(Controls[2]).SetCaption(NewHint);
    //return;    
}

function InternalOnReOpen()
{
    local export editinline GUITabControl TabC;

    TabC = GUITabControl(Controls[1]);
    // End:0x66
    if((TabC.ActiveTab != none) && TabC.ActiveTab.MyPanel != none)
    {
        TabC.ActiveTab.MyPanel.Refresh();
    }
    //return;    
}

function bool ButtonClicked(GUIComponent Sender)
{
    // End:0x3D
    if(InternalOnCanClose(false))
    {
        GUITabControl(Controls[1]).ActiveTab.OnDeActivate();
        Controller.CloseMenu(true);
    }
    return true;
    //return;    
}

function bool InternalOnCanClose(optional bool bCanceled)
{
    return true;
    //return;    
}

function bool NotifyLevelChange()
{
    Controller.CloseMenu(true);
    return super(GUIPage).NotifyLevelChange();
    //return;    
}

function InternalOnClose(optional bool bCanceled)
{
    local Rotator NewRot;

    NewRot = PlayerOwner().Rotation;
    NewRot.Pitch = int(SavedPitch);
    PlayerOwner().SetRotation(NewRot);
    OnClose(bCanceled);
    //return;    
}

defaultproperties
{
    VideoTabLabel="Video"
    VideoTabHint="Change resolution and brightness."
    DetailsTabLabel="Detail"
    DetailsTabHint="Adjust detail settings for graphics quality and frame rate."
    AudioTabLabel="Audio"
    AudioTabHint="Adjust audio settings."
    PlayerTabLabel="Player"
    PlayerTabHint="Configure your UT2004 avatar."
    NetworkTabLabel="Network"
    NetworkTabHint="Configure online and LAN UT2004 games."
    ControlsTabLabel="Controls"
    ControlsTabHint="Configure control features."
    IForceTabLabel="Enter"
    IForceTabHint="Configure others. Enter options."
    WeaponsTabLabel="Weapons"
    WeaponsTabHint="Adjust weapon attributes and settings."
    GameTabLabel="Game"
    GameTabHint="Adjust various game settings."
    HudTabLabel="HUD"
    HudTabHint="Set HUD."
    SpeechBinderTabLabel="Speech"
    SpeechBinderTabHint="Set speech keybinds."
    OnReOpen=UT2SettingsPage.InternalOnReOpen
    OnClose=UT2SettingsPage.InternalOnClose
    OnCanClose=UT2SettingsPage.InternalOnCanClose
    // Reference: GUITitleBar'XInterface_Decompressed.UT2SettingsPage.SettingHeader'
    begin object name="SettingHeader" class=XInterface_Decompressed.GUITitleBar
        Caption="Settings"
        StyleName="Header"
        WinTop=0.0364060
        WinHeight=46.0000000
    end object
    Controls[0]=SettingHeader
    // Reference: GUITabControl'XInterface_Decompressed.UT2SettingsPage.SettingTabs'
    begin object name="SettingTabs" class=XInterface_Decompressed.GUITabControl
        bDockPanels=true
        TabHeight=0.0400000
        WinTop=0.2500000
        WinHeight=48.0000000
        bAcceptsInput=true
        OnActivate=SettingTabs.InternalOnActivate
        OnChange=UT2SettingsPage.TabChange
    end object
    Controls[1]=SettingTabs
    // Reference: GUITitleBar'XInterface_Decompressed.UT2SettingsPage.SettingFooter'
    begin object name="SettingFooter" class=XInterface_Decompressed.GUITitleBar
        bUseTextHeight=false
        StyleName="Footer"
        WinTop=0.9300000
        WinLeft=0.1200000
        WinWidth=0.8800000
        WinHeight=0.0550000
    end object
    Controls[2]=SettingFooter
    // Reference: GUIButton'XInterface_Decompressed.UT2SettingsPage.BackButton'
    begin object name="BackButton" class=XInterface_Decompressed.GUIButton
        Caption="Back"
        StyleName="SquareMenuButton"
        Hint="Return to the previous menu."
        WinTop=0.9300000
        WinWidth=0.1200000
        WinHeight=0.0550000
        OnClick=UT2SettingsPage.ButtonClicked
        OnKeyEvent=BackButton.InternalOnKeyEvent
    end object
    Controls[3]=BackButton
    // Reference: GUIImage'XInterface_Decompressed.UT2SettingsPage.LogoSymbol'
    begin object name="LogoSymbol" class=XInterface_Decompressed.GUIImage
        ImageStyle=2
        WinTop=0.8007820
        WinLeft=0.8300790
        WinWidth=0.2600000
        WinHeight=0.1300000
        bVisible=false
    end object
    Controls[4]=LogoSymbol
}