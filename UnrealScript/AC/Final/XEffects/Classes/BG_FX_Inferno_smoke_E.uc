class BG_FX_Inferno_smoke_E extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_E.SpriteEmitter118'
    begin object name="SpriteEmitter118" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=24.3360004)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4700000
        FadeOutStartTime=1.0256410
        FadeInEndTime=0.3589740
        MaxParticles=5
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.De_smoke'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=50.0000000))
    end object
    Emitters[0]=SpriteEmitter118
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Inferno_smoke_E.SpriteEmitter119'
    begin object name="SpriteEmitter119" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=60.0000000,Max=90.0000000),Y=(Min=60.0000000,Max=90.0000000),Z=(Min=60.0000000,Max=90.0000000))
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.2019230,Max=1.2019230)
        StartVelocityRange=(X=(Min=-64.8000031,Max=64.8000031),Y=(Min=-64.8000031,Max=64.8000031),Z=(Min=50.0000000,Max=150.0000000))
    end object
    Emitters[1]=SpriteEmitter119
}