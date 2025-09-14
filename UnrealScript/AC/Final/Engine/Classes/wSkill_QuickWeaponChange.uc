class wSkill_QuickWeaponChange extends wSkill;

simulated function PostBeginPlay()
{
    // End:0x3F
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.SetWeaponQuickChange(true);
    }
    //return;    
}

simulated function RemoveSkill()
{
    // End:0x3F
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.SetWeaponQuickChange(false);
    }
    //return;    
}
