/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUICheckBoxButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class GUICheckBoxButton extends GUIGFXButton
    native
    editinlinenew
    instanced;

var() Material CheckedOverlay[10];
var() bool bAllOverlay;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    local int i;

    super.InitComponent(MyController, myOwner);
    i = 0;
    J0x17:
    // End:0x4f [While If]
    if(i < 10)
    {
        // End:0x45
        if(CheckedOverlay[i] == none)
        {
            CheckedOverlay[i] = Graphic;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x17;
    }
}

defaultproperties
{
    Position=2
    bCheckBox=true
    StyleName="CheckBox"
    bTabStop=true
}