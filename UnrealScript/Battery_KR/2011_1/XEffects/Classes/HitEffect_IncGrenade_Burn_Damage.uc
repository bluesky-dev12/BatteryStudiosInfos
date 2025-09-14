class HitEffect_IncGrenade_Burn_Damage extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_IncGrenade_Burn_Damage.SpriteEmitter37'
    begin object name="SpriteEmitter37" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3000000
        FadeOutStartTime=0.5220000
        FadeInEndTime=0.1620000
        MaxParticles=12
        StartSizeRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=20.0000000,Max=50.0000000),Z=(Min=20.0000000,Max=50.0000000))
        InitialParticlesPerSecond=11111110656.0000000
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire03'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.3000000,Max=1.3000000)
        StartVelocityRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=20.0000000,Max=60.0000000))
    end object
    Emitters[0]=SpriteEmitter37
}