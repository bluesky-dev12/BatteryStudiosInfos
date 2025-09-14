class wSupplyRespawnPoint extends SmallNavigationPoint
    placeable
    hidecategories(Lighting,LightColor,Karma,Force);

var() const bool bIsInHouse;
var bool bSpawnDropItem;

defaultproperties
{
    Texture=Texture'Engine.respawnPoint'
}