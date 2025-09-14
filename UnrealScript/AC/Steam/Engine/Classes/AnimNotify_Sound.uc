/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AnimNotify_Sound.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:3
 *
 *******************************************************************************/
class AnimNotify_Sound extends AnimNotify
    hidecategories(Object)
    native
    editinlinenew
    collapsecategories;

var() Sound Sound;
var() float Volume;
var() int Radius;

defaultproperties
{
    Volume=1.0
}