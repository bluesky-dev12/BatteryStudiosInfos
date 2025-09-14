/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\HitSmoke.uc
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
class HitSmoke extends wEmitter;

simulated function Timer()
{
    GotoState('Ticking');
}

simulated function PostNetBeginPlay()
{
    SetTimer(LifeSpan - 1.0, false);
    super(Actor).PostNetBeginPlay();
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
    mStartParticles=0
    mMaxParticles=40
    mLifeRange[0]=1.0
    mLifeRange[1]=1.10
    mRegenRange[0]=50.0
    mRegenRange[1]=50.0
    mDirDev=(X=0.30,Y=0.30,Z=0.30)
    mPosDev=(X=3.30,Y=3.30,Z=3.30)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mMassRange[0]=-0.10
    mMassRange[1]=-0.20
    mSizeRange[0]=15.0
    mSizeRange[1]=20.0
    mGrowthRate=25.0
    mColorRange[0]=(R=50,G=50,B=50,A=255)
    mColorRange[1]=(R=100,G=100,B=100,A=255)
    mNumTileColumns=4
    mNumTileRows=4
    bHidden=true
    LifeSpan=10.0
    Skins=// Object reference not set to an instance of an object.
    
    Style=7
}