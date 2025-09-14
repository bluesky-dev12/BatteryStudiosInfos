/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\WallSparks.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class WallSparks extends wEmitter;

defaultproperties
{
    mParticleType=2
    mRegen=true
    mStartParticles=8
    mMaxParticles=10
    mLifeRange[0]=0.20
    mLifeRange[1]=0.30
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mDirDev=(X=0.60,Y=0.60,Z=0.60)
    mPosDev=(X=0.80,Y=0.80,Z=0.80)
    mSpawnVecB=(X=5.0,Y=0.0,Z=0.030)
    mSpeedRange[0]=400.0
    mSpeedRange[1]=800.0
    mMassRange[0]=1.50
    mMassRange[1]=2.50
    mAirResistance=0.0
    mSizeRange[0]=2.0
    mSizeRange[1]=1.50
    mGrowthRate=-4.0
    mAttenKa=0.0
    DrawScale=1.50
    Skins=// Object reference not set to an instance of an object.
    
    ScaleGlow=2.0
    Style=6
}