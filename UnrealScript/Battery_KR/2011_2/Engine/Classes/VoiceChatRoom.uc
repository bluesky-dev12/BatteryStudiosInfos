class VoiceChatRoom extends Info
    abstract
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

enum EJoinChatResult
{
    JCR_Invalid,                    // 0
    JCR_Member,                     // 1
    JCR_NeedPassword,               // 2
    JCR_WrongPassword,              // 3
    JCR_Banned,                     // 4
    JCR_Full,                       // 5
    JCR_NotAllowed,                 // 6
    JCR_Success                     // 7
};

var GameReplicationInfo GRI;
var VoiceChatReplicationInfo VoiceChatManager;
var VoiceChatRoom Parent;
var array<VoiceChatRoom> Children;
var string Password;
var int ChannelIndex;
var bool bLocal;
var private int TeamIndex;

simulated function array<PlayerReplicationInfo> GetMembers()
{
    //return;    
}

simulated function int GetMaxChatters()
{
    return VoiceChatManager.MaxChatters;
    //return;    
}

simulated function int GetMask()
{
    return 0;
    //return;    
}

simulated function string GetPassword()
{
    return "";
    //return;    
}

simulated function bool ValidMask()
{
    return (GetMask()) > 0;
    //return;    
}

simulated function string GetTitle()
{
    return "";
    //return;    
}

simulated function int GetTeam()
{
    return TeamIndex;
    //return;    
}

simulated function bool IsPublicChannel()
{
    return true;
    //return;    
}

simulated function bool IsTeamChannel()
{
    return false;
    //return;    
}

simulated function bool IsPrivateChannel()
{
    return false;
    //return;    
}

simulated function bool CanJoinChannel(PlayerReplicationInfo PRI)
{
    return true;
    //return;    
}

simulated function bool IsFull()
{
    return false;
    //return;    
}

simulated event bool IsMember(PlayerReplicationInfo PRI, optional bool bNoCascade)
{
    local int i;

    // End:0x0B
    if(bNoCascade)
    {
        return false;
    }
    i = 0;
    J0x12:

    // End:0x5E [Loop If]
    if(i < Children.Length)
    {
        // End:0x54
        if((Children[i] != none) && Children[i].IsMember(PRI))
        {
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x12;
    }
    return false;
    //return;    
}

function VoiceChatRoom.EJoinChatResult JoinChannel(PlayerReplicationInfo NewPRI, string InPassword)
{
    return 7;
    //return;    
}

function bool LeaveChannel(PlayerReplicationInfo LeavingPRI)
{
    return true;
    //return;    
}

function AddMember(PlayerReplicationInfo PRI)
{
    //return;    
}

function RemoveMember(PlayerReplicationInfo PRI)
{
    //return;    
}

simulated function SetTeam(int NewTeam)
{
    TeamIndex = NewTeam;
    //return;    
}

simulated function SetMemberMask(int NewMask)
{
    //return;    
}

simulated function SetChannelPassword(string InPassword)
{
    Password = InPassword;
    //return;    
}

simulated function bool AddChild(VoiceChatRoom NewChild)
{
    return true;
    //return;    
}

simulated function bool RemoveChild(VoiceChatRoom Child)
{
    return false;
    //return;    
}

simulated function bool NotifyTeamChange(PlayerReplicationInfo PRI, int NewTeamIndex)
{
    return false;
    //return;    
}

defaultproperties
{
    ChannelIndex=-1
    TeamIndex=255
}