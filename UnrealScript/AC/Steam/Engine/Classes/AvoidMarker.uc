/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\AvoidMarker.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:3
 *
 *******************************************************************************/
class AvoidMarker extends Triggers
    native
    notplaceable;

var byte TeamNum;

function Touch(Actor Other)
{
    // End:0x43
    if(Pawn(Other) != none && RelevantTo(Pawn(Other)))
    {
        Pawn(Other).Controller.FearThisSpot(self);
    }
}

function bool RelevantTo(Pawn P)
{
    return AIController(P.Controller) != none && P.Controller.PlayerReplicationInfo == none || P.Controller.PlayerReplicationInfo.Team == none || P.Controller.PlayerReplicationInfo.Team.TeamIndex != TeamNum;
}

function StartleBots()
{
    local Pawn P;

    // End:0x254
    foreach CollidingActors(class'Pawn', P, CollisionRadius)
    {
        P.Controller
        // End:0x00
        if(Startle(self))
        	goto J0x00;                
    }
    return;
}

defaultproperties
{
    TeamNum=255
    CollisionRadius=100.0
}