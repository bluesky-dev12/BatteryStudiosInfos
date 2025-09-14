/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\StateButton.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class StateButton extends GUIButton
    native
    editinlinenew
    instanced;

var() Material Images[5];
var() GUI.eImgStyle ImageStyle;

defaultproperties
{
    ImageStyle=2
}