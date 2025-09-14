class wSkill_QuickReload extends wSkill;

simulated function PostBeginPlay()
{
    // End:0x3F
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.SetWeaponQuickReload(true);
    }
    //return;    
}

simulated function RemoveSkill()
{
    // End:0x3F
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.SetWeaponQuickReload(false);
    }
    //return;    
}
