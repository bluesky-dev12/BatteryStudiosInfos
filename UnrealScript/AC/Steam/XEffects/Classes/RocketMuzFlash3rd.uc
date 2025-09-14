/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\RocketMuzFlash3rd.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *
 *******************************************************************************/
class RocketMuzFlash3rd extends wEmitter;

var int mNumPerFlash;

defaultproperties
{
    mNumPerFlash=1
    mParticleType=4
    mStartParticles=0
    mMaxParticles=6
    mLifeRange[0]=0.150
    mLifeRange[1]=0.20
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mSpawnVecB=(X=0.0,Y=0.0,Z=0.0)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mPosRelative=true
    mAirResistance=0.0
    mRandOrient=true
    mSizeRange[0]=0.120
    mSizeRange[1]=0.120
    mGrowthRate=2.20
    mRandTextures=true
    Style=6
}