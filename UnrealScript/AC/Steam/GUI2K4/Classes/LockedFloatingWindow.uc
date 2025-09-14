/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\LockedFloatingWindow.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:5
 *	Functions:4
 *
 *******************************************************************************/
class LockedFloatingWindow extends FloatingWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUISectionBackground sb_Main;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_Cancel;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton b_OK;
var() localized string SubCaption;
var() float EdgeBorder[4];

function InitComponent(GUIController InController, GUIComponent inOwner)
{
    super.InitComponent(InController, inOwner);
    // End:0x30
    if(SubCaption != "")
    {
        sb_Main.Caption = SubCaption;
    }
    AlignButtons();
}

function InternalOnCreateComponent(GUIComponent NewComp, GUIComponent Sender)
{
    // End:0x1f
    if(Sender == self)
    {
        NewComp.bBoundToParent = true;
    }
    // End:0x2f
    else
    {
        super.InternalOnCreateComponent(NewComp, Sender);
    }
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x21
    if(Sender == b_OK)
    {
        Controller.CloseMenu(false);
        return true;
    }
    // End:0x42
    if(Sender == b_Cancel)
    {
        Controller.CloseMenu(true);
        return true;
    }
    return false;
}

function AlignButtons()
{
    local float X, Y, Xs, Ys, WIP, HIP;

    WIP = ActualWidth();
    HIP = ActualHeight();
    Xs = b_OK.ActualWidth() * 0.10;
    Ys = b_OK.ActualHeight() * 0.10;
    X = 1.0 - b_OK.ActualWidth() + Xs / WIP - EdgeBorder[2] / WIP;
    Y = 1.0 - b_OK.ActualHeight() + Ys / HIP - EdgeBorder[3] / WIP;
    b_OK.WinLeft = X;
    b_OK.WinTop = Y;
    X = 1.0 - b_OK.ActualWidth() + b_Cancel.ActualWidth() + Xs / WIP - EdgeBorder[2] / WIP;
    b_Cancel.WinLeft = X;
    b_Cancel.WinTop = Y;
}

defaultproperties
{
    begin object name=InternalFrameImage class=AltSectionBackground
        WinTop=0.0750
        WinLeft=0.040
        WinWidth=0.6758590
        WinHeight=0.5509760
        OnPreDraw=InternalPreDraw
    object end
    // Reference: AltSectionBackground'LockedFloatingWindow.InternalFrameImage'
    sb_Main=InternalFrameImage
    begin object name=LockedCancelButton class=GUIButton
        Caption="??"
        bAutoShrink=true
        WinTop=0.8723970
        WinLeft=0.5126950
        WinWidth=0.1596490
        TabOrder=99
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'LockedFloatingWindow.LockedCancelButton'
    b_Cancel=LockedCancelButton
    begin object name=LockedOKButton class=GUIButton
        Caption="??"
        bAutoShrink=true
        WinTop=0.8723970
        WinLeft=0.7421880
        WinWidth=0.1596490
        TabOrder=100
        bBoundToParent=true
        OnClick=InternalOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'LockedFloatingWindow.LockedOKButton'
    b_OK=LockedOKButton
    EdgeBorder[0]=16.0
    EdgeBorder[1]=24.0
    EdgeBorder[2]=16.0
    EdgeBorder[3]=24.0
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    DefaultLeft=0.1250
    DefaultTop=0.150
    DefaultWidth=0.740
    DefaultHeight=0.70
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    WinTop=0.150
    WinLeft=0.1250
    WinWidth=0.740
    WinHeight=0.70
}