/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_MOVETOPLAYER.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:2
 *
 *******************************************************************************/
class Action_MOVETOPLAYER extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

function bool MoveToGoal()
{
    return true;
}

function Actor GetMoveTargetFor(ScriptedController C)
{
    return C.GetMyPlayer();
}

defaultproperties
{
    ActionString="????? ?????"
    bValidForTrigger=true
}