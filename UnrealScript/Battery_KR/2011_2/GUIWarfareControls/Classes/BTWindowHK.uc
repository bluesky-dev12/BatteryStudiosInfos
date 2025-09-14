class BTWindowHK extends FloatingWindow
    editinlinenew
    instanced;

var float TimeOut;
var bool bSetTimeOut;
var() automated BTOwnerDrawImageHK BackgroundImage;
var() automated BTOwnerDrawImageHK TopLine;
var() automated BTOwnerDrawImageHK BottomLine;
var() automated BTOwnerDrawImageHK BottomLine2;
var() automated BTOwnerDrawCaptionButtonHK ButtonOK;
var() automated BTOwnerDrawCaptionButtonHK ButtonCancel;
var FloatBox fbBackgroundImage;
var FloatBox fbTopLine;
var FloatBox fbBottomLine;
var FloatBox fbButtonOK;
var FloatBox fbButtonCancel;
var localized string strTitle;
var localized string strOK;
var localized string strCancel;
var bool bHandleEsc;
//var delegate<OnOK> __OnOK__Delegate;
//var delegate<OnCancel> __OnCancel__Delegate;
//var delegate<OnTimeTick> __OnTimeTick__Delegate;
//var delegate<OnTimeOut> __OnTimeOut__Delegate;

delegate bool OnOK(GUIComponent Sender)
{
    FadeOut(false, true);
    return true;
    //return;    
}

delegate bool OnCancel(GUIComponent Sender)
{
    FadeOut(false, true);
    return true;
    //return;    
}

function bool DefaultCloseWindow_OnOK(GUIComponent Sender)
{
    FadeOut(false, true);
    return true;
    //return;    
}

function UpdateDefaultWindow()
{
    BackgroundImage.AWinPos = fbBackgroundImage;
    TopLine.AWinPos = fbTopLine;
    BottomLine.AWinPos = fbBottomLine;
    ButtonOK.AWinPos = fbButtonOK;
    ButtonCancel.AWinPos = fbButtonCancel;
    BackgroundImage.ApplyAWinPos();
    TopLine.ApplyAWinPos();
    BottomLine.ApplyAWinPos();
    ButtonOK.ApplyAWinPos();
    ButtonCancel.ApplyAWinPos();
    TopLine.Caption = strTitle;
    ButtonOK.Caption = strOK;
    ButtonCancel.Caption = strCancel;
    //return;    
}

function SetContentOffset(int nOffsetX, int nOffsetY)
{
    local int i;

    i = 0;
    J0x07:

    // End:0xBE [Loop If]
    if(i < Controls.Length)
    {
        Controls[i].AWinPos.X1 += float(nOffsetX);
        Controls[i].AWinPos.X2 += float(nOffsetX);
        Controls[i].AWinPos.Y1 += float(nOffsetY);
        Controls[i].AWinPos.Y2 += float(nOffsetY);
        Controls[i].TraversalApplyAWinPos();
        ++i;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

function SetTitleCaption(string S)
{
    TopLine.Caption = S;
    //return;    
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    BackgroundImage = NewLabelComponent(fbBackgroundImage, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.panel_3, 0.0100000);
    TopLine = NewLabelComponent(fbTopLine, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_ptitl_back, 0.1000000);
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 5;
    i = 0;
    J0x83:

    // End:0xB0 [Loop If]
    if(i < 5)
    {
        TopLine.FontSize[i] = 11;
        i++;
        // [Loop Continue]
        goto J0x83;
    }
    BottomLine = NewLabelComponent(fbBottomLine, Class'GUIWarfareControls_Decompressed.BTUIResourcePoolHK'.default.img_pup_sau, 0.1000000);
    ButtonOK = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonOK.bUseAWinPos = true;
    ButtonOK.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(391.0000000, 491.0000000, 509.0000000, 522.0000000);
    ButtonOK.SetDefaultButtonImage();
    ButtonOK.SetDefaultFontColor();
    ButtonOK.SetFontSizeAll(11);
    ButtonOK.Caption = "OK";
    ButtonOK.__OnClick__Delegate = ButtonOK_OnClick;
    ButtonOK.OnClickSound = 0;
    ButtonOK.InitComponent(MyController, self);
    AppendComponent(ButtonOK);
    ButtonCancel = new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK';
    ButtonCancel.bUseAWinPos = true;
    ButtonCancel.AWinPos = Class'Engine.BTCustomDrawHK'.static.MakeFloatBox(515.0000000, 491.0000000, 633.0000000, 522.0000000);
    ButtonCancel.SetDefaultButtonImage();
    ButtonCancel.SetDefaultFontColor();
    ButtonCancel.SetFontSizeAll(11);
    ButtonCancel.Caption = "Cancel";
    ButtonCancel.__OnClick__Delegate = ButtonCancel_OnClick;
    ButtonCancel.OnClickSound = 0;
    ButtonCancel.InitComponent(MyController, self);
    AppendComponent(ButtonCancel);
    UpdateDefaultWindow();
    //return;    
}

event Opened(GUIComponent Sender)
{
    self.CurFadeTime = 1.0000000;
    super(PopupPageBase).Opened(Sender);
    PlayerOwner().ClientPlaySound(Sound'Warfare_Sound_UI.Window.ui_window_open',,, 6);
    //return;    
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    PlayerOwner().ClientPlaySound(Sound'Warfare_Sound_UI.Window.ui_window_close',,, 6);
    //return;    
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    return OnOK(self);
    //return;    
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    return OnCancel(self);
    //return;    
}

function BTOwnerDrawImageHK NewLabelComponent(FloatBox fbNewCompo, Image bgImg, optional float RenderWeight)
{
    local export editinline BTOwnerDrawImageHK Label;

    Label = BTOwnerDrawImageHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawImageHK', fbNewCompo, RenderWeight));
    Label.BackgroundImage = bgImg;
    return Label;
    //return;    
}

function BTOwnerDrawCaptionButtonHK NewButtonComponent(FloatBox fbNewCompo, optional float RenderWeight)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(NewComponent(new Class'GUIWarfareControls_Decompressed.BTOwnerDrawCaptionButtonHK', fbNewCompo, RenderWeight));
    return btn;
    //return;    
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local Interactions.EInputKey iKey;

    iKey = key;
    // End:0x20
    if(int(iKey) == int(13))
    {
        return true;        
    }
    else
    {
        // End:0x32
        if(int(iKey) == int(27))
        {
            return true;
        }
    }
    return false;
    //return;    
}

delegate OnTimeTick(float leftime)
{
    //return;    
}

delegate OnTimeOut(GUIComponent Sender)
{
    //return;    
}

function DefaultCloseWindow_OnTimeOut(GUIComponent Sender)
{
    FadeOut(false, true);
    //return;    
}

function StartTimeOut(float SetTime)
{
    TimeOut = SetTime;
    //return;    
}

function StopTimeOut(optional float SetTime)
{
    TimeOut = SetTime;
    //return;    
}

function bool TimeOutPreDraw(Canvas C)
{
    local float Delta;

    FloatingPreDraw(C);
    // End:0x89
    if(TimeOut > float(0))
    {
        Delta = Controller.RenderDelta;
        // End:0x44
        if(Delta <= float(0))
        {
            Delta = 1.0000000;
        }
        TimeOut -= Delta;
        // End:0x7A
        if(TimeOut <= float(0))
        {
            OnTimeTick(0.0000000);
            OnTimeOut(self);            
        }
        else
        {
            OnTimeTick(TimeOut);
        }
    }
    return true;
    //return;    
}

static function CloseWindowAllByName(GUIController Controller, name WindowName)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x76 [Loop If]
    if(i < Controller.MenuStack.Length)
    {
        // End:0x6C
        if(Controller.MenuStack[i].Name == WindowName)
        {
            BTWindowHK(Controller.MenuStack[i]).FadeOut(false, true);
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    //return;    
}

defaultproperties
{
    strTitle="???"
    strOK="??"
    strCancel="??"
    OnTimeOut=BTWindowHK.DefaultCloseWindow_OnTimeOut
    // Reference: GUIHeader'GUIWarfareControls_Decompressed.BTWindowHK.TitleBar'
    begin object name="TitleBar" class=XInterface.GUIHeader
        bUseTextHeight=true
        WinWidth=0.0000000
        WinHeight=0.0000000
        RenderWeight=0.0000000
        bBoundToParent=true
        bScaleToParent=true
    end object
    t_WindowTitle=TitleBar
    bUseTranslate=true
    i_FrameBG=none
    OnPreDraw=BTWindowHK.TimeOutPreDraw
    OnKeyEvent=BTWindowHK.InternalOnKeyEvent
}