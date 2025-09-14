class Action_PLAYLOCALSOUND extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Sound Sound;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController P;

    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(Sound);
    //return;    
}

defaultproperties
{
    ActionString="?????? ??????"
}