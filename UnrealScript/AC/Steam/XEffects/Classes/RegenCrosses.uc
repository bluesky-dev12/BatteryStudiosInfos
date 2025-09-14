/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\RegenCrosses.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class RegenCrosses extends wEmitter;

defaultproperties
{
    mSpawningType=6
    mStartParticles=0
    mMaxParticles=20
    mLifeRange[0]=2.0
    mLifeRange[1]=2.0
    mRegenRange[0]=10.0
    mRegenRange[1]=10.0
    mPosDev=(X=35.0,Y=35.0,Z=45.0)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mMassRange[0]=-0.10
    mMassRange[1]=-0.10
    mAirResistance=2.0
    mOwnerVelocityFactor=1.0
    mSizeRange[0]=6.0
    mSizeRange[1]=6.0
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