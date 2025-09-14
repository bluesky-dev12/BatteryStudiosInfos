class BG_FX_antiaircraft01 extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_antiaircraft01.SpriteEmitter16'
    begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=2665.9199219,Z=1110.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4900740
        CoordinateSystem=1
        MaxParticles=3
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=900.0000000,Max=900.0000000),Z=(Min=100.0000000,Max=100.0000000))
        InitialParticlesPerSecond=6.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flank_bullet'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=5.0000000)
        InitialDelayRange=(Min=3.0000000,Max=5.0000000)
        StartVelocityRange=(X=(Min=2550.0000000,Max=3550.0000000),Y=(Min=1550.0000000,Max=2650.0000000),Z=(Min=23000.0000000,Max=28000.0000000))
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter16
}