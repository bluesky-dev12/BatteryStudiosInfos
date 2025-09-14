class XWFX_IncGrenade_Flame_Ally extends Emitter;

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
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_IncGrenade_Flame_Ally.SpriteEmitter9'
    begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
        UseColorScale=true
        FadeOut=true
        FadeIn=true
        SpinParticles=true
        UseSizeScale=true
        UseRegularSizeScale=false
        UniformSize=true
        UseRandomSubdivision=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=5.2719998)
        ColorScale=/* Array type was not detected. */
        Opacity=0.1000000
        FadeOutStartTime=2.0000000
        FadeInEndTime=0.5000000
        MaxParticles=4
        StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=40.0000000)
        SphereRadiusRange=(Min=0.0000000,Max=64.0000000)
        SpinsPerSecondRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSpinRange=(X=(Min=-0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        SizeScale=/* Array type was not detected. */
        StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
        DrawStyle=1
        Texture=Texture'FX_TEX.Smoke.smoke_far'
        StartVelocityRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=20.0000000))
    end object
    Emitters[0]=SpriteEmitter9
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_IncGrenade_Flame_Ally.SpriteEmitter11'
    begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.1000000
        FadeOutStartTime=0.5220000
        FadeInEndTime=0.1620000
        MaxParticles=4
        StartLocationRange=(X=(Min=-60.0000000,Max=-60.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=60.0000000,Max=100.0000000),Y=(Min=60.0000000,Max=100.0000000),Z=(Min=60.0000000,Max=100.0000000))
        InitialParticlesPerSecond=11111110656.0000000
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire02'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.8000000,Max=1.8000000)
        StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=20.0000000,Max=40.0000000))
    end object
    Emitters[1]=SpriteEmitter11
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_IncGrenade_Flame_Ally.SpriteEmitter1'
    begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.1000000
        FadeOutStartTime=0.5220000
        FadeInEndTime=0.1620000
        MaxParticles=4
        StartLocationRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=60.0000000,Max=100.0000000),Y=(Min=60.0000000,Max=100.0000000),Z=(Min=60.0000000,Max=100.0000000))
        InitialParticlesPerSecond=11111110656.0000000
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire03'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.8000000,Max=1.8000000)
        StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=20.0000000,Max=40.0000000))
    end object
    Emitters[2]=SpriteEmitter1
    // Reference: SpriteEmitter'XEffects_Decompressed.XWFX_IncGrenade_Flame_Ally.SpriteEmitter2'
    begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
        FadeOut=true
        FadeIn=true
        UniformSize=true
        BlendBetweenSubdivisions=true
        Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
        ColorScale=/* Array type was not detected. */
        Opacity=0.1000000
        FadeOutStartTime=0.5220000
        FadeInEndTime=0.1620000
        MaxParticles=4
        StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-60.0000000,Max=-60.0000000),Z=(Min=0.0000000,Max=0.0000000))
        StartSizeRange=(X=(Min=60.0000000,Max=100.0000000),Y=(Min=60.0000000,Max=100.0000000),Z=(Min=60.0000000,Max=100.0000000))
        InitialParticlesPerSecond=11111110656.0000000
        Texture=Texture'FX_TEX.flame.flamethrower_down_fire03'
        TextureUSubdivisions=4
        TextureVSubdivisions=4
        LifetimeRange=(Min=1.8000000,Max=1.8000000)
        StartVelocityRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=20.0000000,Max=40.0000000))
    end object
    Emitters[3]=SpriteEmitter2
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
    bDynamicLight=true
    bAlwaysRelevant=true
    LifeSpan=1.0000000
}