class UnrealTeamChatRoom extends UnrealChatRoom
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated function bool IsTeamChannel()
{
    return (VoiceChatReplicationInfo(Owner) != none) && !IsPublicChannel();
    //return;    
}

simulated function bool CanJoinChannel(PlayerReplicationInfo PRI)
{
    // End:0x12
    if(!super.CanJoinChannel(PRI))
    {
        return false;
    }
    // End:0x60
    if(PRI.Team == none)
    {
        Log("CanJoinChannel returning false PRI.Team == None", 'VoiceChat');
        return false;
    }
    // End:0xB1
    if((GetTeam()) != PRI.Team.TeamIndex)
    {
        // End:0x8D
        if(IsPublicChannel())
        {
            return true;
        }
        // End:0x98
        if(IsTeamChannel())
        {
            return false;
        }
        // End:0xB1
        if(TeamVoiceReplicationInfo(VoiceChatManager).bTeamChatOnly)
        {
            return false;
        }
    }
    return true;
    //return;    
}

function bool NotifyTeamChange(PlayerReplicationInfo PRI, int NewTeamIndex)
{
    local VoiceChatRoom Other;

    // End:0x0B
    if(IsPublicChannel())
    {
        return false;
    }
    // End:0x1D
    if((GetTeam()) != NewTeamIndex)
    {
        return false;
    }
    // End:0x2D
    if(IsMember(PRI))
    {
        return false;
    }
    // End:0x84
    if(IsTeamChannel())
    {
        Other = VoiceChatManager.GetChannelAt(TeamVoiceReplicationInfo(VoiceChatManager).GetOpposingTeamChannel(ChannelIndex));
        // End:0x84
        if(Other != none)
        {
            return Other.IsMember(PRI);
        }
    }
    return super(VoiceChatRoom).NotifyTeamChange(PRI, NewTeamIndex);
    //return;    
}
