/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\BroadcastHandler.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Constants:1
 *	Properties:7
 *	Functions:16
 *
 *******************************************************************************/
class BroadcastHandler extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

const PROPNUM = 2;

var BroadcastHandler NextBroadcastHandler;
var class<BroadcastHandler> NextBroadcastHandlerClass;
var int SentText;
var bool bMuteSpectators;
var bool bPartitionSpectators;
var localized string BHDisplayText[2];
var localized string BHDescText[2];

function UpdateSentText()
{
    SentText = 0;
}

static function FillPlayInfo(PlayInfo PlayInfo)
{
    super.FillPlayInfo(PlayInfo);
    PlayInfo.AddSetting(default.ChatGroup, "bMuteSpectators", default.BHDisplayText[0], 0, 1, "Check",,, true, true);
    PlayInfo.AddSetting(default.ChatGroup, "bPartitionSpectators", default.BHDisplayText[1], 1, 1, "Check",,, true, true);
    // End:0xab
    if(default.NextBroadcastHandlerClass != none)
    {
        default.NextBroadcastHandlerClass.static.FillPlayInfo(PlayInfo);
        PlayInfo.PopClass();
    }
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
        // End:0xffff
        default:
            return super.GetDescriptionText(PropName);
    }
}

function bool AllowsBroadcast(Actor broadcaster, int Len)
{
    // End:0x85
    if(bMuteSpectators && PlayerController(broadcaster) != none && !PlayerController(broadcaster).PlayerReplicationInfo.bAdmin && PlayerController(broadcaster).PlayerReplicationInfo.bOnlySpectator || PlayerController(broadcaster).PlayerReplicationInfo.bOutOfLives)
    {
        return false;
    }
    SentText += Len;
    // End:0xbe
    if(NextBroadcastHandler != none && !NextBroadcastHandler.HandlerAllowsBroadcast(broadcaster, SentText))
    {
        return false;
    }
    return Level.Pauser != none || SentText < 200;
}

function bool HandlerAllowsBroadcast(Actor broadcaster, int SentTextNum)
{
    // End:0x25
    if(NextBroadcastHandler != none)
    {
        return NextBroadcastHandler.HandlerAllowsBroadcast(broadcaster, SentTextNum);
    }
    return true;
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
    // End:0x70
    else
    {
        Receiver.TeamMessage(SenderPRI, Msg, Type);
    }
}

function BroadcastLocalized(Actor Sender, PlayerController Receiver, class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
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
    // End:0x98
    else
    {
        Receiver.ReceiveLocalizedMessage(Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
    }
}

function Broadcast(Actor Sender, coerce string Msg, optional name Type, optional Core.Object.MessageType mType)
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
    // End:0x6e
    else
    {
        // End:0x6e
        if(Controller(Sender) != none)
        {
            PRI = Controller(Sender).PlayerReplicationInfo;
        }
    }
    // End:0xa6
    if(Level.GRI != none)
    {
        bGhostChatting = Level.GRI.IsGhostChatting(Sender);
    }
    // End:0x129
    if(!bGhostChatting && Type == 'GhostSay')
    {
        Log("[BroadcastHandler::BroadcastTeam() Exception ] / bGhostChatting : " $ string(bGhostChatting) $ " / Type : " $ string(Type));
    }
    // End:0x285
    if(bPartitionSpectators && !Level.Game.bGameEnded && PRI != none && !PRI.bAdmin && PRI.bOnlySpectator || PRI.bOutOfLives)
    {
        C = Level.ControllerList;
        J0x1b0:
        // End:0x282 [While If]
        if(C != none)
        {
            P = PlayerController(C);
            // End:0x26b
            if(P != none && P.PlayerReplicationInfo.bOnlySpectator || P.PlayerReplicationInfo.bOutOfLives)
            {
                // End:0x251
                if(bGhostChatting)
                {
                    // End:0x24e
                    if(P.PlayerReplicationInfo.IsDead)
                    {
                        BroadcastText(PRI, P, Msg, Type);
                    }
                }
                // End:0x26b
                else
                {
                    BroadcastText(PRI, P, Msg, Type);
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x1b0;
        }
    }
    // End:0x331
    else
    {
        C = Level.ControllerList;
        J0x299:
        // End:0x331 [While If]
        if(C != none)
        {
            P = PlayerController(C);
            // End:0x31a
            if(P != none)
            {
                // End:0x300
                if(bGhostChatting)
                {
                    // End:0x2fd
                    if(P.PlayerReplicationInfo.IsDead)
                    {
                        BroadcastText(PRI, P, Msg, Type);
                    }
                }
                // End:0x31a
                else
                {
                    BroadcastText(PRI, P, Msg, Type);
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x299;
        }
    }
}

function BroadcastTeam(Controller Sender, coerce string Msg, optional name Type, optional Core.Object.MessageType mType)
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
    // End:0x24b
    if(bPartitionSpectators && !Level.Game.bGameEnded && Sender != none && !Sender.PlayerReplicationInfo.bAdmin && Sender.PlayerReplicationInfo.bOnlySpectator || Sender.PlayerReplicationInfo.bOutOfLives)
    {
        C = Level.ControllerList;
        J0x112:
        // End:0x248 [While If]
        if(C != none)
        {
            P = PlayerController(C);
            // End:0x231
            if(P != none && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team || P.PlayerReplicationInfo.bAdminSpecator && P.PlayerReplicationInfo.bOnlySpectator || P.PlayerReplicationInfo.bOutOfLives)
            {
                // End:0x20e
                if(bGhostChatting)
                {
                    // End:0x20b
                    if(P.PlayerReplicationInfo.IsDead)
                    {
                        BroadcastText(Sender.PlayerReplicationInfo, P, Msg, Type);
                    }
                }
                // End:0x231
                else
                {
                    BroadcastText(Sender.PlayerReplicationInfo, P, Msg, Type);
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x112;
        }
    }
    // End:0x35b
    else
    {
        C = Level.ControllerList;
        J0x25f:
        // End:0x35b [While If]
        if(C != none)
        {
            P = PlayerController(C);
            // End:0x344
            if(P != none && P.PlayerReplicationInfo.Team == Sender.PlayerReplicationInfo.Team || P.PlayerReplicationInfo.bAdminSpecator)
            {
                // End:0x321
                if(bGhostChatting)
                {
                    // End:0x31e
                    if(P.PlayerReplicationInfo.IsDead)
                    {
                        BroadcastText(Sender.PlayerReplicationInfo, P, Msg, Type);
                    }
                }
                // End:0x344
                else
                {
                    BroadcastText(Sender.PlayerReplicationInfo, P, Msg, Type);
                }
            }
            C = C.nextController;
            // This is an implied JumpToken; Continue!
            goto J0x25f;
        }
    }
}

event AllowBroadcastLocalized(Actor Sender, class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object OptionalObject)
{
    local Controller C;
    local PlayerController P;

    C = Level.ControllerList;
    J0x14:
    // End:0x7a [While If]
    if(C != none)
    {
        P = PlayerController(C);
        // End:0x63
        if(P != none)
        {
            BroadcastLocalized(Sender, P, Message, Switch, RelatedPRI_1, RelatedPRI_2, OptionalObject);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0x14;
    }
}

function RegisterBroadcastHandler(BroadcastHandler NewBH)
{
    // End:0x2d
    if(NextBroadcastHandler == none)
    {
        NextBroadcastHandler = NewBH;
        default.NextBroadcastHandlerClass = NewBH.Class;
    }
    // End:0x41
    else
    {
        NextBroadcastHandler.RegisterBroadcastHandler(NewBH);
    }
}

function bool AcceptBroadcastText(PlayerController Receiver, PlayerReplicationInfo SenderPRI, out string Msg, optional name Type)
{
    // End:0x2f
    if(NextBroadcastHandler != none)
    {
        return NextBroadcastHandler.AcceptBroadcastText(Receiver, SenderPRI, Msg, Type);
    }
    return true;
}

function bool AcceptBroadcastLocalized(PlayerController Receiver, Actor Sender, class<LocalMessage> Message, optional int Switch, optional PlayerReplicationInfo RelatedPRI_1, optional PlayerReplicationInfo RelatedPRI_2, optional Object obj)
{
    // End:0x3e
    if(NextBroadcastHandler != none)
    {
        return NextBroadcastHandler.AcceptBroadcastLocalized(Receiver, Sender, Message, Switch, RelatedPRI_1, RelatedPRI_2, obj);
    }
    return true;
}

function bool AcceptBroadcastSpeech(PlayerController Receiver, PlayerReplicationInfo SenderPRI)
{
    // End:0x25
    if(NextBroadcastHandler != none)
    {
        return NextBroadcastHandler.AcceptBroadcastSpeech(Receiver, SenderPRI);
    }
    return true;
}

function bool AcceptBroadcastVoice(PlayerController Receiver, PlayerReplicationInfo SenderPRI)
{
    // End:0x25
    if(NextBroadcastHandler != none)
    {
        return NextBroadcastHandler.AcceptBroadcastVoice(Receiver, SenderPRI);
    }
    return true;
}

event Destroyed()
{
    default.NextBroadcastHandlerClass = none;
    super(Actor).Destroyed();
}

defaultproperties
{
    BHDisplayText[0]="Silent Spectators"
    BHDisplayText[1]="Separate Spectator Chat"
    BHDescText[0]="This option prevents spectators from talking during the game."
    BHDescText[1]="This option places spectators in a separate chat room from the players."
}