class Alien_Theta_Lota_elec_attack extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Theta_Lota_elec_attack.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseDirectionAs=4
        ProjectionNormal=(X=0.0000000,Y=0.0000000,Z=10.0000000)
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0940170
        FadeInEndTime=0.0042740
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=5.0000000,Max=5.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        InitialParticlesPerSecond=433328.9687500
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_014'
        LifetimeRange=(Min=0.3846150,Max=0.3846150)
    end object
    Emitters[0]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Theta_Lota_elec_attack.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        UseDirectionAs=4
        ProjectionNormal=(X=0.0000000,Y=0.0000000,Z=10.0000000)
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0940170
        FadeInEndTime=0.0042740
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=5.0000000,Max=5.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=350.0000000,Max=350.0000000),Y=(Min=350.0000000,Max=350.0000000),Z=(Min=350.0000000,Max=350.0000000))
        InitialParticlesPerSecond=4329.0000000
        Texture=Texture'FX_TEX.Alien_FX.alien_death'
        LifetimeRange=(Min=0.3846150,Max=0.3846150)
    end object
    Emitters[1]=SpriteEmitter4
    // Reference: BeamEmitter'XEffects_Decompressed.Alien_Theta_Lota_elec_attack.BeamEmitter1'
    begin object name="BeamEmitter1" class=Engine.BeamEmitter
        BeamEndPoints=/* Array type was not detected. */
        DetermineEndPointBy=2
        RotatingSheets=5
        LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-400.0000000,Max=400.0000000))
        LowFrequencyPoints=2
        HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-400.0000000,Max=400.0000000))
        HighFrequencyPoints=3
        UseHighFrequencyScale=true
        UseLowFrequencyScale=true
        NoiseDeterminesEndPoint=true
        DynamicTimeBetweenNoiseRange=(Min=0.2000000,Max=0.5000000)
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.4000000,Max=0.6000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.5000000,Max=0.5000000))
        FadeOutStartTime=0.1150000
        FadeInEndTime=0.0150000
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
        InitialParticlesPerSecond=33322.0000000
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_016'
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
    end object
    Emitters[2]=BeamEmitter1
    // Reference: BeamEmitter'XEffects_Decompressed.Alien_Theta_Lota_elec_attack.BeamEmitter0'
    begin object name="BeamEmitter0" class=Engine.BeamEmitter
        BeamDistanceRange=(Min=150.0000000,Max=300.0000000)
        DetermineEndPointBy=1
        RotatingSheets=2
        LowFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
        HighFrequencyNoiseRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=-60.0000000,Max=60.0000000))
        HighFrequencyPoints=8
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3060000
        FadeInEndTime=0.1620000
        MaxParticles=40
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=200.0000000)
        StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=0.0000000))
        UseRotationFrom=1
        StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
        Texture=Texture'FX_TEX.flame.flamethrower_fire_04'
        LifetimeRange=(Min=0.6000000,Max=0.6000000)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
        StartVelocityRadialRange=(Min=-100.0000000,Max=-100.0000000)
        WarmupTicksPerSecond=2.0000000
        RelativeWarmupTime=2.0000000
    end object
    Emitters[3]=BeamEmitter0
    AutoDestroy=true
    bNoDelete=false
}