class HitEffect_blood_spurt_hit_Alien extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_spurt_hit_Alien.SpriteEmitter144'
    begin object name="SpriteEmitter144" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1989350
        CoordinateSystem=1
        MaxParticles=5
        StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0930000,Max=0.0930000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
        InitialParticlesPerSecond=2232.1020508
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_03'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.4409170,Max=0.4409170)
        StartVelocityRange=(X=(Min=-31.7369995,Max=59.7369995),Y=(Min=-49.7369995,Max=49.7369995),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter144
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_spurt_hit_Alien.SpriteEmitter146'
    begin object name="SpriteEmitter146" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=2.4335999,Y=2.4335999,Z=2.4335999)
        ColorScale=/* Array type was not detected. */
        CoordinateSystem=1
        MaxParticles=1
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1950000,Max=0.1950000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=42.0000000,Max=42.0000000),Y=(Min=42.0000000,Max=42.0000000),Z=(Min=42.0000000,Max=42.0000000))
        InitialParticlesPerSecond=2398.9199219
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.5128210,Max=0.5128210)
        StartVelocityRange=(X=(Min=1.2480000,Max=1.2480000),Y=(Min=1.2480000,Max=1.2480000),Z=(Min=1.2480000,Max=1.2480000))
        MaxAbsVelocity=(X=3.8025000,Y=1.0000000,Z=1.9500000)
    end object
    Emitters[1]=SpriteEmitter146
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_spurt_hit_Alien.SpriteEmitter147'
    begin object name="SpriteEmitter147" class=Engine.SpriteEmitter
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
        ColorScale=/* Array type was not detected. */
        Opacity=0.3000000
        FadeOutStartTime=0.4200000
        FadeInEndTime=0.1000000
        CoordinateSystem=1
        MaxParticles=2
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.1890000,Max=0.3780000),Z=(Min=0.1890000,Max=0.3780000))
        StartSpinRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=60.8870010,Max=60.8870010),Y=(Min=60.8870010,Max=60.8870010),Z=(Min=60.8870010,Max=60.8870010))
        InitialParticlesPerSecond=6441.1201172
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_no'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SubdivisionEnd=1
        LifetimeRange=(Min=1.3000000,Max=1.3000000)
        InitialDelayRange=(Min=0.0000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-8.5400000,Max=35.5400009),Y=(Min=-8.6000004,Max=38.5999985),Z=(Min=6.6199999,Max=38.5449982))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[2]=SpriteEmitter147
    AutoDestroy=true
    bNoDelete=false
}