class XWFX_Stun_explosion extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Stun_explosion.SpriteEmitter239'
    begin object name="SpriteEmitter239" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=1.0000000,Z=7.5809999)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5900000
        FadeOutStartTime=1.2000000
        FadeInEndTime=0.2400000
        MaxParticles=2
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-20.0000000,Max=20.0000000))
        AlphaRef=4
        SpinCCWorCW=(X=1.0000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=0.5000000
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke04'
        LifetimeRange=(Min=6.0000000,Max=6.0000000)
        StartVelocityRange=(X=(Min=-16.1000004,Max=16.1000004),Y=(Min=-16.1000004,Max=16.1000004),Z=(Min=18.1000004,Max=18.1000004))
        VelocityLossRange=(X=(Min=0.0900000,Max=0.1800000),Y=(Min=0.0900000,Max=0.1800000),Z=(Min=0.0900000,Max=0.1800000))
        RotateVelocityLossRange=true
    end object
    Emitters[0]=SpriteEmitter239
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Stun_explosion.SpriteEmitter240'
    begin object name="SpriteEmitter240" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.4500000
        FadeOutStartTime=0.6188890
        MaxParticles=8
        StartLocationOffset=(X=10.0000000,Y=-10.0000000,Z=10.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0790000,Max=0.0790000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
        InitialParticlesPerSecond=7603.2001953
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=3.5000000,Max=3.5000000)
        InitialDelayRange=(Min=0.0600000,Max=0.0600000)
        StartVelocityRange=(X=(Min=-457.4526367,Max=457.4526367),Y=(Min=-457.4526367,Max=457.4526367),Z=(Min=-46.3320007,Max=46.3320007))
        VelocityLossRange=(X=(Min=1.5206400,Max=3.0412800),Y=(Min=1.5206400,Max=3.0412800),Z=(Min=1.5206400,Max=3.0412800))
        RotateVelocityLossRange=true
    end object
    Emitters[1]=SpriteEmitter240
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Stun_explosion.SpriteEmitter241'
    begin object name="SpriteEmitter241" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=-16.2637653,Y=16.2637653,Z=-25.7028313)
        ColorScale=/* Array type was not detected. */
        Opacity=0.4500000
        FadeOutStartTime=0.6188890
        MaxParticles=5
        StartLocationOffset=(X=10.0000000,Y=-10.0000000,Z=30.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.6100000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0790000,Max=0.0790000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
        InitialParticlesPerSecond=7603.2001953
        DrawStyle=6
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=3.5000000,Max=3.5000000)
        InitialDelayRange=(Min=0.0900000,Max=0.0900000)
        StartVelocityRange=(X=(Min=-178.6026001,Max=178.6026001),Y=(Min=-178.6026001,Max=178.6026001),Z=(Min=-205.2270203,Max=572.1870117))
        VelocityLossRange=(X=(Min=1.5206400,Max=3.0412800),Y=(Min=1.5206400,Max=3.0412800),Z=(Min=1.5206400,Max=3.0412800))
        RotateVelocityLossRange=true
    end object
    Emitters[2]=SpriteEmitter241
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Stun_explosion.SpriteEmitter244'
    begin object name="SpriteEmitter244" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=16.8750000,Y=16.9312515,Z=106.6601257)
        ColorScale=/* Array type was not detected. */
        Opacity=0.7500000
        FadeOutStartTime=0.0880000
        MaxParticles=1
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
        InitialParticlesPerSecond=1959.5520020
        Texture=Texture'FX_TEX.Explosion.explo_trans_ani02'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-172.5000000,Max=165.0000000),Y=(Min=-177.7500000,Max=177.7500000),Z=(Min=-172.5000000,Max=637.5000000))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=43.0634995)
    end object
    Emitters[3]=SpriteEmitter244
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Stun_explosion.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-2050.0878906)
        DampingFactorRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
        ColorScale=/* Array type was not detected. */
        SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
        InitialParticlesPerSecond=99073.2578125
        Texture=Texture'FX_TEX.Flares.Laser_Flare_s'
        LifetimeRange=(Min=0.7000000,Max=0.7000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1789.0600586,Max=1789.0600586),Y=(Min=-1789.0600586,Max=1789.0600586),Z=(Min=-100.3759995,Max=1800.3759766))
        CullDistance=2000.0000000
        DisableIfCulled=true
    end object
    Emitters[4]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Stun_explosion.SpriteEmitter3'
    begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
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
        MaxParticles=5
        StartLocationOffset=(X=-10.0000000,Y=-10.0000000,Z=-40.0000000)
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        StartLocationPolarRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=180.0000000,Max=180.0000000),Z=(Min=5.0000000,Max=5.0000000))
        InitialParticlesPerSecond=24001.9199219
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flank_bullet'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.1152780,Max=0.2777780)
        StartVelocityRange=(X=(Min=-2433.5998535,Max=2433.5998535),Y=(Min=-2433.5998535,Max=2433.5998535),Z=(Min=720.0000000,Max=720.0000000))
        CullDistance=2000.0000000
        DisableIfCulled=true
    end object
    Emitters[5]=SpriteEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Stun_explosion.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=41.9597397,Y=42.0996094,Z=125.3449249)
        ColorScale=/* Array type was not detected. */
        MaxParticles=1
        StartLocationRange=(X=(Min=-24.0000000,Max=24.0000000),Y=(Min=-24.0000000,Max=24.0000000),Z=(Min=-24.0000000,Max=24.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1590000,Max=0.1590000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=130.0000000,Max=130.0000000),Y=(Min=130.0000000,Max=130.0000000),Z=(Min=130.0000000,Max=130.0000000))
        InitialParticlesPerSecond=1741.1190186
        Texture=Texture'FX_TEX.Explosion.explo_sm_a'
        LifetimeRange=(Min=0.3130770,Max=0.3130770)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-297.9712219,Max=285.0158997),Y=(Min=-307.0398865,Max=307.0398865),Z=(Min=114.6042862,Max=114.6042862))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[6]=SpriteEmitter4
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Stun_explosion.SpriteEmitter5'
    begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=10.5455999,Y=10.5806999,Z=161.5028992)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0210000
        FadeInEndTime=0.0090000
        MaxParticles=1
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=52.0000000,Max=52.0000000),Y=(Min=52.0000000,Max=52.0000000),Z=(Min=52.0000000,Max=52.0000000))
        InitialParticlesPerSecond=838.6220093
        Texture=Texture'FX_TEX.Explosion.explo_particle'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-155.4799957,Max=420.4199829),Y=(Min=-420.2119751,Max=420.2119751),Z=(Min=202.7999878,Max=709.7999878))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[7]=SpriteEmitter5
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Stun_explosion.SpriteEmitter6'
    begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-32.1749992)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        Opacity=0.8500000
        FadeOutStartTime=0.1200000
        FadeInEndTime=0.0666670
        MaxParticles=5
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=-180.0000000,Max=180.0000000))
        StartSizeRange=(X=(Min=55.0000000,Max=55.0000000),Y=(Min=350.0000000,Max=350.0000000),Z=(Min=55.0000000,Max=55.0000000))
        InitialParticlesPerSecond=1463.6700439
        Texture=Texture'FX_TEX.Explosion.explo_particle'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.3333330,Max=1.3333330)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-991.2499390,Max=991.2499390),Y=(Min=-991.2499390,Max=991.2499390),Z=(Min=224.2499847,Max=471.2499695))
        CullDistance=2000.0000000
        DisableIfCulled=true
    end object
    Emitters[8]=SpriteEmitter6
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