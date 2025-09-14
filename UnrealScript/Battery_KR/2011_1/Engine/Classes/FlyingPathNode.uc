class FlyingPathNode extends PathNode
    native
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

var() int iPathPoint;

defaultproperties
{
    bNoAutoConnect=true
    bFlyingPreferred=true
    bVehicleDestination=true
    Texture=Texture'Engine_Decompressed.S_FlyingPath'
    DrawScale=0.4000000
}