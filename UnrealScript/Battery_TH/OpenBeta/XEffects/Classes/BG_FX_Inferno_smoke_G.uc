class BG_FX_Inferno_smoke_G extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_G.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=30.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.6000000
        FadeOutStartTime=1.0256410
        FadeInEndTime=0.3589740
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.De_smoke'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=2.5641019,Max=2.5641019)
        StartVelocityRange=(X=(Min=-120.0000000,Max=120.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=0.0000000,Max=120.0000000))
    end object
    Emitters[0]=SpriteEmitter4
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_G.SpriteEmitter7'
    begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=129.2010040)
        ColorScale=/* Array type was not detected. */
        Opacity=0.6800000
        FadeOutStartTime=0.4206730
        FadeInEndTime=0.3846150
        MaxParticles=8
        StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=60.0000000,Max=90.0000000),Y=(Min=60.0000000,Max=90.0000000),Z=(Min=60.0000000,Max=90.0000000))
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.2019230,Max=1.2019230)
        StartVelocityRange=(X=(Min=-64.8000031,Max=64.8000031),Y=(Min=-64.8000031,Max=64.8000031),Z=(Min=50.0000000,Max=150.0000000))
    end object
    Emitters[1]=SpriteEmitter7
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_G.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-660.7440796)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1806810
        FadeInEndTime=0.0864120
        CoordinateSystem=1
        MaxParticles=25
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
        StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=3.0000000,Max=3.0000000))
        InitialParticlesPerSecond=120.0000076
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.2500000,Max=1.2500000)
        StartVelocityRange=(X=(Min=-504.0000305,Max=504.0000305),Y=(Min=-624.0000000,Max=504.0000305),Z=(Min=249.6000061,Max=578.0159912))
        GetVelocityDirectionFrom=3
    end object
    Emitters[2]=SpriteEmitter9
}