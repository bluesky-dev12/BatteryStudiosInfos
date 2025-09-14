/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\MG_MuzFlash_01_3RD.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class MG_MuzFlash_01_3RD extends wEmitter;

var int mNumPerFlash;

function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles = mNumPerFlash;
    mGrowthRate = default.mGrowthRate;
    mLifeRange[0] = default.mLifeRange[0];
    mLifeRange[1] = default.mLifeRange[1];
}

defaultproperties
{
    mNumPerFlash=1
    mParticleType=4
    mStartParticles=0
    mMaxParticles=2
    mLifeRange[0]=0.080
    mLifeRange[1]=0.10
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mPosRelative=true
    mSizeRange[0]=0.50
    mSizeRange[1]=0.550
    mGrowthRate=2.20
    mRandTextures=true
    mNumTileRows=4
    mMeshNodes=StaticMesh'FX_StaticMesh.MuzzleFlash.muzzleflash_02_3rd'
    DrawScale=0.350
    Skins=// Object reference not set to an instance of an object.
    
    Style=6
}