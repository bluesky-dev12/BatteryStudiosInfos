/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\VotingReplicationInfoBase.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:8
 *
 *******************************************************************************/
class VotingReplicationInfoBase extends ReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    abstract
    notplaceable;

var delegate<ProcessCommand> __ProcessCommand__Delegate;
var delegate<ProcessResponse> __ProcessResponse__Delegate;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        SendResponse;

    // Pos:0x0d
    reliable if(Role < 4)
        SendCommand;

}

delegate ProcessCommand(string Command);
delegate ProcessResponse(string Response);
function SendCommand(string Cmd)
{
    ProcessCommand(Cmd);
}

simulated function SendResponse(string Response)
{
    ProcessResponse(Response);
}

simulated function bool MatchSetupLocked()
{
    return false;
}

simulated function bool MapVoteEnabled()
{
    return false;
}

simulated function bool KickVoteEnabled()
{
    return false;
}

simulated function bool MatchSetupEnabled()
{
    return false;
}
