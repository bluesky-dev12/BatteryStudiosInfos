/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\ShootSpot.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class ShootSpot extends NavigationPoint
    hidecategories(Lighting,LightColor,Karma,Force);

var byte TeamNum;

defaultproperties
{
    Texture=Texture'Engine.S_Weapon'
}