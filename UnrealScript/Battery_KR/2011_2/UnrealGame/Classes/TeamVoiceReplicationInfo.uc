class TeamVoiceReplicationInfo extends UnrealVoiceReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int RedTeamMask;
var int BlueTeamMask;
var bool bTeamChatOnly;

replication
{
    // Pos:0x000
    reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty || bNetInitial)
        BlueTeamMask, RedTeamMask, 
        bTeamChatOnly;
}

simulated event InitChannels()
{
    local VoiceChatRoom TeamVCR;

    super.InitChannels();
    TeamVCR = AddVoiceChannel();
    // End:0x2D
    if(TeamVCR != none)
    {
        TeamVCR.SetTeam(0);
    }
    TeamVCR = AddVoiceChannel();
    // End:0x54
    if(TeamVCR != none)
    {
        TeamVCR.SetTeam(1);
    }
    //return;    
}

simulated function bool ValidRoom(VoiceChatRoom Room)
{
    return ((bEnableVoiceChat && Room != none) && Room.ChannelIndex < 4) && Room.Owner == self;
    //return;    
}

function SetMask(VoiceChatRoom Room, int NewMask)
{
    // End:0x12
    if(!ValidRoom(Room))
    {
        return;
    }
    // End:0x35
    if(Room.ChannelIndex == 2)
    {
        RedTeamMask = NewMask;        
    }
    else
    {
        // End:0x58
        if(Room.ChannelIndex == 3)
        {
            BlueTeamMask = NewMask;            
        }
        else
        {
            super(VoiceChatReplicationInfo).SetMask(Room, NewMask);
        }
    }
    //return;    
}

simulated function int GetMask(VoiceChatRoom Room)
{
    // End:0x12
    if(!ValidRoom(Room))
    {
        return 0;
    }
    // End:0x2D
    if(Room.ChannelIndex == 2)
    {
        return RedTeamMask;
    }
    // End:0x48
    if(Room.ChannelIndex == 3)
    {
        return BlueTeamMask;
    }
    return super(VoiceChatReplicationInfo).GetMask(Room);
    //return;    
}

simulated event int GetChannelIndex(string ChannelTitle, optional int TeamIndex)
{
    local int i;

    // End:0x95
    if(ChannelTitle != "")
    {
        i = 0;
        J0x13:

        // End:0x95 [Loop If]
        if(i < Channels.Length)
        {
            // End:0x8B
            if(((Channels[i] != none) && Channels[i].GetTitle() ~= ChannelTitle) && Channels[i].GetTeam() == TeamIndex)
            {
                return Channels[i].ChannelIndex;
            }
            i++;
            // [Loop Continue]
            goto J0x13;
        }
    }
    return super.GetChannelIndex(ChannelTitle, TeamIndex);
    //return;    
}

simulated function VoiceChatRoom GetChannel(string ChatRoomName, optional int TeamIndex)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x9C [Loop If]
    if(i < Channels.Length)
    {
        // End:0x92
        if((((Channels[i] != none) && Channels[i].GetTitle() ~= ChatRoomName) && Channels[i].Owner != none) && Channels[i].GetTeam() == TeamIndex)
        {
            return Channels[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return super.GetChannel(ChatRoomName, TeamIndex);
    //return;    
}

function VoiceChatRoom.EJoinChatResult JoinChannel(string ChannelTitle, PlayerReplicationInfo PRI, string Password)
{
    local VoiceChatRoom VCR;
    local int i;

    // End:0x24
    if((PRI != none) || PRI.Team == none)
    {
        return 0;
    }
    VCR = GetChannel(ChannelTitle, PRI.Team.TeamIndex);
    // End:0x5A
    if(VCR == none)
    {
        return 0;
    }
    // End:0xCC
    if(VCR.GetTeam() != PRI.Team.TeamIndex)
    {
        // End:0x9A
        if(VCR.IsTeamChannel())
        {
            return 6;
        }
        i = GetPublicChannelCount();
        // End:0xCC
        if(bTeamChatOnly && VCR.ChannelIndex > i)
        {
            return 6;
        }
    }
    return VCR.JoinChannel(PRI, Password);
    //return;    
}

function VoiceChatRoom.EJoinChatResult JoinChannelAt(int ChannelIndex, PlayerReplicationInfo PRI, string Password)
{
    local VoiceChatRoom VCR;
    local int i;

    // End:0x24
    if((PRI == none) || PRI.Team == none)
    {
        return 0;
    }
    VCR = GetChannelAt(ChannelIndex);
    // End:0xA7
    if(VCR.GetTeam() != PRI.Team.TeamIndex)
    {
        // End:0x75
        if(VCR.IsTeamChannel())
        {
            return 6;
        }
        i = GetPublicChannelCount();
        // End:0xA7
        if(bTeamChatOnly && VCR.ChannelIndex > i)
        {
            return 6;
        }
    }
    return VCR.JoinChannel(PRI, Password);
    //return;    
}

function NotifyTeamChange(PlayerReplicationInfo PRI, int TeamIndex)
{
    local int i, j, idx;

    // End:0x12
    if(int(Role) < int(ROLE_Authority))
    {
        return;
    }
    j = GetPublicChannelCount();
    i = 0;
    J0x25:

    // End:0x2DD [Loop If]
    if(i < Channels.Length)
    {
        // End:0x49
        if(Channels[i] == none)
        {
            // [Explicit Continue]
            goto J0x2D3;
        }
        // End:0xD4
        if(Channels[i].ChannelIndex == -1)
        {
            Log(((((string(Name) @ "NotifyTeamChange") @ string(i)) @ string(Channels[i].Name)) @ Channels[i].GetTitle()) @ "index is -1!", 'VoiceChat');
            // [Explicit Continue]
            goto J0x2D3;
        }
        // End:0x234
        if(Channels[i].ChannelIndex < j)
        {
            // End:0x231
            if(Channels[i].NotifyTeamChange(PRI, TeamIndex))
            {
                idx = GetOpposingTeamChannel(Channels[i].ChannelIndex);
                Level.Game.ChangeVoiceChannel(PRI, Channels[i].ChannelIndex, idx);
                // End:0x231
                if(((PlayerController(PRI.Owner) != none) && PlayerController(PRI.Owner).ActiveRoom != none) && PlayerController(PRI.Owner).ActiveRoom.ChannelIndex == idx)
                {
                    PlayerController(PRI.Owner).ActiveRoom = Channels[i];
                    PlayerController(PRI.Owner).ClientSetActiveRoom(Channels[i].ChannelIndex);
                }
            }
            // [Explicit Continue]
            goto J0x2D3;
        }
        // End:0x2D3
        if(((bTeamChatOnly && Channels[i].IsMember(PRI)) && Channels[i].GetTeam() != TeamIndex) && Channels[i].Owner != PRI)
        {
            Level.Game.ChangeVoiceChannel(PRI, -1, Channels[i].ChannelIndex);
        }
        J0x2D3:

        i++;
        // [Loop Continue]
        goto J0x25;
    }
    //return;    
}

simulated function string GetTitle(VoiceChatRoom Room)
{
    local int i, idx;

    // End:0x1C
    if(!ValidRoom(Room))
    {
        return super(VoiceChatReplicationInfo).GetTitle(Room);
    }
    idx = Room.ChannelIndex;
    // End:0x5C
    if(idx >= PublicChannelNames.Length)
    {
        i = PublicChannelNames.Length - 2;
        idx -= i;
    }
    return PublicChannelNames[idx];
    //return;    
}

simulated function int GetOpposingTeamChannel(int ChannelIndex)
{
    local int i, cnt;
    local VoiceChatRoom Room;

    Room = GetChannelAt(ChannelIndex);
    cnt = GetPublicChannelCount();
    i = 0;
    J0x24:

    // End:0xA5 [Loop If]
    if(i < cnt)
    {
        // End:0x9B
        if(((Channels[i] != none) && Channels[i] != Room) && Channels[i].GetTitle() == Room.GetTitle())
        {
            return Channels[i].ChannelIndex;
        }
        i++;
        // [Loop Continue]
        goto J0x24;
    }
    return -1;
    //return;    
}

defaultproperties
{
    PublicChannelNames=/* Array type was not detected. */
    ChatRoomClass=Class'UnrealGame_Decompressed.UnrealTeamChatRoom'
    DefaultChannel=2
}