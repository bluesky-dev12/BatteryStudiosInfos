/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\BloodExplosion.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class BloodExplosion extends wEmitter;

defaultproperties
{
    mRegen=true
    mStartParticles=100
    mMaxParticles=100
    mDelayRange[1]=0.10
    mLifeRange[0]=2.50
    mLifeRange[1]=2.50
    mRegenRange[0]=140.0
    mRegenRange[1]=140.0
    mDirDev=(X=0.70,Y=0.70,Z=0.70)
    mPosDev=(X=15.0,Y=15.0,Z=45.0)
    mSpeedRange[0]=80.0
    mSpeedRange[1]=80.0
    mMassRange[0]=0.50
    mMassRange[1]=0.50
    mAirResistance=1.30
    mRandOrient=true
    mSizeRange[0]=30.0
    mSizeRange[1]=50.0
    mColorRange[1]=(R=253,G=160,B=77,A=255)
    Style=5
}