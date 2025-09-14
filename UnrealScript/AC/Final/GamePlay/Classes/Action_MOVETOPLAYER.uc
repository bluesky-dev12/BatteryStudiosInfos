class Action_MOVETOPLAYER extends LatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool MoveToGoal()
{
    return true;
    //return;    
}

function Actor GetMoveTargetFor(ScriptedController C)
{
    return C.GetMyPlayer();
    //return;    
}

defaultproperties
{
    ActionString="????? ?????"
    bValidForTrigger=false
}