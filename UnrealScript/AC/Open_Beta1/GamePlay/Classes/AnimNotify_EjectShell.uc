class AnimNotify_EjectShell extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

simulated event Notify(Actor Owner)
{
    local wGun Gun;
    local wFPWeaponAttachment FPWeapon;

    Gun = wGun(Owner);
    // End:0x49
    if((Gun != none) && Gun.Instigator.IsLocallyControlled())
    {
        Gun.SpawnShell();
        return;
    }
    FPWeapon = wFPWeaponAttachment(Owner);
    // End:0x73
    if(FPWeapon != none)
    {
        FPWeapon.SpawnShell();
    }
    //return;    
}
