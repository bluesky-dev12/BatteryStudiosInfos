/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\RocketMuzFlash1st.uc
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
class RocketMuzFlash1st extends wEmitter;

var int mNumPerFlash;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += mNumPerFlash;
}

defaultproperties
{
    mNumPerFlash=5
    mParticleType=4
    mStartParticles=0
    mMaxParticles=5
    mLifeRange[0]=0.150
    mLifeRange[1]=0.150
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mSpawnVecB=(X=0.0,Y=0.0,Z=0.0)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mPosRelative=true
    mAirResistance=0.0
    mSizeRange[0]=0.40
    mSizeRange[1]=0.40
    mColorRange[0]=(R=48,G=40,B=40,A=255)
    mColorRange[1]=(R=48,G=40,B=40,A=255)
    mRandTextures=true
    mTileAnimation=true
    mNumTileColumns=2
    mNumTileRows=2
    DrawScale=2.0
    Style=6
}