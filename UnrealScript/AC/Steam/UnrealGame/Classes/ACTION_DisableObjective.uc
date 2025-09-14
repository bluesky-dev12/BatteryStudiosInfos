/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\ACTION_DisableObjective.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:3
 *
 *******************************************************************************/
class ACTION_DisableObjective extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name ObjectiveTag;
var(Action) bool bClearInstigator;
var(Action) bool bTriggerObjectiveInstantly;
var GameObjective Go;

event PostBeginPlay(ScriptedSequence ss)
{
    super.PostBeginPlay(ss);
    // End:0x3d
    if(ObjectiveTag != 'None')
    {
        // End:0x3c
        foreach ss.AllActors(class'GameObjective', Go, ObjectiveTag)
        {
            // End:0x3c
            break;                        
        }
    }
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
        // End:0x5e
        if(bTriggerObjectiveInstantly)
        {
            Go.DisableObjective(Instigator);
        }
        Go.CompleteObjective(Instigator);
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ string(ObjectiveTag);
}

defaultproperties
{
    bClearInstigator=true
    ActionString="???? ????"
}