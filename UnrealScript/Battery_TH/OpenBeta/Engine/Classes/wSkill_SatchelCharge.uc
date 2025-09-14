class wSkill_SatchelCharge extends wSkill;

simulated function DeadPlayer()
{
    super.DeadPlayer();
    //return;    
}

simulated function PostBeginPlay()
{
    // End:0xB2
    if((((AttachWeaponID != -1) && IsEnable == false) && !Base.Owner.Level.GetMatchMaker().bChangingHost) && Base.Owner.PlayerReplicationInfo.Kills >= 10)
    {
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        SetIsEnable(true);
        SetbUpdateCall(true);
    }
    //return;    
}

simulated function UpdateProcess()
{
    // End:0x8A
    if((bUpdateCall == false) && Base.Owner.PlayerReplicationInfo.Kills >= 10)
    {
        // End:0x83
        if(int(Base.Owner.Role) == int(ROLE_Authority))
        {
            Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        }
        SetbUpdateCall(true);
    }
    //return;    
}
