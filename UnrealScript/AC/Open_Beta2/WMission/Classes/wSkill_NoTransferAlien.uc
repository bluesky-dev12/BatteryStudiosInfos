class wSkill_NoTransferAlien extends wSkill;

simulated function PostBeginPlay()
{
    local wAlienPlayerReplicationInfo PRI;

    super.PostBeginPlay();
    PRI = wAlienPlayerReplicationInfo(Base.Owner.PlayerReplicationInfo);
    // End:0x44
    if(PRI != none)
    {
        PRI.bNoTransferAlien = true;
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
        PRI.bNoTransferAlien = false;
    }
    //return;    
}
