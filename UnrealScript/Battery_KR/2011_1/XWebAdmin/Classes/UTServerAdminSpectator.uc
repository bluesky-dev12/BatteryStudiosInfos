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
    //return;    
}

function ServerPause()
{
    Log("Webadmin spectator executing pause command!");
    Pause();
    //return;    
}

event Destroyed()
{
    Server.Spectator = none;
    super(PlayerController).Destroyed();
    //return;    
}

event PreBeginPlay()
{
    super(Controller).PreBeginPlay();
    NextMsg = 0;
    LastMsg = 0;
    // End:0x2C
    if(int(ReceivedMsgMax) < 10)
    {
        ReceivedMsgMax = 10;
    }
    Messages.Length = int(ReceivedMsgMax);
    //return;    
}

function int LastMessage()
{
    return int(LastMsg);
    //return;    
}

function string NextMessage(out int Msg)
{
    local string str;

    // End:0x14
    if(Msg == int(NextMsg))
    {
        return "";
    }
    str = Messages[Msg];
    Msg++;
    // End:0x44
    if(Msg >= int(ReceivedMsgMax))
    {
        Msg = 0;
    }
    return str;
    //return;    
}

function AddMessage(PlayerReplicationInfo PRI, string S, name Type)
{
    Messages[int(NextMsg)] = FormatMessage(PRI, S, Type);
    NextMsg++;
    // End:0x45
    if(int(NextMsg) >= int(ReceivedMsgMax))
    {
        NextMsg = 0;
    }
    // End:0x5F
    if(int(NextMsg) == int(LastMsg))
    {
        LastMsg++;
    }
    // End:0x7A
    if(int(LastMsg) >= int(ReceivedMsgMax))
    {
        LastMsg = 0;
    }
    //return;    
}

function Dump()
{
    Log("----Begin Dump----");
    // End:0x3F
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
    //return;    
}

function string FormatMessage(PlayerReplicationInfo PRI, string Text, name Type)
{
    local string Message;

    // End:0xC7
    if(PRI != none)
    {
        // End:0x39
        if((Type == 'Say') && PRI == PlayerReplicationInfo)
        {
            Message = Text;            
        }
        else
        {
            // End:0x6C
            if(Type == 'Say')
            {
                Message = (PRI.PlayerName $ ": ") $ Text;                
            }
            else
            {
                // End:0xA5
                if(Type == 'TeamSay')
                {
                    Message = (("[" $ PRI.PlayerName) $ "]: ") $ Text;                    
                }
                else
                {
                    Message = (("(" $ string(Type)) $ ") ") $ Text;
                }
            }
        }        
    }
    else
    {
        // End:0xF1
        if(Type == 'Console')
        {
            Message = "WebAdmin:" @ Text;            
        }
        else
        {
            Message = (("(" $ string(Type)) $ ") ") $ Text;
        }
    }
    return Message;
    //return;    
}

event ClientMessage(coerce string S, optional name Type)
{
    // End:0x1A
    if(bClientMessages)
    {
        AddMessage(none, S, Type);
    }
    //return;    
}

function TeamMessage(PlayerReplicationInfo PRI, coerce string S, name Type)
{
    // End:0x1E
    if(bTeamMessages)
    {
        AddMessage(PRI, S, Type);
    }
    //return;    
}

function ClientVoiceMessage(PlayerReplicationInfo Sender, PlayerReplicationInfo Recipient, name MessageType, byte MessageID)
{
    //return;    
}

function ReceiveLocalizedMessage(Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    //return;    
}

function ClientGameEnded()
{
    //return;    
}

function GameHasEnded()
{
    AddMessage(none, "GAME HAS ENDED", 'Console');
    //return;    
}

exec function DumpMaplists(string GameType)
{
    local int i, GameIndex;
    local StringArray ExcludeMaps, IncludeMaps;

    // End:0x2B
    if(GameType == "")
    {
        GameType = string(Level.Game.Class);
    }
    GameIndex = Level.Game.MaplistHandler.GetGameIndex(GameType);
    ExcludeMaps = Server.ReloadExcludeMaps(GameType);
    IncludeMaps = Server.ReloadIncludeMaps(ExcludeMaps, GameIndex, Level.Game.MaplistHandler.GetActiveList(GameIndex));
    i = 0;
    J0xBD:

    // End:0x145 [Loop If]
    if(i < ExcludeMaps.Count())
    {
        Log(((((("  ExcludeMaps[" $ string(i)) $ "]:  Item '") $ ExcludeMaps.GetItem(i)) $ "' Tag '") $ ExcludeMaps.GetTag(i)) $ "'");
        i++;
        // [Loop Continue]
        goto J0xBD;
    }
    i = 0;
    J0x14C:

    // End:0x1D4 [Loop If]
    if(i < IncludeMaps.Count())
    {
        Log(((((("  IncludeMaps[" $ string(i)) $ "]:  Item '") $ IncludeMaps.GetItem(i)) $ "' Tag '") $ IncludeMaps.GetTag(i)) $ "'");
        i++;
        // [Loop Continue]
        goto J0x14C;
    }
    //return;    
}

defaultproperties
{
    ReceivedMsgMax=32
    bClientMessages=true
    bTeamMessages=true
    bLocalizedMessages=true
}