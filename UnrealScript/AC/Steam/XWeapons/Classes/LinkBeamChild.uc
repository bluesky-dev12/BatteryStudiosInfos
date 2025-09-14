/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWeapons\Classes\LinkBeamChild.uc
 * Package Imports:
 *	XWeapons
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class LinkBeamChild extends wEmitter;

defaultproperties
{
    mParticleType=6
    mMaxParticles=2
    mRegenDist=75.0
    mSpinRange=45000.0
    mSizeRange=6.0
    mColorRange[0]=(R=180,G=180,B=180,A=255)
    mColorRange[1]=(R=180,G=180,B=180,A=255)
    mAttenuate=true
    mAttenKa=0.010
    mWaveFrequency=0.060
    mWaveAmplitude=15.0
    mWaveShift=100000.0
    mBendStrength=3.0
    mWaveLockEnd=true
    Style=6
}