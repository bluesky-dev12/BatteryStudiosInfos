class BG_FX_middle_fire02 extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_middle_fire02.SpriteEmitter30'
    begin object name="SpriteEmitter30" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=160.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5700000
        FadeOutStartTime=0.5000000
        FadeInEndTime=0.1600000
        MaxParticles=8
        StartSizeRange=(X=(Min=30.0000000,Max=80.0000000),Y=(Min=30.0000000,Max=80.0000000),Z=(Min=30.0000000,Max=80.0000000))
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=20.0000000,Max=160.0000000))
    end object
    Emitters[0]=SpriteEmitter30
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_middle_fire02.SpriteEmitter31'
    begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=15.6800003,Y=4.6799998,Z=6.2719998)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4100000
        FadeOutStartTime=2.0000000
        FadeInEndTime=0.5000000
        MaxParticles=5
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=80.0000000)
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_far'
        LifetimeRange=(Min=6.2500000,Max=6.2500000)
        StartVelocityRange=(X=(Min=-11.1999998,Max=18.0000000),Y=(Min=-11.1999998,Max=18.0000000),Z=(Min=52.0000000,Max=52.0000000))
    end object
    Emitters[1]=SpriteEmitter31
}