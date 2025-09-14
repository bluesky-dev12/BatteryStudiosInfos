class Action_PLAYLOCALSOUND extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) Sound Sound;

function bool InitActionFor(ScriptedController C)
{
    local PlayerController P;

    // End:0x2E
    foreach C.DynamicActors(Class'Engine.PlayerController', P)
    {
        P.ClientPlaySound(Sound);        
    }    
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