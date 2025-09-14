class Trigger_ASForcePlayerRespawn extends Triggers;

enum EPSM_AssaultTeam
{
    EPSM_Attackers,                 // 0
    EPSM_Defenders                  // 1
};

enum EFTR_Constraint
{
    EFTRC_All,                      // 0
    EFTRC_PawnClass                 // 1
};

var() Trigger_ASForcePlayerRespawn.EPSM_AssaultTeam AssaultTeam;
var() Trigger_ASForcePlayerRespawn.EFTR_Constraint Constraint;
var() Class<Pawn> ConstraintPawnClass;
var() name PSM_OverrideTag;
var() bool bTryToRepossess;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local Controller C;

    // End:0x33
    if((int(Role) < int(ROLE_Authority)) || !Level.Game.IsA('ASGameInfo'))
    {
        return;
    }
    // End:0x40
    if(EventInstigator == none)
    {
        return;
    }
    C = EventInstigator.Controller;
    // End:0x185
    if((((C != none) && C.PlayerReplicationInfo != none) && !C.PlayerReplicationInfo.bOnlySpectator) && ApprovePlayerTeam(byte(C.PlayerReplicationInfo.Team.TeamIndex)))
    {
        // End:0xFA
        if(((int(Constraint) == int(1)) && ConstraintPawnClass != none) && C.PawnClass != ConstraintPawnClass)
        {
            return;
        }
        // End:0x12E
        if((PSM_OverrideTag != 'None') && PSM_OverrideTag != 'None')
        {
            C.Event = PSM_OverrideTag;
        }
        // End:0x162
        if(bTryToRepossess && EventInstigator.IsA('Vehicle'))
        {
            Vehicle(EventInstigator).KDriverLeave(true);
        }
        ASGameInfo(Level.Game).RespawnPlayer(C, false);
    }
    //return;    
}

function bool ApprovePlayerTeam(byte Team)
{
    // End:0x84
    if(Level.Game.IsA('ASGameInfo'))
    {
        // End:0x59
        if(int(AssaultTeam) == int(0))
        {
            // End:0x56
            if(ASGameInfo(Level.Game).IsAttackingTeam(int(Team)))
            {
                return true;
            }            
        }
        else
        {
            // End:0x84
            if(!ASGameInfo(Level.Game).IsAttackingTeam(int(Team)))
            {
                return true;
            }
        }
    }
    return false;
    //return;    
}

defaultproperties
{
    bTryToRepossess=true
    bCollideActors=false
}