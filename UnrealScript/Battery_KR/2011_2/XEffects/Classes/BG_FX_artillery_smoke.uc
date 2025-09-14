class BG_FX_artillery_smoke extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_artillery_smoke.SpriteEmitter25'
    begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=1.3230000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2500000
        FadeOutFactor=(W=1.0000000,X=1.0000000,Y=1.0000000,Z=1.6000000)
        FadeOutStartTime=2.7820799
        FadeInEndTime=0.6652800
        MaxParticles=3
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=0.0020000,Max=0.0110000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke04'
        LifetimeRange=(Min=6.0479999,Max=6.0479999)
        StartVelocityRange=(X=(Min=-10.5000000,Max=10.5000000),Y=(Min=-14.7000008,Max=14.7000008),Z=(Min=21.0000000,Max=52.5000038))
        VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2100000,Max=0.2100000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter25
}