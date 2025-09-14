class Action_WAITFORTIMER extends LatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) float PauseTime;

function bool InitActionFor(ScriptedController C)
{
    C.CurrentAction = self;
    C.SetTimer(PauseTime, false);
    return true;
    //return;    
}

function bool CompleteWhenTriggered()
{
    return true;
    //return;    
}

function bool CompleteWhenTimer()
{
    return true;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(PauseTime);
    //return;    
}

defaultproperties
{
    ActionString="???? ?????"
}