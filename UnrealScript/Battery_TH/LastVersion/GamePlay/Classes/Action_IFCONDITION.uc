class Action_IFCONDITION extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name TriggeredConditionTag;
var TriggeredCondition t;

function ProceedToNextAction(ScriptedController C)
{
    // End:0x3F
    if((t == none) && TriggeredConditionTag != 'None')
    {
        // End:0x3E
        foreach C.AllActors(Class'GamePlay_Decompressed.TriggeredCondition', t, TriggeredConditionTag)
        {
            // End:0x3E
            break;            
        }        
    }
    C.ActionNum += 1;
    // End:0xF3
    if(t == none)
    {
        // End:0x93
        if(C.Level.Title ~= "Robot Factory")
        {
            ProceedToSectionEnd(C);
            return;
        }
        Warn((("No TriggeredCondition with tag " $ string(TriggeredConditionTag)) $ " found, breaking ") $ string(C.SequenceScript));
        ProceedToSectionEnd(C);
        return;
    }
    // End:0x112
    if(!t.bEnabled)
    {
        ProceedToSectionEnd(C);
    }
    //return;    
}

function bool StartsSection()
{
    return true;
    //return;    
}

function string GetActionString()
{
    return (ActionString @ string(t)) @ string(TriggeredConditionTag);
    //return;    
}

defaultproperties
{
    ActionString="??? ??"
}