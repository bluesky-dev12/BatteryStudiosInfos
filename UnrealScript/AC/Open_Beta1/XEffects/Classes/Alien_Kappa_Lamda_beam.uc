class Alien_Kappa_Lamda_beam extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Kappa_Lamda_beam.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        UseActorForces=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=-1064.4566650,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.9000000,Max=0.9000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.9000000,Max=0.9000000))
        MaxParticles=350
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.9360000,Max=0.9360000),Y=(Min=0.4212000,Max=0.8424000),Z=(Min=0.4212000,Max=0.8424000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_016'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SecondsBeforeInactive=0.0500000
        LifetimeRange=(Min=0.0833330,Max=0.0833330)
    end object
    Emitters[0]=SpriteEmitter1
    AutoDestroy=true
    bNoDelete=false
    Physics=10
}