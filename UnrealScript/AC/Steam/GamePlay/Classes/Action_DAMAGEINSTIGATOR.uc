/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_DAMAGEINSTIGATOR.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class Action_DAMAGEINSTIGATOR extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) int Damage;
var(Action) class<DamageType> DamageType;

function bool InitActionFor(ScriptedController C)
{
    local Pawn Damaged;

    Damaged = C.GetInstigator();
    Damaged.TakeDamage(Damage, Damaged, Damaged.Location, vect(0.0, 0.0, 0.0), DamageType);
    return false;
}

function string GetActionString()
{
    return ActionString @ string(DamageType) @ string(Damage);
}

defaultproperties
{
    Damage=10
    DamageType=Class'Engine.Crushed'
    ActionString="???? ????"
}