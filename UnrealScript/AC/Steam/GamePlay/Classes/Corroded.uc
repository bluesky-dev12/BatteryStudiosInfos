/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Corroded.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class Corroded extends DamageType
    abstract;

static function class<Effects> GetPawnDamageEffect(Vector HitLocation, float Damage, Vector Momentum, Pawn Victim, bool bLowDetail)
{
    return default.PawnDamageEffect;
}

defaultproperties
{
    DeathString="%o ?? %k ?? ?? ??? ???????"
    FemaleSuicide="%o ?? ??? ??? ???????"
    MaleSuicide="%o ?? ??? ??? ???????"
    bLocationalHit=true
    FlashFog=(X=450.0,Y=700.0,Z=230.0)
}