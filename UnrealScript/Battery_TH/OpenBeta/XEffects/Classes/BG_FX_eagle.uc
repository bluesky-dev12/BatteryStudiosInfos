class BG_FX_eagle extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_eagle.SpriteEmitter20'
    begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
        UseDirectionAs=5
        UseColorScale=true
        DisableFogging=true
        UseRevolution=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=50.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        MaxParticles=15
        StartLocationRange=(X=(Min=-2000.0000000,Max=2000.0000000),Y=(Min=-2000.0000000,Max=2000.0000000),Z=(Min=-200.0000000,Max=200.0000000))
        RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.0050000,Max=0.0050000))
        SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.0000000,Max=300.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
        InitialParticlesPerSecond=1.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Emitter.brid_eagle'
        LifetimeRange=(Min=25.0000000,Max=45.0000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=200.0000000))
        StartVelocityRadialRange=(Min=30.0000000,Max=350.0000000)
        GetVelocityDirectionFrom=3
        WarmupTicksPerSecond=10.0000000
        RelativeWarmupTime=4.0000000
    end object
    Emitters[0]=SpriteEmitter20
}