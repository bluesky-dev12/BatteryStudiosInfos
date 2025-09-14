class BG_FX_dust_sand extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_dust_sand.SpriteEmitter14'
    begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.6600000
        FadeOutStartTime=0.7666670
        FadeInEndTime=0.2333330
        CoordinateSystem=1
        MaxParticles=2
        StartLocationOffset=(X=-80.0000000,Y=-50.0000000,Z=0.0000000)
        StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=200.0000000,Max=200.0000000))
        InitialParticlesPerSecond=1111.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.rain_multi_03'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=3.3333330,Max=3.3333330)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=186.7220154,Max=420.3475952),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter14
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_dust_sand.SpriteEmitter15'
    begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
        UseDirectionAs=5
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.6600000
        FadeOutStartTime=0.7666670
        FadeInEndTime=0.2333330
        CoordinateSystem=1
        MaxParticles=2
        StartLocationOffset=(X=80.0000000,Y=-50.0000000,Z=0.0000000)
        StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=200.0000000,Max=200.0000000))
        InitialParticlesPerSecond=1111.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.rain_multi_03'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=3.3333330,Max=3.3333330)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=186.7220154,Max=420.3475952),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter15
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_dust_sand.SpriteEmitter16'
    begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=0.0000000,Y=284.0000000,Z=32.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2600000
        FadeOutStartTime=2.1750000
        FadeInEndTime=0.7500000
        CoordinateSystem=1
        MaxParticles=8
        StartLocationOffset=(X=0.0000000,Y=-300.0000000,Z=50.0000000)
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=800.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0480000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=200.0000000,Max=400.0000000),Y=(Min=200.0000000,Max=400.0000000),Z=(Min=200.0000000,Max=400.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke05'
        LifetimeRange=(Min=7.0000000,Max=7.0000000)
        VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[2]=SpriteEmitter16
}