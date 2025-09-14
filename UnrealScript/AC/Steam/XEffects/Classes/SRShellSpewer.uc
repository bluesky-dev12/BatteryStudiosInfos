/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\SRShellSpewer.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SRShellSpewer extends ShellSpewer_127;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += 1;
}

defaultproperties
{
    mDirDev=(X=0.10,Y=0.20,Z=0.20)
    mSpeedRange[0]=170.0
    mSpeedRange[1]=200.0
    mOwnerVelocityFactor=100.0
    mSpinRange[0]=-1500.0
    mSpinRange[1]=1800.0
}