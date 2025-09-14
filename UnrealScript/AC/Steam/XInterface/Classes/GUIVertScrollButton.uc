/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIVertScrollButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class GUIVertScrollButton extends GUIScrollButtonBase
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    // End:0x27
    if(bIncreaseButton)
    {
        StyleName = "VertDownButton";
        ImageIndex = 7;
    }
    super(GUIGFXButton).InitComponent(MyController, myOwner);
}

defaultproperties
{
    ImageIndex=6
    StyleName="VertUpButton"
}