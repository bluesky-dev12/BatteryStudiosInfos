class BG_FX_dust_mote_ani extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_dust_mote_ani.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        ProjectionNormal=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        FadeOut=true
        FadeIn=true
        DisableFogging=true
        UseRevolution=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-0.1027930)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5500000
        FadeOutStartTime=89.7881241
        FadeInEndTime=17.1934719
        CoordinateSystem=1
        MaxParticles=15
        EffectAxis=1
        StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-10.0000000,Max=10.0000000))
        RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.0050000,Max=0.0050000))
        UseRotationFrom=3
        SpinsPerSecondRange=(X=(Min=-0.0020000,Max=0.0050000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0100000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
        InitialParticlesPerSecond=0.1806560
        Texture=Texture'FX_TEX.Flares.flares_mw'
        LifetimeRange=(Min=0.0015430,Max=191.0385742)
        StartVelocityRange=(X=(Min=-2.8726490,Max=2.8726490),Y=(Min=-2.8726490,Max=2.8726490),Z=(Min=-0.2282260,Max=2.6049600))
        StartVelocityRadialRange=(Min=30.0000000,Max=350.0000000)
        WarmupTicksPerSecond=10.0000000
        RelativeWarmupTime=4.0000000
    end object
    Emitters[0]=SpriteEmitter1
}