class VampireGameRules extends GameRules
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

var() float ConversionRatio;

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
    // End:0x3E
    if(NextGameRules != none)
    {
        return NextGameRules.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0x143
    if((((((instigatedBy != injured) && instigatedBy != none) && instigatedBy.Health > 0) && instigatedBy.PlayerReplicationInfo != none) && injured.PlayerReplicationInfo != none) && (instigatedBy.PlayerReplicationInfo.Team == none) || instigatedBy.PlayerReplicationInfo.Team != injured.PlayerReplicationInfo.Team)
    {
        instigatedBy.Health = Min(int(float(instigatedBy.Health) + (float(Damage) * ConversionRatio)), Max(instigatedBy.Health, int(instigatedBy.HealthMax)));
    }
    return Damage;
    //return;    
}

function GetServerDetails(out ServerResponseLine ServerState)
{
    local int i;

    i = ServerState.ServerInfo.Length;
    ServerState.ServerInfo.Length = i + 1;
    ServerState.ServerInfo[i].key = "Mutator";
    ServerState.ServerInfo[i].Value = GetHumanReadableName();
    //return;    
}

defaultproperties
{
    ConversionRatio=0.5000000
}