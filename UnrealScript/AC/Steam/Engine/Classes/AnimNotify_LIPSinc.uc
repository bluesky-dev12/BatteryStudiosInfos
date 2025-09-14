/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AnimNotify_LIPSinc.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *
 *******************************************************************************/
class AnimNotify_LIPSinc extends AnimNotify
    hidecategories(Object)
    native
    editinlinenew
    collapsecategories;

var() name LIPSincAnimName;
var() float Volume;
var() int Radius;
var() float Pitch;

defaultproperties
{
    Volume=1.0
    Radius=80
    Pitch=1.0
}