class WFX_PinpointBomb_redmark extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_PinpointBomb_redmark.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=82.5000000,Y=0.0000000,Z=135.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.8800000
        FadeInEndTime=0.4400000
        CoordinateSystem=1
        MaxParticles=100
        StartLocationRange=(X=(Min=-20.0000000,Max=-20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0030000,Max=0.0650000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
        StartVelocityRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=-65.0000000,Max=65.0000000),Z=(Min=65.0000000,Max=65.0000000))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
    end object
    Emitters[0]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_PinpointBomb_redmark.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-842.7239380)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2254900
        FadeInEndTime=0.1078430
        CoordinateSystem=1
        MaxParticles=100
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=2.0000000,Max=2.0000000))
        InitialParticlesPerSecond=15.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
        StartVelocityRange=(X=(Min=-206.0000000,Max=206.0000000),Y=(Min=-206.0000000,Max=206.0000000),Z=(Min=30.6000004,Max=267.2000122))
        GetVelocityDirectionFrom=3
    end object
    Emitters[1]=SpriteEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_PinpointBomb_redmark.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
        UseColorScale=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.7000000
        CoordinateSystem=1
        MaxParticles=3
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        InitialParticlesPerSecond=630.0000000
        Texture=Texture'FX_TEX.Flares.glow_red'
        LifetimeRange=(Min=3.8000000,Max=3.8000000)
    end object
    Emitters[2]=SpriteEmitter4
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}