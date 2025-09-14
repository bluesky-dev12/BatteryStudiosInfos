/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTWindowHelpHK.uc
 * Package Imports:
 *	GUIWarfareControls
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class BTWindowHelpHK extends BTWindowHK
    editinlinenew
    instanced;

var bool bShowState;
var localized string strHelp;
var export editinline BTOwnerDrawImageHK LabelWebBack;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    ButtonCancel.SetVisibility(false);
    BottomLine.SetVisibility(false);
    TopLine.Caption = strHelp;
    TopLine.CaptionPadding[0] = 14;
    TopLine.BackgroundImage = class'BTUIResourcePoolHK'.default.help_top;
    BackgroundImage.BackgroundImage = class'BTUIResourcePoolHK'.default.help_back;
    ButtonOK.buttonImage[0] = class'BTUIResourcePoolHK'.default.help_btn_n;
    ButtonOK.buttonImage[1] = class'BTUIResourcePoolHK'.default.help_btn_on;
    ButtonOK.buttonImage[2] = class'BTUIResourcePoolHK'.default.help_btn_n;
    ButtonOK.buttonImage[3] = class'BTUIResourcePoolHK'.default.help_btn_cli;
    ButtonOK.Caption = "";
    ButtonOK.__OnClick__Delegate = ButtonOK_OnClick;
    LabelWebBack = NewLabelComponent(class'BTCustomDrawHK'.static.MakeFloatBox(22.0, 110.0, 1002.0, 722.0), class'BTUIResourcePoolHK'.default.help_back_web);
    LabelWebBack.Caption = "";
    bShowState = true;
    __OnFadeEnd__Delegate = BTWindowHelpHK_OnFadeEnd;
}

function BTWindowHelpHK_OnFadeEnd()
{
    // End:0x28
    if(bShowState)
    {
        PlayerOwner().ConsoleCommand("openweb");
        bShowState = false;
    }
}

function bool ButtonOK_OnClick(GUIComponent Sender)
{
    ButtonOK.DisableMe();
    PlayerOwner().ConsoleCommand("closeweb");
    DefaultCloseWindow_OnOK(none);
}

defaultproperties
{
    fbBackgroundImage=(X1=8.0,Y1=97.0,X2=1020.0,Y2=740.0)
    fbTopLine=(X1=8.0,Y1=65.0,X2=1020.0,Y2=98.0)
    fbButtonOK=(X1=983.0,Y1=74.0,X2=1001.0,Y2=91.0)
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    DefaultLeft=0.10
    bSetControlsBoundToParent=true
    bSetControlsScaleToParent=true
    bUseChangeAlpha=true
    bUseTranslate=true
    WinTop=0.250
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.40
}