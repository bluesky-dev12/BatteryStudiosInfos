class BG_FX_JumpPad_C01 extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_JumpPad_C01.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        UniformSize=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-203.8399963)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2500000
        FadeInEndTime=0.1428570
        MaxParticles=40
        StartLocationRange=(X=(Min=-86.0000000,Max=86.0000000),Y=(Min=-86.0000000,Max=86.0000000),Z=(Min=80.0000000,Max=80.0000000))
        StartSizeRange=(X=(Min=160.0000000,Max=160.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=950.0000000,Max=950.0000000))
        Texture=Texture'FX_TEX.Flares.OutSpark01aw'
        LifetimeRange=(Min=0.3571430,Max=0.6785710)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=364.0000000,Max=955.0000000))
        WarmupTicksPerSecond=2.0000000
        RelativeWarmupTime=2.0000000
    end object
    Emitters[0]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_JumpPad_C01.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseDirectionAs=4
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=250.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.9100000
        FadeInEndTime=0.8120000
        MaxParticles=5
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=-20.0000000))
        StartSizeRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=140.0000000,Max=140.0000000),Z=(Min=140.0000000,Max=140.0000000))
        Texture=Texture'FX_TEX.Emitter.JumpCircle01aw'
        LifetimeRange=(Min=1.4000000,Max=1.4000000)
        WarmupTicksPerSecond=2.0000000
        RelativeWarmupTime=2.0000000
    end object
    Emitters[1]=SpriteEmitter1
}