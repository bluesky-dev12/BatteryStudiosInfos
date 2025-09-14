/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UnrealGame\Classes\DominationPoint.uc
 * Package Imports:
 *	UnrealGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:4
 *	Functions:2
 *
 *******************************************************************************/
class DominationPoint extends GameObjective
    hidecategories(Lighting,LightColor,Karma,Force);

var byte PrimaryTeam;
var bool bControllable;
var TeamInfo ControllingTeam;
var Pawn ControllingPawn;

replication
{
    // Pos:0x00
    reliable if(Role == 4)
        bControllable, ControllingTeam;

}

function bool CheckPrimaryTeam(byte TeamNum)
{
    return TeamNum == PrimaryTeam;
}

function bool TellBotHowToDisable(Bot B)
{
    // End:0x56
    if(bControllable || VSize(B.Pawn.Location - Location) > float(400))
    {
        return B.Squad.FindPathToObjective(B, self);
    }
    // End:0x6c
    if(B.Enemy != none)
    {
        return false;
    }
    B.WanderOrCamp(true);
    return true;
}

defaultproperties
{
    NetUpdateFrequency=40.0
}