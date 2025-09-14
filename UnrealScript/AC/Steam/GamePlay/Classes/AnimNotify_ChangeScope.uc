/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\AnimNotify_ChangeScope.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class AnimNotify_ChangeScope extends AnimNotify_Scripted
    hidecategories(Object)
    editinlinenew
    collapsecategories;

simulated event Notify(Actor Owner)
{
    local wGun Gun;
    local wFPWeaponAttachment FPWeapon;

    Gun = wGun(Owner);
    // End:0x4b
    if(Gun != none)
    {
        // End:0x3a
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
}
