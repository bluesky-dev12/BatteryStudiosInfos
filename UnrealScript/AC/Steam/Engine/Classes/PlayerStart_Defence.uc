/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlayerStart_Defence.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class PlayerStart_Defence extends PlayerStart
    hidecategories(Lighting,LightColor,Karma,Force)
    placeable;

var() Core.Object.ESpawnTeam eTeamType;
var() int RegenLoc;

defaultproperties
{
    Texture=Texture'Defence'
}