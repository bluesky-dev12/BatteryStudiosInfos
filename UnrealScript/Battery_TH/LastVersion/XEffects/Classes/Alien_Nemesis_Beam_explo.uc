class Alien_Nemesis_Beam_explo extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Beam_explo.SpriteEmitter196'
    begin object name="SpriteEmitter196" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1027.2600098)
        ColorScale=/* Array type was not detected. */
        Opacity=0.5000000
        FadeOutStartTime=0.6068930
        FadeInEndTime=0.1123870
        MaxParticles=5
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        InitialParticlesPerSecond=1326.3120117
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_020'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.8000000,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-157.9010010,Max=157.9010010),Y=(Min=-157.9010010,Max=157.9010010),Z=(Min=336.2070007,Max=936.2069702))
    end object
    Emitters[0]=SpriteEmitter196
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Beam_explo.SpriteEmitter197'
    begin object name="SpriteEmitter197" class=Engine.SpriteEmitter
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
        MaxParticles=5
        DetailMode=1
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-3.0590000,Max=3.0590000),Y=(Min=-2.5805299,Max=2.5805299),Z=(Min=-2.5805299,Max=2.5805299))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=6.0000000,Max=15.0000000),Y=(Min=6.0000000,Max=15.0000000),Z=(Min=6.0000000,Max=15.0000000))
        InitialParticlesPerSecond=1290.2659912
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.Concrete_Debris'
        TextureUSubdivisions=2
        TextureVSubdivisions=2
        LifetimeRange=(Min=2.0000000,Max=2.0000000)
        InitialDelayRange=(Min=0.0500000,Max=0.0500000)
        StartVelocityRange=(X=(Min=-1070.8320312,Max=1022.2210083),Y=(Min=-1070.8320312,Max=1022.2210083),Z=(Min=383.8299866,Max=2183.8300781))
    end object
    Emitters[1]=SpriteEmitter197
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Beam_explo.SpriteEmitter198'
    begin object name="SpriteEmitter198" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-2052.3200684)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2254900
        FadeInEndTime=0.1078430
        DetailMode=1
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=5.0000000,Max=5.0000000))
        InitialParticlesPerSecond=3400015.0000000
        Texture=Texture'FX_TEX.Flares.Human_level_up_light_02'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.0000000,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1546.1180420,Max=1546.1180420),Y=(Min=-1546.1180420,Max=1546.1180420),Z=(Min=107.7860031,Max=2107.7858887))
        GetVelocityDirectionFrom=3
    end object
    Emitters[2]=SpriteEmitter198
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Beam_explo.SpriteEmitter219'
    begin object name="SpriteEmitter219" class=Engine.SpriteEmitter
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
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=100.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1460000,Max=0.1460000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
        InitialParticlesPerSecond=1607.1870117
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_020'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[3]=SpriteEmitter219
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Beam_explo.SpriteEmitter235'
    begin object name="SpriteEmitter235" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        BlendBetweenSubdivisions=true
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1753850
        FadeInEndTime=0.0253850
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=70.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=170.0000000,Max=170.0000000),Y=(Min=170.0000000,Max=170.0000000),Z=(Min=170.0000000,Max=170.0000000))
        InitialParticlesPerSecond=1147.9909668
        Texture=Texture'FX_TEX.Explosion.explo_ani02'
        TextureUSubdivisions=4
        TextureVSubdivisions=8
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[4]=SpriteEmitter235
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Beam_explo.SpriteEmitter250'
    begin object name="SpriteEmitter250" class=Engine.SpriteEmitter
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
        FadeOutStartTime=0.1169230
        FadeInEndTime=0.0169230
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=50.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=1721.9859619
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_019'
        TextureUSubdivisions=8
        TextureVSubdivisions=4
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[5]=SpriteEmitter250
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Beam_explo.SpriteEmitter251'
    begin object name="SpriteEmitter251" class=Engine.SpriteEmitter
        UseDirectionAs=4
        ProjectionNormal=(X=0.0000000,Y=0.0000000,Z=10.0000000)
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0783470
        FadeInEndTime=0.0035620
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=5.0000000,Max=5.0000000))
        SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        InitialParticlesPerSecond=519994.7812500
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_08'
        LifetimeRange=(Min=0.3205130,Max=0.3205130)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[6]=SpriteEmitter251
    // Reference: SpriteEmitter'XEffects_Decompressed.Alien_Nemesis_Beam_explo.SpriteEmitter252'
    begin object name="SpriteEmitter252" class=Engine.SpriteEmitter
        UseDirectionAs=4
        ProjectionNormal=(X=0.0000000,Y=0.0000000,Z=10.0000000)
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0940170
        FadeInEndTime=0.0042740
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=5.0000000)
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=5.0000000,Max=5.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
        InitialParticlesPerSecond=4329.0000000
        Texture=Texture'FX_TEX.Alien_FX.Alien_effect_04_noalpha'
        LifetimeRange=(Min=0.6000000,Max=0.6000000)
        InitialDelayRange=(Min=0.2000000,Max=0.2000000)
    end object
    Emitters[7]=SpriteEmitter252
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