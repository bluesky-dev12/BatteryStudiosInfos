/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\wSkill_AddMagazine.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class wSkill_AddMagazine extends wSkill;

simulated function PostBeginPlay()
{
    // End:0x3e
    if(Base.Owner.Pawn != none)
    {
        Base.Owner.Pawn.AddWeaponMagazine();
    }
}
