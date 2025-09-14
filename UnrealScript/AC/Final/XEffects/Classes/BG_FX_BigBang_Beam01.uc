class BG_FX_BigBang_Beam01 extends Emitter;

defaultproperties
{
    // Reference: BeamEmitter'XEffects_Decompressed.BG_FX_BigBang_Beam01.BeamEmitter1'
    begin object name="BeamEmitter1" class=Engine.BeamEmitter
        BeamEndPoints=/* Array type was not detected. */
        DetermineEndPointBy=2
        BeamTextureUScale=0.9900000
        RotatingSheets=5
        LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-400.0000000,Max=400.0000000))
        LowFrequencyPoints=2
        HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-400.0000000,Max=400.0000000))
        HighFrequencyPoints=3
        UseHighFrequencyScale=true
        UseLowFrequencyScale=true
        NoiseDeterminesEndPoint=true
        DynamicTimeBetweenNoiseRange=(Min=0.2000000,Max=0.5000000)
        UseColorScale=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.4000000,Max=0.6000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.5000000,Max=0.5000000))
        Opacity=0.6000000
        FadeInEndTime=4.0000000
        MaxParticles=3
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
        Texture=Texture'FX_TEX.Spark.HotBolt04aw'
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
    end object
    Emitters[0]=BeamEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_BigBang_Beam01.SpriteEmitter7'
    begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.6000000,Max=0.6000000))
        FadeOutStartTime=3.0799999
        FadeInEndTime=0.6000000
        MaxParticles=4
        UseRotationFrom=3
        SizeScale=/* Array type was not detected. */
        Texture=Texture'FX_TEX.Spark.waterfall'
    end object
    Emitters[1]=SpriteEmitter7
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_BigBang_Beam01.SpriteEmitter8'
    begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
        UseDirectionAs=4
        ProjectionNormal=(X=16.0000000,Y=0.0000000,Z=1.0000000)
        FadeOut=true
        FadeIn=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=2.0000000
        FadeInEndTime=2.0000000
        MaxParticles=3
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-40.0000000,Max=-40.0000000))
        SizeScale=/* Array type was not detected. */
        Texture=Texture'FX_TEX.Spark.cp_wickedpurple2'
        LifetimeRange=(Min=5.0000000,Max=6.0000000)
    end object
    Emitters[2]=SpriteEmitter8
}