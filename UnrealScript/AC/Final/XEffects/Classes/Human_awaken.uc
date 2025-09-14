class Human_awaken extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Human_awaken.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=12.1000004,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.2545450
        FadeInEndTime=0.3545450
        MaxParticles=20
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-70.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0880000,Max=0.0880000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0800000,Max=0.0800000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
        InitialParticlesPerSecond=220.3673859
        Texture=Texture'FX_TEX.Smoke.smoke04_noalpha_RED'
        LifetimeRange=(Min=1.8181820,Max=1.8181820)
        StartVelocityRange=(X=(Min=-8.8000002,Max=8.8000002),Y=(Min=-8.8000002,Max=8.8000002),Z=(Min=0.0000000,Max=140.0000000))
    end object
    Emitters[0]=SpriteEmitter1
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}