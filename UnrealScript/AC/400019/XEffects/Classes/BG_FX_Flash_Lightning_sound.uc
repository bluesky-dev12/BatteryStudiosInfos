class BG_FX_Flash_Lightning_sound extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Flash_Lightning_sound.SpriteEmitter21'
    begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        AutoReset=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ColorScale=/* Array type was not detected. */
        ColorScaleRepeats=2.0000000
        FadeOutStartTime=0.1600000
        FadeInEndTime=0.0500000
        MaxParticles=1
        AutoResetTimeRange=(Min=3.0000000,Max=5.0000000)
        StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-70.0000000,Max=-70.0000000))
        StartSizeRange=(X=(Min=130.0000000,Max=130.0000000),Y=(Min=130.0000000,Max=130.0000000),Z=(Min=130.0000000,Max=130.0000000))
        Texture=Texture'FX_TEX.weather.rain_lightning'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=1.6000000,Max=1.6000000)
    end object
    Emitters[0]=SpriteEmitter21
}