class Alien_Kappa_Lamda_ball extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Kappa_Lamda_ball.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=200.0000000,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.6700000,Max=2.0000000))
        FadeOutStartTime=0.6250000
        FadeInEndTime=0.0694440
        CoordinateSystem=1
        EffectAxis=1
        StartLocationShape=1
        StartMassRange=(Min=0.1000000,Max=0.1000000)
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1710000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
        ScaleSizeByVelocityMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ScaleSizeByVelocityMax=0.0000000
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_015'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SecondsBeforeInactive=0.5000000
        LifetimeRange=(Min=1.3888890,Max=1.3888890)
    end object
    Emitters[0]=SpriteEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Kappa_Lamda_ball.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        UseActorForces=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=-7.3920598,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3500000
        FadeOutStartTime=1.2820510
        FadeInEndTime=0.0512820
        MaxParticles=150
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.0780000,Max=0.0780000),Y=(Min=0.0351000,Max=0.0702000),Z=(Min=0.0351000,Max=0.0702000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_016'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SecondsBeforeInactive=0.0500000
        LifetimeRange=(Min=1.4243590,Max=5.1282048)
        StartVelocityRange=(X=(Min=7.0200000,Max=7.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter4
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}