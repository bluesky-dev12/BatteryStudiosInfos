class DMRoster extends UnrealTeamInfo
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var int Position;

function bool AddToTeam(Controller Other)
{
    local SquadAI DMSquad;

    // End:0x4E
    if(Bot(Other) != none)
    {
        DMSquad = Spawn(DeathMatch(Level.Game).DMSquadClass);
        DMSquad.AddBot(Bot(Other));
    }
    Other.PlayerReplicationInfo.Team = none;
    return true;
    //return;    
}

defaultproperties
{
    TeamIndex=255
}