/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\UT2K4SP_PictureMessage.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class UT2K4SP_PictureMessage extends LargeWindow
    editinlinenew
    instanced;

var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgPictureBg;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIImage imgPicture;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUIButton btnOk;
var() /*0x00000000-0x80000000*/ databinding export editinlinenotify GUILabel lblTitle;

function bool btnOkOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

event HandleParameters(string Param1, string Param2)
{
    local Material img;

    super(GUIPage).HandleParameters(Param1, Param2);
    lblTitle.Caption = Param1;
    img = Material(DynamicLoadObject(Param2, class'Material'));
    // End:0x5e
    if(img != none)
    {
        imgPicture.Image = img;
    }
}

defaultproperties
{
    begin object name=SPMimgPictureBg class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        WinTop=0.2781660
        WinLeft=0.2390
        WinWidth=0.520750
        WinHeight=0.463250
        RenderWeight=0.20
    object end
    // Reference: GUIImage'UT2K4SP_PictureMessage.SPMimgPictureBg'
    imgPictureBg=SPMimgPictureBg
    begin object name=SPMimgPicture class=GUIImage
        ImageStyle=2
        ImageRenderStyle=1
        X1=0
        Y1=0
        X2=1023
        Y2=767
        WinTop=0.29250
        WinLeft=0.240
        WinWidth=0.518750
        WinHeight=0.4350
        RenderWeight=0.30
    object end
    // Reference: GUIImage'UT2K4SP_PictureMessage.SPMimgPicture'
    imgPicture=SPMimgPicture
    begin object name=SPMbtnOk class=GUIButton
        Caption="??"
        FontScale=0
        WinTop=0.7656250
        WinLeft=0.4015630
        WinWidth=0.20
        OnClick=btnOkOnClick
        OnKeyEvent=InternalOnKeyEvent
    object end
    // Reference: GUIButton'UT2K4SP_PictureMessage.SPMbtnOk'
    btnOk=SPMbtnOk
    begin object name=SPLlblTitle class=GUILabel
        Caption="??? ??"
        TextAlign=1
        FontScale=2
        StyleName="TextLabel"
        WinTop=0.1766670
        WinLeft=0.160
        WinWidth=0.680
        WinHeight=0.078750
    object end
    // Reference: GUILabel'UT2K4SP_PictureMessage.SPLlblTitle'
    lblTitle=SPLlblTitle
    WinTop=0.150
    WinLeft=0.150
    WinWidth=0.70
    WinHeight=0.70
}