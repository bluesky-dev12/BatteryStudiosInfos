class RocketExplosion extends wEmitter;

simulated function PostBeginPlay()
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x6A
    if((PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > float(5000))
    {
        LightType = 0;
        bDynamicLight = false;        
    }
    else
    {
        Spawn(Class'XEffects_Decompressed.RocketSmokeRing');
        // End:0x8F
        if(Level.bDropDetail)
        {
            LightRadius = 7.0000000;
        }
    }
    //return;    
}

defaultproperties
{
    mRegen=false
    mStartParticles=4
    mMaxParticles=4
    mLifeRange[0]=0.5000000
    mLifeRange[1]=1.0000000
    mDirDev=(X=1.0000000,Y=1.0000000,Z=1.0000000)
    mSpeedRange[0]=3.0000000
    mSpeedRange[1]=10.0000000
    mRandOrient=true
    mSpinRange[0]=-20.0000000
    mSpinRange[1]=20.0000000
    mSizeRange[0]=100.0000000
    mSizeRange[1]=200.0000000
    LightType=10
    LightHue=28
    LightSaturation=90
    LightBrightness=255.0000000
    LightRadius=9.0000000
    LightPeriod=32
    LightCone=128
    bDynamicLight=true
    LifeSpan=2.0000000
    Skins[0]=Texture'XEffects_Decompressed.Skins.Rexpt'
    Style=6
}