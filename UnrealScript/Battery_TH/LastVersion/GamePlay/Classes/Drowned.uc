class Drowned extends DamageType
    abstract;

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
    return default.PawnDamageEffect;
    //return;    
}

defaultproperties
{
    DeathString="%o ?? ???????"
    FemaleSuicide="%o ?? ???????"
    MaleSuicide="%o ?? ???????"
    bArmorStops=false
    bLocationalHit=false
    bCausesBlood=false
    FlashFog=(X=312.5000000,Y=468.7500000,Z=468.7500000)
}