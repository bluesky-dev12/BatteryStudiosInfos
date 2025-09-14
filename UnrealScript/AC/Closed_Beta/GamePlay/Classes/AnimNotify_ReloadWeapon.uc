class AnimNotify_ReloadWeapon extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

simulated event Notify(Actor Owner)
{
    local wGun Gun;

    Gun = wGun(Owner);
    // End:0x1D
    if(Gun == none)
    {
        return;
    }
    // End:0x3C
    if(!Gun.Instigator.IsLocallyControlled())
    {
        return;
    }
    Gun.ReloadComplete();
    //return;    
}
