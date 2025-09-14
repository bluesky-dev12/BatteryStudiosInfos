class Action_DESTROYPAWN extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
    C.DestroyPawn();
    return true;
    //return;    
}

defaultproperties
{
    ActionString="pawn? ?????"
    bValidForTrigger=false
}