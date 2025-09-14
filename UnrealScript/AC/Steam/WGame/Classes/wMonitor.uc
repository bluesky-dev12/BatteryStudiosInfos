/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wMonitor.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:4
 *
 *******************************************************************************/
class wMonitor extends Decoration
    abstract;

var() byte Team;
var() Material RedTeamShader;
var() Material BlueTeamShader;
var GameReplicationInfo GRI;

simulated function UpdatePrecacheMaterials()
{
    super(Actor).UpdatePrecacheMaterials();
}

simulated function UpdateForTeam()
{
    // End:0x1e
    if(Team == 0)
    {
        Skins[2] = RedTeamShader;
    }
    // End:0x2c
    else
    {
        Skins[2] = BlueTeamShader;
    }
}

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
    DrawType=8
    bStatic=true
    bNoDelete=true
    bStasis=true
    bWorldGeometry=true
    RemoteRole=0
    DrawScale=2.50
    CollisionRadius=48.0
    CollisionHeight=30.0
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bProjTarget=true
    bBlockKarma=true
    bNetNotify=true
}