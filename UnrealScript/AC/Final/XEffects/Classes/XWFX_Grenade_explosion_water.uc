class XWFX_Grenade_explosion_water extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_water.SpriteEmitter139'
    begin object name="SpriteEmitter139" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-2013.0064697)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3456420
        FadeInEndTime=0.0640070
        MaxParticles=8
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=130.0000000,Max=130.0000000),Y=(Min=130.0000000,Max=130.0000000),Z=(Min=130.0000000,Max=130.0000000))
        InitialParticlesPerSecond=1494.3110352
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_01_a'
        LifetimeRange=(Min=0.5687860,Max=0.8875740)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-234.0000000,Max=234.0000000),Y=(Min=-234.0000000,Max=234.0000000),Z=(Min=1.3520000,Max=1216.8000488))
    end object
    Emitters[0]=SpriteEmitter139
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_water.SpriteEmitter140'
    begin object name="SpriteEmitter140" class=Engine.SpriteEmitter
        UseDirectionAs=4
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3182740
        FadeInEndTime=0.1123320
        MaxParticles=1
        SpinsPerSecondRange=(X=(Min=0.0283500,Max=0.0283500),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
        InitialParticlesPerSecond=49.4230003
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_05'
        LifetimeRange=(Min=1.8722020,Max=1.8722020)
    end object
    Emitters[1]=SpriteEmitter140
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_water.SpriteEmitter141'
    begin object name="SpriteEmitter141" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-2436.6784668)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1666670
        FadeInEndTime=0.0500000
        MaxParticles=7
        SpinsPerSecondRange=(X=(Min=-0.4680000,Max=0.4680000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        InitialParticlesPerSecond=1724.2060547
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_06'
        LifetimeRange=(Min=0.4929480,Max=0.8333330)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-358.8000183,Max=358.8000183),Y=(Min=-358.8000183,Max=358.8000183),Z=(Min=461.1266479,Max=1365.9265137))
    end object
    Emitters[2]=SpriteEmitter141
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_water.SpriteEmitter142'
    begin object name="SpriteEmitter142" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=401.4552307)
        ColorScale=/* Array type was not detected. */
        Opacity=0.6000000
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=30.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=130.0000000,Max=130.0000000),Y=(Min=130.0000000,Max=130.0000000),Z=(Min=130.0000000,Max=130.0000000))
        InitialParticlesPerSecond=2155.6689453
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_02'
        LifetimeRange=(Min=0.3641330,Max=0.3641330)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=162.1825256,Max=162.1825256))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[3]=SpriteEmitter142
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_water.SpriteEmitter143'
    begin object name="SpriteEmitter143" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-4515.2358398)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.0788950
        FadeInEndTime=0.0295860
        MaxParticles=7
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.7910000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
        InitialParticlesPerSecond=2913.9069824
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_06'
        LifetimeRange=(Min=0.2916860,Max=0.4930970)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-466.4400024,Max=466.4400024),Y=(Min=-466.4400024,Max=466.4400024),Z=(Min=182.1362457,Max=1742.1362305))
    end object
    Emitters[4]=SpriteEmitter143
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