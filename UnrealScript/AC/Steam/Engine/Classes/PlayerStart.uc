/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlayerStart.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:8
 *
 *******************************************************************************/
class PlayerStart extends SmallNavigationPoint
    dependson(SmallNavigationPoint)
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    placeable;

var() byte TeamNumber;
var() bool bSinglePlayerStart;
var() bool bCoopStart;
var() bool bEnabled;
var() bool bPrimaryStart;
var string ApplyGameInfo;
var float LastSpawnFailTime;
var() array<Satellite> Satellites;

defaultproperties
{
    bSinglePlayerStart=true
    bCoopStart=true
    bEnabled=true
    bPrimaryStart=true
    LastSpawnFailTime=-999.0
    Texture=Texture'S_Player'
    bDirectional=true
}