class BG_FX_flame_smoke extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_flame_smoke.SpriteEmitter57'
    begin object name="SpriteEmitter57" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.9337220
        FadeInEndTime=0.8003330
        CoordinateSystem=1
        MaxParticles=20
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
        StartLocationShape=1
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=1000.0000000,Max=1000.0000000),Y=(Min=1000.0000000,Max=1000.0000000),Z=(Min=1000.0000000,Max=1000.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.big_smoke'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=13.3388891,Max=13.3388891)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-365.0000000,Max=-365.0000000),Z=(Min=252.7160034,Max=252.7160034))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
    end object
    Emitters[0]=SpriteEmitter57
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_flame_smoke.SpriteEmitter58'
    begin object name="SpriteEmitter58" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=82.1756210,Z=17.8778248)
        ColorScale=/* Array type was not detected. */
        Opacity=0.8800000
        FadeOutStartTime=0.8481200
        FadeInEndTime=0.1957200
        CoordinateSystem=1
        MaxParticles=5
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=0.0450000,Max=0.0450000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0090000,Max=0.0090000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=490.0000000,Max=490.0000000),Y=(Min=490.0000000,Max=490.0000000),Z=(Min=490.0000000,Max=490.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=3.2620001,Max=3.2620001)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-212.6250000,Max=-212.6250000),Z=(Min=51.5276947,Max=51.5276947))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
    end object
    Emitters[1]=SpriteEmitter58
}