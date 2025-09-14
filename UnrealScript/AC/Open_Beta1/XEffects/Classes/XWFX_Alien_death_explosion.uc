class XWFX_Alien_death_explosion extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_death_explosion.SpriteEmitter125'
    begin object name="SpriteEmitter125" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-2746.6298828)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.4000000,Max=0.5000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0746540
        FadeInEndTime=0.0159970
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-2.2000000,Max=2.2000000),Y=(Min=-14.5178204,Max=14.5178204),Z=(Min=-14.5178204,Max=14.5178204))
        StartSpinRange=(X=(Min=-0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=2.0000000,Max=10.0000000),Y=(Min=2.0000000,Max=10.0000000),Z=(Min=2.0000000,Max=10.0000000))
        InitialParticlesPerSecond=7258.9218750
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_04'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.7000000,Max=0.7000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-840.0000000,Max=840.0000000),Y=(Min=-840.0000000,Max=840.0000000),Z=(Min=144.5659943,Max=1613.6939697))
    end object
    Emitters[0]=SpriteEmitter125
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_death_explosion.SpriteEmitter126'
    begin object name="SpriteEmitter126" class=Engine.SpriteEmitter
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
    Emitters[1]=SpriteEmitter126
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_death_explosion.SpriteEmitter0'
    begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0266670
        FadeInEndTime=0.0016670
        MaxParticles=2
        SpinsPerSecondRange=(X=(Min=0.2400000,Max=0.2400000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.2000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=78.0000000,Max=78.0000000),Y=(Min=78.0000000,Max=78.0000000),Z=(Min=78.0000000,Max=78.0000000))
        InitialParticlesPerSecond=43200.0000000
        Texture=Texture'FX_TEX.Flares.muzzleflash_light'
        LifetimeRange=(Min=0.1666670,Max=0.1666670)
    end object
    Emitters[2]=SpriteEmitter0
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_death_explosion.SpriteEmitter1'
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
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0140000
        FadeInEndTime=0.0060000
        MaxParticles=2
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        InitialParticlesPerSecond=1257.9329834
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_04_noalpha'
        LifetimeRange=(Min=0.3333330,Max=0.3333330)
    end object
    Emitters[3]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_death_explosion.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2250000
        FadeInEndTime=0.0750000
        CoordinateSystem=1
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=30.0000000)
        SpinsPerSecondRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=280.0000000,Max=280.0000000),Y=(Min=280.0000000,Max=280.0000000),Z=(Min=280.0000000,Max=280.0000000))
        InitialParticlesPerSecond=45899.1093750
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_07'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
    end object
    Emitters[4]=SpriteEmitter2
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_death_explosion.SpriteEmitter3'
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
        FadeOutStartTime=0.1125000
        FadeInEndTime=0.0375000
        CoordinateSystem=1
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=104.0000000,Max=104.0000000),Y=(Min=104.0000000,Max=104.0000000),Z=(Min=104.0000000,Max=104.0000000))
        InitialParticlesPerSecond=91798.2187500
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_05'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.6250000,Max=0.6250000)
    end object
    Emitters[5]=SpriteEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_death_explosion.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=78.0000000,Max=78.0000000),Y=(Min=78.0000000,Max=78.0000000),Z=(Min=78.0000000,Max=78.0000000))
        InitialParticlesPerSecond=1407.3659668
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_05'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.6000000,Max=0.6000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-423.0199890,Max=423.0199890),Y=(Min=-423.0199890,Max=423.0199890),Z=(Min=260.0000000,Max=1300.0000000))
    end object
    Emitters[6]=SpriteEmitter4
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_death_explosion.SpriteEmitter5'
    begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
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
        StartSizeRange=(X=(Min=45.0000000,Max=45.0000000),Y=(Min=45.0000000,Max=45.0000000),Z=(Min=45.0000000,Max=45.0000000))
        InitialParticlesPerSecond=1125.8929443
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_blood.hit_effect_alien_boold_08'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.7500000,Max=0.7500000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-504.3840332,Max=504.3840332),Y=(Min=-504.3840332,Max=504.3840332),Z=(Min=96.0000076,Max=1152.0000000))
    end object
    Emitters[7]=SpriteEmitter5
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