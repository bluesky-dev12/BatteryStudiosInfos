class Sentry_Gun_Beam extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Sentry_Gun_Beam.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
        UseColorScale=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.7000000
        CoordinateSystem=1
        MaxParticles=2
        StartLocationOffset=(X=1.0000000,Y=0.0000000,Z=0.0000000)
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
        InitialParticlesPerSecond=630.0000000
        Texture=Texture'FX_TEX.Flares.glow_red'
        LifetimeRange=(Min=0.0010000,Max=0.0010000)
    end object
    Emitters[0]=SpriteEmitter0
    // Reference: BeamEmitter'XEffects_Decompressed.Sentry_Gun_Beam.BeamEmitter0'
    begin object name="BeamEmitter0" class=Engine.BeamEmitter
        BeamDistanceRange=(Min=70.0000000,Max=70.0000000)
        DetermineEndPointBy=1
        ColorScale=/* Array type was not detected. */
        CoordinateSystem=1
        MaxParticles=1
        StartSizeRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=1.5000000,Max=1.5000000))
        Texture=Texture'FX_TEX.Flares.Sentry_Gun_Beam_01'
        LifetimeRange=(Min=0.0010000,Max=0.0010000)
        StartVelocityRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=BeamEmitter0
    bNoDelete=false
}