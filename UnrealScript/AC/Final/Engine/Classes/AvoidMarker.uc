class AvoidMarker extends Triggers
    native
    notplaceable;

var byte TeamNum;

function Touch(Actor Other)
{
    // End:0x43
    if((Pawn(Other) != none) && RelevantTo(Pawn(Other)))
    {
        Pawn(Other).Controller.FearThisSpot(self);
    }
    //return;    
}

function bool RelevantTo(Pawn P)
{
    return (AIController(P.Controller) != none) && ((P.Controller.PlayerReplicationInfo == none) || P.Controller.PlayerReplicationInfo.Team == none) || P.Controller.PlayerReplicationInfo.Team.TeamIndex != int(TeamNum);
    //return;    
}

function StartleBots()
{
    local Pawn P;

    // End:0x42
    foreach CollidingActors(Class'Engine_Decompressed.Pawn', P, CollisionRadius)
    {
        // End:0x41
        if(RelevantTo(P))
        {
            AIController(P.Controller).Startle(self);
        }        
    }    
    //return;    
}

defaultproperties
{
    TeamNum=255
    CollisionRadius=100.0000000
}