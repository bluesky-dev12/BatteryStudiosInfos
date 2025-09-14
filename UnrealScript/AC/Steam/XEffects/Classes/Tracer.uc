/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\Tracer.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class Tracer extends wEmitter;

defaultproperties
{
    mParticleType=2
    mStartParticles=0
    mMaxParticles=100
    mLifeRange[0]=0.70
    mLifeRange[1]=1.0
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mSpeedRange[0]=5000.0
    mSpeedRange[1]=5000.0
    mAirResistance=0.0
    mSizeRange[0]=4.0
    mSizeRange[1]=4.0
    Skins=// Object reference not set to an instance of an object.
    
    Style=3
}