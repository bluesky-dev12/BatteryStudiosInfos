class ACTION_SetObjectiveActiveStatus extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) name ObjectiveTag;
var(Action) bool bActive;

function bool InitActionFor(ScriptedController C)
{
    local GameObjective Go;

    // End:0xA6
    if(ObjectiveTag != 'None')
    {
        Go = UnrealTeamInfo(C.Level.Game.GameReplicationInfo.Teams[0]).AI.Objectives;
        J0x57:

        // End:0xA6 [Loop If]
        if(Go != none)
        {
            // End:0x8F
            if(ObjectiveTag == Go.Tag)
            {
                Go.SetActive(bActive);
            }
            Go = Go.NextObjective;
            // [Loop Continue]
            goto J0x57;
        }
    }
    return false;
    //return;    
}

function string GetActionString()
{
    return ActionString @ string(ObjectiveTag);
    //return;    
}

defaultproperties
{
    bActive=true
    ActionString="? ????? ??? ????? ??"
}