class PlayerStart_SD extends PlayerStart
    native
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

var() Object.ESpawnTeam eTeamType;

defaultproperties
{
    ApplyGameInfo="wMission.wSDGameInfo"
}