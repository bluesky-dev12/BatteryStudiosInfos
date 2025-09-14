class BG_FX_dust_in_ani extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_dust_in_ani.SpriteEmitter355'
    begin object name="SpriteEmitter355" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.2000000
        FadeOutStartTime=7.0400000
        FadeInEndTime=3.2000000
        MaxParticles=2
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.dust_ani'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=14.0000000,Max=14.0000000)
        StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
    end object
    Emitters[0]=SpriteEmitter355
}