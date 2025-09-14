class BG_FX_sky_burn01 extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_sky_burn01.SpriteEmitter42'
    begin object name="SpriteEmitter42" class=Engine.SpriteEmitter
        UseDirectionAs=4
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        ResetAfterChange=true
        RespawnDeadParticles=false
        AutoReset=true
        UseSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        ColorScaleRepeats=2.0000000
        FadeOutStartTime=0.1500000
        FadeInEndTime=0.1000000
        MaxParticles=3
        StartLocationRange=(X=(Min=-80.0000000,Max=120.0000000),Y=(Min=-80.0000000,Max=120.0000000),Z=(Min=0.0000000,Max=0.0000000))
        AddLocationFromOtherEmitter=0
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=1000.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.LightningCloud'
        LifetimeRange=(Min=2.0000000,Max=3.0000000)
    end object
    Emitters[0]=SpriteEmitter42
}