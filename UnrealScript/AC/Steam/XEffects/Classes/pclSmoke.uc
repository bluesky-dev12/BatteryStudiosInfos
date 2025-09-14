/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\pclSmoke.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class pclSmoke extends wEmitter;

defaultproperties
{
    mStartParticles=2
    mMaxParticles=150
    mLifeRange[0]=1.0
    mLifeRange[1]=1.0
    mRegenRange[0]=140.0
    mRegenRange[1]=140.0
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mRandOrient=true
    mSizeRange[0]=45.0
    mSizeRange[1]=45.0
    mColorRange[0]=(R=120,G=110,B=100,A=255)
    mColorRange[1]=(R=180,G=180,B=180,A=255)
    mRandTextures=true
    mNumTileColumns=4
    mNumTileRows=4
    Skins=// Object reference not set to an instance of an object.
    
    ScaleGlow=2.0
    Style=3
}