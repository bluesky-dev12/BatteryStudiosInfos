/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:21
 *	Functions:21
 *
 *******************************************************************************/
class BTWindowHK extends FloatingWindow
    editinlinenew
    instanced;

var float TimeOut;
var bool bSetTimeOut;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK BackgroundImage;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK TopLine;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK BottomLine;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawImageHK BottomLine2;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawCaptionButtonHK ButtonOK;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTOwnerDrawCaptionButtonHK ButtonCancel;
var FloatBox fbBackgroundImage;
var FloatBox fbTopLine;
var FloatBox fbBottomLine;
var FloatBox fbButtonOK;
var FloatBox fbButtonCancel;
var localized string strTitle;
var localized string strOK;
var localized string strCancel;
var bool bHandleEsc;
var delegate<OnOK> __OnOK__Delegate;
var delegate<OnCancel> __OnCancel__Delegate;
var delegate<OnTimeTick> __OnTimeTick__Delegate;
var delegate<OnTimeOut> __OnTimeOut__Delegate;

delegate bool OnOK(GUIComponent Sender)
{
    FadeOut(false, true);
    return true;
}

delegate bool OnCancel(GUIComponent Sender)
{
    FadeOut(false, true);
    return true;
}

function bool DefaultCloseWindow_OnOK(GUIComponent Sender)
{
    FadeOut(false, true);
    return true;
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
}

function SetContentOffset(int nOffsetX, int nOffsetY)
{
    local int i;

    i = 0;
    J0x07:
    // End:0xbe [While If]
    if(i < Controls.Length)
    {
        Controls[i].AWinPos.X1 += float(nOffsetX);
        Controls[i].AWinPos.X2 += float(nOffsetX);
        Controls[i].AWinPos.Y1 += float(nOffsetY);
        Controls[i].AWinPos.Y2 += float(nOffsetY);
        Controls[i].TraversalApplyAWinPos();
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

function SetTitleCaption(string S)
{
    TopLine.Caption = S;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    BackgroundImage = NewLabelComponent(fbBackgroundImage, class'BTUIResourcePoolHK'.default.panel_3, 0.010);
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.panel_3;
    TopLine = NewLabelComponent(fbTopLine, class'BTUIResourcePoolHK'.default.img_ptitl_back, 0.10);
    TopLine.CaptionDrawType = 3;
    TopLine.CaptionPadding[0] = 5;
    i = 0;
    J0xa0:
    // End:0xcd [While If]
    if(i < 5)
    {
        TopLine.FontSize[i] = 11;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xa0;
    }
    BottomLine = NewLabelComponent(fbBottomLine, class'BTUIResourcePoolHK'.default.img_pup_sau, 0.10);
    ButtonOK = new class'BTOwnerDrawCaptionButtonHK';
    ButtonOK.bUseAWinPos = true;
    ButtonOK.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(391.0, 491.0, 509.0, 522.0);
    ButtonOK.SetDefaultButtonImage();
    ButtonOK.SetDefaultFontColor();
    ButtonOK.SetFontSizeAll(11);
    ButtonOK.CaptionDrawType = 4;
    ButtonOK.Caption = "OK";
    ButtonOK.__OnClick__Delegate = ButtonOK_OnClick;
    ButtonOK.OnClickSound = 0;
    ButtonOK.InitComponent(MyController, self);
    AppendComponent(ButtonOK);
    ButtonCancel = new class'BTOwnerDrawCaptionButtonHK';
    ButtonCancel.bUseAWinPos = true;
    ButtonCancel.AWinPos = class'BTCustomDrawHK'.static.MakeFloatBox(515.0, 491.0, 633.0, 522.0);
    ButtonCancel.SetDefaultButtonImage();
    ButtonCancel.SetDefaultFontColor();
    ButtonCancel.SetFontSizeAll(11);
    ButtonCancel.CaptionDrawType = 4;
    ButtonCancel.Caption = "Cancel";
    ButtonCancel.__OnClick__Delegate = ButtonCancel_OnClick;
    ButtonCancel.OnClickSound = 0;
    ButtonCancel.InitComponent(MyController, self);
    AppendComponent(ButtonCancel);
    UpdateDefaultWindow();
}

event Opened(GUIComponent Sender)
{
    self.CurFadeTime = 1.0;
    super(PopupPageBase).Opened(Sender);
    PlayerOwner().ClientPlaySound(sound'ui_window_open',,, 6);
}

function Closed(GUIComponent Sender, bool bCancelled)
{
    super(GUIPage).Closed(Sender, bCancelled);
    PlayerOwner().ClientPlaySound(sound'ui_window_close',,, 6);
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    return OnOK(self);
}

function bool ButtonCancel_OnClick(GUIComponent Sender)
{
    return OnCancel(self);
}

function BTOwnerDrawImageHK NewLabelComponent(FloatBox fbNewCompo, Image bgImg, optional float RenderWeight)
{
    local export editinline BTOwnerDrawImageHK Label;

    Label = BTOwnerDrawImageHK(NewComponent(new class'BTOwnerDrawImageHK', fbNewCompo, RenderWeight));
    Label.BackgroundImage = bgImg;
    return Label;
}

function BTOwnerDrawCaptionButtonHK NewButtonComponent(FloatBox fbNewCompo, optional float RenderWeight)
{
    local export editinline BTOwnerDrawCaptionButtonHK btn;

    btn = BTOwnerDrawCaptionButtonHK(NewComponent(new class'BTOwnerDrawCaptionButtonHK', fbNewCompo, RenderWeight));
    return btn;
}

function bool InternalOnKeyEvent(out byte key, out byte State, float Delta)
{
    local Engine.Interactions.EInputKey iKey;

    iKey = key;
    // End:0x20
    if(iKey == 13)
    {
        return true;
    }
    // End:0x32
    else
    {
        // End:0x32
        if(iKey == 27)
        {
            return true;
        }
    }
    return false;
}

delegate OnTimeTick(float leftime);
delegate OnTimeOut(GUIComponent Sender);
function DefaultCloseWindow_OnTimeOut(GUIComponent Sender)
{
    FadeOut(false, true);
}

function StartTimeOut(float SetTime)
{
    TimeOut = SetTime;
}

function StopTimeOut(optional float SetTime)
{
    TimeOut = SetTime;
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
            Delta = 1.0;
        }
        TimeOut -= Delta;
        // End:0x7a
        if(TimeOut <= float(0))
        {
            OnTimeTick(0.0);
            OnTimeOut(self);
        }
        // End:0x89
        else
        {
            OnTimeTick(TimeOut);
        }
    }
    return true;
}

static function CloseWindowAllByName(GUIController Controller, Class WindowName)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x76 [While If]
    if(i < Controller.MenuStack.Length)
    {
        // End:0x6c
        if(Controller.MenuStack[i].Class == WindowName)
        {
            BTWindowHK(Controller.MenuStack[i]).FadeOut(false, true);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
}

defaultproperties
{
    strTitle="Title"
    strOK="OK"
    strCancel="Cancel"
    OnTimeOut=DefaultCloseWindow_OnTimeOut
    begin object name=TitleBar class=GUIHeader
        bUseTextHeight=true
        WinWidth=0.0
        WinHeight=0.0
        RenderWeight=0.0
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIHeader'BTWindowHK.TitleBar'
    t_WindowTitle=TitleBar
    bUseTranslate=true
    i_FrameBG=none
    OnPreDraw=TimeOutPreDraw
    OnKeyEvent=InternalOnKeyEvent
}