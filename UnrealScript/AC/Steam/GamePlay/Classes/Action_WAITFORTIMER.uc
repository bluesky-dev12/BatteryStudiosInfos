/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_WAITFORTIMER.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:4
 *
 *******************************************************************************/
class Action_WAITFORTIMER extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) float PauseTime;

function bool InitActionFor(ScriptedController C)
{
    C.CurrentAction = self;
    C.SetTimer(PauseTime, false);
    return true;
}

function bool CompleteWhenTriggered()
{
    return true;
}

function bool CompleteWhenTimer()
{
    return true;
}

function string GetActionString()
{
    return ActionString @ string(PauseTime);
}

defaultproperties
{
    ActionString="???? ?????"
}