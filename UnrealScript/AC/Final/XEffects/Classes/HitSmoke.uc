class HitSmoke extends wEmitter;

simulated function Timer()
{
    GotoState('Ticking');
    //return;    
}

simulated function PostNetBeginPlay()
{
    SetTimer(LifeSpan - 1.0000000, false);
    super(Actor).PostNetBeginPlay();
    //return;    
}

state Ticking
{
    simulated function Tick(float dt)
    {
        // End:0x2C
        if(LifeSpan < 1.0000000)
        {
            mRegenRange[0] *= LifeSpan;
            mRegenRange[1] = mRegenRange[0];
        }
        //return;        
    }
    stop;    
}

defaultproperties
{
    mStartParticles=0
    mMaxParticles=40
    mLifeRange[0]=1.0000000
    mLifeRange[1]=1.1000000
    mRegenRange[0]=50.0000000
    mRegenRange[1]=50.0000000
    mDirDev=(X=0.3000000,Y=0.3000000,Z=0.3000000)
    mPosDev=(X=3.3000000,Y=3.3000000,Z=3.3000000)
    mSpeedRange[0]=0.0000000
    mSpeedRange[1]=0.0000000
    mMassRange[0]=-0.1000000
    mMassRange[1]=-0.2000000
    mSizeRange[0]=15.0000000
    mSizeRange[1]=20.0000000
    mGrowthRate=25.0000000
    mColorRange[0]=(R=50,G=50,B=50,A=255)
    mColorRange[1]=(R=100,G=100,B=100,A=255)
    mNumTileColumns=4
    mNumTileRows=4
    bHidden=true
    LifeSpan=10.0000000
    Skins[0]=Texture'XEffects_Decompressed.EmitSmoke_t'
    Style=7
}