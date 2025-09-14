class BG_FX_Inferno_smoke_B extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_B.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=24.3360004,Z=24.3360004)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5500000
        FadeOutStartTime=1.0256410
        FadeInEndTime=0.3589740
        MaxParticles=8
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.De_smoke'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=2.5641019,Max=2.5641019)
        StartVelocityRange=(X=(Min=-52.0000000,Max=52.0000000),Y=(Min=58.0000000,Max=120.0000000),Z=(Min=38.0000000,Max=70.0000000))
    end object
    Emitters[0]=SpriteEmitter2
}