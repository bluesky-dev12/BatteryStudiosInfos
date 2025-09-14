class WFX_HeliTrailSmoke extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.WFX_HeliTrailSmoke.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        FadeOut=true
        UseActorForces=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=-1064.4566650,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
        MaxParticles=180
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.9360000,Max=0.9360000),Y=(Min=0.4212000,Max=0.8424000),Z=(Min=0.4212000,Max=0.8424000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.RPGFlare'
        SecondsBeforeInactive=0.0500000
        LifetimeRange=(Min=0.0833330,Max=0.0833330)
    end object
    Emitters[0]=SpriteEmitter1
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}