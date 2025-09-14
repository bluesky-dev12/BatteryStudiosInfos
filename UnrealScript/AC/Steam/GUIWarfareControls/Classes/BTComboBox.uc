/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUIWarfareControls\Classes\BTComboBox.uc
 * Package Imports:
 *	GUIWarfareControls
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:6
 *	Functions:4
 *
 *******************************************************************************/
class BTComboBox extends GUIPanel
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify BTInputImage Border;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIComboBox ComboBox;
var float MarginL;
var float MarginR;
var float MarginT;
var float MarginB;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super.InitComponent(MyController, myOwner);
    PositionControls();
}

function PositionControls()
{
    Border.WinLeft = WinLeft;
    Border.WinTop = WinTop;
    Border.WinWidth = WinWidth;
    Border.WinHeight = WinHeight;
}

function bool InternalPreDraw(Canvas C)
{
    PositionControls();
    ComboBox.WinLeft = Border.WinLeft + MarginL / C.ClipX;
    ComboBox.WinTop = Border.WinTop + MarginT / C.ClipY;
    ComboBox.WinWidth = Border.WinWidth - MarginL + MarginR / C.ClipX;
    ComboBox.WinHeight = Border.WinHeight - MarginT + MarginB / C.ClipY;
    return false;
}

function InternalOnChange(GUIComponent Sender)
{
    OnChange(self);
}

defaultproperties
{
    Border=mBorder
    begin object name=mComboBox class=GUIComboBox
        WinTop=0.4609380
        WinLeft=0.2724610
        WinWidth=0.2460940
        WinHeight=0.0208330
        OnChange=InternalOnChange
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIComboBox'BTComboBox.mComboBox'
    ComboBox=mComboBox
    MarginL=3.0
    MarginR=3.0
    MarginT=4.0
    MarginB=4.0
    SetControlsBoundToParent=true
    SetControlsScaleToParent=true
    WinTop=0.4557290
    WinLeft=0.2695310
    WinWidth=0.2519530
    WinHeight=0.031250
    OnPreDraw=InternalPreDraw
}