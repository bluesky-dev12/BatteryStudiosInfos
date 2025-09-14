class HelicopterHitEffect extends wEmitter;

var Class<Actor> HitEffectClass;

simulated function PostNetBeginPlay()
{
    // End:0x24
    if(int(Level.NetMode) != int(NM_DedicatedServer))
    {
        Spawn(HitEffectClass);        
    }
    else
    {
        LifeSpan = 0.2000000;
    }
    //return;    
}

defaultproperties
{
    HitEffectClass=Class'XEffects_Decompressed.HitEffect_Metal'
    mRegen=false
    mStartParticles=0
    mMaxParticles=0
    mLifeRange[0]=1.0000000
    mLifeRange[1]=2.0000000
    mRegenRange[0]=0.0000000
    mRegenRange[1]=0.0000000
    mDirDev=(X=0.1000000,Y=0.1000000,Z=0.1000000)
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=85.0000000
    mMassRange[0]=0.0200000
    mMassRange[1]=0.0400000
    mAirResistance=0.6000000
    mRandOrient=true
    mSizeRange[0]=3.5000000
    mSizeRange[1]=5.0000000
    mGrowthRate=3.0000000
    mRandTextures=true
    mNumTileColumns=4
    mNumTileRows=4
    bOnlyRelevantToOwner=true
    RemoteRole=2
    LifeSpan=5.5000000
    Style=5
}