class Heli_RPG_MuzFlash_3RD extends EmitterThirdPerson;

defaultproperties
{
    Emitters[0]=SpriteEmitter'XEffects_Decompressed.Heli_Gun_MuzFlash_3RD.SpriteEmitter2'
    // Reference: SpriteEmitter'XEffects_Decompressed.Heli_RPG_MuzFlash_3RD.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=380.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2000000
        CoordinateSystem=1
        MaxParticles=1
        StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=50.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        InitialParticlesPerSecond=6666660.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flamethrower_fire_03'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.6666670,Max=0.6666670)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-160.0000000,Max=-160.0000000))
    end object
    Emitters[1]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.Heli_RPG_MuzFlash_3RD.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3125000
        CoordinateSystem=1
        MaxParticles=1
        StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
        SpinsPerSecondRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        InitialParticlesPerSecond=4266662.5000000
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flamethrower_fire_03'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0416670,Max=1.0416670)
        StartVelocityRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[2]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.Heli_RPG_MuzFlash_3RD.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
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
        Opacity=0.6000000
        FadeOutStartTime=0.3358330
        FadeInEndTime=0.0866670
        CoordinateSystem=1
        MaxParticles=1
        StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1200000,Max=0.1200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        InitialParticlesPerSecond=22397.7617188
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=1.0833330,Max=1.0833330)
        InitialDelayRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=278.0000000,Max=278.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=9.0000000,Max=9.0000000))
    end object
    Emitters[3]=SpriteEmitter4
    // Reference: SpriteEmitter'XEffects_Decompressed.Heli_RPG_MuzFlash_3RD.SpriteEmitter5'
    begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
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
        Opacity=0.6000000
        FadeOutStartTime=0.3358330
        FadeInEndTime=0.0650000
        CoordinateSystem=1
        MaxParticles=1
        StartLocationOffset=(X=50.0000000,Y=0.0000000,Z=0.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1200000,Max=0.1200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        InitialParticlesPerSecond=22397.7617188
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=1.0833330,Max=1.0833330)
        InitialDelayRange=(Min=0.3500000,Max=0.3500000)
        StartVelocityRange=(X=(Min=272.0000000,Max=272.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[4]=SpriteEmitter5
    // Reference: SpriteEmitter'XEffects_Decompressed.Heli_RPG_MuzFlash_3RD.SpriteEmitter6'
    begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=400.0000000,Max=400.0000000))
        InitialParticlesPerSecond=43200.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Muzzle_Flashes.muzzleflash_3rd_light'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
    end object
    Emitters[5]=SpriteEmitter6
    // Reference: SpriteEmitter'XEffects_Decompressed.Heli_RPG_MuzFlash_3RD.SpriteEmitter7'
    begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3125000
        CoordinateSystem=1
        MaxParticles=1
        StartLocationOffset=(X=-220.0000000,Y=0.0000000,Z=0.0000000)
        SpinsPerSecondRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
        InitialParticlesPerSecond=4266662.5000000
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flamethrower_fire_03'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0416670,Max=1.0416670)
        StartVelocityRange=(X=(Min=-140.0000000,Max=-140.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[6]=SpriteEmitter7
    // Reference: SpriteEmitter'XEffects_Decompressed.Heli_RPG_MuzFlash_3RD.SpriteEmitter8'
    begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.7000000
        FadeOutStartTime=0.0900000
        FadeInEndTime=0.0270000
        CoordinateSystem=1
        MaxParticles=20
        StartLocationOffset=(X=-200.0000000,Y=0.0000000,Z=0.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1200000,Max=0.1200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
        InitialParticlesPerSecond=22397.7617188
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-1530.0000000,Max=-1530.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[7]=SpriteEmitter8
    // Reference: SpriteEmitter'XEffects_Decompressed.Heli_RPG_MuzFlash_3RD.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
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
        StartLocationOffset=(X=-200.0000000,Y=0.0000000,Z=0.0000000)
        SpinsPerSecondRange=(X=(Min=0.2400000,Max=0.2400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=43200.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Muzzle_Flashes.muzzleflash_3rd_light'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
    end object
    Emitters[8]=SpriteEmitter9
    AutoDestroy=true
    bNoDelete=false
}