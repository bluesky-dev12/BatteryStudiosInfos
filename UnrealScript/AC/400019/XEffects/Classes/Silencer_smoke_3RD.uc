class Silencer_smoke_3RD extends EmitterThirdPerson;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Silencer_smoke_3RD.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=299.4103088,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3500000
        FadeOutStartTime=0.0780000
        FadeInEndTime=0.0052000
        CoordinateSystem=1
        MaxParticles=3
        StartLocationOffset=(X=12.0000000,Y=0.0000000,Z=0.0000000)
        SpinsPerSecondRange=(X=(Min=-0.4060000,Max=0.4060000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=17.5000000,Max=17.5000000),Y=(Min=17.5000000,Max=17.5000000),Z=(Min=17.5000000,Max=17.5000000))
        InitialParticlesPerSecond=75704.4296875
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.2600000,Max=0.2600000)
        StartVelocityRange=(X=(Min=129.1835938,Max=129.1835938),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter9
    // Reference: SpriteEmitter'XEffects_Decompressed.Silencer_smoke_3RD.SpriteEmitter10'
    begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=374.2633972,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3500000
        FadeOutStartTime=0.0993590
        FadeInEndTime=0.0064100
        CoordinateSystem=1
        MaxParticles=2
        StartLocationOffset=(X=12.0000000,Y=0.0000000,Z=0.0000000)
        SpinsPerSecondRange=(X=(Min=-0.4060000,Max=0.4060000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=17.5000000,Max=17.5000000),Y=(Min=17.5000000,Max=17.5000000),Z=(Min=17.5000000,Max=17.5000000))
        InitialParticlesPerSecond=75704.4296875
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01_no'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.2600000,Max=0.2600000)
        InitialDelayRange=(Min=0.0900000,Max=0.0900000)
        StartVelocityRange=(X=(Min=129.1835938,Max=129.1835938),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter10
    AutoDestroy=true
    bNoDelete=false
}