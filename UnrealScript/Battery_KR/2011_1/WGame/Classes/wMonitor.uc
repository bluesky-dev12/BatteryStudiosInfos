class wMonitor extends Decoration
    abstract;

var() byte Team;
var() Material RedTeamShader;
var() Material BlueTeamShader;
var GameReplicationInfo GRI;

simulated function UpdatePrecacheMaterials()
{
    super(Actor).UpdatePrecacheMaterials();
    //return;    
}

simulated function UpdateForTeam()
{
    // End:0x1E
    if(int(Team) == 0)
    {
        Skins[2] = RedTeamShader;        
    }
    else
    {
        Skins[2] = BlueTeamShader;
    }
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

defaultproperties
{
    DrawType=8
    bStatic=false
    bNoDelete=true
    bStasis=false
    bWorldGeometry=true
    RemoteRole=0
    DrawScale=2.5000000
    CollisionRadius=48.0000000
    CollisionHeight=30.0000000
    bCollideActors=true
    bCollideWorld=true
    bBlockActors=true
    bProjTarget=true
    bBlockKarma=true
    bNetNotify=true
}