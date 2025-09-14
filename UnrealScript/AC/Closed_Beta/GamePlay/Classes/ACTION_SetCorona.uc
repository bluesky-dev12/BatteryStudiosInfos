class ACTION_SetCorona extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) bool bCorona;
var(Action) name HideActorTag;

function bool InitActionFor(ScriptedController C)
{
    local Actor A;

    // End:0x45
    if(HideActorTag != 'None')
    {
        // End:0x44
        foreach C.AllActors(Class'Engine.Actor', A, HideActorTag)
        {
            A.bCorona = bCorona;            
        }        
    }
    return false;
    //return;    
}
