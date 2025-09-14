class AnimNotify_FireWeapon extends AnimNotify_Scripted
    editinlinenew
    collapsecategories
    hidecategories(Object);

event Notify(Actor Owner)
{
    Pawn(Owner).bIgnorePlayFiring = true;
    WeaponAttachment(Pawn(Owner).Weapon.ThirdPersonActor).ThirdPersonEffects();
    Pawn(Owner).Weapon.HackPlayFireSound();
    //return;    
}
