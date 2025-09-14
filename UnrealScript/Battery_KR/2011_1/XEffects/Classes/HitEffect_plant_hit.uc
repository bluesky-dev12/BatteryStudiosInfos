class HitEffect_plant_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_plant_hit.SpriteEmitter161'
    begin object name="SpriteEmitter161" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        DampRotation=true
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-934.3749390)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.2800000,Max=0.2800000),Y=(Min=0.2800000,Max=0.2800000),Z=(Min=0.2800000,Max=0.2800000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.6666670
        MaxParticles=5
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-2.2500000,Max=2.2500000),Y=(Min=-6.1689601,Max=6.1689601),Z=(Min=-6.1689601,Max=6.1689601))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=5.9000001,Max=9.0000000),Y=(Min=5.9000001,Max=9.0000000),Z=(Min=5.9000001,Max=9.0000000))
        InitialParticlesPerSecond=3084.4799805
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_grass'
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=0.0000000,Max=325.0000000),Y=(Min=-325.0000000,Max=325.0000000),Z=(Min=-285.0000000,Max=445.0000000))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[0]=SpriteEmitter161
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_plant_hit.SpriteEmitter8'
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
        Acceleration=(X=156.1918793,Y=54.5875206,Z=61.8664818)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3600000
        FadeOutStartTime=0.2470000
        FadeInEndTime=0.0570000
        CoordinateSystem=1
        MaxParticles=3
        StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=-0.9000000,Max=0.9000000),Y=(Min=0.0810000,Max=0.1620000),Z=(Min=0.0810000,Max=0.1620000))
        StartSpinRange=(X=(Min=-0.9000000,Max=0.9000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=124.8000031,Max=124.8000031),Y=(Min=124.8000031,Max=124.8000031),Z=(Min=124.8000031,Max=124.8000031))
        InitialParticlesPerSecond=7668.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire'
        SubdivisionEnd=1
        LifetimeRange=(Min=1.9000000,Max=1.9000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=-51.7920036,Max=51.7920036),Y=(Min=-101.0880051,Max=101.0880051),Z=(Min=-33.6960030,Max=33.6960030))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[1]=SpriteEmitter8
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_plant_hit.SpriteEmitter10'
    begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=2627.0244141,Y=0.0000000,Z=-416.9880066)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0444440
        FadeInEndTime=0.0066670
        CoordinateSystem=1
        MaxParticles=1
        DetailMode=1
        StartLocationShape=2
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1130400,Max=0.1130400),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=72.0000000,Max=72.0000000),Y=(Min=72.0000000,Max=72.0000000),Z=(Min=72.0000000,Max=72.0000000))
        InitialParticlesPerSecond=1109.7650146
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.hit_dirt'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=0.0000000,Max=116.2727280),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        MaxAbsVelocity=(X=238.5054779,Y=0.0000000,Z=0.0000000)
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[2]=SpriteEmitter10
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_plant_hit.SpriteEmitter11'
    begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=18.0000000,Max=18.0000000),Y=(Min=18.0000000,Max=18.0000000),Z=(Min=18.0000000,Max=18.0000000))
        InitialParticlesPerSecond=13.5000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit.hit_muzzle_c'
        SubdivisionEnd=1
        LifetimeRange=(Min=0.1111110,Max=0.1111110)
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[3]=SpriteEmitter11
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_plant_hit.SpriteEmitter12'
    begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=4800.0000000,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4300000
        FadeOutStartTime=0.0178500
        CoordinateSystem=1
        MaxParticles=2
        StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationRange=(X=(Min=-36.0000000,Max=36.0000000),Y=(Min=-64.8000031,Max=64.8000031),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        StartSizeRange=(X=(Min=24.0000000,Max=24.0000000),Y=(Min=84.0000000,Max=84.0000000),Z=(Min=24.0000000,Max=24.0000000))
        InitialParticlesPerSecond=1000.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.hit_impact_01'
        TextureUSubdivisions=4
        TextureVSubdivisions=1
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.1190000,Max=0.1190000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=112.3199997,Max=112.3199997),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[4]=SpriteEmitter12
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_plant_hit.SpriteEmitter13'
    begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
        UseColorScale=true
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
        FadeOutStartTime=0.1100000
        FadeInEndTime=0.0400000
        CoordinateSystem=1
        MaxParticles=1
        StartLocationOffset=(X=30.0000000,Y=2.0000000,Z=3.0000000)
        StartLocationShape=2
        StartLocationPolarRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=0.3030000,Max=0.4030000),Y=(Min=0.0756000,Max=0.1512000),Z=(Min=0.0756000,Max=0.1512000))
        StartSpinRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=78.0000000,Max=78.0000000),Y=(Min=78.0000000,Max=78.0000000),Z=(Min=78.0000000,Max=78.0000000))
        InitialParticlesPerSecond=1123.4160156
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_far'
        SubdivisionEnd=1
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        StartVelocityRange=(X=(Min=39.9671974,Max=39.9671974),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[5]=SpriteEmitter13
    AutoDestroy=true
    bNoDelete=false
}