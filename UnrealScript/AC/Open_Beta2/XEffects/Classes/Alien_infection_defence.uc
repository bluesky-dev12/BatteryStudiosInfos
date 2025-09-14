class Alien_infection_defence extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_infection_defence.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3200000
        FadeInEndTime=0.0400000
        CoordinateSystem=1
        MaxParticles=1
        StartSpinRange=(X=(Min=0.1320000,Max=0.9000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        InitialParticlesPerSecond=30.0000000
        Texture=Texture'FX_TEX.Alien_FX.shock_core_low'
        LifetimeRange=(Min=0.8000000,Max=0.8000000)
    end object
    Emitters[0]=SpriteEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_infection_defence.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.5900000
        FadeOutStartTime=0.4200000
        FadeInEndTime=0.3700000
        CoordinateSystem=1
        MaxParticles=2
        SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.1520000,Max=0.9130000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=140.0000000,Max=140.0000000),Z=(Min=140.0000000,Max=140.0000000))
        InitialParticlesPerSecond=30.0000000
        Texture=Texture'FX_TEX.Alien_FX.shock_flare_a'
        LifetimeRange=(Min=0.8000000,Max=0.8000000)
    end object
    Emitters[1]=SpriteEmitter4
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_infection_defence.SpriteEmitter5'
    begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.7000000
        FadeOutStartTime=0.0707690
        FadeInEndTime=0.0184620
        CoordinateSystem=1
        MaxParticles=20
        SpinsPerSecondRange=(X=(Min=0.1300000,Max=0.3900000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.1520000,Max=0.9130000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=4.0000000,Max=4.0000000),Z=(Min=4.0000000,Max=4.0000000))
        InitialParticlesPerSecond=43333328.0000000
        Texture=Texture'FX_TEX.Alien_FX.shock_core'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-390.0000000,Max=390.0000000),Y=(Min=-390.0000000,Max=390.0000000),Z=(Min=-390.0000000,Max=390.0000000))
    end object
    Emitters[2]=SpriteEmitter5
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}