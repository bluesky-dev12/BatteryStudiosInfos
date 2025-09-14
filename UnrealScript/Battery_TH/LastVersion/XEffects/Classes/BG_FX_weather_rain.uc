class BG_FX_weather_rain extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_weather_rain.SpriteEmitter118'
    begin object name="SpriteEmitter118" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-10000.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.6000000
        FadeOutStartTime=0.4900740
        MaxParticles=120
        StartLocationRange=(X=(Min=-500.0000000,Max=500.0000000),Y=(Min=-500.0000000,Max=500.0000000),Z=(Min=1200.0000000,Max=1200.0000000))
        StartLocationPolarRange=(X=(Min=-1200.0000000,Max=1200.0000000),Y=(Min=-1200.0000000,Max=1200.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=110.0000000,Max=110.0000000),Z=(Min=2.0000000,Max=2.0000000))
        InitialParticlesPerSecond=6.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.weather.Rain_Particle'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-1000.0000000,Max=-1000.0000000))
    end object
    Emitters[0]=SpriteEmitter118
}