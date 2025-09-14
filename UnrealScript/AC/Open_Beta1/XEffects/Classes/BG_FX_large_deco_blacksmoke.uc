class BG_FX_large_deco_blacksmoke extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_large_deco_blacksmoke.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=27.8020000,Y=0.0000000,Z=15.6639996)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=2.0168059
        FadeInEndTime=0.8403360
        CoordinateSystem=1
        MaxParticles=15
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
        SpinsPerSecondRange=(X=(Min=0.0020000,Max=0.0430000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=800.0000000),Y=(Min=300.0000000,Max=800.0000000),Z=(Min=300.0000000,Max=800.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=16.8067226,Max=16.8067207)
        StartVelocityRange=(X=(Min=-4.7600002,Max=45.9000015),Y=(Min=-4.7600002,Max=45.9000015),Z=(Min=246.6000061,Max=246.6000061))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter0
}