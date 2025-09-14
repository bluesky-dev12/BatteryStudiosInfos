/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2k4Browser_Footer.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:5
 *
 *******************************************************************************/
class UT2k4Browser_Footer extends ButtonFooter
    dependson(ButtonFooter)
    dependson(UT2K4Browser_Page)
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_Status;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify moCheckBox ch_Standard;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUITitleBar t_StatusBar;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Join;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Spectate;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Back;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Refresh;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Filter;
var export editinline UT2k4ServerBrowser p_Anchor;

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x12
    if(GUIButton(Sender) == none)
    {
        return false;
    }
    // End:0x33
    if(Sender == b_Back)
    {
        Controller.CloseMenu(false);
        return true;
    }
    // End:0x53
    if(Sender == b_Join)
    {
        p_Anchor.JoinClicked();
        return true;
    }
    // End:0x73
    if(Sender == b_Spectate)
    {
        p_Anchor.SpectateClicked();
        return true;
    }
    // End:0x93
    if(Sender == b_Refresh)
    {
        p_Anchor.RefreshClicked();
        return true;
    }
    // End:0xb3
    if(Sender == b_Filter)
    {
        p_Anchor.FilterClicked();
        return true;
    }
    return false;
}

function UpdateActiveButtons(UT2K4Browser_Page CurrentPanel)
{
    // End:0x0d
    if(CurrentPanel == none)
    {
        return;
    }
    UpdateButtonState(b_Join, CurrentPanel.IsJoinAvailable(b_Join.Caption));
    UpdateButtonState(b_Refresh, CurrentPanel.IsRefreshAvailable(b_Refresh.Caption));
    UpdateButtonState(b_Spectate, CurrentPanel.IsSpectateAvailable(b_Spectate.Caption));
    UpdateButtonState(b_Filter, CurrentPanel.IsFilterAvailable(b_Filter.Caption));
    // End:0xd8
    if(b_Filter.MenuState == 4)
    {
        ch_Standard.Hide();
    }
    // End:0xe7
    else
    {
        ch_Standard.Show();
    }
}

function UpdateButtonState(GUIButton But, bool Active)
{
    // End:0x17
    if(Active)
    {
        EnableComponent(But);
    }
    // End:0x22
    else
    {
        DisableComponent(But);
    }
}

function PositionButtons(Canvas C)
{
    local bool B;

    B = b_Filter.bVisible;
    b_Filter.bVisible = false;
    super.PositionButtons(C);
    b_Filter.bVisible = B;
    b_Filter.WinLeft = GetMargin();
}

function float GetButtonLeft()
{
    local bool bWasVisible;
    local float Result;

    bWasVisible = b_Filter.bVisible;
    b_Filter.bVisible = false;
    Result = super.GetButtonLeft();
    b_Filter.bVisible = bWasVisible;
    return Result;
}

defaultproperties
{
    begin object name=OnlyStandardCheckBox class=moCheckBox
        CaptionWidth=0.90
        Caption="?? ???"
        OnCreateComponent=InternalOnCreateComponent
        FontScale=0
        Hint="?? ??? ?? ????? ?????. ? ??? ?? ??? ??? ?? ????.."
        WinTop=0.0930730
        WinLeft=0.020
        WinWidth=0.2439450
        WinHeight=0.3082030
        TabOrder=5
        bBoundToParent=true
        bScaleToParent=true
        bStandardized=true
    object end
    // Reference: moCheckBox'UT2k4Browser_Footer.OnlyStandardCheckBox'
    ch_Standard=OnlyStandardCheckBox
    begin object name=BrowserStatus class=GUITitleBar
        bUseTextHeight=true
        Justification=2
        FontScale=0
        WinTop=0.0304950
        WinLeft=0.2389450
        WinWidth=0.7610550
        WinHeight=0.3902340
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUITitleBar'UT2k4Browser_Footer.BrowserStatus'
    t_StatusBar=BrowserStatus
    begin object name=BrowserJoin class=GUIButton
        Caption="??"
        MenuState=4
        StyleName="FooterButton"
        WinTop=0.0856780
        WinLeft=611.0
        WinWidth=124.0
        WinHeight=0.0364820
        RenderWeight=2.0
        TabOrder=2
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4Browser_Footer.BrowserJoin'
    b_Join=BrowserJoin
    begin object name=BrowserSpec class=GUIButton
        Caption="??"
        MenuState=4
        StyleName="FooterButton"
        WinTop=0.0856780
        WinLeft=0.7710940
        WinWidth=0.1146480
        WinHeight=0.0364820
        RenderWeight=2.0
        TabOrder=1
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4Browser_Footer.BrowserSpec'
    b_Spectate=BrowserSpec
    begin object name=BrowserBack class=GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="?? ??? ????"
        WinTop=0.0856780
        WinHeight=0.0364820
        RenderWeight=2.0
        TabOrder=4
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4Browser_Footer.BrowserBack'
    b_Back=BrowserBack
    begin object name=BrowserRefresh class=GUIButton
        Caption="??"
        MenuState=4
        StyleName="FooterButton"
        WinTop=0.0856780
        WinLeft=0.8853520
        WinWidth=0.1146480
        WinHeight=0.0364820
        RenderWeight=2.0
        TabOrder=3
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4Browser_Footer.BrowserRefresh'
    b_Refresh=BrowserRefresh
    begin object name=BrowserFilter class=GUIButton
        Caption="??"
        bAutoSize=true
        StyleName="FooterButton"
        Hint="??? ???? ?????? ????? ?? ? ????."
        WinTop=0.0364820
        WinHeight=0.0364820
        RenderWeight=2.0
        TabOrder=0
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2k4Browser_Footer.BrowserFilter'
    b_Filter=BrowserFilter
    ButtonHeight=0.040
    bFullHeight=true
    Justification=2
    WinTop=0.9369270
    WinHeight=0.0624220
}