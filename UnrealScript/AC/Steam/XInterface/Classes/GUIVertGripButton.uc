/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIVertGripButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class GUIVertGripButton extends GUIGripButtonBase
    editinlinenew
    instanced;

function InitComponent(GUIController MyController, GUIComponent MyComponent)
{
    super(GUIButton).InitComponent(MyController, MyComponent);
}

defaultproperties
{
    StyleName="VertGrip"
}