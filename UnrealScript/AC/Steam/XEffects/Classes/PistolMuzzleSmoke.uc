/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\PistolMuzzleSmoke.uc
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
class PistolMuzzleSmoke extends wEmitter;

var int mNumPerFire;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += mNumPerFire;
}

defaultproperties
{
    mNumPerFire=2
    mStartParticles=0
    mMaxParticles=4
    mLifeRange[0]=0.30
    mLifeRange[1]=0.60
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mSpeedRange[0]=0.20
    mSpeedRange[1]=0.40
    mMassRange[0]=-0.030
    mMassRange[1]=-0.050
    mRandOrient=true
    mSizeRange[0]=15.0
    mSizeRange[1]=25.0
    mGrowthRate=40.0
    mColorRange[0]=(R=180,G=180,B=180,A=200)
    mColorRange[1]=(R=210,G=210,B=210,A=200)
    mRandTextures=true
    mNumTileColumns=2
    mNumTileRows=2
    bOnlyOwnerSee=true
    Skins=// Object reference not set to an instance of an object.
    
    ScaleGlow=2.0
    Style=5
}