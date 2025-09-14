/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Satellite.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class Satellite extends SmallNavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force)
    placeable;

defaultproperties
{
    Texture=Texture'SpawnSatellite'
    bDirectional=true
}