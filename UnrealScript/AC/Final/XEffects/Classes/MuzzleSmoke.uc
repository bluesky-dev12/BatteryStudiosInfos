class MuzzleSmoke extends pclLightSmoke;

function PostBeginPlay()
{
    Disable('Tick');
    //return;    
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    mRegenRange[0] = 30.0000000;
    mRegenRange[1] = mRegenRange[0];
    Enable('Tick');
    //return;    
}

event Tick(float dt)
{
    // End:0x2F
    if(mRegenRange[0] > 1.0000000)
    {
        mRegenRange[0] = Lerp(dt, mRegenRange[0], 0.0000000);        
    }
    else
    {
        mRegenRange[0] = 0.0000000;
        Disable('Tick');
    }
    mRegenRange[1] = mRegenRange[0];
    //return;    
}

defaultproperties
{
    mStartParticles=0
    mMaxParticles=30
    mLifeRange[0]=0.6000000
    mLifeRange[1]=1.2000000
    mRegenRange[0]=0.0000000
    mRegenRange[1]=0.0000000
    mDirDev=(X=0.3000000,Y=0.3000000,Z=0.3000000)
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=0.0000000
    mMassRange[0]=-0.2500000
    mMassRange[1]=-0.1500000
    mSizeRange[0]=5.0000000
    mSizeRange[1]=10.0000000
    mGrowthRate=4.0000000
    mColorRange[0]=(R=70,G=70,B=70,A=255)
    mColorRange[1]=(R=113,G=113,B=113,A=255)
    bHidden=true
    bOnlyOwnerSee=true
    bHighDetail=true
}