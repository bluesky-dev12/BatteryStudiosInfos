class MessageTrigger extends Triggers;

enum EMT_MessageType
{
    EMT_Default,                    // 0
    EMT_CriticalEvent,              // 1
    EMT_DeathMessage,               // 2
    EMT_Say,                        // 3
    EMT_TeamSay,                    // 4
    EMT_ChatMessage,                // 5
    EMT_TutorialEvent               // 6
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
        // End:0x1A
        case 1:
            MsgType = 'CriticalEvent';
            // End:0xDB
            break;
        // End:0x2D
        case 2:
            MsgType = 'wDeathMessage';
            // End:0xDB
            break;
        // End:0x40
        case 3:
            MsgType = 'SayMessagePlus';
            // End:0xDB
            break;
        // End:0x53
        case 4:
            MsgType = 'TeamSayMessagePlus';
            // End:0xDB
            break;
        // End:0xB7
        case 5:
            Level.GetLocalPlayerController().Player.Console.AddMessageItem(Level.GetLocalPlayerController().Player.Console.ConstructMessageItem(Message, 6));
            return;
        // End:0xCA
        case 6:
            MsgType = 'TutorialEvent';
            // End:0xDB
            break;
        // End:0xFFFF
        default:
            MsgType = 'StringMessagePlus';
            // End:0xDB
            break;
            break;
    }
    C = Level.ControllerList;
    J0xEF:

    // End:0x163 [Loop If]
    if(C != none)
    {
        P = PlayerController(C);
        // End:0x14C
        if((P != none) && CheckTeam(P))
        {
            P.TeamMessage(C.PlayerReplicationInfo, Message, MsgType);
        }
        C = C.nextController;
        // [Loop Continue]
        goto J0xEF;
    }
    //return;    
}

function bool CheckTeam(PlayerController P)
{
    local byte DefendingTeam;

    // End:0x10
    if(int(Team) == 255)
    {
        return true;
    }
    DefendingTeam = byte(Level.Game.GetDefenderNum());
    // End:0x57
    if(int(DefendingTeam) == 255)
    {
        return P.GetTeamNum() == int(Team);
    }
    // End:0x83
    if((int(Team) == 0) && int(DefendingTeam) != P.GetTeamNum())
    {
        return true;
    }
    // End:0xAF
    if((int(Team) == 1) && int(DefendingTeam) == P.GetTeamNum())
    {
        return true;
    }
    return false;
    //return;    
}

defaultproperties
{
    MessageType=1
    Message="? ???"
    Team=255
}