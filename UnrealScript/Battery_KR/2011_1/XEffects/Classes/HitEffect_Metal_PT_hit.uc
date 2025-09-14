class HitEffect_Metal_PT_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Metal_PT_hit.SpriteEmitter121'
    begin object name="SpriteEmitter121" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.5400000
        FadeOutStartTime=0.0277780
        FadeInEndTime=0.0111110
        CoordinateSystem=1
        MaxParticles=1
        DetailMode=1
        SpinsPerSecondRange=(X=(Min=-0.7000000,Max=0.7000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.7000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=105.6000061,Max=105.6000061),Y=(Min=105.6000061,Max=105.6000061),Z=(Min=105.6000061,Max=105.6000061))
        InitialParticlesPerSecond=21600.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        LifetimeRange=(Min=0.2777780,Max=0.2777780)
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[0]=SpriteEmitter121
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Metal_PT_hit.SpriteEmitter123'
    begin object name="SpriteEmitter123" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=52.1599007,Y=45.4895973,Z=51.5554008)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2000000
        FadeOutStartTime=0.2470000
        FadeInEndTime=0.0570000
        CoordinateSystem=1
        MaxParticles=1
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.2160000,Max=0.8640000),Y=(Min=0.0810000,Max=0.1620000),Z=(Min=0.0810000,Max=0.1620000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.7000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=65.0000000,Max=65.0000000),Y=(Min=65.0000000,Max=65.0000000),Z=(Min=65.0000000,Max=65.0000000))
        InitialParticlesPerSecond=7668.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire'
        SubdivisionEnd=1
        LifetimeRange=(Min=0.6000000,Max=0.6000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-43.1599998,Max=43.1599998),Y=(Min=-84.2399979,Max=84.2399979),Z=(Min=-28.0799999,Max=28.0799999))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[1]=SpriteEmitter123
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Metal_PT_hit.SpriteEmitter126'
    begin object name="SpriteEmitter126" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0266670
        FadeInEndTime=0.0016670
        CoordinateSystem=1
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=0.2400000,Max=0.2400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=37.5999985,Max=37.5999985),Y=(Min=37.5999985,Max=37.5999985),Z=(Min=37.5999985,Max=37.5999985))
        InitialParticlesPerSecond=43200.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit.hit_muzzle_c'
        LifetimeRange=(Min=0.1666670,Max=0.1666670)
    end object
    Emitters[2]=SpriteEmitter126
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Metal_PT_hit.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
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
        MaxParticles=2
        SizeScale=/* Array type was not detected. */
        SizeScaleRepeats=1.0000000
        StartSizeRange=(X=(Min=42.0000000,Max=42.0000000),Y=(Min=42.0000000,Max=42.0000000),Z=(Min=42.0000000,Max=42.0000000))
        InitialParticlesPerSecond=360.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit.Metal_hit_Spark'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SubdivisionEnd=4
        LifetimeRange=(Min=0.2500000,Max=0.2500000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[3]=SpriteEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Metal_PT_hit.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1011.2687378)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2254900
        FadeInEndTime=0.1078430
        MaxParticles=2
        DetailMode=1
        StartLocationRange=(X=(Min=-36.0000000,Max=36.0000000),Y=(Min=-64.8000031,Max=64.8000031),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=1.0000000,Max=1.0000000))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.8000000,Max=0.8000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=247.1999969),Y=(Min=-247.1999969,Max=247.1999969),Z=(Min=36.7200012,Max=440.6400146))
        GetVelocityDirectionFrom=3
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[4]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_Metal_PT_hit.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        DampRotation=true
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-900.4668579)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.2580000,Max=0.3800000),Y=(Min=0.2580000,Max=0.3800000),Z=(Min=0.2580000,Max=0.3800000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.8658010
        MaxParticles=2
        DetailMode=1
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-1.7330000,Max=1.7330000),Y=(Min=-4.7501001,Max=4.7501001),Z=(Min=-4.7501001,Max=4.7501001))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=1.0000000,Max=4.0000000),Y=(Min=1.0000000,Max=4.0000000),Z=(Min=1.0000000,Max=4.0000000))
        InitialParticlesPerSecond=2375.0500488
        DrawStyle=1
        Texture=Texture'FX_TEX.Emitter.deco_paper03'
        LifetimeRange=(Min=1.2987010,Max=1.2987010)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=423.5000000),Y=(Min=-423.5000000,Max=423.5000000),Z=(Min=-180.9499969,Max=488.9500122))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[5]=SpriteEmitter1
    AutoDestroy=true
    bNoDelete=false
}