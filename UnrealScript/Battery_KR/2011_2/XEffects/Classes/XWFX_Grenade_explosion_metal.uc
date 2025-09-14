class XWFX_Grenade_explosion_metal extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter300'
    begin object name="SpriteEmitter300" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.3700000
        FadeOutStartTime=0.2057140
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=220.0000000,Max=220.0000000),Y=(Min=220.0000000,Max=220.0000000),Z=(Min=220.0000000,Max=220.0000000))
        InitialParticlesPerSecond=32680.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Explosion.explo_bk_impact'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        VelocityLossRange=(X=(Min=0.3360000,Max=0.6720000),Y=(Min=0.3360000,Max=0.6720000),Z=(Min=0.3360000,Max=0.6720000))
        RotateVelocityLossRange=true
    end object
    Emitters[0]=SpriteEmitter300
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter301'
    begin object name="SpriteEmitter301" class=Engine.SpriteEmitter
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
        Acceleration=(X=-31.1189995,Y=196.2700043,Z=482.1350098)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.0410160
        FadeInEndTime=0.2135420
        MaxParticles=7
        StartLocationOffset=(X=40.0000000,Y=-40.0000000,Z=60.0000000)
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=90.0000000,Max=90.0000000))
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0770000,Max=0.0770000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        InitialParticlesPerSecond=14115.8408203
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.8600260,Max=2.6692710)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-467.7609863,Max=467.7609863),Y=(Min=-467.7609863,Max=467.7609863),Z=(Min=-396.7999878,Max=569.0579834))
        VelocityLossRange=(X=(Min=1.5482880,Max=3.0965760),Y=(Min=1.5482880,Max=3.0965760),Z=(Min=1.5482880,Max=3.0965760))
        RotateVelocityLossRange=true
    end object
    Emitters[1]=SpriteEmitter301
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter302'
    begin object name="SpriteEmitter302" class=Engine.SpriteEmitter
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
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-16.1669998)
        ColorScale=/* Array type was not detected. */
        Opacity=0.8300000
        FadeOutStartTime=0.8192550
        FadeInEndTime=0.1328520
        MaxParticles=12
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0680000,Max=0.0680000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        InitialParticlesPerSecond=16644.8242188
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.2142010,Max=2.2142010)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1362.4639893,Max=1362.4639893),Y=(Min=-1362.4639893,Max=1362.4639893),Z=(Min=-32.0760002,Max=481.1000061))
        VelocityLossRange=(X=(Min=3.3289649,Max=6.6579309),Y=(Min=3.3289649,Max=6.6579309),Z=(Min=3.3289649,Max=6.6579309))
        RotateVelocityLossRange=true
    end object
    Emitters[2]=SpriteEmitter302
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter304'
    begin object name="SpriteEmitter304" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=11.1045151,Y=11.1415300,Z=33.1721420)
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=30.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        InitialParticlesPerSecond=981.1879883
        Texture=Texture'FX_TEX.Explosion.exp7_frames'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.5555560,Max=0.5555560)
        InitialDelayRange=(Min=0.1300000,Max=0.1300000)
        StartVelocityRange=(X=(Min=-139.9319916,Max=133.8479919),Y=(Min=-144.1907959,Max=144.1907959),Z=(Min=53.8199997,Max=53.8199997))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[3]=SpriteEmitter304
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter305'
    begin object name="SpriteEmitter305" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-34.2161522)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        Opacity=0.6400000
        FadeOutStartTime=0.2790860
        FadeInEndTime=0.0858720
        MaxParticles=5
        StartLocationRange=(X=(Min=-112.0000000,Max=112.0000000),Y=(Min=-117.5999985,Max=117.5999985),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=68.0000000,Max=68.0000000),Y=(Min=680.0000000,Max=680.0000000),Z=(Min=68.0000000,Max=68.0000000))
        InitialParticlesPerSecond=1454.4799805
        DrawStyle=1
        Texture=Texture'FX_TEX.Explosion.explo_smokline'
        TextureUSubdivisions=4
        TextureVSubdivisions=1
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.8790270,Max=1.8790270)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-208.6809998,Max=208.6809998),Y=(Min=-208.6809998,Max=208.6809998),Z=(Min=154.3809967,Max=367.3210144))
    end object
    Emitters[4]=SpriteEmitter305
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter306'
    begin object name="SpriteEmitter306" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=106.4550018,Y=106.4550018,Z=-1691.8840332)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4700000
        FadeInEndTime=0.0100000
        MaxParticles=7
        DetailMode=1
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-3.0590000,Max=3.0590000),Y=(Min=-2.5805299,Max=2.5805299),Z=(Min=-2.5805299,Max=2.5805299))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=15.0000000,Max=40.0000000),Y=(Min=15.0000000,Max=40.0000000),Z=(Min=15.0000000,Max=40.0000000))
        InitialParticlesPerSecond=1290.2659912
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.metal_debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=1
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        InitialDelayRange=(Min=0.0500000,Max=0.0500000)
        StartVelocityRange=(X=(Min=-770.8319702,Max=722.2210083),Y=(Min=-770.8319702,Max=722.2210083),Z=(Min=383.8299866,Max=1183.8299561))
        CullDistance=2000.0000000
        DisableIfCulled=true
    end object
    Emitters[5]=SpriteEmitter306
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter308'
    begin object name="SpriteEmitter308" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=-673.9199829,Y=-673.9199829,Z=-829.4400635)
        ColorScale=/* Array type was not detected. */
        Opacity=0.9300000
        FadeOutStartTime=0.0472220
        FadeInEndTime=0.0111110
        MaxParticles=6
        DetailMode=1
        StartLocationOffset=(X=-10.0000000,Y=-10.0000000,Z=-40.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        StartLocationPolarRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=70.0000000,Max=70.0000000))
        InitialParticlesPerSecond=24001.9199219
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flank_bullet'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.1152780,Max=0.2777780)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-2433.5998535,Max=2433.5998535),Y=(Min=-2433.5998535,Max=2433.5998535),Z=(Min=720.0000000,Max=720.0000000))
        CullDistance=2000.0000000
        DisableIfCulled=true
    end object
    Emitters[6]=SpriteEmitter308
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter309'
    begin object name="SpriteEmitter309" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=20.6902084,Y=20.7591782,Z=61.8071671)
        ColorScale=/* Array type was not detected. */
        MaxParticles=3
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        StartLocationRange=(X=(Min=-120.0000000,Max=120.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-120.0000000,Max=120.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1220000,Max=0.1220000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=240.0000000,Max=240.0000000),Y=(Min=240.0000000,Max=240.0000000),Z=(Min=240.0000000,Max=240.0000000))
        InitialParticlesPerSecond=1339.3220215
        Texture=Texture'FX_TEX.Explosion.explo_sm_a'
        LifetimeRange=(Min=0.4070000,Max=0.4070000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-191.0071869,Max=182.7024994),Y=(Min=-196.8204346,Max=196.8204346),Z=(Min=73.4642868,Max=73.4642868))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[7]=SpriteEmitter309
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter310'
    begin object name="SpriteEmitter310" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=8.1120005,Y=8.1389999,Z=124.2330017)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0210000
        FadeInEndTime=0.0090000
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=0.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=110.0000000,Max=110.0000000),Y=(Min=110.0000000,Max=110.0000000),Z=(Min=110.0000000,Max=110.0000000))
        InitialParticlesPerSecond=838.6220093
        Texture=Texture'FX_TEX.Explosion.explo_particle'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-119.5999985,Max=323.3999939),Y=(Min=-323.2399902,Max=323.2399902),Z=(Min=156.0000000,Max=546.0000000))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
        CullDistance=2000.0000000
        DisableIfCulled=true
    end object
    Emitters[8]=SpriteEmitter310
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter312'
    begin object name="SpriteEmitter312" class=Engine.SpriteEmitter
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
        Acceleration=(X=0.0000000,Y=0.0000000,Z=2070.0019531)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4345410
        FadeInEndTime=0.1042900
        MaxParticles=6
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1040000,Max=0.1040000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=140.0000000,Max=140.0000000),Z=(Min=140.0000000,Max=140.0000000))
        InitialParticlesPerSecond=29527.6777344
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.7381650,Max=1.7381650)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-1270.8800049,Max=1270.8800049),Y=(Min=-1270.8800049,Max=1270.8800049),Z=(Min=-1347.8399658,Max=1027.0400391))
        VelocityLossRange=(X=(Min=5.9055362,Max=11.8110723),Y=(Min=5.9055362,Max=11.8110723),Z=(Min=5.9055362,Max=11.8110723))
        RotateVelocityLossRange=true
    end object
    Emitters[9]=SpriteEmitter312
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter313'
    begin object name="SpriteEmitter313" class=Engine.SpriteEmitter
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
        FadeOutStartTime=6.1333332
        FadeInEndTime=0.6666670
        MaxParticles=1
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0300000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=1111111040.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke04'
        LifetimeRange=(Min=10.0000000,Max=13.3333330)
        InitialDelayRange=(Min=0.6000000,Max=0.6000000)
        StartVelocityRange=(X=(Min=-29.6599998,Max=29.6599998),Y=(Min=-29.6599998,Max=29.6599998),Z=(Min=-10.8599997,Max=60.8600006))
        VelocityLossRange=(X=(Min=0.0540000,Max=0.1080000),Y=(Min=0.0540000,Max=0.1080000),Z=(Min=0.0540000,Max=0.1080000))
        RotateVelocityLossRange=true
        CullDistance=2000.0000000
        DisableIfCulled=true
    end object
    Emitters[10]=SpriteEmitter313
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_metal.SpriteEmitter314'
    begin object name="SpriteEmitter314" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-2152.3200684)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2254900
        FadeInEndTime=0.1078430
        MaxParticles=15
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=5.0000000,Max=5.0000000))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1546.1180420,Max=1546.1180420),Y=(Min=-1546.1180420,Max=1546.1180420),Z=(Min=107.7860031,Max=2107.7858887))
        GetVelocityDirectionFrom=3
    end object
    Emitters[11]=SpriteEmitter314
    AutoDestroy=true
    LightType=10
    LightEffect=21
    LightHue=30
    LightSaturation=150
    LightBrightness=1000.0000000
    LightRadius=20.0000000
    LightPeriod=3
    LightCone=128
    bNoDelete=false
    bDynamicLight=true
    bAlwaysRelevant=true
}