class alien_tankersheld_hit_BulletHole extends xScorch;

function PostBeginPlay()
{
    // End:0x18
    if(FRand() < 0.7500000)
    {
        LifeSpan *= 1.5000000;
    }
    super.PostBeginPlay();
    //return;    
}
