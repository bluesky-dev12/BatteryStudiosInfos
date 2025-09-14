/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_GOTOACTION.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class Action_GOTOACTION extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) int ActionNumber;

function ProceedToNextAction(ScriptedController C)
{
    C.ActionNum = Max(0, ActionNumber);
}

function string GetActionString()
{
    return ActionString @ string(ActionNumber);
}

defaultproperties
{
    ActionString="???? ???"
}