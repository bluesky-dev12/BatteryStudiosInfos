/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UnrealTeamChatRoom.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:3
 *
 *******************************************************************************/
class UnrealTeamChatRoom extends UnrealChatRoom
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated function bool IsTeamChannel()
{
    return VoiceChatReplicationInfo(Owner) != none && !IsPublicChannel();
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
    // End:0xb1
    if(GetTeam() != PRI.Team.TeamIndex)
    {
        // End:0x8d
        if(IsPublicChannel())
        {
            return true;
        }
        // End:0x98
        if(IsTeamChannel())
        {
            return false;
        }
        // End:0xb1
        if(TeamVoiceReplicationInfo(VoiceChatManager).bTeamChatOnly)
        {
            return false;
        }
    }
    return true;
}

function bool NotifyTeamChange(PlayerReplicationInfo PRI, int NewTeamIndex)
{
    local VoiceChatRoom Other;

    // End:0x0b
    if(IsPublicChannel())
    {
        return false;
    }
    // End:0x1d
    if(GetTeam() != NewTeamIndex)
    {
        return false;
    }
    // End:0x2d
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
}
