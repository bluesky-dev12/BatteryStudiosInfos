class UTClassicGameRules extends GameRules
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
    Damage = int(float(Damage) * 1.2000000);
    // End:0x54
    if(NextGameRules != none)
    {
        return NextGameRules.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    return Damage;
    //return;    
}
