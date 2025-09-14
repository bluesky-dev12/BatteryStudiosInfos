class Action_MOVETOPOINT extends LatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name DestinationTag;
var Actor MoveTarget;

function bool MoveToGoal()
{
    return true;
    //return;    
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
        foreach C.AllActors(Class'Engine.Actor', MoveTarget, DestinationTag)
        {
            // End:0x60
            break;            
        }        
    }
    // End:0x8B
    if(AIScript(MoveTarget) != none)
    {
        MoveTarget = AIScript(MoveTarget).GetMoveTarget();
    }
    return MoveTarget;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(DestinationTag);
    //return;    
}

defaultproperties
{
    ActionString="???? ?????"
    bValidForTrigger=false
}