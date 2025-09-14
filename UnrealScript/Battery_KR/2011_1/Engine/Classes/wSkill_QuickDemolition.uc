class wSkill_QuickDemolition extends wSkill;

simulated function PostBeginPlay()
{
    Base.bQuickDemolition = true;
    PlayerController(Base.Owner).ServerQuickDemolition(true);
    //return;    
}

simulated function RemoveSkill()
{
    Base.bQuickDemolition = false;
    PlayerController(Base.Owner).ServerQuickDemolition(false);
    //return;    
}
