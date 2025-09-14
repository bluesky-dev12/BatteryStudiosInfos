class HitEffect_rock_hit extends Emitter;

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_rock_hit.SpriteEmitter145'
    begin object name="SpriteEmitter145" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=292.8597717,Y=102.3515930,Z=115.9996490)
        ColorScale=/* Array type was not detected. */
        Opacity=0.1000000
        FadeOutStartTime=0.1646670
        FadeInEndTime=0.0380000
        CoordinateSystem=1
        MaxParticles=3
        StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=-1.3500000,Max=1.3500000),Y=(Min=0.1215000,Max=0.2430000),Z=(Min=0.1215000,Max=0.2430000))
        StartSpinRange=(X=(Min=-0.9000000,Max=0.9000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=104.0000000,Max=104.0000000),Y=(Min=104.0000000,Max=104.0000000),Z=(Min=104.0000000,Max=104.0000000))
        InitialParticlesPerSecond=11502.0000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.smoke_fire'
        SubdivisionEnd=1
        LifetimeRange=(Min=1.2666670,Max=1.2666670)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=-64.7399979,Max=64.7399979),Y=(Min=-126.3600006,Max=126.3600006),Z=(Min=-42.1199989,Max=42.1199989))
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[0]=SpriteEmitter145
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_rock_hit.SpriteEmitter146'
    begin object name="SpriteEmitter146" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        DampRotation=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1080.5603027)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3580000,Max=0.4800000),Y=(Min=0.3580000,Max=0.4800000),Z=(Min=0.3580000,Max=0.4800000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.8658010
        MaxParticles=5
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-1.7330000,Max=1.7330000),Y=(Min=-4.7501001,Max=4.7501001),Z=(Min=-4.7501001,Max=4.7501001))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=4.0000000),Z=(Min=2.0000000,Max=4.0000000))
        InitialParticlesPerSecond=2375.0500488
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.Concrete_Debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=1.2987010,Max=1.2987010)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-508.2000122,Max=508.2000122),Y=(Min=-508.2000122,Max=508.2000122),Z=(Min=-217.1399994,Max=586.7400513))
    end object
    Emitters[1]=SpriteEmitter146
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_rock_hit.SpriteEmitter147'
    begin object name="SpriteEmitter147" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=2388.2038574,Y=0.0000000,Z=-379.0799866)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0444440
        FadeInEndTime=0.0066670
        CoordinateSystem=1
        MaxParticles=3
        StartLocationShape=2
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1130400,Max=0.1130400),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
        InitialParticlesPerSecond=1109.7650146
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.hit_brick'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=0.0000000,Max=105.7024765),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        MaxAbsVelocity=(X=238.5054779,Y=0.0000000,Z=0.0000000)
    end object
    Emitters[2]=SpriteEmitter147
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_rock_hit.SpriteEmitter148'
    begin object name="SpriteEmitter148" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.6100000
        FadeOutStartTime=0.0066670
        FadeInEndTime=0.0022220
        CoordinateSystem=1
        MaxParticles=1
        StartLocationShape=2
        SpinsPerSecondRange=(X=(Min=0.2260000,Max=1.3500000),Y=(Min=0.2250000,Max=0.4500000),Z=(Min=0.2250000,Max=0.4500000))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=18.0000000,Max=18.0000000),Y=(Min=18.0000000,Max=18.0000000),Z=(Min=18.0000000,Max=18.0000000))
        InitialParticlesPerSecond=13.5000000
        DrawStyle=6
        Texture=Texture'FX_TEX.Hit.hit_muzzle_c'
        SubdivisionEnd=1
        LifetimeRange=(Min=0.1111110,Max=0.1111110)
        StartVelocityRadialRange=(Min=3.0000000,Max=3.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[3]=SpriteEmitter148
    // Reference: SpriteEmitter'XEffects_Decompressed.HitEffect_rock_hit.SpriteEmitter149'
    begin object name="SpriteEmitter149" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=2388.2038574,Y=0.0000000,Z=-379.0799866)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0444440
        FadeInEndTime=0.0066670
        CoordinateSystem=1
        MaxParticles=3
        StartLocationShape=2
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1130400,Max=0.1130400),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=65.0000000,Max=65.0000000),Y=(Min=65.0000000,Max=65.0000000),Z=(Min=65.0000000,Max=65.0000000))
        InitialParticlesPerSecond=1109.7650146
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.dirt_soil_bt'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.1600000,Max=0.1600000)
        StartVelocityRange=(X=(Min=0.0000000,Max=105.7024765),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        MaxAbsVelocity=(X=238.5054779,Y=0.0000000,Z=0.0000000)
    end object
    Emitters[4]=SpriteEmitter149
    AutoDestroy=true
    bNoDelete=false
}