/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\ShellSpewer.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class ShellSpewer extends wEmitter;

var() Sound ShellImpactSnd;

function CollisionSound()
{
    PlaySound(ShellImpactSnd);
}

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += 1;
}

defaultproperties
{
    mParticleType=4
    mStartParticles=0
    mMaxParticles=150
    mLifeRange[0]=0.50
    mLifeRange[1]=1.0
    mRegenRange[0]=0.0
    mRegenRange[1]=0.0
    mDirDev=(X=0.50,Y=0.20,Z=0.60)
    mSpeedRange[0]=200.0
    mSpeedRange[1]=230.0
    mMassRange[0]=2.0
    mMassRange[1]=2.0
    mSpinRange[0]=-100.0
    mSpinRange[1]=100.0
    mAttenFunc=5
    mMeshNodes=StaticMesh'ShellCasing'
    mColMakeSound=true
    CullDistance=500.0
    bNetTemporary=true
    DrawScale=0.030
    Skins=// Object reference not set to an instance of an object.
    
}