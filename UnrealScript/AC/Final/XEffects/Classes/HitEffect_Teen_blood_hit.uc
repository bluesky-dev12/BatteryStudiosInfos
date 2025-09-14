class HitEffect_Teen_blood_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Teen_blood_hit.SpriteEmitter6'
    begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-774.0969849)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.4000000,Max=0.5000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1642400
        FadeInEndTime=0.0351940
        MaxParticles=3
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-6.5990090,Max=6.5990090),Z=(Min=-6.5990090,Max=6.5990090))
        StartSpinRange=(X=(Min=-0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=1.5000000,Max=4.0000000),Y=(Min=1.5000000,Max=4.0000000),Z=(Min=1.5000000,Max=4.0000000))
        InitialParticlesPerSecond=3299.5100098
        DrawStyle=1
        Texture=Texture'FX_TEX.Emitter.deco_paper03'
        LifetimeRange=(Min=0.9000000,Max=0.9000000)
        InitialDelayRange=(Min=0.1500000,Max=0.1500000)
        StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=65.7119980,Max=442.5880127))
    end object
    Emitters[0]=SpriteEmitter6
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Teen_blood_hit.SpriteEmitter7'
    begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-408.1308899)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1031020
        MaxParticles=5
        StartLocationRange=(X=(Min=-6.5000000,Max=6.5000000),Y=(Min=-6.5000000,Max=6.5000000),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1380000,Max=0.1380000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=19.0000000,Max=19.0000000),Y=(Min=19.0000000,Max=19.0000000),Z=(Min=19.0000000,Max=19.0000000))
        InitialParticlesPerSecond=1932.0319824
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_china_02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.4482700,Max=0.4482700)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-103.5091248,Max=103.5091248),Y=(Min=-103.5091248,Max=103.5091248),Z=(Min=-40.0761566,Max=271.6043396))
    end object
    Emitters[1]=SpriteEmitter7
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Teen_blood_hit.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-80.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4000000
        FadeOutStartTime=0.2485210
        FadeInEndTime=0.0591720
        CoordinateSystem=1
        MaxParticles=4
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=-0.1690000,Max=0.3380000),Y=(Min=0.3194100,Max=0.6388200),Z=(Min=0.3194100,Max=0.6388200))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.8870010,Max=40.8870010),Y=(Min=40.8870010,Max=40.8870010),Z=(Min=40.8870010,Max=40.8870010))
        InitialParticlesPerSecond=10885.4921875
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_big01'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SubdivisionEnd=1
        LifetimeRange=(Min=1.1834320,Max=1.1834320)
        InitialDelayRange=(Min=0.0000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-16.5045376,Max=60.0625992),Y=(Min=-16.5045376,Max=65.2339935),Z=(Min=11.1877995,Max=65.1410446))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[2]=SpriteEmitter9
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Teen_blood_hit.SpriteEmitter11'
    begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.3000000
        FadeOutStartTime=0.4497040
        FadeInEndTime=0.0591720
        CoordinateSystem=1
        MaxParticles=1
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.1690000,Max=0.5070000),Y=(Min=0.3194100,Max=0.6388200),Z=(Min=0.3194100,Max=0.6388200))
        StartSpinRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.8869991,Max=30.8869991),Y=(Min=30.8869991,Max=30.8869991),Z=(Min=30.8869991,Max=30.8869991))
        InitialParticlesPerSecond=10885.4921875
        DrawStyle=5
        Texture=Texture'FX_TEX.Smoke.smoke_fire'
        SubdivisionEnd=1
        LifetimeRange=(Min=1.1834320,Max=1.1834320)
        InitialDelayRange=(Min=0.0000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-16.5049992,Max=26.2630005),Y=(Min=-31.4340000,Max=31.4340000),Z=(Min=11.1879997,Max=51.3409996))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[3]=SpriteEmitter11
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Teen_blood_hit.SpriteEmitter13'
    begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=78.2985687,Y=78.2985687,Z=-374.2344360)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0609610
        MaxParticles=4
        SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        StartSizeRange=(X=(Min=2.0000000,Max=5.0000000),Y=(Min=2.0000000,Max=5.0000000),Z=(Min=2.0000000,Max=5.0000000))
        InitialParticlesPerSecond=40599.4765625
        Texture=Texture'FX_TEX.Flares.Laser_Flare'
        LifetimeRange=(Min=0.2083330,Max=0.6944440)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=201.6000061),Y=(Min=-201.6000061,Max=201.6000061),Z=(Min=-201.6000061,Max=201.6000061))
    end object
    Emitters[4]=SpriteEmitter13
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Teen_blood_hit.SpriteEmitter14'
    begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0305020
        CoordinateSystem=1
        MaxParticles=2
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.8828350,Max=0.8828350),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=24.0000000,Max=24.0000000),Y=(Min=24.0000000,Max=24.0000000),Z=(Min=24.0000000,Max=24.0000000))
        InitialParticlesPerSecond=83775.0625000
        Texture=Texture'FX_TEX.Hit_Effects.Metal_Spark_03'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.1575490,Max=0.1575490)
    end object
    Emitters[5]=SpriteEmitter14
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Teen_blood_hit.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-279.0799866)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0540000
        FadeInEndTime=0.0060000
        CoordinateSystem=1
        MaxParticles=3
        StartLocationShape=2
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1130400,Max=0.1130400),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
        InitialParticlesPerSecond=1109.7650146
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_china_05'
        TextureUSubdivisions=2
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-50.0000000,Max=80.0000000))
    end object
    Emitters[6]=SpriteEmitter0
    AutoDestroy=true
    bNoDelete=false
}