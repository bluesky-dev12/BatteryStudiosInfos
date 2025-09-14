class wSkill_RPG7 extends wSkill;

simulated function DeadPlayer()
{
    super.DeadPlayer();
    SetbUpdateCall(false);
    //return;    
}

simulated function PostBeginPlay()
{
    //return;    
}

simulated function UpdateProcess()
{
    // End:0x8C
    if((bUpdateCall == false) && int(Base.Owner.PlayerReplicationInfo.KillSuccession) >= 4)
    {
        // End:0x85
        if(int(Base.Owner.Role) == int(ROLE_Authority))
        {
            Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        }
        SetbUpdateCall(true);
    }
    //return;    
}
