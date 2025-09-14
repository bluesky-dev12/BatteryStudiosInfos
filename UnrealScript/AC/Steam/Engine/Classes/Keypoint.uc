/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Keypoint.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class Keypoint extends Actor
    native
    abstract
    placeable;

defaultproperties
{
    bStatic=true
    bHidden=true
    RemoteRole=0
    Texture=Texture'S_Keypoint'
    SoundVolume=0
    CollisionRadius=10.0
    CollisionHeight=10.0
}