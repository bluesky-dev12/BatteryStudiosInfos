/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIGripButtonBase.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * 
 *******************************************************************************/
class GUIGripButtonBase extends GUIGFXButton
    dependson(GUIGFXButton)
    native
    editinlinenew
    instanced;

defaultproperties
{
    Position=4
    StyleName="RoundButton"
    bNeverFocus=true
    bRequireReleaseClick=true
    OnClickSound=0
}