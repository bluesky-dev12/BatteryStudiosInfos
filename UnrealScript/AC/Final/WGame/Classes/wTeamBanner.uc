class wTeamBanner extends Decoration;

var() byte Team;
var GameReplicationInfo GRI;

simulated function PostBeginPlay()
{
    super(Actor).PostBeginPlay();
    //return;    
}

simulated function UpdateForTeam()
{
    //return;    
}

simulated function SetGRI(GameReplicationInfo NewGRI)
{
    GRI = NewGRI;
    UpdateForTeam();
    //return;    
}

simulated function PostNetBeginPlay()
{
    super(Actor).PostNetBeginPlay();
    // End:0x37
    if(Level.Game != none)
    {
        SetGRI(Level.Game.GameReplicationInfo);
    }
    //return;    
}

simulated function Trigger(Actor Other, Pawn EventInstigator)
{
    local DominationPoint DPoint;

    DPoint = DominationPoint(Other);
    // End:0x80
    if(DPoint != none)
    {
        // End:0x3A
        if(!DPoint.bControllable)
        {
            Team = 254;            
        }
        else
        {
            // End:0x5B
            if(DPoint.ControllingTeam == none)
            {
                Team = byte(255);                
            }
            else
            {
                Team = byte(DPoint.ControllingTeam.TeamIndex);
            }
        }
        UpdateForTeam();
    }
    //return;    
}

defaultproperties
{
    bStatic=false
    bNoDelete=true
    bStasis=false
    RemoteRole=0
    Tag="'"
    DrawScale=1.7000000
    bUnlit=true
    CollisionRadius=48.0000000
    CollisionHeight=90.0000000
    bCollideActors=true
    bCollideWorld=true
    bNetNotify=true
}