class Alien_healing_skill extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_healing_skill.SpriteEmitter379'
    begin object name="SpriteEmitter379" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2960000
        FadeInEndTime=0.0640000
        CoordinateSystem=1
        MaxParticles=30
        StartLocationRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=-50.0000000,Max=-50.0000000))
        StartLocationPolarRange=(X=(Min=-550.0000000,Max=550.0000000),Y=(Min=-550.0000000,Max=550.0000000),Z=(Min=-50.0000000,Max=-50.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=30.0000000,Max=30.0000000))
        InitialParticlesPerSecond=5304023.5000000
        Texture=Texture'FX_TEX.Flares.glow_blue'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.6000000,Max=0.6000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=200.0000000))
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter379
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_healing_skill.SpriteEmitter407'
    begin object name="SpriteEmitter407" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1680000
        FadeInEndTime=0.0320000
        CoordinateSystem=1
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_023'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.7000000,Max=0.7000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=400.0000000))
    end object
    Emitters[1]=SpriteEmitter407
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_healing_skill.SpriteEmitter409'
    begin object name="SpriteEmitter409" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2380000
        FadeInEndTime=0.0700000
        CoordinateSystem=1
        StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        Texture=Texture'FX_TEX.Hit_Effects.flesh_sp_01'
        TextureUSubdivisions=2
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.7000000,Max=0.7000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=500.0000000))
    end object
    Emitters[2]=SpriteEmitter409
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}