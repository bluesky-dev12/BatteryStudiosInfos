class Pistol_02_ShellSpewer extends ShellSpewer_50AE;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += 1;
    //return;    
}

defaultproperties
{
    mDirDev=(X=0.1000000,Y=0.2000000,Z=0.1000000)
    mSpeedRange[0]=170.0000000
    mSpeedRange[1]=200.0000000
    mOwnerVelocityFactor=100.0000000
    mSpinRange[0]=2000.0000000
    mSpinRange[1]=4000.0000000
}