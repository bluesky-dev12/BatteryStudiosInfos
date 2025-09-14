/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_TRIGGEREVENT.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class Action_TRIGGEREVENT extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name Event;

function bool InitActionFor(ScriptedController C)
{
    C.TriggerEvent(Event, C.SequenceScript, C.GetInstigator());
    return false;
}

function string GetActionString()
{
    return ActionString @ string(Event);
}

defaultproperties
{
    ActionString="???? ?????"
}