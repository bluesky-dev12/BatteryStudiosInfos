class EF_Flash_3rd_M2B_smoke extends EmitterThirdPerson;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.EF_Flash_3rd_M2B_smoke.SpriteEmitter1'
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
        Acceleration=(X=43.2000046,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2000000
        FadeOutStartTime=0.3358330
        FadeInEndTime=0.0866670
        CoordinateSystem=1
        MaxParticles=1
        DetailMode=1
        SpinsPerSecondRange=(X=(Min=-0.1200000,Max=0.1200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        InitialParticlesPerSecond=22397.7617188
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=1.0833330,Max=1.0833330)
        InitialDelayRange=(Min=0.3500000,Max=0.3500000)
        StartVelocityRange=(X=(Min=78.0000000,Max=78.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=9.0000000,Max=9.0000000))
    end object
    Emitters[0]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.EF_Flash_3rd_M2B_smoke.SpriteEmitter2'
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
        Acceleration=(X=36.0000038,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2000000
        FadeOutStartTime=0.3358330
        FadeInEndTime=0.0650000
        CoordinateSystem=1
        MaxParticles=1
        DetailMode=1
        SpinsPerSecondRange=(X=(Min=-0.1200000,Max=0.1200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        InitialParticlesPerSecond=22397.7617188
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=1.0833330,Max=1.0833330)
        InitialDelayRange=(Min=0.5000000,Max=0.5000000)
        StartVelocityRange=(X=(Min=72.0000000,Max=72.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.EF_Flash_3rd_M2B_smoke.SpriteEmitter3'
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
        Opacity=0.4000000
        FadeOutStartTime=0.0266670
        FadeInEndTime=0.0016670
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=0.2400000,Max=0.2400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
        InitialParticlesPerSecond=43200.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Muzzle_Flashes.muzzleflash_3rd_light'
        LifetimeRange=(Min=0.1666670,Max=0.1666670)
    end object
    Emitters[2]=SpriteEmitter3
    AutoDestroy=true
    bNoDelete=false
}