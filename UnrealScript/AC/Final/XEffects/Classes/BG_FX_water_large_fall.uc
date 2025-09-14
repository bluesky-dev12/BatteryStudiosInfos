class BG_FX_water_large_fall extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_water_large_fall.SpriteEmitter8'
    begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-230.7555084)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5100000
        FadeOutStartTime=0.5121050
        FadeInEndTime=0.4746340
        CoordinateSystem=1
        MaxParticles=5
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-290.0000000,Max=-290.0000000))
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=420.0000000,Max=420.0000000),Z=(Min=50.0000000,Max=50.0000000))
        InitialParticlesPerSecond=4.3230000
        DrawStyle=1
        Texture=Texture'FX_TEX.Emitter.waterfall_01'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        StartVelocityRange=(X=(Min=-21.6800003,Max=21.6800003),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-254.1600037,Max=-254.1600037))
    end object
    Emitters[0]=SpriteEmitter8
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_water_large_fall.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0414790
        FadeInEndTime=0.0138260
        MaxParticles=6
        StartLocationRange=(X=(Min=-70.0000000,Max=70.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-680.0000000,Max=-680.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1500000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        InitialParticlesPerSecond=33.8470001
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_05'
        LifetimeRange=(Min=0.4608770,Max=0.4608770)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-14.8509998,Max=15.0260000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter9
}