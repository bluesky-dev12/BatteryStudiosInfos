/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\BloodJet_Alien.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *	States:1
 *
 *******************************************************************************/
class BloodJet_Alien extends wEmitter;

var class<xScorch> SplatterClass;

simulated function Timer()
{
    GotoState('Ticking');
}

simulated function PostNetBeginPlay()
{
    SetTimer(LifeSpan - 1.0, false);
    // End:0x2f
    if(Level.NetMode != 1)
    {
        WallSplat();
    }
    super(Actor).PostNetBeginPlay();
}

simulated function WallSplat()
{
    local Vector WallHit, WallNormal;
    local Actor WallActor;

    // End:0x0e
    if(FRand() > 0.80)
    {
        return;
    }
    WallActor = Trace(WallHit, WallNormal, Location + vect(0.0, 0.0, -150.0), Location, false);
    // End:0x6f
    if(WallActor != none)
    {
        Spawn(SplatterClass,,, WallHit + float(20) * WallNormal + VRand(), rotator(-WallNormal));
    }
}

state Ticking
{
    simulated function Tick(float dt)
    {
        // End:0x2c
        if(LifeSpan < 1.0)
        {
            mRegenRange[0] *= LifeSpan;
            mRegenRange[1] = mRegenRange[0];
        }
    }

}

defaultproperties
{
    SplatterClass=class'BloodSplatter_Alien'
    mRegen=true
    mRegenOffTime[1]=1.0
    mStartParticles=0
    mMaxParticles=0
    mLifeRange[0]=0.10
    mLifeRange[1]=0.80
    mRegenRange[0]=10.0
    mRegenRange[1]=10.0
    mDirDev=(X=0.050,Y=0.050,Z=0.050)
    mPosDev=(X=0.020,Y=0.020,Z=0.010)
    mSpeedRange[0]=50.0
    mSpeedRange[1]=70.0
    mMassRange[0]=0.20
    mMassRange[1]=0.30
    mAirResistance=0.60
    mRandOrient=true
    mSizeRange[0]=2.50
    mSizeRange[1]=3.50
    mGrowthRate=220.0
    mRandTextures=true
    mNumTileColumns=2
    mNumTileRows=2
    Skins=// Object reference not set to an instance of an object.
    
    Style=5
}