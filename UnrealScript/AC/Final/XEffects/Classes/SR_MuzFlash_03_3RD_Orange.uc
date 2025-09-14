class SR_MuzFlash_03_3RD_Orange extends wEmitter;

var int mNumPerFlash;

function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles = mNumPerFlash;
    mGrowthRate = default.mGrowthRate;
    mLifeRange[0] = default.mLifeRange[0];
    mLifeRange[1] = default.mLifeRange[1];
    //return;    
}

defaultproperties
{
    mNumPerFlash=1
    mParticleType=4
    mStartParticles=0
    mMaxParticles=2
    mLifeRange[0]=0.0800000
    mLifeRange[1]=0.1000000
    mRegenRange[0]=0.0000000
    mRegenRange[1]=0.0000000
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=0.0000000
    mPosRelative=true
    mSizeRange[0]=0.5000000
    mSizeRange[1]=0.5500000
    mGrowthRate=2.2000000
    mRandTextures=true
    mNumTileRows=4
    mMeshNodes=StaticMesh'FX_StaticMesh.MuzzleFlash.Muzzleflash_03_3rd'
    DrawScale=0.3200000
    Skins[0]=FinalBlend'FX_TEX.Muzzle_Flashes_color.FB_Muzzleflash_03_3rd_Orange'
    Style=6
}