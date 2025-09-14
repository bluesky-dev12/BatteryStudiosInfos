/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\uTeamBanner.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:3
 *
 *******************************************************************************/
class uTeamBanner extends Decoration;

var GameReplicationInfo GRI;
var int Team;

simulated function UpdateForTeam();
simulated function SetGRI(GameReplicationInfo NewGRI)
{
    GRI = NewGRI;
    UpdateForTeam();
}

simulated function PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x37
    if(Level.Game != none)
    {
        SetGRI(Level.Game.GameReplicationInfo);
    }
}

defaultproperties
{
    bStatic=true
    bNoDelete=true
    RemoteRole=0
}