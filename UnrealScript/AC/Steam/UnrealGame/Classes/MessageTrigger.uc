/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\MessageTrigger.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:3
 *	Functions:2
 *
 *******************************************************************************/
class MessageTrigger extends Triggers;

enum EMT_MessageType
{
    EMT_Default,
    EMT_CriticalEvent,
    EMT_DeathMessage,
    EMT_Say,
    EMT_TeamSay,
    EMT_ChatMessage,
    EMT_TutorialEvent
};

var() MessageTrigger.EMT_MessageType MessageType;
var() localized string Message;
var() byte Team;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local name MsgType;
    local Controller C;
    local PlayerController P;

    switch(MessageType)
    {
        // End:0x1a
        case 1:
            MsgType = 'CriticalEvent';
            // End:0xdb
            break;
        // End:0x2d
        case 2:
            MsgType = 'wDeathMessage';
            // End:0xdb
            break;
        // End:0x40
        case 3:
            MsgType = 'SayMessagePlus';
            // End:0xdb
            break;
        // End:0x53
        case 4:
            MsgType = 'TeamSayMessagePlus';
            // End:0xdb
            break;
        // End:0xb7
        case 5:
            Level.GetLocalPlayerController().Player.Console.AddMessageItem(Level.GetLocalPlayerController().Player.Console.ConstructMessageItem(Message, 6));
            return;
        // End:0xca
        case 6:
            MsgType = 'TutorialEvent';
            // End:0xdb
            break;
        // End:0xffff
        default:
            MsgType = 'StringMessagePlus';
            // End:0xdb Break;
            break;
    }
    C = Level.ControllerList;
    J0xef:
    // End:0x163 [While If]
    if(C != none)
    {
        P = PlayerController(C);
        // End:0x14c
        if(P != none && CheckTeam(P))
        {
            P.TeamMessage(C.PlayerReplicationInfo, Message, MsgType);
        }
        C = C.nextController;
        // This is an implied JumpToken; Continue!
        goto J0xef;
    }
}

function bool CheckTeam(PlayerController P)
{
    local byte DefendingTeam;

    // End:0x10
    if(Team == 255)
    {
        return true;
    }
    DefendingTeam = byte(Level.Game.GetDefenderNum());
    // End:0x57
    if(DefendingTeam == 255)
    {
        return P.GetTeamNum() == Team;
    }
    // End:0x83
    if(Team == 0 && DefendingTeam != P.GetTeamNum())
    {
        return true;
    }
    // End:0xaf
    if(Team == 1 && DefendingTeam == P.GetTeamNum())
    {
        return true;
    }
    return false;
}

defaultproperties
{
    MessageType=1
    Message="? ???"
    Team=255
}