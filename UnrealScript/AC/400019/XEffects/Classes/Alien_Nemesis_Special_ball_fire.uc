class Alien_Nemesis_Special_ball_fire extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Special_ball_fire.SpriteEmitter232'
    begin object name="SpriteEmitter232" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1142860
        FadeInEndTime=0.0428570
        CoordinateSystem=1
        MaxParticles=50
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-60.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=1
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=10.0000000,Max=10.0000000))
        InitialParticlesPerSecond=6760021.0000000
        Texture=Texture'FX_TEX.Flares.glow_red'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.8000000,Max=0.8000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-764.5650024,Max=764.5650024),Y=(Min=-764.5650024,Max=764.5650024),Z=(Min=-164.5650024,Max=764.5650024))
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter232
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Special_ball_fire.SpriteEmitter233'
    begin object name="SpriteEmitter233" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1169230
        FadeInEndTime=0.0169230
        CoordinateSystem=1
        MaxParticles=20
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=10.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=1721.9859619
        Texture=Texture'FX_TEX.flame.flamethrower_fire_03'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
    end object
    Emitters[1]=SpriteEmitter233
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Special_ball_fire.SpriteEmitter234'
    begin object name="SpriteEmitter234" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2000000
        FadeInEndTime=0.0300000
        CoordinateSystem=1
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=-30.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=1721.9859619
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_020_b'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=-300.0000000,Max=300.0000000))
    end object
    Emitters[2]=SpriteEmitter234
    AutoDestroy=true
    bNoDelete=false
}