/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlayerStart_SD.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class PlayerStart_SD extends PlayerStart
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    placeable;

var() Core.Object.ESpawnTeam eTeamType;

defaultproperties
{
    ApplyGameInfo="wMission.wSDGameInfo"
}