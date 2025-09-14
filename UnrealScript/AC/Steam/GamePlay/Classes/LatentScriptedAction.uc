/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\LatentScriptedAction.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Functions:13
 *
 *******************************************************************************/
class LatentScriptedAction extends ScriptedAction
    dependson(ScriptedSequence)
    hidecategories(Object)
    editinlinenew
    collapsecategories
    abstract;

function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    Canvas.DrawText("Action " $ GetActionString(), false);
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

function bool InitActionFor(ScriptedController C)
{
    C.CurrentAction = self;
    return true;
}

function bool CompleteWhenTriggered()
{
    return false;
}

function bool CompleteOnAnim(int Channel)
{
    return false;
}

function bool CompleteOnLIPSincAnim()
{
    return false;
}

function bool CompleteWhenTimer()
{
    return false;
}

function bool WaitForPlayer()
{
    return false;
}

function bool TickedAction()
{
    return false;
}

function bool StillTicking(ScriptedController C, float DeltaTime)
{
    return false;
}

function bool MoveToGoal()
{
    return false;
}

function bool TurnToGoal()
{
    return false;
}

function Actor GetMoveTargetFor(ScriptedController C)
{
    return C.SequenceScript.GetMoveTarget();
}

function float GetDistance()
{
    return 0.0;
}
