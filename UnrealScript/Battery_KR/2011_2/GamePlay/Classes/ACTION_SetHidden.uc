class ACTION_SetHidden extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) bool bHidden;
var(Action) name HideActorTag;
var array<Actor> Target;

event PostBeginPlay(ScriptedSequence ss)
{
    local Actor A;

    // End:0x41
    if(HideActorTag != 'None')
    {
        // End:0x40
        foreach ss.AllActors(Class'Engine.Actor', A, HideActorTag)
        {
            Target[Target.Length] = A;            
        }        
    }
    //return;    
}

function bool InitActionFor(ScriptedController C)
{
    local int i;

    // End:0x4C
    if(Target.Length > 0)
    {
        i = 0;
        J0x13:

        // End:0x49 [Loop If]
        if(i < Target.Length)
        {
            Target[i].bHidden = bHidden;
            i++;
            // [Loop Continue]
            goto J0x13;
        }        
    }
    else
    {
        C.GetInstigator().bHidden = bHidden;
    }
    return false;
    //return;    
}
