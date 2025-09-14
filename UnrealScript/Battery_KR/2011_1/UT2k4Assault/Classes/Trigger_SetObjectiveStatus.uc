class Trigger_SetObjectiveStatus extends Triggers;

var(Action) name ObjectiveTag;
var(Action) bool bActive;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local GameObjective Go;

    // End:0x12
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    Go = UnrealTeamInfo(Level.Game.GameReplicationInfo.Teams[0]).AI.Objectives;
    J0x51:

    // End:0xA0 [Loop If]
    if(Go != none)
    {
        // End:0x89
        if(ObjectiveTag == Go.Tag)
        {
            Go.SetActive(bActive);
        }
        Go = Go.NextObjective;
        // [Loop Continue]
        goto J0x51;
    }
    //return;    
}

defaultproperties
{
    bActive=true
    bCollideActors=false
}