class BG_FX_Inferno_smoke_C extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_C.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=-162.2400055,Z=-458.8500061)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2168170
        FadeInEndTime=0.1036950
        CoordinateSystem=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=2.0000000,Max=2.0000000))
        InitialParticlesPerSecond=100.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=2.0000000)
        StartVelocityRange=(X=(Min=-52.0000000,Max=52.0000000),Y=(Min=-520.0000000,Max=-156.0000000),Z=(Min=208.0000000,Max=381.6799927))
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_C.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=-24.3360004,Z=24.3360004)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3000000
        FadeOutStartTime=1.0256410
        FadeInEndTime=0.3589740
        MaxParticles=15
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-60.0000000,Max=-60.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.De_smoke'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=2.5641019,Max=2.5641019)
        StartVelocityRange=(X=(Min=-52.0000000,Max=52.0000000),Y=(Min=-120.0000000,Max=58.0000000),Z=(Min=38.0000000,Max=70.0000000))
    end object
    Emitters[1]=SpriteEmitter3
}