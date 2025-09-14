class AssaultShellSpewer extends ShellSpewer_762;

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    mStartParticles += 1;
    //return;    
}

defaultproperties
{
    mDirDev=(X=0.1000000,Y=0.2000000,Z=0.2000000)
    mSpeedRange[0]=190.0000000
    mSpeedRange[1]=220.0000000
    mOwnerVelocityFactor=100.0000000
    mSpinRange[0]=-2000.0000000
    mSpinRange[1]=2800.0000000
}