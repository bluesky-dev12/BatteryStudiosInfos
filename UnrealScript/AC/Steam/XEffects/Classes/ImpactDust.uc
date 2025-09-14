/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\ImpactDust.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class ImpactDust extends wEmitter;

var() float MaxImpactParticles;

simulated function Kick(Vector Position, float Atten)
{
    SetLocation(Position);
    mLastPos = Position;
    mStartParticles = int(ClampToMaxParticles(float(mStartParticles) + MaxImpactParticles * Atten));
}

defaultproperties
{
    MaxImpactParticles=20.0
    mSpawningType=4
    mMaxParticles=150
    mDelayRange[1]=0.10
    mLifeRange[0]=0.80
    mLifeRange[1]=1.40
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mDirDev=(X=1.0,Y=1.0,Z=0.0)
    mPosDev=(X=8.0,Y=8.0,Z=0.0)
    mSpeedRange[0]=20.0
    mSpeedRange[1]=30.0
    mMassRange[0]=-0.050
    mMassRange[1]=-0.10
    mSizeRange[0]=20.0
    mSizeRange[1]=25.0
    mColorRange[0]=(R=11,G=16,B=16,A=255)
    mColorRange[1]=(R=22,G=22,B=22,A=255)
    mAttenKa=0.050
    mNumTileColumns=4
    mNumTileRows=4
    Skins=// Object reference not set to an instance of an object.
    
    Style=3
}