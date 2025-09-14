/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\ACTION_SetObjectiveActiveStatus.uc
 * Package Imports:
 *	UnrealGame
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:2
 *
 *******************************************************************************/
class ACTION_SetObjectiveActiveStatus extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) name ObjectiveTag;
var(Action) bool bActive;

function bool InitActionFor(ScriptedController C)
{
    local GameObjective Go;

    // End:0xa6
    if(ObjectiveTag != 'None')
    {
        Go = UnrealTeamInfo(C.Level.Game.GameReplicationInfo.Teams[0]).AI.Objectives;
        J0x57:
        // End:0xa6 [While If]
        if(Go != none)
        {
            // End:0x8f
            if(ObjectiveTag == Go.Tag)
            {
                Go.SetActive(bActive);
            }
            Go = Go.NextObjective;
            // This is an implied JumpToken; Continue!
            goto J0x57;
        }
    }
    return false;
}

function string GetActionString()
{
    return ActionString @ string(ObjectiveTag);
}

defaultproperties
{
    bActive=true
    ActionString="? ????? ??? ????? ??"
}