/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\RocketExplosion.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class RocketExplosion extends wEmitter;

simulated function PostBeginPlay()
{
    local PlayerController PC;

    PC = Level.GetLocalPlayerController();
    // End:0x6a
    if(PC.ViewTarget == none || VSize(PC.ViewTarget.Location - Location) > float(5000))
    {
        LightType = 0;
        bDynamicLight = false;
    }
    // End:0x8f
    else
    {
        Spawn(class'RocketSmokeRing');
        // End:0x8f
        if(Level.bDropDetail)
        {
            LightRadius = 7.0;
        }
    }
}

defaultproperties
{
    mRegen=true
    mStartParticles=4
    mMaxParticles=4
    mLifeRange[0]=0.50
    mLifeRange[1]=1.0
    mDirDev=(X=1.0,Y=1.0,Z=1.0)
    mSpeedRange[0]=3.0
    mSpeedRange[1]=10.0
    mRandOrient=true
    mSpinRange[0]=-20.0
    mSpinRange[1]=20.0
    mSizeRange[0]=100.0
    mSizeRange[1]=200.0
    LightType=10
    LightHue=28
    LightSaturation=90
    LightBrightness=255.0
    LightRadius=9.0
    LightPeriod=32
    LightCone=128
    bDynamicLight=true
    LifeSpan=2.0
    Skins=// Object reference not set to an instance of an object.
    
    Style=6
}