class Action_GOTOACTION extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) int ActionNumber;

function ProceedToNextAction(ScriptedController C)
{
    C.ActionNum = Max(0, ActionNumber);
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(ActionNumber);
    //return;    
}

defaultproperties
{
    ActionString="???? ???"
}