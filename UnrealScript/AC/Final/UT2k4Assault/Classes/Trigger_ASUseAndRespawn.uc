class Trigger_ASUseAndRespawn extends SVehicleTrigger;

enum AT_AssaultTeam
{
    AT_All,                         // 0
    AT_Attackers,                   // 1
    AT_Defenders                    // 2
};

var() Trigger_ASUseAndRespawn.AT_AssaultTeam AssaultTeam;
var() name PSM_Override_Tag;
var float LastFailTime;

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

function Touch(Actor Other)
{
    local wPawn User;
    local Controller C;

    User = wPawn(Other);
    // End:0x40
    if((!bEnabled || User == none) || User.Controller == none)
    {
        return;
    }
    C = User.Controller;
    // End:0xFD
    if(((C.RouteGoal == self) || C.MoveTarget == self) && AIController(C) != none)
    {
        // End:0xFB
        if(((C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator) && ApprovePlayerTeam(byte(C.PlayerReplicationInfo.Team.TeamIndex)))
        {
            UsedBy(User);
        }
        return;
    }
    User.ReceiveLocalizedMessage(Class'Vehicles.BulldogMessage', 0);
    //return;    
}

function UsedBy(Pawn User)
{
    // End:0x30
    if((!bEnabled || User == none) || User.Controller == none)
    {
        return;
    }
    // End:0x51
    if(!Level.Game.IsA('ASGameInfo'))
    {
        return;
    }
    User.PlayTeleportEffect(true, true);
    // End:0x9F
    if((PSM_Override_Tag != 'None') && PSM_Override_Tag != 'None')
    {
        User.Controller.Event = PSM_Override_Tag;
    }
    ASGameInfo(Level.Game).RespawnPlayer(User.Controller, false);
    //return;    
}

defaultproperties
{
    bNoDelete=true
    bCollideActors=true
}