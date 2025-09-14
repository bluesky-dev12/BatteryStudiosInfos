class BroadcastHandler extends Info
    notplaceable
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

const PROPNUM = 2;

var BroadcastHandler NextBroadcastHandler;
var Class<BroadcastHandler> NextBroadcastHandlerClass;
var int SentText;
var bool bMuteSpectators;
var bool bPartitionSpectators;
var localized string BHDisplayText[2];
var localized string BHDescText[2];

function UpdateSentText()
{
    SentText = 0;
    //return;    
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.ChatGroup, "bMuteSpectators", default.BHDisplayText[0], 0, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.ChatGroup, "bPartitionSpectators", default.BHDisplayText[1], 1, 1, "Check",,, true, true);
    // End:0xAB
    if(default.NextBroadcastHandlerClass != none)
    {
        default.NextBroadcastHandlerClass.static.FillPlayInfo(PlayInfo);
        PlayInfo.PopClass();
    }
    //return;    
}

static event string GetDescriptionText(string PropName)
{
    switch(PropName)
    {
        // End:0x23
        case "bMuteSpectators":
            return default.BHDescText[0];
        // End:0x44
        case "bPartitionSpectators":
            return default.BHDescText[1];
        // End:0xFFFF
        default:
            return super.GetDescriptionText(PropName);
            break;
    }
    //return;    
}

function bool AllowsBroadcast(Actor broadcaster, int Len)
{
    // End:0x85
    if(((bMuteSpectators && PlayerController(broadcaster) != none) && !PlayerController(broadcaster).PlayerReplicationInfo.bAdmin) && PlayerController(broadcaster).PlayerReplicationInfo.bOnlySpectator || PlayerController(broadcaster).PlayerReplicationInfo.bOutOfLives)
    {
        return false;
    }
    SentText += Len;
    // End:0xBE
    if((NextBroadcastHandler != none) && !NextBroadcastHandler.HandlerAllowsBroadcast(broadcaster, SentText))
    {
        return false;
    }
    return (Level.Pauser != none) || SentText < 200;
    //return;    
}

function bool HandlerAllowsBroadcast(Actor broadcaster, int SentTextNum)
{
    // End:0x25
    if(NextBroadcastHandler != none)
    {
        return NextBroadcastHandler.HandlerAllowsBroadcast(broadcaster, SentTextNum);
    }
    return true;
    //return;    
}

function BroadcastText(PlayerReplicationInfo SenderPRI, PlayerController Receiver, coerce string Msg, optional name Type)
{
    // End:0x21
    if(!AcceptBroadcastText(Receiver, SenderPRI, Msg, Type))
    {
        return;
    }
    // End:0x52
    if(NextBroadcastHandler != none)
    {
        NextBroadcastHandler.BroadcastText(SenderPRI, Receiver, Msg, Type);        
    }
    else
    {
        Receiver.TeamMessage(SenderPRI, Msg, Type);
    }
    //return;    
}

function BroadcastLocalized(Actor Sender, PlayerController Receiver, Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    // End:0x30
    if(!AcceptBroadcastLocalized(Receiver, Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject))
    {
        return;
    }
    // End:0x70
    if(NextBroadcastHandler != none)
    {
        NextBroadcastHandler.BroadcastLocalized(Sender, Receiver, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);        
    }
    else
    {
        Receiver.ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
    //return;    
}

function Broadcast(Actor Sender, coerce string Msg, optional name Type, optional Object.MessageType mType)
{
    local Controller C;
    local PlayerController P;
    local PlayerReplicationInfo PRI;
    local bool bGhostChatting;

    // End:0x19
    if(!AllowsBroadcast(Sender, Len(Msg)))
    {
        return;
    }
    // End:0x45
    if(Pawn(Sender) != none)
    {
        PRI = Pawn(Sender).PlayerReplicationInfo;        
    }
    else
    {
        // End:0x6E
        if(Controller(Sender) != none)
        {
            PRI = Controller(Sender).PlayerReplicationInfo;
        }
    }
    // End:0xA6
    if(Level.GRI != none)
    {
        bGhostChatting = Level.GRI.IsGhostChatting(Sender);
    }
    // End:0x129
    if(!bGhostChatting && Type == 'GhostSay')
    {
        Log((("[BroadcastHandler::BroadcastTeam() Exception ] / bGhostChatting : " $ string(bGhostChatting)) $ " / Type : ") $ string(Type));
    }
    // End:0x285
    if((((bPartitionSpectators && !Level.Game.bGameEnded) && PRI != none) && !PRI.bAdmin) && PRI.bOnlySpectator || PRI.bOutOfLives)
    {
        C = Level.ControllerList;
        J0x1B0:

        // End:0x282 [Loop If]
        if(C != none)
        {
            P = PlayerController(C);
            // End:0x26B
            if((P != none) && P.PlayerReplicationInfo.bOnlySpectator || P.PlayerReplicationInfo.bOutOfLives)
            {
                // End:0x251
                if(bGhostChatting)
                {
                    // End:0x24E
                    if(P.PlayerReplicationInfo.IsDead)
                    {
                        BroadcastText(PRI, P, Msg, Type);
                    }                    
                }
                else
                {
                    BroadcastText(PRI, P, Msg, Type);
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x1B0;
        }        
    }
    else
    {
        C = Level.ControllerList;
        J0x299:

        // End:0x331 [Loop If]
        if(C != none)
        {
            P = PlayerController(C);
            // End:0x31A
            if(P != none)
            {
                // End:0x300
                if(bGhostChatting)
                {
                    // End:0x2FD
                    if(P.PlayerReplicationInfo.IsDead)
                    {
                        BroadcastText(PRI, P, Msg, Type);
                    }                    
                }
                else
                {
                    BroadcastText(PRI, P, Msg, Type);
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x299;
        }
    }
    //return;    
}

function BroadcastTeam(Controller Sender, coerce string Msg, optional name Type, optional Object.MessageType mType)
{
    local Controller C;
    local PlayerController P;
    local PlayerReplicationInfo PRI;
    local bool bGhostChatting;

    // End:0x19
    if(!AllowsBroadcast(Sender, Len(Msg)))
    {
        return;
    }
    // End:0x38
    if(Sender != none)
    {
        PRI = Sender.PlayerReplicationInfo;
    }
    // End:0x70
    if(Level.GRI != none)
    {
        bGhostChatting = Level.GRI.IsGhostChatting(Sender);
    }
    // End:0x24B
    if((((bPartitionSpectators && !Level.Game.bGameEnded) && Sender != none) && !Sender.PlayerReplicationInfo.bAdmin) && Sender.PlayerReplicationInfo.bOnlySpectator || Sender.PlayerReplicationInfo.bOutOfLives)
    {
        C = Level.ControllerList;
        J0x112:

        // End:0x248 [Loop If]
        if(C != none)
        {
            P = PlayerController(C);
            // End:0x231
            if(((P != none) && (P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team) || P.PlayerReplicationInfo.bAdminSpecator) && P.PlayerReplicationInfo.bOnlySpectator || P.PlayerReplicationInfo.bOutOfLives)
            {
                // End:0x20E
                if(bGhostChatting)
                {
                    // End:0x20B
                    if(P.PlayerReplicationInfo.IsDead)
                    {
                        BroadcastText(Sender.PlayerReplicationInfo, P, Msg, Type);
                    }                    
                }
                else
                {
                    BroadcastText(Sender.PlayerReplicationInfo, P, Msg, Type);
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x112;
        }        
    }
    else
    {
        C = Level.ControllerList;
        J0x25F:

        // End:0x35B [Loop If]
        if(C != none)
        {
            P = PlayerController(C);
            // End:0x344
            if((P != none) && (P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team) || P.PlayerReplicationInfo.bAdminSpecator)
            {
                // End:0x321
                if(bGhostChatting)
                {
                    // End:0x31E
                    if(P.PlayerReplicationInfo.IsDead)
                    {
                        BroadcastText(Sender.PlayerReplicationInfo, P, Msg, Type);
                    }                    
                }
                else
                {
                    BroadcastText(Sender.PlayerReplicationInfo, P, Msg, Type);
                }
            }
            C = C.nextController;
            // [Loop Continue]
            goto J0x25F;
        }
    }
    //return;    
}

event AllowBroadcastLocalized(Actor Sender, Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local Controller C;
    local PlayerController P;

    C = Level.ControllerList;
    J0x14:

    // End:0x7A [Loop If]
    if(C != none)
    {
        P = PlayerController(C);
        // End:0x63
        if(P != none)
        {
            BroadcastLocalized(Sender, P, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0x14;
    }
    //return;    
}

function RegisterBroadcastHandler(BroadcastHandler NewBH)
{
    // End:0x2D
    if(NextBroadcastHandler == none)
    {
        NextBroadcastHandler = NewBH;
        default.NextBroadcastHandlerClass = NewBH.Class;        
    }
    else
    {
        NextBroadcastHandler.RegisterBroadcastHandler(NewBH);
    }
    //return;    
}

function bool AcceptBroadcastText(PlayerController Receiver, PlayerReplicationInfo SenderPRI, out string Msg, optional name Type)
{
    // End:0x2F
    if(NextBroadcastHandler != none)
    {
        return NextBroadcastHandler.AcceptBroadcastText(Receiver, SenderPRI, Msg, Type);
    }
    return true;
    //return;    
}

function bool AcceptBroadcastLocalized(PlayerController Receiver, Actor Sender, Class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object obj)
{
    // End:0x3E
    if(NextBroadcastHandler != none)
    {
        return NextBroadcastHandler.AcceptBroadcastLocalized(Receiver, Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, obj);
    }
    return true;
    //return;    
}

function bool AcceptBroadcastSpeech(PlayerController Receiver, PlayerReplicationInfo SenderPRI)
{
    // End:0x25
    if(NextBroadcastHandler != none)
    {
        return NextBroadcastHandler.AcceptBroadcastSpeech(Receiver, SenderPRI);
    }
    return true;
    //return;    
}

function bool AcceptBroadcastVoice(PlayerController Receiver, PlayerReplicationInfo SenderPRI)
{
    // End:0x25
    if(NextBroadcastHandler != none)
    {
        return NextBroadcastHandler.AcceptBroadcastVoice(Receiver, SenderPRI);
    }
    return true;
    //return;    
}

event Destroyed()
{
    default.NextBroadcastHandlerClass = none;
    super(Actor).Destroyed();
    //return;    
}

defaultproperties
{
    BHDisplayText[0]="Mute Spectators"
    BHDisplayText[1]="Partition Spectators"
    BHDescText[0]="Check this option to prevent spectators from chatting during the game."
    BHDescText[1]="Check this option to separate spectator chat from player chat."
}