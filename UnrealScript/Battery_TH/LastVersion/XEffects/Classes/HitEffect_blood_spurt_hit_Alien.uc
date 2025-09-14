class HitEffect_blood_spurt_hit_Alien extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_spurt_hit_Alien.SpriteEmitter176'
    begin object name="SpriteEmitter176" class=Engine.SpriteEmitter
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
        DetailMode=1
        StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0930000,Max=0.0930000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
        InitialParticlesPerSecond=2232.1020508
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_03'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.4409170,Max=0.4409170)
        StartVelocityRange=(X=(Min=-31.7369995,Max=59.7369995),Y=(Min=-49.7369995,Max=49.7369995),Z=(Min=0.0000000,Max=0.0000000))
    end object
    Emitters[0]=SpriteEmitter176
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_spurt_hit_Alien.SpriteEmitter177'
    begin object name="SpriteEmitter177" class=Engine.SpriteEmitter
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
        DetailMode=1
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
    Emitters[1]=SpriteEmitter177
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_blood_spurt_hit_Alien.SpriteEmitter178'
    begin object name="SpriteEmitter178" class=Engine.SpriteEmitter
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
        Opacity=0.7600000
        FadeOutStartTime=0.2800000
        FadeInEndTime=0.0666670
        CoordinateSystem=1
        MaxParticles=3
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.1500000,Max=0.4500000),Y=(Min=0.2835000,Max=0.5670000),Z=(Min=0.2835000,Max=0.5670000))
        StartSpinRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=9661.6796875
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_no'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SubdivisionEnd=1
        LifetimeRange=(Min=1.3333330,Max=1.3333330)
        StartVelocityRange=(X=(Min=-14.6490002,Max=28.3099995),Y=(Min=-22.8999996,Max=22.8999996),Z=(Min=9.9300003,Max=22.8180008))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[2]=SpriteEmitter178
    AutoDestroy=true
    bNoDelete=false
}