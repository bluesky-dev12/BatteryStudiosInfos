class wSkill_AddInfectionPoint extends wSkill;

simulated function PostBeginPlay()
{
    local wAlienPlayerReplicationInfo PRI;

    super.PostBeginPlay();
    PRI = wAlienPlayerReplicationInfo(Base.Owner.PlayerReplicationInfo);
    // End:0x44
    if(PRI != none)
    {
        PRI.InfectionPoint = 2;
    }
    //return;    
}

simulated function RemoveSkill()
{
    local wAlienPlayerReplicationInfo PRI;

    PRI = wAlienPlayerReplicationInfo(Base.Owner.PlayerReplicationInfo);
    // End:0x3E
    if(PRI != none)
    {
        PRI.InfectionPoint = 1;
    }
    //return;    
}
