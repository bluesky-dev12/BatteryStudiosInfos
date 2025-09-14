/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\AnimNotify_FireWeapon.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class AnimNotify_FireWeapon extends AnimNotify_Scripted
    hidecategories(Object)
    editinlinenew
    collapsecategories;

event Notify(Actor Owner)
{
    Pawn(Owner).bIgnorePlayFiring = true;
    WeaponAttachment(Pawn(Owner).Weapon.ThirdPersonActor).ThirdPersonEffects();
    Pawn(Owner).Weapon.HackPlayFireSound();
}
