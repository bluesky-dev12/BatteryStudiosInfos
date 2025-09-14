/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\OffensiveEffect.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class OffensiveEffect extends wEmitter;

defaultproperties
{
    mParticleType=4
    mStartParticles=0
    mMaxParticles=10
    mLifeRange[0]=1.0
    mLifeRange[1]=1.0
    mRegenRange[0]=3.0
    mRegenRange[1]=3.0
    mPosDev=(X=10.0,Y=10.0,Z=10.0)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mPosRelative=true
    mAirResistance=0.0
    mRandOrient=true
    mSizeRange[0]=0.70
    mSizeRange[1]=1.10
    mColorRange[0]=(R=250,G=150,B=150,A=255)
    mColorRange[1]=(R=250,G=150,B=150,A=255)
    mAttenKa=0.50
    mAttenFunc=1
    bTrailerSameRotation=true
    bNetTemporary=true
    bReplicateMovement=true
    Physics=10
    RemoteRole=2
    LifeSpan=60.0
    Style=6
}