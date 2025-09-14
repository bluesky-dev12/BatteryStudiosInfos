class HitFlame extends wEmitter;

simulated function Timer()
{
    GotoState('Ticking');
    //return;    
}

simulated function PostNetBeginPlay()
{
    SetTimer(LifeSpan - 2.0000000, false);
    super(Actor).PostNetBeginPlay();
    //return;    
}

state Ticking
{
    simulated function Tick(float dt)
    {
        // End:0x50
        if(LifeSpan < 2.0000000)
        {
            mRegenRange[0] *= (LifeSpan * 0.5000000);
            mRegenRange[1] = mRegenRange[0];
            SoundVolume = byte(float(SoundVolume) * (LifeSpan * 0.5000000));
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    mStartParticles=0
    mLifeRange[0]=0.2000000
    mLifeRange[1]=0.1000000
    mRegenRange[0]=100.0000000
    mRegenRange[1]=100.0000000
    mPosDev=(X=3.0000000,Y=3.0000000,Z=3.0000000)
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=0.0000000
    mMassRange[0]=-2.0000000
    mMassRange[1]=-1.0000000
    mSpinRange[0]=-15.0000000
    mSpinRange[1]=15.0000000
    mSizeRange=5.0000000
    mGrowthRate=-10.0000000
    mAttenKa=0.5000000
    mAttenFunc=5
    mNumTileColumns=4
    mNumTileRows=4
    LifeSpan=5.0000000
    Style=3
    SoundVolume=190
    SoundRadius=32.0000000
}