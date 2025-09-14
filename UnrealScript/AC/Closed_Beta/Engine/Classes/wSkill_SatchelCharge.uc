class wSkill_SatchelCharge extends wSkill;

simulated function DeadPlayer()
{
    super.DeadPlayer();
    //return;    
}

simulated function PostBeginPlay()
{
    // End:0xDD
    if((((AttachWeaponID != -1) && IsEnable == false) && !Base.Owner.Level.GetMatchMaker().bChangingHost) && Base.Owner.PlayerReplicationInfo.Kills >= 10)
    {
        PlayerController(Base.Owner).myHUD.InsertUsingSkillList(SkillID);
        Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        SetIsEnable(true);
        SetbUpdateCall(true);
    }
    //return;    
}

simulated function UpdateProcess()
{
    // End:0xB5
    if((bUpdateCall == false) && Base.Owner.PlayerReplicationInfo.Kills >= 10)
    {
        PlayerController(Base.Owner).myHUD.InsertUsingSkillList(SkillID);
        // End:0xAE
        if(int(Base.Owner.Role) == int(ROLE_Authority))
        {
            Base.Owner.Pawn.AddWeaponFromSkill(EmptyBtrDouble(), AttachWeaponID);
        }
        SetbUpdateCall(true);
    }
    //return;    
}
