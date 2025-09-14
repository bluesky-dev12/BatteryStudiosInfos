class BG_FX_water_rain_multi extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_water_rain_multi.SpriteEmitter108'
    begin object name="SpriteEmitter108" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2600000
        FadeOutStartTime=1.5900000
        FadeInEndTime=0.2700000
        CoordinateSystem=1
        MaxParticles=1
        StartLocationPolarRange=(X=(Min=-1200.0000000,Max=1200.0000000),Y=(Min=-1200.0000000,Max=1200.0000000),Z=(Min=0.0000000,Max=0.0000000))
        InitialParticlesPerSecond=6.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.rain_multi_03'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
        InitialDelayRange=(Min=2.0000000,Max=2.0000000)
    end object
    Emitters[0]=SpriteEmitter108
}