/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\VampireGameRules.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Properties:1
 *	Functions:2
 *
 *******************************************************************************/
class VampireGameRules extends GameRules
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() float ConversionRatio;

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType)
{
    // End:0x3e
    if(NextGameRules != none)
    {
        return NextGameRules.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0x143
    if(instigatedBy != injured && instigatedBy != none && instigatedBy.Health > 0 && instigatedBy.PlayerReplicationInfo != none && injured.PlayerReplicationInfo != none && instigatedBy.PlayerReplicationInfo.Team == none || instigatedBy.PlayerReplicationInfo.Team != injured.PlayerReplicationInfo.Team)
    {
        instigatedBy.Health = Min(int(float(instigatedBy.Health) + float(Damage) * ConversionRatio), Max(instigatedBy.Health, int(instigatedBy.HealthMax)));
    }
    return Damage;
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    local int i;

    i = ServerState.ServerInfo.Length;
    ServerState.ServerInfo.Length = i + 1;
    ServerState.ServerInfo[i].key = "Mutator";
    ServerState.ServerInfo[i].Value = GetHumanReadableName();
}

defaultproperties
{
    ConversionRatio=0.50
}