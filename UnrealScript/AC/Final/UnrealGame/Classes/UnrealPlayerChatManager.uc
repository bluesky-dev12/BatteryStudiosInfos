class UnrealPlayerChatManager extends PlayerChatManager
    config(ChatRestriction)
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const NOTEXT = 1;
const NOSPEECH = 2;
const NOVOICE = 4;
const BANNED = 8;

struct StoredChatBan
{
    var string PlayerHash;
    var byte Restriction;
};

struct ChatBan
{
    var int PlayerID;
    var string PlayerHash;
    var string PlayerAddress;
    var byte PlayerVoiceMask;
    var byte Restriction;
};

var protected globalconfig array<StoredChatBan> StoredChatRestrictions;
var protected array<ChatBan> ChatRestrictions;

simulated function ChatDebug()
{
    local int i;

    i = 0;
    J0x07:

    // End:0x89 [Loop If]
    if(i < StoredChatRestrictions.Length)
    {
        Log((((("   StoredChatRestrictions[" $ string(i)) $ "] Hash:") $ StoredChatRestrictions[i].PlayerHash) @ "Restriction:") $ string(StoredChatRestrictions[i].Restriction));
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    i = 0;
    J0x90:

    // End:0xB5 [Loop If]
    if(i < ChatRestrictions.Length)
    {
        LogChatRestriction(i);
        i++;
        // [Loop Continue]
        goto J0x90;
    }
    //return;    
}

simulated function LogChatRestriction(int i)
{
    Log((((((((((("   ChatRestrictions[" $ string(i)) $ "] PlayerID:") $ string(ChatRestrictions[i].PlayerID)) @ "Hash:") $ ChatRestrictions[i].PlayerHash) @ "Address:") $ ChatRestrictions[i].PlayerAddress) @ "Mask:") $ string(ChatRestrictions[i].PlayerVoiceMask)) @ "Restriction:") $ string(ChatRestrictions[i].Restriction));
    //return;    
}

protected simulated function bool LoadChatBan(string PlayerHash, out byte OutRestriction)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x53 [Loop If]
    if(i < StoredChatRestrictions.Length)
    {
        // End:0x49
        if(StoredChatRestrictions[i].PlayerHash == PlayerHash)
        {
            OutRestriction = StoredChatRestrictions[i].Restriction;
            return true;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    return false;
    //return;    
}

protected simulated function StoreChatBan(string PlayerHash, byte Restriction)
{
    local int i;

    i = 0;
    J0x07:

    // End:0x3E [Loop If]
    if(i < StoredChatRestrictions.Length)
    {
        // End:0x34
        if(StoredChatRestrictions[i].PlayerHash == PlayerHash)
        {
            // [Explicit Break]
            goto J0x3E;
        }
        i++;
        // [Loop Continue]
        goto J0x07;
    }
    J0x3E:

    // End:0x6F
    if(i == StoredChatRestrictions.Length)
    {
        // End:0x5D
        if(int(Restriction) == 0)
        {
            return;
        }
        StoredChatRestrictions.Length = i + 1;        
    }
    else
    {
        // End:0x8A
        if(int(Restriction) == 0)
        {
            StoredChatRestrictions.Remove(i, 1);
            return;
        }
    }
    Log((("StoreChatBan PlayerHash:" $ PlayerHash) @ "Restriction:") $ string(Restriction), 'ChatManager');
    StoredChatRestrictions[i].PlayerHash = PlayerHash;
    StoredChatRestrictions[i].Restriction = Restriction;
    //return;    
}

simulated function ReceiveBanInfo(string S)
{
    local array<string> Arr;
    local int PlayerID;
    local string PlayerHash, PlayerAddress;

    Log((string(Name) @ "ReceiveBanInfo S:") $ S, 'ChatManager');
    Split(S, Chr(27), Arr);
    // End:0x87
    if(Arr.Length < 3)
    {
        Log(("Error receiving ban info Arr.Length:" $ string(Arr.Length)) @ S, 'ChatManager');
        return;
    }
    PlayerID = int(Arr[0]);
    PlayerHash = Arr[1];
    PlayerAddress = Arr[2];
    TrackNewPlayer(PlayerID, PlayerHash, PlayerAddress);
    //return;    
}

simulated function TrackNewPlayer(int PlayerID, string PlayerHash, string PlayerAddress)
{
    local int i;
    local PlayerReplicationInfo PRI;
    local byte NewRestriction;

    // End:0x50
    if(PlayerOwner == none)
    {
        Log(string(Name) @ "Couldn't update server tracking - No PlayerOwner!", 'ChatManager');
        return;
    }
    Log((((((string(Name) @ "___________________TrackNewPlayer PlayerID:") $ string(PlayerID)) @ "PlayerHash:") $ PlayerHash) @ "PlayerAddress:") $ PlayerAddress, 'ChatManager');
    i = 0;
    J0xCC:

    // End:0x103 [Loop If]
    if(i < ChatRestrictions.Length)
    {
        // End:0xF9
        if(ChatRestrictions[i].PlayerID == PlayerID)
        {
            // [Explicit Break]
            goto J0x103;
        }
        i++;
        // [Loop Continue]
        goto J0xCC;
    }
    J0x103:

    // End:0x123
    if(i == ChatRestrictions.Length)
    {
        ChatRestrictions.Length = ChatRestrictions.Length + 1;
    }
    // End:0x164
    if((int(Role) < int(ROLE_Authority)) && LoadChatBan(PlayerHash, NewRestriction))
    {
        PlayerOwner.ServerChatRestriction(PlayerID, NewRestriction);        
    }
    else
    {
        // End:0x1A8
        if((int(Level.NetMode) == int(NM_ListenServer)) && PlayerOwner == Level.GetLocalPlayerController())
        {
            LoadChatBan(PlayerHash, NewRestriction);
        }
    }
    ChatRestrictions[i].PlayerID = PlayerID;
    ChatRestrictions[i].PlayerHash = PlayerHash;
    ChatRestrictions[i].PlayerAddress = PlayerAddress;
    ChatRestrictions[i].Restriction = NewRestriction;
    PRI = PlayerOwner.GameReplicationInfo.FindPlayerByID(PlayerID);
    // End:0x24D
    if(PRI != none)
    {
        ChatRestrictions[i].PlayerVoiceMask = PRI.VoiceID;
    }
    //return;    
}

simulated function UnTrackPlayer(int PlayerID)
{
    local int i;

    Log("Untrack player:" $ string(PlayerID), 'ChatManager');
    i = 0;
    J0x28:

    // End:0x6A [Loop If]
    if(i < ChatRestrictions.Length)
    {
        // End:0x60
        if(ChatRestrictions[i].PlayerID == PlayerID)
        {
            ChatRestrictions.Remove(i, 1);
            return;
        }
        i++;
        // [Loop Continue]
        goto J0x28;
    }
    Log("Untrack player couldn't find restriction for PlayerID:" $ string(PlayerID), 'ChatManager');
    //return;    
}

function bool AcceptText(PlayerReplicationInfo Sender, out string Msg, optional name Type)
{
    local int i;

    // End:0x21
    if(Sender == none)
    {
        return super.AcceptText(Sender, Msg, Type);
    }
    i = GetIDIndex(Sender.PlayerID);
    // End:0x4D
    if(!IsValid(i))
    {
        return true;
    }
    Log((((((string(Name) @ "Owner:") $ PlayerOwner.PlayerReplicationInfo.PlayerName) @ "Restriction for Index ") $ string(i)) $ ":") $ string(ChatRestrictions[i].Restriction), 'ChatManager');
    return !bool(int(ChatRestrictions[i].Restriction) & 1);
    //return;    
}

function bool AcceptSpeech(PlayerReplicationInfo SenderPRI)
{
    local int i;

    // End:0x17
    if(SenderPRI == none)
    {
        return super.AcceptSpeech(SenderPRI);
    }
    i = GetIDIndex(SenderPRI.PlayerID);
    // End:0x43
    if(!IsValid(i))
    {
        return true;
    }
    return !bool(int(ChatRestrictions[i].Restriction) & 2);
    //return;    
}

event bool AcceptVoice(PlayerReplicationInfo SenderPRI)
{
    local int i;

    // End:0x17
    if(SenderPRI == none)
    {
        return super.AcceptVoice(SenderPRI);
    }
    i = GetIDIndex(SenderPRI.PlayerID);
    // End:0x43
    if(!IsValid(i))
    {
        return true;
    }
    return !bool(int(ChatRestrictions[i].Restriction) & 4);
    //return;    
}

function bool IsBanned(PlayerReplicationInfo PRI)
{
    local int i;
    local string PlayerHash;

    PlayerHash = PlayerController(PRI.Owner).GetPlayerIDHash();
    Log((string(Name) @ "IsBanned() PRI:") $ string(PRI.Name), 'ChatManager');
    i = 0;
    J0x5D:

    // End:0x11D [Loop If]
    if(i < ChatRestrictions.Length)
    {
        // End:0x113
        if(ChatRestrictions[i].PlayerHash == PlayerHash)
        {
            Log((((((string(Name) @ "IsBanned() found matching PlayerHash for") @ PlayerHash) $ ":") $ string(i)) @ "Restriction:") $ string(ChatRestrictions[i].Restriction), 'ChatManager');
            return bool(int(ChatRestrictions[i].Restriction) & 8);
        }
        i++;
        // [Loop Continue]
        goto J0x5D;
    }
    return super.IsBanned(PRI);
    //return;    
}

simulated function bool SetRestriction(string PlayerHash, byte Type)
{
    local int i;

    i = GetHashIndex(PlayerHash);
    Log((((((string(Name) @ "SetRestriction PlayerHash:") $ PlayerHash) @ "i:") $ string(i)) @ "Type:") $ string(Type), 'ChatManager');
    // End:0xA2
    if(!IsValid(i))
    {
        // End:0x84
        if(int(Type) == 0)
        {
            return false;
        }
        i = ChatRestrictions.Length;
        ChatRestrictions.Length = i + 1;        
    }
    else
    {
        // End:0xC2
        if(int(ChatRestrictions[i].Restriction) == int(Type))
        {
            return false;
        }
    }
    ChatRestrictions[i].Restriction = Type;
    // End:0xF4
    if(IsLocal())
    {
        StoreChatBan(PlayerHash, Type);
        SaveConfig();
    }
    return true;
    //return;    
}

simulated function bool SetRestrictionID(int PlayerID, byte Type)
{
    local string PlayerHash;

    Log((((string(Name) @ "SetRestrictionID PlayerID:") $ string(PlayerID)) @ "Type:") $ string(Type), 'ChatManager');
    PlayerHash = GetPlayerHash(PlayerID);
    // End:0x66
    if(PlayerHash == "")
    {
        return false;
    }
    return SetRestriction(PlayerHash, Type);
    //return;    
}

simulated function bool AddRestriction(string PlayerHash, byte Type)
{
    return MergeRestriction(GetHashIndex(PlayerHash), Type);
    //return;    
}

simulated function bool AddRestrictionID(int PlayerID, byte Type)
{
    return AddRestriction(GetPlayerHash(PlayerID), Type);
    //return;    
}

simulated function bool ClearRestriction(string PlayerHash, byte Type)
{
    return UnMergeRestriction(GetHashIndex(PlayerHash), Type);
    //return;    
}

simulated function bool ClearRestrictionID(int PlayerID, byte Type)
{
    return ClearRestriction(GetPlayerHash(PlayerID), Type);
    //return;    
}

simulated function bool MergeRestriction(int Index, byte NewType)
{
    // End:0x12
    if(!IsValid(Index))
    {
        return false;
    }
    ChatRestrictions[Index].Restriction = byte(int(ChatRestrictions[Index].Restriction) & ~int(NewType));
    ChatRestrictions[Index].Restriction = byte(int(ChatRestrictions[Index].Restriction) | int(NewType));
    // End:0xA2
    if(IsLocal())
    {
        StoreChatBan(ChatRestrictions[Index].PlayerHash, ChatRestrictions[Index].Restriction);
        SaveConfig();
    }
    return true;
    //return;    
}

simulated function bool UnMergeRestriction(int Index, byte NewType)
{
    // End:0x12
    if(!IsValid(Index))
    {
        return false;
    }
    // End:0x36
    if(!bool(int(ChatRestrictions[Index].Restriction) & int(NewType)))
    {
        return false;
    }
    ChatRestrictions[Index].Restriction = byte(int(ChatRestrictions[Index].Restriction) & ~int(NewType));
    // End:0x98
    if(IsLocal())
    {
        StoreChatBan(ChatRestrictions[Index].PlayerHash, ChatRestrictions[Index].Restriction);
        SaveConfig();
    }
    return true;
    //return;    
}

simulated function byte GetPlayerRestriction(int PlayerID)
{
    local int i;

    i = GetIDIndex(PlayerID);
    // End:0x2D
    if(!IsValid(i))
    {
        return super.GetPlayerRestriction(PlayerID);
    }
    return ChatRestrictions[i].Restriction;
    //return;    
}

simulated function bool ClientIsBanned(string PlayerHash)
{
    local int i;

    // End:0x0E
    if(PlayerHash == "")
    {
        return true;
    }
    i = 0;
    J0x15:

    // End:0x62 [Loop If]
    if(i < ChatRestrictions.Length)
    {
        // End:0x58
        if(ChatRestrictions[i].PlayerHash == PlayerHash)
        {
            return bool(int(ChatRestrictions[i].Restriction) & 8);
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return super.ClientIsBanned(PlayerHash);
    //return;    
}

protected simulated function string GetPlayerHash(int PlayerID)
{
    local int i;

    // End:0x0E
    if(PlayerID < 1)
    {
        return "";
    }
    i = 0;
    J0x15:

    // End:0xB0 [Loop If]
    if(i < ChatRestrictions.Length)
    {
        Log((((((string(Name) @ "GetPlayerHash Match:") $ string(PlayerID)) @ "Test[") $ string(i)) $ "]:") $ string(ChatRestrictions[i].PlayerID));
        // End:0xA6
        if(ChatRestrictions[i].PlayerID == PlayerID)
        {
            return ChatRestrictions[i].PlayerHash;
        }
        i++;
        // [Loop Continue]
        goto J0x15;
    }
    return "";
    //return;    
}

protected simulated function int GetIDIndex(int PlayerID)
{
    local int i;

    // End:0x11
    if(PlayerID < 1)
    {
        return -1;
    }
    i = 0;
    J0x18:

    // End:0x52 [Loop If]
    if(i < ChatRestrictions.Length)
    {
        // End:0x48
        if(ChatRestrictions[i].PlayerID == PlayerID)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x18;
    }
    return -1;
    //return;    
}

protected simulated function int GetHashIndex(string PlayerHash)
{
    local int i;

    // End:0x12
    if(PlayerHash == "")
    {
        return -1;
    }
    i = 0;
    J0x19:

    // End:0x53 [Loop If]
    if(i < ChatRestrictions.Length)
    {
        // End:0x49
        if(ChatRestrictions[i].PlayerHash == PlayerHash)
        {
            return i;
        }
        i++;
        // [Loop Continue]
        goto J0x19;
    }
    return -1;
    //return;    
}

protected simulated function bool IsValid(int i)
{
    return (i >= 0) && i < ChatRestrictions.Length;
    //return;    
}

simulated function bool IsLocal()
{
    return (int(Level.NetMode) == int(NM_Client)) || ((int(Level.NetMode) == int(NM_ListenServer)) && PlayerOwner != none) && PlayerOwner == Level.GetLocalPlayerController();
    //return;    
}

simulated function int Count()
{
    return ChatRestrictions.Length;
    //return;    
}
