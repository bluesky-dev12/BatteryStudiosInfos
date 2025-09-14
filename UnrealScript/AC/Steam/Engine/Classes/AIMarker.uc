/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AIMarker.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class AIMarker extends SmallNavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    notplaceable;

var AIScript markedScript;

defaultproperties
{
    bCollideWhenPlacing=true
    bHiddenEd=true
}