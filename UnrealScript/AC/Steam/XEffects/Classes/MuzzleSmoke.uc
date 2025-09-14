/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\MuzzleSmoke.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class MuzzleSmoke extends pclLightSmoke;

function PostBeginPlay()
{
    Disable('Tick');
}

event Trigger(Actor Other, Pawn EventInstigator)
{
    mRegenRange[0] = 30.0;
    mRegenRange[1] = mRegenRange[0];
    Enable('Tick');
}

event Tick(float dt)
{
    // End:0x2f
    if(mRegenRange[0] > 1.0)
    {
        mRegenRange[0] = Lerp(dt, mRegenRange[0], 0.0);
    }
    // End:0x43
    else
    {
        mRegenRange[0] = 0.0;
        Disable('Tick');
    }
    mRegenRange[1] = mRegenRange[0];
}

defaultproperties
{
    mStartParticles=0
    mMaxParticles=30
    mLifeRange[0]=0.60
    mLifeRange[1]=1.20
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mDirDev=(X=0.30,Y=0.30,Z=0.30)
    mSpeedRange[0]=0.0
    mSpeedRange[1]=0.0
    mMassRange[0]=-0.250
    mMassRange[1]=-0.150
    mSizeRange[0]=5.0
    mSizeRange[1]=10.0
    mGrowthRate=4.0
    mColorRange[0]=(R=70,G=70,B=70,A=255)
    mColorRange[1]=(R=113,G=113,B=113,A=255)
    bHidden=true
    bOnlyOwnerSee=true
    bHighDetail=true
}