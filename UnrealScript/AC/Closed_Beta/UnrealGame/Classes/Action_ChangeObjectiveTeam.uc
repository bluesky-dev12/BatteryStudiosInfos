class Action_ChangeObjectiveTeam extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name ObjectiveTag;
var(Action) byte NewTeam;

function bool InitActionFor(ScriptedController C)
{
    local GameObjective o;

    // End:0x43
    if(ObjectiveTag != 'None')
    {
        // End:0x42
        foreach C.AllActors(Class'UnrealGame_Decompressed.GameObjective', o, ObjectiveTag)
        {
            o.SetTeam(NewTeam);            
        }        
    }
    return false;
    //return;    
}

defaultproperties
{
    ActionString="?? ????? ? ??"
}