/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\AnimNotify_EjectShell.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class AnimNotify_EjectShell extends AnimNotify_Scripted
    hidecategories(Object)
    editinlinenew
    collapsecategories;

simulated event Notify(Actor Owner)
{
    local wGun Gun;
    local wFPWeaponAttachment FPWeapon;

    Gun = wGun(Owner);
    // End:0x49
    if(Gun != none && Gun.Instigator.IsLocallyControlled())
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
}
