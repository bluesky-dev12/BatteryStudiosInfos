/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIScrollButtonBase.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class GUIScrollButtonBase extends GUIGFXButton
    dependson(GUIGFXButton)
    native
    editinlinenew
    instanced;

var() bool bIncreaseButton;

defaultproperties
{
    Position=2
    StyleName="RoundScaledButton"
    bNeverFocus=true
    bRepeatClick=true
}