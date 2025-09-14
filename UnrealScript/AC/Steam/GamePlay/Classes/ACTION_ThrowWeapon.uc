/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_ThrowWeapon.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_ThrowWeapon extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) Vector WeaponVelocity;

function bool InitActionFor(ScriptedController C)
{
    // End:0x35
    if(C.Pawn == none || C.Pawn.Weapon == none)
    {
        return false;
    }
    // End:0x9c
    if(WeaponVelocity == vect(0.0, 0.0, 0.0))
    {
        WeaponVelocity = C.Pawn.Velocity + vect(0.0, 0.0, 250.0) + float(300) * vector(C.Pawn.Rotation);
    }
    C.Pawn.TossWeapon(WeaponVelocity);
    return false;
}

defaultproperties
{
    ActionString="??? ????"
}