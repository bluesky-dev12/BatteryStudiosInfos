class alien_breath extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.alien_breath.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.8000000
        FadeOutStartTime=1.6741070
        FadeInEndTime=0.7068450
        CoordinateSystem=1
        DetailMode=1
        StartLocationRange=(X=(Min=11.0000000,Max=11.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
        SpinsPerSecondRange=(X=(Min=-0.1150000,Max=0.1150000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
        InitialParticlesPerSecond=166.9449768
        Texture=Texture'FX_TEX.Smoke.smoke04_noalpha'
        LifetimeRange=(Min=3.7202370,Max=3.7202370)
        StartVelocityRange=(X=(Min=-2.8800001,Max=2.8800001),Y=(Min=-2.8800001,Max=2.8800001),Z=(Min=-2.8800001,Max=2.8800001))
    end object
    Emitters[0]=SpriteEmitter2
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}