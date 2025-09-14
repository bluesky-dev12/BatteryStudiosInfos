class wSkill_SatchelCharge extends wSkill_KillStreak;

var int LeftCount;

simulated function DeadPlayer()
{
    // End:0x1D
    if(bUpdateProcess && !bUsed)
    {
        --LeftCount;
    }
    super(wSkill_Streak).DeadPlayer();
    //return;    
}

simulated function UsedbyWeapon()
{
    --LeftCount;
    super(wSkill_Streak).UsedbyWeapon();
    //return;    
}

simulated function PostBeginPlay()
{
    super(wSkill_Streak).PostBeginPlay();
    // End:0x65
    if((((AttachWeaponID != -1) && bUpdateProcess) && !Base.Owner.Level.GetMatchMaker().bChangingHost) && LeftCount > 0)
    {
        ActiveSkill();
    }
    //return;    
}

simulated function AddProcess()
{
    LeftCount = 4;
    super(wSkill).AddProcess();
    //return;    
}
