/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path UTClassic\Classes\UTClassicGameRules.uc
 * Package Imports:
 *	UTClassic
 *	Engine
 *	Core
 *
 * Stats:
 *	Functions:1
 *
 *******************************************************************************/
class UTClassicGameRules extends GameRules
    hidecategories(Movement,Collision,Lighting,LightColor,Karma,Force);

function int NetDamage(int OriginalDamage, int Damage, Pawn injured, Pawn instigatedBy, Vector HitLocation, out Vector Momentum, class<DamageType> DamageType)
{
    Damage = int(float(Damage) * 1.20);
    // End:0x54
    if(NextGameRules != none)
    {
        return NextGameRules.NetDamage(OriginalDamage, Damage, injured, instigatedBy, HitLocation, Momentum, DamageType);
    }
    return Damage;
}
