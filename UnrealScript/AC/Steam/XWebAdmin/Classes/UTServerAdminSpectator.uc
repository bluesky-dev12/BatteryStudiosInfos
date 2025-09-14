/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path XWebAdmin\Classes\UTServerAdminSpectator.uc
 * Package Imports:
 *	XWebAdmin
 *	Engine
 *	Core
 *
 * Stats:
 *	Structs:1
 *	Properties:9
 *	Functions:16
 *
 *******************************************************************************/
class UTServerAdminSpectator extends MessagingSpectator
    config(User);

struct PlayerMessage
{
    var PlayerReplicationInfo PRI;
    var string Text;
    var name Type;
    var PlayerMessage Next;
};

var array<string> Messages;
var byte NextMsg;
var byte LastMsg;
var config byte ReceivedMsgMax;
var config bool bClientMessages;
var config bool bTeamMessages;
var config bool bVoiceMessages;
var config bool bLocalizedMessages;
var UTServerAdmin Server;

function bool SetPause(bool bPause)
{
    Log("Webadmin spectator executing SetPause:" $ string(bPause));
    return super(PlayerController).SetPause(bPause);
}

function ServerPause()
{
    Log("Webadmin spectator executing pause command!");
    Pause();
}

event Destroyed()
{
    Server.Spectator = none;
    super(PlayerController).Destroyed();
}

event PreBeginPlay()
{
    super(Controller).PreBeginPlay();
    NextMsg = 0;
    LastMsg = 0;
    // End:0x2c
    if(ReceivedMsgMax < 10)
    {
        ReceivedMsgMax = 10;
    }
    Messages.Length = ReceivedMsgMax;
}

function int LastMessage()
{
    return LastMsg;
}

function string NextMessage(out int Msg)
{
    local string str;

    // End:0x14
    if(Msg == NextMsg)
    {
        return "";
    }
    str = Messages[Msg];
    ++ Msg;
    // End:0x44
    if(Msg >= ReceivedMsgMax)
    {
        Msg = 0;
    }
    return str;
}

function AddMessage(PlayerReplicationInfo PRI, string S, name Type)
{
    Messages[NextMsg] = FormatMessage(PRI, S, Type);
    ++ NextMsg;
    // End:0x45
    if(NextMsg >= ReceivedMsgMax)
    {
        NextMsg = 0;
    }
    // End:0x5f
    if(NextMsg == LastMsg)
    {
        ++ LastMsg;
    }
    // End:0x7a
    if(LastMsg >= ReceivedMsgMax)
    {
        LastMsg = 0;
    }
}

function Dump()
{
    Log("----Begin Dump----");
    // End:0x3f
    if(PlayerReplicationInfo == none)
    {
        Log("NO PLAYER REPLICATION INFO");
    }
    // End:0x55
    if(Pawn == none)
    {
        Log("NO PAWN");
    }
    Log("NextMsg:" @ string(NextMsg));
    Log("LastMsg:" @ string(LastMsg));
    Log("ReceivedMsgMax:" @ string(ReceivedMsgMax));
    Log("Msg[0]" @ Messages[0]);
    Log("Msg[1]" @ Messages[1]);
    Log("Msg[2]" @ Messages[2]);
    Log("Msg[3]" @ Messages[3]);
    Log("Msg[4]" @ Messages[4]);
    Log("Msg[5]" @ Messages[5]);
}

function string FormatMessage(PlayerReplicationInfo PRI, string Text, name Type)
{
    local string Message;

    // End:0xc7
    if(PRI != none)
    {
        // End:0x39
        if(Type == 'Say' && PRI == PlayerReplicationInfo)
        {
            Message = Text;
        }
        // End:0xc4
        else
        {
            // End:0x6c
            if(Type == 'Say')
            {
                Message = PRI.PlayerName $ ": " $ Text;
            }
            // End:0xc4
            else
            {
                // End:0xa5
                if(Type == 'TeamSay')
                {
                    Message = "[" $ PRI.PlayerName $ "]: " $ Text;
                }
                // End:0xc4
                else
                {
                    Message = "(" $ string(Type) $ ") " $ Text;
                }
            }
        }
    }
    // End:0x110
    else
    {
        // End:0xf1
        if(Type == 'Console')
        {
            Message = "WebAdmin:" @ Text;
        }
        // End:0x110
        else
        {
            Message = "(" $ string(Type) $ ") " $ Text;
        }
    }
    return Message;
}

event ClientMessage(coerce string S, optional name Type)
{
    // End:0x1a
    if(bClientMessages)
    {
        AddMessage(none, S, Type);
    }
}

function TeamMessage(PlayerReplicationInfo PRI, coerce string S, name Type)
{
    // End:0x1e
    if(bTeamMessages)
    {
        AddMessage(PRI, S, Type);
    }
}

function ClientVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte MessageID);
function ReceiveLocalizedMessage(class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject);
function ClientGameEnded();
function GameHasEnded()
{
    AddMessage(none, "GAME HAS ENDED", 'Console');
}

exec function DumpMaplists(string GameType)
{
    local int i, GameIndex;
    local StringArray ExcludeMaps, IncludeMaps;

    // End:0x2b
    if(GameType == "")
    {
        GameType = string(Level.Game.Class);
    }
    GameIndex = Level.Game.MaplistHandler.GetGameIndex(GameType);
    ExcludeMaps = Server.ReloadExcludeMaps(GameType);
    IncludeMaps = Server.ReloadIncludeMaps(ExcludeMaps, GameIndex, Level.Game.MaplistHandler.GetActiveList(GameIndex));
    i = 0;
    J0xbd:
    // End:0x145 [While If]
    if(i < ExcludeMaps.Count())
    {
        Log("  ExcludeMaps[" $ string(i) $ "]:  Item '" $ ExcludeMaps.GetItem(i) $ "' Tag '" $ ExcludeMaps.GetTag(i) $ "'");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0xbd;
    }
    i = 0;
    J0x14c:
    // End:0x1d4 [While If]
    if(i < IncludeMaps.Count())
    {
        Log("  IncludeMaps[" $ string(i) $ "]:  Item '" $ IncludeMaps.GetItem(i) $ "' Tag '" $ IncludeMaps.GetTag(i) $ "'");
        ++ i;
        // This is an implied JumpToken; Continue!
        goto J0x14c;
    }
}

defaultproperties
{
    ReceivedMsgMax=32
    bClientMessages=true
    bTeamMessages=true
    bLocalizedMessages=true
}