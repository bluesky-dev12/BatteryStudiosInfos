class UT2k4Browser_Footer extends ButtonFooter
    editinlinenew
    instanced;

var() automated GUIImage i_Status;
var() automated moCheckBox ch_Standard;
var() automated GUITitleBar t_StatusBar;
var() automated GUIButton b_Join;
var() automated GUIButton b_Spectate;
var() automated GUIButton b_Back;
var() automated GUIButton b_Refresh;
var() automated GUIButton b_Filter;
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
    // End:0xB3
    if(Sender == b_Filter)
    {
        p_Anchor.FilterClicked();
        return true;
    }
    return false;
    //return;    
}

function UpdateActiveButtons(UT2K4Browser_Page CurrentPanel)
{
    // End:0x0D
    if(CurrentPanel == none)
    {
        return;
    }
    UpdateButtonState(b_Join, CurrentPanel.IsJoinAvailable(b_Join.Caption));
    UpdateButtonState(b_Refresh, CurrentPanel.IsRefreshAvailable(b_Refresh.Caption));
    UpdateButtonState(b_Spectate, CurrentPanel.IsSpectateAvailable(b_Spectate.Caption));
    UpdateButtonState(b_Filter, CurrentPanel.IsFilterAvailable(b_Filter.Caption));
    // End:0xD8
    if(int(b_Filter.MenuState) == int(4))
    {
        ch_Standard.Hide();        
    }
    else
    {
        ch_Standard.Show();
    }
    //return;    
}

function UpdateButtonState(GUIButton But, bool Active)
{
    // End:0x17
    if(Active)
    {
        EnableComponent(But);        
    }
    else
    {
        DisableComponent(But);
    }
    //return;    
}

function PositionButtons(Canvas C)
{
    local bool B;

    B = b_Filter.bVisible;
    b_Filter.bVisible = false;
    super.PositionButtons(C);
    b_Filter.bVisible = B;
    b_Filter.WinLeft = GetMargin();
    //return;    
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
    //return;    
}

defaultproperties
{
    // Reference: moCheckBox'GUI2K4_Decompressed.UT2k4Browser_Footer.OnlyStandardCheckBox'
    begin object name="OnlyStandardCheckBox" class=XInterface.moCheckBox
        CaptionWidth=0.9000000
        Caption="?? ???"
        OnCreateComponent=OnlyStandardCheckBox.InternalOnCreateComponent
        FontScale=0
        Hint="?? ??? ?? ????? ?????. ? ??? ?? ??? ??? ?? ????.."
        WinTop=0.0930730
        WinLeft=0.0200000
        WinWidth=0.2439450
        WinHeight=0.3082030
        TabOrder=5
        bBoundToParent=true
        bScaleToParent=true
        bStandardized=false
    end object
    ch_Standard=OnlyStandardCheckBox
    // Reference: GUITitleBar'GUI2K4_Decompressed.UT2k4Browser_Footer.BrowserStatus'
    begin object name="BrowserStatus" class=XInterface.GUITitleBar
        bUseTextHeight=false
        Justification=2
        FontScale=0
        WinTop=0.0304950
        WinLeft=0.2389450
        WinWidth=0.7610550
        WinHeight=0.3902340
        bBoundToParent=true
        bScaleToParent=true
    end object
    t_StatusBar=BrowserStatus
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4Browser_Footer.BrowserJoin'
    begin object name="BrowserJoin" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        StyleName="FooterButton"
        WinTop=0.0856780
        WinLeft=611.0000000
        WinWidth=124.0000000
        WinHeight=0.0364820
        RenderWeight=2.0000000
        TabOrder=2
        bBoundToParent=true
        OnClick=UT2k4Browser_Footer.InternalOnClick
        OnKeyEvent=BrowserJoin.InternalOnKeyEvent
    end object
    b_Join=BrowserJoin
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4Browser_Footer.BrowserSpec'
    begin object name="BrowserSpec" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        StyleName="FooterButton"
        WinTop=0.0856780
        WinLeft=0.7710940
        WinWidth=0.1146480
        WinHeight=0.0364820
        RenderWeight=2.0000000
        TabOrder=1
        bBoundToParent=true
        OnClick=UT2k4Browser_Footer.InternalOnClick
        OnKeyEvent=BrowserSpec.InternalOnKeyEvent
    end object
    b_Spectate=BrowserSpec
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4Browser_Footer.BrowserBack'
    begin object name="BrowserBack" class=XInterface.GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="?? ??? ????"
        WinTop=0.0856780
        WinHeight=0.0364820
        RenderWeight=2.0000000
        TabOrder=4
        bBoundToParent=true
        OnClick=UT2k4Browser_Footer.InternalOnClick
        OnKeyEvent=BrowserBack.InternalOnKeyEvent
    end object
    b_Back=BrowserBack
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4Browser_Footer.BrowserRefresh'
    begin object name="BrowserRefresh" class=XInterface.GUIButton
        Caption="??"
        MenuState=4
        StyleName="FooterButton"
        WinTop=0.0856780
        WinLeft=0.8853520
        WinWidth=0.1146480
        WinHeight=0.0364820
        RenderWeight=2.0000000
        TabOrder=3
        bBoundToParent=true
        OnClick=UT2k4Browser_Footer.InternalOnClick
        OnKeyEvent=BrowserRefresh.InternalOnKeyEvent
    end object
    b_Refresh=BrowserRefresh
    // Reference: GUIButton'GUI2K4_Decompressed.UT2k4Browser_Footer.BrowserFilter'
    begin object name="BrowserFilter" class=XInterface.GUIButton
        Caption="??"
        bAutoSize=true
        StyleName="FooterButton"
        Hint="??? ???? ?????? ????? ?? ? ????."
        WinTop=0.0364820
        WinHeight=0.0364820
        RenderWeight=2.0000000
        TabOrder=0
        bBoundToParent=true
        OnClick=UT2k4Browser_Footer.InternalOnClick
        OnKeyEvent=BrowserFilter.InternalOnKeyEvent
    end object
    b_Filter=BrowserFilter
    ButtonHeight=0.0400000
    bFullHeight=false
    Justification=2
    WinTop=0.9369270
    WinHeight=0.0624220
}