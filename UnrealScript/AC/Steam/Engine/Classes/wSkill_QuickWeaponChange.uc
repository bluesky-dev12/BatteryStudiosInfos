/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_QuickWeaponChange.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wSkill_QuickWeaponChange extends wSkill;

simulated function PostBeginPlay()
{
    // End:0x3f
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.SetWeaponQuickChange(true);
    }
}

simulated function RemoveSkill()
{
    // End:0x3f
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.SetWeaponQuickChange(false);
    }
}
