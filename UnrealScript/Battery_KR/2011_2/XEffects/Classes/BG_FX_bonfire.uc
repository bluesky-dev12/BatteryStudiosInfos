class BG_FX_bonfire extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_bonfire.SpriteEmitter28'
    begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
        UseColorScale=true
        UniformSize=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=5.4000001)
        ColorScale=/* Array type was not detected. */
        MaxParticles=3
        StartLocationRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=10.0000000),Z=(Min=30.0000000,Max=50.0000000))
        StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=6.0000000,Max=15.0000000),Z=(Min=6.0000000,Max=15.0000000))
        ScaleSizeByVelocityMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ScaleSizeByVelocityMax=0.0000000
        Texture=Texture'FX_TEX.Flares.Laser_Flare_s'
        LifetimeRange=(Min=0.8333330,Max=1.2500000)
        StartVelocityRange=(X=(Min=-30.0000019,Max=30.0000019),Y=(Min=-30.0000019,Max=30.0000019),Z=(Min=90.0000000,Max=90.0000000))
    end object
    Emitters[0]=SpriteEmitter28
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_bonfire.SpriteEmitter36'
    begin object name="SpriteEmitter36" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=80.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5700000
        FadeOutStartTime=0.5000000
        FadeInEndTime=0.1600000
        StartSizeRange=(X=(Min=20.0000000,Max=60.0000000),Y=(Min=20.0000000,Max=60.0000000),Z=(Min=20.0000000,Max=60.0000000))
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire03'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=120.0000000))
    end object
    Emitters[1]=SpriteEmitter36
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_bonfire.SpriteEmitter38'
    begin object name="SpriteEmitter38" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=1.1250000,Y=1.1250000,Z=11.3000002)
        ColorScale=/* Array type was not detected. */
        Opacity=0.3000000
        FadeOutStartTime=1.6761910
        FadeInEndTime=0.7619050
        MaxParticles=5
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_far'
        LifetimeRange=(Min=7.6950002,Max=7.6950002)
        StartVelocityRange=(X=(Min=-21.0000000,Max=15.5000000),Y=(Min=-21.0000000,Max=15.5000000),Z=(Min=20.0000000,Max=20.0000000))
    end object
    Emitters[2]=SpriteEmitter38
}