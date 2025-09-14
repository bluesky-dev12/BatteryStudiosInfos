class HitEffect_Wood_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Wood_hit.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=95.9937744,Y=29.9424191,Z=47.5134583)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2500000
        FadeOutStartTime=0.2572920
        FadeInEndTime=0.0593750
        CoordinateSystem=1
        MaxParticles=2
        StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=-0.6720000,Max=0.6720000),Y=(Min=0.0777600,Max=0.1555200),Z=(Min=0.0777600,Max=0.1555200))
        StartSpinRange=(X=(Min=-0.7000000,Max=0.7000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=78.0000000,Max=78.0000000),Y=(Min=78.0000000,Max=78.0000000),Z=(Min=78.0000000,Max=78.0000000))
        InitialParticlesPerSecond=7361.2797852
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire_yel'
        SubdivisionEnd=1
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-41.4336014,Max=41.4336014),Y=(Min=-80.8704071,Max=80.8704071),Z=(Min=-26.9568024,Max=26.9568024))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Wood_hit.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        DampRotation=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-691.5585938)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.0822520
        MaxParticles=6
        DetailMode=1
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-1.3860000,Max=1.3860000),Y=(Min=-3.8000801,Max=3.8000801),Z=(Min=-3.8000801,Max=3.8000801))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=2.4000001,Max=4.1999998),Y=(Min=2.4000001,Max=4.1999998),Z=(Min=2.4000001,Max=4.1999998))
        InitialParticlesPerSecond=1900.0400391
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.Wood_Debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=1
        LifetimeRange=(Min=1.6233770,Max=1.6233770)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-406.5600281,Max=406.5600281),Y=(Min=-406.5600281,Max=406.5600281),Z=(Min=-173.7120056,Max=469.3920288))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[1]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Wood_hit.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=1528.4505615,Y=0.0000000,Z=-242.6112213)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0555550
        FadeInEndTime=0.0083340
        CoordinateSystem=1
        MaxParticles=1
        DetailMode=1
        StartLocationShape=2
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0904320,Max=0.0904320),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=124.0000000,Max=124.0000000),Y=(Min=124.0000000,Max=124.0000000),Z=(Min=124.0000000,Max=124.0000000))
        InitialParticlesPerSecond=887.8120117
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.hit_dirt'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=84.5623932,Max=84.5623932),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        MaxAbsVelocity=(X=152.6435089,Y=0.0000000,Z=0.0000000)
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[2]=SpriteEmitter4
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Wood_hit.SpriteEmitter5'
    begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
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
    Emitters[3]=SpriteEmitter5
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Wood_hit.SpriteEmitter6'
    begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=5200.0000000,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3800000
        FadeOutStartTime=0.0178500
        CoordinateSystem=1
        MaxParticles=1
        StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationRange=(X=(Min=-39.0000000,Max=39.0000000),Y=(Min=-70.1999969,Max=70.1999969),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        StartSizeRange=(X=(Min=6.5000000,Max=6.5000000),Y=(Min=52.0000000,Max=52.0000000),Z=(Min=6.5000000,Max=6.5000000))
        InitialParticlesPerSecond=1000.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire_yel'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.1190000,Max=0.1190000)
        StartVelocityRange=(X=(Min=121.6799927,Max=121.6799927),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        CullDistance=800.0000000
        DisableIfCulled=true
    end object
    Emitters[4]=SpriteEmitter6
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Wood_hit.SpriteEmitter7'
    begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
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
        Opacity=0.2000000
        FadeOutStartTime=0.1100000
        FadeInEndTime=0.0400000
        CoordinateSystem=1
        MaxParticles=1
        StartLocationOffset=(X=30.0000000,Y=2.0000000,Z=3.0000000)
        StartLocationShape=2
        StartLocationPolarRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0756000,Max=0.1512000),Z=(Min=0.0756000,Max=0.1512000))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=78.0000000,Max=78.0000000),Y=(Min=78.0000000,Max=78.0000000),Z=(Min=78.0000000,Max=78.0000000))
        InitialParticlesPerSecond=1123.4160156
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire_yel'
        SubdivisionEnd=1
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        StartVelocityRange=(X=(Min=39.9671974,Max=39.9671974),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[5]=SpriteEmitter7
    AutoDestroy=true
    bNoDelete=false
}