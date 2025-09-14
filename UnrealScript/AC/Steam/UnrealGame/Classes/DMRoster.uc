/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\DMRoster.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:1
 *
 *******************************************************************************/
class DMRoster extends UnrealTeamInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int Position;

function bool AddToTeam(Controller Other)
{
    local SquadAI DMSquad;

    // End:0x4e
    if(Bot(Other) != none)
    {
        DMSquad = Spawn(DeathMatch(Level.Game).DMSquadClass);
        DMSquad.AddBot(Bot(Other));
    }
    Other.PlayerReplicationInfo.Team = none;
    return true;
}

defaultproperties
{
    TeamIndex=255
}