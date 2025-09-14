/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\Action_ChangeObjectiveTeam.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class Action_ChangeObjectiveTeam extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name ObjectiveTag;
var(Action) byte NewTeam;

function bool InitActionFor(ScriptedController C)
{
    local GameObjective o;

    // End:0x43
    if(ObjectiveTag != 'None')
    {
        // End:0x1629
        foreach C.AllActors(class'GameObjective', o, ObjectiveTag)
        {                        
        }
        return false;
        return;
    }
}

defaultproperties
{
    ActionString="?? ????? ? ??"
}