/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path WGame\Classes\SpeciesGameRules.uc
 * Package Imports:
 *	WGame
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class SpeciesGameRules extends GameRules
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType)
{
    // End:0x3e
    if(NextGameRules != none)
    {
        return NextGameRules.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0x8f
    if(wPawn(injured) != none)
    {
        Damage = wPawn(injured).Species.static.ModifyReceivedDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    // End:0xf1
    if(instigatedBy != injured && wPawn(instigatedBy) != none)
    {
        Damage = wPawn(instigatedBy).Species.static.ModifyImpartedDamage(Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    return Damage;
}
