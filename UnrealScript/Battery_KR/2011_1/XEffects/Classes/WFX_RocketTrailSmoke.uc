class WFX_RocketTrailSmoke extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_RocketTrailSmoke.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        UseActorForces=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=-7.3920598,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
        Opacity=0.8500000
        FadeOutStartTime=1.2820510
        FadeInEndTime=0.0512820
        MaxParticles=190
        StartLocationOffset=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.0780000,Max=0.0780000),Y=(Min=0.0351000,Max=0.0702000),Z=(Min=0.0351000,Max=0.0702000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        SecondsBeforeInactive=0.0500000
        LifetimeRange=(Min=1.4243590,Max=5.1282048)
        StartVelocityRange=(X=(Min=7.0200000,Max=7.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_RocketTrailSmoke.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=100.0000000,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.6700000,Max=2.0000000))
        FadeOutStartTime=0.2222220
        FadeInEndTime=0.0833330
        CoordinateSystem=1
        MaxParticles=20
        EffectAxis=1
        StartLocationOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=1
        SphereRadiusRange=(Min=0.0000000,Max=5.0000000)
        StartMassRange=(Min=0.1000000,Max=0.1000000)
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1710000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
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
        LifetimeRange=(Min=1.3888890,Max=1.3888890)
        StartVelocityRange=(X=(Min=0.0000000,Max=20.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[1]=SpriteEmitter2
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}