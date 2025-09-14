class wSkill_RepairNuclear extends wSkill;

var float CheckTime;

simulated function PostBeginPlay()
{
    //return;    
}

simulated function UpdateProcess()
{
    // End:0x52
    if(int(Base.Owner.Role) == int(ROLE_Authority))
    {
        // End:0x52
        if(!Base.Owner.Level.GetMatchMaker().bChangingHost)
        {
        }
    }
    //return;    
}
