class FlyingPathNode extends PathNode
    native
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

var() int iPathPoint;
var() int RegenLoc;

defaultproperties
{
    bNoAutoConnect=true
    bFlyingPreferred=true
    bVehicleDestination=true
    Texture=Texture'Engine.S_FlyingPath'
    DrawScale=0.4000000
}