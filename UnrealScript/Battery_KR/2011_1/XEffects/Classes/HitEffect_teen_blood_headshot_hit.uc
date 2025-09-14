class HitEffect_teen_blood_headshot_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_teen_blood_headshot_hit.SpriteEmitter15'
    begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
        UseDirectionAs=3
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=1.0635480,Y=1.0635480,Z=1.0635480)
        ColorScale=/* Array type was not detected. */
        CoordinateSystem=1
        MaxParticles=2
        SpinsPerSecondRange=(X=(Min=-0.0550000,Max=0.0550000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
        InitialParticlesPerSecond=1209.0560303
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit_blood.teen_blood_animated1_alpha_01'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.3000000,Max=1.3000000)
        StartVelocityRange=(X=(Min=1.0821609,Max=1.0821609),Y=(Min=1.0821609,Max=1.0821609),Z=(Min=1.0821609,Max=1.0821609))
        MaxAbsVelocity=(X=0.9658960,Y=1.0000000,Z=0.9828000)
    end object
    Emitters[0]=SpriteEmitter15
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_teen_blood_headshot_hit.SpriteEmitter19'
    begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-774.0969849)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.4000000,Max=0.5000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1642400
        FadeInEndTime=0.0351940
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-6.5990090,Max=6.5990090),Z=(Min=-6.5990090,Max=6.5990090))
        StartSpinRange=(X=(Min=-0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=1.5000000,Max=3.0000000),Y=(Min=1.5000000,Max=3.0000000),Z=(Min=1.5000000,Max=3.0000000))
        InitialParticlesPerSecond=3299.5100098
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit_blood.teen_headshot_blood01'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.9000000,Max=0.9000000)
        InitialDelayRange=(Min=0.1500000,Max=0.1500000)
        StartVelocityRange=(X=(Min=-200.0000000,Max=200.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=65.7119980,Max=542.5880127))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[1]=SpriteEmitter19
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_teen_blood_headshot_hit.SpriteEmitter20'
    begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=13.9720001)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2000000
        FadeOutStartTime=0.0791670
        FadeInEndTime=0.0791670
        CoordinateSystem=1
        MaxParticles=2
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.2590000,Max=0.3000000),Y=(Min=0.2700000,Max=0.5400000),Z=(Min=0.2700000,Max=0.5400000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
        InitialParticlesPerSecond=9201.6005859
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_no'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        SubdivisionEnd=1
        LifetimeRange=(Min=0.8333330,Max=0.8333330)
        InitialDelayRange=(Min=0.0000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-13.9519997,Max=35.0579987),Y=(Min=-35.1419983,Max=35.1419983),Z=(Min=9.4569998,Max=14.4919996))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[2]=SpriteEmitter20
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_teen_blood_headshot_hit.SpriteEmitter21'
    begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.8100000
        FadeOutStartTime=0.0066670
        FadeInEndTime=0.0022220
        CoordinateSystem=1
        MaxParticles=1
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.2260000,Max=1.3500000),Y=(Min=0.2250000,Max=0.4500000),Z=(Min=0.2250000,Max=0.4500000))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
        InitialParticlesPerSecond=13.5000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit.hit_muzzle_c'
        SubdivisionEnd=1
        LifetimeRange=(Min=0.1111110,Max=0.1111110)
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[3]=SpriteEmitter21
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_teen_blood_headshot_hit.SpriteEmitter22'
    begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=83.1505966,Y=73.0365982,Z=-585.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3609470
        MaxParticles=7
        StartLocationRange=(X=(Min=-6.5000000,Max=6.5000000),Y=(Min=-6.5000000,Max=6.5000000),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0520000,Max=0.0520000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
        InitialParticlesPerSecond=1230.2149658
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit_blood.teen_blood_animated1_alpha_02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.8000000,Max=0.8000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-120.0000000,Max=120.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-25.5179996,Max=246.5800018))
        CullDistance=1000.0000000
        DisableIfCulled=true
    end object
    Emitters[4]=SpriteEmitter22
    AutoDestroy=true
    bNoDelete=false
}