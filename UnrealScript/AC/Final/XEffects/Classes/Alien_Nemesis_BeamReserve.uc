class Alien_Nemesis_BeamReserve extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_BeamReserve.SpriteEmitter5'
    begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2960000
        FadeInEndTime=0.0640000
        CoordinateSystem=1
        MaxParticles=100
        DetailMode=1
        StartLocationOffset=(X=0.0000000,Y=200.0000000,Z=0.0000000)
        StartLocationRange=(X=(Min=-49.5000000,Max=49.5000000),Y=(Min=-89.0999985,Max=89.0999985),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=900.0000000,Max=900.0000000),Z=(Min=25.0000000,Max=25.0000000))
        InitialParticlesPerSecond=5304023.5000000
        Texture=Texture'FX_TEX.Flares.glow_blue'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        InitialDelayRange=(Min=0.5000000,Max=0.5000000)
        StartVelocityRange=(X=(Min=-1000.0000000,Max=1000.0000000),Y=(Min=-1000.0000000,Max=1000.0000000),Z=(Min=-1000.0000000,Max=1000.0000000))
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter5
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_BeamReserve.SpriteEmitter6'
    begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        UseActorForces=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=-7.3920598,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.6600000
        FadeInEndTime=0.2100000
        CoordinateSystem=1
        MaxParticles=8
        StartLocationOffset=(X=0.0000000,Y=200.0000000,Z=0.0000000)
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.0780000,Max=0.0780000),Y=(Min=0.0351000,Max=0.0702000),Z=(Min=0.0351000,Max=0.0702000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_016'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SecondsBeforeInactive=0.0500000
        LifetimeRange=(Min=1.6000000,Max=1.6000000)
        StartVelocityRange=(X=(Min=7.0200000,Max=7.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter6
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_BeamReserve.SpriteEmitter7'
    begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        UseActorForces=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=-7.3920598,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.6400000
        FadeInEndTime=0.1120000
        CoordinateSystem=1
        MaxParticles=5
        StartLocationOffset=(X=0.0000000,Y=200.0000000,Z=0.0000000)
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.0780000,Max=0.0780000),Y=(Min=0.0351000,Max=0.0702000),Z=(Min=0.0351000,Max=0.0702000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        Texture=Texture'FX_TEX.Alien_Boss_FX.link_ring_green'
        SecondsBeforeInactive=0.0500000
        LifetimeRange=(Min=1.6000000,Max=1.6000000)
        StartVelocityRange=(X=(Min=7.0200000,Max=7.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[2]=SpriteEmitter7
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}