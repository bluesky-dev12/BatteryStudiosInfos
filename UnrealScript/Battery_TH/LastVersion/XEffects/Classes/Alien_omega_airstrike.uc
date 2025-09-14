class Alien_omega_airstrike extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_omega_airstrike.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.2000000
        FadeOutStartTime=0.4166670
        FadeInEndTime=0.0462960
        MaxParticles=80
        EffectAxis=1
        StartLocationShape=1
        StartMassRange=(Min=0.1000000,Max=0.1000000)
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2570000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        ScaleSizeByVelocityMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ScaleSizeByVelocityMax=0.0000000
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_020'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SecondsBeforeInactive=0.5000000
        LifetimeRange=(Min=0.9259260,Max=0.9259260)
    end object
    Emitters[0]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_omega_airstrike.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.7000000
        FadeOutStartTime=0.4166670
        FadeInEndTime=0.0462960
        CoordinateSystem=1
        MaxParticles=30
        EffectAxis=1
        StartLocationShape=1
        StartMassRange=(Min=0.1000000,Max=0.1000000)
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2570000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        ScaleSizeByVelocityMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ScaleSizeByVelocityMax=0.0000000
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_020'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SecondsBeforeInactive=0.5000000
        LifetimeRange=(Min=0.9259260,Max=0.9259260)
        StartVelocityRange=(X=(Min=800.0000000,Max=800.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter1
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}