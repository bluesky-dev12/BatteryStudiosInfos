/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4TryAMod.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:1
 *
 *******************************************************************************/
class UT2K4TryAMod extends LockedFloatingWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIScrollTextBox sb_Info;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage i_bk;
var localized string InfoText;
var localized string InfoCaption;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local XInterface.GUI.eFontScale fs;

    super.InitComponent(MyController, myOwner);
    t_WindowTitle.Style = Controller.GetStyle("NoBackground", fs);
    i_FrameBG.SetVisibility(false);
    sb_Main.bBoundToParent = true;
    sb_Main.bScaleToParent = true;
    sb_Main.Caption = InfoCaption;
    sb_Main.SetPosition(0.0, 0.0, 1.0, 1.0);
    sb_Main.ManageComponent(sb_Info);
    sb_Info.SetContent(InfoText);
    sb_Main.TopPadding = 0.10;
    sb_Main.LeftPadding = 0.0;
    sb_Main.RightPadding = 0.0;
    b_Cancel.SetVisibility(false);
    b_OK.SetPosition(0.380, 0.8115240, 0.20, b_OK.WinHeight);
}

defaultproperties
{
    begin object name=sbInfo class=GUIScrollTextBox
        bNoTeletype=true
        TextAlign=1
        OnCreateComponent=InternalOnCreateComponent
        TabOrder=0
    object end
    // Reference: GUIScrollTextBox'UT2K4TryAMod.sbInfo'
    sb_Info=sbInfo
    begin object name=imgBack class=GUIImage
        ImageColor=(R=255,G=255,B=255,A=180)
        ImageStyle=1
        WinTop=0.050
        WinLeft=0.0109370
        WinWidth=0.9781250
        WinHeight=0.90
        RenderWeight=0.000010
        bBoundToParent=true
        bScaleToParent=true
    object end
    // Reference: GUIImage'UT2K4TryAMod.imgBack'
    i_bk=imgBack
    InfoText="At the bottom of the server browser, there is a checkbox marked [Show Standard Servers Only], which is checked by default.  If you uncheck this box, the server browser will display servers running gameplay modifications which may radically alter gameplay.  If you are looking for something different, try unchecking that box."
    InfoCaption="Special Message..."
    DefaultLeft=0.10
    DefaultTop=0.1958330
    DefaultWidth=0.80
    DefaultHeight=0.556250
    FadeTime=0.350
    CurFade=200
    DesiredFade=150
    WinTop=0.1958330
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.556250
}