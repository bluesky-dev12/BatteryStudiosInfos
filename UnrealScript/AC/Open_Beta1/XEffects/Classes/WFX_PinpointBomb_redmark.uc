class WFX_PinpointBomb_redmark extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_PinpointBomb_redmark.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=162.5000000,Y=0.0000000,Z=35.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.8800000
        FadeInEndTime=0.4400000
        CoordinateSystem=1
        MaxParticles=160
        StartLocationRange=(X=(Min=-20.0000000,Max=-20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0030000,Max=0.0650000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
        StartVelocityRange=(X=(Min=30.0000000,Max=300.0000000),Y=(Min=-65.0000000,Max=65.0000000),Z=(Min=65.0000000,Max=65.0000000))
        StartVelocityRadialRange=(Min=0.0000000,Max=500.0000000)
    end object
    Emitters[0]=SpriteEmitter0
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}