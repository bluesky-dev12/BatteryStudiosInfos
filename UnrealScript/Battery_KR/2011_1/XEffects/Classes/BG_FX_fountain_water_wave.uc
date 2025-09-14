class BG_FX_fountain_water_wave extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_fountain_water_wave.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseDirectionAs=4
        FadeOut=true
        FadeIn=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.2500000
        FadeOutStartTime=0.9300000
        FadeInEndTime=0.4800000
        MaxParticles=2
        SizeScale=/* Array type was not detected. */
        DrawStyle=1
        Texture=Texture'FX_TEX.Water.water_drop_b'
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
    end object
    Emitters[0]=SpriteEmitter1
}