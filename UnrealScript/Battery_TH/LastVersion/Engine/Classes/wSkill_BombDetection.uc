class wSkill_BombDetection extends wSkill;

simulated function PostBeginPlay()
{
    Base.bBombDetection = true;
    PlayerController(Base.Owner).ServerBombDetection(true);
    //return;    
}

simulated function RemoveSkill()
{
    Base.bBombDetection = false;
    PlayerController(Base.Owner).ServerBombDetection(false);
    //return;    
}
