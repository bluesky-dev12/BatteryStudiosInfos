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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_water.SpriteEmitter332'
    begin object name="SpriteEmitter332" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1861.1376953)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3594680
        FadeInEndTime=0.0665680
        MaxParticles=8
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=130.0000000,Max=130.0000000),Y=(Min=130.0000000,Max=130.0000000),Z=(Min=130.0000000,Max=130.0000000))
        InitialParticlesPerSecond=1436.8380127
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_01_a'
        LifetimeRange=(Min=0.5915380,Max=0.9230770)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-225.0000000,Max=225.0000000),Y=(Min=-225.0000000,Max=225.0000000),Z=(Min=1.3000000,Max=1170.0000000))
    end object
    Emitters[0]=SpriteEmitter332
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_water.SpriteEmitter333'
    begin object name="SpriteEmitter333" class=Engine.SpriteEmitter
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
    Emitters[1]=SpriteEmitter333
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_water.SpriteEmitter335'
    begin object name="SpriteEmitter335" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1692.1376953)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.3594680
        FadeInEndTime=0.0665680
        MaxParticles=7
        SpinsPerSecondRange=(X=(Min=-0.3900000,Max=0.3900000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
        InitialParticlesPerSecond=1436.8380127
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_06'
        LifetimeRange=(Min=0.5915380,Max=1.0000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-299.0000000,Max=299.0000000),Y=(Min=-299.0000000,Max=299.0000000),Z=(Min=384.2721863,Max=1138.2720947))
    end object
    Emitters[2]=SpriteEmitter335
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_water.SpriteEmitter336'
    begin object name="SpriteEmitter336" class=Engine.SpriteEmitter
        FadeOut=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=140.5606537)
        ColorScale=/* Array type was not detected. */
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=30.0000000)
        StartLocationShape=1
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=130.0000000,Max=130.0000000),Y=(Min=130.0000000,Max=130.0000000),Z=(Min=130.0000000,Max=130.0000000))
        InitialParticlesPerSecond=1275.5439453
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_02'
        LifetimeRange=(Min=0.6153850,Max=0.6153850)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=95.9659958,Max=95.9659958))
        MaxAbsVelocity=(X=0.0000000,Y=20.0000000,Z=0.0000000)
    end object
    Emitters[3]=SpriteEmitter336
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_water.SpriteEmitter337'
    begin object name="SpriteEmitter337" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1855.3730469)
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2765140
        FadeInEndTime=0.0512060
        MaxParticles=7
        SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5070000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=70.0000000,Max=70.0000000),Z=(Min=70.0000000,Max=70.0000000))
        InitialParticlesPerSecond=1867.8890381
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit_Effects.hit_water_06'
        LifetimeRange=(Min=0.4550300,Max=0.7692310)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-299.0000000,Max=299.0000000),Y=(Min=-299.0000000,Max=299.0000000),Z=(Min=116.7539978,Max=1116.7540283))
    end object
    Emitters[4]=SpriteEmitter337
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