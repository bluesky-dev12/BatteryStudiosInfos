class PlayerChatManager extends Info
    native
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var PlayerController PlayerOwner;

event PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    // End:0x19
    if(PlayerController(Owner) == none)
    {
        Destroy();
    }
    // End:0x24
    if(bDeleteMe)
    {
        return;
    }
    PlayerOwner = PlayerController(Owner);
    //return;    
}

simulated function ReceiveBanInfo(string S)
{
    //return;    
}

simulated function TrackNewPlayer(int PlayerID, string PlayerHash, string PlayerAddress)
{
    //return;    
}

simulated function UnTrackPlayer(int PlayerID)
{
    //return;    
}

function bool AcceptText(PlayerReplicationInfo Sender, out string Msg, optional name Type)
{
    return true;
    //return;    
}

function bool AcceptLocalized(Actor Sender, Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object obj)
{
    return true;
    //return;    
}

function bool AcceptSpeech(PlayerReplicationInfo Sender)
{
    return true;
    //return;    
}

event bool AcceptVoice(PlayerReplicationInfo Sender)
{
    return true;
    //return;    
}

simulated function bool SetRestriction(string PlayerHash, byte Type)
{
    return true;
    //return;    
}

simulated function bool SetRestrictionID(int PlayerID, byte Type)
{
    return true;
    //return;    
}

simulated function bool AddRestriction(string PlayerHash, byte Type)
{
    return true;
    //return;    
}

simulated function bool AddRestrictionID(int PlayerID, byte Type)
{
    return true;
    //return;    
}

simulated function bool ClearRestriction(string PlayerHash, byte Type)
{
    return true;
    //return;    
}

simulated function bool ClearRestrictionID(int PlayerID, byte Type)
{
    return true;
    //return;    
}

function bool IsBanned(PlayerReplicationInfo PRI)
{
    return false;
    //return;    
}

simulated function bool ClientIsBanned(string PlayerHash)
{
    return false;
    //return;    
}

simulated function byte GetPlayerRestriction(int PlayerID)
{
    return 0;
    //return;    
}

simulated function int Count()
{
    //return;    
}

simulated function ChatDebug()
{
    //return;    
}

defaultproperties
{
    RemoteRole=2
}