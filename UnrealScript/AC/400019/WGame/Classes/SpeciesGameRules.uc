class SpeciesGameRules extends GameRules
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, Class<DamageType> DamageType)
{
    // End:0x3E
    if(NextGameRules != none)
    {
        return NextGameRules.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0x8F
    if(wPawn(injured) != none)
    {
        Damage = wPawn(injured).Species.static.ModifyReceivedDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0xF1
    if((instigatedBy != injured) && wPawn(instigatedBy) != none)
    {
        Damage = wPawn(instigatedBy).Species.static.ModifyImpartedDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    return Damage;
    //return;    
}
