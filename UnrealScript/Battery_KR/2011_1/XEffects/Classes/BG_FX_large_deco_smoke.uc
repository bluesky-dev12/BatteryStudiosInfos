class BG_FX_large_deco_smoke extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_large_deco_smoke.SpriteEmitter63'
    begin object name="SpriteEmitter63" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=27.8020000,Y=0.0000000,Z=35.6640015)
        ColorScale=/* Array type was not detected. */
        Opacity=0.7600000
        FadeOutStartTime=3.3613441
        FadeInEndTime=0.8403360
        CoordinateSystem=1
        MaxParticles=20
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
        SpinsPerSecondRange=(X=(Min=0.0020000,Max=0.0430000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=600.0000000,Max=1000.0000000),Y=(Min=600.0000000,Max=1000.0000000),Z=(Min=600.0000000,Max=1000.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=16.8067226,Max=16.8067207)
        StartVelocityRange=(X=(Min=-4.7600002,Max=45.9000015),Y=(Min=-4.7600002,Max=45.9000015),Z=(Min=346.6000061,Max=346.6000061))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter63
}