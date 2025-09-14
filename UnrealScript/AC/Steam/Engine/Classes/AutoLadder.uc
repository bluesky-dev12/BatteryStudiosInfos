/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AutoLadder.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class AutoLadder extends Ladder
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    notplaceable;

defaultproperties
{
    bCollideWhenPlacing=true
}