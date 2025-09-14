class BG_FX_weather_snow extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_weather_snow.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-573.3090820)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4100000
        FadeOutStartTime=1.8084490
        FadeInEndTime=0.5787040
        MaxParticles=120
        StartLocationOffset=(X=800.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationRange=(X=(Min=-550.0000000,Max=550.0000000),Y=(Min=-550.0000000,Max=550.0000000),Z=(Min=600.0000000,Max=1500.0000000))
        SpinsPerSecondRange=(X=(Min=0.0800000,Max=0.0800000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=10.0000000),Z=(Min=5.0000000,Max=10.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.weather.snow_particle'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=3.1250000,Max=7.5958328)
        StartVelocityRange=(X=(Min=-552.9600220,Max=-552.9600220),Y=(Min=-138.2400055,Max=138.2400055),Z=(Min=-165.8880157,Max=165.8880157))
    end object
    Emitters[0]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_weather_snow.SpriteEmitter6'
    begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
        UseDirectionAs=1
        ProjectionNormal=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        FadeOut=true
        DisableFogging=true
        UseRevolution=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-104.5339355)
        ColorScale=/* Array type was not detected. */
        Opacity=0.8000000
        FadeOutStartTime=1.1035269
        CoordinateSystem=1
        MaxParticles=22
        EffectAxis=1
        StartLocationRange=(X=(Min=-550.0000000,Max=550.0000000),Y=(Min=-550.0000000,Max=550.0000000),Z=(Min=-120.0000000,Max=120.0000000))
        RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.0050000,Max=0.0050000))
        UseRotationFrom=3
        SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
        SpinsPerSecondRange=(X=(Min=0.1200000,Max=0.1200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
        InitialParticlesPerSecond=5.0039129
        DrawStyle=6
        Texture=Texture'FX_TEX.weather.snow_particle_01'
        LifetimeRange=(Min=1.6666670,Max=6.8966670)
        StartVelocityRange=(X=(Min=-541.0773926,Max=541.0773926),Y=(Min=-541.0773926,Max=541.0773926),Z=(Min=-408.5254211,Max=0.0000000))
        StartVelocityRadialRange=(Min=30.0000000,Max=350.0000000)
        WarmupTicksPerSecond=10.0000000
        RelativeWarmupTime=4.0000000
    end object
    Emitters[1]=SpriteEmitter6
}