class XWFX_Alien_Eta_explosion extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Eta_explosion.SpriteEmitter181'
    begin object name="SpriteEmitter181" class=Engine.SpriteEmitter
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
        Acceleration=(X=-46.6780014,Y=194.4049988,Z=653.2030029)
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
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        InitialParticlesPerSecond=14115.8408203
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no_alien'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.8600260,Max=2.6692710)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-401.6409912,Max=401.6409912),Y=(Min=-401.6409912,Max=401.6409912),Z=(Min=-895.2000122,Max=853.5869751))
        VelocityLossRange=(X=(Min=1.5482880,Max=3.0965760),Y=(Min=1.5482880,Max=3.0965760),Z=(Min=1.5482880,Max=3.0965760))
        RotateVelocityLossRange=true
    end object
    Emitters[0]=SpriteEmitter181
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Eta_explosion.SpriteEmitter182'
    begin object name="SpriteEmitter182" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.8192550
        FadeInEndTime=0.1328520
        MaxParticles=6
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0680000,Max=0.0680000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=160.0000000,Max=160.0000000),Y=(Min=160.0000000,Max=160.0000000),Z=(Min=160.0000000,Max=160.0000000))
        InitialParticlesPerSecond=16644.8242188
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no_alien'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.2142010,Max=2.2142010)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1100.0000000,Max=1100.0000000),Y=(Min=-1100.0000000,Max=1100.0000000),Z=(Min=-148.1139984,Max=1021.6500244))
        VelocityLossRange=(X=(Min=3.3289649,Max=6.6579309),Y=(Min=3.3289649,Max=6.6579309),Z=(Min=3.3289649,Max=6.6579309))
        RotateVelocityLossRange=true
    end object
    Emitters[1]=SpriteEmitter182
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Eta_explosion.SpriteEmitter183'
    begin object name="SpriteEmitter183" class=Engine.SpriteEmitter
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
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=170.0000000,Max=170.0000000),Y=(Min=170.0000000,Max=170.0000000),Z=(Min=170.0000000,Max=170.0000000))
        InitialParticlesPerSecond=981.1879883
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.2000000,Max=1.2000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-209.8979797,Max=200.7719879),Y=(Min=-216.2861938,Max=216.2861938),Z=(Min=80.7299957,Max=80.7299957))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[2]=SpriteEmitter183
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Eta_explosion.SpriteEmitter184'
    begin object name="SpriteEmitter184" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=89.6819992,Y=89.6819992,Z=-1237.8260498)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4700000
        FadeInEndTime=0.0100000
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-3.0590000,Max=3.0590000),Y=(Min=-2.5805299,Max=2.5805299),Z=(Min=-2.5805299,Max=2.5805299))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=5.0000000,Max=15.0000000),Y=(Min=5.0000000,Max=15.0000000),Z=(Min=5.0000000,Max=15.0000000))
        InitialParticlesPerSecond=1290.2659912
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_04'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        InitialDelayRange=(Min=0.0500000,Max=0.0500000)
        StartVelocityRange=(X=(Min=-733.3319702,Max=733.3319702),Y=(Min=-733.3319702,Max=733.3319702),Z=(Min=575.7449951,Max=1275.7449951))
    end object
    Emitters[3]=SpriteEmitter184
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Eta_explosion.SpriteEmitter185'
    begin object name="SpriteEmitter185" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=350.0000000,Max=350.0000000),Y=(Min=350.0000000,Max=350.0000000),Z=(Min=350.0000000,Max=350.0000000))
        InitialParticlesPerSecond=1339.3220215
        Texture=Texture'FX_TEX.Explosion.explo_ani02'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.5000000,Max=1.5000000)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-174.0540009,Max=174.0540009),Y=(Min=-195.2310028,Max=195.2310028),Z=(Min=110.1959991,Max=110.1959991))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[4]=SpriteEmitter185
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Eta_explosion.SpriteEmitter189'
    begin object name="SpriteEmitter189" class=Engine.SpriteEmitter
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
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=50.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
        InitialParticlesPerSecond=838.6220093
        Texture=Texture'FX_TEX.Alien_FX.alien_death'
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
    end object
    Emitters[5]=SpriteEmitter189
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Eta_explosion.SpriteEmitter191'
    begin object name="SpriteEmitter191" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1711.5318604)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1415380
        MaxParticles=5
        StartLocationRange=(X=(Min=-8.4499998,Max=8.4499998),Y=(Min=-8.4499998,Max=8.4499998),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
        InitialParticlesPerSecond=1407.3659668
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_05'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.6000000,Max=0.6000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-330.0000000,Max=330.0000000),Y=(Min=-330.0000000,Max=330.0000000),Z=(Min=100.0000000,Max=1000.0000000))
    end object
    Emitters[6]=SpriteEmitter191
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Eta_explosion.SpriteEmitter193'
    begin object name="SpriteEmitter193" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1395.1204834)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1769220
        StartLocationRange=(X=(Min=-7.8000002,Max=7.8000002),Y=(Min=-7.8000002,Max=7.8000002),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0800000,Max=0.0800000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        InitialParticlesPerSecond=1125.8929443
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_08'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.7500000,Max=0.7500000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-504.3840332,Max=504.3840332),Y=(Min=-504.3840332,Max=504.3840332),Z=(Min=96.0000076,Max=1152.0000000))
    end object
    Emitters[7]=SpriteEmitter193
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Eta_explosion.SpriteEmitter194'
    begin object name="SpriteEmitter194" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-2000.0000000)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2254900
        FadeInEndTime=0.1078430
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=5.0000000,Max=5.0000000))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.glow_blue'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1146.1180420,Max=1146.1180420),Y=(Min=-1146.1180420,Max=1146.1180420),Z=(Min=107.7860031,Max=1807.7860107))
        GetVelocityDirectionFrom=3
    end object
    Emitters[8]=SpriteEmitter194
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Eta_explosion.SpriteEmitter200'
    begin object name="SpriteEmitter200" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1395.1199951)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1769220
        MaxParticles=8
        StartLocationRange=(X=(Min=-7.8000002,Max=7.8000002),Y=(Min=-7.8000002,Max=7.8000002),Z=(Min=0.0000000,Max=0.0000000))
        SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0800000,Max=0.0800000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        InitialParticlesPerSecond=1125.8929443
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_08'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.7500000,Max=0.7500000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-304.3840027,Max=304.3840027),Y=(Min=-304.3840027,Max=304.3840027),Z=(Min=96.0000000,Max=952.0000000))
    end object
    Emitters[9]=SpriteEmitter200
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