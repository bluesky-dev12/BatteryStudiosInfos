/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\UnrealChatRoom.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:23
 *
 *******************************************************************************/
class UnrealChatRoom extends VoiceChatRoom
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated function SetGRI(GameReplicationInfo InGRI)
{
    GRI = InGRI;
}

simulated event Timer()
{
    // End:0x2c
    if(Owner == none)
    {
        // End:0x27
        if(VoiceChatManager != none)
        {
            VoiceChatManager.bRefresh = true;
        }
        Destroy();
        return;
    }
}

simulated event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x26
    if(GRI == none)
    {
        // End:0x25
        foreach DynamicActors(class'GameReplicationInfo', GRI)
        {
            // End:0x25
            break;                        
        }
    }
    SetTimer(1.0, true);
}

simulated function int GetMask()
{
    // End:0x20
    if(IsPrivateChannel())
    {
        return PlayerReplicationInfo(Owner).VoiceMemberMask;
    }
    // End:0x46
    else
    {
        // End:0x46
        if(VoiceChatReplicationInfo(Owner) != none)
        {
            return VoiceChatReplicationInfo(Owner).GetMask(self);
        }
    }
    return super.GetMask();
}

simulated function string GetTitle()
{
    // End:0x20
    if(IsPrivateChannel())
    {
        return PlayerReplicationInfo(Owner).PlayerName;
    }
    // End:0x46
    else
    {
        // End:0x46
        if(VoiceChatReplicationInfo(Owner) != none)
        {
            return VoiceChatReplicationInfo(Owner).GetTitle(self);
        }
    }
    return super.GetTitle();
}

simulated function int GetTeam()
{
    // End:0x49
    if(IsPrivateChannel())
    {
        // End:0x29
        if(PlayerReplicationInfo(Owner).Team == none)
        {
            return super.GetTeam();
        }
        return PlayerReplicationInfo(Owner).Team.TeamIndex;
    }
    // End:0x60
    else
    {
        // End:0x60
        if(VoiceChatReplicationInfo(Owner) != none)
        {
            return super.GetTeam();
        }
    }
}

simulated function string GetPassword()
{
    return Password;
}

simulated function array<PlayerReplicationInfo> GetMembers()
{
    local array<PlayerReplicationInfo> PRIArray;
    local int i;

    // End:0x7e
    if(GRI != none && ValidMask())
    {
        i = 0;
        J0x1d:
        // End:0x7e [While If]
        if(i < GRI.PRIArray.Length)
        {
            // End:0x74
            if(IsMember(GRI.PRIArray[i]))
            {
                PRIArray[PRIArray.Length] = GRI.PRIArray[i];
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x1d;
        }
    }
    return PRIArray;
}

simulated function bool IsPublicChannel()
{
    return ChannelIndex != default.ChannelIndex && ChannelIndex < 2;
}

simulated function bool IsPrivateChannel()
{
    return PlayerReplicationInfo(Owner) != none;
}

simulated function int Count()
{
    local int i, X, MemberMask;

    // End:0x0d
    if(!ValidMask())
    {
        return 0;
    }
    MemberMask = GetMask();
    i = 0;
    J0x20:
    // End:0x51 [While If]
    if(i < 32)
    {
        // End:0x47
        if(bool(MemberMask & 1 << i))
        {
            ++ X;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x20;
    }
    return X;
}

simulated function bool IsFull()
{
    return GetMaxChatters() > 0 && Count() >= GetMaxChatters();
}

simulated event bool IsMember(PlayerReplicationInfo PRI, optional bool bNoCascade)
{
    // End:0x6b
    if(Level.Game != none && Level.Game.bLargeGameVOIP)
    {
        // End:0x6b
        if(PRI.Team != none && PRI.Team.TeamIndex == GetTeam())
        {
            return true;
        }
    }
    // End:0x81
    if(super.IsMember(PRI, bNoCascade))
    {
        return true;
    }
    // End:0x8e
    if(!ValidMask())
    {
        return false;
    }
    // End:0xb4
    if(PRI == none || PRI.VoiceID == 255)
    {
        return false;
    }
    return bool(GetMask() & 1 << PRI.VoiceID);
}

simulated function bool CanJoinChannel(PlayerReplicationInfo PRI)
{
    // End:0x46
    if(PRI == none)
    {
        Log(GetTitle() @ "CanJoinChannel PRI: None returning false", 'VoiceChat');
        return false;
    }
    // End:0xa6
    if(Owner == none)
    {
        Log(GetTitle() @ "CanJoinChannel PRI:" $ PRI.PlayerName @ "Owner: None returning false", 'VoiceChat');
        return false;
    }
    // End:0xd8
    if(IsPrivateChannel())
    {
        return PlayerReplicationInfo(Owner).bOnlySpectator == PRI.bOnlySpectator;
    }
    // End:0xec
    else
    {
        // End:0xec
        if(PRI.bOnlySpectator)
        {
            return false;
        }
    }
    return super.CanJoinChannel(PRI);
}

function Engine.VoiceChatRoom.EJoinChatResult JoinChannel(PlayerReplicationInfo NewPRI, string InPassword)
{
    local string str;

    // End:0xa4
    if(NewPRI != none)
    {
        // End:0x41
        if(NewPRI.Team != none)
        {
            str = string(NewPRI.Team.TeamIndex);
        }
        // End:0x50
        else
        {
            str = "No Team";
        }
        Log(NewPRI.PlayerName $ "(" $ str $ ") joined channel" @ GetTitle() $ "(" $ string(GetTeam()) $ ")", 'VoiceChat');
    }
    // End:0xca
    else
    {
        Log("Invalid player joined" @ GetTitle(), 'VoiceChat');
    }
    // End:0xdc
    if(NewPRI == Owner)
    {
        return 1;
    }
    // End:0xed
    if(IsMember(NewPRI))
    {
        return 1;
    }
    str = GetPassword();
    // End:0x126
    if(str != "")
    {
        // End:0x114
        if(InPassword == "")
        {
            return 2;
        }
        // End:0x126
        if(InPassword != str)
        {
            return 3;
        }
    }
    // End:0x137
    if(IsBanned(NewPRI))
    {
        return 4;
    }
    // End:0x143
    if(IsFull())
    {
        return 5;
    }
    // End:0x180
    if(NewPRI.bOnlySpectator && !IsPrivateChannel() || !PlayerReplicationInfo(Owner).bOnlySpectator)
    {
        return 6;
    }
    return super.JoinChannel(NewPRI, Password);
}

function bool LeaveChannel(PlayerReplicationInfo LeavingPRI)
{
    // End:0x11
    if(LeavingPRI == Owner)
    {
        return false;
    }
    // End:0x24
    if(!IsMember(LeavingPRI, true))
    {
        return false;
    }
    return super.LeaveChannel(LeavingPRI);
}

function AddMember(PlayerReplicationInfo PRI)
{
    local int i;
    local array<PlayerReplicationInfo> Members;

    // End:0x10
    if(IsMember(PRI))
    {
        return;
    }
    // End:0x36
    if(PRI == none || PRI.VoiceID >= 32)
    {
        return;
    }
    // End:0xdd
    if(Level.NetMode != 3)
    {
        Members = GetMembers();
        i = 0;
        J0x62:
        // End:0xdd [While If]
        if(i < Members.Length)
        {
            // End:0xd3
            if(Members[i] != none && PlayerController(Members[i].Owner) != none)
            {
                PlayerController(Members[i].Owner).ChatRoomMessage(11, ChannelIndex, PRI);
            }
            ++ i;
            // This is an implied JumpToken; Continue!
            goto J0x62;
        }
    }
    SetMask(GetMask() | 1 << PRI.VoiceID);
    super.AddMember(PRI);
}

function RemoveMember(PlayerReplicationInfo PRI)
{
    local array<PlayerReplicationInfo> Members;
    local int i;

    // End:0xff
    if(PRI != none && PRI.VoiceID < 32 && IsMember(PRI, true))
    {
        SetMask(GetMask() & ~1 << PRI.VoiceID);
        // End:0xff
        if(Level.NetMode != 3)
        {
            Members = GetMembers();
            i = 0;
            J0x84:
            // End:0xff [While If]
            if(i < Members.Length)
            {
                // End:0xf5
                if(Members[i] != none && PlayerController(Members[i].Owner) != none)
                {
                    PlayerController(Members[i].Owner).ChatRoomMessage(12, ChannelIndex, PRI);
                }
                ++ i;
                // This is an implied JumpToken; Continue!
                goto J0x84;
            }
        }
    }
    super.RemoveMember(PRI);
}

function bool IsBanned(PlayerReplicationInfo PRI)
{
    // End:0x5e
    if(PRI == none || PlayerReplicationInfo(Owner) == none || PlayerController(Owner.Owner) == none || PlayerController(Owner.Owner).ChatManager == none)
    {
        return false;
    }
    return PlayerController(Owner.Owner).ChatManager.IsBanned(PRI);
}

function SetTeam(int NewTeam)
{
    // End:0x12
    if(VoiceChatReplicationInfo(Owner) == none)
    {
        return;
    }
    super.SetTeam(NewTeam);
}

function SetMask(int NewMask)
{
    // End:0x0d
    if(Owner == none)
    {
        return;
    }
    // End:0x32
    if(IsPrivateChannel())
    {
        PlayerReplicationInfo(Owner).SetVoiceMemberMask(NewMask);
    }
    // End:0x4c
    else
    {
        VoiceChatReplicationInfo(Owner).SetMask(self, NewMask);
    }
}

simulated function bool AddChild(VoiceChatRoom NewChild)
{
    local int i;

    // End:0x0d
    if(NewChild == none)
    {
        return false;
    }
    i = 0;
    J0x14:
    // End:0x45 [While If]
    if(i < Children.Length)
    {
        // End:0x3b
        if(Children[i] == NewChild)
        {
            return false;
        }
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
    NewChild.Parent = self;
    Children[Children.Length] = NewChild;
    return super.AddChild(NewChild);
}

simulated function bool RemoveChild(VoiceChatRoom Child)
{
    local int i;

    i = Children.Length - 1;
    J0x0f:
    // End:0x67 [While If]
    if(i >= 0)
    {
        // End:0x3a
        if(Children[i] == none)
        {
            Children.Remove(i, 1);
        }
        // End:0x5d
        else
        {
            // End:0x5d
            if(Children[i] == Child)
            {
                Children.Remove(i, 1);
                return true;
            }
        }
        -- i;
        // This is an implied JumpToken; Continue!
        goto J0x0f;
    }
    return super.RemoveChild(Child);
}
