class wSkill_QuickLifeRepair extends wSkill_CoolTime;

var int iAddRepairHP;

simulated function bool CheckSkill()
{
    // End:0x75
    if((int(Base.Owner.Pawn.byUseKey) == 1) && !float(Base.Owner.Pawn.Health) == Base.Owner.Pawn.HealthMax)
    {
        return true;
    }
    return false;
    //return;    
}

simulated function UseSkill()
{
    super.UseSkill();
    Base.Owner.Pawn.GiveHealth(iAddRepairHP, int(Base.Owner.Pawn.HealthMax));
    Base.Owner.Pawn.FmodPlaySound(Class'WGame.wAlienMaleSoundGroup'.default.SndUseCoolTimeSkill[int(wAlienPlayerReplicationInfo(Base.Owner.Pawn.PlayerReplicationInfo).eSkinType)], 0,,, false);
    //return;    
}

simulated function UnuseSkill()
{
    super.UnuseSkill();
    //return;    
}

simulated function ResetSkill()
{
    super.ResetSkill();
    //return;    
}

defaultproperties
{
    iAddRepairHP=1000
    fMaxCoolTime=30.0000000
    bCoolTimeSkill=true
}