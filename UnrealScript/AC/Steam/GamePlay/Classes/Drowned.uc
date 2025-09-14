/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Drowned.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Drowned extends DamageType
    abstract;

static function class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
    return default.PawnDamageEffect;
}

defaultproperties
{
    DeathString="%o ?? ???????"
    FemaleSuicide="%o ?? ???????"
    MaleSuicide="%o ?? ???????"
    bArmorStops=true
    bLocationalHit=true
    bCausesBlood=true
    FlashFog=(X=312.50,Y=468.750,Z=468.750)
}