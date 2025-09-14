class Pistol_MuzFlash_smoke_3RD extends EmitterThirdPerson;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Pistol_MuzFlash_smoke_3RD.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=147.8463898,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3000000
        FadeOutStartTime=0.2098960
        FadeInEndTime=0.0135420
        CoordinateSystem=1
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=-0.1920000,Max=0.1920000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=26.0000000,Max=26.0000000),Y=(Min=26.0000000,Max=26.0000000),Z=(Min=26.0000000,Max=26.0000000))
        InitialParticlesPerSecond=35836.4179688
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        StartVelocityRange=(X=(Min=139.3599854,Max=139.3599854),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.Pistol_MuzFlash_smoke_3RD.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=147.8463898,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3000000
        FadeOutStartTime=0.2098960
        FadeInEndTime=0.0135420
        CoordinateSystem=1
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=-0.1920000,Max=0.1920000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=26.0000000,Max=26.0000000),Y=(Min=26.0000000,Max=26.0000000),Z=(Min=26.0000000,Max=26.0000000))
        InitialParticlesPerSecond=35836.4179688
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=139.3599854,Max=139.3599854),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.Pistol_MuzFlash_smoke_3RD.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
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
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=0.2400000,Max=0.2400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=52.0000000,Max=52.0000000),Y=(Min=52.0000000,Max=52.0000000),Z=(Min=52.0000000,Max=52.0000000))
        InitialParticlesPerSecond=43200.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Muzzle_Flashes.muzzleflash_3rd_light'
        LifetimeRange=(Min=0.1666670,Max=0.1666670)
    end object
    Emitters[2]=SpriteEmitter2
    AutoDestroy=true
    bNoDelete=false
}