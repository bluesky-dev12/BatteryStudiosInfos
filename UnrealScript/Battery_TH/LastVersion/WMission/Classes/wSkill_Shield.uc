class wSkill_Shield extends wSkill_CoolTime;

var float fAttackDecreaseRate;
var int iSubHealthPoint;

simulated function Initialize(wSkillBase SkillBase, wSkillBaseParam Param)
{
    super.Initialize(SkillBase, Param);
    Base.Owner.Pawn.bIsDefencing = false;
    //return;    
}

simulated function ReadySkill()
{
    super.ReadySkill();
    //return;    
}

simulated function bool CheckSkill()
{
    // End:0x5D
    if((int(Base.Owner.Pawn.byUseKey) == 1) && (Base.Owner.Pawn.Health - iSubHealthPoint) >= iSubHealthPoint)
    {
        return true;
    }
    return false;
    //return;    
}

simulated function UseSkill()
{
    super.UseSkill();
    Base.Owner.Pawn.Health -= iSubHealthPoint;
    wAlienPlayerReplicationInfo(Base.Owner.Pawn.PlayerReplicationInfo).fAttackDereaseRate = 1.0000000 - fAttackDecreaseRate;
    Base.Owner.Pawn.bIsDefencing = true;
    // End:0xDB
    if(Base.Owner.Pawn.Weapon != none)
    {
        Base.Owner.Pawn.Weapon.ClientPlayDefence();
    }
    Base.Owner.Pawn.FmodPlaySound(Class'WGame.wAlienMaleSoundGroup'.default.SndUseCoolTimeSkill[int(wAlienPlayerReplicationInfo(Base.Owner.Pawn.PlayerReplicationInfo).eSkinType)], 0,,, false);
    //return;    
}

simulated function UnuseSkill()
{
    super.UnuseSkill();
    wAlienPlayerReplicationInfo(Base.Owner.Pawn.PlayerReplicationInfo).fAttackDereaseRate = 1.0000000;
    Base.Owner.Pawn.bIsDefencing = false;
    //return;    
}

simulated function ResetSkill()
{
    super.ResetSkill();
    Base.Owner.Pawn.bIsDefencing = false;
    //return;    
}

defaultproperties
{
    fAttackDecreaseRate=0.9000000
    fMaxActiveTime=5.0000000
    fMaxCoolTime=30.0000000
    bCoolTimeSkill=true
}