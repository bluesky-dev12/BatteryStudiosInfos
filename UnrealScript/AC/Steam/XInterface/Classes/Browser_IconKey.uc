/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\Browser_IconKey.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class Browser_IconKey extends UT2K3GUIPage
    editinlinenew
    instanced;

function bool InternalOnClick(GUIComponent Sender)
{
    Controller.CloseMenu(false);
    return true;
}

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super(GUIPage).InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x99 [While If]
    if(i < 7)
    {
        GUIImage(Controls[3 + 2 * i]).Image = class'Browser_ServersList'.default.Icons[i];
        GUILabel(Controls[4 + 2 * i]).Caption = class'Browser_ServersList'.default.IconDescriptions[i];
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

defaultproperties
{
    bRequire640x480=true
    Controls=// Object reference not set to an instance of an object.
    
}