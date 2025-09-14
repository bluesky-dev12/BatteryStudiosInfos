class Light extends Actor
    native
    placeable;

var(Corona) float MinCoronaSize;
var(Corona) float MaxCoronaSize;
var(Corona) float CoronaRotation;
var(Corona) float CoronaRotationOffset;
var(Corona) bool UseOwnFinalBlend;

defaultproperties
{
    MaxCoronaSize=1000.0000000
    LightType=1
    LightSaturation=255
    LightBrightness=64.0000000
    LightRadius=64.0000000
    LightPeriod=32
    LightCone=128
    bStatic=true
    bHidden=true
    bNoDelete=true
    Texture=Texture'Engine_Decompressed.S_Light'
    bMovable=false
    CollisionRadius=24.0000000
    CollisionHeight=24.0000000
}