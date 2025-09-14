class SRShellSpewer extends ShellSpewer_127;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += 1;
    //return;    
}

defaultproperties
{
    mDirDev=(X=0.1000000,Y=0.2000000,Z=0.2000000)
    mSpeedRange[0]=170.0000000
    mSpeedRange[1]=200.0000000
    mOwnerVelocityFactor=100.0000000
    mSpinRange[0]=-1500.0000000
    mSpinRange[1]=1800.0000000
}