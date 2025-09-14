class AssaultMuzzleSmoke extends wEmitter;

var int mNumPerFire;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += mNumPerFire;
    //return;    
}

defaultproperties
{
    mNumPerFire=2
    mStartParticles=0
    mMaxParticles=5
    mLifeRange[0]=0.3000000
    mLifeRange[1]=0.6000000
    mRegenRange[0]=0.0000000
    mRegenRange[1]=0.0000000
    mSpeedRange[0]=0.2000000
    mSpeedRange[1]=0.4000000
    mMassRange[0]=-0.0300000
    mMassRange[1]=-0.0500000
    mRandOrient=true
    mSizeRange[0]=15.0000000
    mSizeRange[1]=22.0000000
    mGrowthRate=40.0000000
    mColorRange[0]=(R=180,G=180,B=180,A=200)
    mColorRange[1]=(R=210,G=210,B=210,A=200)
    mRandTextures=true
    mNumTileColumns=2
    mNumTileRows=2
    bOnlyOwnerSee=true
    DrawScale=1.5000000
    Skins[0]=Texture'FX_TEX.Smoke.muzzle_smoke_02_no'
    ScaleGlow=2.0000000
    Style=5
}