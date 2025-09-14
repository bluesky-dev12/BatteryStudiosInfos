class BG_FX_projector_mote_ani extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_projector_mote_ani.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        ProjectionNormal=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        FadeOut=true
        FadeIn=true
        DisableFogging=true
        UseRevolution=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=0.0000000,Y=4.0000000,Z=-1.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4800000
        FadeOutStartTime=23.0000000
        FadeInEndTime=7.0000000
        CoordinateSystem=1
        MaxParticles=5
        EffectAxis=1
        StartLocationRange=(X=(Min=-70.0000000,Max=70.0000000),Y=(Min=-70.0000000,Max=70.0000000),Z=(Min=-10.0000000,Max=10.0000000))
        RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.0050000,Max=0.0050000))
        UseRotationFrom=3
        SpinsPerSecondRange=(X=(Min=-0.0040000,Max=0.0120000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0100000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
        InitialParticlesPerSecond=0.4227350
        Texture=Texture'FX_TEX.Flares.flares_mw'
        LifetimeRange=(Min=0.1000000,Max=50.0000000)
        StartVelocityRange=(X=(Min=-6.7220001,Max=6.7220001),Y=(Min=-6.7220001,Max=6.7220001),Z=(Min=-0.5340000,Max=1.0960000))
        StartVelocityRadialRange=(Min=30.0000000,Max=350.0000000)
    end object
    Emitters[0]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_projector_mote_ani.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        FadeOut=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=3.5999999,Z=-0.3600000)
        ColorScale=/* Array type was not detected. */
        ColorScaleRepeats=1.0000000
        FadeOutStartTime=0.7407410
        MaxParticles=20
        StartLocationRange=(X=(Min=-64.0000000,Max=64.0000000),Y=(Min=-64.0000000,Max=64.0000000),Z=(Min=-64.0000000,Max=64.0000000))
        SphereRadiusRange=(Min=2048.0000000,Max=2048.0000000)
        StartSizeRange=(X=(Min=1.5000000,Max=2.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.Flares.FireFlys'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=4.6296291,Max=9.2592583)
        StartVelocityRange=(X=(Min=-10.8000002,Max=15.1200008),Y=(Min=-10.8000002,Max=27.1200008),Z=(Min=-10.8000002,Max=9.1199999))
    end object
    Emitters[1]=SpriteEmitter3
}