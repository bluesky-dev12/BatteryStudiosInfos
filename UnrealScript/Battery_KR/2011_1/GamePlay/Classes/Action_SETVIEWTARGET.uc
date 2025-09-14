class Action_SETVIEWTARGET extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name ViewTargetTag;
var Actor ViewTarget;

function bool InitActionFor(ScriptedController C)
{
    // End:0x2F
    if(ViewTargetTag == 'Enemy')
    {
        C.ScriptedFocus = C.Enemy;        
    }
    else
    {
        // End:0x51
        if(ViewTargetTag == 'None')
        {
            C.ScriptedFocus = none;            
        }
        else
        {
            // End:0x90
            if((ViewTarget == none) && ViewTargetTag != 'None')
            {
                // End:0x8F
                foreach C.AllActors(Class'Engine.Actor', ViewTarget, ViewTargetTag)
                {
                    // End:0x8F
                    break;                    
                }                
            }
            // End:0xAC
            if(ViewTarget == none)
            {
                C.bBroken = true;
            }
            C.ScriptedFocus = ViewTarget;
        }
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return (ActionString @ string(ViewTarget)) @ string(ViewTargetTag);
    //return;    
}

defaultproperties
{
    ActionString="????? ?????"
    bValidForTrigger=false
}