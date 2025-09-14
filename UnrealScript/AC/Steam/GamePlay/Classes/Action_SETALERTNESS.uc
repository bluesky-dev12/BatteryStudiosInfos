/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_SETALERTNESS.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class Action_SETALERTNESS extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

enum EAlertnessType
{
    ALERTNESS_IgnoreAll,
    ALERTNESS_IgnoreEnemies,
    ALERTNESS_StayOnScript,
    ALERTNESS_LeaveScriptForCombat
};

var(Action) Action_SETALERTNESS.EAlertnessType Alertness;

function bool InitActionFor(ScriptedController C)
{
    C.SetEnemyReaction(Alertness);
    return false;
}

function string GetActionString()
{
    local string S;

    switch(Alertness)
    {
        // End:0x21
        case 0:
            S = "Ignore all";
            // End:0x87
            break;
        // End:0x3f
        case 1:
            S = "Ignore enemies";
            // End:0x87
            break;
        // End:0x5d
        case 2:
            S = "Stay on script";
            // End:0x87
            break;
        // End:0x84
        case 3:
            S = "Leave script for combat";
            // End:0x87
            break;
        // End:0xffff
        default:
            return ActionString @ S;
    }
}

defaultproperties
{
    ActionString="?? ??? ?????"
    bValidForTrigger=true
}