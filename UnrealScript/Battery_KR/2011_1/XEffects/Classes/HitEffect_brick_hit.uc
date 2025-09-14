class HitEffect_brick_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_brick_hit.SpriteEmitter8'
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
        Acceleration=(X=130.1598969,Y=45.4895973,Z=51.5554008)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4500000
        FadeOutStartTime=0.2470000
        FadeInEndTime=0.0570000
        CoordinateSystem=1
        MaxParticles=3
        StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=-0.9000000,Max=0.9000000),Y=(Min=0.0810000,Max=0.1620000),Z=(Min=0.0810000,Max=0.1620000))
        StartSpinRange=(X=(Min=-0.9000000,Max=0.9000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=104.0000000,Max=104.0000000),Y=(Min=104.0000000,Max=104.0000000),Z=(Min=104.0000000,Max=104.0000000))
        InitialParticlesPerSecond=7668.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire'
        SubdivisionEnd=1
        LifetimeRange=(Min=1.9000000,Max=1.9000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=-43.1599998,Max=43.1599998),Y=(Min=-84.2399979,Max=84.2399979),Z=(Min=-28.0799999,Max=28.0799999))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter8
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_brick_hit.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        DampRotation=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1080.5603027)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3580000,Max=0.4800000),Y=(Min=0.3580000,Max=0.4800000),Z=(Min=0.3580000,Max=0.4800000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.8658010
        MaxParticles=6
        DetailMode=1
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-1.7330000,Max=1.7330000),Y=(Min=-4.7501001,Max=4.7501001),Z=(Min=-4.7501001,Max=4.7501001))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=1.8000000,Max=3.0000000),Y=(Min=1.8000000,Max=3.0000000),Z=(Min=1.8000000,Max=3.0000000))
        InitialParticlesPerSecond=2375.0500488
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.Dirt_Debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=1
        LifetimeRange=(Min=1.2987010,Max=1.2987010)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-508.2000122,Max=508.2000122),Y=(Min=-508.2000122,Max=508.2000122),Z=(Min=-217.1399994,Max=586.7400513))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[1]=SpriteEmitter9
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_brick_hit.SpriteEmitter10'
    begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
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
        DetailMode=1
        StartLocationShape=2
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1130400,Max=0.1130400),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=65.0000000,Max=65.0000000),Y=(Min=65.0000000,Max=65.0000000),Z=(Min=65.0000000,Max=65.0000000))
        InitialParticlesPerSecond=1109.7650146
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.hit_dirt'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=0.0000000,Max=105.7024765),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        MaxAbsVelocity=(X=238.5054779,Y=0.0000000,Z=0.0000000)
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[2]=SpriteEmitter10
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_brick_hit.SpriteEmitter11'
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
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_brick_hit.SpriteEmitter12'
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
        Opacity=0.7200000
        FadeOutStartTime=0.0178500
        CoordinateSystem=1
        MaxParticles=1
        DetailMode=1
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
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_brick_hit.SpriteEmitter13'
    begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
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
        Opacity=0.3600000
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
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire'
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