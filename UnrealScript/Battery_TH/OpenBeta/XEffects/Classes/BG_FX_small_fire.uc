class BG_FX_small_fire extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_small_fire.SpriteEmitter73'
    begin object name="SpriteEmitter73" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=40.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5700000
        FadeOutStartTime=0.5000000
        FadeInEndTime=0.1600000
        MaxParticles=5
        StartSizeRange=(X=(Min=15.0000000,Max=40.0000000),Y=(Min=15.0000000,Max=40.0000000),Z=(Min=15.0000000,Max=40.0000000))
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire03'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=20.0000000,Max=60.0000000))
    end object
    Emitters[0]=SpriteEmitter73
}