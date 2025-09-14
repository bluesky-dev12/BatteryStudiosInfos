/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2PerformWarn.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UT2PerformWarn extends UT2K3GUIPage
    editinlinenew
    instanced;

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

defaultproperties
{
    bRequire640x480=true
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.3750
    WinHeight=0.250
}