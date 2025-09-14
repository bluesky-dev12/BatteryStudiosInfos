/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wBelchFlames.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class wBelchFlames extends wEmitter;

defaultproperties
{
    mStartParticles=0
    mLifeRange[0]=0.150
    mLifeRange[1]=0.20
    mRegenRange[0]=300.0
    mRegenRange[1]=300.0
    mPosDev=(X=3.0,Y=3.0,Z=3.0)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mMassRange[0]=-1.0
    mMassRange[1]=-1.20
    mSizeRange[0]=25.0
    mSizeRange[1]=30.0
    mGrowthRate=-16.0
    mAttenKa=0.50
    mNumTileColumns=4
    mNumTileRows=4
    Physics=10
    LifeSpan=10.0
    Style=3
    SoundVolume=190
    SoundRadius=32.0
}