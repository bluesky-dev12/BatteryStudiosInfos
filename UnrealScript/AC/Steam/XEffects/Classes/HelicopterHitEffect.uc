/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\HelicopterHitEffect.uc
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
class HelicopterHitEffect extends wEmitter;

var class<Actor> HitEffectClass;

simulated function PostNetBeginPlay()
{
    // End:0x24
    if(Level.NetMode != 1)
    {
        Spawn(HitEffectClass);
    }
    // End:0x2f
    else
    {
        LifeSpan = 0.20;
    }
}

defaultproperties
{
    HitEffectClass=class'HitEffect_Metal'
    mRegen=true
    mStartParticles=0
    mMaxParticles=0
    mLifeRange[0]=1.0
    mLifeRange[1]=2.0
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mDirDev=(X=0.10,Y=0.10,Z=0.10)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=85.0
    mMassRange[0]=0.020
    mMassRange[1]=0.040
    mAirResistance=0.60
    mRandOrient=true
    mSizeRange[0]=3.50
    mSizeRange[1]=5.0
    mGrowthRate=3.0
    mRandTextures=true
    mNumTileColumns=4
    mNumTileRows=4
    bOnlyRelevantToOwner=true
    RemoteRole=2
    LifeSpan=5.50
    Style=5
}