/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\VariableTexPanner.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *
 *******************************************************************************/
class VariableTexPanner extends TexModifier
    hidecategories(Object,Material)
    native
    editinlinenew
    collapsecategories;

var() Rotator PanDirection;
var() float PanRate;
var Matrix M;
var float LastTime;
var float PanOffset;

defaultproperties
{
    PanRate=0.10
}