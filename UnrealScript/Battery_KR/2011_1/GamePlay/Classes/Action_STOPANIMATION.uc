class Action_STOPANIMATION extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
    C.ClearAnimation();
    return false;
    //return;    
}

defaultproperties
{
    ActionString="?????? ?????"
    bValidForTrigger=false
}