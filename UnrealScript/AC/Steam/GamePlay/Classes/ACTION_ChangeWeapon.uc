/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\ACTION_ChangeWeapon.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class ACTION_ChangeWeapon extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) class<wWeapon> newWeapon;

function bool InitActionFor(ScriptedController C)
{
    C.Pawn.PendingWeapon = wWeapon(C.Pawn.FindInventoryType(newWeapon));
    C.Pawn.ChangedWeapon();
    return false;
}
