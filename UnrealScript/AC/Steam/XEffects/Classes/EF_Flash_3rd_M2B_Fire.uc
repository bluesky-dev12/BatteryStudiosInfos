/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\EF_Flash_3rd_M2B_Fire.uc
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
class EF_Flash_3rd_M2B_Fire extends wEmitter;

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
    mMaxParticles=1
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
    mMeshNodes=StaticMesh'FX_StaticMesh.MuzzleFlash.Frame_Muzzleflash_3rd'
    DrawScale=0.70
    Skins=// Object reference not set to an instance of an object.
    
    Style=6
}