class wSkill_IncExplosion extends wSkill;

simulated function PostBeginPlay()
{
    Base.bIncExplosion = true;
    PlayerController(Base.Owner).ServerIncExplosion(true);
    //return;    
}

simulated function RemoveSkill()
{
    Base.bIncExplosion = false;
    PlayerController(Base.Owner).ServerIncExplosion(false);
    //return;    
}
