/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Camera.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class Camera extends PlayerController
    native
    config(User)
    notplaceable;

defaultproperties
{
    LightBrightness=100.0
    LightRadius=16.0
    Location=(X=-500.0,Y=-300.0,Z=300.0)
    Texture=Texture'S_Camera'
    CollisionRadius=16.0
    CollisionHeight=39.0
    bDirectional=true
}