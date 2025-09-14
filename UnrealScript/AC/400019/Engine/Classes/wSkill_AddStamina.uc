class wSkill_AddStamina extends wSkill;

simulated function PostBeginPlay()
{
    Base.bAddStamina = true;
    PlayerController(Base.Owner).ServerAddStamina(true);
    //return;    
}

simulated function RemoveSkill()
{
    Base.bAddStamina = false;
    PlayerController(Base.Owner).ServerAddStamina(false);
    //return;    
}
