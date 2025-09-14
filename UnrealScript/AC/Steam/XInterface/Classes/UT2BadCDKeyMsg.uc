/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2BadCDKeyMsg.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:1
 *
 *******************************************************************************/
class UT2BadCDKeyMsg extends UT2K3GUIPage
    editinlinenew
    instanced;

var bool bIgnoreEsc;
var localized string LeaveMPButtonText;
var localized string LeaveSPButtonText;
var float ButtonWidth;
var float ButtonHeight;
var float ButtonHGap;
var float ButtonVGap;
var float BarHeight;
var float BarVPos;

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x38
    if(Sender == Controls[1])
    {
        Controller.ReplaceMenu("xinterface.UT2MainMenu");
    }
    return true;
}

defaultproperties
{
    bIgnoreEsc=true
    bRequire640x480=true
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.3750
    WinHeight=0.250
}