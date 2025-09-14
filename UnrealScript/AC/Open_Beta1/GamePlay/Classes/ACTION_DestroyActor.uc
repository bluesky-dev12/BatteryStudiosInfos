class ACTION_DestroyActor extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name DestroyTag;

function bool InitActionFor(ScriptedController C)
{
    local Actor A;

    // End:0x3B
    if(DestroyTag != 'None')
    {
        // End:0x3A
        foreach C.AllActors(Class'Engine.Actor', A, DestroyTag)
        {
            A.Destroy();            
        }        
    }
    return false;
    //return;    
}

defaultproperties
{
    ActionString="???? ?????"
}