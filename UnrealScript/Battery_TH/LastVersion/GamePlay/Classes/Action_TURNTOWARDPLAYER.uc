class Action_TURNTOWARDPLAYER extends LatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
    C.ScriptedFocus = C.GetMyPlayer();
    C.CurrentAction = self;
    return true;
    //return;    
}

function bool TurnToGoal()
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
    ActionString="????? ??? ???"
    bValidForTrigger=false
}