class HitEffect_blood_death_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_death_hit.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=63.9620018,Y=56.1819992,Z=-400.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0490000
        MaxParticles=7
        StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0520000,Max=0.0520000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
        InitialParticlesPerSecond=1230.2149658
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.blood_animated1_alpha_02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.8000000,Max=0.8000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-19.6289997,Max=179.6770020))
        MaxAbsVelocity=(X=584.0029907,Y=800.0000000,Z=0.0000000)
    end object
    Emitters[0]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_death_hit.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=63.9620018,Y=56.1819992,Z=-450.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3609470
        StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0520000,Max=0.0520000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
        InitialParticlesPerSecond=1230.2149658
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_blood_ani_01'
        TextureUSubdivisions=2
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.8000000,Max=0.8000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=-19.6289997,Max=189.6770020))
    end object
    Emitters[1]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_death_hit.SpriteEmitter7'
    begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=19.9880009)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3400000
        FadeOutStartTime=0.0950000
        FadeInEndTime=0.0950000
        CoordinateSystem=1
        MaxParticles=3
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.2160000,Max=0.6000000),Y=(Min=0.2250000,Max=0.4500000),Z=(Min=0.2250000,Max=0.4500000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.2400017,Max=50.2400017),Y=(Min=50.2400017,Max=50.2400017),Z=(Min=50.2400017,Max=50.2400017))
        InitialParticlesPerSecond=7668.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_no'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SubdivisionEnd=1
        LifetimeRange=(Min=1.9000000,Max=1.9000000)
        InitialDelayRange=(Min=0.0000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-5.7329998,Max=26.7329998),Y=(Min=-22.6590004,Max=22.6590004),Z=(Min=3.8859999,Max=10.8859997))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[2]=SpriteEmitter7
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_death_hit.SpriteEmitter8'
    begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=19.9880009)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3400000
        FadeOutStartTime=0.0950000
        FadeInEndTime=0.0950000
        CoordinateSystem=1
        MaxParticles=2
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.2160000,Max=0.6000000),Y=(Min=0.2250000,Max=0.4500000),Z=(Min=0.2250000,Max=0.4500000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.2400017,Max=50.2400017),Y=(Min=50.2400017,Max=50.2400017),Z=(Min=50.2400017,Max=50.2400017))
        InitialParticlesPerSecond=7668.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_no'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SubdivisionEnd=1
        LifetimeRange=(Min=1.9000000,Max=1.9000000)
        InitialDelayRange=(Min=0.0000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-5.7329998,Max=26.7329998),Y=(Min=-22.6590004,Max=22.6590004),Z=(Min=3.8859999,Max=10.8859997))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[3]=SpriteEmitter8
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_death_hit.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
        UseDirectionAs=3
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.9658960,Y=0.9658960,Z=0.9658960)
        ColorScale=/* Array type was not detected. */
        CoordinateSystem=1
        MaxParticles=3
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0550000,Max=0.0550000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
        InitialParticlesPerSecond=1209.0560303
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.blood_animated1_alpha_01'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.0175010,Max=1.0175010)
        StartVelocityRange=(X=(Min=0.9828000,Max=0.9828000),Y=(Min=0.9828000,Max=0.9828000),Z=(Min=0.9828000,Max=0.9828000))
        MaxAbsVelocity=(X=0.9658960,Y=1.0000000,Z=0.9828000)
    end object
    Emitters[4]=SpriteEmitter9
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_death_hit.SpriteEmitter11'
    begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.8100000
        FadeOutStartTime=0.0066670
        FadeInEndTime=0.0022220
        CoordinateSystem=1
        MaxParticles=1
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.2260000,Max=1.3500000),Y=(Min=0.2250000,Max=0.4500000),Z=(Min=0.2250000,Max=0.4500000))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
        InitialParticlesPerSecond=13.5000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit.hit_muzzle_c'
        SubdivisionEnd=1
        LifetimeRange=(Min=0.1111110,Max=0.1111110)
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[5]=SpriteEmitter11
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_death_hit.SpriteEmitter13'
    begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1936030
        CoordinateSystem=1
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
        InitialParticlesPerSecond=13198.6806641
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.headshot_blood02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.8417510,Max=0.8417510)
    end object
    Emitters[6]=SpriteEmitter13
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_death_hit.SpriteEmitter14'
    begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-562.5000000)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.4000000,Max=0.5000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2136750
        FadeInEndTime=0.0457880
        CoordinateSystem=1
        MaxParticles=2
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-3.5100000,Max=3.5100000),Y=(Min=-5.0722890,Max=5.0722890),Z=(Min=-5.0722890,Max=5.0722890))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=15.6999998,Max=15.6999998),Y=(Min=15.6999998,Max=15.6999998),Z=(Min=15.6999998,Max=15.6999998))
        InitialParticlesPerSecond=2536.1489258
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_blood_ani_03'
        TextureUSubdivisions=2
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.6000000,Max=0.6000000)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-180.0000000,Max=0.0000000))
        CullDistance=8000.0000000
        DisableIfCulled=true
    end object
    Emitters[7]=SpriteEmitter14
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_death_hit.SpriteEmitter15'
    begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-645.0804443)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.4000000,Max=0.5000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1642400
        FadeInEndTime=0.0351940
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-6.5990090,Max=6.5990090),Z=(Min=-6.5990090,Max=6.5990090))
        StartSpinRange=(X=(Min=-0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=0.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=5.0000000))
        InitialParticlesPerSecond=3299.5100098
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.headshot_blood01'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.7174010,Max=0.7174010)
        InitialDelayRange=(Min=0.1500000,Max=0.1500000)
        StartVelocityRange=(X=(Min=-119.3919983,Max=119.3919983),Y=(Min=-119.3919983,Max=119.3919983),Z=(Min=-18.9270000,Max=452.1570129))
        CullDistance=8000.0000000
        DisableIfCulled=true
    end object
    Emitters[8]=SpriteEmitter15
    AutoDestroy=true
    bNoDelete=false
}