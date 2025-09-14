class XWFX_Grenade_explosion_XMAS extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_XMAS.SpriteEmitter292'
    begin object name="SpriteEmitter292" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1127.2601318)
        ColorScale=/* Array type was not detected. */
        Opacity=0.9000000
        FadeOutStartTime=0.6068930
        FadeInEndTime=0.1123870
        MaxParticles=5
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
        InitialParticlesPerSecond=1326.3120117
        DrawStyle=1
        Texture=Texture'FX_TEX.Hit.dirt_soil_bt'
        LifetimeRange=(Min=0.8000000,Max=1.5000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-177.9010010,Max=177.9010010),Y=(Min=-177.9010010,Max=177.9010010),Z=(Min=336.2070007,Max=1036.2070312))
    end object
    Emitters[0]=SpriteEmitter292
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_XMAS.SpriteEmitter301'
    begin object name="SpriteEmitter301" class=Engine.SpriteEmitter
        UseDirectionAs=1
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UniformSize=true
        AutomaticInitialSpawning=false
        Acceleration=(X=68.1312027,Y=68.1312027,Z=-1722.8057861)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.5875000
        FadeInEndTime=0.0125000
        MaxParticles=8
        StartMassRange=(Min=10.0000000,Max=10.0000000)
        SpinsPerSecondRange=(X=(Min=-2.4470000,Max=2.4470000),Y=(Min=-2.0644240,Max=2.0644240),Z=(Min=-2.0644240,Max=2.0644240))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=1032.2130127
        Texture=Texture'FX_TEX.Event_Cash_Gacha.XMAS_GR_02'
        LifetimeRange=(Min=2.5000000,Max=2.5000000)
        InitialDelayRange=(Min=0.0500000,Max=0.0500000)
        StartVelocityRange=(X=(Min=-856.6656494,Max=817.7767944),Y=(Min=-856.6656494,Max=817.7767944),Z=(Min=307.0639954,Max=1747.0640869))
    end object
    Emitters[1]=SpriteEmitter301
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_XMAS.SpriteEmitter302'
    begin object name="SpriteEmitter302" class=Engine.SpriteEmitter
        UseDirectionAs=1
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        UseSizeScale=true
        UseAbsoluteTimeForSizeScale=true
        UseRegularSizeScale=false
        AutomaticInitialSpawning=false
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-1377.4848633)
        ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
        DampingFactorRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.2818620
        FadeInEndTime=0.1348040
        MaxParticles=15
        StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-54.0000000,Max=54.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartLocationShape=2
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
        InitialParticlesPerSecond=2720012.0000000
        Texture=Texture'FX_TEX.Event_Cash_Gacha.XMAS_GR_02'
        SecondsBeforeInactive=7.0000000
        LifetimeRange=(Min=1.2500000,Max=1.2500000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-1236.8944092,Max=1236.8944092),Y=(Min=-1236.8944092,Max=1236.8944092),Z=(Min=86.2288055,Max=1686.2287598))
        GetVelocityDirectionFrom=3
    end object
    Emitters[2]=SpriteEmitter302
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_XMAS.SpriteEmitter303'
    begin object name="SpriteEmitter303" class=Engine.SpriteEmitter
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
        Acceleration=(X=-70.0179977,Y=441.6080017,Z=-684.8040161)
        ColorScale=/* Array type was not detected. */
        Opacity=0.8000000
        FadeOutStartTime=0.7473960
        FadeInEndTime=0.2847220
        StartLocationOffset=(X=40.0000000,Y=-40.0000000,Z=60.0000000)
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=90.0000000,Max=90.0000000))
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
        InitialDelayRange=(Min=0.3500000,Max=0.3500000)
        StartVelocityRange=(X=(Min=-501.6409912,Max=501.6409912),Y=(Min=-501.6409912,Max=501.6409912),Z=(Min=695.2000122,Max=1253.5870361))
        VelocityLossRange=(X=(Min=2.3224320,Max=4.6448641),Y=(Min=2.3224320,Max=4.6448641),Z=(Min=2.3224320,Max=4.6448641))
        RotateVelocityLossRange=true
    end object
    Emitters[3]=SpriteEmitter303
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_XMAS.SpriteEmitter304'
    begin object name="SpriteEmitter304" class=Engine.SpriteEmitter
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
        Acceleration=(X=0.0000000,Y=0.0000000,Z=-92.8556442)
        ColorScale=/* Array type was not detected. */
        ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
        FadeOutStartTime=0.7654670
        FadeInEndTime=0.1815030
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
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
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
        StartVelocityRange=(X=(Min=-453.7731018,Max=453.7731018),Y=(Min=-453.7731018,Max=453.7731018),Z=(Min=254.3211060,Max=385.1100159))
    end object
    Emitters[4]=SpriteEmitter304
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_XMAS.SpriteEmitter305'
    begin object name="SpriteEmitter305" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        RespawnDeadParticles=false
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        AutomaticInitialSpawning=false
        ColorScale=/* Array type was not detected. */
        FadeOutStartTime=0.1950000
        FadeInEndTime=0.0350000
        MaxParticles=2
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=40.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1460000,Max=0.1460000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=110.0000000,Max=110.0000000),Y=(Min=110.0000000,Max=110.0000000),Z=(Min=110.0000000,Max=110.0000000))
        InitialParticlesPerSecond=1607.1870117
        Texture=Texture'FX_TEX.Event_Cash_Gacha.XMAS_GR_01'
        LifetimeRange=(Min=0.5000000,Max=0.5000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[5]=SpriteEmitter305
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_XMAS.SpriteEmitter373'
    begin object name="SpriteEmitter373" class=Engine.SpriteEmitter
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
        MaxParticles=1
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=100.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
        InitialParticlesPerSecond=1147.9909668
        Texture=Texture'FX_TEX.Event_Cash_Gacha.XMAS_GR_01'
        LifetimeRange=(Min=0.4000000,Max=0.4000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[6]=SpriteEmitter373
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_Grenade_explosion_XMAS.SpriteEmitter374'
    begin object name="SpriteEmitter374" class=Engine.SpriteEmitter
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
        MaxParticles=3
        StartLocationOffset=(X=0.0000000,Y=10.0000000,Z=100.0000000)
        StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        InitialParticlesPerSecond=1721.9859619
        Texture=Texture'FX_TEX.Explosion.explo_frame_02'
        LifetimeRange=(Min=0.3000000,Max=0.3000000)
        InitialDelayRange=(Min=0.1000000,Max=0.1000000)
    end object
    Emitters[7]=SpriteEmitter374
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