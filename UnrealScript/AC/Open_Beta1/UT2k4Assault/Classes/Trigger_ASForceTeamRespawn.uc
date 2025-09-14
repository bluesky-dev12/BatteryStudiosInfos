class Trigger_ASForceTeamRespawn extends Triggers;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local Controller C;
    local Pawn OldPawn;

    // End:0x33
    if((int(Role) < int(ROLE_Authority)) || !Level.Game.IsA('ASGameInfo'))
    {
        return;
    }
    C = Level.ControllerList;
    J0x47:

    // End:0x185 [Loop If]
    if(C != none)
    {
        // End:0x16E
        if((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0xBC
            if(Vehicle(C.Pawn) != none)
            {
                Vehicle(C.Pawn).KDriverLeave(true);
            }
            // End:0x14B
            if((C.Pawn != none) && C.Pawn.Weapon == none)
            {
                OldPawn = C.Pawn;
                C.UnPossess();
                OldPawn.Destroy();
                C.Pawn = none;
                Level.Game.RestartPlayer(C);
            }
            ASGameInfo(Level.Game).RespawnPlayer(C, false);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x47;
    }
    //return;    
}

defaultproperties
{
    bCollideActors=false
}