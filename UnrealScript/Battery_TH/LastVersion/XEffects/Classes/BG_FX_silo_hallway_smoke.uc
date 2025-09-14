class BG_FX_silo_hallway_smoke extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_silo_hallway_smoke.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.1500000
        FadeOutStartTime=2.3809519
        FadeInEndTime=0.7619050
        MaxParticles=20
        StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=500.0000000,Max=500.0000000))
        SpinsPerSecondRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
        Texture=Texture'FX_TEX.Smoke.explo_smoke_noalpha_ani02'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=4.7619052,Max=4.7619052)
        StartVelocityRange=(X=(Min=-53.0000000,Max=53.0000000),Y=(Min=-53.0000000,Max=53.0000000),Z=(Min=90.0000000,Max=120.0000000))
    end object
    Emitters[0]=SpriteEmitter9
}