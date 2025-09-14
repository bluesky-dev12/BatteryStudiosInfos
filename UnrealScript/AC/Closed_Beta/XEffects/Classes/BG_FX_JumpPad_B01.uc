class BG_FX_JumpPad_B01 extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_JumpPad_B01.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        UseDirectionAs=5
        ProjectionNormal=(X=11.0000000,Y=1.0000000,Z=1.0000000)
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        UniformSize=true
        Acceleration=(X=0.0000000,Y=-203.8399963,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2500000
        FadeInEndTime=0.1428570
        MaxParticles=40
        StartLocationRange=(X=(Min=-90.0000000,Max=90.0000000),Y=(Min=-90.0000000,Max=90.0000000),Z=(Min=-90.0000000,Max=90.0000000))
        StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=750.0000000,Max=750.0000000))
        Texture=Texture'FX_TEX.Flares.OutSpark01aw'
        LifetimeRange=(Min=0.3571430,Max=0.6785710)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-455.0000000,Max=-455.0000000),Z=(Min=0.0000000,Max=0.0000000))
        WarmupTicksPerSecond=2.0000000
        RelativeWarmupTime=2.0000000
    end object
    Emitters[0]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_JumpPad_B01.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        UseDirectionAs=4
        ProjectionNormal=(X=11.0000000,Y=150.0000000,Z=1.0000000)
        UseColorScale=true
        FadeOut=true
        SpinParticles=true
        UniformSize=true
        Acceleration=(X=0.0000000,Y=-200.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.1200000
        MaxParticles=6
        Texture=Texture'FX_TEX.Emitter.GridPlate'
        LifetimeRange=(Min=1.4000000,Max=1.4000000)
        WarmupTicksPerSecond=2.0000000
        RelativeWarmupTime=2.0000000
    end object
    Emitters[1]=SpriteEmitter3
}