class BloodJet extends wEmitter;

var Class<xScorch> SplatterClass;

simulated function Timer()
{
    GotoState('Ticking');
    //return;    
}

simulated function PostNetBeginPlay()
{
    SetTimer(LifeSpan - 1.0000000, false);
    // End:0x2F
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        WallSplat();
    }
    super(Actor).PostNetBeginPlay();
    //return;    
}

simulated function WallSplat()
{
    local Vector WallHit, WallNormal;
    local Actor WallActor;

    // End:0x0E
    if(FRand() > 0.8000000)
    {
        return;
    }
    WallActor = Trace(WallHit, WallNormal, Location + vect(0.0000000, 0.0000000, -150.0000000), Location, false);
    // End:0x6F
    if(WallActor != none)
    {
        Spawn(SplatterClass,,, WallHit + (float(20) * (WallNormal + VRand())), Rotator(-WallNormal));
    }
    //return;    
}

state Ticking
{
    simulated function Tick(float dt)
    {
        // End:0x2C
        if(LifeSpan < 1.0000000)
        {
            mRegenRange[0] *= LifeSpan;
            mRegenRange[1] = mRegenRange[0];
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    SplatterClass=Class'XEffects_Decompressed.BloodSplatter'
    mRegen=false
    mRegenOffTime[1]=1.0000000
    mStartParticles=0
    mMaxParticles=0
    mLifeRange[0]=0.1000000
    mLifeRange[1]=0.8000000
    mRegenRange[0]=10.0000000
    mRegenRange[1]=10.0000000
    mDirDev=(X=0.0500000,Y=0.0500000,Z=0.0500000)
    mPosDev=(X=0.0200000,Y=0.0200000,Z=0.0100000)
    mSpeedRange[0]=50.0000000
    mSpeedRange[1]=70.0000000
    mMassRange[0]=0.2000000
    mMassRange[1]=0.3000000
    mAirResistance=0.6000000
    mRandOrient=true
    mSizeRange[0]=2.5000000
    mSizeRange[1]=3.5000000
    mGrowthRate=220.0000000
    mRandTextures=true
    mNumTileColumns=2
    mNumTileRows=2
    Skins[0]=Texture'FX_TEX.Hit_Effects.BloodSplat1'
    Style=5
}