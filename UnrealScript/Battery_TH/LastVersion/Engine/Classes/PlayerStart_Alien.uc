class PlayerStart_Alien extends PlayerStart
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

var() Object.ESpawnTeam eTeamType;
var Controller PointOwner;
var Vector vOriginLocation;
var Rotator vOriginRotation;

function InitPosition()
{
    local Vector emptyVector;
    local Rotator emptyRotator;

    // End:0x1D
    if(vOriginLocation == emptyVector)
    {
        vOriginLocation = Location;        
    }
    else
    {
        SetLocation(vOriginLocation);
    }
    // End:0x42
    if(vOriginRotation == emptyRotator)
    {
        vOriginRotation = Rotation;        
    }
    else
    {
        SetRotation(vOriginRotation);
    }
    //return;    
}

defaultproperties
{
    ApplyGameInfo="wMission.wAlienGameInfo"
    bStatic=false
    Texture=Texture'Engine.Alien'
}