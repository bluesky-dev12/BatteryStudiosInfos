/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\GameRules.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:14
 *
 *******************************************************************************/
class GameRules extends Info
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force)
    notplaceable;

var GameRules NextGameRules;

function AddGameRules(GameRules GR)
{
    // End:0x19
    if(NextGameRules == none)
    {
        NextGameRules = GR;
    }
    // End:0x2d
    else
    {
        NextGameRules.AddGameRules(GR);
    }
}

function NavigationPoint FindPlayerStart(Controller Player, optional byte inTeam, optional string incomingName)
{
    // End:0x2a
    if(NextGameRules != none)
    {
        return NextGameRules.FindPlayerStart(Player, inTeam, incomingName);
    }
    return none;
}

function string GetRules()
{
    local string ResultSet;

    // End:0x27
    if(NextGameRules == none)
    {
        ResultSet = ResultSet $ NextGameRules.GetRules();
    }
    return ResultSet;
}

function GetServerDetails(out ServerResponseLine ServerState);
function bool HandleRestartGame()
{
    // End:0x21
    if(NextGameRules != none && NextGameRules.HandleRestartGame())
    {
        return true;
    }
    return false;
}

function bool CheckEndGame(PlayerReplicationInfo Winner, string Reason)
{
    // End:0x25
    if(NextGameRules != none)
    {
        return NextGameRules.CheckEndGame(Winner, Reason);
    }
    return true;
}

function bool CheckScore(PlayerReplicationInfo Scorer)
{
    // End:0x20
    if(NextGameRules != none)
    {
        return NextGameRules.CheckScore(Scorer);
    }
    return false;
}

function bool OverridePickupQuery(Pawn Other, Pickup Item, out byte bAllowPickup)
{
    // End:0x30
    if(NextGameRules != none && NextGameRules.OverridePickupQuery(Other, Item, bAllowPickup))
    {
        return true;
    }
    return false;
}

function bool PreventDeath(Pawn Killed, Controller Killer, class<DamageType> DamageType, Vector HitLocation)
{
    // End:0x35
    if(NextGameRules != none && NextGameRules.PreventDeath(Killed, Killer, DamageType, HitLocation))
    {
        return true;
    }
    return false;
}

function bool PreventSever(Pawn Killed, name BoneName, int Damage, class<DamageType> DamageType)
{
    // End:0x35
    if(NextGameRules != none && NextGameRules.PreventSever(Killed, BoneName, Damage, DamageType))
    {
        return true;
    }
    return false;
}

function ScoreObjective(PlayerReplicationInfo Scorer, int Score)
{
    // End:0x24
    if(NextGameRules != none)
    {
        NextGameRules.ScoreObjective(Scorer, Score);
    }
}

function ScoreKill(Controller Killer, Controller Killed)
{
    // End:0x24
    if(NextGameRules != none)
    {
        NextGameRules.ScoreKill(Killer, Killed);
    }
}

function bool CriticalPlayer(Controller Other)
{
    // End:0x26
    if(NextGameRules != none && NextGameRules.CriticalPlayer(Other))
    {
        return true;
    }
    return false;
}

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType)
{
    // End:0x3e
    if(NextGameRules != none)
    {
        return NextGameRules.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    return Damage;
}
