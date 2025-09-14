class RoadPathNode extends PathNode
    native
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

var() float MaxRoadDist;

defaultproperties
{
    MaxRoadDist=10000.0000000
    bVehicleDestination=true
    Texture=Texture'Engine.S_RoadPath'
    DrawScale=0.4000000
}