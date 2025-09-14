/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Trigger_SetObjectiveStatus.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:1
 *
 *******************************************************************************/
class Trigger_SetObjectiveStatus extends Triggers;

var(Action) name ObjectiveTag;
var(Action) bool bActive;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local GameObjective Go;

    // End:0x12
    if(Role < 4)
    {
        return;
    }
    Go = UnrealTeamInfo(Level.Game.GameReplicationInfo.Teams[0]).AI.Objectives;
    J0x51:
    // End:0xa0 [While If]
    if(Go != none)
    {
        // End:0x89
        if(ObjectiveTag == Go.Tag)
        {
            Go.SetActive(bActive);
        }
        Go = Go.NextObjective;
        // This is an implied JumpToken; Continue!
        goto J0x51;
    }
}

defaultproperties
{
    bActive=true
    bCollideActors=true
}