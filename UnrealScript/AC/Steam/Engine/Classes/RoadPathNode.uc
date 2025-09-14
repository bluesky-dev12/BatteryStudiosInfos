/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\RoadPathNode.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class RoadPathNode extends PathNode
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    placeable;

var() float MaxRoadDist;

defaultproperties
{
    MaxRoadDist=10000.0
    bVehicleDestination=true
    Texture=Texture'S_RoadPath'
    DrawScale=0.40
}