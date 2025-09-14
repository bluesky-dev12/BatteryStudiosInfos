/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\VoiceChatRoom.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:8
 *	Functions:23
 *
 *******************************************************************************/
class VoiceChatRoom extends Info
    dependson(VoiceChatReplicationInfo)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    abstract
    notplaceable;

enum EJoinChatResult
{
    JCR_Invalid,
    JCR_Member,
    JCR_NeedPassword,
    JCR_WrongPassword,
    JCR_Banned,
    JCR_Full,
    JCR_NotAllowed,
    JCR_Success
};

var GameReplicationInfo GRI;
var VoiceChatReplicationInfo VoiceChatManager;
var VoiceChatRoom Parent;
var array<VoiceChatRoom> Children;
var string Password;
var int ChannelIndex;
var bool bLocal;
var private int TeamIndex;

simulated function array<PlayerReplicationInfo> GetMembers();
simulated function int GetMaxChatters()
{
    return VoiceChatManager.MaxChatters;
}

simulated function int GetMask()
{
    return 0;
}

simulated function string GetPassword()
{
    return "";
}

simulated function bool ValidMask()
{
    return GetMask() > 0;
}

simulated function string GetTitle()
{
    return "";
}

simulated function int GetTeam()
{
    return TeamIndex;
}

simulated function bool IsPublicChannel()
{
    return true;
}

simulated function bool IsTeamChannel()
{
    return false;
}

simulated function bool IsPrivateChannel()
{
    return false;
}

simulated function bool CanJoinChannel(PlayerReplicationInfo PRI)
{
    return true;
}

simulated function bool IsFull()
{
    return false;
}

simulated event bool IsMember(PlayerReplicationInfo PRI, optional bool bNoCascade)
{
    local int i;

    // End:0x0b
    if(bNoCascade)
    {
        return false;
    }
    i = 0;
    J0x12:
    // End:0x5e [While If]
    if(i < Children.Length)
    {
        // End:0x54
        if(Children[i] != none && Children[i].IsMember(PRI))
        {
            return true;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x12;
    }
    return false;
}

function VoiceChatRoom.EJoinChatResult JoinChannel(PlayerReplicationInfo NewPRI, string InPassword)
{
    return 7;
}

function bool LeaveChannel(PlayerReplicationInfo LeavingPRI)
{
    return true;
}

function AddMember(PlayerReplicationInfo PRI);
function RemoveMember(PlayerReplicationInfo PRI);
simulated function SetTeam(int NewTeam)
{
    TeamIndex = NewTeam;
}

simulated function SetMemberMask(int NewMask);
simulated function SetChannelPassword(string InPassword)
{
    Password = InPassword;
}

simulated function bool AddChild(VoiceChatRoom NewChild)
{
    return true;
}

simulated function bool RemoveChild(VoiceChatRoom Child)
{
    return false;
}

simulated function bool NotifyTeamChange(PlayerReplicationInfo PRI, int NewTeamIndex)
{
    return false;
}

defaultproperties
{
    ChannelIndex=-1
    TeamIndex=255
}