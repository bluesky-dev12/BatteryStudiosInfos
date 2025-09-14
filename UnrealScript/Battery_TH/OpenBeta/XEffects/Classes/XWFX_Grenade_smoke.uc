class XWFX_Grenade_smoke extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter226'
    begin object name="SpriteEmitter226" class=Engine.SpriteEmitter
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
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=0.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=981.1879883
        Texture=Texture'FX_TEX.Explosion.exp7_frames'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.5555560,Max=0.5555560)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-139.9319916,Max=133.8479919),Y=(Min=-144.1907959,Max=144.1907959),Z=(Min=53.8199997,Max=53.8199997))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[0]=SpriteEmitter226
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter227'
    begin object name="SpriteEmitter227" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1224.3648682)
        DampingFactorRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
        ColorScale=/* Array type was not detected. */
        SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=7.0000000,Max=7.0000000),Z=(Min=7.0000000,Max=7.0000000))
        InitialParticlesPerSecond=60968.1640625
        Texture=Texture'FX_TEX.Flares.Laser_Flare_s'
        LifetimeRange=(Min=0.8750000,Max=0.8750000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1900.9599609,Max=1900.9599609),Y=(Min=-1900.9599609,Max=1900.9599609),Z=(Min=227.1360168,Max=2215.6159668))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[1]=SpriteEmitter227
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter228'
    begin object name="SpriteEmitter228" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=5.0000000,Max=5.0000000))
        InitialParticlesPerSecond=24001.9199219
        DrawStyle=6
        Texture=Texture'FX_TEX.flame.flank_bullet'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.1152780,Max=0.2777780)
        StartVelocityRange=(X=(Min=-2433.5998535,Max=2433.5998535),Y=(Min=-2433.5998535,Max=2433.5998535),Z=(Min=720.0000000,Max=720.0000000))
        CullDistance=1800.0000000
        DisableIfCulled=true
    end object
    Emitters[2]=SpriteEmitter228
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter229'
    begin object name="SpriteEmitter229" class=Engine.SpriteEmitter
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
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        StartLocationRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1220000,Max=0.1220000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        InitialParticlesPerSecond=1339.3220215
        Texture=Texture'FX_TEX.Explosion.explo_sm_a'
        LifetimeRange=(Min=0.4070000,Max=0.4070000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-191.0071869,Max=182.7024994),Y=(Min=-196.8204346,Max=196.8204346),Z=(Min=73.4642868,Max=73.4642868))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[3]=SpriteEmitter229
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter230'
    begin object name="SpriteEmitter230" class=Engine.SpriteEmitter
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
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=0.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
        InitialParticlesPerSecond=838.6220093
        Texture=Texture'FX_TEX.Explosion.explo_particle'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-119.5999985,Max=323.3999939),Y=(Min=-323.2399902,Max=323.2399902),Z=(Min=156.0000000,Max=546.0000000))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
        CullDistance=18000.0000000
        DisableIfCulled=true
    end object
    Emitters[4]=SpriteEmitter230
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter231'
    begin object name="SpriteEmitter231" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-24.7500000)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        Opacity=0.8500000
        FadeOutStartTime=0.1200000
        FadeInEndTime=0.0666670
        MaxParticles=5
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=-180.0000000,Max=180.0000000))
        StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=500.0000000,Max=500.0000000),Z=(Min=50.0000000,Max=50.0000000))
        InitialParticlesPerSecond=1463.6700439
        Texture=Texture'FX_TEX.Explosion.explo_particle'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.3333330,Max=1.3333330)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-762.5000000,Max=762.5000000),Y=(Min=-762.5000000,Max=762.5000000),Z=(Min=172.5000000,Max=362.5000000))
    end object
    Emitters[5]=SpriteEmitter231
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter232'
    begin object name="SpriteEmitter232" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        RespawnDeadParticles=false
        AlphaTest=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-11.1936407)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=2.5519850
        MaxParticles=5
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
        StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0530000,Max=0.0530000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=6094.0800781
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smke_gren'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=17.0132332,Max=17.0132332)
        InitialDelayRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=-470.8919983,Max=470.8919983),Y=(Min=-470.8919983,Max=470.8919983),Z=(Min=116.5070038,Max=511.6889954))
        VelocityLossRange=(X=(Min=1.2188160,Max=2.4376321),Y=(Min=1.2188160,Max=2.4376321),Z=(Min=1.2188160,Max=2.4376321))
        RotateVelocityLossRange=true
    end object
    Emitters[6]=SpriteEmitter232
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter233'
    begin object name="SpriteEmitter233" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        AlphaTest=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-11.1936407)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=5.6143670
        FadeInEndTime=2.0415881
        MaxParticles=4
        StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0529000,Max=0.0529000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=6094.0800781
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smke_gren'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=17.0132332,Max=17.0132332)
        InitialDelayRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=-349.7319946,Max=349.7319946),Y=(Min=-349.7319946,Max=349.7319946),Z=(Min=528.1069946,Max=934.8889771))
        VelocityLossRange=(X=(Min=1.2188160,Max=2.4376321),Y=(Min=1.2188160,Max=2.4376321),Z=(Min=1.2188160,Max=2.4376321))
        RotateVelocityLossRange=true
    end object
    Emitters[7]=SpriteEmitter233
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter234'
    begin object name="SpriteEmitter234" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        AlphaTest=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-0.2820000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=2.2500000
        FadeInEndTime=0.6136360
        MaxParticles=15
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0440000,Max=0.0440000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=2197.1159668
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=20.4545441,Max=20.4545441)
        InitialDelayRange=(Min=0.7000000,Max=0.7000000)
        StartVelocityRange=(X=(Min=-596.6459961,Max=596.6459961),Y=(Min=-596.6459961,Max=596.6459961),Z=(Min=-4.2350001,Max=83.5049973))
        VelocityLossRange=(X=(Min=1.0137600,Max=2.0275199),Y=(Min=1.0137600,Max=2.0275199),Z=(Min=1.0137600,Max=2.0275199))
        RotateVelocityLossRange=true
    end object
    Emitters[8]=SpriteEmitter234
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter235'
    begin object name="SpriteEmitter235" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        AlphaTest=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-0.9000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=2.2500000
        FadeInEndTime=0.6136360
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-30.0000000)
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0440000,Max=0.0440000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
        InitialParticlesPerSecond=2197.1159668
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=20.4545441,Max=20.4545441)
        InitialDelayRange=(Min=0.7000000,Max=0.7000000)
        StartVelocityRange=(X=(Min=-476.6459961,Max=476.6459961),Y=(Min=-476.6459961,Max=476.6459961),Z=(Min=11.2349997,Max=283.5050049))
        VelocityLossRange=(X=(Min=1.0137600,Max=2.0275199),Y=(Min=1.0137600,Max=2.0275199),Z=(Min=1.0137600,Max=2.0275199))
        RotateVelocityLossRange=true
    end object
    Emitters[9]=SpriteEmitter235
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_smoke.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        AlphaTest=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=30.0000000,Y=0.0000000,Z=80.0000000)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.5700000
        FadeInEndTime=0.0400000
        MaxParticles=15
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1050000,Max=0.1050000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        InitialParticlesPerSecond=20762.7460938
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.explo_sub_smoke_no'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        StartVelocityRange=(X=(Min=609.3049927,Max=609.3049927),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=60.0000000,Max=60.0000000))
        VelocityLossRange=(X=(Min=9.5800304,Max=19.1600609),Y=(Min=9.5800304,Max=19.1600609),Z=(Min=9.5800304,Max=19.1600609))
        RotateVelocityLossRange=true
    end object
    Emitters[10]=SpriteEmitter0
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