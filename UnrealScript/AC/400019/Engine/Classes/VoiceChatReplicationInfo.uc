class VoiceChatReplicationInfo extends ReplicationInfo
    abstract
    native
    nativereplication
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const NUMPROPS = 6;

struct native VoiceChatCodec
{
    var string Codec;
    var localized string CodecName;
    var localized string CodecDescription;
};

var int PublicMask;
var int LocalMask;
var protected array<VoiceChatRoom> Channels;
var localized array<localized string> PublicChannelNames;
var localized string VCDisplayText[6];
var localized string VCDescText[6];
var GameReplicationInfo GRI;
var Class<VoiceChatRoom> ChatRoomClass;
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
    // Pos:0x000
    reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
        bEnableVoiceChat;

    // Pos:0x018
    reliable if(((int(Role) == int(ROLE_Authority)) && bNetInitial) && bEnableVoiceChat)
        bPrivateChat;

    // Pos:0x03B
    reliable if((((int(Role) == int(ROLE_Authority)) && bNetInitial) && bEnableVoiceChat) && bAllowLocalBroadcast)
        BroadcastRadius;

    // Pos:0x069
    reliable if(((int(Role) == int(ROLE_Authority)) && bNetDirty) && bEnableVoiceChat)
        LocalMask, PublicMask;

    // Pos:0x08C
    reliable if(((int(Role) == int(ROLE_Authority)) && bNetInitial || bNetDirty) && bEnableVoiceChat)
        DefaultChannel;
}

event Timer()
{
    // End:0x0F
    if(bRefresh)
    {
        CheckChannels();
    }
    //return;    
}

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x2D
    if(bAllowLocalBroadcast)
    {
        BroadcastRadius = FMin(LocalBroadcastRange, FClamp(DefaultBroadcastRadius, 10.0000000, 1000.0000000));
    }
    //return;    
}

simulated event PostNetBeginPlay()
{
    // End:0x18
    if(bEnableVoiceChat)
    {
        InitChannels();
        SetTimer(1.0000000, true);
    }
    //return;    
}

simulated function InitChannels()
{
    //return;    
}

simulated function AddVoiceChatter(PlayerReplicationInfo NewPRI)
{
    //return;    
}

simulated function RemoveVoiceChatter(PlayerReplicationInfo PRI)
{
    //return;    
}

simulated function bool CanJoinChannel(string ChannelTitle, PlayerReplicationInfo PRI)
{
    return true;
    //return;    
}

function VoiceChatRoom.EJoinChatResult JoinChannel(string ChannelTitle, PlayerReplicationInfo PRI, string Password)
{
    return 0;
    //return;    
}

function VoiceChatRoom.EJoinChatResult JoinChannelAt(int ChannelIndex, PlayerReplicationInfo PRI, string Password)
{
    return 0;
    //return;    
}

function bool LeaveChannel(string ChannelTitle, PlayerReplicationInfo PRI)
{
    return true;
    //return;    
}

simulated function VoiceChatRoom AddVoiceChannel(optional PlayerReplicationInfo PRI)
{
    return none;
    //return;    
}

simulated function bool RemoveVoiceChannel(PlayerReplicationInfo PRI)
{
    return true;
    //return;    
}

simulated function NotifyTeamChange(PlayerReplicationInfo PRI, int TeamIndex)
{
    //return;    
}

simulated event int GetChannelCount()
{
    return 0;
    //return;    
}

simulated event int GetChannelIndex(string ChannelTitle, optional int TeamIndex)
{
    return -1;
    //return;    
}

simulated function VoiceChatRoom GetChannel(string ChatRoomName, optional int TeamIndex)
{
    return none;
    //return;    
}

simulated function VoiceChatRoom GetChannelAt(int Index)
{
    return none;
    //return;    
}

simulated function array<int> GetChannelMembers(string ChatRoomName, optional int TeamIndex)
{
    //return;    
}

simulated function array<int> GetChannelMembersAt(int Index)
{
    //return;    
}

simulated function array<int> GetMemberChannels(PlayerReplicationInfo PRI)
{
    //return;    
}

simulated function string GetDefaultChannel()
{
    return PublicChannelNames[Clamp(DefaultChannel, 0, PublicChannelNames.Length - 1)];
    //return;    
}

simulated function array<VoiceChatRoom> GetChannels()
{
    //return;    
}

simulated function array<VoiceChatRoom> GetPublicChannels()
{
    //return;    
}

simulated function array<VoiceChatRoom> GetPlayerChannels()
{
    //return;    
}

simulated function int GetPublicChannelCount(optional bool bSingleTeam)
{
    //return;    
}

simulated function int GetPlayerChannelCount()
{
    //return;    
}

simulated function bool IsMember(PlayerReplicationInfo TestPRI, int ChannelIndex, optional bool bNoCascade)
{
    return false;
    //return;    
}

protected simulated function VoiceChatRoom CreateNewVoiceChannel(optional PlayerReplicationInfo PRI)
{
    return none;
    //return;    
}

protected simulated function DestroyVoiceChannel(VoiceChatRoom Channel)
{
    //return;    
}

private simulated function CheckChannels()
{
    local int i;

    i = Channels.Length - 1;
    J0x0F:

    // End:0x41 [Loop If]
    if(i >= 0)
    {
        // End:0x37
        if(Channels[i] == none)
        {
            Channels.Remove(i, 1);
        }
        i--;
        // [Loop Continue]
        goto J0x0F;
    }
    bRefresh = false;
    //return;    
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
    //return;    
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
        // End:0x8A
        case "DefaultBroadcastRadius":
            return default.VCDescText[3];
        // End:0xAA
        case "VoIPInternetCodecs":
            return default.VCDescText[4];
        // End:0xC5
        case "VoIPLANCodecs":
            return default.VCDescText[5];
        // End:0xFFFF
        default:
            return super(Info).GetDescriptionText(PropName);
            break;
    }
    //return;    
}

static function GetInstalledCodecs(out array<string> Codecs)
{
    local int i;

    Codecs.Length = default.InstalledCodec.Length;
    i = 0;
    J0x14:

    // End:0x4A [Loop If]
    if(i < default.InstalledCodec.Length)
    {
        Codecs[i] = default.InstalledCodec[i].Codec;
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

static function bool GetCodecInfo(string Codec, out string CodecName, out string CodecDescription)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x69 [Loop If]
    if(i < default.InstalledCodec.Length)
    {
        // End:0x5F
        if(Codec ~= default.InstalledCodec[i].Codec)
        {
            CodecName = default.InstalledCodec[i].CodecName;
            CodecDescription = default.InstalledCodec[i].CodecDescription;
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

simulated function bool ValidRoom(VoiceChatRoom Room)
{
    return ((bEnableVoiceChat && Room != none) && Room.ChannelIndex < 2) && Room.Owner == self;
    //return;    
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
    else
    {
        // End:0x53
        if(Room.ChannelIndex == 1)
        {
            LocalMask = NewMask;
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
    // End:0x2C
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
    //return;    
}

simulated function string GetTitle(VoiceChatRoom Room)
{
    // End:0x13
    if(!ValidRoom(Room))
    {
        return "";
    }
    return PublicChannelNames[Room.ChannelIndex];
    //return;    
}

defaultproperties
{
    PublicChannelNames[0]="?? ??"
    PublicChannelNames[1]="?? ??"
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
    ChatRoomClass=Class'Engine.VoiceChatRoom'
    InstalledCodec[0]=(Codec="CODEC_48NB",CodecName="? ???",CodecDescription="(4.8kbps) - ???? ?? ?????. ???? ??? ????? ??? ?????.")
    InstalledCodec[1]=(Codec="CODEC_96WB",CodecName="???",CodecDescription="(9.6kbps) - ???? ? ?? ????? ???? ??? ? ???? ?? ? ?? ??? ?????.")
    VoIPInternetCodecs[0]="CODEC_48NB"
    VoIPLANCodecs[0]="CODEC_48NB"
    VoIPLANCodecs[1]="CODEC_96WB"
    LocalBroadcastRange=1000.0000000
    DefaultBroadcastRadius=20.0000000
    NetPriority=3.0009999
}