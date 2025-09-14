class XWFX_Time_C4_explosion extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter104'
    begin object name="SpriteEmitter104" class=Engine.SpriteEmitter
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
        MaxParticles=2
        DetailMode=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=280.0000000,Max=280.0000000),Y=(Min=280.0000000,Max=280.0000000),Z=(Min=280.0000000,Max=280.0000000))
        InitialParticlesPerSecond=32680.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Explosion.explo_bk_impact'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        VelocityLossRange=(X=(Min=0.3360000,Max=0.6720000),Y=(Min=0.3360000,Max=0.6720000),Z=(Min=0.3360000,Max=0.6720000))
        RotateVelocityLossRange=true
    end object
    Emitters[0]=SpriteEmitter104
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter105'
    begin object name="SpriteEmitter105" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1901.2651367)
        ColorScale=/* Array type was not detected. */
        Opacity=0.9600000
        FadeOutStartTime=0.4673080
        FadeInEndTime=0.0865380
        MaxParticles=6
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=160.0000000,Max=160.0000000),Y=(Min=160.0000000,Max=160.0000000),Z=(Min=160.0000000,Max=160.0000000))
        InitialParticlesPerSecond=1105.2600098
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.dirt_soil_bt'
        LifetimeRange=(Min=0.7692310,Max=1.5384620)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-231.0399933,Max=231.0399933),Y=(Min=-231.0399933,Max=231.0399933),Z=(Min=295.5939941,Max=1475.5939941))
    end object
    Emitters[1]=SpriteEmitter105
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter106'
    begin object name="SpriteEmitter106" class=Engine.SpriteEmitter
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
        Acceleration=(X=-31.1189995,Y=196.2700043,Z=502.1350098)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=1.0410160
        FadeInEndTime=0.2135420
        MaxParticles=9
        StartLocationOffset=(X=40.0000000,Y=-40.0000000,Z=60.0000000)
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=90.0000000,Max=90.0000000))
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0770000,Max=0.0770000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
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
    Emitters[2]=SpriteEmitter106
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter107'
    begin object name="SpriteEmitter107" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=180.0000000,Max=180.0000000),Y=(Min=180.0000000,Max=180.0000000),Z=(Min=180.0000000,Max=180.0000000))
        InitialParticlesPerSecond=16644.8242188
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.2142010,Max=2.2142010)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1862.4639893,Max=1862.4639893),Y=(Min=-1862.4639893,Max=1862.4639893),Z=(Min=-32.0760002,Max=481.1000061))
        VelocityLossRange=(X=(Min=3.3289649,Max=6.6579309),Y=(Min=3.3289649,Max=6.6579309),Z=(Min=3.3289649,Max=6.6579309))
        RotateVelocityLossRange=true
    end object
    Emitters[3]=SpriteEmitter107
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter108'
    begin object name="SpriteEmitter108" class=Engine.SpriteEmitter
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
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=200.0000000)
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
        StartVelocityRange=(X=(Min=-139.9319916,Max=133.8479919),Y=(Min=-144.1907959,Max=144.1907959),Z=(Min=53.8199997,Max=53.8199997))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[4]=SpriteEmitter108
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter109'
    begin object name="SpriteEmitter109" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=780.0000000,Max=780.0000000),Z=(Min=80.0000000,Max=80.0000000))
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
    Emitters[5]=SpriteEmitter109
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter113'
    begin object name="SpriteEmitter113" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=106.4550018,Y=106.4550018,Z=-2691.8840332)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4700000
        FadeInEndTime=0.0100000
        MaxParticles=12
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-3.0590000,Max=3.0590000),Y=(Min=-2.5805299,Max=2.5805299),Z=(Min=-2.5805299,Max=2.5805299))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
        InitialParticlesPerSecond=1290.2659912
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.Concrete_Debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        InitialDelayRange=(Min=0.0500000,Max=0.0500000)
        StartVelocityRange=(X=(Min=-1070.8320312,Max=1022.2210083),Y=(Min=-1070.8320312,Max=1022.2210083),Z=(Min=383.8299866,Max=2183.8300781))
        CullDistance=2000.0000000
        DisableIfCulled=true
    end object
    Emitters[6]=SpriteEmitter113
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter114'
    begin object name="SpriteEmitter114" class=Engine.SpriteEmitter
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
        MaxParticles=8
        StartLocationOffset=(X=-10.0000000,Y=-10.0000000,Z=-40.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        StartLocationPolarRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=70.0000000,Max=70.0000000))
        InitialParticlesPerSecond=24001.9199219
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flank_bullet'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.1152780,Max=0.2777780)
        InitialDelayRange=(Min=0.0500000,Max=0.0500000)
        StartVelocityRange=(X=(Min=-2433.5998535,Max=2433.5998535),Y=(Min=-2433.5998535,Max=2433.5998535),Z=(Min=720.0000000,Max=720.0000000))
        CullDistance=2000.0000000
        DisableIfCulled=true
    end object
    Emitters[7]=SpriteEmitter114
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter115'
    begin object name="SpriteEmitter115" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=20.6902084,Y=20.7591782,Z=61.8071671)
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1220000,Max=0.1220000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=390.0000000,Max=390.0000000),Y=(Min=390.0000000,Max=390.0000000),Z=(Min=390.0000000,Max=390.0000000))
        InitialParticlesPerSecond=1339.3220215
        Texture=Texture'FX_TEX.Explosion.explo_ani02'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.5000000,Max=1.5000000)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-191.0071869,Max=182.7024994),Y=(Min=-196.8204346,Max=196.8204346),Z=(Min=73.4642868,Max=73.4642868))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[8]=SpriteEmitter115
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter122'
    begin object name="SpriteEmitter122" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=140.0000000,Max=140.0000000),Y=(Min=140.0000000,Max=140.0000000),Z=(Min=140.0000000,Max=140.0000000))
        InitialParticlesPerSecond=838.6220093
        Texture=Texture'FX_TEX.Explosion.explo_particle'
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        StartVelocityRange=(X=(Min=-119.5999985,Max=323.3999939),Y=(Min=-323.2399902,Max=323.2399902),Z=(Min=156.0000000,Max=546.0000000))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[9]=SpriteEmitter122
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter124'
    begin object name="SpriteEmitter124" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
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
    Emitters[10]=SpriteEmitter124
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter125'
    begin object name="SpriteEmitter125" class=Engine.SpriteEmitter
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
        MaxParticles=2
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0300000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.2000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=380.0000000,Max=380.0000000),Y=(Min=380.0000000,Max=380.0000000),Z=(Min=380.0000000,Max=380.0000000))
        InitialParticlesPerSecond=1111111040.0000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke04'
        LifetimeRange=(Min=10.0000000,Max=13.3333330)
        InitialDelayRange=(Min=0.6000000,Max=0.6000000)
        StartVelocityRange=(X=(Min=-29.6599998,Max=29.6599998),Y=(Min=-29.6599998,Max=29.6599998),Z=(Min=-10.8599997,Max=60.8600006))
        VelocityLossRange=(X=(Min=0.0540000,Max=0.1080000),Y=(Min=0.0540000,Max=0.1080000),Z=(Min=0.0540000,Max=0.1080000))
        RotateVelocityLossRange=true
    end object
    Emitters[11]=SpriteEmitter125
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Time_C4_explosion.SpriteEmitter127'
    begin object name="SpriteEmitter127" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=8.0000000,Max=8.0000000))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1546.1180420,Max=1546.1180420),Y=(Min=-1546.1180420,Max=1546.1180420),Z=(Min=107.7860031,Max=2107.7858887))
        GetVelocityDirectionFrom=3
        CullDistance=2000.0000000
        DisableIfCulled=true
    end object
    Emitters[12]=SpriteEmitter127
    AutoDestroy=true
    LightType=10
    LightEffect=21
    LightHue=28
    LightSaturation=90
    LightBrightness=255.0000000
    LightRadius=20.0000000
    LightPeriod=32
    LightCone=128
    bNoDelete=false
    bDynamicLight=true
}