/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_KILLINSTIGATOR.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class Action_KILLINSTIGATOR extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var() class<DamageType> DamageType;

function bool InitActionFor(ScriptedController C)
{
    C.GetInstigator().Died(none, DamageType, C.Instigator.Location);
    return false;
}

function string GetActionString()
{
    return ActionString @ string(DamageType);
}

defaultproperties
{
    DamageType=Class'Engine.Crushed'
    ActionString="???? ????"
}