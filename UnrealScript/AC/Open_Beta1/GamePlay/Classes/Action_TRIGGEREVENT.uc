class Action_TRIGGEREVENT extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name Event;

function bool InitActionFor(ScriptedController C)
{
    C.TriggerEvent(Event, C.SequenceScript, C.GetInstigator());
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(Event);
    //return;    
}

defaultproperties
{
    ActionString="???? ?????"
}