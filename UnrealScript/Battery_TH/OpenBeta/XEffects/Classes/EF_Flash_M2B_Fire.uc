class EF_Flash_M2B_Fire extends wEmitter;

var int mNumPerFlash;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += mNumPerFlash;
    //return;    
}

defaultproperties
{
    mNumPerFlash=1
    mParticleType=4
    mStartParticles=0
    mMaxParticles=1
    mLifeRange[0]=0.0700000
    mLifeRange[1]=0.0900000
    mRegenRange[0]=0.0000000
    mRegenRange[1]=0.0000000
    mSpawnVecB=(X=0.0000000,Y=0.0000000,Z=0.0000000)
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=0.0000000
    mPosRelative=true
    mAirResistance=0.0000000
    mSizeRange[0]=0.2200000
    mSizeRange[1]=0.2700000
    mGrowthRate=2.0000000
    mColorRange[0]=(R=255,G=255,B=255,A=235)
    mColorRange[1]=(R=225,G=225,B=225,A=235)
    mRandTextures=true
    mNumTileRows=2
    mMeshNodes=StaticMesh'Warfare_Staticmeshes.Weapon_Effects.Frame_Muzzleflash_1rd'
    LightType=10
    LightHue=28
    LightSaturation=120
    LightBrightness=150.0000000
    LightRadius=50.0000000
    bDynamicLight=true
    Skins[0]=FinalBlend'FX_TEX.Muzzle_Flashes.M2B_Muzzle_Flashes'
    Style=6
}