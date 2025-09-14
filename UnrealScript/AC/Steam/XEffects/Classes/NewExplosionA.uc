/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\NewExplosionA.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class NewExplosionA extends Emitter;

var Texture ExplosionTextures[2];

simulated function PostNetBeginPlay();

defaultproperties
{
    AutoDestroy=true
    LightType=10
    LightEffect=21
    LightHue=28
    LightSaturation=90
    LightBrightness=255.0
    LightRadius=9.0
    LightPeriod=32
    LightCone=128
    bNoDelete=true
    bDynamicLight=true
}