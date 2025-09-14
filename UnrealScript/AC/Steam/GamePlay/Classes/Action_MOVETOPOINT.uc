/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_MOVETOPOINT.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class Action_MOVETOPOINT extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name DestinationTag;
var Actor MoveTarget;

function bool MoveToGoal()
{
    return true;
}

function Actor GetMoveTargetFor(ScriptedController C)
{
    // End:0x11
    if(MoveTarget != none)
    {
        return MoveTarget;
    }
    MoveTarget = C.SequenceScript.GetMoveTarget();
    // End:0x61
    if(DestinationTag != 'None')
    {
        // End:0x60
        foreach C.AllActors(class'Actor', MoveTarget, DestinationTag)
        {
            // End:0x60
            break;                        
        }
    }
    // End:0x8b
    if(AIScript(MoveTarget) != none)
    {
        MoveTarget = AIScript(MoveTarget).GetMoveTarget();
    }
    return MoveTarget;
}

function string GetActionString()
{
    return ActionString @ string(DestinationTag);
}

defaultproperties
{
    ActionString="???? ?????"
    bValidForTrigger=true
}