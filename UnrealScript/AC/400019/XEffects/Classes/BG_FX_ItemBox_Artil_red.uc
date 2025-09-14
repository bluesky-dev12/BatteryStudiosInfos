class BG_FX_ItemBox_Artil_red extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_ItemBox_Artil_red.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
        FadeOut=true
        FadeIn=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0500000
        FadeInEndTime=0.0100000
        CoordinateSystem=1
        MaxParticles=2
        StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
        InitialParticlesPerSecond=630.0000000
        Texture=Texture'FX_TEX.Flares.glow_red'
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
    end object
    Emitters[0]=SpriteEmitter2
}