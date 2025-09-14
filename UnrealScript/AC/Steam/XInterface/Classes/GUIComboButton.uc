/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIComboButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class GUIComboButton extends GUIVertScrollButton
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent myOwner)
{
    super(GUIGFXButton).InitComponent(MyController, myOwner);
}

defaultproperties
{
    ImageIndex=7
    StyleName="ComboButton"
    bRepeatClick=true
    OnClickSound=2
}