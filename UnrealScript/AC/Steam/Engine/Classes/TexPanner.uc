/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\TexPanner.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class TexPanner extends TexModifier
    hidecategories(Object,Material)
    native
    editinlinenew
    collapsecategories;

var() Rotator PanDirection;
var() float PanRate;
var Matrix M;

defaultproperties
{
    PanRate=0.10
}