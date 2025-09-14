class wSkill_AssistStreak extends wSkill_Streak;

simulated function int GetCheckStreakValue()
{
    return Base.Owner.PlayerReplicationInfo.Assists;
    //return;    
}

defaultproperties
{
    TopInfoName="Assist!"
}