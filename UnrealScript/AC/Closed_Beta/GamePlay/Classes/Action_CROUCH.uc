class Action_CROUCH extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
    C.Pawn.ShouldCrouch(true);
    return false;
    //return;    
}

defaultproperties
{
    ActionString="??"
    bValidForTrigger=false
}