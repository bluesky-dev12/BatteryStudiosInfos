class BG_FX_Alien_fly_kappa extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Alien_fly_kappa.SpriteEmitter172'
    begin object name="SpriteEmitter172" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        DisableFogging=true
        UseRevolution=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=0.0000000,Y=128.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        MaxParticles=15
        StartLocationRange=(X=(Min=-2000.0000000,Max=2000.0000000),Y=(Min=-2000.0000000,Max=2000.0000000),Z=(Min=200.0000000,Max=200.0000000))
        RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.0050000,Max=0.0050000))
        SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=3.0000000,Max=300.0000000),Y=(Min=3.0000000,Max=300.0000000),Z=(Min=3.0000000,Max=300.0000000))
        InitialParticlesPerSecond=1.6000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Alien_FX.Kappa_fly_001'
        LifetimeRange=(Min=15.6250000,Max=28.1250000)
        StartVelocityRange=(X=(Min=-1000.0000000,Max=1000.0000000),Y=(Min=-1000.0000000,Max=1000.0000000),Z=(Min=0.0000000,Max=320.0000000))
        StartVelocityRadialRange=(Min=30.0000000,Max=350.0000000)
        GetVelocityDirectionFrom=3
        WarmupTicksPerSecond=10.0000000
        RelativeWarmupTime=4.0000000
    end object
    Emitters[0]=SpriteEmitter172
}