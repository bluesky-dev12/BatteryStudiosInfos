class XWFX_Alien_Nemesis_Special_Flame extends Emitter;

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

simulated event Tick(float DeltaTime)
{
    local int i;

    CheckLifeSpanReplicated();
    // End:0x83
    if((LifeSpan != 0.0000000) && fFadeOutTime != 0.0000000)
    {
        // End:0x83
        if((LifeSpan <= fFadeOutTime) && bChecked == false)
        {
            i = 0;
            J0x4A:

            // End:0x7B [Loop If]
            if(i < Emitters.Length)
            {
                Emitters[i].RespawnDeadParticles = false;
                i++;
                // [Loop Continue]
                goto J0x4A;
            }
            bChecked = true;
        }
    }
    //return;    
}

defaultproperties
{
    // Reference: BeamEmitter'XEffects_Decompressed.XWFX_Alien_Nemesis_Special_Flame.BeamEmitter2'
    begin object name="BeamEmitter2" class=Engine.BeamEmitter
        BeamDistanceRange=(Min=150.0000000,Max=200.0000000)
        DetermineEndPointBy=1
        RotatingSheets=2
        LowFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
        HighFrequencyNoiseRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
        HighFrequencyPoints=8
        FadeOut=true
        FadeIn=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.5300000
        FadeOutStartTime=0.3060000
        FadeInEndTime=0.1620000
        MaxParticles=5
        DetailMode=1
        StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
        UseRotationFrom=1
        StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=5.0000000,Max=5.0000000))
        Texture=Texture'FX_TEX.flame.flamethrower_fire_04'
        LifetimeRange=(Min=0.6000000,Max=0.6000000)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
        StartVelocityRadialRange=(Min=-100.0000000,Max=-100.0000000)
        WarmupTicksPerSecond=2.0000000
        RelativeWarmupTime=2.0000000
    end object
    Emitters[0]=BeamEmitter2
    // Reference: BeamEmitter'XEffects_Decompressed.XWFX_Alien_Nemesis_Special_Flame.BeamEmitter3'
    begin object name="BeamEmitter3" class=Engine.BeamEmitter
        BeamDistanceRange=(Min=150.0000000,Max=200.0000000)
        DetermineEndPointBy=1
        RotatingSheets=2
        LowFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
        HighFrequencyNoiseRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
        HighFrequencyPoints=8
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        ColorScale=/* Array type was not detected. */
        Opacity=0.5000000
        FadeOutStartTime=0.3060000
        FadeInEndTime=0.1620000
        MaxParticles=5
        DetailMode=1
        StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
        UseRotationFrom=1
        StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=5.0000000,Max=5.0000000))
        Texture=Texture'FX_TEX.flame.flamethrower_fire_04'
        LifetimeRange=(Min=0.6000000,Max=0.6000000)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
        StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-400.0000000,Max=400.0000000),Z=(Min=-400.0000000,Max=400.0000000))
        StartVelocityRadialRange=(Min=-100.0000000,Max=-100.0000000)
        WarmupTicksPerSecond=2.0000000
        RelativeWarmupTime=2.0000000
    end object
    Emitters[1]=BeamEmitter3
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Nemesis_Special_Flame.SpriteEmitter4'
    begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=1427.6738281)
        ColorScale=/* Array type was not detected. */
        Opacity=0.7100000
        FadeOutStartTime=1.1160710
        FadeInEndTime=0.4712300
        CoordinateSystem=1
        MaxParticles=5
        DetailMode=1
        StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SpinsPerSecondRange=(X=(Min=-0.1080000,Max=0.1080000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
        InitialParticlesPerSecond=250.4174652
        Texture=Texture'FX_TEX.Smoke.smoke04_noalpha'
        LifetimeRange=(Min=2.4801581,Max=2.4801581)
        StartVelocityRange=(X=(Min=-124.7999954,Max=124.7999954),Y=(Min=-124.7999954,Max=124.7999954),Z=(Min=582.0000000,Max=582.0000000))
        MaxAbsVelocity=(X=4.6655998,Y=1.0000000,Z=2.1600001)
    end object
    Emitters[2]=SpriteEmitter4
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Alien_Nemesis_Special_Flame.SpriteEmitter5'
    begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=21.0853119,Y=0.0000000,Z=0.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.2500000
        FadeOutStartTime=0.6984130
        FadeInEndTime=0.1746030
        MaxParticles=5
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-50.0000000,Max=50.0000000))
        SpinsPerSecondRange=(X=(Min=-0.0350000,Max=0.0350000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=634.4049683
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_020_b'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.5873010,Max=1.5873010)
        StartVelocityRange=(X=(Min=-35.0000000,Max=35.0000000),Y=(Min=-35.0000000,Max=35.0000000),Z=(Min=-35.1749992,Max=35.1749992))
    end object
    Emitters[3]=SpriteEmitter5
    AutoDestroy=true
    LightType=10
    LightEffect=21
    LightHue=30
    LightSaturation=150
    LightBrightness=400.0000000
    LightRadius=16.0000000
    LightPeriod=3
    LightCone=128
    bNoDelete=false
    bAlwaysRelevant=true
    LifeSpan=1.0000000
}