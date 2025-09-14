class HitEffect_Metal_PT_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Metal_PT_hit.SpriteEmitter131'
    begin object name="SpriteEmitter131" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0366020
        CoordinateSystem=1
        MaxParticles=1
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=25.2000008,Max=25.2000008),Y=(Min=25.2000008,Max=25.2000008),Z=(Min=25.2000008,Max=25.2000008))
        InitialParticlesPerSecond=69812.5468750
        Texture=Texture'FX_TEX.Hit_Effects.Metal_Spark_02'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[0]=SpriteEmitter131
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Metal_PT_hit.SpriteEmitter132'
    begin object name="SpriteEmitter132" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ColorScale=/* Array type was not detected. */
        CoordinateSystem=1
        MaxParticles=1
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        InitialParticlesPerSecond=111116.0000000
        Texture=Texture'FX_TEX.Hit_Effects.Metal_Spark_04'
        TextureUSubdivisions=2
        TextureVSubdivisions=1
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter132
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Metal_PT_hit.SpriteEmitter133'
    begin object name="SpriteEmitter133" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=77.7600098,Y=77.7600098,Z=-349.9200134)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0877840
        MaxParticles=4
        SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        StartSizeRange=(X=(Min=2.0000000,Max=7.0000000),Y=(Min=2.0000000,Max=7.0000000),Z=(Min=2.0000000,Max=7.0000000))
        InitialParticlesPerSecond=28194.0761719
        Texture=Texture'FX_TEX.Flares.Laser_Flare'
        LifetimeRange=(Min=0.3000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=240.0000000),Y=(Min=-240.0000000,Max=240.0000000),Z=(Min=-240.0000000,Max=240.0000000))
    end object
    Emitters[2]=SpriteEmitter133
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Metal_PT_hit.SpriteEmitter134'
    begin object name="SpriteEmitter134" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1095.5411377)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2254900
        FadeInEndTime=0.1078430
        MaxParticles=2
        StartLocationRange=(X=(Min=-39.0000000,Max=39.0000000),Y=(Min=-70.1999969,Max=70.1999969),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=1.0000000,Max=1.0000000))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.8000000,Max=0.8000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=267.7999878),Y=(Min=-267.7999878,Max=267.7999878),Z=(Min=39.7799988,Max=477.3599854))
        GetVelocityDirectionFrom=3
    end object
    Emitters[3]=SpriteEmitter134
    AutoDestroy=true
    bNoDelete=false
}