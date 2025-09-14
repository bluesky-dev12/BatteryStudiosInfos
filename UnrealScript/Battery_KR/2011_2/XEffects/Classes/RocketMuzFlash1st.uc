class RocketMuzFlash1st extends wEmitter;

var int mNumPerFlash;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += mNumPerFlash;
    //return;    
}

defaultproperties
{
    mNumPerFlash=5
    mParticleType=4
    mStartParticles=0
    mMaxParticles=5
    mLifeRange[0]=0.1500000
    mLifeRange[1]=0.1500000
    mRegenRange[0]=0.0000000
    mRegenRange[1]=0.0000000
    mSpawnVecB=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=0.0000000
    mPosRelative=true
    mAirResistance=0.0000000
    mSizeRange[0]=0.4000000
    mSizeRange[1]=0.4000000
    mColorRange[0]=(R=48,G=40,B=40,A=255)
    mColorRange[1]=(R=48,G=40,B=40,A=255)
    mRandTextures=true
    mTileAnimation=true
    mNumTileColumns=2
    mNumTileRows=2
    DrawScale=2.0000000
    Style=6
}