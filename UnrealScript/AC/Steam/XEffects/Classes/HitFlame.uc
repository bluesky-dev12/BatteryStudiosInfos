/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\HitFlame.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *	States:1
 *
 *******************************************************************************/
class HitFlame extends wEmitter;

simulated function Timer()
{
    GotoState('Ticking');
}

simulated function PostNetBeginPlay()
{
    SetTimer(LifeSpan - 2.0, false);
    super(Actor).PostNetBeginPlay();
}

state Ticking
{
    simulated function Tick(float dt)
    {
        // End:0x50
        if(LifeSpan < 2.0)
        {
            mRegenRange[0] *= LifeSpan * 0.50;
            mRegenRange[1] = mRegenRange[0];
            SoundVolume = byte(float(SoundVolume) * LifeSpan * 0.50);
        }
    }

}

defaultproperties
{
    mStartParticles=0
    mLifeRange[0]=0.20
    mLifeRange[1]=0.10
    mRegenRange[0]=100.0
    mRegenRange[1]=100.0
    mPosDev=(X=3.0,Y=3.0,Z=3.0)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mMassRange[0]=-2.0
    mMassRange[1]=-1.0
    mSpinRange[0]=-15.0
    mSpinRange[1]=15.0
    mSizeRange=5.0
    mGrowthRate=-10.0
    mAttenKa=0.50
    mAttenFunc=5
    mNumTileColumns=4
    mNumTileRows=4
    LifeSpan=5.0
    Style=3
    SoundVolume=190
    SoundRadius=32.0
}