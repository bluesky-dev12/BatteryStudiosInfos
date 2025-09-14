/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\VoiceChatReplicationInfo.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Structs:1
 *	Properties:20
 *	Functions:38
 *
 *******************************************************************************/
class VoiceChatReplicationInfo extends ReplicationInfo
    dependson(ReplicationInfo)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    nativereplication
    abstract
    notplaceable;

const NUMPROPS = 6;

struct native VoiceChatCodec
{
    var string Codec;
    var localized string CodecName;
    var localized string CodecDescription;
};

var int PublicMask;
var int LocalMask;
var array<VoiceChatRoom> Channels;
var localized array<localized string> PublicChannelNames;
var localized string VCDisplayText[6];
var localized string VCDescText[6];
var GameReplicationInfo GRI;
var class<VoiceChatRoom> ChatRoomClass;
var array<VoiceChatCodec> InstalledCodec;
var array<string> VoIPInternetCodecs;
var array<string> VoIPLANCodecs;
var bool bEnableVoiceChat;
var bool bAllowLocalBroadcast;
var int MaxChatters;
var int DefaultChannel;
var float LocalBroadcastRange;
var float DefaultBroadcastRadius;
var float BroadcastRadius;
var bool bPrivateChat;
var bool bRefresh;

replication
{
    // Pos:0x00
    reliable if(Role == 4 && bNetInitial)
        bEnableVoiceChat;

    // Pos:0x18
    reliable if(Role == 4 && bNetInitial && bEnableVoiceChat)
        bPrivateChat;

    // Pos:0x3b
    reliable if(Role == 4 && bNetInitial && bEnableVoiceChat && bAllowLocalBroadcast)
        BroadcastRadius;

    // Pos:0x69
    reliable if(Role == 4 && bNetDirty && bEnableVoiceChat)
        PublicMask, LocalMask;

    // Pos:0x8c
    reliable if(Role == 4 && bNetInitial || bNetDirty && bEnableVoiceChat)
        DefaultChannel;

}

event Timer()
{
    // End:0x0f
    if(bRefresh)
    {
        CheckChannels();
    }
}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x2d
    if(bAllowLocalBroadcast)
    {
        BroadcastRadius = FMin(LocalBroadcastRange, FClamp(DefaultBroadcastRadius, 10.0, 1000.0));
    }
}

simulated event PostNetBeginPlay()
{
    // End:0x18
    if(bEnableVoiceChat)
    {
        InitChannels();
        SetTimer(1.0, true);
    }
}

simulated function InitChannels();
simulated function AddVoiceChatter(PlayerReplicationInfo NewPRI);
simulated function RemoveVoiceChatter(PlayerReplicationInfo PRI);
simulated function bool CanJoinChannel(string ChannelTitle, PlayerReplicationInfo PRI)
{
    return true;
}

function VoiceChatRoom.EJoinChatResult JoinChannel(string ChannelTitle, PlayerReplicationInfo PRI, string Password)
{
    return 0;
}

function VoiceChatRoom.EJoinChatResult JoinChannelAt(int ChannelIndex, PlayerReplicationInfo PRI, string Password)
{
    return 0;
}

function bool LeaveChannel(string ChannelTitle, PlayerReplicationInfo PRI)
{
    return true;
}

simulated function VoiceChatRoom AddVoiceChannel(optional PlayerReplicationInfo PRI)
{
    return none;
}

simulated function bool RemoveVoiceChannel(PlayerReplicationInfo PRI)
{
    return true;
}

simulated function NotifyTeamChange(PlayerReplicationInfo PRI, int TeamIndex);
simulated event int GetChannelCount()
{
    return 0;
}

simulated event int GetChannelIndex(string ChannelTitle, optional int TeamIndex)
{
    return -1;
}

simulated function VoiceChatRoom GetChannel(string ChatRoomName, optional int TeamIndex)
{
    return none;
}

simulated function VoiceChatRoom GetChannelAt(int Index)
{
    return none;
}

simulated function array<int> GetChannelMembers(string ChatRoomName, optional int TeamIndex);
simulated function array<int> GetChannelMembersAt(int Index);
simulated function array<int> GetMemberChannels(PlayerReplicationInfo PRI);
simulated function string GetDefaultChannel()
{
    return PublicChannelNames[Clamp(DefaultChannel, 0, PublicChannelNames.Length - 1)];
}

simulated function array<VoiceChatRoom> GetChannels();
simulated function array<VoiceChatRoom> GetPublicChannels();
simulated function array<VoiceChatRoom> GetPlayerChannels();
simulated function int GetPublicChannelCount(optional bool bSingleTeam);
simulated function int GetPlayerChannelCount();
simulated function bool IsMember(PlayerReplicationInfo TestPRI, int ChannelIndex, optional bool bNoCascade)
{
    return false;
}

protected simulated function VoiceChatRoom CreateNewVoiceChannel(optional PlayerReplicationInfo PRI)
{
    return none;
}

protected simulated function DestroyVoiceChannel(VoiceChatRoom Channel);
private simulated function CheckChannels()
{
    local int i;

    i = Channels.Length - 1;
    J0x0f:
    // End:0x41 [While If]
    if(i >= 0)
    {
        // End:0x37
        if(Channels[i] == none)
        {
            Channels.Remove(i, 1);
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    bRefresh = false;
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super(Info).FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.ChatGroup, "bEnableVoiceChat", default.VCDisplayText[0], 250, 1, "Check",, "Xv", true, true);
    PlayInfo.AddSetting(default.ChatGroup, "bAllowLocalBroadcast", default.VCDisplayText[1], 250, 1, "Check",, "Xv", true, true);
    PlayInfo.AddSetting(default.ChatGroup, "LocalBroadcastRange", default.VCDisplayText[2], 100, 1, "Text", "4;10:3000", "Xv", true, true);
    PlayInfo.AddSetting(default.ChatGroup, "DefaultBroadcastRadius", default.VCDisplayText[3], 100, 1, "Text", "4;10:1000", "Xv", true, true);
    PlayInfo.AddSetting(default.ChatGroup, "VoIPInternetCodecs", default.VCDisplayText[4], 254, 1, "Text",, "Xv", true, true);
    PlayInfo.AddSetting(default.ChatGroup, "VoIPLANCodecs", default.VCDisplayText[5], 254, 1, "Text",, "Xv", true, true);
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x24
        case "bEnableVoiceChat":
            return default.VCDescText[0];
        // End:0x45
        case "bAllowLocalBroadcast":
            return default.VCDescText[1];
        // End:0x66
        case "LocalBroadcastRange":
            return default.VCDescText[2];
        // End:0x8a
        case "DefaultBroadcastRadius":
            return default.VCDescText[3];
        // End:0xaa
        case "VoIPInternetCodecs":
            return default.VCDescText[4];
        // End:0xc5
        case "VoIPLANCodecs":
            return default.VCDescText[5];
        // End:0xffff
        default:
            return super(Info).GetDescriptionText(PropName);
    }
}

static function GetInstalledCodecs(out array<string> Codecs)
{
    local int i;

    Codecs.Length = default.InstalledCodec.Length;
    i = 0;
    J0x14:
    // End:0x4a [While If]
    if(i < default.InstalledCodec.Length)
    {
        Codecs[i] = default.InstalledCodec[i].Codec;
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

static function bool GetCodecInfo(string Codec, out string CodecName, out string CodecDescription)
{
    local int i;

    i = 0;
    J0x07:
    // End:0x69 [While If]
    if(i < default.InstalledCodec.Length)
    {
        // End:0x5f
        if(Codec ~= default.InstalledCodec[i].Codec)
        {
            CodecName = default.InstalledCodec[i].CodecName;
            CodecDescription = default.InstalledCodec[i].CodecDescription;
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x07;
    }
    return false;
}

simulated function bool ValidRoom(VoiceChatRoom Room)
{
    return bEnableVoiceChat && Room != none && Room.ChannelIndex < 2 && Room.Owner == self;
}

function SetMask(VoiceChatRoom Room, int NewMask)
{
    // End:0x12
    if(!ValidRoom(Room))
    {
        return;
    }
    // End:0x34
    if(Room.ChannelIndex == 0)
    {
        PublicMask = NewMask;
    }
    // End:0x53
    else
    {
        // End:0x53
        if(Room.ChannelIndex == 1)
        {
            LocalMask = NewMask;
        }
    }
}

simulated function int GetMask(VoiceChatRoom Room)
{
    // End:0x12
    if(!ValidRoom(Room))
    {
        return 0;
    }
    // End:0x2c
    if(Room.ChannelIndex == 0)
    {
        return PublicMask;
    }
    // End:0x46
    if(Room.ChannelIndex == 1)
    {
        return LocalMask;
    }
    return 0;
}

simulated function string GetTitle(VoiceChatRoom Room)
{
    // End:0x13
    if(!ValidRoom(Room))
    {
        return "";
    }
    return PublicChannelNames[Room.ChannelIndex];
}

defaultproperties
{
    PublicChannelNames=// Object reference not set to an instance of an object.
    
    VCDisplayText[0]="Voice Channel Available"
    VCDisplayText[1]="Prox. Chat Available"
    VCDisplayText[2]="Prox. Channel Column"
    VCDisplayText[3]="Prox. Channel Radius"
    VCDisplayText[4]="VoIP Codec"
    VCDisplayText[5]="VoIP LAN Codec"
    VCDescText[0]="This server supports voice chat."
    VCDescText[1]="This server supports proximity chat."
    VCDescText[2]="Maximum distance at which a broadcast on the local channel may be heard"
    VCDescText[3]="Set the codec used by the server for internet games."
    VCDescText[4]="Set the codec used by the server for LAN games."
    VCDescText[5]="Set the codec used for LAN games."
    ChatRoomClass=class'VoiceChatRoom'
    InstalledCodec=// Object reference not set to an instance of an object.
    
    VoIPInternetCodecs=// Object reference not set to an instance of an object.
    
    VoIPLANCodecs=// Object reference not set to an instance of an object.
    
    LocalBroadcastRange=1000.0
    DefaultBroadcastRadius=20.0
    NetPriority=3.0010
}