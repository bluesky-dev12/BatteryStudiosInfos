class BG_FX_dust_large extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_dust_large.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=7.4858632,Y=7.4649611,Z=-0.9540220)
        ColorScale=/* Array type was not detected. */
        Opacity=0.1500000
        FadeOutStartTime=4.9603181
        FadeInEndTime=2.0667989
        CoordinateSystem=1
        MaxParticles=3
        StartLocationOffset=(X=-120.0000000,Y=0.0000000,Z=0.0000000)
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
        SpinsPerSecondRange=(X=(Min=-0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=700.0000000,Max=700.0000000),Y=(Min=700.0000000,Max=700.0000000),Z=(Min=700.0000000,Max=700.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke05'
        LifetimeRange=(Min=13.7786589,Max=13.7786589)
        StartVelocityRange=(X=(Min=-31.1040039,Max=31.1040039),Y=(Min=-31.1040039,Max=31.1040039),Z=(Min=0.0000000,Max=12.9600010))
        VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3628800,Max=0.3628800),Z=(Min=0.0000000,Max=0.0000000))
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter1
}