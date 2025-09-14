class Vignette extends Actor
    abstract
    transient
    native
    notplaceable;

var() string MapName;
var() Class<GameInfo> GameClass;

simulated event Init()
{
    //return;    
}

simulated event DrawVignette(Canvas C, float Progress)
{
    //return;    
}

defaultproperties
{
    DrawType=0
    bNetTemporary=true
    RemoteRole=0
    bUnlit=true
    bGameRelevant=true
    CollisionRadius=0.0000000
    CollisionHeight=0.0000000
}