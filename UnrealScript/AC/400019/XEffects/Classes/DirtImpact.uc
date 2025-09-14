class DirtImpact extends BloodSpurt;

simulated function PostNetBeginPlay()
{
    // End:0x24
    if(int(Level.NetMode) == int(NM_DedicatedServer))
    {
        LifeSpan = 0.2000000;
    }
    //return;    
}

defaultproperties
{
    BloodDecalClass=none
    mStartParticles=30
    mMaxParticles=30
    mLifeRange[0]=0.9000000
    mLifeRange[1]=1.7000000
    mSpeedRange[0]=35.0000000
    mSpeedRange[1]=150.0000000
    mMassRange[0]=0.4000000
    mMassRange[1]=0.7000000
    mSizeRange[0]=5.5000000
    mSizeRange[1]=13.5000000
    CullDistance=7000.0000000
    Texture=Texture'XEffects_Decompressed.Skins.pcl_Dirta'
    Skins[0]=Texture'XEffects_Decompressed.Skins.pcl_Dirta'
}