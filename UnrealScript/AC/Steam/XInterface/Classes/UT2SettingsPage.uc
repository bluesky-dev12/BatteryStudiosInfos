/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2SettingsPage.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:23
 *	Functions:8
 *
 *******************************************************************************/
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
}

function TabChange(GUIComponent Sender)
{
    // End:0x12
    if(GUITabButton(Sender) == none)
    {
        return;
    }
    GUITitleBar(Controls[0]).SetCaption(GUITitleBar(default.Controls[0]).GetCaption() @ "|" @ GUITabButton(Sender).Caption);
}

event ChangeHint(string NewHint)
{
    GUITitleBar(Controls[2]).SetCaption(NewHint);
}

function InternalOnReOpen()
{
    local export editinline GUITabControl TabC;

    TabC = GUITabControl(Controls[1]);
    // End:0x66
    if(TabC.ActiveTab != none && TabC.ActiveTab.MyPanel != none)
    {
        TabC.ActiveTab.MyPanel.Refresh();
    }
}

function bool ButtonClicked(GUIComponent Sender)
{
    // End:0x3d
    if(InternalOnCanClose(false))
    {
        GUITabControl(Controls[1]).ActiveTab.OnDeActivate();
        Controller.CloseMenu(true);
    }
    return true;
}

function bool InternalOnCanClose(optional bool bCanceled)
{
    return true;
}

function bool NotifyLevelChange()
{
    Controller.CloseMenu(true);
    return super(GUIPage).NotifyLevelChange();
}

function InternalOnClose(optional bool bCanceled)
{
    local Rotator NewRot;

    NewRot = PlayerOwner().Rotation;
    NewRot.Pitch = int(SavedPitch);
    PlayerOwner().SetRotation(NewRot);
    OnClose(bCanceled);
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
    OnReOpen=InternalOnReOpen
    OnClose=InternalOnClose
    OnCanClose=InternalOnCanClose
    Controls=// Object reference not set to an instance of an object.
    
}