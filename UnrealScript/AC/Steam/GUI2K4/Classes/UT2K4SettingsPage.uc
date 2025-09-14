/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SettingsPage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:10
 *	Functions:10
 *
 *******************************************************************************/
class UT2K4SettingsPage extends UT2k4MainPage
    dependson(UT2k4MainPage)
    dependson(Settings_Tabs)
    dependson(UT2K4Tab_GameSettings)
    config(User)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Back;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Apply;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Reset;
var() config bool bApplyImmediately;
var export editinline UT2K4Tab_GameSettings tp_Game;
var() editconst noexport float SavedPitch;
var() string PageCaption;
var() export editinline GUIButton SizingButton;
var() export editinline Settings_Tabs ActivePanel;
var localized string InvalidStats;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local Rotator PlayerRot;
    local int i;

    super.InitComponent(MyController, myOwner);
    PageCaption = t_Header.Caption;
    GetSizingButton();
    PlayerRot = PlayerOwner().Rotation;
    SavedPitch = float(PlayerRot.Pitch);
    PlayerRot.Pitch = 0;
    PlayerRot.Roll = 0;
    PlayerOwner().SetRotation(PlayerRot);
    i = 0;
    J0x7c:
    // End:0x127 [While If]
    if(i < PanelCaption.Length && i < PanelClass.Length && i < PanelHint.Length)
    {
        Profile("Settings_" $ PanelCaption[i]);
        c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i]);
        Profile("Settings_" $ PanelCaption[i]);
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x7c;
    }
    tp_Game = UT2K4Tab_GameSettings(c_Tabs.BorrowPanel(PanelCaption[3]));
}

function GetSizingButton()
{
    local int i;

    SizingButton = none;
    i = 0;
    J0x0e:
    // End:0x94 [While If]
    if(i < Components.Length)
    {
        // End:0x37
        if(GUIButton(Components[i]) == none)
        {
        }
        // End:0x8a
        else
        {
            // End:0x8a
            if(SizingButton == none || Len(GUIButton(Components[i]).Caption) > Len(SizingButton.Caption))
            {
                SizingButton = GUIButton(Components[i]);
            }
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x0e;
    }
}

function bool InternalOnPreDraw(Canvas Canvas)
{
    local int X, i;
    local float XL, YL;

    // End:0x0d
    if(SizingButton == none)
    {
        return false;
    }
    SizingButton.Style.TextSize(Canvas, SizingButton.MenuState, SizingButton.Caption, XL, YL, SizingButton.FontScale);
    XL += float(32);
    X = int(Canvas.ClipX - XL);
    i = Components.Length - 1;
    J0x95:
    // End:0x107 [While If]
    if(i >= 0)
    {
        // End:0xb9
        if(GUIButton(Components[i]) == none)
        {
        }
        // End:0xfd
        else
        {
            Components[i].WinWidth = XL;
            Components[i].WinLeft = float(X);
            X -= int(XL);
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x95;
    }
    return false;
}

function bool InternalOnCanClose(optional bool bCanceled)
{
    // End:0x8b
    if(Controller.ActivePage == self && !tp_Game.ValidStatConfig())
    {
        c_Tabs.ActivateTabByPanel(tp_Game, true);
        Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", InvalidStats, tp_Game.l_Warning.Caption);
        return false;
    }
    return true;
}

function InternalOnClose(optional bool bCanceled)
{
    local Rotator NewRot;

    NewRot = PlayerOwner().Rotation;
    NewRot.Pitch = int(SavedPitch);
    PlayerOwner().SetRotation(NewRot);
    OnClose(bCanceled);
}

function InternalOnChange(GUIComponent Sender)
{
    super.InternalOnChange(Sender);
    // End:0x29
    if(c_Tabs.ActiveTab == none)
    {
        ActivePanel = none;
    }
    // End:0x4b
    else
    {
        ActivePanel = Settings_Tabs(c_Tabs.ActiveTab.MyPanel);
    }
}

function BackButtonClicked()
{
    // End:0x36
    if(InternalOnCanClose(false))
    {
        c_Tabs.ActiveTab.OnDeActivate();
        Controller.CloseMenu(false);
    }
}

function DefaultsButtonClicked()
{
    ActivePanel.ResetClicked();
}

function bool ButtonClicked(GUIComponent Sender)
{
    ActivePanel.AcceptClicked();
    return true;
}

event bool NotifyLevelChange()
{
    bPersistent = false;
    LevelChanged();
    return true;
}

defaultproperties
{
    bApplyImmediately=true
    InvalidStats="??? ?? ??"
    begin object name=SettingHeader class=GUIHeader
        Caption="??"
        RenderWeight=0.30
    object end
    // Reference: GUIHeader'UT2K4SettingsPage.SettingHeader'
    t_Header=SettingHeader
    begin object name=SettingFooter class=UT2K4Settings_Footer
        RenderWeight=0.30
        TabOrder=4
        OnPreDraw=InternalOnPreDraw
    object end
    // Reference: UT2K4Settings_Footer'UT2K4SettingsPage.SettingFooter'
    t_Footer=SettingFooter
    PanelClass=// Object reference not set to an instance of an object.
    
    PanelCaption=// Object reference not set to an instance of an object.
    
    PanelHint=// Object reference not set to an instance of an object.
    
    OnClose=InternalOnClose
    OnCanClose=InternalOnCanClose
    OnPreDraw=InternalOnPreDraw
}