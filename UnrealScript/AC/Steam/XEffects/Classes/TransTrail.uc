/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\TransTrail.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class TransTrail extends pclSmoke;

defaultproperties
{
    mParticleType=1
    mStartParticles=0
    mMaxParticles=30
    mLifeRange[0]=0.30
    mLifeRange[1]=0.30
    mRegenRange[0]=20.0
    mRegenRange[1]=30.0
    mSpawnVecB=(X=10.0,Y=0.0,Z=0.0)
    mSizeRange[0]=5.0
    mSizeRange[1]=5.0
    mGrowthRate=1.0
    mColorRange[0]=(R=196,G=219,B=255,A=255)
    mColorRange[1]=(R=196,G=219,B=255,A=255)
    mAttenKa=0.0
    mNumTileColumns=1
    mNumTileRows=1
    Physics=10
    Skins=// Object reference not set to an instance of an object.
    
    Style=6
    bOwnerNoSee=true
}