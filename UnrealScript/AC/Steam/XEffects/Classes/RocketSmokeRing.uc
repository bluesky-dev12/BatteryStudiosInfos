/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\RocketSmokeRing.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class RocketSmokeRing extends wEmitter;

defaultproperties
{
    mSpawningType=7
    mRegen=true
    mStartParticles=15
    mMaxParticles=15
    mLifeRange[0]=1.30
    mLifeRange[1]=1.70
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mPosDev=(X=20.0,Y=20.0,Z=20.0)
    mSpeedRange[0]=100.0
    mSpeedRange[1]=100.0
    mPosRelative=true
    mAirResistance=1.90
    mRandOrient=true
    mSpinRange[0]=-50.0
    mSpinRange[1]=50.0
    mSizeRange[0]=20.0
    mSizeRange[1]=30.0
    mGrowthRate=40.0
    mAttenKa=0.0
    mAttenKb=0.50
    mAttenFunc=2
    mRandTextures=true
    mNumTileColumns=4
    mNumTileRows=4
    Skins=// Object reference not set to an instance of an object.
    
    Style=5
}