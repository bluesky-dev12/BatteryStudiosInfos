class wSkill_DeathStreak extends wSkill;

simulated function DeadPlayer()
{
    // End:0x4C
    if((bUpdateProcess && !IsEnable) && int(Base.Owner.Role) == int(ROLE_Authority))
    {
        SetbyAddCount(byte(int(byAddCount) + 1));
    }
    super.DeadPlayer();
    //return;    
}

simulated function UsedbyWeapon()
{
    super.UsedbyWeapon();
    SetbyAddCount(0);
    //return;    
}

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x60
    if(((AttachWeaponID != -1) && !Base.Owner.Level.GetMatchMaker().bChangingHost) && int(byAddCount) >= CheckStreakCount)
    {
        ActiveSkill();
    }
    //return;    
}

simulated function GetTopInfo(out string strInfo, out string strCountInfo, out int FontSize)
{
    local int currentCount;

    currentCount = int(byAddCount);
    currentCount = Min(currentCount, CheckStreakCount);
    super.GetTopInfo(strInfo, strCountInfo, FontSize);
    strCountInfo = (string(currentCount) @ "/") @ string(CheckStreakCount);
    //return;    
}

defaultproperties
{
    TopInfoName="Deathstreak!"
}