class BG_FX_whiteout_Beam extends Emitter;

defaultproperties
{
    // Reference: BeamEmitter'XEffects_Decompressed.BG_FX_whiteout_Beam.BeamEmitter1'
    begin object name="BeamEmitter1" class=Engine.BeamEmitter
        BeamEndPoints=/* Array type was not detected. */
        DetermineEndPointBy=2
        BeamTextureUScale=0.9900000
        RotatingSheets=3
        LowFrequencyNoiseRange=(X=(Min=-1500.0000000,Max=1500.0000000),Y=(Min=-1500.0000000,Max=1500.0000000),Z=(Min=0.0000000,Max=0.0000000))
        LowFrequencyPoints=5
        HighFrequencyNoiseRange=(X=(Min=-1500.0000000,Max=1500.0000000),Y=(Min=-1500.0000000,Max=1500.0000000),Z=(Min=0.0000000,Max=0.0000000))
        HighFrequencyPoints=5
        UseHighFrequencyScale=true
        UseLowFrequencyScale=true
        NoiseDeterminesEndPoint=true
        DynamicTimeBetweenNoiseRange=(Min=0.2000000,Max=0.5000000)
        UseColorScale=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.5000000,Max=0.5000000))
        Opacity=0.7800000
        FadeInEndTime=4.0000000
        MaxParticles=3
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-300.0000000,Max=-300.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
        Texture=Texture'FX_TEX.Spark.HotBolt04aw'
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
    end object
    Emitters[0]=BeamEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_whiteout_Beam.SpriteEmitter70'
    begin object name="SpriteEmitter70" class=Engine.SpriteEmitter
        ProjectionNormal=(X=16.0000000,Y=0.0000000,Z=1.0000000)
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.5599999
        FadeInEndTime=1.3800000
        MaxParticles=5
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-40.0000000,Max=-40.0000000))
        SpinsPerSecondRange=(X=(Min=0.0800000,Max=0.0800000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0800000,Max=0.0800000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        Texture=Texture'FX_TEX.Spark.cp_wickedpurple2'
        LifetimeRange=(Min=5.0000000,Max=6.0000000)
    end object
    Emitters[1]=SpriteEmitter70
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_whiteout_Beam.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.3900000
        FadeOutStartTime=0.7250000
        FadeInEndTime=0.1000000
        CoordinateSystem=1
        MaxParticles=50
        StartLocationRange=(X=(Min=-230.0000000,Max=230.0000000),Y=(Min=-230.0000000,Max=230.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationPolarRange=(X=(Min=-1200.0000000,Max=1200.0000000),Y=(Min=-1200.0000000,Max=1200.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=666.0000000
        Texture=Texture'FX_TEX.Flares.glow_blue'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=2.5000000,Max=2.5000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1000.0000000,Max=2000.0000000))
    end object
    Emitters[2]=SpriteEmitter1
    Emitters[3]=SpriteEmitter1
}