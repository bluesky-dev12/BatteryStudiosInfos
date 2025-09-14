/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_IFCONDITION.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class Action_IFCONDITION extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name TriggeredConditionTag;
var TriggeredCondition t;

function ProceedToNextAction(ScriptedController C)
{
    // End:0x3f
    if(t == none && TriggeredConditionTag != 'None')
    {
        // End:0x3e
        foreach C.AllActors(class'TriggeredCondition', t, TriggeredConditionTag)
        {
            // End:0x3e
            break;                        
        }
    }
    C.ActionNum += 1;
    // End:0xf3
    if(t == none)
    {
        // End:0x93
        if(C.Level.Title ~= "Robot Factory")
        {
            ProceedToSectionEnd(C);
            return;
        }
        Warn("No TriggeredCondition with tag " $ string(TriggeredConditionTag) $ " found, breaking " $ string(C.SequenceScript));
        ProceedToSectionEnd(C);
        return;
    }
    // End:0x112
    if(!t.bEnabled)
    {
        ProceedToSectionEnd(C);
    }
}

function bool StartsSection()
{
    return true;
}

function string GetActionString()
{
    return ActionString @ string(t) @ string(TriggeredConditionTag);
}

defaultproperties
{
    ActionString="??? ??"
}