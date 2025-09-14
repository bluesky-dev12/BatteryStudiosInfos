class PlayerStart extends SmallNavigationPoint
    native
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

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
    LastSpawnFailTime=-999.0000000
    Texture=Texture'Engine.S_Player'
    bDirectional=true
}