/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_QuickAimZoom.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class wSkill_QuickAimZoom extends wSkill;

simulated function PostBeginPlay()
{
    // End:0x3f
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.SetWeaponQuickAimZoom(true);
    }
}

simulated function RemoveSkill()
{
    // End:0x3f
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.SetWeaponQuickAimZoom(false);
    }
}
