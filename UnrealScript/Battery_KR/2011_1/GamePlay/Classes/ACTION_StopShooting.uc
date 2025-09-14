class ACTION_StopShooting extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

function bool InitActionFor(ScriptedController C)
{
    C.bShootTarget = false;
    C.bShootSpray = false;
    return false;
    //return;    
}
