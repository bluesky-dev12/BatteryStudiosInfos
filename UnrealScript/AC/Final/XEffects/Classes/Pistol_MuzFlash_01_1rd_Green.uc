class Pistol_MuzFlash_01_1rd_Green extends wEmitter;

var int mNumPerFlash;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += mNumPerFlash;
    //return;    
}

defaultproperties
{
    mNumPerFlash=1
    mParticleType=4
    mStartParticles=0
    mMaxParticles=1
    mLifeRange[0]=0.0800000
    mLifeRange[1]=0.1000000
    mRegenRange[0]=0.0000000
    mRegenRange[1]=0.0000000
    mSpawnVecB=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=0.0000000
    mPosRelative=true
    mAirResistance=0.0000000
    mSizeRange[0]=0.0060000
    mSizeRange[1]=0.0090000
    mGrowthRate=1.8000000
    mColorRange[0]=(R=255,G=255,B=255,A=235)
    mColorRange[1]=(R=225,G=225,B=225,A=235)
    mRandTextures=true
    mNumTileColumns=4
    mNumTileRows=4
    mMeshNodes=StaticMesh'FX_StaticMesh.MuzzleFlash.Muzzleflash_01_1rd'
    DrawScale=1.2000000
    Skins[0]=FinalBlend'FX_TEX.Muzzle_Flashes_color.FB_Muzzleflash_01_1rd_Green'
    Style=6
}