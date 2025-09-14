class BG_FX_heli_dirt extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_heli_dirt.SpriteEmitter20'
    begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=400.0000000,Y=0.0000000,Z=-10.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2500000
        FadeOutStartTime=0.1850000
        FadeInEndTime=0.1100000
        MaxParticles=25
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
        StartLocationRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationPolarRange=(X=(Min=-200.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        InitialParticlesPerSecond=37329.6015625
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        InitialDelayRange=(Min=0.1800000,Max=0.1800000)
        StartVelocityRange=(X=(Min=-1880.0000000,Max=1880.0000000),Y=(Min=-1880.0000000,Max=1880.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter20
}