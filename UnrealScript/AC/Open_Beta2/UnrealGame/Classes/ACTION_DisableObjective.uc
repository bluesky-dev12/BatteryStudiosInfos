class ACTION_DisableObjective extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name ObjectiveTag;
var(Action) bool bClearInstigator;
var(Action) bool bTriggerObjectiveInstantly;
var GameObjective Go;

event PostBeginPlay(ScriptedSequence ss)
{
    super.PostBeginPlay(ss);
    // End:0x3D
    if(ObjectiveTag != 'None')
    {
        // End:0x3C
        foreach ss.AllActors(Class'UnrealGame_Decompressed.GameObjective', Go, ObjectiveTag)
        {
            // End:0x3C
            break;            
        }        
    }
    //return;    
}

function bool InitActionFor(ScriptedController C)
{
    local Pawn Instigator;

    // End:0x20
    if(!bClearInstigator)
    {
        Instigator = C.GetInstigator();
    }
    // End:0x72
    if(Go != none)
    {
        Go.bClearInstigator = bClearInstigator;
        // End:0x5E
        if(bTriggerObjectiveInstantly)
        {
            Go.DisableObjective(Instigator);
        }
        Go.CompleteObjective(Instigator);
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(ObjectiveTag);
    //return;    
}

defaultproperties
{
    bClearInstigator=true
    ActionString="???? ????"
}