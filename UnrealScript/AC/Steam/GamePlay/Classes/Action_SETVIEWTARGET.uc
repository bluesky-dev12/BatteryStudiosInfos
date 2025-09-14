/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_SETVIEWTARGET.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class Action_SETVIEWTARGET extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name ViewTargetTag;
var Actor ViewTarget;

function bool InitActionFor(ScriptedController C)
{
    // End:0x2f
    if(ViewTargetTag == 'Enemy')
    {
        C.ScriptedFocus = C.Enemy;
    }
    // End:0xc0
    else
    {
        // End:0x51
        if(ViewTargetTag == 'None')
        {
            C.ScriptedFocus = none;
        }
        // End:0xc0
        else
        {
            // End:0x90
            if(ViewTarget == none && ViewTargetTag != 'None')
            {
                // End:0x8f
                foreach C.AllActors(class'Actor', ViewTarget, ViewTargetTag)
                {
                    // End:0x8f
                    break;                                        
                }
            }
            // End:0xac
            if(ViewTarget == none)
            {
                C.bBroken = true;
            }
            C.ScriptedFocus = ViewTarget;
        }
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ string(ViewTarget) @ string(ViewTargetTag);
}

defaultproperties
{
    ActionString="????? ?????"
    bValidForTrigger=true
}