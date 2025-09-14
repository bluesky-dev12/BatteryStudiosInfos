class wSkill_QuickRespawn extends wSkill;

simulated function PostBeginPlay()
{
    Base.bQuickRespawn = true;
    PlayerController(Base.Owner).ServerQuickRespawn(true);
    //return;    
}

simulated function RemoveSkill()
{
    Base.bQuickRespawn = false;
    PlayerController(Base.Owner).ServerQuickRespawn(false);
    //return;    
}
