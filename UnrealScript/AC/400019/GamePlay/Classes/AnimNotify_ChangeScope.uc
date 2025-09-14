class AnimNotify_ChangeScope extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

simulated event Notify(Actor Owner)
{
    local wGun Gun;
    local wFPWeaponAttachment FPWeapon;

    Gun = wGun(Owner);
    // End:0x4B
    if(Gun != none)
    {
        // End:0x3A
        if(!Gun.Instigator.IsLocallyControlled())
        {
            return;
        }
        Gun.Change3DScopeMesh();
        return;
    }
    FPWeapon = wFPWeaponAttachment(Owner);
    // End:0x76
    if(FPWeapon != none)
    {
        FPWeapon.Change3DScopeMesh(true);
    }
    //return;    
}
