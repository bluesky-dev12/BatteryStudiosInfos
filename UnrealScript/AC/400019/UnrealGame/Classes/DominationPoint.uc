class DominationPoint extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var byte PrimaryTeam;
var bool bControllable;
var TeamInfo ControllingTeam;
var Pawn ControllingPawn;

replication
{
    // Pos:0x000
    reliable if(int(Role) == int(ROLE_Authority))
        ControllingTeam, bControllable;
}

function bool CheckPrimaryTeam(byte TeamNum)
{
    return int(TeamNum) == int(PrimaryTeam);
    //return;    
}

function bool TellBotHowToDisable(Bot B)
{
    // End:0x56
    if(bControllable || VSize(B.Pawn.Location - Location) > float(400))
    {
        return B.Squad.FindPathToObjective(B, self);
    }
    // End:0x6C
    if(B.Enemy != none)
    {
        return false;
    }
    B.WanderOrCamp(true);
    return true;
    //return;    
}

defaultproperties
{
    NetUpdateFrequency=40.0000000
}