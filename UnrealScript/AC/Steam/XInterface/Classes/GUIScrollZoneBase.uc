/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIScrollZoneBase.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class GUIScrollZoneBase extends GUIComponent
    native
    editinlinenew
    instanced;

var delegate<OnScrollZoneClick> __OnScrollZoneClick__Delegate;

delegate OnScrollZoneClick(float Delta);
function bool InternalOnClick(GUIComponent Sender)
{
    return false;
}

defaultproperties
{
    StyleName="ScrollZone"
    RenderWeight=0.250
    bAcceptsInput=true
    bCaptureMouse=true
    bNeverFocus=true
    bRepeatClick=true
    bRequiresStyle=true
    OnClick=InternalOnClick
}