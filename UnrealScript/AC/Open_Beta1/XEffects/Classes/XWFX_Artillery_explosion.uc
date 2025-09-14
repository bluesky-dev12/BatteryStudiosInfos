class XWFX_Artillery_explosion extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter118'
    begin object name="SpriteEmitter118" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-2725.0085449)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4822530
        MaxParticles=4
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=350.0000000,Max=350.0000000),Y=(Min=350.0000000,Max=350.0000000),Z=(Min=350.0000000,Max=350.0000000))
        InitialParticlesPerSecond=70.1999969
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.dirt_soil_bt'
        LifetimeRange=(Min=0.7125000,Max=2.2500000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-400.7999878,Max=400.7999878),Y=(Min=-400.7999878,Max=400.7999878),Z=(Min=1244.6719971,Max=2835.0720215))
    end object
    Emitters[0]=SpriteEmitter118
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter119'
    begin object name="SpriteEmitter119" class=Engine.SpriteEmitter
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
        Acceleration=(X=-59.1777878,Y=100.1378021,Z=-94.8293686)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.8680560
        FadeInEndTime=0.2083330
        MaxParticles=4
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=200.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=0.1150000,Max=0.1150000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=280.0000000,Max=280.0000000),Y=(Min=280.0000000,Max=280.0000000),Z=(Min=280.0000000,Max=280.0000000))
        InitialParticlesPerSecond=5529.6000977
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=3.4722221,Max=3.4722221)
        InitialDelayRange=(Min=0.0000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-482.4576111,Max=482.4576111),Y=(Min=-482.4576111,Max=482.4576111),Z=(Min=-155.9552002,Max=2024.7552490))
        VelocityLossRange=(X=(Min=1.1059200,Max=2.2118399),Y=(Min=1.1059200,Max=2.2118399),Z=(Min=1.1059200,Max=2.2118399))
        RotateVelocityLossRange=true
    end object
    Emitters[1]=SpriteEmitter119
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter306'
    begin object name="SpriteEmitter306" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=68.1312027,Y=68.1312027,Z=-3002.8056641)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.4000000,Max=0.5000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4250000
        FadeInEndTime=0.1625000
        MaxParticles=15
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-5.6469998,Max=5.6469998),Y=(Min=-2.0644240,Max=2.0644240),Z=(Min=-2.0644240,Max=2.0644240))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=20.0000000),Z=(Min=10.0000000,Max=20.0000000))
        InitialParticlesPerSecond=1032.2130127
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.Concrete_Debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=1.2500000,Max=1.2500000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1756.6660156,Max=1717.7769775),Y=(Min=-1756.6660156,Max=1717.7769775),Z=(Min=947.0640259,Max=3247.0639648))
    end object
    Emitters[2]=SpriteEmitter306
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter307'
    begin object name="SpriteEmitter307" class=Engine.SpriteEmitter
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
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=30.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
        InitialParticlesPerSecond=838.6220093
        Texture=Texture'FX_TEX.Explosion.explo_particle'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-119.5999985,Max=323.3999939),Y=(Min=-323.2399902,Max=323.2399902),Z=(Min=156.0000000,Max=546.0000000))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[3]=SpriteEmitter307
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter308'
    begin object name="SpriteEmitter308" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-35.0340004)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        Opacity=0.8300000
        FadeOutStartTime=0.2422620
        FadeInEndTime=0.0745420
        MaxParticles=3
        StartLocationRange=(X=(Min=-112.0000000,Max=112.0000000),Y=(Min=-117.5999985,Max=117.5999985),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=130.0000000,Max=130.0000000),Y=(Min=1550.0000000,Max=1550.0000000),Z=(Min=130.0000000,Max=130.0000000))
        InitialParticlesPerSecond=1675.5610352
        DrawStyle=1
        Texture=Texture'FX_TEX.Explosion.explo_smokline'
        TextureUSubdivisions=4
        TextureVSubdivisions=1
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.6311001,Max=1.6311001)
        InitialDelayRange=(Min=0.4000000,Max=0.4000000)
        StartVelocityRange=(X=(Min=-322.0008240,Max=322.0008240),Y=(Min=-322.0008240,Max=322.0008240),Z=(Min=177.8471985,Max=768.7536011))
    end object
    Emitters[4]=SpriteEmitter308
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter309'
    begin object name="SpriteEmitter309" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-108.2672653)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        Opacity=0.8600000
        FadeOutStartTime=0.4464290
        FadeInEndTime=0.1339290
        MaxParticles=5
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=-10.0000000,Max=80.0000000))
        StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=1000.0000000,Max=1000.0000000),Z=(Min=400.0000000,Max=400.0000000))
        InitialParticlesPerSecond=10934.3447266
        DrawStyle=1
        Texture=Texture'FX_TEX.Explosion.explo_dirt_01'
        TextureUSubdivisions=2
        TextureVSubdivisions=1
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.5089290,Max=1.4880950)
        InitialDelayRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-754.4000244,Max=754.4000244),Y=(Min=-754.4000244,Max=754.4000244),Z=(Min=806.4000244,Max=806.4000244))
    end object
    Emitters[5]=SpriteEmitter309
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter310'
    begin object name="SpriteEmitter310" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=30.0000000,Y=30.1000004,Z=189.6179962)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1148220
        MaxParticles=1
        StartLocationOffset=(X=30.0000000,Y=30.0000000,Z=200.0000000)
        StartLocationShape=1
        SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=2612.7360840
        Texture=Texture'FX_TEX.Explosion.explo_sm_a'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.4000000,Max=0.4000000)
        StartVelocityRange=(X=(Min=-230.0000000,Max=220.0000000),Y=(Min=-237.0000000,Max=237.0000000),Z=(Min=-230.0000000,Max=850.0000000))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=57.4179993)
    end object
    Emitters[6]=SpriteEmitter310
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter311'
    begin object name="SpriteEmitter311" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0545210
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=200.0000000)
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=0.1750000,Max=0.1750000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=11820.4208984
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=0.8547010,Max=0.8547010)
    end object
    Emitters[7]=SpriteEmitter311
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter312'
    begin object name="SpriteEmitter312" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0637900
        MaxParticles=1
        StartLocationOffset=(X=180.0000000,Y=-180.0000000,Z=200.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=10102.9248047
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        InitialDelayRange=(Min=0.3000000,Max=0.3000000)
    end object
    Emitters[8]=SpriteEmitter312
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter313'
    begin object name="SpriteEmitter313" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=-225.3104706,Y=225.3104706,Z=-332.8059082)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.9075580
        MaxParticles=4
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=60.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=0.1730000,Max=0.1730000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=8294.4003906
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.8663189,Max=2.8935189)
        InitialDelayRange=(Min=0.0000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-378.0859985,Max=378.0859985),Y=(Min=-378.0859985,Max=378.0859985),Z=(Min=-272.3330078,Max=4246.7329102))
        VelocityLossRange=(X=(Min=1.6588800,Max=3.3177600),Y=(Min=1.6588800,Max=3.3177600),Z=(Min=1.6588800,Max=3.3177600))
        RotateVelocityLossRange=true
    end object
    Emitters[9]=SpriteEmitter313
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter314'
    begin object name="SpriteEmitter314" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=-144.1987152,Y=144.1987152,Z=977.4079590)
        ColorScale=/* Array type was not detected. */
        Opacity=0.8000000
        FadeOutStartTime=1.3836811
        MaxParticles=4
        StartLocationOffset=(X=30.0000000,Y=-30.0000000,Z=110.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=0.1380000,Max=0.1380000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=220.0000000,Max=220.0000000),Y=(Min=220.0000000,Max=220.0000000),Z=(Min=220.0000000,Max=220.0000000))
        InitialParticlesPerSecond=6635.5209961
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.8935189,Max=3.6168990)
        InitialDelayRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-717.1891479,Max=717.1891479),Y=(Min=-717.1891479,Max=717.1891479),Z=(Min=-217.8662567,Max=1876.7464600))
        VelocityLossRange=(X=(Min=1.3271040,Max=2.6542079),Y=(Min=1.3271040,Max=2.6542079),Z=(Min=1.3271040,Max=2.6542079))
        RotateVelocityLossRange=true
    end object
    Emitters[10]=SpriteEmitter314
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter315'
    begin object name="SpriteEmitter315" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=5.2919998,Y=5.3096399,Z=33.4486122)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2733860
        MaxParticles=1
        StartLocationOffset=(X=30.0000000,Y=30.0000000,Z=200.0000000)
        StartLocationShape=1
        SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=1097.3489990
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.2761910,Max=1.2761910)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-96.6000061,Max=92.4000015),Y=(Min=-99.5400009,Max=99.5400009),Z=(Min=-96.6000061,Max=357.0000000))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=24.1155605)
    end object
    Emitters[11]=SpriteEmitter315
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Artillery_explosion.SpriteEmitter316'
    begin object name="SpriteEmitter316" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-2952.3200684)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2254900
        FadeInEndTime=0.1078430
        MaxParticles=20
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=12.0000000,Max=12.0000000))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-2246.1179199,Max=2246.1179199),Y=(Min=-2246.1179199,Max=2246.1179199),Z=(Min=200.6000061,Max=2907.7858887))
        GetVelocityDirectionFrom=3
    end object
    Emitters[12]=SpriteEmitter316
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