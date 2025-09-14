/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\RocketTrailSmoke.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class RocketTrailSmoke extends wEmitter;

defaultproperties
{
    mStartParticles=0
    mMaxParticles=150
    mLifeRange[0]=1.250
    mLifeRange[1]=1.250
    mRegenRange[0]=90.0
    mRegenRange[1]=90.0
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mMassRange[0]=-0.030
    mMassRange[1]=-0.010
    mRandOrient=true
    mSpinRange[0]=-75.0
    mSpinRange[1]=75.0
    mSizeRange[0]=15.0
    mSizeRange[1]=20.0
    mGrowthRate=13.0
    mColorRange[1]=(R=255,G=210,B=210,A=255)
    mAttenFunc=1
    mRandTextures=true
    mNumTileColumns=4
    mNumTileRows=4
    CullDistance=10000.0
    Physics=10
    Style=5
}