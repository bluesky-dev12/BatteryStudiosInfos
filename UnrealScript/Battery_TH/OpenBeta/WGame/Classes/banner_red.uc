class banner_red extends uTeamBanner;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    SimAnim.bAnimLoop = true;
    //return;    
}
