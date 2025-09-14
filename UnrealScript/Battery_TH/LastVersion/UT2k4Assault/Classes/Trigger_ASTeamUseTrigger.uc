class Trigger_ASTeamUseTrigger extends Triggers;

enum AT_AssaultTeam
{
    AT_All,                         // 0
    AT_Attackers,                   // 1
    AT_Defenders                    // 2
};

var() Trigger_ASTeamUseTrigger.AT_AssaultTeam AssaultTeam;
var() localized string Message;

function bool SelfTriggered()
{
    return true;
    //return;    
}

function UsedBy(Pawn User)
{
    TriggerEvent(Event, self, User);
    //return;    
}

function Touch(Actor Other)
{
    // End:0x84
    if((Pawn(Other) != none) && ApprovePlayerTeam(byte(Pawn(Other).GetTeamNum())))
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
    //return;    
}

function bool ApprovePlayerTeam(byte Team)
{
    // End:0x12
    if(int(AssaultTeam) == int(0))
    {
        return true;
    }
    // End:0x96
    if(Level.Game.IsA('ASGameInfo'))
    {
        // End:0x6B
        if(int(AssaultTeam) == int(1))
        {
            // End:0x68
            if(ASGameInfo(Level.Game).IsAttackingTeam(int(Team)))
            {
                return true;
            }            
        }
        else
        {
            // End:0x96
            if(!ASGameInfo(Level.Game).IsAttackingTeam(int(Team)))
            {
                return true;
            }
        }
    }
    return false;
    //return;    
}
