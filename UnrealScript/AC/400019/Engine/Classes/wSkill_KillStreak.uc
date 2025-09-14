class wSkill_KillStreak extends wSkill_Streak;

simulated function int GetCheckStreakValue()
{
    return Base.Owner.PlayerReplicationInfo.Kills;
    //return;    
}

defaultproperties
{
    TopInfoName="Stacked Kill!"
}