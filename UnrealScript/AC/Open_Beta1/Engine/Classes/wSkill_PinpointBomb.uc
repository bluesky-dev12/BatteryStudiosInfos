class wSkill_PinpointBomb extends wSkill;

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
    // End:0xB5
    if((bUpdateCall == false) && Base.Owner.PlayerReplicationInfo.KillSuccession >= 3)
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
