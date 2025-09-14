/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path GamePlay\Classes\Depressurized.uc
 * Package Imports:
 *	Gameplay
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class Depressurized extends DamageType
    abstract;

defaultproperties
{
    DeathString="%o ?? %k ?? ?? ???? ???????"
    FemaleSuicide="%o ?? ???? ???????"
    MaleSuicide="%o ?? ???? ???????"
    bArmorStops=true
    bAlwaysGibs=true
    bLocationalHit=true
    GibPerterbation=1.0
}