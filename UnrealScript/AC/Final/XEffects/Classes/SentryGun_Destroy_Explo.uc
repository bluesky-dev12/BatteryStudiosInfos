class SentryGun_Destroy_Explo extends Emitter;

simulated function PostBeginPlay()
{
    local PlayerController PC;
    local float dist;

    PC = Level.GetLocalPlayerController();
    // End:0x37
    if(PC.ViewTarget == none)
    {
        dist = 10000.0000000;        
    }
    else
    {
        dist = VSize(PC.ViewTarget.Location - Location);
    }
    // End:0xA6
    if(dist > float(4000))
    {
        LightType = 0;
        bDynamicLight = false;
        // End:0xA3
        if(dist > float(7000))
        {
            Emitters[4].Disabled = true;
        }        
    }
    else
    {
        // End:0xC3
        if(Level.bDropDetail)
        {
            LightRadius = 0.0000000;
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter257'
    begin object name="SpriteEmitter257" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=106.4550018,Y=106.4550018,Z=-1500.0000000)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4700000
        FadeInEndTime=0.0100000
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-3.0590000,Max=3.0590000),Y=(Min=-2.5805299,Max=2.5805299),Z=(Min=-2.5805299,Max=2.5805299))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=6.0000000,Max=15.0000000),Y=(Min=6.0000000,Max=15.0000000),Z=(Min=6.0000000,Max=15.0000000))
        InitialParticlesPerSecond=1290.2659912
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.metal_debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        InitialDelayRange=(Min=0.0500000,Max=0.0500000)
        StartVelocityRange=(X=(Min=-500.0000000,Max=500.0000000),Y=(Min=-500.0000000,Max=500.0000000),Z=(Min=100.0000000,Max=1000.0000000))
    end object
    Emitters[0]=SpriteEmitter257
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter258'
    begin object name="SpriteEmitter258" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1550.0000000)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2254900
        FadeInEndTime=0.1078430
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=3.0000000,Max=3.0000000))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-500.0000000,Max=500.0000000),Y=(Min=-500.0000000,Max=500.0000000),Z=(Min=200.0000000,Max=1100.0000000))
        GetVelocityDirectionFrom=3
    end object
    Emitters[1]=SpriteEmitter258
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter260'
    begin object name="SpriteEmitter260" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-90.2556915)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        Opacity=0.6100000
        FadeOutStartTime=0.7654670
        FadeInEndTime=0.1815030
        MaxParticles=15
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=38.8799973,Max=38.8799973),Y=(Min=145.8000031,Max=145.8000031),Z=(Min=38.8799973,Max=38.8799973))
        InitialParticlesPerSecond=2396.0520020
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_big01'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.7891410,Max=0.7891410)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-246.6673737,Max=246.6673737),Y=(Min=-246.6673737,Max=246.6673737),Z=(Min=150.0000153,Max=277.1268921))
    end object
    Emitters[2]=SpriteEmitter260
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter196'
    begin object name="SpriteEmitter196" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.5296917)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        Opacity=0.6600000
        FadeOutStartTime=0.2790860
        FadeInEndTime=0.0858720
        MaxParticles=5
        StartLocationRange=(X=(Min=-67.2000046,Max=67.2000046),Y=(Min=-70.5600052,Max=70.5600052),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=40.8000031,Max=40.8000031),Y=(Min=408.0000305,Max=408.0000305),Z=(Min=40.8000031,Max=40.8000031))
        InitialParticlesPerSecond=1454.4799805
        DrawStyle=1
        Texture=Texture'FX_TEX.Explosion.explo_smokline'
        TextureUSubdivisions=4
        TextureVSubdivisions=1
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.8790270,Max=1.8790270)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-125.2086029,Max=125.2086029),Y=(Min=-125.2086029,Max=125.2086029),Z=(Min=92.6286011,Max=220.3926239))
    end object
    Emitters[3]=SpriteEmitter196
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter261'
    begin object name="SpriteEmitter261" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.1950000
        FadeInEndTime=0.0350000
        MaxParticles=3
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=90.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1460000,Max=0.1460000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=60.0000038,Max=60.0000038),Y=(Min=60.0000038,Max=60.0000038),Z=(Min=60.0000038,Max=60.0000038))
        InitialParticlesPerSecond=1607.1870117
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[4]=SpriteEmitter261
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter263'
    begin object name="SpriteEmitter263" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1461540
        FadeInEndTime=0.0211540
        MaxParticles=3
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=90.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=88.0000000,Max=88.0000000),Y=(Min=88.0000000,Max=88.0000000),Z=(Min=88.0000000,Max=88.0000000))
        InitialParticlesPerSecond=1377.5889893
        Texture=Texture'FX_TEX.Explosion.explo_frame_02'
        LifetimeRange=(Min=0.3750000,Max=0.3750000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[5]=SpriteEmitter263
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.1950000
        FadeInEndTime=0.0350000
        MaxParticles=3
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1460000,Max=0.1460000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=72.0000076,Max=72.0000076),Y=(Min=72.0000076,Max=72.0000076),Z=(Min=72.0000076,Max=72.0000076))
        InitialParticlesPerSecond=1607.1870117
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[6]=SpriteEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter266'
    begin object name="SpriteEmitter266" class=Engine.SpriteEmitter
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
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-70.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.8000000
        FadeOutStartTime=0.8192550
        FadeInEndTime=0.1328520
        MaxParticles=15
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0680000,Max=0.0680000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        InitialParticlesPerSecond=16644.8242188
        DrawStyle=5
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.2142010,Max=2.2142010)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-874.9569702,Max=874.9569702),Y=(Min=-874.9569702,Max=874.9569702),Z=(Min=-38.4910011,Max=577.3200073))
        VelocityLossRange=(X=(Min=3.3289649,Max=6.6579309),Y=(Min=3.3289649,Max=6.6579309),Z=(Min=3.3289649,Max=6.6579309))
        RotateVelocityLossRange=true
    end object
    Emitters[7]=SpriteEmitter266
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter267'
    begin object name="SpriteEmitter267" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=13.3254185,Y=13.3698368,Z=39.8065720)
        ColorScale=/* Array type was not detected. */
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=50.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=84.0000000,Max=84.0000000),Y=(Min=84.0000000,Max=84.0000000),Z=(Min=84.0000000,Max=84.0000000))
        InitialParticlesPerSecond=981.1879883
        Texture=Texture'FX_TEX.Explosion.exp7_frames'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.5555560,Max=0.5555560)
        InitialDelayRange=(Min=0.1300000,Max=0.1300000)
        StartVelocityRange=(X=(Min=-167.9183960,Max=160.6175995),Y=(Min=-173.0289612,Max=173.0289612),Z=(Min=64.5839996,Max=64.5839996))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[8]=SpriteEmitter267
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter269'
    begin object name="SpriteEmitter269" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0233330
        FadeInEndTime=0.0100000
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=50.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=84.0000000,Max=84.0000000),Y=(Min=84.0000000,Max=84.0000000),Z=(Min=84.0000000,Max=84.0000000))
        InitialParticlesPerSecond=754.7600098
        Texture=Texture'FX_TEX.Explosion.explo_particle'
        LifetimeRange=(Min=0.3333330,Max=0.3333330)
    end object
    Emitters[9]=SpriteEmitter269
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter270'
    begin object name="SpriteEmitter270" class=Engine.SpriteEmitter
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
        Acceleration=(X=0.0000000,Y=0.0000000,Z=1044.0024414)
        ColorScale=/* Array type was not detected. */
        Opacity=0.8000000
        FadeOutStartTime=0.4345410
        FadeInEndTime=0.1042900
        MaxParticles=5
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=80.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1040000,Max=0.1040000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=84.0000000,Max=84.0000000),Y=(Min=84.0000000,Max=84.0000000),Z=(Min=84.0000000,Max=84.0000000))
        InitialParticlesPerSecond=29527.6777344
        DrawStyle=5
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.7381650,Max=1.7381650)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-1045.0560303,Max=1045.0560303),Y=(Min=-1045.0560303,Max=1045.0560303),Z=(Min=-297.4080200,Max=992.4479980))
        VelocityLossRange=(X=(Min=5.9055362,Max=11.8110723),Y=(Min=5.9055362,Max=11.8110723),Z=(Min=5.9055362,Max=11.8110723))
        RotateVelocityLossRange=true
    end object
    Emitters[10]=SpriteEmitter270
    // Reference: SpriteEmitter'XEffects_Decompressed.SentryGun_Destroy_Explo.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.1950000
        FadeInEndTime=0.0350000
        MaxParticles=3
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=50.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1460000,Max=0.1460000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
        InitialParticlesPerSecond=1607.1870117
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[11]=SpriteEmitter1
    AutoDestroy=true
    LightType=10
    LightEffect=21
    LightHue=28
    LightSaturation=90
    LightBrightness=255.0000000
    LightRadius=9.0000000
    LightPeriod=32
    LightCone=128
    bNoDelete=false
    bDynamicLight=true
}