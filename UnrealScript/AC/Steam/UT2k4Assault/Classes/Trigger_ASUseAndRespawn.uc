/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UT2k4Assault\Classes\Trigger_ASUseAndRespawn.uc
 * Package Imports:
 *	UT2k4Assault
 *	Engine
 *	Core
 *
 * Stats:
 *	Enums:1
 *	Properties:3
 *	Functions:3
 *
 *******************************************************************************/
class Trigger_ASUseAndRespawn extends SVehicleTrigger;

enum AT_AssaultTeam
{
    AT_All,
    AT_Attackers,
    AT_Defenders
};

var() Trigger_ASUseAndRespawn.AT_AssaultTeam AssaultTeam;
var() name PSM_Override_Tag;
var float LastFailTime;

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

function Touch(Actor Other)
{
    local wPawn User;
    local Controller C;

    User = wPawn(Other);
    // End:0x40
    if(!bEnabled || User == none || User.Controller == none)
    {
        return;
    }
    C = User.Controller;
    // End:0xfd
    if(C.RouteGoal == self || C.MoveTarget == self && AIController(C) != none)
    {
        // End:0xfb
        if(C.PlayerReplicationInfo != none && !C.PlayerReplicationInfo.bOnlySpectator && ApprovePlayerTeam(byte(C.PlayerReplicationInfo.Team.TeamIndex)))
        {
            UsedBy(User);
        }
        return;
    }
    User.ReceiveLocalizedMessage(class'BulldogMessage', 0);
}

function UsedBy(Pawn User)
{
    // End:0x30
    if(!bEnabled || User == none || User.Controller == none)
    {
        return;
    }
    // End:0x51
    if(!Level.Game.IsA('ASGameInfo'))
    {
        return;
    }
    User.PlayTeleportEffect(true, true);
    // End:0x9f
    if(PSM_Override_Tag != 'None' && PSM_Override_Tag != 'None')
    {
        User.Controller.Event = PSM_Override_Tag;
    }
    ASGameInfo(Level.Game).RespawnPlayer(User.Controller, false);
}

defaultproperties
{
    bNoDelete=true
    bCollideActors=true
}