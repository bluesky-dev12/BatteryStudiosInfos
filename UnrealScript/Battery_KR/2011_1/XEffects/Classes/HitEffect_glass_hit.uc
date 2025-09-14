class HitEffect_glass_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_glass_hit.SpriteEmitter155'
    begin object name="SpriteEmitter155" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.8600000
        FadeOutStartTime=0.1640000
        CoordinateSystem=1
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=18.0000000,Max=18.0000000),Y=(Min=18.0000000,Max=18.0000000),Z=(Min=18.0000000,Max=18.0000000))
        InitialParticlesPerSecond=30000.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit.hit_muzzle_c'
        SubdivisionEnd=4
        LifetimeRange=(Min=0.2000000,Max=0.2000000)
    end object
    Emitters[0]=SpriteEmitter155
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_glass_hit.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=143.1758881,Y=50.0385590,Z=56.7109413)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4500000
        FadeOutStartTime=0.2470000
        FadeInEndTime=0.0570000
        CoordinateSystem=1
        MaxParticles=4
        StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=-0.9000000,Max=0.9000000),Y=(Min=0.0810000,Max=0.1620000),Z=(Min=0.0810000,Max=0.1620000))
        StartSpinRange=(X=(Min=-0.9000000,Max=0.9000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=128.6999969,Max=128.6999969),Y=(Min=128.6999969,Max=128.6999969),Z=(Min=128.6999969,Max=128.6999969))
        InitialParticlesPerSecond=7668.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire'
        SubdivisionEnd=1
        LifetimeRange=(Min=1.9000000,Max=1.9000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=-47.4760017,Max=47.4760017),Y=(Min=-92.6640015,Max=92.6640015),Z=(Min=-30.8880005,Max=30.8880005))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[1]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_glass_hit.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        DampRotation=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1025.5638428)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3580000,Max=0.4800000),Y=(Min=0.3580000,Max=0.4800000),Z=(Min=0.3580000,Max=0.4800000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2358750
        MaxParticles=5
        DetailMode=1
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-1.7550000,Max=1.7550000),Y=(Min=-4.4460940,Max=4.4460940),Z=(Min=-4.4460940,Max=4.4460940))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=3.0000000,Max=6.5000000),Y=(Min=3.0000000,Max=6.5000000),Z=(Min=3.0000000,Max=6.5000000))
        InitialParticlesPerSecond=2223.0471191
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.glass_debri'
        TextureUSubdivisions=4
        TextureVSubdivisions=1
        LifetimeRange=(Min=1.3875010,Max=1.3875010)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=263.2149963),Y=(Min=-363.2149963,Max=363.2149963),Z=(Min=-220.1799927,Max=594.9539795))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[2]=SpriteEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_glass_hit.SpriteEmitter6'
    begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=5280.0000000,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.7200000
        FadeOutStartTime=0.0178500
        CoordinateSystem=1
        MaxParticles=2
        DetailMode=1
        StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationRange=(X=(Min=-39.5999985,Max=39.5999985),Y=(Min=-71.2799988,Max=71.2799988),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        StartSizeRange=(X=(Min=26.4000015,Max=26.4000015),Y=(Min=92.4000015,Max=92.4000015),Z=(Min=26.4000015,Max=26.4000015))
        InitialParticlesPerSecond=1000.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.hit_impact_01'
        TextureUSubdivisions=4
        TextureVSubdivisions=1
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.1190000,Max=0.1190000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=123.5520020,Max=123.5520020),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[3]=SpriteEmitter6
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_glass_hit.SpriteEmitter7'
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
        Opacity=0.4500000
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
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[4]=SpriteEmitter7
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_glass_hit.SpriteEmitter36'
    begin object name="SpriteEmitter36" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2916670
        CoordinateSystem=1
        MaxParticles=3
        SizeScale=/* Array type was not detected. */
        SizeScaleRepeats=1.0000000
        StartSizeRange=(X=(Min=32.0000000,Max=32.0000000),Y=(Min=32.0000000,Max=32.0000000),Z=(Min=32.0000000,Max=32.0000000))
        InitialParticlesPerSecond=360.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit.Metal_hit_Spark'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SubdivisionEnd=4
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[5]=SpriteEmitter36
    AutoDestroy=true
    bNoDelete=false
}