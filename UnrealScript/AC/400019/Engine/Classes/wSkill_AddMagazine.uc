class wSkill_AddMagazine extends wSkill;

simulated function PostBeginPlay()
{
    // End:0x5C
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.AddWeaponMagazine();
        PlayerController(Base.Owner).ServerAddMagazine(true);
    }
    //return;    
}

simulated function RemoveSkill()
{
    Base.bAddManazine = false;
    PlayerController(Base.Owner).ServerAddMagazine(false);
    //return;    
}
