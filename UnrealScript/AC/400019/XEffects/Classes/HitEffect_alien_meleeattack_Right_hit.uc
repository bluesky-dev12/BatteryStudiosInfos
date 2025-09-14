class HitEffect_alien_meleeattack_Right_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_alien_meleeattack_Right_hit.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-167.3188171)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0277780
        FadeInEndTime=0.0069440
        CoordinateSystem=1
        StartLocationRange=(X=(Min=-39.0000000,Max=39.0000000),Y=(Min=-70.1999969,Max=70.1999969),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=1.0000000,Max=1.0000000))
        InitialParticlesPerSecond=9165354.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.2314810,Max=0.2314810)
        StartVelocityRange=(X=(Min=0.0000000,Max=107.0400009),Y=(Min=-107.0400009,Max=107.0400009),Z=(Min=-204.0024109,Max=258.0744019))
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter9
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_alien_meleeattack_Right_hit.SpriteEmitter10'
    begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.2800000
        FadeOutStartTime=0.1942220
        FadeInEndTime=0.0126670
        CoordinateSystem=1
        MaxParticles=6
        StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.3645000,Max=0.7290000),Z=(Min=0.3645000,Max=0.7290000))
        StartSpinRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=34506.0000000
        DrawStyle=5
        Texture=Texture'FX_TEX.Smoke.explo_smoke_noalpha_ani02'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        SubdivisionEnd=1
        LifetimeRange=(Min=0.4222220,Max=0.4222220)
        StartVelocityRange=(X=(Min=0.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[1]=SpriteEmitter10
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_alien_meleeattack_Right_hit.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
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
        MaxParticles=2
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
        InitialParticlesPerSecond=69812.5468750
        Texture=Texture'FX_TEX.Hit_Effects.Metal_Spark_02'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[2]=SpriteEmitter1
    AutoDestroy=true
    bNoDelete=false
}