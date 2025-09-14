/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\HitFlameBig.uc
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
class HitFlameBig extends wEmitter;

simulated function Timer()
{
    GotoState('Ticking');
}

simulated function PostNetBeginPlay()
{
    SetTimer(LifeSpan - 3.0, false);
    super(Actor).PostNetBeginPlay();
}

state Ticking
{
    simulated function Tick(float dt)
    {
        // End:0x4e
        if(LifeSpan < 3.0)
        {
            mRegenRange[0] *= LifeSpan / float(3);
            mRegenRange[1] = mRegenRange[0];
            SoundVolume = byte(float(SoundVolume) * LifeSpan / float(3));
        }
    }

}

defaultproperties
{
    mStartParticles=0
    mLifeRange[0]=0.30
    mLifeRange[1]=0.50
    mRegenRange[0]=200.0
    mRegenRange[1]=200.0
    mPosDev=(X=3.0,Y=3.0,Z=3.0)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mMassRange[0]=-1.0
    mMassRange[1]=-1.20
    mSizeRange[1]=25.0
    mGrowthRate=-16.0
    mAttenKa=0.50
    mNumTileColumns=4
    mNumTileRows=4
    LifeSpan=10.0
    Style=3
    SoundVolume=190
    SoundRadius=32.0
}