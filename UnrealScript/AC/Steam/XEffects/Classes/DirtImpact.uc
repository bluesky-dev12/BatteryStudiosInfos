/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\DirtImpact.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class DirtImpact extends BloodSpurt;

simulated function PostNetBeginPlay()
{
    // End:0x24
    if(Level.NetMode == 1)
    {
        LifeSpan = 0.20;
    }
}

defaultproperties
{
    BloodDecalClass=none
    mStartParticles=30
    mMaxParticles=30
    mLifeRange[0]=0.90
    mLifeRange[1]=1.70
    mSpeedRange[0]=35.0
    mSpeedRange[1]=150.0
    mMassRange[0]=0.40
    mMassRange[1]=0.70
    mSizeRange[0]=5.50
    mSizeRange[1]=13.50
    CullDistance=7000.0
    Texture=Texture'Skins.pcl_Dirta'
    Skins=// Object reference not set to an instance of an object.
    
}