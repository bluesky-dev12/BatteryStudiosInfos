class Action_WALK extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
    C.Pawn.ShouldCrouch(false);
    C.Pawn.SetSprinting(true);
    return false;
    //return;    
}

defaultproperties
{
    ActionString="????"
    bValidForTrigger=false
}