class AR_MuzFlash_smoke_3RD extends EmitterThirdPerson;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.AR_MuzFlash_smoke_3RD.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=246.9999847,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3000000
        FadeOutStartTime=0.2015000
        FadeInEndTime=0.0130000
        CoordinateSystem=1
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=39.0000000,Max=39.0000000),Y=(Min=39.0000000,Max=39.0000000),Z=(Min=39.0000000,Max=39.0000000))
        InitialParticlesPerSecond=37329.6015625
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.6500000,Max=0.6500000)
        StartVelocityRange=(X=(Min=325.0000000,Max=325.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.AR_MuzFlash_smoke_3RD.SpriteEmitter1'
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
        Acceleration=(X=220.9999847,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3000000
        FadeOutStartTime=0.2015000
        FadeInEndTime=0.0130000
        CoordinateSystem=1
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=39.0000000,Max=39.0000000),Y=(Min=39.0000000,Max=39.0000000),Z=(Min=39.0000000,Max=39.0000000))
        InitialParticlesPerSecond=37329.6015625
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.6500000,Max=0.6500000)
        InitialDelayRange=(Min=0.1800000,Max=0.1800000)
        StartVelocityRange=(X=(Min=325.0000000,Max=325.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.AR_MuzFlash_smoke_3RD.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
        InitialParticlesPerSecond=43200.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Muzzle_Flashes.muzzleflash_3rd_light'
        LifetimeRange=(Min=0.1666670,Max=0.1666670)
    end object
    Emitters[2]=SpriteEmitter3
    AutoDestroy=true
    bNoDelete=false
}