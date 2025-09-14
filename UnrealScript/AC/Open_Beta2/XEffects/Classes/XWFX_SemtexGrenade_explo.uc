class XWFX_SemtexGrenade_explo extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SemtexGrenade_explo.SpriteEmitter188'
    begin object name="SpriteEmitter188" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        Opacity=0.9000000
        FadeOutStartTime=0.4045950
        FadeInEndTime=0.0749250
        CoordinateSystem=1
        MaxParticles=5
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        InitialParticlesPerSecond=1989.4680176
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.dirt_soil_bt'
        LifetimeRange=(Min=0.5333330,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-204.3105011,Max=204.3105011),Y=(Min=-204.3105011,Max=204.3105011),Z=(Min=-204.3105011,Max=204.3105011))
    end object
    Emitters[0]=SpriteEmitter188
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SemtexGrenade_explo.SpriteEmitter189'
    begin object name="SpriteEmitter189" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0742190
        FadeInEndTime=0.0039060
        CoordinateSystem=1
        MaxParticles=15
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-3.9150000,Max=3.9150000),Y=(Min=-3.3030779,Max=3.3030779),Z=(Min=-3.3030779,Max=3.3030779))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=6.0000000,Max=15.0000000),Y=(Min=6.0000000,Max=15.0000000),Z=(Min=6.0000000,Max=15.0000000))
        InitialParticlesPerSecond=426611.5625000
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.Concrete_Debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=0.8000000,Max=0.8000000)
        InitialDelayRange=(Min=0.0500000,Max=0.0500000)
        StartVelocityRange=(X=(Min=-1308.4428711,Max=1308.4428711),Y=(Min=-1308.4428711,Max=1308.4428711),Z=(Min=-1308.4428711,Max=1308.4428711))
    end object
    Emitters[1]=SpriteEmitter189
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SemtexGrenade_explo.SpriteEmitter190'
    begin object name="SpriteEmitter190" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1866670
        FadeInEndTime=0.0333330
        CoordinateSystem=1
        MaxParticles=15
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=5.0000000,Max=5.0000000))
        InitialParticlesPerSecond=4080018.2500000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.6666670,Max=0.6666670)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1855.3416748,Max=1855.3416748),Y=(Min=-1855.3416748,Max=1855.3416748),Z=(Min=-1855.3416748,Max=1855.3416748))
        GetVelocityDirectionFrom=3
    end object
    Emitters[2]=SpriteEmitter190
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SemtexGrenade_explo.SpriteEmitter191'
    begin object name="SpriteEmitter191" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.8000000
        FadeOutStartTime=0.7473960
        FadeInEndTime=0.2847220
        CoordinateSystem=1
        MaxParticles=20
        StartLocationRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        AlphaRef=4
        SpinCCWorCW=(X=0.5000000,Y=7.0000000,Z=7.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1160000,Max=0.1160000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
        InitialParticlesPerSecond=21173.7617188
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_big01'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=1.2400171,Max=1.7795140)
        InitialDelayRange=(Min=0.3000000,Max=0.3000000)
        StartVelocityRange=(X=(Min=-701.6409912,Max=801.6409912),Y=(Min=-701.6409912,Max=801.6409912),Z=(Min=-701.6409912,Max=801.6409912))
        VelocityLossRange=(X=(Min=2.3224320,Max=4.6448641),Y=(Min=2.3224320,Max=4.6448641),Z=(Min=2.3224320,Max=4.6448641))
        RotateVelocityLossRange=true
    end object
    Emitters[3]=SpriteEmitter191
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SemtexGrenade_explo.SpriteEmitter192'
    begin object name="SpriteEmitter192" class=Engine.SpriteEmitter
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
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        FadeOutStartTime=0.7654670
        FadeInEndTime=0.1815030
        CoordinateSystem=1
        MaxParticles=20
        StartLocationPolarRange=(X=(Min=-180.0000000,Max=180.0000000),Y=(Min=-180.0000000,Max=180.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=80.0000000,Max=80.0000000))
        InitialParticlesPerSecond=2396.0520020
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_big01'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=0.7891410,Max=0.7891410)
        InitialDelayRange=(Min=0.0500000,Max=0.0500000)
        StartVelocityRange=(X=(Min=-454.3210144,Max=454.3210144),Y=(Min=-454.3210144,Max=454.3210144),Z=(Min=-454.3210144,Max=454.3210144))
    end object
    Emitters[4]=SpriteEmitter192
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SemtexGrenade_explo.SpriteEmitter193'
    begin object name="SpriteEmitter193" class=Engine.SpriteEmitter
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
        CoordinateSystem=1
        MaxParticles=3
        SpinsPerSecondRange=(X=(Min=-0.1460000,Max=0.1460000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=1607.1870117
        Texture=Texture'FX_TEX.Explosion.explo_ani01'
        TextureUSubdivisions=8
        TextureVSubdivisions=8
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[5]=SpriteEmitter193
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SemtexGrenade_explo.SpriteEmitter194'
    begin object name="SpriteEmitter194" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.1753850
        FadeInEndTime=0.0253850
        CoordinateSystem=1
        MaxParticles=3
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=0.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=110.0000000,Max=110.0000000),Y=(Min=110.0000000,Max=110.0000000),Z=(Min=110.0000000,Max=110.0000000))
        InitialParticlesPerSecond=1147.9909668
        Texture=Texture'FX_TEX.Explosion.explo_ani02'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=0.4000000,Max=0.4000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[6]=SpriteEmitter194
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_SemtexGrenade_explo.SpriteEmitter195'
    begin object name="SpriteEmitter195" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1169230
        FadeInEndTime=0.0169230
        CoordinateSystem=1
        MaxParticles=3
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=0.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=110.0000000,Max=110.0000000),Y=(Min=110.0000000,Max=110.0000000),Z=(Min=110.0000000,Max=110.0000000))
        InitialParticlesPerSecond=1721.9859619
        Texture=Texture'FX_TEX.Explosion.explo_frame_02'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[7]=SpriteEmitter195
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