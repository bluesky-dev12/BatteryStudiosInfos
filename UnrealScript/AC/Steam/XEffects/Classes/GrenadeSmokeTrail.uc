/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\GrenadeSmokeTrail.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class GrenadeSmokeTrail extends wEmitter;

defaultproperties
{
    mLifeRange[0]=1.30
    mLifeRange[1]=1.50
    mRegenRange[0]=30.0
    mRegenRange[1]=30.0
    mDirDev=(X=0.20,Y=0.20,Z=0.20)
    mSpeedRange[0]=2.0
    mSpeedRange[1]=15.0
    mMassRange[0]=-0.010
    mMassRange[1]=-0.080
    mRandOrient=true
    mSizeRange[0]=15.0
    mSizeRange[1]=25.0
    mGrowthRate=10.0
    mColorRange[0]=(R=35,G=45,B=45,A=255)
    mColorRange[1]=(R=50,G=65,B=65,A=255)
    mRandTextures=true
    mNumTileColumns=4
    mNumTileRows=4
    Physics=10
    ScaleGlow=2.0
    Style=5
}