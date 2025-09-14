class XWFX_SD_Bomb_explosion extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter62'
    begin object name="SpriteEmitter62" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-63.0612068)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        Opacity=0.5700000
        FadeOutStartTime=0.2422620
        FadeInEndTime=0.0745420
        MaxParticles=5
        StartLocationRange=(X=(Min=-201.6000061,Max=201.6000061),Y=(Min=-211.6800079,Max=211.6800079),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=396.0000305,Max=396.0000305),Y=(Min=4050.0002441,Max=4050.0002441),Z=(Min=396.0000305,Max=396.0000305))
        InitialParticlesPerSecond=1675.5610352
        DrawStyle=1
        Texture=Texture'FX_TEX.Explosion.explo_smokline'
        TextureUSubdivisions=4
        TextureVSubdivisions=1
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.6311001,Max=1.6311001)
        InitialDelayRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-579.6015015,Max=579.6015015),Y=(Min=-579.6015015,Max=579.6015015),Z=(Min=320.1250000,Max=1383.7564697))
    end object
    Emitters[0]=SpriteEmitter62
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter64'
    begin object name="SpriteEmitter64" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=-677.5366821,Y=677.5366821,Z=-1000.7889404)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.9185190
        MaxParticles=15
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=60.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1350000,Max=0.1350000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=495.0000000,Max=495.0000000),Y=(Min=495.0000000,Max=495.0000000),Z=(Min=495.0000000,Max=495.0000000))
        InitialParticlesPerSecond=11197.4404297
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_no'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.9629631,Max=2.9629631)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-3737.9370117,Max=3737.9370117),Y=(Min=-3737.9370117,Max=3737.9370117),Z=(Min=-606.6217651,Max=11687.0976562))
        VelocityLossRange=(X=(Min=2.2394879,Max=4.4789758),Y=(Min=2.2394879,Max=4.4789758),Z=(Min=2.2394879,Max=4.4789758))
        RotateVelocityLossRange=true
    end object
    Emitters[1]=SpriteEmitter64
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter65'
    begin object name="SpriteEmitter65" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=-473.0448303,Y=473.0448303,Z=-581.9869385)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.8000000
        MaxParticles=8
        StartLocationOffset=(X=30.0000000,Y=-30.0000000,Z=110.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1350000,Max=0.1350000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=450.0000305,Max=450.0000305),Y=(Min=450.0000305,Max=450.0000305),Z=(Min=450.0000305,Max=450.0000305))
        InitialParticlesPerSecond=8957.9531250
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_no'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.9629631,Max=2.9629631)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-2066.7700195,Max=2066.7700195),Y=(Min=-2066.7700195,Max=2066.7700195),Z=(Min=-2959.4143066,Max=7962.4926758))
        VelocityLossRange=(X=(Min=1.7915900,Max=3.5831800),Y=(Min=1.7915900,Max=3.5831800),Z=(Min=1.7915900,Max=3.5831800))
        RotateVelocityLossRange=true
    end object
    Emitters[2]=SpriteEmitter65
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter66'
    begin object name="SpriteEmitter66" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=-952.7922363,Y=947.3319702,Z=-953.1334229)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.9699190
        MaxParticles=15
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=19.5000000))
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0540000,Max=0.0540000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0400000,Max=0.0400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=780.0000000,Max=780.0000000),Y=(Min=780.0000000,Max=780.0000000),Z=(Min=780.0000000,Max=780.0000000))
        InitialParticlesPerSecond=19399.5664062
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_main_smoke_no'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=2.9629631,Max=2.9629631)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-10281.8642578,Max=10281.8642578),Y=(Min=-10281.8642578,Max=10281.8642578),Z=(Min=-1295.2795410,Max=2277.8547363))
        VelocityLossRange=(X=(Min=3.8799140,Max=7.7598271),Y=(Min=3.8799140,Max=7.7598271),Z=(Min=3.8799140,Max=7.7598271))
        RotateVelocityLossRange=true
    end object
    Emitters[3]=SpriteEmitter66
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter77'
    begin object name="SpriteEmitter77" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=8.3587141,Y=8.3865747,Z=52.8320770)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3037620
        MaxParticles=1
        StartLocationOffset=(X=30.0000000,Y=30.0000000,Z=200.0000000)
        StartLocationShape=1
        SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=780.0000000,Max=780.0000000),Y=(Min=780.0000000,Max=780.0000000),Z=(Min=780.0000000,Max=780.0000000))
        InitialParticlesPerSecond=987.6140137
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.4179900,Max=1.4179900)
        StartVelocityRange=(X=(Min=-169.5330048,Max=162.1619873),Y=(Min=-174.6926880,Max=174.6926880),Z=(Min=-169.5330048,Max=626.5349731))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=21.7040043)
    end object
    Emitters[4]=SpriteEmitter77
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter78'
    begin object name="SpriteEmitter78" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.3380360
        FadeInEndTime=0.0514400
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=700.0000000)
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.1620000,Max=0.1620000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=760.5000000,Max=760.5000000),Y=(Min=760.5000000,Max=760.5000000),Z=(Min=760.5000000,Max=760.5000000))
        InitialParticlesPerSecond=13748.0605469
        Texture=Texture'FX_TEX.Explosion.explo_ani02'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.2345680,Max=1.2345680)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1371.0059814))
    end object
    Emitters[5]=SpriteEmitter78
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter79'
    begin object name="SpriteEmitter79" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.3380360
        FadeInEndTime=0.0514400
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=200.0000000)
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.1620000,Max=0.1620000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=780.0000000,Max=780.0000000),Y=(Min=780.0000000,Max=780.0000000),Z=(Min=780.0000000,Max=780.0000000))
        InitialParticlesPerSecond=13748.0605469
        Texture=Texture'FX_TEX.Explosion.explo_ani02'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.2345680,Max=1.2345680)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1371.0059814))
    end object
    Emitters[6]=SpriteEmitter79
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter80'
    begin object name="SpriteEmitter80" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=98.1086502,Y=98.1086502,Z=-4180.0410156)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.4000000,Max=0.5000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.4250000
        FadeInEndTime=0.1625000
        MaxParticles=20
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-5.6469998,Max=5.6469998),Y=(Min=-2.0644240,Max=2.0644240),Z=(Min=-2.0644240,Max=2.0644240))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=11.5200005,Max=72.0000076),Y=(Min=11.5200005,Max=72.0000076),Z=(Min=11.5200005,Max=72.0000076))
        InitialParticlesPerSecond=1032.2130127
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.Concrete_Debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=1.7000000,Max=1.7000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-2529.5991211,Max=2473.5991211),Y=(Min=-2529.5991211,Max=2473.5991211),Z=(Min=1363.7723389,Max=4675.7724609))
    end object
    Emitters[7]=SpriteEmitter80
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter81'
    begin object name="SpriteEmitter81" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=15.8184013,Y=15.8710489,Z=242.2543488)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0210000
        FadeInEndTime=0.0090000
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=30.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=390.0000000,Max=390.0000000),Y=(Min=390.0000000,Max=390.0000000),Z=(Min=390.0000000,Max=390.0000000))
        InitialParticlesPerSecond=838.6220093
        Texture=Texture'FX_TEX.Explosion.explo_particle'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-233.2199860,Max=630.6299438),Y=(Min=-630.3179321,Max=630.3179321),Z=(Min=304.1999817,Max=1064.6999512))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[8]=SpriteEmitter81
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter82'
    begin object name="SpriteEmitter82" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.3380360
        FadeInEndTime=0.0514400
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=300.0000000)
        StartLocationShape=1
        SpinsPerSecondRange=(X=(Min=-0.1620000,Max=0.1620000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=760.5000000,Max=760.5000000),Y=(Min=760.5000000,Max=760.5000000),Z=(Min=760.5000000,Max=760.5000000))
        InitialParticlesPerSecond=13748.0605469
        Texture=Texture'FX_TEX.Explosion.explo_ani02'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.2345680,Max=1.2345680)
        InitialDelayRange=(Min=0.4000000,Max=0.4000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1371.0059814))
    end object
    Emitters[9]=SpriteEmitter82
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter83'
    begin object name="SpriteEmitter83" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=6.6044149,Y=6.6264310,Z=41.7438660)
        ColorScale=/* Array type was not detected. */
        Opacity=0.6000000
        FadeOutStartTime=0.3417330
        MaxParticles=1
        StartLocationOffset=(X=-290.0000000,Y=10.0000000,Z=200.0000000)
        StartLocationShape=1
        SphereRadiusRange=(Min=10.0000000,Max=20.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=780.0000000,Max=780.0000000),Y=(Min=780.0000000,Max=780.0000000),Z=(Min=780.0000000,Max=780.0000000))
        InitialParticlesPerSecond=877.8790283
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=1.5952390,Max=1.5952390)
        InitialDelayRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-150.6960144,Max=144.1439972),Y=(Min=-155.2823944,Max=155.2823944),Z=(Min=-150.6960144,Max=556.9199829))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=19.2924480)
    end object
    Emitters[10]=SpriteEmitter83
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SD_Bomb_explosion.SpriteEmitter84'
    begin object name="SpriteEmitter84" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-4605.6191406)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2254900
        FadeInEndTime=0.1078430
        MaxParticles=30
        StartLocationRange=(X=(Min=-46.7999992,Max=46.7999992),Y=(Min=-84.2399979,Max=84.2399979),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=28.0799999,Max=28.0799999),Y=(Min=124.8000031,Max=124.8000031),Z=(Min=28.0799999,Max=28.0799999))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=3.0000000,Max=3.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-3503.9438477,Max=3503.9438477),Y=(Min=-3503.9438477,Max=3503.9438477),Z=(Min=312.9360046,Max=4536.1459961))
        GetVelocityDirectionFrom=3
    end object
    Emitters[11]=SpriteEmitter84
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