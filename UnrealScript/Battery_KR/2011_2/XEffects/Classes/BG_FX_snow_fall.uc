class BG_FX_snow_fall extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_snow_fall.SpriteEmitter64'
    begin object name="SpriteEmitter64" class=Engine.SpriteEmitter
        ProjectionNormal=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        FadeOut=true
        FadeIn=true
        DisableFogging=true
        UseRevolution=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=5.3810000,Y=5.3810000,Z=-234.6820068)
        ExtentMultiplier=(X=0.3500000,Y=0.3500000,Z=0.3500000)
        DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        ColorScale=/* Array type was not detected. */
        Opacity=0.8000000
        FadeOutStartTime=0.9718170
        FadeInEndTime=0.4859090
        MaxParticles=300
        EffectAxis=1
        StartLocationRange=(X=(Min=-2250.0000000,Max=2250.0000000),Y=(Min=-3937.5000000,Max=3937.5000000),Z=(Min=0.0000000,Max=6625.0000000))
        RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.0050000,Max=0.0050000))
        UseRotationFrom=3
        SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=450.0000000,Max=450.0000000),Y=(Min=450.0000000,Max=450.0000000),Z=(Min=450.0000000,Max=450.0000000))
        InitialParticlesPerSecond=7.1399822
        DrawStyle=6
        Texture=Texture'FX_TEX.weather.snow_particle_01'
        LifetimeRange=(Min=4.3000002,Max=4.3000002)
        StartVelocityRange=(X=(Min=1814.2143555,Max=1814.2143555),Y=(Min=-306.2564392,Max=-306.2564392),Z=(Min=-368.8775940,Max=0.0000000))
        StartVelocityRadialRange=(Min=30.0000000,Max=350.0000000)
        WarmupTicksPerSecond=10.0000000
        RelativeWarmupTime=4.0000000
    end object
    Emitters[0]=SpriteEmitter64
}