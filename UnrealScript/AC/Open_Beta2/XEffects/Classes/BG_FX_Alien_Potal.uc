class BG_FX_Alien_Potal extends Emitter;

defaultproperties
{
    // Reference: MeshEmitter'XEffects_Decompressed.BG_FX_Alien_Potal.MeshEmitter0'
    begin object name="MeshEmitter0" class=Engine.MeshEmitter
        StaticMesh=StaticMesh'FX_StaticMesh.Map.Alien_Potal'
        RenderTwoSided=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=500.0000000)
        StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
        InitialParticlesPerSecond=333333344.0000000
        LifetimeRange=(Min=30.0000000,Max=30.0000000)
    end object
    Emitters[0]=MeshEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Alien_Potal.SpriteEmitter13'
    begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
        UseDirectionAs=5
        FadeOut=true
        FadeIn=true
        UseRevolution=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-4.9000001)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.6000000,Max=0.6000000))
        FadeOutStartTime=9.1428576
        FadeInEndTime=0.9142860
        CoordinateSystem=1
        MaxParticles=200
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
        StartLocationShape=2
        StartLocationPolarRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=145536.0000000),Z=(Min=1600.0000000,Max=1600.0000000))
        RevolutionsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.1000000,Max=0.1000000))
        UseRotationFrom=2
        RotationOffset=(Pitch=0,Yaw=0,Roll=-16384)
        SpinsPerSecondRange=(X=(Min=0.2100000,Max=0.2100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=550.0000000,Max=550.0000000),Y=(Min=550.0000000,Max=550.0000000),Z=(Min=550.0000000,Max=550.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_016'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=11.4285717,Max=11.4285717)
        StartVelocityRadialRange=(Min=-100.0000000,Max=-100.0000000)
        GetVelocityDirectionFrom=3
    end object
    Emitters[1]=SpriteEmitter13
    // Reference: BeamEmitter'XEffects_Decompressed.BG_FX_Alien_Potal.BeamEmitter1'
    begin object name="BeamEmitter1" class=Engine.BeamEmitter
        BeamEndPoints=/* Array type was not detected. */
        DetermineEndPointBy=2
        RotatingSheets=3
        LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-100.0000000,Max=100.0000000))
        LowFrequencyPoints=2
        HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-100.0000000,Max=100.0000000))
        HighFrequencyPoints=3
        UseHighFrequencyScale=true
        UseLowFrequencyScale=true
        NoiseDeterminesEndPoint=true
        DynamicTimeBetweenNoiseRange=(Min=0.2000000,Max=0.5000000)
        UseColorScale=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
        Opacity=0.5000000
        FadeInEndTime=4.0000000
        MaxParticles=5
        SizeScale=/* Array type was not detected. */
        Texture=Texture'FX_TEX.Spark.HotBolt04aw'
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
    end object
    Emitters[2]=BeamEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Alien_Potal.SpriteEmitter5'
    begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.6000000,Max=0.6000000))
        Opacity=0.2800000
        FadeOutStartTime=6.0000000
        FadeInEndTime=2.0000000
        MaxParticles=25
        StartLocationRange=(X=(Min=-330.0000000,Max=330.0000000),Y=(Min=-330.0000000,Max=330.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_020'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=8.0000000,Max=8.0000000)
        StartVelocityRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=-400.0000000,Max=-400.0000000))
    end object
    Emitters[3]=SpriteEmitter5
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Alien_Potal.SpriteEmitter6'
    begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
        UseDirectionAs=4
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-45.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=2.0000000
        FadeInEndTime=2.0000000
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=550.0000000,Max=550.0000000),Y=(Min=550.0000000,Max=550.0000000),Z=(Min=550.0000000,Max=550.0000000))
        DrawStyle=6
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_04_noalpha'
        LifetimeRange=(Min=5.0000000,Max=6.0000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=100.0000000,Max=100.0000000))
    end object
    Emitters[4]=SpriteEmitter6
    // Reference: BeamEmitter'XEffects_Decompressed.BG_FX_Alien_Potal.BeamEmitter3'
    begin object name="BeamEmitter3" class=Engine.BeamEmitter
        BeamDistanceRange=(Min=1150.0000000,Max=4300.0000000)
        DetermineEndPointBy=1
        RotatingSheets=2
        LowFrequencyNoiseRange=(X=(Min=-650.0000000,Max=650.0000000),Y=(Min=-650.0000000,Max=650.0000000),Z=(Min=-650.0000000,Max=650.0000000))
        HighFrequencyNoiseRange=(X=(Min=-420.0000000,Max=420.0000000),Y=(Min=-420.0000000,Max=420.0000000),Z=(Min=-420.0000000,Max=420.0000000))
        HighFrequencyPoints=8
        FadeOut=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.6000000
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
        StartLocationRange=(X=(Min=-800.0000000,Max=800.0000000),Y=(Min=-800.0000000,Max=800.0000000),Z=(Min=0.0000000,Max=0.0000000))
        UseRotationFrom=1
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=7200.0000000,Max=7200.0000000),Z=(Min=7200.0000000,Max=7200.0000000))
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_01'
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-7400.0000000,Max=7400.0000000),Y=(Min=-7400.0000000,Max=7400.0000000),Z=(Min=-4000.0000000,Max=-4000.0000000))
        StartVelocityRadialRange=(Min=-100.0000000,Max=-100.0000000)
        WarmupTicksPerSecond=2.0000000
        RelativeWarmupTime=2.0000000
    end object
    Emitters[5]=BeamEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.BG_FX_Alien_Potal.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        ResetAfterChange=true
        RespawnDeadParticles=false
        AutoReset=true
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ColorScale=/* Array type was not detected. */
        ColorScaleRepeats=2.0000000
        FadeOutStartTime=0.3000000
        FadeInEndTime=0.1000000
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-1550.0000000)
        StartLocationRange=(X=(Min=-550.0000000,Max=550.0000000),Y=(Min=-550.0000000,Max=550.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=1
        SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
        StartSizeRange=(X=(Min=1290.0000000,Max=1290.0000000),Y=(Min=1290.0000000,Max=1290.0000000),Z=(Min=1290.0000000,Max=1290.0000000))
        InitialParticlesPerSecond=1000.0000000
        Texture=Texture'FX_TEX.Spark.spark_th'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=5.0000000,Max=10.0000000)
    end object
    Emitters[6]=SpriteEmitter4
}