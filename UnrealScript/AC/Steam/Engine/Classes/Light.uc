/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Light.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:5
 *
 *******************************************************************************/
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
    MaxCoronaSize=1000.0
    LightType=1
    LightSaturation=255
    LightBrightness=64.0
    LightRadius=64.0
    LightPeriod=32
    LightCone=128
    bStatic=true
    bHidden=true
    bNoDelete=true
    Texture=Texture'S_Light'
    bMovable=true
    CollisionRadius=24.0
    CollisionHeight=24.0
}