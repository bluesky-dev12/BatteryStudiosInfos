class Alien_omega_airstrike extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_omega_airstrike.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        Opacity=0.7000000
        FadeOutStartTime=0.5700000
        FadeInEndTime=0.1500000
        MaxParticles=100
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=200.0000000)
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=350.0000000,Max=350.0000000),Z=(Min=80.0000000,Max=80.0000000))
        InitialParticlesPerSecond=1454.4799805
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_020'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-10.0000000,Max=-10.0000000))
    end object
    Emitters[0]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_omega_airstrike.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=500.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.7000000
        FadeOutStartTime=0.6250000
        FadeInEndTime=0.0694440
        CoordinateSystem=1
        MaxParticles=20
        EffectAxis=1
        StartLocationShape=1
        StartMassRange=(Min=0.1000000,Max=0.1000000)
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1710000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        ScaleSizeByVelocityMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ScaleSizeByVelocityMax=0.0000000
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_020'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SecondsBeforeInactive=0.5000000
        LifetimeRange=(Min=1.3888890,Max=1.3888890)
    end object
    Emitters[1]=SpriteEmitter1
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}