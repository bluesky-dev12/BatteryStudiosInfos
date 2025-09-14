class BG_FX_Beam_01 extends Emitter;

defaultproperties
{
    // Reference: BeamEmitter'XEffects_Decompressed.BG_FX_Beam_01.BeamEmitter1'
    begin object name="BeamEmitter1" class=Engine.BeamEmitter
        BeamEndPoints=/* Array type was not detected. */
        DetermineEndPointBy=3
        RotatingSheets=2
        HighFrequencyNoiseRange=(X=(Min=-31.0000000,Max=31.0000000),Y=(Min=-31.0000000,Max=31.0000000),Z=(Min=-31.0000000,Max=31.0000000))
        UseColorScale=true
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        MaxParticles=2
        StartSizeRange=(X=(Min=-185.0000000,Max=185.0000000),Y=(Min=185.0000000,Max=185.0000000),Z=(Min=185.0000000,Max=185.0000000))
        Texture=Texture'FX_TEX.Spark.HotBolt01aw'
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
    end object
    Emitters[0]=BeamEmitter1
}