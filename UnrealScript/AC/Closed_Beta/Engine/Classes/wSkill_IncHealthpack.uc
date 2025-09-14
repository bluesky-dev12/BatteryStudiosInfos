class wSkill_IncHealthpack extends wSkill;

simulated function PostBeginPlay()
{
    Base.bIncHealthPack = true;
    PlayerController(Base.Owner).ServerIncHealthPack(true);
    //return;    
}

simulated function RemoveSkill()
{
    Base.bIncHealthPack = false;
    PlayerController(Base.Owner).ServerIncHealthPack(false);
    //return;    
}
