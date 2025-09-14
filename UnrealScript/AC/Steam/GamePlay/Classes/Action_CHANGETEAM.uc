/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Action_CHANGETEAM.uc
 * Package Imports:
 *	Gameplay
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class Action_CHANGETEAM extends ScriptedAction
    hidecategories(Object)
    editinlinenew
    collapsecategories;

var(Action) int Team;

function bool InitActionFor(ScriptedController C)
{
    local PlayerReplicationInfo P;

    // End:0xa4
    if(C.PlayerReplicationInfo == none)
    {
        P = C.Spawn(class'PlayerReplicationInfo', C,, C.Pawn.Location, C.Pawn.Rotation);
        // End:0x6c
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
}

defaultproperties
{
    ActionString="?? ?????"
}