class BG_FX_snowstorm extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_snowstorm.SpriteEmitter35'
    begin object name="SpriteEmitter35" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=200.0000000,Y=0.0000000,Z=50.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.1200000
        FadeOutStartTime=1.0000000
        FadeInEndTime=1.0000000
        CoordinateSystem=1
        MaxParticles=5
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=1500.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1250000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.0000000,Max=400.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke05'
        LifetimeRange=(Min=6.0000000,Max=6.0000000)
        VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter35
}