class UT2K4TryAMod extends LockedFloatingWindow
    editinlinenew
    instanced;

var() automated GUIScrollTextBox sb_Info;
var() automated GUIImage i_bk;
var localized string InfoText;
var localized string InfoCaption;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local GUI.eFontScale fs;

    super.InitComponent(MyController, myOwner);
    t_WindowTitle.Style = Controller.GetStyle("NoBackground", fs);
    i_FrameBG.SetVisibility(false);
    sb_Main.bBoundToParent = true;
    sb_Main.bScaleToParent = true;
    sb_Main.Caption = InfoCaption;
    sb_Main.SetPosition(0.0000000, 0.0000000, 1.0000000, 1.0000000);
    sb_Main.ManageComponent(sb_Info);
    sb_Info.SetContent(InfoText);
    sb_Main.TopPadding = 0.1000000;
    sb_Main.LeftPadding = 0.0000000;
    sb_Main.RightPadding = 0.0000000;
    b_Cancel.SetVisibility(false);
    b_OK.SetPosition(0.3800000, 0.8115240, 0.2000000, b_OK.WinHeight);
    //return;    
}

defaultproperties
{
    // Reference: GUIScrollTextBox'GUI2K4_Decompressed.UT2K4TryAMod.sbInfo'
    begin object name="sbInfo" class=XInterface.GUIScrollTextBox
        bNoTeletype=true
        TextAlign=1
        OnCreateComponent=sbInfo.InternalOnCreateComponent
        TabOrder=0
    end object
    sb_Info=sbInfo
    // Reference: GUIImage'GUI2K4_Decompressed.UT2K4TryAMod.imgBack'
    begin object name="imgBack" class=XInterface.GUIImage
        ImageColor=(R=255,G=255,B=255,A=180)
        ImageStyle=1
        WinTop=0.0500000
        WinLeft=0.0109370
        WinWidth=0.9781250
        WinHeight=0.9000000
        RenderWeight=0.0000100
        bBoundToParent=true
        bScaleToParent=true
    end object
    i_bk=imgBack
    InfoText="At the bottom of the server browser, there is a checkbox marked [Show Standard Servers Only], which is checked by default.  If you uncheck this box, the server browser will display servers running gameplay modifications which may radically alter gameplay.  If you are looking for something different, try unchecking that box."
    InfoCaption="Special Message..."
    DefaultLeft=0.1000000
    DefaultTop=0.1958330
    DefaultWidth=0.8000000
    DefaultHeight=0.5562500
    FadeTime=0.3500000
    CurFade=200
    DesiredFade=150
    WinTop=0.1958330
    WinLeft=0.1000000
    WinWidth=0.8000000
    WinHeight=0.5562500
}