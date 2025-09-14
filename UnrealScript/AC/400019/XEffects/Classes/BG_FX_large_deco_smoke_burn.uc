class BG_FX_large_deco_smoke_burn extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_large_deco_smoke_burn.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=44.2999992,Z=29.0450001)
        ColorScale=/* Array type was not detected. */
        Opacity=0.7300000
        FadeOutFactor=(W=1.5000000,X=1.5000000,Y=1.5000000,Z=1.5000000)
        FadeOutStartTime=0.6337220
        FadeInEndTime=0.8003330
        CoordinateSystem=1
        MaxParticles=20
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
        StartLocationShape=1
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=900.0000000,Max=600.0000000),Y=(Min=900.0000000,Max=600.0000000),Z=(Min=900.0000000,Max=600.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.big_smoke'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=13.3388891,Max=13.3388891)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-365.0000000,Max=-365.0000000),Z=(Min=252.7160034,Max=252.7160034))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
    end object
    Emitters[0]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_large_deco_smoke_burn.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=123.2634277,Z=26.8167381)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.8481200
        FadeInEndTime=0.1957200
        CoordinateSystem=1
        MaxParticles=8
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=0.0450000,Max=0.0450000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0090000,Max=0.0090000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.0000000,Max=500.0000000),Y=(Min=50.0000000,Max=500.0000000),Z=(Min=50.0000000,Max=500.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=3.2620001,Max=3.2620001)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-318.9379883,Max=-318.9379883),Z=(Min=137.2920074,Max=137.2920074))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
    end object
    Emitters[1]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_large_deco_smoke_burn.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=0.0000000,Y=48.9922638,Z=32.1214485)
        ColorScale=/* Array type was not detected. */
        FadeOutFactor=(W=1.5000000,X=1.5000000,Y=1.5000000,Z=1.5000000)
        FadeOutStartTime=0.7466200
        FadeInEndTime=0.0533300
        CoordinateSystem=1
        MaxParticles=30
        SpinsPerSecondRange=(X=(Min=-0.0960000,Max=0.0960000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0900000,Max=0.0900000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=220.0000000,Max=220.0000000),Y=(Min=220.0000000,Max=220.0000000),Z=(Min=220.0000000,Max=220.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.Flares.flares_mw'
        LifetimeRange=(Min=3.0000000,Max=5.0000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-420.4800110,Max=-420.4800110),Z=(Min=411.1296082,Max=411.1296082))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
    end object
    Emitters[2]=SpriteEmitter3
}