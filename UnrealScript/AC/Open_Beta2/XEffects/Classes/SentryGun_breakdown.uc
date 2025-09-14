class SentryGun_breakdown extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_breakdown.SpriteEmitter222'
    begin object name="SpriteEmitter222" class=Engine.SpriteEmitter
        UseColorScale=true
        UniformSize=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=5.4000001)
        ColorScale=/* Array type was not detected. */
        MaxParticles=5
        StartLocationRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=10.0000000),Z=(Min=30.0000000,Max=50.0000000))
        StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
        ScaleSizeByVelocityMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ScaleSizeByVelocityMax=0.0000000
        Texture=Texture'FX_TEX.Flares.Laser_Flare_s'
        LifetimeRange=(Min=0.8333330,Max=1.2500000)
        StartVelocityRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=60.0000000,Max=60.0000000))
    end object
    Emitters[0]=SpriteEmitter222
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_breakdown.SpriteEmitter223'
    begin object name="SpriteEmitter223" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=1.1250000,Y=1.1250000,Z=5.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5000000
        FadeOutStartTime=1.8468000
        FadeInEndTime=0.6925500
        MaxParticles=5
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
        DrawStyle=5
        Texture=Texture'FX_TEX.Smoke.explo_smoke_noalpha_ani02'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=7.6950002,Max=7.6950002)
        StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
    end object
    Emitters[1]=SpriteEmitter223
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_breakdown.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=40.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5700000
        FadeOutStartTime=0.5000000
        FadeInEndTime=0.1600000
        MaxParticles=5
        StartSizeRange=(X=(Min=10.0000000,Max=40.0000000),Y=(Min=10.0000000,Max=40.0000000),Z=(Min=10.0000000,Max=40.0000000))
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire03'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=80.0000000))
    end object
    Emitters[2]=SpriteEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_breakdown.SpriteEmitter195'
    begin object name="SpriteEmitter195" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
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
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=1.0000000,Max=1.0000000))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=2.0000000)
        StartVelocityRange=(X=(Min=-206.0000000,Max=206.0000000),Y=(Min=-206.0000000,Max=0.0000000),Z=(Min=30.6000004,Max=167.1999969))
        GetVelocityDirectionFrom=3
    end object
    Emitters[3]=SpriteEmitter195
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_breakdown.SpriteEmitter196'
    begin object name="SpriteEmitter196" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1440000,Max=0.1440000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=25920.0019531
        Texture=Texture'FX_TEX.Spark.spark_th'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.8333330,Max=0.8333330)
    end object
    Emitters[4]=SpriteEmitter196
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_breakdown.SpriteEmitter197'
    begin object name="SpriteEmitter197" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1440000,Max=0.1440000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=25920.0019531
        Texture=Texture'FX_TEX.Spark.spark_th'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.8333330,Max=0.8333330)
        InitialDelayRange=(Min=0.4000000,Max=0.4000000)
    end object
    Emitters[5]=SpriteEmitter197
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_breakdown.SpriteEmitter198'
    begin object name="SpriteEmitter198" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=10.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1440000,Max=0.1440000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=25920.0019531
        Texture=Texture'FX_TEX.Spark.spark_th_02'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        InitialDelayRange=(Min=0.3000000,Max=0.3000000)
    end object
    Emitters[6]=SpriteEmitter198
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_breakdown.SpriteEmitter200'
    begin object name="SpriteEmitter200" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1440000,Max=0.1440000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=25920.0019531
        Texture=Texture'FX_TEX.Spark.spark_th_02'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.8333330,Max=0.8333330)
        InitialDelayRange=(Min=0.8000000,Max=0.8000000)
    end object
    Emitters[7]=SpriteEmitter200
    bNoDelete=false
}