/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UnrealVoiceReplicationInfo.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:28
 *
 *******************************************************************************/
class UnrealVoiceReplicationInfo extends VoiceChatReplicationInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() class<UnrealChatHandler> ChatBroadcastClass;
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
    J0x5d:
    // End:0x30c [While If]
    if(i < Rooms.Length)
    {
        YPos += YL;
        Canvas.SetPos(4.0, YPos);
        // End:0x2d8
        if(Rooms[i] != none)
        {
            Members = Rooms[i].GetMembers();
            Canvas.DrawText(" Name:" @ Rooms[i].GetTitle() @ "Members:" $ string(Members.Length) @ "  Index:" $ string(Rooms[i].ChannelIndex) @ " Team:" $ class'TeamInfo'.default.ColorNames[Rooms[i].GetTeam()] @ " Mask:" $ string(Rooms[i].GetMask()) @ " P:" $ string(Rooms[i].IsPublicChannel()) @ " T:" $ string(Rooms[i].IsTeamChannel()));
            j = 0;
            J0x1bd:
            // End:0x2d5 [While If]
            if(j < Members.Length)
            {
                YPos += YL;
                Canvas.SetPos(4.0, YPos);
                // End:0x21b
                if(Members[j].Team == none)
                {
                    TeamString = "None";
                }
                // End:0x24d
                else
                {
                    TeamString = class'TeamInfo'.default.ColorNames[Members[j].Team.TeamIndex];
                }
                Canvas.DrawText("          " $ Members[j].PlayerName @ "ID:" $ string(Members[j].PlayerID) @ "Mask:" $ string(Members[j].VoiceID) @ "Team:" $ TeamString);
                ++ j;
                // This is an implied JumpToken; Continue!
                goto J0x1bd;
            }
        }
        // End:0x302
        else
        {
            Canvas.DrawText("CHANNEL" @ string(i) @ "IS NONE!");
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x5d;
    }
    YPos += YL;
    Canvas.SetPos(4.0, YPos);
}

event PostBeginPlay()
{
    super.PostBeginPlay();
    // End:0x22
    if(ChatBroadcastClass != none)
    {
        ChatBroadcastHandler = Spawn(ChatBroadcastClass);
    }
    // End:0x30
    else
    {
        ChatBroadcastHandler = Spawn(class'UnrealChatHandler');
    }
    // End:0x73
    if(Level.Game.BroadcastHandler != none)
    {
        Level.Game.BroadcastHandler.RegisterBroadcastHandler(ChatBroadcastHandler);
    }
}

simulated event PostNetBeginPlay()
{
    local PlayerReplicationInfo PRI;

    Log(string(Name) @ "___________________PostNetBeginPlay", 'VoiceChat');
    super.PostNetBeginPlay();
    // End:0x5c
    foreach DynamicActors(class'PlayerReplicationInfo', PRI)
    {
        PRI.VoiceInfo = self;                
    }
}

simulated event SetGRI(GameReplicationInfo NewGRI)
{
    GRI = NewGRI;
    GRI.VoiceReplicationInfo = self;
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
}

simulated function AddVoiceChatter(PlayerReplicationInfo NewPRI)
{
    // End:0x46
    if(NewPRI == none)
    {
        Log("AddVoiceChatter() not executing: NewPRI is NONE!", 'VoiceChat');
        return;
    }
    // End:0xac
    if(!bEnableVoiceChat || NewPRI.bOnlySpectator || NewPRI.bBot || NewPRI.Owner != none && UnrealPlayer(NewPRI.Owner) == none)
    {
        return;
    }
    Log("AddVoiceChatter:" $ string(NewPRI) @ NewPRI.PlayerName @ string(NewPRI.VoiceID), 'VoiceChat');
    AddVoiceChannel(NewPRI);
}

simulated function RemoveVoiceChatter(PlayerReplicationInfo PRI)
{
    local PlayerController PC;

    // End:0x0d
    if(PRI == none)
    {
        return;
    }
    Log("RemoveVoiceChatter:" $ string(PRI) @ PRI.PlayerName, 'VoiceChat');
    // End:0xae
    if(Role < 4)
    {
        PC = Level.GetLocalPlayerController();
        // End:0xae
        if(PC != none && PC.ChatManager != none)
        {
            PC.ChatManager.UnTrackPlayer(PRI.PlayerID);
        }
    }
    RemoveVoiceChannel(PRI);
}

simulated function bool CanJoinChannel(string ChannelTitle, PlayerReplicationInfo PRI)
{
    local VoiceChatRoom VCR;
    local int i;

    // End:0x3e
    if(PRI != none && PRI.Team != none)
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
}

function Engine.VoiceChatRoom.EJoinChatResult JoinChannel(string ChannelTitle, PlayerReplicationInfo PRI, string Password)
{
    local VoiceChatRoom VCR;
    local int i;

    // End:0x3e
    if(PRI != none && PRI.Team != none)
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
}

function Engine.VoiceChatRoom.EJoinChatResult JoinChannelAt(int ChannelIndex, PlayerReplicationInfo PRI, string Password)
{
    local VoiceChatRoom VCR;

    VCR = GetChannelAt(ChannelIndex);
    // End:0x1f
    if(VCR == none)
    {
        return 0;
    }
    return VCR.JoinChannel(PRI, Password);
}

function bool LeaveChannel(string ChannelTitle, PlayerReplicationInfo PRI)
{
    local VoiceChatRoom VCR;
    local int i;

    // End:0x3e
    if(PRI != none && PRI.Team != none)
    {
        i = PRI.Team.TeamIndex;
    }
    VCR = GetChannel(ChannelTitle, i);
    return VCR.LeaveChannel(PRI);
}

simulated function VoiceChatRoom AddVoiceChannel(optional PlayerReplicationInfo PRI)
{
    local int i, cnt;
    local VoiceChatRoom VCR;

    Log(string(Name) @ "AddVoiceChannel PRI:" $ string(PRI), 'VoiceChat');
    VCR = CreateNewVoiceChannel(PRI);
    // End:0x15c
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
        // End:0xe1
        else
        {
            VCR.ChannelIndex = cnt + PRI.PlayerID;
            PRI.PrivateChatRoom = VCR;
            VCR.AddMember(PRI);
        }
        i = 0;
        J0xe8:
        // End:0x13f [While If]
        if(i < Channels.Length)
        {
            // End:0x135
            if(Channels[i] != none && Channels[i].ChannelIndex > VCR.ChannelIndex)
            {
            }
            // End:0x13f
            else
            {
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0xe8;
            }
        }
        Channels.Insert(i, 1);
        Channels[i] = VCR;
    }
    return VCR;
}

simulated function bool RemoveVoiceChannel(PlayerReplicationInfo PRI)
{
    local VoiceChatRoom VCR;
    local int i;

    // End:0x31
    if(PRI != none && Role == 4)
    {
        PRI.ActiveChannel = -1;
    }
    i = Channels.Length - 1;
    J0x40:
    // End:0xcd [While If]
    if(i >= 0)
    {
        // End:0xb7
        if(Channels[i] != none)
        {
            // End:0x9a
            if(Channels[i].Owner == PRI)
            {
                VCR = Channels[i];
                Channels.Remove(i, 1);
            }
            // End:0xb4
            else
            {
                Channels[i].RemoveMember(PRI);
            }
        }
        // End:0xc3
        else
        {
            Channels.Remove(i, 1);
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x40;
    }
    // End:0xe4
    if(VCR == none)
    {
        return super.RemoveVoiceChannel(PRI);
    }
    DestroyVoiceChannel(VCR);
    return super.RemoveVoiceChannel(PRI);
}

simulated function VoiceChatRoom GetChannel(string ChatRoomName, optional int TeamIndex)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x7b [While If]
    if(i < Channels.Length)
    {
        // End:0x71
        if(Channels[i] != none && Channels[i].GetTitle() ~= ChatRoomName && Channels[i].Owner != none)
        {
            return Channels[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return super.GetChannel(ChatRoomName, TeamIndex);
}

simulated function VoiceChatRoom GetChannelAt(int Index)
{
    local int i;

    // End:0x0d
    if(Index < 0)
    {
        return none;
    }
    i = 0;
    J0x14:
    // End:0x87 [While If]
    if(i < Channels.Length)
    {
        // End:0x7d
        if(Channels[i] != none && Channels[i].ChannelIndex == Index && Channels[i].Owner != none)
        {
            return Channels[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    return super.GetChannelAt(Index);
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
        J0x4a:
        // End:0x95 [While If]
        if(i < Members.Length)
        {
            // End:0x8b
            if(Members[i] != none)
            {
                MemberIds[i] = Members[i].PlayerID;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x4a;
        }
    }
    return MemberIds;
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
        // End:0x90 [While If]
        if(i < Members.Length)
        {
            // End:0x86
            if(Members[i] != none)
            {
                MemberIds[i] = Members[i].PlayerID;
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x45;
        }
    }
    return MemberIds;
}

simulated function array<int> GetMemberChannels(PlayerReplicationInfo PRI)
{
    local array<int> ChannelIndexArray;
    local int i;

    i = 0;
    J0x07:
    // End:0x72 [While If]
    if(i < Channels.Length)
    {
        // End:0x68
        if(Channels[i] != none && Channels[i].IsMember(PRI))
        {
            ChannelIndexArray[ChannelIndexArray.Length] = Channels[i].ChannelIndex;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return ChannelIndexArray;
}

simulated function array<VoiceChatRoom> GetChannels()
{
    return Channels;
}

simulated event int GetChannelCount()
{
    return Channels.Length;
}

simulated event int GetChannelIndex(string ChannelTitle, optional int TeamIndex)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x68 [While If]
    if(i < Channels.Length)
    {
        // End:0x5e
        if(Channels[i] != none && Channels[i].GetTitle() ~= ChannelTitle)
        {
            return Channels[i].ChannelIndex;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return super.GetChannelIndex(ChannelTitle, TeamIndex);
}

simulated function array<VoiceChatRoom> GetPublicChannels()
{
    local array<VoiceChatRoom> Rooms;
    local int i;

    i = 0;
    J0x07:
    // End:0x66 [While If]
    if(i < Channels.Length)
    {
        // End:0x5c
        if(Channels[i] != none && Channels[i].Owner == self)
        {
            Rooms[Rooms.Length] = Channels[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return Rooms;
}

simulated function array<VoiceChatRoom> GetPlayerChannels()
{
    local array<VoiceChatRoom> Rooms;
    local int i;

    i = 0;
    J0x07:
    // End:0x82 [While If]
    if(i < Channels.Length)
    {
        // End:0x78
        if(Channels[i] != none && Channels[i].Owner != none && Channels[i].Owner != self)
        {
            Rooms[Rooms.Length] = Channels[i];
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return Rooms;
}

simulated function int GetPublicChannelCount(optional bool bSingleTeam)
{
    local int i, cnt;

    i = 0;
    J0x07:
    // End:0x7f [While If]
    if(i < Channels.Length)
    {
        // End:0x75
        if(Channels[i] != none && Channels[i].Owner == self && Channels[i].GetTeam() == 0 || !bSingleTeam)
        {
            ++ cnt;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return cnt;
}

simulated function int GetPlayerChannelCount()
{
    local array<VoiceChatRoom> Arr;

    Arr = GetPlayerChannels();
    return Arr.Length;
}

simulated function bool IsMember(PlayerReplicationInfo TestPRI, int ChannelIndex, optional bool bNoCascade)
{
    local VoiceChatRoom VCR;

    // End:0x0d
    if(TestPRI == none)
    {
        return false;
    }
    VCR = GetChannelAt(ChannelIndex);
    // End:0x2b
    if(VCR == none)
    {
        return false;
    }
    return VCR.IsMember(TestPRI, bNoCascade);
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
    J0x1c:
    // End:0x60 [While If]
    if(i < Channels.Length)
    {
        // End:0x56
        if(Channels[i].Owner == PRI)
        {
            return super.CreateNewVoiceChannel(PRI);
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x1c;
    }
    return Spawn(ChatRoomClass, PRI);
}

protected simulated function DestroyVoiceChannel(VoiceChatRoom Channel)
{
    // End:0x1f
    if(Channel != none)
    {
        Channel.Destroy();
        bRefresh = true;
    }
}

defaultproperties
{
    ChatBroadcastClass=class'UnrealChatHandler'
    ChatRoomClass=class'UnrealChatRoom'
    DefaultChannel=1
}