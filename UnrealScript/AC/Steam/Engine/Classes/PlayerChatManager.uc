/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\PlayerChatManager.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:19
 *
 *******************************************************************************/
class PlayerChatManager extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    native
    notplaceable;

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
}

simulated function ReceiveBanInfo(string S);
simulated function TrackNewPlayer(int PlayerID, string PlayerHash, string PlayerAddress);
simulated function UnTrackPlayer(int PlayerID);
function bool AcceptText(PlayerReplicationInfo Sender, out string Msg, optional name Type)
{
    return true;
}

function bool AcceptLocalized(Actor Sender, class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object obj)
{
    return true;
}

function bool AcceptSpeech(PlayerReplicationInfo Sender)
{
    return true;
}

event bool AcceptVoice(PlayerReplicationInfo Sender)
{
    return true;
}

simulated function bool SetRestriction(string PlayerHash, byte Type)
{
    return true;
}

simulated function bool SetRestrictionID(int PlayerID, byte Type)
{
    return true;
}

simulated function bool AddRestriction(string PlayerHash, byte Type)
{
    return true;
}

simulated function bool AddRestrictionID(int PlayerID, byte Type)
{
    return true;
}

simulated function bool ClearRestriction(string PlayerHash, byte Type)
{
    return true;
}

simulated function bool ClearRestrictionID(int PlayerID, byte Type)
{
    return true;
}

function bool IsBanned(PlayerReplicationInfo PRI)
{
    return false;
}

simulated function bool ClientIsBanned(string PlayerHash)
{
    return false;
}

simulated function byte GetPlayerRestriction(int PlayerID)
{
    return 0;
}

simulated function int Count();
simulated function ChatDebug();

defaultproperties
{
    RemoteRole=2
}