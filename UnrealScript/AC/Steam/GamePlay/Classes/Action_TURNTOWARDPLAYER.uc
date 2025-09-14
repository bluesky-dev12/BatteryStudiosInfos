/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_TURNTOWARDPLAYER.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class Action_TURNTOWARDPLAYER extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

function bool InitActionFor(ScriptedController C)
{
    C.ScriptedFocus = C.GetMyPlayer();
    C.CurrentAction = self;
    return true;
}

function bool TurnToGoal()
{
    return true;
}

function Actor GetMoveTargetFor(ScriptedController C)
{
    return C.GetMyPlayer();
}

defaultproperties
{
    ActionString="????? ??? ???"
    bValidForTrigger=true
}