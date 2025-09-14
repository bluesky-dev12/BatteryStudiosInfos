class NewExplosionA extends Emitter;

var Texture ExplosionTextures[2];

simulated function PostNetBeginPlay()
{
    //return;    
}

defaultproperties
{
    AutoDestroy=true
    LightType=10
    LightEffect=21
    LightHue=28
    LightSaturation=90
    LightBrightness=255.0000000
    LightRadius=9.0000000
    LightPeriod=32
    LightCone=128
    bNoDelete=false
    bDynamicLight=true
}