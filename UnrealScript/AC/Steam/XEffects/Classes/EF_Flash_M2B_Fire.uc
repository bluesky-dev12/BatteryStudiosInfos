/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\EF_Flash_M2B_Fire.uc
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
class EF_Flash_M2B_Fire extends wEmitter;

var int mNumPerFlash;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += mNumPerFlash;
}

defaultproperties
{
    mNumPerFlash=1
    mParticleType=4
    mStartParticles=0
    mMaxParticles=1
    mLifeRange[0]=0.070
    mLifeRange[1]=0.090
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mSpawnVecB=(X=0.0,Y=0.0,Z=0.0)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mPosRelative=true
    mAirResistance=0.0
    mSizeRange[0]=0.220
    mSizeRange[1]=0.270
    mGrowthRate=2.0
    mColorRange[0]=(R=255,G=255,B=255,A=235)
    mColorRange[1]=(R=225,G=225,B=225,A=235)
    mRandTextures=true
    mNumTileRows=2
    mMeshNodes=StaticMesh'FX_StaticMesh.MuzzleFlash.Frame_Muzzleflash_1rd'
    LightType=10
    LightHue=28
    LightSaturation=120
    LightBrightness=150.0
    LightRadius=50.0
    bDynamicLight=true
    Skins=// Object reference not set to an instance of an object.
    
    Style=6
}