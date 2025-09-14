/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\SpeedTrail.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class SpeedTrail extends wEmitter;

defaultproperties
{
    mParticleType=1
    mStartParticles=0
    mLifeRange[0]=0.650
    mLifeRange[1]=0.650
    mRegenRange[0]=10.0
    mRegenRange[1]=10.0
    mDirDev=(X=0.50,Y=0.50,Z=0.50)
    mPosDev=(X=2.0,Y=2.0,Z=2.0)
    mSpeedRange[0]=-20.0
    mSpeedRange[1]=-20.0
    mMassRange[0]=-0.10
    mMassRange[1]=-0.10
    mAirResistance=0.0
    mSizeRange[0]=12.0
    mSizeRange[1]=12.0
    mGrowthRate=-12.0
    mAttenKa=0.0
    bNetTemporary=true
    RemoteRole=2
    LifeSpan=60.0
    Skins=// Object reference not set to an instance of an object.
    
    Style=6
}