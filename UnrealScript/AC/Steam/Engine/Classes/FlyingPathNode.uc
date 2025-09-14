/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\FlyingPathNode.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *
 *******************************************************************************/
class FlyingPathNode extends PathNode
    hidecategories(Lighting,LightColor,Karma,Force)
    native
    placeable;

var() int iPathPoint;
var() int RegenLoc;

defaultproperties
{
    bNoAutoConnect=true
    bFlyingPreferred=true
    bVehicleDestination=true
    Texture=Texture'S_FlyingPath'
    DrawScale=0.40
}