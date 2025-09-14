class wSkill_QuickAimZoom extends wSkill;

simulated function PostBeginPlay()
{
    // End:0x3F
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.SetWeaponQuickAimZoom(true);
    }
    //return;    
}

simulated function RemoveSkill()
{
    // End:0x3F
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.SetWeaponQuickAimZoom(false);
    }
    //return;    
}
