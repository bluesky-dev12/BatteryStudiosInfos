class Action_WAITFOREVENT extends LatentScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name ExternalEvent;
var TriggeredCondition t;

function bool InitActionFor(ScriptedController C)
{
    // End:0x2E
    if(t == none)
    {
        // End:0x2D
        foreach C.AllActors(Class'GamePlay_Decompressed.TriggeredCondition', t, ExternalEvent)
        {
            // End:0x2D
            break;            
        }        
    }
    // End:0x4F
    if((t != none) && t.bEnabled)
    {
        return false;
    }
    C.CurrentAction = self;
    C.Tag = ExternalEvent;
    return true;
    //return;    
}

function bool CompleteWhenTriggered()
{
    return true;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(ExternalEvent);
    //return;    
}

defaultproperties
{
    ActionString="?? ???? ?????"
}