class HitEffect_blood_spurt_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_spurt_hit.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=-75.2313690,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2984020
        CoordinateSystem=1
        MaxParticles=4
        StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0620000,Max=0.0620000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
        InitialParticlesPerSecond=1488.0679932
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_blood_ani_01'
        TextureUSubdivisions=2
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.6613760,Max=0.6613760)
        StartVelocityRange=(X=(Min=-21.1584015,Max=93.1584091),Y=(Min=-33.1584015,Max=33.1584015),Z=(Min=0.0000000,Max=0.0000000))
        CullDistance=900.0000000
        DisableIfCulled=true
    end object
    Emitters[0]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_spurt_hit.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=69.3195419,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2600000
        FadeOutStartTime=0.0558820
        FadeInEndTime=0.0558820
        CoordinateSystem=1
        MaxParticles=2
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.3670000,Max=1.0200000),Y=(Min=0.3825000,Max=0.7650000),Z=(Min=0.3825000,Max=0.7650000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.2880001,Max=30.2880001),Y=(Min=30.2880001,Max=30.2880001),Z=(Min=30.2880001,Max=30.2880001))
        InitialParticlesPerSecond=13035.6005859
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_no'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SubdivisionEnd=1
        LifetimeRange=(Min=1.1176471,Max=1.1176471)
        InitialDelayRange=(Min=0.0000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-11.6949997,Max=34.5349998),Y=(Min=-36.2239990,Max=36.2239990),Z=(Min=7.9270000,Max=12.2069998))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[1]=SpriteEmitter4
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_spurt_hit.SpriteEmitter6'
    begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.6400000,Y=0.6400000,Z=0.6400000)
        ColorScale=/* Array type was not detected. */
        CoordinateSystem=1
        MaxParticles=1
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=32.0000000,Max=32.0000000),Y=(Min=32.0000000,Max=32.0000000),Z=(Min=32.0000000,Max=32.0000000))
        InitialParticlesPerSecond=1230.2149658
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.blood_animated1_alpha_01'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=0.6400000,Max=0.6400000),Y=(Min=0.6400000,Max=0.6400000),Z=(Min=0.6400000,Max=0.6400000))
        MaxAbsVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000)
        CullDistance=900.0000000
        DisableIfCulled=true
    end object
    Emitters[2]=SpriteEmitter6
    AutoDestroy=true
    bNoDelete=false
}