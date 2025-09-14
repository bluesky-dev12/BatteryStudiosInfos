class WFX_ExplodingBarrel extends Emitter;

defaultproperties
{
    Emitters[0]=none
    // Reference: SpriteEmitter'UT2k4Assault_Decompressed.WFX_ExplodingBarrel.SpriteEmitter48'
    begin object name="SpriteEmitter48" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2156860
        MaxParticles=50
        DetailMode=1
        StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
        SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        StartSizeRange=(X=(Min=3.0000000,Max=8.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=30.0000000,Max=30.0000000))
        InitialParticlesPerSecond=11475.0000000
        Texture=Texture'FX_TEX.Flares.Laser_Flare'
        LifetimeRange=(Min=0.1310000,Max=3.3850000)
        StartVelocityRange=(X=(Min=-1200.0000000,Max=1200.0000000),Y=(Min=-1200.0000000,Max=1200.0000000),Z=(Min=100.0000000,Max=1600.0000000))
    end object
    Emitters[1]=SpriteEmitter48
    // Reference: SpriteEmitter'UT2k4Assault_Decompressed.WFX_ExplodingBarrel.SpriteEmitter49'
    begin object name="SpriteEmitter49" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=10.0000000,Y=10.0000000,Z=-2003.8900146)
        DampingFactorRange=(X=(Min=0.4580000,Max=0.5800000),Y=(Min=0.4580000,Max=0.5800000),Z=(Min=0.4580000,Max=0.5800000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.9800000
        FadeInEndTime=0.0900000
        MaxParticles=20
        DetailMode=1
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
        StartSizeRange=(X=(Min=1.0000000,Max=5.0000000),Y=(Min=1.0000000,Max=5.0000000),Z=(Min=1.0000000,Max=5.0000000))
        InitialParticlesPerSecond=500.0000000
        Texture=Texture'FX_TEX.Hit_Effects.Concrete_Debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.9000000,Max=3.0000000)
        StartVelocityRange=(X=(Min=-191.9199982,Max=391.9200134),Y=(Min=-191.9199982,Max=391.9200134),Z=(Min=302.0000000,Max=802.8410034))
    end object
    Emitters[2]=SpriteEmitter49
    Emitters[3]=none
    // Reference: SpriteEmitter'UT2k4Assault_Decompressed.WFX_ExplodingBarrel.SpriteEmitter43'
    begin object name="SpriteEmitter43" class=Engine.SpriteEmitter
        UseDirectionAs=4
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=4.0000000
        MaxParticles=3
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.5000000,Max=0.5000000))
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        InitialParticlesPerSecond=100.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_BulletHole.explosion_mark'
        SecondsBeforeInactive=0.0000000
        LifetimeRange=(Min=10.0000000,Max=10.0000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
    end object
    Emitters[4]=SpriteEmitter43
    // Reference: SpriteEmitter'UT2k4Assault_Decompressed.WFX_ExplodingBarrel.SpriteEmitter44'
    begin object name="SpriteEmitter44" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.7200000
        CoordinateSystem=1
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-32.0000000,Max=188.0000000))
        AlphaRef=4
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=55.0000000,Max=55.0000000),Y=(Min=55.0000000,Max=55.0000000),Z=(Min=55.0000000,Max=55.0000000))
        InitialParticlesPerSecond=500.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_far'
        LifetimeRange=(Min=2.7000000,Max=6.5000000)
        StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=10.0000000,Max=600.0000000))
        VelocityLossRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
        RotateVelocityLossRange=true
    end object
    Emitters[5]=SpriteEmitter44
    // Reference: SpriteEmitter'UT2k4Assault_Decompressed.WFX_ExplodingBarrel.SpriteEmitter45'
    begin object name="SpriteEmitter45" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1000.4599609)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.7200000
        DetailMode=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
        StartLocationRange=(X=(Min=-99.0000000,Max=99.0000000),Y=(Min=-99.0000000,Max=99.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0200000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=178.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.debree_plg_dirt_b'
        LifetimeRange=(Min=1.7000000,Max=2.5000000)
        StartVelocityRange=(X=(Min=-64.0000000,Max=64.0000000),Y=(Min=-64.0000000,Max=64.0000000),Z=(Min=131.2729950,Max=678.3859863))
        MaxAbsVelocity=(X=1000.0000000,Y=1000.0000000,Z=1000.0000000)
    end object
    Emitters[6]=SpriteEmitter45
    // Reference: SpriteEmitter'UT2k4Assault_Decompressed.WFX_ExplodingBarrel.SpriteEmitter46'
    begin object name="SpriteEmitter46" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5900000
        FadeOutStartTime=0.1190000
        StartLocationShape=1
        SphereRadiusRange=(Min=0.0000000,Max=50.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=50.0000000,Max=50.0000000))
        SpawningSound=2
        SpawningSoundProbability=(Min=1.0000000,Max=1.0000000)
        InitialParticlesPerSecond=3000.0000000
        Texture=Texture'FX_TEX.Explosion.explo_sm_a'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        MaxAbsVelocity=(X=0.0000000,Y=0.0000000,Z=20.0000000)
    end object
    Emitters[7]=SpriteEmitter46
    // Reference: SpriteEmitter'UT2k4Assault_Decompressed.WFX_ExplodingBarrel.SpriteEmitter47'
    begin object name="SpriteEmitter47" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-60.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=3.2900000
        FadeInEndTime=0.1400000
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-22.0000000,Max=20.0000000))
        AlphaRef=4
        SpinCCWorCW=(X=1.0000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0200000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
        InitialParticlesPerSecond=500.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke04'
        LifetimeRange=(Min=1.0000000,Max=7.0000000)
        InitialDelayRange=(Min=0.1100000,Max=0.1100000)
        StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=90.0000000,Max=90.0000000))
        VelocityLossRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
        RotateVelocityLossRange=true
    end object
    Emitters[8]=SpriteEmitter47
    AutoDestroy=true
    bNoDelete=false
}