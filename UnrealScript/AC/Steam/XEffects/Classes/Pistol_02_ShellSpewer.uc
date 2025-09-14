/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XEffects\Classes\Pistol_02_ShellSpewer.uc
 * Package Imports:
 *	XEffects
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Pistol_02_ShellSpewer extends ShellSpewer_50AE;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += 1;
}

defaultproperties
{
    mDirDev=(X=0.10,Y=0.20,Z=0.10)
    mSpeedRange[0]=170.0
    mSpeedRange[1]=200.0
    mOwnerVelocityFactor=100.0
    mSpinRange[0]=2000.0
    mSpinRange[1]=4000.0
}