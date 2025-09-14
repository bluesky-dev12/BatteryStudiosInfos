class UnrealVoiceReplicationInfo extends VoiceChatReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() Class<UnrealChatHandler> ChatBroadcastClass;
var UnrealChatHandler ChatBroadcastHandler;

simulated function DisplayDebug(Canvas Canvas, out float YL, out float YPos)
{
    local int i, j;
    local array<VoiceChatRoom> Rooms;
    local array<PlayerReplicationInfo> Members;
    local string TeamString;

    Canvas.SetDrawColor(byte(255), 220, 100, 230);
    Canvas.DrawText("VOICECHAT | bPrivateChat:" $ string(bPrivateChat));
    Rooms = GetChannels();
    i = 0;
    J0x5D:

    // End:0x30C [Loop If]
    if(i < Rooms.Length)
    {
        YPos += YL;
        Canvas.SetPos(4.0000000, YPos);
        // End:0x2D8
        if(Rooms[i] != none)
        {
            Members = Rooms[i].GetMembers();
            Canvas.DrawText(((((((((((((" Name:" @ Rooms[i].GetTitle()) @ "Members:") $ string(Members.Length)) @ "  Index:") $ string(Rooms[i].ChannelIndex)) @ " Team:") $ Class'Engine.TeamInfo'.default.ColorNames[Rooms[i].GetTeam()]) @ " Mask:") $ string(Rooms[i].GetMask())) @ " P:") $ string(Rooms[i].IsPublicChannel())) @ " T:") $ string(Rooms[i].IsTeamChannel()));
            j = 0;
            J0x1BD:

            // End:0x2D5 [Loop If]
            if(j < Members.Length)
            {
                YPos += YL;
                Canvas.SetPos(4.0000000, YPos);
                // End:0x21B
                if(Members[j].Team == none)
                {
                    TeamString = "None";                    
                }
                else
                {
                    TeamString = Class'Engine.TeamInfo'.default.ColorNames[Members[j].Team.TeamIndex];
                }
                Canvas.DrawText((((((("          " $ Members[j].PlayerName) @ "ID:") $ string(Members[j].PlayerID)) @ "Mask:") $ string(Members[j].VoiceID)) @ "Team:") $ TeamString);
                j++;
                // [Loop Continue]
                goto J0x1BD;
            }
            // [Explicit Continue]
            goto J0x302;
        }
        Canvas.DrawText(("CHANNEL" @ string(i)) @ "IS NONE!");
        J0x302:

        i++;
        // [Loop Continue]
        goto J0x5D;
    }
    YPos += YL;
    Canvas.SetPos(4.0000000, YPos);
    //return;    
}

event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x22
    if(ChatBroadcastClass != none)
    {
        ChatBroadcastHandler = Spawn(ChatBroadcastClass);        
    }
    else
    {
        ChatBroadcastHandler = Spawn(Class'UnrealGame_Decompressed.UnrealChatHandler');
    }
    // End:0x73
    if(Level.Game.BroadcastHandler != none)
    {
        Level.Game.BroadcastHandler.RegisterBroadcastHandler(ChatBroadcastHandler);
    }
    //return;    
}

simulated event PostNetBeginPlay()
{
    local PlayerReplicationInfo PRI;

    Log(string(Name) @ "___________________PostNetBeginPlay", 'VoiceChat');
    super.PostNetBeginPlay();
    // End:0x5C
    foreach DynamicActors(Class'Engine.PlayerReplicationInfo', PRI)
    {
        PRI.VoiceInfo = self;        
    }    
    //return;    
}

simulated event SetGRI(GameReplicationInfo NewGRI)
{
    GRI = NewGRI;
    GRI.VoiceReplicationInfo = self;
    //return;    
}

simulated function InitChannels()
{
    local VoiceChatRoom VCR;

    super.InitChannels();
    AddVoiceChannel();
    // End:0x32
    if(bAllowLocalBroadcast)
    {
        VCR = AddVoiceChannel();
        VCR.bLocal = true;
    }
    //return;    
}

simulated function AddVoiceChatter(PlayerReplicationInfo NewPRI)
{
    // End:0x46
    if(NewPRI == none)
    {
        Log("AddVoiceChatter() not executing: NewPRI is NONE!", 'VoiceChat');
        return;
    }
    // End:0xAC
    if(((!bEnableVoiceChat || NewPRI.bOnlySpectator) || NewPRI.bBot) || (NewPRI.Owner != none) && UnrealPlayer(NewPRI.Owner) == none)
    {
        return;
    }
    Log((("AddVoiceChatter:" $ string(NewPRI)) @ NewPRI.PlayerName) @ string(NewPRI.VoiceID), 'VoiceChat');
    AddVoiceChannel(NewPRI);
    //return;    
}

simulated function RemoveVoiceChatter(PlayerReplicationInfo PRI)
{
    local PlayerController PC;

    // End:0x0D
    if(PRI == none)
    {
        return;
    }
    Log(("RemoveVoiceChatter:" $ string(PRI)) @ PRI.PlayerName, 'VoiceChat');
    // End:0xAE
    if(int(Role) < int(ROLE_Authority))
    {
        PC = Level.GetLocalPlayerController();
        // End:0xAE
        if((PC != none) && PC.ChatManager != none)
        {
            PC.ChatManager.UnTrackPlayer(PRI.PlayerID);
        }
    }
    RemoveVoiceChannel(PRI);
    //return;    
}

simulated function bool CanJoinChannel(string ChannelTitle, PlayerReplicationInfo PRI)
{
    local VoiceChatRoom VCR;
    local int i;

    // End:0x3E
    if((PRI != none) && PRI.Team != none)
    {
        i = PRI.Team.TeamIndex;
    }
    VCR = GetChannel(ChannelTitle, i);
    // End:0x61
    if(VCR == none)
    {
        return false;
    }
    return VCR.CanJoinChannel(PRI);
    //return;    
}

function VoiceChatRoom.EJoinChatResult JoinChannel(string ChannelTitle, PlayerReplicationInfo PRI, string Password)
{
    local VoiceChatRoom VCR;
    local int i;

    // End:0x3E
    if((PRI != none) && PRI.Team != none)
    {
        i = PRI.Team.TeamIndex;
    }
    VCR = GetChannel(ChannelTitle, i);
    // End:0x62
    if(VCR == none)
    {
        return 0;
    }
    return VCR.JoinChannel(PRI, Password);
    //return;    
}

function VoiceChatRoom.EJoinChatResult JoinChannelAt(int ChannelIndex, PlayerReplicationInfo PRI, string Password)
{
    local VoiceChatRoom VCR;

    VCR = GetChannelAt(ChannelIndex);
    // End:0x1F
    if(VCR == none)
    {
        return 0;
    }
    return VCR.JoinChannel(PRI, Password);
    //return;    
}

function bool LeaveChannel(string ChannelTitle, PlayerReplicationInfo PRI)
{
    local VoiceChatRoom VCR;
    local int i;

    // End:0x3E
    if((PRI != none) && PRI.Team != none)
    {
        i = PRI.Team.TeamIndex;
    }
    VCR = GetChannel(ChannelTitle, i);
    return VCR.LeaveChannel(PRI);
    //return;    
}

simulated function VoiceChatRoom AddVoiceChannel(optional PlayerReplicationInfo PRI)
{
    local int i, cnt;
    local VoiceChatRoom VCR;

    Log((string(Name) @ "AddVoiceChannel PRI:") $ string(PRI), 'VoiceChat');
    VCR = CreateNewVoiceChannel(PRI);
    // End:0x15C
    if(VCR != none)
    {
        VCR.VoiceChatManager = self;
        i = Channels.Length;
        cnt = GetPublicChannelCount();
        // End:0x95
        if(PRI == none)
        {
            VCR.ChannelIndex = i;            
        }
        else
        {
            VCR.ChannelIndex = cnt + PRI.PlayerID;
            PRI.PrivateChatRoom = VCR;
            VCR.AddMember(PRI);
        }
        i = 0;
        J0xE8:

        // End:0x13F [Loop If]
        if(i < Channels.Length)
        {
            // End:0x135
            if((Channels[i] != none) && Channels[i].ChannelIndex > VCR.ChannelIndex)
            {
                // [Explicit Break]
                goto J0x13F;
            }
            i++;
            // [Loop Continue]
            goto J0xE8;
        }
        J0x13F:

        Channels.Insert(i, 1);
        Channels[i] = VCR;
    }
    return VCR;
    //return;    
}

simulated function bool RemoveVoiceChannel(PlayerReplicationInfo PRI)
{
    local VoiceChatRoom VCR;
    local int i;

    // End:0x31
    if((PRI != none) && int(Role) == int(ROLE_Authority))
    {
        PRI.ActiveChannel = -1;
    }
    i = Channels.Length - 1;
    J0x40:

    // End:0xCD [Loop If]
    if(i >= 0)
    {
        // End:0xB7
        if(Channels[i] != none)
        {
            // End:0x9A
            if(Channels[i].Owner == PRI)
            {
                VCR = Channels[i];
                Channels.Remove(i, 1);                
            }
            else
            {
                Channels[i].RemoveMember(PRI);
            }
            // [Explicit Continue]
            goto J0xC3;
        }
        Channels.Remove(i, 1);
        J0xC3:

        i--;
        // [Loop Continue]
        goto J0x40;
    }
    // End:0xE4
    if(VCR == none)
    {
        return super.RemoveVoiceChannel(PRI);
    }
    DestroyVoiceChannel(VCR);
    return super.RemoveVoiceChannel(PRI);
    //return;    
}

simulated function VoiceChatRoom GetChannel(string ChatRoomName, optional int TeamIndex)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x7B [Loop If]
    if(i < Channels.Length)
    {
        // End:0x71
        if(((Channels[i] != none) && Channels[i].GetTitle() ~= ChatRoomName) && Channels[i].Owner != none)
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

simulated function VoiceChatRoom GetChannelAt(int Index)
{
    local int i;

    // End:0x0D
    if(Index < 0)
    {
        return none;
    }
    i = 0;
    J0x14:

    // End:0x87 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x7D
        if(((Channels[i] != none) && Channels[i].ChannelIndex == Index) && Channels[i].Owner != none)
        {
            return Channels[i];
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    return super.GetChannelAt(Index);
    //return;    
}

simulated function array<int> GetChannelMembers(string ChatRoomName, optional int TeamIndex)
{
    local VoiceChatRoom Room;
    local array<PlayerReplicationInfo> Members;
    local array<int> MemberIds;
    local int i;

    Room = GetChannel(ChatRoomName, TeamIndex);
    // End:0x95
    if(Room != none)
    {
        Members = Room.GetMembers();
        MemberIds.Length = Members.Length;
        i = 0;
        J0x4A:

        // End:0x95 [Loop If]
        if(i < Members.Length)
        {
            // End:0x8B
            if(Members[i] != none)
            {
                MemberIds[i] = Members[i].PlayerID;
            }
            i++;
            // [Loop Continue]
            goto J0x4A;
        }
    }
    return MemberIds;
    //return;    
}

simulated function array<int> GetChannelMembersAt(int Index)
{
    local VoiceChatRoom Room;
    local array<PlayerReplicationInfo> Members;
    local array<int> MemberIds;
    local int i;

    Room = GetChannelAt(Index);
    // End:0x90
    if(Room != none)
    {
        Members = Room.GetMembers();
        MemberIds.Length = Members.Length;
        i = 0;
        J0x45:

        // End:0x90 [Loop If]
        if(i < Members.Length)
        {
            // End:0x86
            if(Members[i] != none)
            {
                MemberIds[i] = Members[i].PlayerID;
            }
            i++;
            // [Loop Continue]
            goto J0x45;
        }
    }
    return MemberIds;
    //return;    
}

simulated function array<int> GetMemberChannels(PlayerReplicationInfo PRI)
{
    local array<int> ChannelIndexArray;
    local int i;

    i = 0;
    J0x07:

    // End:0x72 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x68
        if((Channels[i] != none) && Channels[i].IsMember(PRI))
        {
            ChannelIndexArray[ChannelIndexArray.Length] = Channels[i].ChannelIndex;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return ChannelIndexArray;
    //return;    
}

simulated function array<VoiceChatRoom> GetChannels()
{
    return Channels;
    //return;    
}

simulated event int GetChannelCount()
{
    return Channels.Length;
    //return;    
}

simulated event int GetChannelIndex(string ChannelTitle, optional int TeamIndex)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x68 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x5E
        if((Channels[i] != none) && Channels[i].GetTitle() ~= ChannelTitle)
        {
            return Channels[i].ChannelIndex;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return super.GetChannelIndex(ChannelTitle, TeamIndex);
    //return;    
}

simulated function array<VoiceChatRoom> GetPublicChannels()
{
    local array<VoiceChatRoom> Rooms;
    local int i;

    i = 0;
    J0x07:

    // End:0x66 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x5C
        if((Channels[i] != none) && Channels[i].Owner == self)
        {
            Rooms[Rooms.Length] = Channels[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return Rooms;
    //return;    
}

simulated function array<VoiceChatRoom> GetPlayerChannels()
{
    local array<VoiceChatRoom> Rooms;
    local int i;

    i = 0;
    J0x07:

    // End:0x82 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x78
        if(((Channels[i] != none) && Channels[i].Owner != none) && Channels[i].Owner != self)
        {
            Rooms[Rooms.Length] = Channels[i];
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return Rooms;
    //return;    
}

simulated function int GetPublicChannelCount(optional bool bSingleTeam)
{
    local int i, cnt;

    i = 0;
    J0x07:

    // End:0x7F [Loop If]
    if(i < Channels.Length)
    {
        // End:0x75
        if(((Channels[i] != none) && Channels[i].Owner == self) && (Channels[i].GetTeam() == 0) || !bSingleTeam)
        {
            cnt++;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return cnt;
    //return;    
}

simulated function int GetPlayerChannelCount()
{
    local array<VoiceChatRoom> Arr;

    Arr = GetPlayerChannels();
    return Arr.Length;
    //return;    
}

simulated function bool IsMember(PlayerReplicationInfo TestPRI, int ChannelIndex, optional bool bNoCascade)
{
    local VoiceChatRoom VCR;

    // End:0x0D
    if(TestPRI == none)
    {
        return false;
    }
    VCR = GetChannelAt(ChannelIndex);
    // End:0x2B
    if(VCR == none)
    {
        return false;
    }
    return VCR.IsMember(TestPRI, bNoCascade);
    //return;    
}

protected simulated function VoiceChatRoom CreateNewVoiceChannel(optional PlayerReplicationInfo PRI)
{
    local int i;

    // End:0x15
    if(PRI == none)
    {
        return Spawn(ChatRoomClass, self);
    }
    i = 0;
    J0x1C:

    // End:0x60 [Loop If]
    if(i < Channels.Length)
    {
        // End:0x56
        if(Channels[i].Owner == PRI)
        {
            return super.CreateNewVoiceChannel(PRI);
        }
        i++;
        // [Loop Continue]
        goto J0x1C;
    }
    return Spawn(ChatRoomClass, PRI);
    //return;    
}

protected simulated function DestroyVoiceChannel(VoiceChatRoom Channel)
{
    // End:0x1F
    if(Channel != none)
    {
        Channel.Destroy();
        bRefresh = true;
    }
    //return;    
}

defaultproperties
{
    ChatBroadcastClass=Class'UnrealGame_Decompressed.UnrealChatHandler'
    ChatRoomClass=Class'UnrealGame_Decompressed.UnrealChatRoom'
    DefaultChannel=1
}