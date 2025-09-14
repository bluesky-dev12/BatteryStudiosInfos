/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\wTeamBanner.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:2
 *	Functions:5
 *
 *******************************************************************************/
class wTeamBanner extends Decoration;

var() byte Team;
var GameReplicationInfo GRI;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
}

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

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    local DominationPoint DPoint;

    DPoint = DominationPoint(Other);
    // End:0x80
    if(DPoint != none)
    {
        // End:0x3a
        if(!DPoint.bControllable)
        {
            Team = 254;
        }
        // End:0x7a
        else
        {
            // End:0x5b
            if(DPoint.ControllingTeam == none)
            {
                Team = byte(255);
            }
            // End:0x7a
            else
            {
                Team = byte(DPoint.ControllingTeam.TeamIndex);
            }
        }
        UpdateForTeam();
    }
}

defaultproperties
{
    bStatic=true
    bNoDelete=true
    bStasis=true
    RemoteRole=0
    Tag='
    DrawScale=1.70
    bUnlit=true
    CollisionRadius=48.0
    CollisionHeight=90.0
    bCollideActors=true
    bCollideWorld=true
    bNetNotify=true
}