/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\MessageWindow.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * 
 *******************************************************************************/
class MessageWindow extends PopupPageBase
    editinlinenew
    instanced;

defaultproperties
{
    begin object name=MessageWindowFrameBackground class=FloatingImage
        DropShadowX=0
        DropShadowY=0
        WinTop=0.0
        WinLeft=0.0
        WinWidth=1.0
        WinHeight=1.0
    object end
    // Reference: FloatingImage'MessageWindow.MessageWindowFrameBackground'
    i_FrameBG=MessageWindowFrameBackground
    WinTop=0.30
    WinHeight=0.380
}