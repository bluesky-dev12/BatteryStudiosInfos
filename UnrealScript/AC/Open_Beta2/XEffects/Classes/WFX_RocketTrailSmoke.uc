class WFX_RocketTrailSmoke extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_RocketTrailSmoke.SpriteEmitter7'
    begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UseActorForces=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=-10.6445665,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
        FadeOutStartTime=0.6666670
        FadeInEndTime=0.3000000
        MaxParticles=160
        StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.0940000,Max=0.0940000),Y=(Min=0.0421200,Max=0.0842400),Z=(Min=0.0421200,Max=0.0842400))
        StartSpinRange=(X=(Min=-0.0940000,Max=0.0940000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=22.0000000,Max=22.0000000),Y=(Min=22.0000000,Max=22.0000000),Z=(Min=22.0000000,Max=22.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_pale'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SecondsBeforeInactive=0.0500000
        LifetimeRange=(Min=0.8333330,Max=3.3333330)
        StartVelocityRange=(X=(Min=8.4240007,Max=8.4240007),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter7
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_RocketTrailSmoke.SpriteEmitter8'
    begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=144.0000153,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.6700000,Max=2.0000000))
        FadeOutStartTime=0.1851850
        FadeInEndTime=0.0694440
        CoordinateSystem=1
        MaxParticles=20
        EffectAxis=1
        StartLocationOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=1
        SphereRadiusRange=(Min=0.0000000,Max=5.0000000)
        StartMassRange=(Min=0.1000000,Max=0.1000000)
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2050000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=5.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        ScaleSizeByVelocityMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        ScaleSizeByVelocityMax=0.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SecondsBeforeInactive=0.5000000
        LifetimeRange=(Min=1.1574070,Max=1.1574070)
        StartVelocityRange=(X=(Min=0.0000000,Max=24.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter8
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}