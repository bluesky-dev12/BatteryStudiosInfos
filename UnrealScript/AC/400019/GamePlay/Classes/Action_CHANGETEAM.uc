class Action_CHANGETEAM extends ScriptedAction
    editinlinenew
    collapsecategories
    hidecategories(Object);

var(Action) int Team;

function bool InitActionFor(ScriptedController C)
{
    local PlayerReplicationInfo P;

    // End:0xA4
    if(C.PlayerReplicationInfo == none)
    {
        P = C.Spawn(Class'Engine.PlayerReplicationInfo', C,, C.Pawn.Location, C.Pawn.Rotation);
        // End:0x6C
        if(P == none)
        {
            return false;
        }
        C.PlayerReplicationInfo = P;
        C.Pawn.PlayerReplicationInfo = P;
        P = none;
    }
    C.bIsPlayer = true;
    C.Level.Game.GameReplicationInfo.Teams[Team].AddToTeam(C);
    return false;
    //return;    
}

defaultproperties
{
    ActionString="?? ?????"
}