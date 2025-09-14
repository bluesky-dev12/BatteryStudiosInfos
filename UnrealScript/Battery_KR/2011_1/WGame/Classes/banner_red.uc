class banner_red extends uTeamBanner;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    LoopAnim('banner');
    SimAnim.bAnimLoop = true;
    //return;    
}
