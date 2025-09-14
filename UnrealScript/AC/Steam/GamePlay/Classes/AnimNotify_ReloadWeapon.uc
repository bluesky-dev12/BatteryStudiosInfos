/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\AnimNotify_ReloadWeapon.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class AnimNotify_ReloadWeapon extends AnimNotify_Scripted
    hidecategories(Object)
    editinlinenew
    collapsecategories;

simulated event Notify(Actor Owner)
{
    local wGun Gun;

    Gun = wGun(Owner);
    // End:0x1d
    if(Gun == none)
    {
        return;
    }
    // End:0x3c
    if(!Gun.Instigator.IsLocallyControlled())
    {
        return;
    }
    Gun.ReloadComplete();
}
