/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Trigger_ASTeamUseTrigger.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:2
 *	Functions:4
 *
 *******************************************************************************/
class Trigger_ASTeamUseTrigger extends Triggers;

enum AT_AssaultTeam
{
    AT_All,
    AT_Attackers,
    AT_Defenders
};

var() Trigger_ASTeamUseTrigger.AT_AssaultTeam AssaultTeam;
var() localized string Message;

function bool SelfTriggered()
{
    return true;
}

function UsedBy(Pawn User)
{
    TriggerEvent(Event, self, User);
}

function Touch(Actor Other)
{
    // End:0x84
    if(Pawn(Other) != none && ApprovePlayerTeam(byte(Pawn(Other).GetTeamNum())))
    {
        // End:0x56
        if(Message != "")
        {
            Pawn(Other).ClientMessage(Message);
        }
        // End:0x84
        if(AIController(Pawn(Other).Controller) != none)
        {
            UsedBy(Pawn(Other));
        }
    }
}

function bool ApprovePlayerTeam(byte Team)
{
    // End:0x12
    if(AssaultTeam == 0)
    {
        return true;
    }
    // End:0x96
    if(Level.Game.IsA('ASGameInfo'))
    {
        // End:0x6b
        if(AssaultTeam == 1)
        {
            // End:0x68
            if(ASGameInfo(Level.Game).IsAttackingTeam(Team))
            {
                return true;
            }
        }
        // End:0x96
        else
        {
            // End:0x96
            if(!ASGameInfo(Level.Game).IsAttackingTeam(Team))
            {
                return true;
            }
        }
    }
    return false;
}
