class ImpactDust extends wEmitter;

var() float MaxImpactParticles;

simulated function Kick(Vector Position, float Atten)
{
    SetLocation(Position);
    mLastPos = Position;
    mStartParticles = int(ClampToMaxParticles(float(mStartParticles) + (MaxImpactParticles * Atten)));
    //return;    
}

defaultproperties
{
    MaxImpactParticles=20.0000000
    mSpawningType=4
    mMaxParticles=150
    mDelayRange[1]=0.1000000
    mLifeRange[0]=0.8000000
    mLifeRange[1]=1.4000000
    mRegenRange[0]=0.0000000
    mRegenRange[1]=0.0000000
    mDirDev=(X=1.0000000,Y=1.0000000,Z=0.0000000)
    mPosDev=(X=8.0000000,Y=8.0000000,Z=0.0000000)
    mSpeedRange[0]=20.0000000
    mSpeedRange[1]=30.0000000
    mMassRange[0]=-0.0500000
    mMassRange[1]=-0.1000000
    mSizeRange[0]=20.0000000
    mSizeRange[1]=25.0000000
    mColorRange[0]=(R=11,G=16,B=16,A=255)
    mColorRange[1]=(R=22,G=22,B=22,A=255)
    mAttenKa=0.0500000
    mNumTileColumns=4
    mNumTileRows=4
    Skins[0]=Texture'XEffects_Decompressed.EmitLightSmoke_t'
    Style=3
}