/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PathNode.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class PathNode extends NavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    placeable;

defaultproperties
{
    Texture=Texture'S_Pickup'
    SoundVolume=128
}