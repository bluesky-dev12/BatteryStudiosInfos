class BG_FX_Flash_Lightning extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Flash_Lightning.SpriteEmitter33'
    begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        ResetAfterChange=true
        RespawnDeadParticles=false
        AutoReset=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ColorScale=/* Array type was not detected. */
        ColorScaleRepeats=2.0000000
        FadeOutStartTime=0.3000000
        FadeInEndTime=0.1000000
        MaxParticles=1
        StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        InitialParticlesPerSecond=1000.0000000
        Texture=Texture'FX_TEX.weather.rain_lightning'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=5.0000000,Max=10.0000000)
    end object
    Emitters[0]=SpriteEmitter33
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Flash_Lightning.SpriteEmitter34'
    begin object name="SpriteEmitter34" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        ResetAfterChange=true
        RespawnDeadParticles=false
        AutoReset=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ColorScale=/* Array type was not detected. */
        ColorScaleRepeats=2.0000000
        FadeOutStartTime=0.3000000
        FadeInEndTime=0.1000000
        MaxParticles=1
        StartLocationRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-20.0000000,Max=0.0000000))
        SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        InitialParticlesPerSecond=1000.0000000
        Texture=Texture'FX_TEX.weather.rain_lightning'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=5.0000000,Max=10.0000000)
        InitialDelayRange=(Min=3.0000000,Max=6.0000000)
    end object
    Emitters[1]=SpriteEmitter34
}