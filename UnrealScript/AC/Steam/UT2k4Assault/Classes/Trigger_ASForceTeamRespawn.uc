/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Trigger_ASForceTeamRespawn.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Trigger_ASForceTeamRespawn extends Triggers;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local Controller C;
    local Pawn OldPawn;

    // End:0x33
    if(Role < 4 || !Level.Game.IsA('ASGameInfo'))
    {
        return;
    }
    C = Level.ControllerList;
    J0x47:
    // End:0x185 [While If]
    if(C != none)
    {
        // End:0x16e
        if(C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator)
        {
            // End:0xbc
            if(Vehicle(C.Pawn) != none)
            {
                Vehicle(C.Pawn).KDriverLeave(true);
            }
            // End:0x14b
            if(C.Pawn != none && C.Pawn.Weapon == none)
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
        // This is an implied JumpToken; Continue!
        goto J0x47;
    }
}

defaultproperties
{
    bCollideActors=true
}