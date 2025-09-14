/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_WAITFOREVENT.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class Action_WAITFOREVENT extends LatentScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name ExternalEvent;
var TriggeredCondition t;

function bool InitActionFor(ScriptedController C)
{
    // End:0x2e
    if(t == none)
    {
        // End:0x2d
        foreach C.AllActors(class'TriggeredCondition', t, ExternalEvent)
        {
            // End:0x2d
            break;                        
        }
    }
    // End:0x4f
    if(t != none && t.bEnabled)
    {
        return false;
    }
    C.CurrentAction = self;
    C.Tag = ExternalEvent;
    return true;
}

function bool CompleteWhenTriggered()
{
    return true;
}

function string GetActionString()
{
    return ActionString @ string(ExternalEvent);
}

defaultproperties
{
    ActionString="?? ???? ?????"
}