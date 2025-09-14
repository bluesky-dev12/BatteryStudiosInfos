class wSkill_KillSuccessionStreak extends wSkill_Streak;

simulated function PostBeginPlay()
{
    SetbyAddCount(0);
    super.PostBeginPlay();
    //return;    
}

simulated function int GetCheckStreakValue()
{
    return Base.Owner.PlayerReplicationInfo.KillSuccession;
    //return;    
}

defaultproperties
{
    TopInfoName="Killstreak!"
}