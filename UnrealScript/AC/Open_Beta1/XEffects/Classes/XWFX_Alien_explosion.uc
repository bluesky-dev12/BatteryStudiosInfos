class XWFX_Alien_explosion extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_explosion.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
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
        Acceleration=(X=-46.6780014,Y=294.4049988,Z=753.2030029)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.0410160
        FadeInEndTime=0.2135420
        MaxParticles=6
        StartLocationOffset=(X=40.0000000,Y=-40.0000000,Z=60.0000000)
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=135.0000000,Max=135.0000000))
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0770000,Max=0.0770000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=180.0000000,Max=180.0000000),Y=(Min=180.0000000,Max=180.0000000),Z=(Min=180.0000000,Max=180.0000000))
        InitialParticlesPerSecond=14115.8408203
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no_alien'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.8600260,Max=2.6692710)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-701.6409912,Max=701.6409912),Y=(Min=-701.6409912,Max=701.6409912),Z=(Min=-1495.1999512,Max=853.5869751))
        VelocityLossRange=(X=(Min=1.5482880,Max=3.0965760),Y=(Min=1.5482880,Max=3.0965760),Z=(Min=1.5482880,Max=3.0965760))
        RotateVelocityLossRange=true
    end object
    Emitters[0]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_explosion.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
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
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-24.2504997)
        ColorScale=/* Array type was not detected. */
        Opacity=0.8300000
        FadeOutStartTime=0.8192550
        FadeInEndTime=0.1328520
        MaxParticles=6
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0680000,Max=0.0680000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=270.0000000,Max=270.0000000),Y=(Min=270.0000000,Max=270.0000000),Z=(Min=270.0000000,Max=270.0000000))
        InitialParticlesPerSecond=16644.8242188
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no_alien'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.2142010,Max=2.2142010)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-2193.6960449,Max=2193.6960449),Y=(Min=-2193.6960449,Max=2193.6960449),Z=(Min=-1748.1140137,Max=721.6500244))
        VelocityLossRange=(X=(Min=3.3289649,Max=6.6579309),Y=(Min=3.3289649,Max=6.6579309),Z=(Min=3.3289649,Max=6.6579309))
        RotateVelocityLossRange=true
    end object
    Emitters[1]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_explosion.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=16.6567726,Y=16.7122955,Z=49.7582130)
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=300.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=981.1879883
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.2000000,Max=1.2000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-209.8979797,Max=200.7719879),Y=(Min=-216.2861938,Max=216.2861938),Z=(Min=80.7299957,Max=80.7299957))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[2]=SpriteEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_explosion.SpriteEmitter5'
    begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=159.6824951,Y=159.6824951,Z=-4037.8261719)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4700000
        FadeInEndTime=0.0100000
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-3.0590000,Max=3.0590000),Y=(Min=-2.5805299,Max=2.5805299),Z=(Min=-2.5805299,Max=2.5805299))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=15.0000000,Max=30.0000000),Y=(Min=15.0000000,Max=30.0000000),Z=(Min=15.0000000,Max=30.0000000))
        InitialParticlesPerSecond=1290.2659912
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_04'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        InitialDelayRange=(Min=0.0500000,Max=0.0500000)
        StartVelocityRange=(X=(Min=-1606.2480469,Max=1533.3315430),Y=(Min=-1606.2480469,Max=1533.3315430),Z=(Min=575.7449951,Max=3275.7451172))
    end object
    Emitters[3]=SpriteEmitter5
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_explosion.SpriteEmitter6'
    begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=31.0353127,Y=31.1387672,Z=92.7107544)
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationRange=(X=(Min=-45.0000000,Max=45.0000000),Y=(Min=-45.0000000,Max=45.0000000),Z=(Min=-45.0000000,Max=45.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1220000,Max=0.1220000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=585.0000000,Max=585.0000000),Y=(Min=585.0000000,Max=585.0000000),Z=(Min=585.0000000,Max=585.0000000))
        InitialParticlesPerSecond=1339.3220215
        Texture=Texture'FX_TEX.Explosion.explo_ani02'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.5000000,Max=1.5000000)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-286.5107727,Max=274.0537415),Y=(Min=-295.2306519,Max=295.2306519),Z=(Min=110.1964264,Max=110.1964264))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[4]=SpriteEmitter6
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_explosion.SpriteEmitter8'
    begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
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
        Acceleration=(X=0.0000000,Y=0.0000000,Z=3105.0029297)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4345410
        FadeInEndTime=0.1042900
        MaxParticles=4
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1040000,Max=0.1040000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=29527.6777344
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no_alien'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.7381650,Max=1.7381650)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-1906.3199463,Max=1906.3199463),Y=(Min=-1906.3199463,Max=1906.3199463),Z=(Min=-2421.7600098,Max=1540.5600586))
        VelocityLossRange=(X=(Min=5.9055362,Max=11.8110723),Y=(Min=5.9055362,Max=11.8110723),Z=(Min=5.9055362,Max=11.8110723))
        RotateVelocityLossRange=true
    end object
    Emitters[5]=SpriteEmitter8
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_explosion.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-3228.4799805)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2254900
        FadeInEndTime=0.1078430
        MaxParticles=8
        StartLocationRange=(X=(Min=-45.0000000,Max=45.0000000),Y=(Min=-81.0000000,Max=81.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=12.0000000,Max=12.0000000))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.glow_blue'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-2319.1770020,Max=2319.1770020),Y=(Min=-2319.1770020,Max=2319.1770020),Z=(Min=161.6790009,Max=3161.6787109))
        GetVelocityDirectionFrom=3
    end object
    Emitters[6]=SpriteEmitter9
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_explosion.SpriteEmitter10'
    begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=16.6567726,Y=16.7122955,Z=49.7582130)
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
        InitialParticlesPerSecond=981.1879883
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.2000000,Max=1.2000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-209.8979797,Max=200.7719879),Y=(Min=-216.2861938,Max=216.2861938),Z=(Min=80.7299957,Max=80.7299957))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[7]=SpriteEmitter10
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_explosion.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.0210000
        FadeInEndTime=0.0090000
        MaxParticles=2
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
        InitialParticlesPerSecond=838.6220093
        Texture=Texture'FX_TEX.Alien_FX.alien_death'
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
    end object
    Emitters[8]=SpriteEmitter0
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