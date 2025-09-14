/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2Congratulations.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UT2Congratulations extends UT2K3GUIPage
    editinlinenew
    instanced;

function SetupPage(string PageCaption, string PageMessage, string ContinueCaption, Material CongratsPic)
{
    GUITitleBar(Controls[0]).SetCaption(PageCaption);
    GUITitleBar(Controls[2]).SetCaption(PageMessage);
    GUIButton(Controls[3]).Caption = ContinueCaption;
    GUIImage(Controls[1]).Image = CongratsPic;
}

defaultproperties
{
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.10
    WinLeft=0.10
    WinWidth=0.80
    WinHeight=0.80
}