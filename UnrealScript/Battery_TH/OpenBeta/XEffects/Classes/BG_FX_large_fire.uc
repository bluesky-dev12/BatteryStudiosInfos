class BG_FX_large_fire extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_large_fire.SpriteEmitter67'
    begin object name="SpriteEmitter67" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=149.2010040)
        ColorScale=/* Array type was not detected. */
        Opacity=0.6800000
        FadeOutStartTime=0.4206730
        FadeInEndTime=0.3846150
        StartSizeRange=(X=(Min=70.0000000,Max=100.0000000),Y=(Min=70.0000000,Max=100.0000000),Z=(Min=70.0000000,Max=100.0000000))
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.2019230,Max=1.2019230)
        StartVelocityRange=(X=(Min=-74.8000031,Max=74.8000031),Y=(Min=-74.8000031,Max=74.8000031),Z=(Min=50.0000000,Max=170.0000000))
    end object
    Emitters[0]=SpriteEmitter67
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_large_fire.SpriteEmitter69'
    begin object name="SpriteEmitter69" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=6.2719998)
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
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_far'
        LifetimeRange=(Min=6.2500000,Max=6.2500000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=42.0000000,Max=42.0000000))
    end object
    Emitters[1]=SpriteEmitter69
}