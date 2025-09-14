/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\UT2NetworkStatusMsg.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:9
 *	Functions:3
 *
 *******************************************************************************/
class UT2NetworkStatusMsg extends UT2K3GUIPage
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

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIPage).InitComponent(MyController, myOwner);
    PlayerOwner().ClearProgressMessages();
}

function bool InternalOnClick(GUIComponent Sender)
{
    // End:0x3a
    if(Sender == Controls[1])
    {
        Controller.ReplaceMenu("xinterface.ServerBrowser");
    }
    return true;
}

event HandleParameters(string Param1, string Param2)
{
    GUILabel(Controls[2]).Caption = Param1 $ "|" $ Param2;
    PlayerOwner().ClearProgressMessages();
}

defaultproperties
{
    bIgnoreEsc=true
    bRequire640x480=true
    Controls=// Object reference not set to an instance of an object.
    
    WinTop=0.3750
    WinHeight=0.250
}