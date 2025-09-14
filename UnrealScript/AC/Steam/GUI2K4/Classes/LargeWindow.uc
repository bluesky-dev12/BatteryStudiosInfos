/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GUI2K4\Classes\LargeWindow.uc
 * Package Imports:
 *	GUI2K4
 *	XInterface
 *	Core
 *
 * 
 *******************************************************************************/
class LargeWindow extends FloatingWindow
    dependson(FloatingWindow)
    editinlinenew
    instanced;

defaultproperties
{
    bResizeWidthAllowed=true
    bResizeHeightAllowed=true
    bMoveAllowed=true
    bRequire640x480=true
    InactiveFadeColor=(R=60,G=60,B=60,A=255)
    OnCreateComponent=None
    WinTop=0.20
    WinLeft=0.20
    WinWidth=0.60
    WinHeight=0.60
}