class PlayerStart_Defence extends PlayerStart
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

var() Object.ESpawnTeam eTeamType;
var() int RegenLoc;

defaultproperties
{
    Texture=Texture'Engine.Defence'
}