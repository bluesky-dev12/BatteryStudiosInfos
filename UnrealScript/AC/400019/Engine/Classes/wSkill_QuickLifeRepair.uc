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
    //return;    
}

simulated function UnuseSkill()
{
    super.UnuseSkill();
    //return;    
}

simulated function Client_AddProcess()
{
    PlayerController(Base.Owner).myHUD.InsertUsingSkillList(SkillID, AttachWeaponID);
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