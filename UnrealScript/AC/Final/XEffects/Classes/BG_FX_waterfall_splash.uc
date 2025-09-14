class BG_FX_waterfall_splash extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_waterfall_splash.SpriteEmitter10'
    begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
        UseDirectionAs=4
        FadeOut=true
        FadeIn=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.8400000
        FadeOutStartTime=0.0080000
        FadeInEndTime=0.0050000
        MaxParticles=30
        StartLocationRange=(X=(Min=-300.0000000,Max=300.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=0.0330750,Max=0.0330750),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=5.3000002,Max=5.3000002),Y=(Min=5.3000002,Max=5.3000002),Z=(Min=5.3000002,Max=5.3000002))
        InitialParticlesPerSecond=57.6599998
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_07'
        LifetimeRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[0]=SpriteEmitter10
}