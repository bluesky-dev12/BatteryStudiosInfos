class WFX_PinpointBombTrailSmoke extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_PinpointBombTrailSmoke.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        FadeOutStartTime=0.5700000
        FadeInEndTime=0.1500000
        MaxParticles=120
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=30.0000000,Max=30.0000000))
        InitialParticlesPerSecond=1454.4799805
        Texture=Texture'FX_TEX.Smoke.PinpointBomb_smoke'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-10.0000000,Max=-10.0000000))
    end object
    Emitters[0]=SpriteEmitter4
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_PinpointBombTrailSmoke.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UseActorForces=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=-7.3920598,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
        FadeOutStartTime=1.2307690
        FadeInEndTime=0.1538460
        MaxParticles=130
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.0780000,Max=0.0780000),Y=(Min=0.0351000,Max=0.0702000),Z=(Min=0.0351000,Max=0.0702000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.muzzle_smoke_01'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SecondsBeforeInactive=0.0500000
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
        StartVelocityRange=(X=(Min=7.0200000,Max=7.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter1
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}