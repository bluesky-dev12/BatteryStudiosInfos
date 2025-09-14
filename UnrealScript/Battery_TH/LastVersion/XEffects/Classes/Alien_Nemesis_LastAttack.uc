class Alien_Nemesis_LastAttack extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_LastAttack.SpriteEmitter270'
    begin object name="SpriteEmitter270" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.3950890
        FadeInEndTime=0.5890380
        CoordinateSystem=1
        MaxParticles=20
        SpinsPerSecondRange=(X=(Min=-0.0800000,Max=0.0800000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0800000,Max=0.0800000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=200.3339844
        Texture=Texture'FX_TEX.Smoke.smoke04_noalpha_RED'
        LifetimeRange=(Min=3.1001980,Max=3.1001980)
        StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter270
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_LastAttack.SpriteEmitter271'
    begin object name="SpriteEmitter271" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=100.0000000,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.3800000
        FadeInEndTime=0.3900000
        MaxParticles=40
        SpinsPerSecondRange=(X=(Min=-0.0800000,Max=0.0800000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0800000,Max=0.0800000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
        InitialParticlesPerSecond=200.3339844
        Texture=Texture'FX_TEX.Smoke.smoke04_noalpha_RED'
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter271
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}