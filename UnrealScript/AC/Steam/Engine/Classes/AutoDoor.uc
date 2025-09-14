/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AutoDoor.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class AutoDoor extends Door
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    notplaceable;

defaultproperties
{
    bCollideWhenPlacing=true
}