/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Trigger_ASForcePlayerRespawn.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:2
 *	Properties:5
 *	Functions:2
 *
 *******************************************************************************/
class Trigger_ASForcePlayerRespawn extends Triggers;

enum EPSM_AssaultTeam
{
    EPSM_Attackers,
    EPSM_Defenders
};

enum EFTR_Constraint
{
    EFTRC_All,
    EFTRC_PawnClass
};

var() Trigger_ASForcePlayerRespawn.EPSM_AssaultTeam AssaultTeam;
var() Trigger_ASForcePlayerRespawn.EFTR_Constraint Constraint;
var() class<Pawn> ConstraintPawnClass;
var() name PSM_OverrideTag;
var() bool bTryToRepossess;

event Trigger(Actor Other, Pawn EventInstigator)
{
    local Controller C;

    // End:0x33
    if(Role < 4 || !Level.Game.IsA('ASGameInfo'))
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
    if(C != none && C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator && ApprovePlayerTeam(byte(C.PlayerReplicationInfo.Team.TeamIndex)))
    {
        // End:0xfa
        if(Constraint == 1 && ConstraintPawnClass != none && C.PawnClass != ConstraintPawnClass)
        {
            return;
        }
        // End:0x12e
        if(PSM_OverrideTag != 'None' && PSM_OverrideTag != 'None')
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
}

function bool ApprovePlayerTeam(byte Team)
{
    // End:0x84
    if(Level.Game.IsA('ASGameInfo'))
    {
        // End:0x59
        if(AssaultTeam == 0)
        {
            // End:0x56
            if(ASGameInfo(Level.Game).IsAttackingTeam(Team))
            {
                return true;
            }
        }
        // End:0x84
        else
        {
            // End:0x84
            if(!ASGameInfo(Level.Game).IsAttackingTeam(Team))
            {
                return true;
            }
        }
    }
    return false;
}

defaultproperties
{
    bTryToRepossess=true
    bCollideActors=true
}