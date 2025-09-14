/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4GameFooter.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:8
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4GameFooter extends ButtonFooter
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Primary;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Secondary;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Back;
var() localized string PrimaryCaption;
var() localized string PrimaryHint;
var() localized string SecondaryCaption;
var() localized string SecondaryHint;
var export editinline UT2K4GamePageBase Owner;

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    Owner = UT2K4GamePageBase(MenuOwner);
    b_Primary.__OnClick__Delegate = Owner.InternalOnClick;
    b_Secondary.__OnClick__Delegate = Owner.InternalOnClick;
    b_Back.__OnClick__Delegate = Owner.InternalOnClick;
}

function SetupButtons(optional string bPerButtonSizes)
{
    b_Primary.Caption = PrimaryCaption;
    b_Primary.SetHint(PrimaryHint);
    b_Secondary.Caption = SecondaryCaption;
    b_Secondary.SetHint(SecondaryHint);
    super.SetupButtons(bPerButtonSizes);
}

defaultproperties
{
    begin object name=GamePrimaryButton class=GUIButton
        MenuState=4
        StyleName="FooterButton"
        WinTop=0.9661460
        WinLeft=0.880
        WinWidth=0.120
        WinHeight=0.0332030
        TabOrder=0
        bBoundToParent=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4GameFooter.GamePrimaryButton'
    b_Primary=GamePrimaryButton
    begin object name=GameSecondaryButton class=GUIButton
        MenuState=4
        StyleName="FooterButton"
        WinTop=0.9661460
        WinLeft=0.7581250
        WinWidth=0.120
        WinHeight=0.0332030
        TabOrder=1
        bBoundToParent=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4GameFooter.GameSecondaryButton'
    b_Secondary=GameSecondaryButton
    begin object name=GameBackButton class=GUIButton
        Caption="??"
        StyleName="FooterButton"
        Hint="?? ??? ?????"
        WinTop=0.9661460
        WinWidth=0.120
        WinHeight=0.0332030
        TabOrder=2
        bBoundToParent=true
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4GameFooter.GameBackButton'
    b_Back=GameBackButton
}