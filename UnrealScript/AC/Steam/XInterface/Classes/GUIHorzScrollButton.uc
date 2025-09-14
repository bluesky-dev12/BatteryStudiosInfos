/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIHorzScrollButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class GUIHorzScrollButton extends GUIScrollButtonBase
    editinlinenew
    instanced;

var() bool LeftButton;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x11
    if(bIncreaseButton)
    {
        ImageIndex = 3;
    }
    super(GUIGFXButton).InitComponent(MyController, myOwner);
}

defaultproperties
{
    ImageIndex=2
}