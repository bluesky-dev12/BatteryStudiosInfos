class banner_blue extends uTeamBanner;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    LoopAnim('banner');
    SimAnim.bAnimLoop = true;
    //return;    
}

defaultproperties
{
    Team=1
}