/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XInterface\Classes\GUIBorder.uc
 * Package Imports:
 *	XInterface
 *	Core
 *
 * Stats:
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class GUIBorder extends GUIMultiComponent
    native
    editinlinenew
    instanced;

var() localized string Caption;
var() GUI.eTextAlign Justification;
var() int TextIndent;

function SetCaption(string NewCaption)
{
    Caption = NewCaption;
}

function string GetCaption()
{
    return Caption;
}

defaultproperties
{
    Justification=1
    TextIndent=20
    PropagateVisibility=true
    StyleName="Footer"
    bNeverFocus=true
    bRequiresStyle=true
}