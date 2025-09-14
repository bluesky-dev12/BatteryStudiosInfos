class Corroded extends DamageType
    abstract;

static function Class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
    return default.PawnDamageEffect;
    //return;    
}

defaultproperties
{
    DeathString="%o ?? %k ?? ?? ??? ???????"
    FemaleSuicide="%o ?? ??? ??? ???????"
    MaleSuicide="%o ?? ??? ??? ???????"
    bLocationalHit=false
    FlashFog=(X=450.0000000,Y=700.0000000,Z=230.0000000)
}