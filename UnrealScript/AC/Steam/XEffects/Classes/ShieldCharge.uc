/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\ShieldCharge.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class ShieldCharge extends wEmitter;

defaultproperties
{
    mParticleType=2
    mSpawningType=6
    mStartParticles=0
    mMaxParticles=100
    mLifeRange[0]=0.10
    mLifeRange[1]=0.10
    mRegenRange[0]=50.0
    mRegenRange[1]=50.0
    mPosDev=(X=5.0,Y=5.0,Z=5.0)
    mSpawnVecB=(X=5.0,Y=0.0,Z=0.080)
    mSpeedRange[0]=-50.0
    mSpeedRange[1]=-50.0
    mPosRelative=true
    mAirResistance=0.0
    mSizeRange[0]=0.20
    mSizeRange[1]=0.40
    mColorRange[0]=(R=45,G=220,B=45,A=25)
    mColorRange[1]=(R=65,G=250,B=65,A=200)
    bOnlyOwnerSee=true
    Physics=5
    Style=6
    bFixedRotationDir=true
    RotationRate=(Pitch=0,Yaw=16000,Roll=0)
}