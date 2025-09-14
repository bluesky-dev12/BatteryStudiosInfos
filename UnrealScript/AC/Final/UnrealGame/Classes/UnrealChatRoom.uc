class UnrealChatRoom extends VoiceChatRoom
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

simulated function SetGRI(GameReplicationInfo InGRI)
{
    GRI = InGRI;
    //return;    
}

simulated event Timer()
{
    // End:0x2C
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
    //return;    
}

simulated event PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x26
    if(GRI == none)
    {
        // End:0x25
        foreach DynamicActors(Class'Engine.GameReplicationInfo', GRI)
        {
            // End:0x25
            break;            
        }        
    }
    SetTimer(1.0000000, true);
    //return;    
}

simulated function int GetMask()
{
    // End:0x20
    if(IsPrivateChannel())
    {
        return PlayerReplicationInfo(Owner).VoiceMemberMask;        
    }
    else
    {
        // End:0x46
        if(VoiceChatReplicationInfo(Owner) != none)
        {
            return VoiceChatReplicationInfo(Owner).GetMask(self);
        }
    }
    return super.GetMask();
    //return;    
}

simulated function string GetTitle()
{
    // End:0x20
    if(IsPrivateChannel())
    {
        return PlayerReplicationInfo(Owner).PlayerName;        
    }
    else
    {
        // End:0x46
        if(VoiceChatReplicationInfo(Owner) != none)
        {
            return VoiceChatReplicationInfo(Owner).GetTitle(self);
        }
    }
    return super.GetTitle();
    //return;    
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
    else
    {
        // End:0x60
        if(VoiceChatReplicationInfo(Owner) != none)
        {
            return super.GetTeam();
        }
    }
    //return;    
}

simulated function string GetPassword()
{
    return Password;
    //return;    
}

simulated function array<PlayerReplicationInfo> GetMembers()
{
    local array<PlayerReplicationInfo> PRIArray;
    local int i;

    // End:0x7E
    if((GRI != none) && ValidMask())
    {
        i = 0;
        J0x1D:

        // End:0x7E [Loop If]
        if(i < GRI.PRIArray.Length)
        {
            // End:0x74
            if(IsMember(GRI.PRIArray[i]))
            {
                PRIArray[PRIArray.Length] = GRI.PRIArray[i];
            }
            i++;
            // [Loop Continue]
            goto J0x1D;
        }
    }
    return PRIArray;
    //return;    
}

simulated function bool IsPublicChannel()
{
    return (ChannelIndex != default.ChannelIndex) && ChannelIndex < 2;
    //return;    
}

simulated function bool IsPrivateChannel()
{
    return PlayerReplicationInfo(Owner) != none;
    //return;    
}

simulated function int Count()
{
    local int i, X, MemberMask;

    // End:0x0D
    if(!ValidMask())
    {
        return 0;
    }
    MemberMask = GetMask();
    i = 0;
    J0x20:

    // End:0x51 [Loop If]
    if(i < 32)
    {
        // End:0x47
        if(bool(MemberMask & (1 << i)))
        {
            X++;
        }
        i++;
        // [Loop Continue]
        goto J0x20;
    }
    return X;
    //return;    
}

simulated function bool IsFull()
{
    return ((GetMaxChatters()) > 0) && (Count()) >= (GetMaxChatters());
    //return;    
}

simulated event bool IsMember(PlayerReplicationInfo PRI, optional bool bNoCascade)
{
    // End:0x6B
    if((Level.Game != none) && Level.Game.bLargeGameVOIP)
    {
        // End:0x6B
        if((PRI.Team != none) && PRI.Team.TeamIndex == (GetTeam()))
        {
            return true;
        }
    }
    // End:0x81
    if(super.IsMember(PRI, bNoCascade))
    {
        return true;
    }
    // End:0x8E
    if(!ValidMask())
    {
        return false;
    }
    // End:0xB4
    if((PRI == none) || int(PRI.VoiceID) == 255)
    {
        return false;
    }
    return bool((GetMask()) & (1 << int(PRI.VoiceID)));
    //return;    
}

simulated function bool CanJoinChannel(PlayerReplicationInfo PRI)
{
    // End:0x46
    if(PRI == none)
    {
        Log((GetTitle()) @ "CanJoinChannel PRI: None returning false", 'VoiceChat');
        return false;
    }
    // End:0xA6
    if(Owner == none)
    {
        Log((((GetTitle()) @ "CanJoinChannel PRI:") $ PRI.PlayerName) @ "Owner: None returning false", 'VoiceChat');
        return false;
    }
    // End:0xD8
    if(IsPrivateChannel())
    {
        return PlayerReplicationInfo(Owner).bOnlySpectator == PRI.bOnlySpectator;        
    }
    else
    {
        // End:0xEC
        if(PRI.bOnlySpectator)
        {
            return false;
        }
    }
    return super.CanJoinChannel(PRI);
    //return;    
}

function VoiceChatRoom.EJoinChatResult JoinChannel(PlayerReplicationInfo NewPRI, string InPassword)
{
    local string str;

    // End:0xA4
    if(NewPRI != none)
    {
        // End:0x41
        if(NewPRI.Team != none)
        {
            str = string(NewPRI.Team.TeamIndex);            
        }
        else
        {
            str = "No Team";
        }
        Log(((((((NewPRI.PlayerName $ "(") $ str) $ ") joined channel") @ (GetTitle())) $ "(") $ string(GetTeam())) $ ")", 'VoiceChat');        
    }
    else
    {
        Log("Invalid player joined" @ (GetTitle()), 'VoiceChat');
    }
    // End:0xDC
    if(NewPRI == Owner)
    {
        return 1;
    }
    // End:0xED
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
    //return;    
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
    //return;    
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
    if((PRI == none) || int(PRI.VoiceID) >= 32)
    {
        return;
    }
    // End:0xDD
    if(int(Level.NetMode) != int(NM_Client))
    {
        Members = GetMembers();
        i = 0;
        J0x62:

        // End:0xDD [Loop If]
        if(i < Members.Length)
        {
            // End:0xD3
            if((Members[i] != none) && PlayerController(Members[i].Owner) != none)
            {
                PlayerController(Members[i].Owner).ChatRoomMessage(11, ChannelIndex, PRI);
            }
            i++;
            // [Loop Continue]
            goto J0x62;
        }
    }
    SetMask((GetMask()) | (1 << int(PRI.VoiceID)));
    super.AddMember(PRI);
    //return;    
}

function RemoveMember(PlayerReplicationInfo PRI)
{
    local array<PlayerReplicationInfo> Members;
    local int i;

    // End:0xFF
    if(((PRI != none) && int(PRI.VoiceID) < 32) && IsMember(PRI, true))
    {
        SetMask((GetMask()) & ~1 << int(PRI.VoiceID));
        // End:0xFF
        if(int(Level.NetMode) != int(NM_Client))
        {
            Members = GetMembers();
            i = 0;
            J0x84:

            // End:0xFF [Loop If]
            if(i < Members.Length)
            {
                // End:0xF5
                if((Members[i] != none) && PlayerController(Members[i].Owner) != none)
                {
                    PlayerController(Members[i].Owner).ChatRoomMessage(12, ChannelIndex, PRI);
                }
                i++;
                // [Loop Continue]
                goto J0x84;
            }
        }
    }
    super.RemoveMember(PRI);
    //return;    
}

function bool IsBanned(PlayerReplicationInfo PRI)
{
    // End:0x5E
    if((((PRI == none) || PlayerReplicationInfo(Owner) == none) || PlayerController(Owner.Owner) == none) || PlayerController(Owner.Owner).ChatManager == none)
    {
        return false;
    }
    return PlayerController(Owner.Owner).ChatManager.IsBanned(PRI);
    //return;    
}

function SetTeam(int NewTeam)
{
    // End:0x12
    if(VoiceChatReplicationInfo(Owner) == none)
    {
        return;
    }
    super.SetTeam(NewTeam);
    //return;    
}

function SetMask(int NewMask)
{
    // End:0x0D
    if(Owner == none)
    {
        return;
    }
    // End:0x32
    if(IsPrivateChannel())
    {
        PlayerReplicationInfo(Owner).SetVoiceMemberMask(NewMask);        
    }
    else
    {
        VoiceChatReplicationInfo(Owner).SetMask(self, NewMask);
    }
    //return;    
}

simulated function bool AddChild(VoiceChatRoom NewChild)
{
    local int i;

    // End:0x0D
    if(NewChild == none)
    {
        return false;
    }
    i = 0;
    J0x14:

    // End:0x45 [Loop If]
    if(i < Children.Length)
    {
        // End:0x3B
        if(Children[i] == NewChild)
        {
            return false;
        }
        i++;
        // [Loop Continue]
        goto J0x14;
    }
    NewChild.Parent = self;
    Children[Children.Length] = NewChild;
    return super.AddChild(NewChild);
    //return;    
}

simulated function bool RemoveChild(VoiceChatRoom Child)
{
    local int i;

    i = Children.Length - 1;
    J0x0F:

    // End:0x67 [Loop If]
    if(i >= 0)
    {
        // End:0x3A
        if(Children[i] == none)
        {
            Children.Remove(i, 1);
            // [Explicit Continue]
            goto J0x5D;
        }
        // End:0x5D
        if(Children[i] == Child)
        {
            Children.Remove(i, 1);
            return true;
        }
        J0x5D:

        i--;
        // [Loop Continue]
        goto J0x0F;
    }
    return super.RemoveChild(Child);
    //return;    
}
