class HitFlameBig extends wEmitter;

simulated function Timer()
{
    GotoState('Ticking');
    //return;    
}

simulated function PostNetBeginPlay()
{
    SetTimer(LifeSpan - 3.0000000, false);
    super(Actor).PostNetBeginPlay();
    //return;    
}

state Ticking
{
    simulated function Tick(float dt)
    {
        // End:0x4E
        if(LifeSpan < 3.0000000)
        {
            mRegenRange[0] *= (LifeSpan / float(3));
            mRegenRange[1] = mRegenRange[0];
            SoundVolume = byte(float(SoundVolume) * (LifeSpan / float(3)));
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    mStartParticles=0
    mLifeRange[0]=0.3000000
    mLifeRange[1]=0.5000000
    mRegenRange[0]=200.0000000
    mRegenRange[1]=200.0000000
    mPosDev=(X=3.0000000,Y=3.0000000,Z=3.0000000)
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=0.0000000
    mMassRange[0]=-1.0000000
    mMassRange[1]=-1.2000000
    mSizeRange[1]=25.0000000
    mGrowthRate=-16.0000000
    mAttenKa=0.5000000
    mNumTileColumns=4
    mNumTileRows=4
    LifeSpan=10.0000000
    Style=3
    SoundVolume=190
    SoundRadius=32.0000000
}