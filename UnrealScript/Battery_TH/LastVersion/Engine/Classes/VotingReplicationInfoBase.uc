class VotingReplicationInfoBase extends ReplicationInfo
    abstract
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

//var delegate<ProcessCommand> __ProcessCommand__Delegate;
//var delegate<ProcessResponse> __ProcessResponse__Delegate;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        SendResponse;

    // Pos:0x00D
    reliable if(int(Role) < int(ROLE_Authority))
        SendCommand;
}

delegate ProcessCommand(string Command)
{
    //return;    
}

delegate ProcessResponse(string Response)
{
    //return;    
}

function SendCommand(string Cmd)
{
    ProcessCommand(Cmd);
    //return;    
}

simulated function SendResponse(string Response)
{
    ProcessResponse(Response);
    //return;    
}

simulated function bool MatchSetupLocked()
{
    return false;
    //return;    
}

simulated function bool MapVoteEnabled()
{
    return false;
    //return;    
}

simulated function bool KickVoteEnabled()
{
    return false;
    //return;    
}

simulated function bool MatchSetupEnabled()
{
    return false;
    //return;    
}
