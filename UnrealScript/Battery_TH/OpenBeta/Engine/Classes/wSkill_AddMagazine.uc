class wSkill_AddMagazine extends wSkill;

simulated function PostBeginPlay()
{
    // End:0x3E
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.AddWeaponMagazine();
    }
    //return;    
}
