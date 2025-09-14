class UT2K4SettingsPage extends UT2k4MainPage
    config(User)
    editinlinenew
    instanced;

var() automated GUIButton b_Back;
var() automated GUIButton b_Apply;
var() automated GUIButton b_Reset;
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
    J0x7C:

    // End:0x127 [Loop If]
    if(((i < PanelCaption.Length) && i < PanelClass.Length) && i < PanelHint.Length)
    {
        Profile("Settings_" $ PanelCaption[i]);
        c_Tabs.AddTab(PanelCaption[i], PanelClass[i],, PanelHint[i]);
        Profile("Settings_" $ PanelCaption[i]);
        i++;
        // [Loop Continue]
        goto J0x7C;
    }
    tp_Game = UT2K4Tab_GameSettings(c_Tabs.BorrowPanel(PanelCaption[3]));
    //return;    
}

function GetSizingButton()
{
    local int i;

    SizingButton = none;
    i = 0;
    J0x0E:

    // End:0x94 [Loop If]
    if(i < Components.Length)
    {
        // End:0x37
        if(GUIButton(Components[i]) == none)
        {
            // [Explicit Continue]
            goto J0x8A;
        }
        // End:0x8A
        if((SizingButton == none) || Len(GUIButton(Components[i]).Caption) > Len(SizingButton.Caption))
        {
            SizingButton = GUIButton(Components[i]);
        }
        J0x8A:

        i++;
        // [Loop Continue]
        goto J0x0E;
    }
    //return;    
}

function bool InternalOnPreDraw(Canvas Canvas)
{
    local int X, i;
    local float XL, YL;

    // End:0x0D
    if(SizingButton == none)
    {
        return false;
    }
    SizingButton.Style.TextSize(Canvas, SizingButton.MenuState, SizingButton.Caption, XL, YL, SizingButton.FontScale);
    XL += float(32);
    X = int(Canvas.ClipX - XL);
    i = Components.Length - 1;
    J0x95:

    // End:0x107 [Loop If]
    if(i >= 0)
    {
        // End:0xB9
        if(GUIButton(Components[i]) == none)
        {
            // [Explicit Continue]
            goto J0xFD;
        }
        Components[i].WinWidth = XL;
        Components[i].WinLeft = float(X);
        X -= int(XL);
        J0xFD:

        i--;
        // [Loop Continue]
        goto J0x95;
    }
    return false;
    //return;    
}

function bool InternalOnCanClose(optional bool bCanceled)
{
    // End:0x8B
    if((Controller.ActivePage == self) && !tp_Game.ValidStatConfig())
    {
        c_Tabs.ActivateTabByPanel(tp_Game, true);
        Controller.OpenMenu("GUI2K4.UT2K4GenericMessageBox", InvalidStats, tp_Game.l_Warning.Caption);
        return false;
    }
    return true;
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

function InternalOnChange(GUIComponent Sender)
{
    super.InternalOnChange(Sender);
    // End:0x29
    if(c_Tabs.ActiveTab == none)
    {
        ActivePanel = none;        
    }
    else
    {
        ActivePanel = Settings_Tabs(c_Tabs.ActiveTab.MyPanel);
    }
    //return;    
}

function BackButtonClicked()
{
    // End:0x36
    if(InternalOnCanClose(false))
    {
        c_Tabs.ActiveTab.OnDeActivate();
        Controller.CloseMenu(false);
    }
    //return;    
}

function DefaultsButtonClicked()
{
    ActivePanel.ResetClicked();
    //return;    
}

function bool ButtonClicked(GUIComponent Sender)
{
    ActivePanel.AcceptClicked();
    return true;
    //return;    
}

event bool NotifyLevelChange()
{
    bPersistent = false;
    LevelChanged();
    return true;
    //return;    
}

defaultproperties
{
    bApplyImmediately=true
    InvalidStats="??? ?? ??"
    // Reference: GUIHeader'GUI2K4_Decompressed.UT2K4SettingsPage.SettingHeader'
    begin object name="SettingHeader" class=XInterface.GUIHeader
        Caption="??"
        RenderWeight=0.3000000
    end object
    t_Header=SettingHeader
    // Reference: UT2K4Settings_Footer'GUI2K4_Decompressed.UT2K4SettingsPage.SettingFooter'
    begin object name="SettingFooter" class=GUI2K4_Decompressed.UT2K4Settings_Footer
        RenderWeight=0.3000000
        TabOrder=4
        OnPreDraw=SettingFooter.InternalOnPreDraw
    end object
    t_Footer=SettingFooter
    PanelClass[0]="GUI2K4.UT2K4Tab_DetailSettings"
    PanelClass[1]="GUI2K4.UT2K4Tab_AudioSettings"
    PanelClass[2]="GUI2K4.UT2K4Tab_PlayerSettings"
    PanelClass[3]="GUI2K4.UT2K4Tab_GameSettings"
    PanelClass[4]="GUI2K4.UT2K4Tab_IForceSettings"
    PanelClass[5]="GUI2K4.UT2K4Tab_WeaponPref"
    PanelClass[6]="GUI2K4.UT2K4Tab_HudSettings"
    PanelCaption[0]="?????"
    PanelCaption[1]="???"
    PanelCaption[2]="????"
    PanelCaption[3]="??"
    PanelCaption[4]="??"
    PanelCaption[5]="??"
    PanelCaption[6]="Hud"
    PanelHint[0]="???? ????? ?????? ?? ?? ??? ?????..."
    PanelHint[1]="???? ?????..."
    PanelHint[2]="??? UT2004 ???? ?????..."
    PanelHint[3]="??? ???? ?? ??..."
    PanelHint[4]="??? ?? ?? ?? ??..."
    PanelHint[5]="?? ???? ??? ?????..."
    PanelHint[6]="Hud ??? ?????..."
    OnClose=UT2K4SettingsPage.InternalOnClose
    OnCanClose=UT2K4SettingsPage.InternalOnCanClose
    OnPreDraw=UT2K4SettingsPage.InternalOnPreDraw
}