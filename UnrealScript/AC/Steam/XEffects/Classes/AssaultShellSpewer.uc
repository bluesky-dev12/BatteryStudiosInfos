/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\AssaultShellSpewer.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class AssaultShellSpewer extends ShellSpewer_762;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += 1;
}

defaultproperties
{
    mDirDev=(X=0.10,Y=0.20,Z=0.20)
    mSpeedRange[0]=190.0
    mSpeedRange[1]=220.0
    mOwnerVelocityFactor=100.0
    mSpinRange[0]=-2000.0
    mSpinRange[1]=2800.0
}