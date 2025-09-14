/*******************************************************************************
 * Decompiled by UE Explorer, an application developed by Eliot van Uytfanghe!
 * Path Engine\Classes\Crushed.uc
 * Package Imports:
 *	Engine
 *	Core
 *
 * 
 *******************************************************************************/
class Crushed extends DamageType
    abstract
    notplaceable;

defaultproperties
{
    DeathString="%o was crushed by %k."
    FemaleSuicide="%o was crushed."
    MaleSuicide="%o was crushed."
    bArmorStops=true
    bAlwaysGibs=true
    bLocationalHit=true
    GibPerterbation=1.0
}