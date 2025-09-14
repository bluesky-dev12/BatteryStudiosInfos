/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\ShieldSparks.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class ShieldSparks extends wEmitter;

defaultproperties
{
    mParticleType=2
    mStartParticles=0
    mMaxParticles=20
    mDelayRange[1]=0.10
    mLifeRange[0]=0.40
    mLifeRange[1]=0.60
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mDirDev=(X=0.90,Y=0.90,Z=0.90)
    mPosDev=(X=6.0,Y=6.0,Z=6.0)
    mSpawnVecB=(X=2.0,Y=0.0,Z=0.030)
    mSpeedRange[0]=150.0
    mSpeedRange[1]=300.0
    mMassRange[0]=1.50
    mMassRange[1]=2.50
    mAirResistance=0.0
    mSizeRange[0]=2.50
    mSizeRange[1]=2.50
    mGrowthRate=-4.0
    mAttenKa=0.0
    Style=6
}