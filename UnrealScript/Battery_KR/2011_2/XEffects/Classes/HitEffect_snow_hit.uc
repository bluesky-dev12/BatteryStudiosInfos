class HitEffect_snow_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_snow_hit.SpriteEmitter14'
    begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=100.7958374,Y=35.2271500,Z=39.9245071)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5600000
        FadeOutStartTime=0.4965910
        CoordinateSystem=1
        MaxParticles=2
        StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=-0.2640000,Max=0.2640000),Y=(Min=0.0712800,Max=0.1425600),Z=(Min=0.0712800,Max=0.1425600))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=116.9999924,Max=116.9999924),Y=(Min=116.9999924,Max=116.9999924),Z=(Min=116.9999924,Max=116.9999924))
        InitialParticlesPerSecond=6747.8398438
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire'
        SubdivisionEnd=1
        LifetimeRange=(Min=2.1590910,Max=2.1590910)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=-37.9808006,Max=37.9808006),Y=(Min=-74.1312027,Max=74.1312027),Z=(Min=-24.7104015,Max=24.7104015))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[0]=SpriteEmitter14
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_snow_hit.SpriteEmitter15'
    begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        DampRotation=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-900.4668579)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3580000,Max=0.4800000),Y=(Min=0.3580000,Max=0.4800000),Z=(Min=0.3580000,Max=0.4800000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.8658010
        MaxParticles=5
        DetailMode=1
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-1.7330000,Max=1.7330000),Y=(Min=-4.7501001,Max=4.7501001),Z=(Min=-4.7501001,Max=4.7501001))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=3.0000000,Max=5.0000000),Y=(Min=3.0000000,Max=5.0000000),Z=(Min=3.0000000,Max=5.0000000))
        InitialParticlesPerSecond=2375.0500488
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_snow_debirs'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=1.2987010,Max=1.2987010)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=423.5000000),Y=(Min=-423.5000000,Max=423.5000000),Z=(Min=-180.9499969,Max=488.9500122))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[1]=SpriteEmitter15
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_snow_hit.SpriteEmitter16'
    begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=2388.2038574,Y=0.0000000,Z=-379.0799866)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0444440
        FadeInEndTime=0.0066670
        CoordinateSystem=1
        MaxParticles=1
        StartLocationShape=2
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1130400,Max=0.1130400),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=97.0000000,Max=97.0000000),Y=(Min=97.0000000,Max=97.0000000),Z=(Min=97.0000000,Max=97.0000000))
        InitialParticlesPerSecond=1109.7650146
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_01'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=0.0000000,Max=85.7020035),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        MaxAbsVelocity=(X=238.5054779,Y=0.0000000,Z=0.0000000)
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[2]=SpriteEmitter16
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_snow_hit.SpriteEmitter19'
    begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=759.5080566,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4500000
        FadeOutStartTime=0.1100000
        FadeInEndTime=0.0400000
        CoordinateSystem=1
        MaxParticles=1
        StartLocationOffset=(X=10.0000000,Y=2.0000000,Z=3.0000000)
        StartLocationShape=2
        StartLocationPolarRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=0.3030000,Max=0.4030000),Y=(Min=0.0756000,Max=0.1512000),Z=(Min=0.0756000,Max=0.1512000))
        StartSpinRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=78.0000000,Max=78.0000000),Y=(Min=78.0000000,Max=78.0000000),Z=(Min=78.0000000,Max=78.0000000))
        InitialParticlesPerSecond=1123.4160156
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire'
        SubdivisionEnd=1
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        StartVelocityRange=(X=(Min=39.9671974,Max=39.9671974),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[3]=SpriteEmitter19
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_snow_hit.SpriteEmitter23'
    begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=2200.0000000,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.8500000
        FadeOutStartTime=0.0190000
        FadeInEndTime=0.0040000
        CoordinateSystem=1
        MaxParticles=2
        StartLocationRange=(X=(Min=-39.0000000,Max=39.0000000),Y=(Min=-70.1999969,Max=70.1999969),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=5.0000000,Max=5.0000000))
        InitialParticlesPerSecond=1000.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_snow_01'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.1000000,Max=0.1000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=82.6799927,Max=82.6799927),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[4]=SpriteEmitter23
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_snow_hit.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.6100000
        FadeOutStartTime=0.0066670
        FadeInEndTime=0.0022220
        CoordinateSystem=1
        MaxParticles=1
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.2260000,Max=1.3500000),Y=(Min=0.2250000,Max=0.4500000),Z=(Min=0.2250000,Max=0.4500000))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=24.0000000,Max=24.0000000),Y=(Min=24.0000000,Max=24.0000000),Z=(Min=24.0000000,Max=24.0000000))
        InitialParticlesPerSecond=13.5000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit.hit_muzzle_c'
        SubdivisionEnd=1
        LifetimeRange=(Min=0.1111110,Max=0.1111110)
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[5]=SpriteEmitter0
    AutoDestroy=true
    bNoDelete=false
}